@implementation HMDCloudLegacyZone

- (BOOL)doesProcessChangeEvenIfDecryptionFails
{
  return 1;
}

- (NSUUID)metadataObjectID
{
  NSUUID *metadataObjectID;
  NSUUID *v4;
  NSUUID *v5;

  metadataObjectID = self->_metadataObjectID;
  if (!metadataObjectID)
  {
    v4 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("457C009B-1DA4-4B71-BD69-93D344A81A8B"));
    v5 = self->_metadataObjectID;
    self->_metadataObjectID = v4;

    metadataObjectID = self->_metadataObjectID;
  }
  return metadataObjectID;
}

- (CKRecordID)metadataRecordID
{
  CKRecordID *metadataRecordID;
  id v4;
  void *v5;
  void *v6;
  CKRecordID *v7;
  CKRecordID *v8;

  metadataRecordID = self->_metadataRecordID;
  if (!metadataRecordID)
  {
    v4 = objc_alloc(MEMORY[0x1E0C95070]);
    -[HMDCloudZone zone](self, "zone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CKRecordID *)objc_msgSend(v4, "initWithRecordName:zoneID:", CFSTR("9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300"), v6);
    v8 = self->_metadataRecordID;
    self->_metadataRecordID = v7;

    metadataRecordID = self->_metadataRecordID;
  }
  return metadataRecordID;
}

- (BOOL)isMetadataRecordAvailable
{
  void *v3;
  void *v4;

  -[HMDCloudLegacyZone metadataObjectID](self, "metadataObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZone cloudRecordWithObjectID:](self, "cloudRecordWithObjectID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (NSUUID)homeDataObjectID
{
  NSUUID *homeDataObjectID;
  NSUUID *v4;
  NSUUID *v5;

  homeDataObjectID = self->_homeDataObjectID;
  if (!homeDataObjectID)
  {
    v4 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("ABE49D63-6AE9-4469-A7EF-AC020E0104B3"));
    v5 = self->_homeDataObjectID;
    self->_homeDataObjectID = v4;

    homeDataObjectID = self->_homeDataObjectID;
  }
  return homeDataObjectID;
}

- (CKRecordID)homeDataRecordID
{
  CKRecordID *homeDataRecordID;
  id v4;
  void *v5;
  void *v6;
  CKRecordID *v7;
  CKRecordID *v8;

  homeDataRecordID = self->_homeDataRecordID;
  if (!homeDataRecordID)
  {
    v4 = objc_alloc(MEMORY[0x1E0C95070]);
    -[HMDCloudZone zone](self, "zone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CKRecordID *)objc_msgSend(v4, "initWithRecordName:zoneID:", CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5"), v6);
    v8 = self->_homeDataRecordID;
    self->_homeDataRecordID = v7;

    homeDataRecordID = self->_homeDataRecordID;
  }
  return homeDataRecordID;
}

- (BOOL)isHomeDataRecordAvailable
{
  void *v3;
  void *v4;

  -[HMDCloudLegacyZone homeDataObjectID](self, "homeDataObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZone cloudRecordWithObjectID:](self, "cloudRecordWithObjectID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (NSUUID)homeDataV3ObjectID
{
  NSUUID *homeDataV3ObjectID;
  NSUUID *v4;
  NSUUID *v5;

  homeDataV3ObjectID = self->_homeDataV3ObjectID;
  if (!homeDataV3ObjectID)
  {
    v4 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5E034157-5CED-4502-9C16-9428C798883A"));
    v5 = self->_homeDataV3ObjectID;
    self->_homeDataV3ObjectID = v4;

    homeDataV3ObjectID = self->_homeDataV3ObjectID;
  }
  return homeDataV3ObjectID;
}

- (CKRecordID)homeDataV3RecordID
{
  CKRecordID *homeDataV3RecordID;
  id v4;
  void *v5;
  void *v6;
  CKRecordID *v7;
  CKRecordID *v8;

  homeDataV3RecordID = self->_homeDataV3RecordID;
  if (!homeDataV3RecordID)
  {
    v4 = objc_alloc(MEMORY[0x1E0C95070]);
    -[HMDCloudZone zone](self, "zone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CKRecordID *)objc_msgSend(v4, "initWithRecordName:zoneID:", CFSTR("BC9706E1-E72E-4152-A2A6-417AD742DC41"), v6);
    v8 = self->_homeDataV3RecordID;
    self->_homeDataV3RecordID = v7;

    homeDataV3RecordID = self->_homeDataV3RecordID;
  }
  return homeDataV3RecordID;
}

- (BOOL)isHomeDataV3RecordAvailable
{
  void *v3;
  void *v4;

  -[HMDCloudLegacyZone homeDataV3ObjectID](self, "homeDataV3ObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZone cloudRecordWithObjectID:](self, "cloudRecordWithObjectID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (id)metadataModelWithPushDataPush:(id)a3
{
  return +[HMDCloudLegacyMetadataRecord legacyModelWithMetadata:](HMDCloudLegacyMetadataRecord, "legacyModelWithMetadata:", a3);
}

- (id)homeDataModelWithPushDataPush:(id)a3
{
  return +[HMDCloudLegacyHomeDataRecord legacyModelWithHomeDataV0:homeDataV2:](HMDCloudLegacyHomeDataRecord, "legacyModelWithHomeDataV0:homeDataV2:", a3, a3);
}

- (id)homeDataV3ModelWithPushDataPush:(id)a3
{
  return +[HMDCloudLegacyHomeDataVersion3Record legacyModelWithHomeDataV3:](HMDCloudLegacyHomeDataVersion3Record, "legacyModelWithHomeDataV3:", a3);
}

- (id)createCloudRecordWithObjectID:(id)a3 recordName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  HMDCloudLegacyHomeDataRecord *v11;
  const __CFString *v12;
  HMDCloudLegacyMetadataRecord *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  HMDCloudLegacyMetadataRecord *v20;
  void *v21;
  HMDCloudLegacyZone *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (v7)
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300")))
      {
        v13 = [HMDCloudLegacyMetadataRecord alloc];
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("457C009B-1DA4-4B71-BD69-93D344A81A8B"));
        v15 = CFSTR("9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300");
LABEL_23:
        v20 = -[HMDCloudRecord initWithObjectID:recordName:cloudZone:](v13, "initWithObjectID:recordName:cloudZone:", v14, v15, self);

        goto LABEL_24;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5")))
      {
        v13 = [HMDCloudLegacyHomeDataRecord alloc];
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("ABE49D63-6AE9-4469-A7EF-AC020E0104B3"));
        v15 = CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5");
        goto LABEL_23;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("BC9706E1-E72E-4152-A2A6-417AD742DC41")))
      {
        v13 = [HMDCloudLegacyHomeDataVersion3Record alloc];
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5E034157-5CED-4502-9C16-9428C798883A"));
        v15 = CFSTR("BC9706E1-E72E-4152-A2A6-417AD742DC41");
        goto LABEL_23;
      }
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v24;
      v32 = 2112;
      v33 = v8;
      v25 = "%{public}@Unknown legacy record name %@";
      v26 = v23;
      v27 = 22;
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v24;
      v25 = "%{public}@Either objectID or recordName must be specified for a legacy record";
      v26 = v23;
      v27 = 12;
    }
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v30, v27);
LABEL_19:

    goto LABEL_20;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("457C009B-1DA4-4B71-BD69-93D344A81A8B"));
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (!v10)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("ABE49D63-6AE9-4469-A7EF-AC020E0104B3"));
    v17 = objc_msgSend(v6, "isEqual:", v16);

    if (v17)
    {
      v11 = [HMDCloudLegacyHomeDataRecord alloc];
      v12 = CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5");
      goto LABEL_11;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5E034157-5CED-4502-9C16-9428C798883A"));
    v19 = objc_msgSend(v6, "isEqual:", v18);

    if (v19)
    {
      v11 = [HMDCloudLegacyHomeDataVersion3Record alloc];
      v12 = CFSTR("BC9706E1-E72E-4152-A2A6-417AD742DC41");
      goto LABEL_11;
    }
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v24;
      v32 = 2112;
      v33 = v28;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unknown legacy record objectID %@", (uint8_t *)&v30, 0x16u);

      goto LABEL_19;
    }
