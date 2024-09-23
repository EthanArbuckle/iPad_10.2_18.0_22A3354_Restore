@implementation HKDeletedObject

+ (id)_deletedObjectWithUUID:(id)a3 metadata:(id)a4
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)a1), "_init");
  objc_storeStrong((id *)(v10 + 8), a3);
  v11 = objc_msgSend(v9, "copy");
  v12 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v11;

  if (v9)
  {
    v22 = 0;
    v13 = objc_msgSend(v9, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", 0, HKApplicationSDKVersionToken(), &v22);
    v14 = v22;
    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKDeletedObject.m"), 34, CFSTR("Error: %@"), v14);

    }
    if (objc_msgSend(v9, "count") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKDeletedObject.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[metadata count] == 2"));

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HKMetadataKeySyncIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKDeletedObject.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata[HKMetadataKeySyncIdentifier] != nil"));

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HKMetadataKeySyncVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKDeletedObject.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata[HKMetadataKeySyncVersion] != nil"));

    }
  }

  return (id)v10;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKDeletedObject;
  return -[HKDeletedObject init](&v3, sel_init);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)_metadataWithSyncIdentifier:(id)a3 syncVersion:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_5:
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("HKMetadataKeySyncIdentifier"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("HKMetadataKeySyncVersion"));
        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKDeletedObject.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncIdentifier != nil"));

      if (v9)
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKDeletedObject.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncVersion != nil"));

    goto LABEL_5;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *UUID;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    UUID = self->_UUID;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](UUID, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  NSDictionary *metadata;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  metadata = self->_metadata;
  if (metadata && -[NSDictionary count](metadata, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), self->_metadata);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E37FD4C0;
  if (v4)
    v9 = v4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@%@>"), v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

}

- (HKDeletedObject)initWithCoder:(id)a3
{
  id v4;
  HKDeletedObject *v5;
  uint64_t v6;
  NSUUID *UUID;
  void *v8;
  uint64_t v9;
  NSDictionary *metadata;

  v4 = a3;
  v5 = -[HKDeletedObject _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Metadata"));
    v9 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v9;

  }
  return v5;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (int64_t)externalSyncObjectCode
{
  return self->_externalSyncObjectCode;
}

- (void)setExternalSyncObjectCode:(int64_t)a3
{
  self->_externalSyncObjectCode = a3;
}

@end
