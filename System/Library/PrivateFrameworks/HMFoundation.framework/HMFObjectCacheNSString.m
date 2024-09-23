@implementation HMFObjectCacheNSString

+ (id)hmf_cachedInstanceForString:(id)a3
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
  v4 = (void *)MEMORY[0x1A1AC355C]();
  if (!v3)
  {
    v8 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
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
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Object %@ of class %@ mismatches cache class %@:", (uint8_t *)&v18, 0x2Au);

    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE3FD490) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = (id)objc_opt_class();
      v16 = v23;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Object %@ of class %@ does not conform to NSCopying protocol", (uint8_t *)&v18, 0x20u);

    }
LABEL_15:

    objc_autoreleasePoolPop(v9);
    v8 = v3;
    goto LABEL_16;
  }
  os_unfair_lock_lock_with_options();
  v5 = (void *)qword_1ED0131D8;
  if (!qword_1ED0131D8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1ED0131D8;
    qword_1ED0131D8 = v6;

    v5 = (void *)qword_1ED0131D8;
  }
  objc_msgSend(v5, "member:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (id)objc_msgSend(v3, "copy");
    objc_msgSend((id)qword_1ED0131D8, "addObject:", v8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_68);
LABEL_16:
  objc_autoreleasePoolPop(v4);

  return v8;
}

+ (id)hmf_setOfCachedInstancesForStrings:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a3;
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__HMFObjectCacheNSString_CollectionSupport__hmf_setOfCachedInstancesForStrings___block_invoke;
  v9[3] = &unk_1E3B392E8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __80__HMFObjectCacheNSString_CollectionSupport__hmf_setOfCachedInstancesForStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[HMFObjectCacheNSString hmf_cachedInstanceForString:](HMFObjectCacheNSString, "hmf_cachedInstanceForString:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

@end
