@implementation HMBCloudZoneRecordPushConflict

- (HMBCloudZoneRecordPushConflict)initWithRecordID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  HMBCloudZoneRecordPushConflict *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "hmbIsCloudKitError"))
    goto LABEL_18;
  if (objc_msgSend(v7, "code") == 11)
  {
    self = -[HMBCloudZoneRecordPushConflict initWithRecordID:clientRecord:serverRecord:ancestorRecord:](self, "initWithRecordID:clientRecord:serverRecord:ancestorRecord:", v6, 0, 0, 0);
    v8 = self;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "code") != 14)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(v7, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      objc_msgSend(v7, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0C949A8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      if (v20)
      {
        self = -[HMBCloudZoneRecordPushConflict initWithRecordID:clientRecord:serverRecord:ancestorRecord:](self, "initWithRecordID:clientRecord:serverRecord:ancestorRecord:", v6, v12, v16, v20);
        v8 = self;
      }
      else
      {
        v30 = (void *)MEMORY[0x1D17B6230]();
        self = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "userInfo");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v32;
          v36 = 2112;
          v37 = v33;
          _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@Server record changed error user info does not have ancestor record: %@", (uint8_t *)&v34, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
        v8 = 0;
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x1D17B6230]();
      self = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "userInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v28;
        v36 = 2112;
        v37 = v29;
        _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_ERROR, "%{public}@Server record changed error user info does not have server record: %@", (uint8_t *)&v34, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v8 = 0;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B6230]();
    self = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v24;
      v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_ERROR, "%{public}@Server record changed error user info does not have client record: %@", (uint8_t *)&v34, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v8 = 0;
  }

LABEL_19:
  return v8;
}

- (HMBCloudZoneRecordPushConflict)initWithRecordID:(id)a3 clientRecord:(id)a4 serverRecord:(id)a5 ancestorRecord:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMBCloudZoneRecordPushConflict *v16;
  HMBCloudZoneRecordPushConflict *v17;
  HMBCloudZoneRecordPushConflict *v19;
  SEL v20;
  id v21;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    v15 = v14;
    v22.receiver = self;
    v22.super_class = (Class)HMBCloudZoneRecordPushConflict;
    v16 = -[HMBCloudZoneRecordPushConflict init](&v22, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_recordID, a3);
      objc_storeStrong((id *)&v17->_clientRecord, a4);
      objc_storeStrong((id *)&v17->_serverRecord, a5);
      objc_storeStrong((id *)&v17->_ancestorRecord, a6);
    }

    return v17;
  }
  else
  {
    v19 = (HMBCloudZoneRecordPushConflict *)_HMFPreconditionFailure();
    return (HMBCloudZoneRecordPushConflict *)-[HMBCloudZoneRecordPushConflict isEqual:](v19, v20, v21);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMBCloudZoneRecordPushConflict recordID](self, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
      goto LABEL_9;
    -[HMBCloudZoneRecordPushConflict clientRecord](self, "clientRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if (!v11)
      goto LABEL_9;
    -[HMBCloudZoneRecordPushConflict serverRecord](self, "serverRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if (v14)
    {
      -[HMBCloudZoneRecordPushConflict ancestorRecord](self, "ancestorRecord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ancestorRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = HMFEqualObjects();

    }
    else
    {
LABEL_9:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMBCloudZoneRecordPushConflict recordID](self, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudZoneRecordPushConflict recordID](self, "recordID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hmbDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Record ID"), v19);
  v21[0] = v18;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudZoneRecordPushConflict clientRecord](self, "clientRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmbDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Client Record"), v6);
  v21[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudZoneRecordPushConflict serverRecord](self, "serverRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmbDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Server Record"), v10);
  v21[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudZoneRecordPushConflict ancestorRecord](self, "ancestorRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmbDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Ancestor Record"), v14);
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 8, 1);
}

- (CKRecord)clientRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 16, 1);
}

- (CKRecord)serverRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 24, 1);
}

- (CKRecord)ancestorRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ancestorRecord, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_clientRecord, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