LABEL_20:

    objc_autoreleasePoolPop(v21);
    v20 = 0;
    goto LABEL_24;
  }
  v11 = [HMDCloudLegacyMetadataRecord alloc];
  v12 = CFSTR("9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300");
LABEL_11:
  v20 = -[HMDCloudRecord initWithObjectID:recordName:cloudZone:](v11, "initWithObjectID:recordName:cloudZone:", v6, v12, self);
LABEL_24:

  return v20;
}

- (void)dropCachedRecords
{
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5");
  v4[1] = CFSTR("BC9706E1-E72E-4152-A2A6-417AD742DC41");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZone deleteCloudRecordNames:](self, "deleteCloudRecordNames:", v3);

}

- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3
{
  return -[HMDCloudLegacyZoneChange initWithZone:temporaryCache:]([HMDCloudLegacyZoneChange alloc], "initWithZone:temporaryCache:", self, a3);
}

- (void)setServerChangeToken:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCloudLegacyZone;
  -[HMDCloudZone setServerChangeToken:](&v4, sel_setServerChangeToken_, a3);
  -[HMDCloudZone updateCurrentServerChangeToken](self, "updateCurrentServerChangeToken");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeDataV3RecordID, 0);
  objc_storeStrong((id *)&self->_homeDataV3ObjectID, 0);
  objc_storeStrong((id *)&self->_homeDataRecordID, 0);
  objc_storeStrong((id *)&self->_homeDataObjectID, 0);
  objc_storeStrong((id *)&self->_metadataRecordID, 0);
  objc_storeStrong((id *)&self->_metadataObjectID, 0);
}

+ (id)zoneRootRecordName
{
  __CFString *v2;

  v2 = CFSTR("DONOTUPLOAD");
  return CFSTR("DONOTUPLOAD");
}

+ (id)zoneSubscriptionName:(id)a3
{
  return CFSTR("HomeDataBlobSubscription");
}

+ (void)createLegacyZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "zoneRootRecordName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "zoneSubscriptionName:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_class();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__HMDCloudLegacyZone_createLegacyZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke;
  v20[3] = &unk_1E89A9198;
  v21 = v11;
  v19 = v11;
  objc_msgSend(v18, "createZoneWithName:rootRecordName:subscriptionName:owner:cacheZone:cloudCache:completion:", v15, v16, v17, v14, v13, v12, v20);

}

void __85__HMDCloudLegacyZone_createLegacyZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v5;
    else
      v9 = 0;
    v10 = v9;
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "rootGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __85__HMDCloudLegacyZone_createLegacyZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke_2;
      v13[3] = &unk_1E89A9148;
      v14 = v5;
      v15 = *(id *)(a1 + 32);
      objc_msgSend(v12, "cloudRecordWithName:completionHandler:", CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5"), v13);

      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v7);
LABEL_9:

}

void __85__HMDCloudLegacyZone_createLegacyZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRecordsAvailable:", v7 != 0);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), 0);

}

@end
