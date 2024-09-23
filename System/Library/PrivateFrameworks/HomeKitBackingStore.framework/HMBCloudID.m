@implementation HMBCloudID

- (HMBCloudID)initWithContainerID:(id)a3 scope:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HMBCloudID *v19;
  void *v21;
  int64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[5];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "environment");
  CKContainerEnvironmentString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a4;
  CKDatabaseScopeString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v6, v8, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v29[1] = v7;
  v29[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "dataUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendData:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("759390E3-198F-48EB-AD00-31296DACBBA6"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_UUIDWithNamespace:data:", v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMBCloudID initWithContainerID:scope:name:modelID:](self, "initWithContainerID:scope:name:modelID:", v5, v23, v21, v18);

  return v19;
}

- (HMBCloudID)initWithContainerID:(id)a3 scope:(int64_t)a4 name:(id)a5 modelID:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMBCloudID *v14;
  HMBCloudID *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMBCloudID;
  v14 = -[HMBCloudID init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_containerID, a3);
    v15->_scope = a4;
    objc_storeStrong((id *)&v15->_name, a5);
    objc_storeStrong((id *)&v15->_modelID, a6);
  }

  return v15;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudID name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Name"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudID modelID](self, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Model ID"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMBCloudID containerID](self, "containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMBCID.c"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMBCloudID scope](self, "scope"), CFSTR("HMBCID.s"));
  -[HMBCloudID name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMBCID.n"));

  -[HMBCloudID modelID](self, "modelID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMBCID.m"));

}

- (HMBCloudID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  HMBCloudID *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBCID.c"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMBCID.s"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBCID.n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBCID.m"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = -[HMBCloudID initWithContainerID:scope:name:modelID:](self, "initWithContainerID:scope:name:modelID:", v5, v6, v7, v8);
    v11 = self;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMBCloudID modelID](self, "modelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMBCloudID modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (int64_t)scope
{
  return self->_scope;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)modelID
{
  return self->_modelID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, a3, a5);
}

@end
