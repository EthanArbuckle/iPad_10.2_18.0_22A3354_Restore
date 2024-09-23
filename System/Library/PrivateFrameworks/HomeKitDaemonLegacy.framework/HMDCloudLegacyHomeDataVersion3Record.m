@implementation HMDCloudLegacyHomeDataVersion3Record

- (id)extractObjectChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  HMDCloudLegacyHomeDataVersion3Record *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  HMDCloudLegacyHomeDataVersion3Record *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDCloudLegacyHomeDataVersion3Record *v22;
  NSObject *v23;
  void *v24;
  HMDCloudLegacyHomeDataVersion3Record *v25;
  void *v26;
  id v27;
  void *v28;
  HMDCloudLegacyHomeDataVersion3Record *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDCloudLegacyHomeDataVersion3Record *v39;
  NSObject *v40;
  void *v41;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  char v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[HMDCloudRecord cachedData](self, "cachedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    goto LABEL_11;
  }
  if (-[HMDCloudRecord isRecordCached](self, "isRecordCached"))
  {
    v48 = 0;
    -[HMDCloudRecord record](self, "record");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = v5;
      if (objc_msgSend(v6, "length"))
      {
        v47 = 0;
        +[HMDPersistentStore decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:](HMDPersistentStore, "decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:", v6, 0, 1, 1, &v48, 0, &v47);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v47;
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if (v12)
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v50 = v13;
            _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully decrypted data version 3", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v9);

          goto LABEL_20;
        }
        if (v12)
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v43;
          v51 = 2112;
          v52 = v44;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data v3 from the cloud due to error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v9);

        v25 = v10;
LABEL_19:
        -[HMDCloudRecord setDecryptionFailed:](v25, "setDecryptionFailed:", 1);
        v7 = 0;
LABEL_20:
        if (v48)
          -[HMDCloudRecord setControllerIdentifierChanged:](self, "setControllerIdentifierChanged:", 1);
        +[HMDCloudLegacyHomeDataVersion3Record legacyModelWithHomeDataV3:](HMDCloudLegacyHomeDataVersion3Record, "legacyModelWithHomeDataV3:", v7);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        objc_msgSend(v15, "encodeWithEncoding:error:", 1, &v46);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v46;
        -[HMDCloudRecord setCachedData:](self, "setCachedData:", v26);

        if (v27)
        {
          v28 = (void *)MEMORY[0x1D17BA0A0]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v31;
            v51 = 2112;
            v52 = v27;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
        }
        -[HMDCloudRecord record](self, "record");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("kRecordEncodedDataBlobKey"));

        -[HMDCloudRecord record](self, "record");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", 0, CFSTR("kRecordEncodedDataBlobVersion2Key"));

        goto LABEL_27;
      }
    }
    else
    {
      v6 = 0;
    }
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@The record exists but v3 data is not present, marking decryption as failed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v25 = v22;
    goto LABEL_19;
  }
LABEL_11:
  -[HMDCloudRecord cachedData](self, "cachedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v14, 1, &v45);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v45;

  if (v16)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v20;
      v51 = 2112;
      v52 = v16;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode object change with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);

LABEL_35:
    v37 = 0;
    goto LABEL_36;
  }
LABEL_27:
  -[HMDCloudRecord cachedData](self, "cachedData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v41;
      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cloud legacy home data version3 record was not loaded from disk or fetch from cloud, no cached data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v38);
    goto LABEL_35;
  }
  if (v15)
  {
    objc_msgSend(v15, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v15, "uuid");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudRecord setObjectID:](self, "setObjectID:", v36);

    }
  }
  v15 = v15;
  v37 = v15;
LABEL_36:

  return v37;
}

- (BOOL)encodeObjectChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDCloudLegacyHomeDataVersion3Record *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  HMDCloudLegacyHomeDataVersion3Record *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDCloudLegacyHomeDataVersion3Record *v31;
  NSObject *v32;
  void *v33;
  HMDCloudLegacyHomeDataVersion3Record *v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "data1");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "data1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_msgSend(v6, "data1");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmd_compressedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0;
      +[HMDPersistentStore encryptDataWithControllerKey:error:](HMDPersistentStore, "encryptDataWithControllerKey:error:", v12, &v42);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v42;
      v15 = objc_msgSend(v13, "length");
      if (v13 && (v16 = v15, (v15 = objc_msgSend(v13, "length")) != 0))
      {
        v40 = v12;
        -[HMDCloudRecord record](self, "record");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("kRecordEncodedDataBlobKey"));

        v18 = (void *)MEMORY[0x1D17BA0A0]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = v14;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCloudRecord record](v19, "record");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "recordType");
          v39 = v18;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCloudRecord recordName](v19, "recordName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v44 = v21;
          v45 = 2112;
          v46 = v22;
          v47 = 2112;
          v48 = v23;
          v49 = 2048;
          v50 = v16;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Legacy homeData record %@/%@ v3: %lu bytes", buf, 0x2Au);

          v18 = v39;
          v14 = v38;
        }

        objc_autoreleasePoolPop(v18);
        v41 = 0;
        v24 = 1;
        objc_msgSend(v4, "encodeWithEncoding:error:", 1, &v41);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v41;
        -[HMDCloudRecord setCachedData:](v19, "setCachedData:", v25);

        if (!v14)
        {
          v12 = v40;
          goto LABEL_20;
        }
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v19;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        v12 = v40;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v29;
          v45 = 2112;
          v46 = v14;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);
LABEL_18:

        }
      }
      else
      {
        v26 = (void *)MEMORY[0x1D17BA0A0](v15);
        v34 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "shortDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v29;
          v45 = 2112;
          v46 = v35;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Failed to encrypt home data v3 record due to error: %@", buf, 0x16u);

          goto LABEL_18;
        }
      }

      objc_autoreleasePoolPop(v26);
      v24 = 0;
LABEL_20:

      goto LABEL_21;
    }
  }
  v30 = (void *)MEMORY[0x1D17BA0A0]();
  v31 = self;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v33;
    _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@No data to encode into the legacy home data record", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v30);
  v24 = 0;
LABEL_21:

  return v24;
}

- (id)recordType
{
  __CFString *v2;

  v2 = CFSTR("HomeDataBlobV3");
  return CFSTR("HomeDataBlobV3");
}

- (id)data
{
  void *v2;
  void *v3;

  -[HMDCloudRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudRecord record](self, "record");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("kRecordEncodedDataBlobKey"));

}

- (void)clearData
{
  id v2;

  -[HMDCloudRecord record](self, "record");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("kRecordEncodedDataBlobKey"));

}

- (unint64_t)objectEncoding
{
  return 1;
}

+ (id)legacyModelWithHomeDataV3:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  HMDCloudLegacyModelObject *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("5E034157-5CED-4502-9C16-9428C798883A"));
  v6 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDCloudLegacyModelObject alloc], "initWithObjectChangeType:uuid:parentUUID:", 1, v5, 0);
  -[HMDCloudLegacyModelObject setLegacyRecordType:](v6, "setLegacyRecordType:", &unk_1E8B34A88);
  -[HMDCloudLegacyModelObject setData1:](v6, "setData1:", v4);

  return v6;
}

@end
