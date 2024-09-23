@implementation EKObjectID

- (NSString)entityName
{
  return (NSString *)CalEntityTypeGetName();
}

+ (id)temporaryObjectIDWithEntityType:(int)a3
{
  uint64_t v3;

  do
    v3 = __ldxr((unsigned int *)&temporaryObjectIDWithEntityType__sNextTempID);
  while (__stxr(v3 + 1, (unsigned int *)&temporaryObjectIDWithEntityType__sNextTempID));
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEntityType:rowID:databaseID:temporary:", *(_QWORD *)&a3, v3, 0, 1);
}

- (BOOL)isEqual:(id)a3
{
  EKObjectID *v4;
  EKObjectID *v5;
  objc_class *Class;
  BOOL v7;
  EKObjectID *v8;

  v4 = (EKObjectID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (Class = object_getClass(self), Class == object_getClass(v5)))
  {
    v8 = v5;
    v7 = self->_entityType == v8->_entityType
      && self->_rowID == v8->_rowID
      && self->_temporary == v8->_temporary
      && self->_databaseID == v8->_databaseID;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)CADObjectIDWithGeneration:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  unsigned int rowID;

  v3 = *(_QWORD *)&a3;
  if (-[EKObjectID isVirtual](self, "isVirtual"))
  {
    v5 = 0x7FFFFFFFLL;
  }
  else
  {
    rowID = self->_rowID;
    if (self->_temporary)
      v5 = -rowID;
    else
      v5 = rowID;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A098]), "initWithEntityType:entityID:databaseID:generation:", self->_entityType, v5, self->_databaseID, v3);
}

- (BOOL)isVirtual
{
  return self->_rowID == 0x7FFFFFFF;
}

- (unint64_t)hash
{
  return ((self->_temporary << 31) | ((self->_entityType & 0x7F) << 24) | self->_rowID & 0xFFFFFF) ^ (1327217884 * self->_databaseID);
}

- (int64_t)entityType
{
  return self->_entityType;
}

+ (EKObjectID)objectIDWithCADObjectID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
    return (EKObjectID *)0;
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v4, "entityType");
  v7 = objc_msgSend(v4, "entityID");
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = -v7;
  v9 = objc_msgSend(v4, "databaseID");
  v10 = objc_msgSend(v4, "isTemporary");

  return (EKObjectID *)(id)objc_msgSend(v5, "initWithEntityType:rowID:databaseID:temporary:", v6, v8, v9, v10);
}

- (EKObjectID)initWithEntityType:(int)a3 rowID:(int)a4 databaseID:(int)a5 temporary:(BOOL)a6
{
  EKObjectID *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKObjectID;
  result = -[EKObjectID init](&v11, sel_init);
  if (result)
  {
    result->_entityType = a3;
    result->_rowID = a4;
    result->_databaseID = a5;
    result->_temporary = a6;
  }
  return result;
}

- (BOOL)isTemporary
{
  return self->_temporary;
}

+ (EKObjectID)objectIDWithEntityType:(int)a3 rowID:(int)a4 databaseID:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  v8 = objc_alloc((Class)a1);
  if (a4 >= 0)
    v9 = a4;
  else
    v9 = -a4;
  return (EKObjectID *)(id)objc_msgSend(v8, "initWithEntityType:rowID:databaseID:temporary:", v7, v9, v5, a4 >> 31);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (EKObjectID)objectIDWithEntityType:(int)a3 rowID:(int)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;

  v5 = *(_QWORD *)&a3;
  v6 = objc_alloc((Class)a1);
  if (a4 >= 0)
    v7 = a4;
  else
    v7 = -a4;
  return (EKObjectID *)(id)objc_msgSend(v6, "initWithEntityType:rowID:databaseID:temporary:", v5, v7, 0, a4 >> 31);
}

+ (id)virtualObjectIDWithEntityType:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v4, "initWithEntityType:rowID:databaseID:temporary:", v3, 0x7FFFFFFFLL, *MEMORY[0x1E0D0BE78], 0);
}

+ (EKObjectID)objectIDWithURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v39;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("x-apple-eventkit"));

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_msgSend(v7, "intValue");
      if ((_DWORD)v8)
      {
LABEL_7:
        objc_msgSend(v4, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          v12 = objc_msgSend(v11, "characterAtIndex:", 0);
          if ((v12 | 4) != 0x74)
          {
            v13 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              +[EKObjectID objectIDWithURL:].cold.4(v12, v13);
          }
          objc_msgSend(v11, "substringFromIndex:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "intValue");

          objc_msgSend(v10, "pathComponents");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v16, "count") > 1)
          {
            objc_msgSend(v16, "objectAtIndex:", 1);
            v35 = objc_claimAutoreleasedReturnValue();
            if (objectIDWithURL__onceToken != -1)
              dispatch_once(&objectIDWithURL__onceToken, &__block_literal_global_71);
            v39 = (void *)v35;
            objc_msgSend((id)objectIDWithURL__entityNameToEntityTypeMap, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntityType:rowID:databaseID:temporary:", objc_msgSend(v36, "intValue"), v15, v8, v12 == 116);
            }
            else
            {
              v37 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                +[EKObjectID objectIDWithURL:].cold.3((uint64_t)v39, v37, v4);
              v25 = 0;
            }

          }
          else
          {
            v17 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              +[EKObjectID objectIDWithURL:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
            v25 = 0;
          }

        }
        else
        {
          v27 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            +[EKObjectID objectIDWithURL:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
          v25 = 0;
        }

        goto LABEL_31;
      }
      v9 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        +[EKObjectID objectIDWithURL:].cold.5((uint64_t)v4, v9, v7);
    }
    v8 = 0;
    goto LABEL_7;
  }
  v26 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    +[EKObjectID objectIDWithURL:].cold.6(v26, v4);
  v25 = 0;
