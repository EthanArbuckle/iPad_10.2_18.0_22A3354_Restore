@implementation HMDCloudLegacyHomeDataRecord

- (id)extractObjectChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  HMDCloudLegacyHomeDataRecord *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  HMDCloudLegacyHomeDataRecord *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  HMDCloudLegacyHomeDataRecord *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  int v38;
  void *v39;
  HMDCloudLegacyHomeDataRecord *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  HMDCloudLegacyHomeDataRecord *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDCloudLegacyHomeDataRecord *v61;
  NSObject *v62;
  void *v63;
  void *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  __int16 v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  -[HMDCloudRecord cachedData](self, "cachedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    goto LABEL_10;
  }
  if (-[HMDCloudRecord isRecordCached](self, "isRecordCached"))
  {
    v74 = 0;
    -[HMDCloudRecord record](self, "record");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = v5;
      if (objc_msgSend(v6, "length"))
      {
        v73 = 0;
        +[HMDPersistentStore decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:](HMDPersistentStore, "decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:", v6, 0, 1, 1, (char *)&v74 + 1, 0, &v73);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v73;
        v9 = v7 == 0;
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if (v13)
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v76 = v14;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully decrypted data version 1", buf, 0xCu);

            v9 = v7 == 0;
          }
        }
        else if (v13)
        {
          HMFGetLogIdentifier();
          v65 = v10;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v23;
          v77 = 2112;
          v78 = (uint64_t)v24;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data v1 from the cloud due to error: %@", buf, 0x16u);

          v9 = v7 == 0;
          v10 = v65;
        }

        objc_autoreleasePoolPop(v10);
        v22 = 1;
      }
      else
      {
        v22 = 0;
        v9 = 0;
        v7 = 0;
      }
    }
    else
    {
      v22 = 0;
      v9 = 0;
      v7 = 0;
      v6 = 0;
    }
    -[HMDCloudRecord record](self, "record");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobVersion2Key"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v27 = v26;

      if (objc_msgSend(v27, "length"))
      {
        v67 = v9;
        v72 = 0;
        +[HMDPersistentStore decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:](HMDPersistentStore, "decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:", v27, 0, 1, 1, &v74, 0, &v72);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v72;
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
        if (v28)
        {
          if (v33)
          {
            HMFGetLogIdentifier();
            v68 = v28;
            v34 = v26;
            v35 = v7;
            v36 = v27;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v76 = v37;
            _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Successfully decrypted data version 2", buf, 0xCu);

            v27 = v36;
            v7 = v35;
            v26 = v34;
            v28 = v68;
          }

          objc_autoreleasePoolPop(v30);
          if (v22)
          {
            if (!(HIBYTE(v74) | v74))
              goto LABEL_46;
          }
          else if (!(_BYTE)v74)
          {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
        if (v33)
        {
          HMFGetLogIdentifier();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "shortDescription");
          v43 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v66;
          v77 = 2112;
          v78 = v43;
          v44 = (void *)v43;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data v2 from the cloud due to error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);

        if ((v22 & 1) == 0)
        {
          v38 = v74;
          -[HMDCloudRecord setDecryptionFailed:](v31, "setDecryptionFailed:", 1);
          goto LABEL_44;
        }
        v38 = (HIBYTE(v74) | v74) != 0;
        if (!v67)
        {
LABEL_44:
          v28 = 0;
          if (!v38)
          {
LABEL_46:
            +[HMDCloudLegacyHomeDataRecord legacyModelWithHomeDataV0:homeDataV2:](HMDCloudLegacyHomeDataRecord, "legacyModelWithHomeDataV0:homeDataV2:", v7, v28);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v71 = 0;
            objc_msgSend(v16, "encodeWithEncoding:error:", 1, &v71);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v71;
            -[HMDCloudRecord setCachedData:](self, "setCachedData:", v45);

            if (v46)
            {
              v69 = v28;
              v47 = v26;
              v48 = v7;
              v49 = v27;
              v50 = (void *)MEMORY[0x1D17BA0A0]();
              v51 = self;
              HMFGetOSLogHandle();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v76 = v53;
                v77 = 2112;
                v78 = (uint64_t)v46;
                _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v50);
              v27 = v49;
              v7 = v48;
              v26 = v47;
              v28 = v69;
            }
            -[HMDCloudRecord record](self, "record");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", 0, CFSTR("kRecordEncodedDataBlobKey"));

            -[HMDCloudRecord record](self, "record");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setObject:forKeyedSubscript:", 0, CFSTR("kRecordEncodedDataBlobVersion2Key"));

            goto LABEL_51;
          }
LABEL_45:
          -[HMDCloudRecord setControllerIdentifierChanged:](self, "setControllerIdentifierChanged:", 1);
          goto LABEL_46;
        }
LABEL_31:
        -[HMDCloudRecord setDecryptionFailed:](self, "setDecryptionFailed:", 1);
        v28 = 0;
        if ((v38 & 1) == 0)
          goto LABEL_46;
        goto LABEL_45;
      }
    }
    else
    {
      v27 = v6;
    }
    if ((v22 & 1) == 0)
    {
      v39 = (void *)MEMORY[0x1D17BA0A0]();
      v40 = self;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v76 = v42;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@The record exists but neither v1 or v2 data is present, marking decryption as failed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v39);
      -[HMDCloudRecord setDecryptionFailed:](v40, "setDecryptionFailed:", 1);
      v28 = 0;
      goto LABEL_46;
    }
    v38 = HIBYTE(v74) != 0;
    if (!v9)
      goto LABEL_44;
    goto LABEL_31;
  }
