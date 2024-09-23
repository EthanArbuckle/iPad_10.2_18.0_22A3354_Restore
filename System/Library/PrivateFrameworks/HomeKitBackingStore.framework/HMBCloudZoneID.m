@implementation HMBCloudZoneID

- (HMBCloudZoneID)initWithContainerID:(id)a3 scope:(int64_t)a4 zoneID:(id)a5 name:(id)a6 modelID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMBCloudZoneID *v17;
  uint64_t v18;
  CKRecordZoneID *zoneID;
  uint64_t v20;
  NSData *token;
  HMBCloudZoneID *v23;
  SEL v24;
  id v25;
  int64_t v26;
  id v27;
  objc_super v28;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!a4)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v14)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_13:
    v23 = (HMBCloudZoneID *)_HMFPreconditionFailure();
    return -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v23, v24, v25, v26, v27);
  }
  v28.receiver = self;
  v28.super_class = (Class)HMBCloudZoneID;
  v17 = -[HMBCloudID initWithContainerID:scope:name:modelID:](&v28, sel_initWithContainerID_scope_name_modelID_, v12, a4, v14, v15);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    zoneID = v17->_zoneID;
    v17->_zoneID = (CKRecordZoneID *)v18;

    objc_msgSend(v16, "data");
    v20 = objc_claimAutoreleasedReturnValue();
    token = v17->_token;
    v17->_token = (NSData *)v20;

  }
  return v17;
}

- (HMBCloudZoneID)initWithContainerID:(id)a3 scope:(int64_t)a4 zoneID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  HMBCloudZoneID *v39;
  __CFString *v41;
  void *v42;
  HMBCloudZoneID *v43;
  int64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _QWORD v50[6];

  v50[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
    _HMFPreconditionFailure();
  v10 = v9;
  objc_msgSend(v9, "ownerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C94730];
  v13 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C94730]);

  if (a4 == 3)
  {
    if (!v13)
      goto LABEL_7;
    _HMFPreconditionFailure();
  }
  if ((v13 & 1) == 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0C95098]);
    objc_msgSend(v10, "zoneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithZoneName:ownerName:", v15, v12);

    v10 = (void *)v16;
  }
LABEL_7:
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "environment");
  CKContainerEnvironmentString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CKDatabaseScopeString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmbDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@.%@/%@"), v18, v19, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();

  v43 = self;
  v44 = a4;
  v42 = (void *)v22;
  if ((unint64_t)(a4 - 1) > 2)
    v41 = 0;
  else
    v41 = off_1E8932C28[a4 - 1];
  objc_msgSend(v10, "zoneName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ownerName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  v26 = v23;
  objc_msgSend(v25, "environment");
  CKContainerEnvironmentString();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v27;
  objc_msgSend(v25, "containerIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v28;
  v50[2] = v26;
  v50[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v31 = v29;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "dataUsingEncoding:", 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "appendData:", v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v33);
  }

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v41);
  objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_UUIDWithNamespace:data:", v37, v30);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:name:modelID:](v43, "initWithContainerID:scope:zoneID:name:modelID:", v25, v44, v10, v42, v38);
  return v39;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMBCloudZoneID;
  v4 = a3;
  -[HMBCloudID encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMBCloudZoneID zoneID](self, "zoneID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMBCZID.z"));

}

- (HMBCloudZoneID)initWithCoder:(id)a3
{
  id v4;
  HMBCloudID *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMBCloudZoneID *v12;

  v4 = a3;
  v5 = -[HMBCloudID initWithCoder:]([HMBCloudID alloc], "initWithCoder:", v4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBCZID.z"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    -[HMBCloudID containerID](v5, "containerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMBCloudID scope](v5, "scope");
    -[HMBCloudID name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudID modelID](v5, "modelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMBCloudZoneID initWithContainerID:scope:zoneID:name:modelID:](self, "initWithContainerID:scope:zoneID:name:modelID:", v8, v9, v6, v10, v11);

    v12 = self;
  }

  return v12;
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
    -[HMBCloudZoneID token](self, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "token");
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

  -[HMBCloudZoneID token](self, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSData)token
{
  return self->_token;
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_token, 0);
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
