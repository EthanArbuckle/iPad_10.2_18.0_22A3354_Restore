@implementation HMDCloudRecord

- (HMDCloudRecord)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDCloudRecord)initWithObjectID:(id)a3 recordName:(id)a4 cloudZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDCloudRecord *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCloudRecord;
  v11 = -[HMDCloudRecord init](&v15, sel_init);
  if (v11)
  {
    v12 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_objectID, v12);
    if (!v8)

    objc_storeWeak((id *)&v11->_cloudZone, v10);
    v13 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_recordName, v13);
    if (!v9)
    {

    }
  }

  return v11;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudRecord objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudRecord recordName](self, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudRecord shortDescription](self, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)extractObjectChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDCloudRecord *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCloudRecord *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  HMDCloudRecord *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  HMDCloudRecord *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  HMDCloudRecord *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  HMDCloudRecord *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  const __CFString *v81;
  _QWORD v82[4];

  v82[3] = *MEMORY[0x1E0C80C00];
  -[HMDCloudRecord cachedData](self, "cachedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_17:
    v18 = 0;
    goto LABEL_18;
  }
  if (!-[HMDCloudRecord isRecordCached](self, "isRecordCached"))
    goto LABEL_17;
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v82[0] = objc_opt_class();
  v82[1] = objc_opt_class();
  v82[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudRecord record](self, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("k00"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v9, &v71);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v71;

  if (!v10)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v15;
      v74 = 2114;
      v75 = (uint64_t)v11;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cloud record version dictionary from record data: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
  v16 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  -[HMDCloudRecord record](self, "record");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("k01"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v20, "length");
      *(_DWORD *)buf = 138543618;
      v73 = v24;
      v74 = 2048;
      v75 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@[HomeKit Data Usage Metric Log] Object changed record encrypted data size (extractObjectChange): %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v70 = 0;
    +[HMDPersistentStore decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:](HMDPersistentStore, "decryptDataWithControllerKey:totalKeysFound:deleteExtraKeys:allowControllerIdentifierToChange:controllerIdentifierChanged:successfulKeyUserName:error:", v20, 0, 0, 0, 0, 0, &v70);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v70;
    if (v26)
    {
      objc_msgSend(v26, "hmd_uncompressedData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudRecord setCachedData:](v22, "setCachedData:", v28);

      -[HMDCloudRecord record](v22, "record");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, CFSTR("k00"));

      -[HMDCloudRecord record](v22, "record");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", 0, CFSTR("k01"));

      v31 = 0;
    }
    else
    {
      v68 = v18;
      v59 = (void *)MEMORY[0x1D17BA0A0]();
      v60 = v22;
      HMFGetOSLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v66 = v59;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v62;
        v74 = 2112;
        v75 = (uint64_t)v63;
        _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data in object record due to error: %@", buf, 0x16u);

        v59 = v66;
      }

      objc_autoreleasePoolPop(v59);
      v31 = 1;
      -[HMDCloudRecord setDecryptionFailed:](v60, "setDecryptionFailed:", 1);
      v18 = v68;
    }

  }
  else
  {
    v55 = (void *)MEMORY[0x1D17BA0A0]();
    v56 = self;
    HMFGetOSLogHandle();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v58;
      _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@Cannot find data in record", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v55);
    v31 = 1;
  }

  if (v31)
    goto LABEL_43;
LABEL_18:
  -[HMDCloudRecord cachedData](self, "cachedData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    v42 = (void *)MEMORY[0x1D17BA0A0]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v45;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@Cloud record was not loaded from disk or fetch from cloud, no cached data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v42);
LABEL_43:
    v41 = 0;
    goto LABEL_44;
  }
  -[HMDCloudRecord cachedData](self, "cachedData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v33, 1, &v69);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v69;

  v36 = (void *)MEMORY[0x1D17BA0A0]();
  v37 = self;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v35)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v40;
      v74 = 2112;
      v75 = (uint64_t)v35;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode object change with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    v41 = 0;
  }
  else
  {
    v67 = v18;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudRecord record](v37, "record");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v65, "size");
      -[HMDCloudRecord record](v37, "record");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "recordID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "hmf_stringForKey:", CFSTR("HM.device"));
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v50;
      *(_DWORD *)buf = 138544386;
      v52 = CFSTR("<UNKNOWN>");
      v73 = v46;
      if (v50)
        v52 = (const __CFString *)v50;
      v74 = 2048;
      v75 = v47;
      v76 = 2112;
      v77 = v49;
      v78 = 2112;
      v79 = v34;
      v80 = 2112;
      v81 = v52;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@fetched cloud record (%lu bytes) %@ (%@) from %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v36);
    if (v34)
    {
      objc_msgSend(v34, "uuid");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        objc_msgSend(v34, "uuid");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCloudRecord setObjectID:](v37, "setObjectID:", v54);

      }
    }
    v41 = v34;
    v18 = v67;
  }

LABEL_44:
  return v41;
}

