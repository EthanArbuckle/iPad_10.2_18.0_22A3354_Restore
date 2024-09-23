@implementation HAPInterfaceConfig

+ (id)interfaceNamesWithFamily:(unsigned int)a3 flags:(unsigned int)a4 eflags:(unint64_t)a5 netTransportType:(unsigned int)a6
{
  unsigned int UsableInterfaceList;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  UsableInterfaceList = CreateUsableInterfaceList();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (UsableInterfaceList)
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 1024;
      v25 = UsableInterfaceList;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Error getting interface list %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v19;
      v24 = 1024;
      v25 = a4;
      v26 = 2048;
      v27 = a5;
      v28 = 1024;
      v29 = a6;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@Matching interfaces with flags 0x%x eflags 0x%llx netTransportType 0x%x", buf, 0x22u);

    }
    objc_autoreleasePoolPop(v16);
    ReleaseUsableInterfaceList();
  }
  return v11;
}

+ (NSString)activeWifiOrEthernetInterfaceName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[HAPInterfaceConfig interfaceNamesWithFamily:flags:eflags:netTransportType:](HAPInterfaceConfig, "interfaceNamesWithFamily:flags:eflags:netTransportType:", 30, 34915, 2112, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to find active Wifi or Ethernet interface", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

  return (NSString *)v5;
}

@end
