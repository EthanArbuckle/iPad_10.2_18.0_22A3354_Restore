@implementation NSDictionary(HomeLocation)

- (id)hm_locationFromDataForKey:()HomeLocation
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "hmf_dataForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v12;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive location value from data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)hm_regionFromDataForKey:()HomeLocation
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "hmf_dataForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v12;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region value from data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
