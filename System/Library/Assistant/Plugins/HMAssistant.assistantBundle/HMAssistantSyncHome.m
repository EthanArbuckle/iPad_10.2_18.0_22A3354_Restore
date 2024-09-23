@implementation HMAssistantSyncHome

- (HMAssistantSyncHome)init
{
  HMAssistantSyncHome *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMAssistantSyncHome;
  v2 = -[HMAssistantSyncHome init](&v9, sel_init);
  if (v2)
  {
    HMDispatchQueueNameString();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BE3F248], "setDefaultValue:forPreferenceKey:", MEMORY[0x24BDBD1C8], CFSTR("dropHomeNamesFromSyncData"));
  }
  return v2;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  void *v5;
  HMAssistantSyncHome *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x219A0FE78]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    mach_absolute_time();
    v9 = UpTicksToMilliseconds();
    v11 = 138543618;
    v12 = v8;
    v13 = 2048;
    v14 = v9 - -[HMAssistantSyncHome fetchHomeConfigurationStartTime](v6, "fetchHomeConfigurationStartTime");
    _os_log_impl(&dword_2176CA000, v7, OS_LOG_TYPE_INFO, "%{public}@Home manager did update homes in %llu milliseconds", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMAssistantSyncHome waitGroup](v6, "waitGroup");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v10);

}

- (void)dealloc
{
  void *v3;
  HMAssistantSyncHome *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x219A0FE78](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2176CA000, v5, OS_LOG_TYPE_INFO, "%{public}@Indicating syncDidEnd from dealloc", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMAssistantSyncHome syncDidEnd](v4, "syncDidEnd");
  v7.receiver = v4;
  v7.super_class = (Class)HMAssistantSyncHome;
  -[HMAssistantSyncHome dealloc](&v7, sel_dealloc);
}

- (BOOL)shouldSyncForAnchor:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  getAssistantConfigurationSnapshot();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1;
}

- (id)currentSyncSnapshot
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BE09380]);
  getAssistantConfigurationSnapshot();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnchor:", v3);

  return v2;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  __CFString *v12;
  __CFString *v13;
  dispatch_group_t v14;
  __CFString *v15;
  void *v16;
  HMAssistantSyncHome *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  dispatch_time_t v30;
  intptr_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  id v49;
  __CFString *v50;
  _QWORD block[5];
  _QWORD v52[4];
  id v53;
  _QWORD *v54;
  _QWORD *v55;
  id v56;
  id location;
  _QWORD v58[5];
  id v59;
  _QWORD v60[5];
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  __CFString *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  __CFString *v69;
  __int16 v70;
  __CFString *v71;
  __int16 v72;
  int64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v50 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a6;
  v49 = a7;
  if ((objc_msgSend(CFSTR("com.apple.homekit.name"), "isEqualToString:", v13) & 1) != 0)
  {
    -[HMAssistantSyncHome syncDidEnd](self, "syncDidEnd");
    v14 = dispatch_group_create();
    -[HMAssistantSyncHome setWaitGroup:](self, "setWaitGroup:", v14);

    objc_msgSend(MEMORY[0x24BDD7838], "defaultPrivateConfiguration");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString setOptions:](v15, "setOptions:", 34397);
    v16 = (void *)MEMORY[0x219A0FE78](-[__CFString setCachePolicy:](v15, "setCachePolicy:", 3));
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v19;
      v64 = 2112;
      v65 = v15;
      _os_log_impl(&dword_2176CA000, v18, OS_LOG_TYPE_INFO, "%{public}@Started initialization of home manager with configuration %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    mach_absolute_time();
    -[HMAssistantSyncHome setFetchHomeConfigurationStartTime:](v17, "setFetchHomeConfigurationStartTime:", UpTicksToMilliseconds());
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD76D8]), "initWithConfiguration:", v15);
    -[HMAssistantSyncHome setHomeManager:](v17, "setHomeManager:", v20);

    -[HMAssistantSyncHome waitGroup](v17, "waitGroup");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v21);

    -[HMAssistantSyncHome homeManager](v17, "homeManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", v17);

    if ((objc_msgSend(MEMORY[0x24BDD7600], "areAnyAccessoriesConfigured") & 1) != 0)
    {
      if (-[HMAssistantSyncHome shouldSyncForAnchor:](v17, "shouldSyncForAnchor:", v50))
      {
        v60[0] = 0;
        v60[1] = v60;
        v60[2] = 0x3032000000;
        v60[3] = sub_2176CC96C;
        v60[4] = sub_2176CC97C;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v61 = (id)objc_claimAutoreleasedReturnValue();
        v58[0] = 0;
        v58[1] = v58;
        v58[2] = 0x3032000000;
        v58[3] = sub_2176CC96C;
        v58[4] = sub_2176CC97C;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v59 = (id)objc_claimAutoreleasedReturnValue();
        getLastSyncedAssistantConfigurationVersion();
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x219A0FE78]();
        HMFGetOSLogHandle();
        v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v63 = v26;
          v64 = 2112;
          v65 = v23;
          v66 = 2112;
          v67 = v50;
          v68 = 2112;
          v69 = v12;
          v70 = 2112;
          v71 = v13;
          v72 = 2048;
          v73 = a5;
          _os_log_impl(&dword_2176CA000, v25, OS_LOG_TYPE_INFO, "%{public}@lastSyncedVersion %@  beginAnchor is %@  validity %@  key %@  count %tu", buf, 0x3Eu);

        }
        objc_autoreleasePoolPop(v24);
        -[HMAssistantSyncHome setDone:](v17, "setDone:", 0);
        objc_initWeak(&location, v17);
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7600]), "initWithNoValidation");
        -[HMAssistantSyncHome waitGroup](v17, "waitGroup");
        v27 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v27);

        v28 = MEMORY[0x24BDAC760];
        v52[0] = MEMORY[0x24BDAC760];
        v52[1] = 3221225472;
        v52[2] = sub_2176CC984;
        v52[3] = &unk_24D7EFC98;
        objc_copyWeak(&v56, &location);
        v54 = v60;
        v55 = v58;
        v53 = v49;
        objc_msgSend(v48, "requestSiriSyncDataWithValidity:completion:", v12, v52);
        -[HMAssistantSyncHome waitGroup](v17, "waitGroup");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = dispatch_time(0, 42000000000);
        v31 = dispatch_group_wait(v29, v30);

        if (v31)
        {
          v32 = (void *)MEMORY[0x219A0FE78]();
          HMFGetOSLogHandle();
          v33 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v63 = v34;
            _os_log_impl(&dword_2176CA000, v33, OS_LOG_TYPE_INFO, "%{public}@Timed out waiting for homed", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v32);
        }
        -[HMAssistantSyncHome queue](v17, "queue");
        v35 = objc_claimAutoreleasedReturnValue();
        block[0] = v28;
        block[1] = 3221225472;
        block[2] = sub_2176CCBB0;
        block[3] = &unk_24D7EFCC0;
        block[4] = v17;
        dispatch_async(v35, block);

        objc_destroyWeak(&v56);
        objc_destroyWeak(&location);

        _Block_object_dispose(v58, 8);
        _Block_object_dispose(v60, 8);

        goto LABEL_26;
      }
      v43 = (void *)MEMORY[0x219A0FE78]();
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        getAssistantConfigurationSnapshot();
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v63 = v46;
        v64 = 2112;
        v65 = v50;
        v66 = 2112;
        v67 = v47;
        _os_log_impl(&dword_2176CA000, v44, OS_LOG_TYPE_INFO, "%{public}@lastSyncedSnapshot %@ at same as assistantConfigurationSnapshot %@ - skipping sync...", buf, 0x20u);

      }
    }
    else
    {
      if (-[HMAssistantSyncHome shouldSyncForAnchor:](v17, "shouldSyncForAnchor:", v12))
      {
        getAssistantConfigurationSnapshot();
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x219A0FE78]();
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v42;
          v64 = 2112;
          v65 = v12;
          v66 = 2112;
          v67 = v39;
          _os_log_impl(&dword_2176CA000, v41, OS_LOG_TYPE_INFO, "%{public}@lastSyncValidity '%@' different from assistantConfigurationSnapshot %@ - reset all data so that full sync attempted next time", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v40);
        objc_msgSend(v49, "resetWithValidity:", v39);

      }
      v43 = (void *)MEMORY[0x219A0FE78]();
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v45;
        _os_log_impl(&dword_2176CA000, v44, OS_LOG_TYPE_INFO, "%{public}@No accessories configured - skipping sync request from Siri client...", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v43);
