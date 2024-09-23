@implementation HMDHomeNFCReaderKeyModel

- (void)setNfcReaderKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDHomeNFCReaderKeyModel *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    -[HMDHomeNFCReaderKeyModel setEncodedNfcReaderKey:](self, "setEncodedNfcReaderKey:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set encoded nfc reader key on model %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (HMDHomeNFCReaderKey)nfcReaderKey
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDHomeNFCReaderKeyModel encodedNfcReaderKey](self, "encodedNfcReaderKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v11;
    v5 = v4;
    if (v3)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (!v6)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v13 = v9;
        v14 = 2112;
        v15 = v2;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode nfc reader key set on model %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
  else
  {
    v3 = 0;
  }

  return (HMDHomeNFCReaderKey *)v3;
}

+ (id)properties
{
  if (properties_onceToken_247 != -1)
    dispatch_once(&properties_onceToken_247, &__block_literal_global_249_78566);
  return (id)properties__properties_248;
}

+ (id)modelIDForHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(CFSTR("HMDHomeNFCReaderKeyModel"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultModelForHome:(id)a3
{
  id v4;
  HMDHomeNFCReaderKeyModel *v5;
  void *v6;
  void *v7;
  HMDHomeNFCReaderKeyModel *v8;

  v4 = a3;
  v5 = [HMDHomeNFCReaderKeyModel alloc];
  objc_msgSend(a1, "modelIDForHome:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v7);
  return v8;
}

void __38__HMDHomeNFCReaderKeyModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("encodedNfcReaderKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_248;
  properties__properties_248 = v1;

}

@end