- (BOOL)encodeObjectChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDCloudRecord *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCloudRecord *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  HMDCloudRecord *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDCloudRecord *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      objc_msgSend(v8, "downloadSize");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v8, "downloadSize");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", &unk_1E8B34A40);

        if (v12)
        {
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v16;
            v56 = 2112;
            v57 = v8;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode software update model object change for cloud due to invalid download size %@ - This change will not go to the cloud", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);

          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v18 = v14;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v20;
            v56 = 2112;
            v57 = v6;
            _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Model object is blocked from being pushed to the cloud %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
LABEL_18:
          v27 = 0;
          goto LABEL_28;
        }
      }
    }

  }
  v49 = 0;
  objc_msgSend(v5, "encodeWithEncoding:error:", 1, &v49);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v49;
  -[HMDCloudRecord setCachedData:](self, "setCachedData:", v21);

  if (v22)
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v26;
      v56 = 2112;
      v57 = v22;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);

    goto LABEL_18;
  }
  -[HMDCloudRecord cachedData](self, "cachedData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "hmd_compressedData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0;
  +[HMDPersistentStore encryptDataWithControllerKey:error:](HMDPersistentStore, "encryptDataWithControllerKey:error:", v29, &v48);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v48;
  v27 = v30 != 0;
  if (v30)
  {
    +[HMDBackingStore currentDevice](HMDBackingStore, "currentDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v52[0] = CFSTR("HM.encoding");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCloudRecord objectEncoding](self, "objectEncoding"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = CFSTR("HM.device");
      v53[0] = v33;
      +[HMDBackingStore currentDevice](HMDBackingStore, "currentDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "identifier");
      v47 = v29;
      v35 = v31;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUIDString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v35;
      v29 = v47;

    }
    else
    {
      v50[0] = CFSTR("HM.encoding");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCloudRecord objectEncoding](self, "objectEncoding"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = CFSTR("HM.device");
      v51[0] = v33;
      v51[1] = CFSTR("<unknown device>");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v38, 1, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudRecord record](self, "record");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("k00"));

    -[HMDCloudRecord record](self, "record");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v30, CFSTR("k01"));

  }
  else
  {
    v39 = (void *)MEMORY[0x1D17BA0A0]();
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v42;
      v56 = 2112;
      v57 = v31;
      _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt object change data with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
    -[HMDCloudRecord setEncryptionFailed:](v40, "setEncryptionFailed:", 1);
  }

LABEL_28:
  return v27;
}

- (NSString)recordType
{
  __CFString *v2;

  v2 = CFSTR("ObjectRecord");
  return (NSString *)CFSTR("ObjectRecord");
}

- (CKRecordID)recordID
{
  CKRecordID *recordID;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CKRecordID *v9;
  CKRecordID *v10;

  recordID = self->_recordID;
  if (!recordID)
  {
    -[HMDCloudRecord cloudZone](self, "cloudZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0C95070]);
      -[HMDCloudRecord recordName](self, "recordName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "zone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "zoneID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (CKRecordID *)objc_msgSend(v5, "initWithRecordName:zoneID:", v6, v8);
      v10 = self->_recordID;
      self->_recordID = v9;

    }
    recordID = self->_recordID;
  }
  return recordID;
}

- (CKRecord)record
{
  CKRecord *record;
  void *v4;
  HMDCloudRecord *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  CKRecord *v12;
  CKRecord *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  record = self->_record;
  if (!record)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0](0, a2);
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudRecord recordType](v5, "recordType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Allocating new %@ record since we don't have one", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = objc_alloc(MEMORY[0x1E0C95048]);
    -[HMDCloudRecord recordType](v5, "recordType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudRecord recordID](v5, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (CKRecord *)objc_msgSend(v9, "initWithRecordType:recordID:", v10, v11);
    v13 = self->_record;
    self->_record = v12;

    v5->_recordCreated = 1;
    record = self->_record;
  }
  return record;
}

- (BOOL)isRecordCached
{
  return self->_record != 0;
}

- (NSData)data
{
  return 0;
}

- (void)clearData
{
  void *v3;
  id v4;

  -[HMDCloudRecord record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("k00"));

  -[HMDCloudRecord record](self, "record");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("k01"));

}

- (unint64_t)objectEncoding
{
  return 1;
}

- (NSUUID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (BOOL)decryptionFailed
{
  return self->_decryptionFailed;
}

- (void)setDecryptionFailed:(BOOL)a3
{
  self->_decryptionFailed = a3;
}

- (BOOL)encryptionFailed
{
  return self->_encryptionFailed;
}

- (void)setEncryptionFailed:(BOOL)a3
{
  self->_encryptionFailed = a3;
}

- (BOOL)controllerIdentifierChanged
{
  return self->_controllerIdentifierChanged;
}

- (void)setControllerIdentifierChanged:(BOOL)a3
{
  self->_controllerIdentifierChanged = a3;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (HMDCloudZone)cloudZone
{
  return (HMDCloudZone *)objc_loadWeakRetained((id *)&self->_cloudZone);
}

- (void)setCloudZone:(id)a3
{
  objc_storeWeak((id *)&self->_cloudZone, a3);
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedData, a3);
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (BOOL)isRecordCreated
{
  return self->_recordCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_148662 != -1)
    dispatch_once(&logCategory__hmf_once_t0_148662, &__block_literal_global_148663);
  return (id)logCategory__hmf_once_v1_148664;
}

void __29__HMDCloudRecord_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_148664;
  logCategory__hmf_once_v1_148664 = v0;

}

@end
