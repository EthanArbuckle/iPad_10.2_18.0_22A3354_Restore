@implementation HMMTRPerControllerStorage

- (HMMTRPerControllerStorage)initWithQueue:(id)a3 fabric:(id)a4
{
  id v7;
  id v8;
  HMMTRPerControllerStorage *v9;
  HMMTRPerControllerStorage *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  HMMTRDeviceControllerStorageDataSource *privateDataSource;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMMTRPerControllerStorage;
  v9 = -[HMMTRPerControllerStorage init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_fabric, v8);
    objc_storeStrong((id *)&v10->_queue, a3);
    WeakRetained = objc_loadWeakRetained((id *)&v10->_fabric);
    objc_msgSend(WeakRetained, "currentDeviceNodeData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "privateDataSource");
    v13 = objc_claimAutoreleasedReturnValue();
    privateDataSource = v10->_privateDataSource;
    v10->_privateDataSource = (HMMTRDeviceControllerStorageDataSource *)v13;

  }
  return v10;
}

- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v9 = a4;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[HMMTRPerControllerStorage privateDataSource](self, "privateDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __84__HMMTRPerControllerStorage_controller_removeValueForKey_securityLevel_sharingType___block_invoke;
  v14[3] = &unk_250F23E68;
  v16 = &v17;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "removeValueForKey:completion:", v9, v14);

  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v11) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v11;
}

- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  HMMTRPerControllerStorage *v20;
  NSObject *v21;
  void *v22;
  _QWORD v24[4];
  NSObject *v25;
  _BYTE *v26;
  id v27;
  _BYTE buf[24];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v27;
  if (v13)
  {
    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v29) = 0;
    -[HMMTRPerControllerStorage privateDataSource](self, "privateDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __84__HMMTRPerControllerStorage_controller_storeValue_forKey_securityLevel_sharingType___block_invoke;
    v24[3] = &unk_250F23E68;
    v26 = buf;
    v17 = v15;
    v25 = v17;
    objc_msgSend(v16, "setValue:forKey:completion:", v13, v12, v24);

    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    v18 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v29 = v14;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive requested value for key %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return v18;
}

- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMMTRPerControllerStorage *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMMTRPerControllerStorage privateDataSource](self, "privateDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD1620];
    MTRDeviceControllerStorageClasses();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v13, v11, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;

    if (!v14)
    {
      v16 = (void *)MEMORY[0x242656984]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v19;
        v24 = 2112;
        v25 = v9;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive value for key %@ with error %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)valuesForController:(id)a3 securityLevel:(unint64_t)a4 sharingType:(unint64_t)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  HMMTRPerControllerStorage *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMMTRPerControllerStorage *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *context;
  id v32;
  void *v33;
  HMMTRPerControllerStorage *v34;
  uint64_t v35;
  id obj;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  context = (void *)MEMORY[0x242656984]();
  v34 = self;
  -[HMMTRPerControllerStorage privateDataSource](self, "privateDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeyValuePairs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  v33 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    v11 = 0x24BDD1000uLL;
    do
    {
      v12 = 0;
      v35 = v9;
      do
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(v11 + 1568);
        MTRDeviceControllerStorageClasses();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v16, v14, &v38);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v38;

        if (v17)
        {
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v17, v13);
        }
        else
        {
          v19 = v10;
          v20 = (void *)MEMORY[0x242656984]();
          v21 = v34;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v44 = v23;
            v45 = 2112;
            v46 = v13;
            v47 = 2112;
            v48 = v18;
            _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive value for key %@ with error %@", buf, 0x20u);

            v7 = v33;
          }

          objc_autoreleasePoolPop(v20);
          v10 = v19;
          v11 = 0x24BDD1000;
          v9 = v35;
        }

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v9);
  }

  v24 = (void *)MEMORY[0x242656984]();
  v25 = v34;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v37, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v27;
    v45 = 2112;
    v46 = v28;
    _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched %@ key-value pairs from local storage", buf, 0x16u);

    v7 = v33;
  }

  objc_autoreleasePoolPop(v24);
  objc_autoreleasePoolPop(context);
  v29 = (void *)objc_msgSend(v37, "copy");

  return v29;
}

- (BOOL)controller:(id)a3 storeValues:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMMTRPerControllerStorage *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  void *v24;
  HMMTRPerControllerStorage *v25;
  NSObject *v26;
  void *v27;
  id v29;
  void *context;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  _BYTE *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE buf[24];
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x242656984]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v7, "allKeys");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v36);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v36;
        if (!v14)
        {
          v24 = (void *)MEMORY[0x242656984]();
          v25 = self;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v27;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v12;
            *(_WORD *)&buf[22] = 2112;
            v42 = v15;
            _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive requested value for key %@ with error %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v24);

          v23 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v14, v12);

      }
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = (void *)MEMORY[0x242656984]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v20;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating %@ key-value pairs in local storage", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v42) = 0;
  -[HMMTRPerControllerStorage privateDataSource](v17, "privateDataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __78__HMMTRPerControllerStorage_controller_storeValues_securityLevel_sharingType___block_invoke;
  v33[3] = &unk_250F23E68;
  v35 = buf;
  v8 = v21;
  v34 = v8;
  objc_msgSend(v22, "setKeyValuePairs:completion:", v32, v33);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
LABEL_15:

  objc_autoreleasePoolPop(context);
  return v23;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRPerControllerStorage fabric](self, "fabric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRPerControllerStorage fabric](self, "fabric");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("FabricID"), v6);
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (HMMTRFabric)fabric
{
  return (HMMTRFabric *)objc_loadWeakRetained((id *)&self->_fabric);
}

- (void)setFabric:(id)a3
{
  objc_storeWeak((id *)&self->_fabric, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HMMTRDeviceControllerStorageDataSource)privateDataSource
{
  return self->_privateDataSource;
}

- (void)setPrivateDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_fabric);
}

void __78__HMMTRPerControllerStorage_controller_storeValues_securityLevel_sharingType___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__HMMTRPerControllerStorage_controller_storeValue_forKey_securityLevel_sharingType___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__HMMTRPerControllerStorage_controller_removeValueForKey_securityLevel_sharingType___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_1586 != -1)
    dispatch_once(&logCategory__hmf_once_t6_1586, &__block_literal_global_1587);
  return (id)logCategory__hmf_once_v7_1588;
}

void __40__HMMTRPerControllerStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_1588;
  logCategory__hmf_once_v7_1588 = v0;

}

@end