LABEL_26:

    goto LABEL_27;
  }
  v36 = (void *)MEMORY[0x219A0FE78]();
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v63 = v38;
    v64 = 2112;
    v65 = v13;
    v66 = 2112;
    v67 = CFSTR("com.apple.homekit.name");
    _os_log_impl(&dword_2176CA000, v37, OS_LOG_TYPE_INFO, "%{public}@Incoming key '%@' does not match plug-in key '%@'", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v36);
LABEL_27:

}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[HMAssistantSyncHome entities](self, "entities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {

    goto LABEL_7;
  }
  -[HMAssistantSyncHome finalAnchor](self, "finalAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v19);

  if ((v9 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(v6, "setObject:", 0);
    objc_msgSend(v6, "setPostAnchor:", v19);
    goto LABEL_8;
  }
  if (v19)
  {
    -[HMAssistantSyncHome anchors](self, "anchors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObject:", v19);

    if (v11 < 0x7FFFFFFFFFFFFFFELL)
    {
      v12 = v11 + 1;
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v12 = 0;
LABEL_10:
  -[HMAssistantSyncHome anchors](self, "anchors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPostAnchor:", v14);

  -[HMAssistantSyncHome entities](self, "entities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v12 < v16)
  {
    -[HMAssistantSyncHome entities](self, "entities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:", v18);

  }
LABEL_8:

}

- (void)syncDidEnd
{
  -[HMAssistantSyncHome setFinalAnchor:](self, "setFinalAnchor:", 0);
  -[HMAssistantSyncHome setAnchors:](self, "setAnchors:", 0);
  -[HMAssistantSyncHome setEntities:](self, "setEntities:", 0);
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_anchors, a3);
}

- (NSArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_storeStrong((id *)&self->_entities, a3);
}

- (NSString)finalAnchor
{
  return self->_finalAnchor;
}

- (void)setFinalAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_finalAnchor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (unint64_t)fetchHomeConfigurationStartTime
{
  return self->_fetchHomeConfigurationStartTime;
}

- (void)setFetchHomeConfigurationStartTime:(unint64_t)a3
{
  self->_fetchHomeConfigurationStartTime = a3;
}

- (OS_dispatch_group)waitGroup
{
  return self->_waitGroup;
}

- (void)setWaitGroup:(id)a3
{
  objc_storeStrong((id *)&self->_waitGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitGroup, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_finalAnchor, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_anchors, 0);
}

+ (id)logCategory
{
  if (qword_253E64B70 != -1)
    dispatch_once(&qword_253E64B70, &unk_24D7EFD00);
  return (id)qword_253E64B78;
}

@end
