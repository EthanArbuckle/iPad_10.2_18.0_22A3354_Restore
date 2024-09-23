@implementation HMDBackgroundOperationAccessoryManagerDataSource

- (HMDBackgroundOperationAccessoryManagerDataSource)initWithOperationManager:(id)a3 notificationCenter:(id)a4
{
  id v6;
  HMDBackgroundOperationAccessoryManagerDataSource *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackgroundOperationAccessoryManagerDataSource;
  v7 = -[HMDBackgroundOperationManagerDataSource initWithOperationManager:notificationCenter:](&v9, sel_initWithOperationManager_notificationCenter_, a3, v6);
  if (v7)
    objc_msgSend(v6, "addObserver:selector:name:object:", v7, sel__handleAccessoryIsReachable_, CFSTR("HMDAccessoryIsReachableNotification"), 0);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDBackgroundOperationManagerDataSource notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("HMDAccessoryIsReachableNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)HMDBackgroundOperationAccessoryManagerDataSource;
  -[HMDBackgroundOperationAccessoryManagerDataSource dealloc](&v4, sel_dealloc);
}

- (id)values
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[HMDBackgroundOperationManagerDataSource owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __58__HMDBackgroundOperationAccessoryManagerDataSource_values__block_invoke;
  v12 = &unk_24E787690;
  v13 = v5;
  v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v9);
  v14 = CFSTR("visibleAccessories");
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_handleAccessoryIsReachable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDBackgroundOperationAccessoryManagerDataSource *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory became reachable: %@.", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDBackgroundOperationManagerDataSource notifyDataSourceChanged](v9, "notifyDataSourceChanged");

}

void __58__HMDBackgroundOperationAccessoryManagerDataSource_values__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isReachable"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

+ (id)name
{
  return CFSTR("accessoryManager");
}

@end