LABEL_10:
  -[HMDCloudRecord cachedData](self, "cachedData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v15, 1, &v70);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v70;

  if (v17)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v21;
      v77 = 2112;
      v78 = (uint64_t)v17;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode object change with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);

LABEL_59:
    v59 = 0;
    goto LABEL_60;
  }
LABEL_51:
  -[HMDCloudRecord cachedData](self, "cachedData");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v56)
  {
    v60 = (void *)MEMORY[0x1D17BA0A0]();
    v61 = self;
    HMFGetOSLogHandle();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v63;
      _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@Cloud legacy home data record was not loaded from disk or fetch from cloud, no cached data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v60);
    goto LABEL_59;
  }
  if (v16)
  {
    objc_msgSend(v16, "uuid");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v16, "uuid");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudRecord setObjectID:](self, "setObjectID:", v58);

    }
  }
  v16 = v16;
  v59 = v16;
LABEL_60:

  return v59;
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
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  HMDCloudLegacyHomeDataRecord *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  HMDCloudLegacyHomeDataRecord *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDCloudLegacyHomeDataRecord *v38;
  NSObject *v39;
  void *v40;
  HMDCloudLegacyHomeDataRecord *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *context;
  NSObject *log;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
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
    if (objc_msgSend(v9, "length") && (objc_msgSend(v6, "data2"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = (void *)v10;
      objc_msgSend(v6, "data2");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        objc_msgSend(v6, "data1");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        +[HMDPersistentStore encryptDataWithControllerKey:error:](HMDPersistentStore, "encryptDataWithControllerKey:error:", v14, &v53);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v53;

        v17 = objc_msgSend(v15, "length");
        objc_msgSend(v6, "data2");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hmd_compressedData");
        v19 = objc_claimAutoreleasedReturnValue();

        v52 = v16;
        v50 = (void *)v19;
        +[HMDPersistentStore encryptDataWithControllerKey:error:](HMDPersistentStore, "encryptDataWithControllerKey:error:", v19, &v52);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v52;

        v22 = objc_msgSend(v20, "length");
        if (v15
          && (v23 = v22, (v22 = objc_msgSend(v15, "length")) != 0)
          && v20
          && (v22 = objc_msgSend(v20, "length")) != 0)
        {
          -[HMDCloudRecord record](self, "record");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v15, CFSTR("kRecordEncodedDataBlobKey"));

          -[HMDCloudRecord record](self, "record");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, CFSTR("kRecordEncodedDataBlobVersion2Key"));

          context = (void *)MEMORY[0x1D17BA0A0]();
          v26 = self;
          HMFGetOSLogHandle();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCloudRecord record](v26, "record");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "recordType");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCloudRecord recordName](v26, "recordName");
            v27 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v55 = v47;
            v56 = 2112;
            v57 = v45;
            v58 = 2112;
            v59 = v27;
            v28 = (void *)v27;
            v60 = 2048;
            v61 = v17;
            v62 = 2048;
            v63 = v23;
            v64 = 2048;
            v65 = v23 + v17;
            _os_log_impl(&dword_1CD062000, log, OS_LOG_TYPE_INFO, "%{public}@Legacy homeData record %@/%@ v1: %lu bytes v2: %lu bytes total: %lu bytes", buf, 0x3Eu);

          }
          objc_autoreleasePoolPop(context);
          v51 = v21;
          v29 = 1;
          objc_msgSend(v4, "encodeWithEncoding:error:", 1, &v51);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v51;

          -[HMDCloudRecord setCachedData:](v26, "setCachedData:", v30);
          if (!v31)
            goto LABEL_26;
          v32 = v31;
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = v26;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v36;
            v56 = 2112;
            v57 = v32;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);

          }
          v21 = v32;
        }
        else
        {
          v33 = (void *)MEMORY[0x1D17BA0A0](v22);
          v42 = self;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "shortDescription");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v43;
            v56 = 2112;
            v57 = v44;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Failed to encrypt home data v1/v2 record due to error: %@", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v33);
        v29 = 0;
