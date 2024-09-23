@implementation HMDCloudLegacyMetadataRecord

- (id)extractObjectChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  HMDCloudLegacyMetadataRecord *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDCloudLegacyMetadataRecord *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCloudLegacyMetadataRecord *v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[HMDCloudRecord cachedData](self, "cachedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[HMDCloudRecord isRecordCached](self, "isRecordCached"))
  {
    -[HMDCloudRecord record](self, "record");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      +[HMDCloudLegacyMetadataRecord legacyModelWithMetadata:](HMDCloudLegacyMetadataRecord, "legacyModelWithMetadata:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v30 = 0;
    objc_msgSend(v6, "encodeWithEncoding:error:", 1, &v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v30;
    -[HMDCloudRecord setCachedData:](self, "setCachedData:", v13);

    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        v33 = 2112;
        v34 = v14;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }
    -[HMDCloudRecord record](self, "record");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("kRecordEncodedDataBlobKey"));

    goto LABEL_17;
  }
  -[HMDCloudRecord cachedData](self, "cachedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v7, 1, &v29);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v29;

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      v33 = 2112;
      v34 = v8;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode object change with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);

LABEL_25:
    v23 = 0;
    goto LABEL_26;
  }
LABEL_17:
  -[HMDCloudRecord cachedData](self, "cachedData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v27;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cloud legacy metadata record was not loaded from disk or fetch from cloud, no cached data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    goto LABEL_25;
  }
  if (v6)
  {
    objc_msgSend(v6, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v6, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudRecord setObjectID:](self, "setObjectID:", v22);

    }
  }
  v6 = v6;
  v23 = v6;
LABEL_26:

  return v23;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCloudLegacyMetadataRecord *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  BOOL v24;
  void *v25;
  HMDCloudLegacyMetadataRecord *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDCloudLegacyMetadataRecord *v30;
  NSObject *v31;
  void *v32;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "data1");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "data1"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v8,
        v10))
  {
    objc_msgSend(v6, "data1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    objc_msgSend(v6, "data1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudRecord record](self, "record");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("kRecordEncodedDataBlobKey"));

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudRecord record](v16, "record");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recordType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudRecord recordName](v16, "recordName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v18;
      v37 = 2112;
      v38 = v20;
      v39 = 2112;
      v40 = v21;
      v41 = 2048;
      v42 = v12;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Legacy metadata record %@/%@ %lu bytes", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    v34 = 0;
    objc_msgSend(v4, "encodeWithEncoding:error:", 1, &v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v34;
    -[HMDCloudRecord setCachedData:](v16, "setCachedData:", v22);

    v24 = v23 == 0;
    if (v23)
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = v16;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        v37 = 2112;
        v38 = v23;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode object change with %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v32;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@No data to encode into the legacy metadata record", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    v24 = 0;
  }

  return v24;
}

- (id)recordType
{
  __CFString *v2;

  v2 = CFSTR("MetadataBlob");
  return CFSTR("MetadataBlob");
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

+ (id)legacyModelWithMetadata:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  HMDCloudLegacyModelObject *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("457C009B-1DA4-4B71-BD69-93D344A81A8B"));
  v6 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDCloudLegacyModelObject alloc], "initWithObjectChangeType:uuid:parentUUID:", 1, v5, 0);
  -[HMDCloudLegacyModelObject setLegacyRecordType:](v6, "setLegacyRecordType:", &unk_1E8B34A58);
  -[HMDCloudLegacyModelObject setData1:](v6, "setData1:", v4);

  return v6;
}

@end
