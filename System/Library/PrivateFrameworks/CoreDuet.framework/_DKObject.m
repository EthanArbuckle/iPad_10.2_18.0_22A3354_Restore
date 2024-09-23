@implementation _DKObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localCreationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (_DKObject)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKObject;
  return -[_DKObject init](&v3, sel_init);
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localCreationDate, CFSTR("localCreationDate"));

}

- (_DKSource)source
{
  return (_DKSource *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)localCreationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
    goto LABEL_17;
  v6 = v4;
  -[_DKObject UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuid:", v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuidHash:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKObject creationDate](self, "creationDate");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v12;
  objc_msgSend(v6, "setCreationDate:", v15);

  objc_msgSend(v6, "setLocalCreationDate:", v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v6;
    objc_msgSend(v16, "streamName");
    v17 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v17, "isEqualToString:", CFSTR("/device/isPluggedIn")))
    {
      objc_msgSend(v16, "creationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      v20 = v19;
      objc_msgSend(v16, "endDate");
      v22 = v20 - v21;

      if (v22 < 0.0)
        v22 = -v22;

      if (v22 <= 3600.0)
        goto LABEL_13;
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[_DKObject(MOConversion) copyToManagedObject:].cold.1(v16, (uint64_t)v12, v17);
    }

LABEL_13:
  }
  -[_DKObject source](self, "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_DKObject source](self, "source");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSourceMOConverter insertSource:inManagedObjectContext:](_DKSourceMOConverter, "insertSource:inManagedObjectContext:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSource:", v26);

  }
LABEL_17:

  return isKindOfClass & 1;
}

- (_DKObject)initWithCoder:(id)a3
{
  id v4;
  _DKObject *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  _DKSource *source;
  uint64_t v10;
  NSDate *creationDate;
  uint64_t v12;
  NSDate *localCreationDate;
  _DKObject *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_DKObject;
  v5 = -[_DKObject init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v8 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (_DKSource *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localCreationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    localCreationDate = v5->_localCreationDate;
    v5->_localCreationDate = (NSDate *)v12;

    v14 = v5;
  }

  return v5;
}

- (id)toPBCodable
{
  return 0;
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[_DKPRValue type]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_DKPRValueType type]((uint64_t)v5);

    if (v6 > 2)
    {
      v7 = 0;
    }
    else
    {
      -[__objc2_class fromPBCodable:](*off_1E26E4F78[v6], "fromPBCodable:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;

  if (self->_creationDate || self->_localCreationDate)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_UUID, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { UUID=%@; source=%@; creationDate=%@, localCreationDate=%@ }"),
      v5,
      v6,
      self->_source,
      self->_creationDate,
      self->_localCreationDate);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_UUID, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: { UUID=%@; source=%@; }"), v5, v6, self->_source, v11, v12);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)BOOLValue
{
  return -[_DKObject integerValue](self, "integerValue") != 0;
}

- (int64_t)integerValue
{
  double v2;

  -[_DKObject doubleValue](self, "doubleValue");
  return (uint64_t)v2;
}

- (double)doubleValue
{
  return 0.0;
}

- (id)stringValue
{
  void *v3;
  void *v4;

  if (-[_DKObject conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE0DC2F0))
  {
    -[_DKObject primaryValue](self, "primaryValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_DKObject description](self, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  _DKObject *v5;
  _DKObject *v6;
  _DKObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v5 = (_DKObject *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[_DKObject source](self, "source");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKObject source](v7, "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 != v9)
        {
          -[_DKObject source](self, "source");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKObject source](v7, "source");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
LABEL_14:

LABEL_15:
            goto LABEL_16;
          }
          v17 = v10;
        }
        -[_DKObject UUID](self, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKObject UUID](v7, "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 == v13)
        {
          v11 = 1;
        }
        else
        {
          -[_DKObject UUID](self, "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKObject UUID](v7, "UUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v14, "isEqual:", v15);

        }
        v10 = v17;
        if (v8 == v9)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

+ (id)entityName
{
  return CFSTR("Object");
}

- (id)entityName
{
  return (id)objc_msgSend((id)objc_opt_class(), "entityName");
}

- (int64_t)typeCode
{
  return 0;
}

+ (id)fetchObjectWithUUID:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55___DKObject_MOConversion__fetchObjectWithUUID_context___block_invoke;
  v11[3] = &unk_1E26E47A8;
  v7 = v6;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performWithOptions:andBlock:", 4, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[6];

  v25 = a4;
  v32[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = a5;
  v9 = a6;
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(v8, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v19, "entityName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v13, "isEqualToString:", v20);

        if (v21)
        {
          objc_msgSend(v19, "objectFromManagedObject:readMetadata:excludedMetadataKeys:cache:", v11, v25, v26, v9);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            goto LABEL_12;
          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v16)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (BOOL)copyBaseObjectInfoFromManagedObject:(id)a3 cache:(id)a4
{
  id v5;
  char isKindOfClass;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v5;
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);
    -[_DKObject setUUID:](self, "setUUID:", v10);

    objc_msgSend(v7, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "source");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSourceMOConverter sourceFromManagedObject:](_DKSourceMOConverter, "sourceFromManagedObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKObject setSource:](self, "setSource:", v13);

    }
    objc_msgSend(v7, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKObject setCreationDate:](self, "setCreationDate:", v14);

    objc_msgSend(v7, "localCreationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKObject setLocalCreationDate:](self, "setLocalCreationDate:", v15);

  }
  return isKindOfClass & 1;
}

@end
