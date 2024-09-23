@implementation HMFObjectCacheHMDCharacteristicMetadata

+ (id)cachedInstanceForCharacteristicMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  if (!v3)
  {
    v8 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_class();
      v13 = v12;
      v18 = 138544130;
      v19 = v11;
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = (id)objc_opt_class();
      v14 = v25;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Object %@ of class %@ mismatches cache class %@:", (uint8_t *)&v18, 0x2Au);

    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EFA5B8E8) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = (id)objc_opt_class();
      v16 = v23;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Object %@ of class %@ does not conform to NSCopying protocol", (uint8_t *)&v18, 0x20u);

    }
LABEL_15:

    objc_autoreleasePoolPop(v9);
    v8 = v3;
    goto LABEL_16;
  }
  os_unfair_lock_lock_with_options();
  v5 = (void *)cachedInstanceForCharacteristicMetadata__cachedInstances;
  if (!cachedInstanceForCharacteristicMetadata__cachedInstances)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)cachedInstanceForCharacteristicMetadata__cachedInstances;
    cachedInstanceForCharacteristicMetadata__cachedInstances = v6;

    v5 = (void *)cachedInstanceForCharacteristicMetadata__cachedInstances;
  }
  objc_msgSend(v5, "member:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (id)objc_msgSend(v3, "copy");
    objc_msgSend((id)cachedInstanceForCharacteristicMetadata__cachedInstances, "addObject:", v8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedInstanceForCharacteristicMetadata__lock);
LABEL_16:
  objc_autoreleasePoolPop(v4);

  return v8;
}

@end