LABEL_26:

        goto LABEL_22;
      }
    }
    else
    {

    }
  }
  v37 = (void *)MEMORY[0x1D17BA0A0]();
  v38 = self;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v40;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@No data to encode into the legacy home data record", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v37);
  v29 = 0;
LABEL_22:

  return v29;
}

- (id)recordType
{
  __CFString *v2;

  v2 = CFSTR("HomeDataBlob");
  return CFSTR("HomeDataBlob");
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
  void *v5;
  void *v6;
  HMDCloudLegacyHomeDataRecord *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCloudRecord record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("kRecordEncodedDataBlobKey"));

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Set read only field to NO", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCloudRecord record](v7, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("kRecordReadOnly"));

}

- (NSData)dataVersion2
{
  void *v2;
  void *v3;

  -[HMDCloudRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobVersion2Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setDataVersion2:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudRecord record](self, "record");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("kRecordEncodedDataBlobVersion2Key"));

}

- (void)clearData
{
  void *v3;
  id v4;

  -[HMDCloudRecord record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("kRecordEncodedDataBlobKey"));

  -[HMDCloudRecord record](self, "record");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("kRecordEncodedDataBlobVersion2Key"));

}

- (unint64_t)objectEncoding
{
  return 1;
}

+ (id)legacyModelWithHomeDataV0:(id)a3 homeDataV2:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  HMDCloudLegacyModelObject *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3A28];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithUUIDString:", CFSTR("ABE49D63-6AE9-4469-A7EF-AC020E0104B3"));
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDCloudLegacyModelObject alloc], "initWithObjectChangeType:uuid:parentUUID:", 1, v8, 0);
  -[HMDCloudLegacyModelObject setLegacyRecordType:](v9, "setLegacyRecordType:", &unk_1E8B34A70);
  -[HMDCloudLegacyModelObject setData1:](v9, "setData1:", v7);

  -[HMDCloudLegacyModelObject setData2:](v9, "setData2:", v6);
  return v9;
}

@end
