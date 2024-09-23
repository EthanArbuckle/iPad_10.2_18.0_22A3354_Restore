@implementation CADObjectID

- (int)databaseID
{
  return self->_databaseID;
}

- (BOOL)isTemporary
{
  return self->_temporary;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t databaseID;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", self->_entityType, CFSTR("entityType"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_entityID, CFSTR("rowID"));
  databaseID = self->_databaseID;
  if ((_DWORD)databaseID)
    objc_msgSend(v5, "encodeInt:forKey:", databaseID, CFSTR("dbID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_temporary, CFSTR("temporary"));

}

- (BOOL)isEqual:(id)a3
{
  CADObjectID *v4;
  CADObjectID *v5;
  objc_class *Class;
  char v7;
  CADObjectID *v8;
  int entityType;
  int entityID;
  _BOOL4 temporary;
  int databaseID;

  v4 = (CADObjectID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4)
  {
    Class = object_getClass(self);
    if (Class == object_getClass(v5))
    {
      v8 = v5;
      entityType = self->_entityType;
      if (entityType == -[CADObjectID entityType](v8, "entityType")
        && (entityID = self->_entityID, entityID == -[CADObjectID entityID](v8, "entityID"))
        && (temporary = self->_temporary, temporary == -[CADObjectID isTemporary](v8, "isTemporary")))
      {
        databaseID = self->_databaseID;
        v7 = databaseID == -[CADObjectID databaseID](v8, "databaseID");
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = -[CADObjectID isEqual:](v5, "isEqual:", self);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)entityType
{
  return self->_entityType;
}

- (int)entityID
{
  return self->_entityID;
}

- (CADObjectID)initWithCoder:(id)a3
{
  id v4;
  CADObjectID *v5;
  int v6;
  CADObjectID *v7;
  NSObject *v8;
  int entityType;
  objc_super v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADObjectID;
  v5 = -[CADObjectID init](&v11, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("entityType"));
  v5->_entityType = v6;
  if (isValidEntityType(v6))
  {
    v5->_entityID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("rowID"));
    v5->_databaseID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dbID"));
    v5->_temporary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("temporary"));
LABEL_4:
    v7 = v5;
    goto LABEL_8;
  }
  v8 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    entityType = v5->_entityType;
    *(_DWORD *)buf = 67109120;
    v13 = entityType;
    _os_log_impl(&dword_1A5CCB000, v8, OS_LOG_TYPE_ERROR, "Unknown entity type (%i) in -[CADObjectID initWithCoder:]", buf, 8u);
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (CADObjectID)initWithEntityType:(int)a3 entityID:(int)a4 databaseID:(int)a5
{
  CADObjectID *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CADObjectID;
  v8 = -[CADObjectID init](&v10, sel_init);
  if (v8)
  {
    if (!isValidEntityType(a3))
      -[CADObjectID initWithEntityType:entityID:databaseID:].cold.1(a3);
    v8->_entityType = a3;
    v8->_entityID = a4;
    v8->_databaseID = a5;
    v8->_temporary = a4 < 0;
  }
  return v8;
}

- (unint64_t)hash
{
  int entityID;
  int v3;

  entityID = self->_entityID;
  if (entityID >= 0)
    v3 = self->_entityID;
  else
    v3 = -entityID;
  return ((self->_temporary << 31) | ((self->_entityType & 0x7F) << 24) | v3 & 0xFFFFFF) ^ (1327217884 * self->_databaseID);
}

- (BOOL)isVirtual
{
  return self->_entityID == 0x7FFFFFFF;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)stringRepresentation
{
  uint64_t databaseID;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t entityID;
  void *v9;
  uint64_t v11;

  databaseID = self->_databaseID;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[CADObjectID entityName](self, "entityName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("t");
  if (!self->_temporary)
    v7 = CFSTR("p");
  entityID = self->_entityID;
  if ((_DWORD)databaseID)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%d/%@/%@%d"), CFSTR("x-apple-eventkit"), databaseID, v5, v7, entityID);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:///%@/%@%d"), CFSTR("x-apple-eventkit"), v5, v7, entityID, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)entityName
{
  return (id)CalEntityTypeGetName(self->_entityType);
}

- (CADObjectID)initWithEntityType:(int)a3 entityID:(int)a4
{
  return -[CADObjectID initWithEntityType:entityID:databaseID:](self, "initWithEntityType:entityID:databaseID:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (CADObjectID)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  CADObjectID *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADObjectID;
  v5 = -[CADObjectID init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_entityType = objc_msgSend(v6, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rowID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_entityID = objc_msgSend(v7, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dbID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_databaseID = objc_msgSend(v8, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("temporary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_temporary = objc_msgSend(v9, "BOOLValue");

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("entityType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_entityType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("rowID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_entityID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("dbID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_databaseID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("temporary");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_temporary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)URIRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[CADObjectID stringRepresentation](self, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)initWithEntityType:(int)a1 entityID:databaseID:.cold.1(int a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_1A5CCB000, v2, OS_LOG_TYPE_ERROR, "Unknown entity type (%i) in -[CADObjectID initWithEntityType:entityID:databaseID:]", (uint8_t *)v3, 8u);
  }
  __assert_rtn("-[CADObjectID initWithEntityType:entityID:databaseID:]", "CADObjectID.m", 38, "0");
}

@end
