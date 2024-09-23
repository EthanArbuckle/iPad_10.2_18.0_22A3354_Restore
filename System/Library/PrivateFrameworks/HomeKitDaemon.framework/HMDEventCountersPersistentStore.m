@implementation HMDEventCountersPersistentStore

- (HMDEventCountersPersistentStore)initWithPersistentStore:(id)a3
{
  id v4;
  HMDEventCountersPersistentStore *v5;
  HMDEventCountersPersistentStore *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDEventCountersPersistentStore;
  v5 = -[HMDEventCountersPersistentStore init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_persistentStore, v4);

  return v6;
}

- (void)archiveDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("HMDEventCountersArchivedEventCountersKey"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("HMDEventCountersArchivedEventCountersModifiedDateKey"));

  v8 = (id)eventCountersDataStorePath;
  -[HMDEventCountersPersistentStore persistentStore](self, "persistentStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "archiveDictionary:withPath:forKey:", v11, v8, CFSTR("HMDEventCountersDataStoreKey"));

}

- (id)unarchive
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDEventCountersPersistentStore *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v3 = (id)eventCountersDataStoreLegacyPath;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v6, "removeItemAtPath:error:", v3, &v25);

  }
  v7 = (id)eventCountersDataStorePath;
  +[HMDEventCountersManager allowedSpecifierClasses](HMDEventCountersManager, "allowedSpecifierClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDEventCountersPersistentStore persistentStore](self, "persistentStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unarchiveDictionaryWithPath:allowedClasses:forKey:", v7, v10, CFSTR("HMDEventCountersDataStoreKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Unarchived event counters: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HMDEventCountersArchivedEventCountersModifiedDateKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v18);
    v21 = v20;

    if (v21 <= 86400.0)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HMDEventCountersArchivedEventCountersKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }

  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Archived event counters not found", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }
  v23 = 0;
LABEL_13:

  return v23;
}

- (HMDPersistentStore)persistentStore
{
  return (HMDPersistentStore *)objc_loadWeakRetained((id *)&self->_persistentStore);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistentStore);
}

@end