LABEL_31:

  return (EKObjectID *)v25;
}

void __30__EKObjectID_objectIDWithURL___block_invoke()
{
  void *v0;

  v0 = (void *)objectIDWithURL__entityNameToEntityTypeMap;
  objectIDWithURL__entityNameToEntityTypeMap = (uint64_t)&unk_1E47B5CE0;

}

- (EKObjectID)initWithCoder:(id)a3
{
  id v4;
  EKObjectID *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EKObjectID;
  v5 = -[EKObjectID init](&v7, sel_init);
  if (v5)
  {
    v5->_entityType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("entityType"));
    v5->_rowID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("rowID"));
    v5->_databaseID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dbID"));
    v5->_temporary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("temporary"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t databaseID;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", self->_entityType, CFSTR("entityType"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_rowID, CFSTR("rowID"));
  databaseID = self->_databaseID;
  if ((_DWORD)databaseID)
    objc_msgSend(v5, "encodeInt:forKey:", databaseID, CFSTR("dbID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_temporary, CFSTR("temporary"));

}

- (EKObjectID)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  EKObjectID *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKObjectID;
  v5 = -[EKObjectID init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("entityType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_entityType = objc_msgSend(v6, "intValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("rowID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rowID = objc_msgSend(v7, "intValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("dbID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_databaseID = objc_msgSend(v8, "intValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("temporary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_temporary = objc_msgSend(v9, "BOOLValue");

  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rowID);
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

  return (NSDictionary *)v7;
}

- (int)rowID
{
  return self->_rowID;
}

- (CADObjectID)CADObjectID
{
  return (CADObjectID *)-[EKObjectID CADObjectIDWithGeneration:](self, "CADObjectIDWithGeneration:", 0xFFFFFFFFLL);
}

- (NSString)stringRepresentation
{
  uint64_t databaseID;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t rowID;
  void *v9;
  uint64_t v11;

  databaseID = self->_databaseID;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[EKObjectID entityName](self, "entityName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("t");
  if (!self->_temporary)
    v7 = CFSTR("p");
  rowID = self->_rowID;
  if ((_DWORD)databaseID)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%d/%@/%@%d"), CFSTR("x-apple-eventkit"), databaseID, v5, v7, rowID);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:///%@/%@%d"), CFSTR("x-apple-eventkit"), v5, v7, rowID, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSURL)URIRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[EKObjectID stringRepresentation](self, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (id)CADObjectIDsFromEKObjectIDs:(id)a3 withGeneration:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "CADObjectIDWithGeneration:", v4, (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)EKObjectIDsFromCADObjectIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)EKObjectIDsFromData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[EKObjectID EKObjectIDsFromData:databaseID:](EKObjectID, "EKObjectIDsFromData:databaseID:", v11, objc_msgSend(v10, "intValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          if (v7)
          {
            if (!v6)
            {
              v6 = (id)objc_msgSend(v7, "mutableCopy");

              v7 = v6;
            }
            objc_msgSend(v6, "addObjectsFromArray:", v12);
          }
          else
          {
            v7 = v12;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v7;
}

+ (id)EKObjectIDsFromData:(id)a3 databaseID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(a1, "EKObjectIDsFromData:range:databaseID:", v6, 0, (unint64_t)objc_msgSend(v6, "length") >> 3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)EKObjectIDsFromData:(id)a3 range:(_NSRange)a4 databaseID:(int)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int *v12;
  void *v13;

  v5 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  v8 = a3;
  if (8 * (location + length) <= objc_msgSend(v8, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", length);
    v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (location < location + length)
    {
      v12 = (unsigned int *)(v11 + 8 * location + 4);
      do
      {
        +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", *(v12 - 1), *v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);

        v12 += 2;
        --length;
      }
      while (length);
    }
  }
  else
  {
    v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKObjectID EKObjectIDsFromData:range:databaseID:].cold.1(v9, v8);
    v10 = 0;
  }

  return v10;
}

- (int)databaseID
{
  return self->_databaseID;
}

+ (void)objectIDWithURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "EKObjectID URL has no path", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)objectIDWithURL:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "EKObjectID URL has no entity name", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)objectIDWithURL:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a2;
  objc_msgSend(a3, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v5, v6, "Unknown entity name %@ with URI %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)objectIDWithURL:(int)a1 .cold.4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "URL with unrecognized ID type %c", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

+ (void)objectIDWithURL:(void *)a3 .cold.5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  objc_msgSend(a3, "length");
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v5, v6, "Redundant specification of database ID 0 (URL %@ has host length %lu)", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)objectIDWithURL:(void *)a1 .cold.6(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = CFSTR("x-apple-eventkit");
  _os_log_error_impl(&dword_1A2318000, v3, OS_LOG_TYPE_ERROR, "Wrong scheme for EKObjectID URL; got %@, expected %@; will return nil for objectIDWithURL:",
    (uint8_t *)&v5,
    0x16u);

}

+ (void)EKObjectIDsFromData:(void *)a1 range:(void *)a2 databaseID:.cold.1(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Invalid range passed to +[EKObjectIDsFromData:range:]. Need at least %lu bytes, but only have %lu", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_1_1();
}

@end
