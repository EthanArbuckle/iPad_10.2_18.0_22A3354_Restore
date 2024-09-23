@implementation ASDTDeviceManager

+ (ASDTDeviceManager)deviceManagerWithConfig:(id)a3 withDelegate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "asdtDeviceManager")), "initWithConfig:withDelegate:", v5, v6);
  objc_msgSend(v7, "configureDevices");

  return (ASDTDeviceManager *)v7;
}

- (ASDTDeviceManager)initWithConfig:(id)a3 withDelegate:(id)a4
{
  id v6;
  id v7;
  ASDTDeviceManager *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  ASDTDeviceManager *v41;
  void *v42;
  uint64_t v43;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD block[4];
  id v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)ASDTDeviceManager;
  v8 = -[ASDTDeviceList init](&v52, sel_init);
  if (!v8)
    goto LABEL_23;
  objc_msgSend(v6, "asdtName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setName:](v8, "setName:", v9);

  -[ASDTDeviceManager name](v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = v10 == 0;

  if ((_DWORD)v9)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager setName:](v8, "setName:", v12);

  }
  -[ASDTDeviceManager setConfiguration:](v8, "setConfiguration:", v6);
  -[ASDTDeviceManager setDelegate:](v8, "setDelegate:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ASDTDeviceManager setPlugin:](v8, "setPlugin:", v7);
  -[ASDTDeviceManager configuration](v8, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "asdtDevices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "count");
  v16 = objc_msgSend(v6, "asdtManagerAudioObjectMaxCount");
  if ((_DWORD)v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTDeviceManager name](v8, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = v17;
      v55 = 1024;
      LODWORD(v56) = v16;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Setting maximum number of objects to %u.", buf, 0x12u);

    }
    -[ASDTDeviceManager plugin](v8, "plugin");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaximumNumberOfObjects:", v16);

  }
  -[ASDTDeviceManager setVerboseDeviceLogging:](v8, "setVerboseDeviceLogging:", objc_msgSend(v6, "asdtManagerVerboseLogging"));
  objc_msgSend(v6, "asdtManagerRunningLogPeriod");
  -[ASDTDeviceManager setRunningLogPeriod:](v8, "setRunningLogPeriod:");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTDeviceManager name](v8, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager runningLogPeriod](v8, "runningLogPeriod");
    *(_DWORD *)buf = 138412546;
    v54 = v19;
    v55 = 2048;
    v56 = v20;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Running log period: %1.1lf", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setDeviceFactories:](v8, "setDeviceFactories:", v21);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setMatchedDeviceFactories:](v8, "setMatchedDeviceFactories:", v22);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setDeviceInitStatus:](v8, "setDeviceInitStatus:", v23);

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setDevicesRunning:](v8, "setDevicesRunning:", v24);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setIoServiceDependencies:](v8, "setIoServiceDependencies:", v25);

  -[ASDTDeviceManager generateUnderlyingDeviceUIDsFromConfig:](v8, "generateUnderlyingDeviceUIDsFromConfig:", v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setUnderlyingDeviceUIDs:](v8, "setUnderlyingDeviceUIDs:", v26);

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INTERACTIVE, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = dispatch_queue_create("com.apple.AudioServerDriverTransports.ASDTDeviceManager.initqueue", v27);
  -[ASDTDeviceManager setInitializingQueue:](v8, "setInitializingQueue:", v28);

  +[ASDTCondition conditionWithName:](ASDTCondition, "conditionWithName:", CFSTR("com.apple.AudioServerDriverTransports.ASDTDeviceManager.initcond"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setInitializingCond:](v8, "setInitializingCond:", v29);

  +[ASDTCondition conditionWithName:](ASDTCondition, "conditionWithName:", CFSTR("com.apple.AudioServerDriverTransports.ASDTDeviceManager.threadCond"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager setThreadCond:](v8, "setThreadCond:", v30);

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", v8, sel_threadLoop_, 0);
  -[ASDTDeviceManager setThread:](v8, "setThread:", v31);

  -[ASDTDeviceManager thread](v8, "thread");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setName:", CFSTR("com.apple.AudioServerDriverTransports.ASDTDeviceManager.thread"));

  -[ASDTDeviceManager thread](v8, "thread");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setQualityOfService:", 33);

  -[ASDTDeviceManager deviceInitStatus](v8, "deviceInitStatus");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[ASDTDeviceManager devicesRunning](v8, "devicesRunning");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      -[ASDTDeviceManager thread](v8, "thread");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        -[ASDTDeviceManager threadCond](v8, "threadCond");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          -[ASDTDeviceManager deviceFactories](v8, "deviceFactories");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            -[ASDTDeviceManager matchedDeviceFactories](v8, "matchedDeviceFactories");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
            {
              -[ASDTDeviceManager initializingQueue](v8, "initializingQueue");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                -[ASDTDeviceManager initializingCond](v8, "initializingCond");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (v47)
                {
                  -[ASDTDeviceManager underlyingDeviceUIDs](v8, "underlyingDeviceUIDs");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v46)
                  {
                    -[ASDTDeviceManager ioServiceDependencies](v8, "ioServiceDependencies");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = v39 == 0;

                    if (!v45)
                    {
                      objc_initWeak((id *)buf, v8);
                      -[ASDTDeviceManager initializingQueue](v8, "initializingQueue");
                      v40 = objc_claimAutoreleasedReturnValue();
                      block[0] = MEMORY[0x24BDAC760];
                      block[1] = 3221225472;
                      block[2] = __49__ASDTDeviceManager_initWithConfig_withDelegate___block_invoke;
                      block[3] = &unk_250842128;
                      objc_copyWeak(&v51, (id *)buf);
                      dispatch_async(v40, block);

                      objc_destroyWeak(&v51);
                      objc_destroyWeak((id *)buf);

LABEL_23:
                      v41 = v8;
                      goto LABEL_35;
                    }
                    goto LABEL_32;
                  }

                }
              }

            }
          }

        }
      }

    }
  }
LABEL_32:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTDeviceManager name](v8, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager initWithConfig:withDelegate:].cold.1(v42, (uint64_t)buf, v43);
  }

  v41 = 0;
LABEL_35:

  return v41;
}

void __49__ASDTDeviceManager_initWithConfig_withDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "waitForThreadStart");

}

- (BOOL)addAudioDeviceWithCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ASDTDeviceManager *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASDTDeviceManager threadCond](self, "threadCond");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("powerState"), 1, 0);
  -[ASDTDeviceManager threadCond](self, "threadCond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  v15.receiver = self;
  v15.super_class = (Class)ASDTDeviceManager;
  v7 = -[ASDTDeviceList addAudioDeviceWithCheck:](&v15, sel_addAudioDeviceWithCheck_, v4);
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTDeviceManager name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = v8;
      v18 = 2048;
      v19 = self;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@(%p): Added %@ '%@'", buf, 0x2Au);

    }
    objc_msgSend(v4, "logDiagnostics:", -[ASDTDeviceManager verboseDeviceLogging](self, "verboseDeviceLogging"));
  }
  else
  {
    -[ASDTDeviceManager threadCond](self, "threadCond");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lock");

    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("powerState"));
    -[ASDTDeviceManager threadCond](self, "threadCond");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlock");

  }
  return v7;
}

- (id)generateUnderlyingDeviceUIDsFromConfig:(id)a3
{
  id v3;
  unsigned int v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "asdtUnderlyingDeviceUID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

- (void)removeAudioDevice:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4
    && (-[ASDTDeviceList audioDevices](self, "audioDevices"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        (v6 & 1) != 0))
  {
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lock");

    -[ASDTDeviceManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDTDeviceManager name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "deviceUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v11;
        v35 = 2112;
        v36 = v12;
        _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Unpublishing '%@'.", buf, 0x16u);

      }
      -[ASDTDeviceManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeAudioDevice:", v4);

    }
    -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "cleanup");
      -[ASDTDeviceManager deviceFactories](self, "deviceFactories");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObject:", v16);

      -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", v19);

    }
    -[ASDTDeviceManager deviceInitStatus](self, "deviceInitStatus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v21);

    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unlock");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ASDTDeviceManager threadCond](self, "threadCond");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lock");

      -[ASDTDeviceManager devicesRunning](self, "devicesRunning");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "containsObject:", v4);

      if (v25)
      {
        -[ASDTDeviceManager devicesRunning](self, "devicesRunning");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeObject:", v4);

      }
      objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("powerState"));
      -[ASDTDeviceManager threadCond](self, "threadCond");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "unlock");

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTDeviceManager name](self, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v28;
      v35 = 2112;
      v36 = v29;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Removing '%@'.", buf, 0x16u);

    }
    v32.receiver = self;
    v32.super_class = (Class)ASDTDeviceManager;
    -[ASDTDeviceList removeAudioDevice:](&v32, sel_removeAudioDevice_, v4);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[ASDTDeviceManager name](self, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager removeAudioDevice:].cold.1((uint64_t)v4, v30, v31, buf);
  }

}

- (void)removeAudioDevices:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  objc_super v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v4 = (void *)MEMORY[0x24BDBCEF0];
  -[ASDTDeviceList audioDevices](self, "audioDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v43);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "intersectSet:", v6);

  if (objc_msgSend(v42, "count"))
  {
    v7 = objc_msgSend(v42, "count");
    if (v7 != objc_msgSend(v43, "count"))
    {
      objc_msgSend(v42, "allObjects");
      v8 = objc_claimAutoreleasedReturnValue();

      v43 = (id)v8;
    }
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lock");

    -[ASDTDeviceManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v11;
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v43);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "intersectSet:", v13);

      if (objc_msgSend(v12, "count"))
      {
        -[ASDTDeviceManager delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeAudioDevices:", v15);

      }
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v43;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v51;
      v18 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v51 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "deviceUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v23, "cleanup");
            -[ASDTDeviceManager deviceFactories](self, "deviceFactories");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeObject:", v23);

            -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "deviceUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "removeObjectForKey:", v26);

          }
          -[ASDTDeviceManager deviceInitStatus](self, "deviceInitStatus");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "deviceUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "removeObjectForKey:", v28);

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            -[ASDTDeviceManager name](self, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "deviceUID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v57 = v29;
            v58 = 2112;
            v59 = v30;
            _os_log_impl(&dword_236CEE000, v18, OS_LOG_TYPE_DEFAULT, "%@: Removing '%@'.", buf, 0x16u);

          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v16);
    }

    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "unlock");

    -[ASDTDeviceManager threadCond](self, "threadCond");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lock");

    -[ASDTDeviceManager devicesRunning](self, "devicesRunning");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", obj);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "minusSet:", v34);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v35 = obj;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v35);
          v39 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v39, "removeObserver:forKeyPath:", self, CFSTR("powerState"));
        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v36);
    }

    -[ASDTDeviceManager threadCond](self, "threadCond");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "unlock");

    v45.receiver = self;
    v45.super_class = (Class)ASDTDeviceManager;
    -[ASDTDeviceList removeAudioDevices:](&v45, sel_removeAudioDevices_, v35);

    v43 = v35;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[ASDTDeviceManager name](self, "name");
    objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager removeAudioDevices:].cold.1();
  }

}

- (id)factoryForDeviceUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)allDeviceFactories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[ASDTDeviceManager deviceFactories](self, "deviceFactories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return (NSArray *)v5;
}

- (void)buildAndInitializeDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(v4, "deviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8 || v8 == v4)
  {
    if (!v8)
    {
      -[ASDTDeviceManager setNumDevicesToInitialize:](self, "setNumDevicesToInitialize:", -[ASDTDeviceManager numDevicesToInitialize](self, "numDevicesToInitialize") + 1);
      -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v4, v5);

    }
    objc_msgSend(v4, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_8;
    if (objc_msgSend(v4, "deviceIsBuilding"))
    {
      -[ASDTDeviceManager initializingCond](self, "initializingCond");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "unlock");

      goto LABEL_17;
    }
    objc_msgSend(v4, "setDeviceIsBuilding:", 1);
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unlock");

    LODWORD(v18) = objc_msgSend(v4, "buildDevice");
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lock");

    objc_msgSend(v4, "setDeviceIsBuilding:", 0);
    if (!(_DWORD)v18)
      goto LABEL_14;
    objc_msgSend(v4, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
LABEL_8:
      -[ASDTDeviceManager initializingCond](self, "initializingCond");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unlock");

      -[ASDTDeviceList audioDevices](self, "audioDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "containsObject:", v14);

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v4, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTDeviceList addAudioDevice:](self, "addAudioDevice:", v16);

        -[ASDTDeviceManager initializeDevice:](self, "initializeDevice:", v4);
      }
    }
    else
    {
LABEL_14:
      objc_msgSend(v4, "config");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cleanup");
      -[ASDTDeviceManager deviceFactories](self, "deviceFactories");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObject:", v4);

      -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObjectForKey:", v5);

      -[ASDTDeviceManager initializingCond](self, "initializingCond");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "unlock");

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTDeviceManager name](self, "name");
        objc_claimAutoreleasedReturnValue();
        -[ASDTDeviceManager buildAndInitializeDevice:].cold.1();
      }
      -[ASDTDeviceManager deviceConfigurationFailed:](self, "deviceConfigurationFailed:", v21);

    }
  }
  else
  {
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTDeviceManager name](self, "name");
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager buildAndInitializeDevice:].cold.2();
    }
  }
LABEL_17:

}

- (void)initializeDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *);
  void *v16;
  ASDTDeviceManager *v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ASDTDeviceManager deviceInitStatus](self, "deviceInitStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[ASDTDeviceManager deviceInitStatus](self, "deviceInitStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", &unk_25084A870, v10);

    objc_initWeak(&location, self);
    -[ASDTDeviceManager initializingQueue](self, "initializingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __38__ASDTDeviceManager_initializeDevice___block_invoke;
    v16 = &unk_250842150;
    v17 = self;
    v18 = v4;
    objc_copyWeak(&v19, &location);
    dispatch_async(v11, &v13);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  -[ASDTDeviceManager initializingCond](self, "initializingCond", v13, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

}

void __38__ASDTDeviceManager_initializeDevice___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "name");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "deviceUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v2;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Initializing '%@'", (uint8_t *)&v6, 0x16u);

  }
  if (objc_msgSend(a1[5], "initializeDevice"))
    v4 = 2;
  else
    v4 = 1;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "deviceInitialized:withStatus:", a1[5], v4);

}

- (void)deviceInitialized:(id)a3 withStatus:(int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE v21[24];
  uint64_t v22;

  v4 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  if (!-[ASDTDeviceManager numDevicesToInitialize](self, "numDevicesToInitialize"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTDeviceManager name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager deviceInitialized:withStatus:].cold.2(v9, (uint64_t)v21, v10);
    }
    if (!-[ASDTDeviceManager numDevicesToInitialize](self, "numDevicesToInitialize"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager name](self, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTDeviceManager.mm"), 422, CFSTR("%@: No devices to initialize!"), v20);

    }
  }
  -[ASDTDeviceManager setNumDevicesToInitialize:](self, "setNumDevicesToInitialize:", -[ASDTDeviceManager numDevicesToInitialize](self, "numDevicesToInitialize") - 1);
  -[ASDTDeviceManager deviceInitStatus](self, "deviceInitStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, v13);

  if ((_DWORD)v4 == 1)
  {
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unlock");

    objc_msgSend(v7, "publishDevice");
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lock");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTDeviceManager name](self, "name");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager deviceInitialized:withStatus:].cold.1();
    }
    objc_msgSend(v7, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager deviceInitializationFailed:](self, "deviceInitializationFailed:", v15);
  }

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "broadcast");

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

  objc_msgSend(v7, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceList notifyOfInterest:forDevice:](self, "notifyOfInterest:forDevice:", 2, v18);

}

- (void)publishDeviceLocked:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "deviceUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTDeviceManager name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager publishDeviceLocked:].cold.2(v7, (uint64_t)v27, v8);
    }
    objc_msgSend(v5, "deviceUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager name](self, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTDeviceManager.mm"), 441, CFSTR("%@: Bad device factory."), v22);

    }
  }
  objc_msgSend(v5, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTDeviceManager name](self, "name");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager publishDeviceLocked:].cold.1();
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTDeviceManager.mm"), 445, CFSTR("%@: Device factory for '%@' missing device object."), v13, v14);

  }
  -[ASDTDeviceManager delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "audioDevices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v11);

  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "deviceUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Publishing %@ (%@)", buf, 0x16u);

    }
    -[ASDTDeviceManager delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAudioDevice:", v11);

  }
}

- (void)publishDevice:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  -[ASDTDeviceManager publishDeviceLocked:](self, "publishDeviceLocked:", v6);
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (void)waitForInitializationWithTimeoutUs:(unsigned int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    ASDTTime::futureUSecs(*(ASDTTime **)&a3, (uint64_t)&v27);
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lock");

    while (-[ASDTDeviceManager numDevicesToInitialize](self, "numDevicesToInitialize"))
    {
LABEL_14:
      -[ASDTDeviceManager initializingCond](self, "initializingCond");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v27;
      v22 = v28;
      v15 = objc_msgSend(v14, "waitUntilTime:", &v21);

      if ((v15 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          -[ASDTDeviceManager waitForInitializationWithTimeoutUs:].cold.1(self);
        v16 = 0;
        goto LABEL_19;
      }
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[ASDTDeviceList audioDevices](self, "audioDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[ASDTDeviceManager deviceInitStatus](self, "deviceInitStatus");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deviceUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "unsignedIntValue");

          if (!v13)
          {

            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v6)
          continue;
        break;
      }
    }

    v16 = 1;
LABEL_19:
    -[ASDTDeviceManager initializingCond](self, "initializingCond");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unlock");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTDeviceManager name](self, "name");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = "some";
      if (v16)
        v20 = "all";
      *(_DWORD *)buf = 138412546;
      v30 = v18;
      v31 = 2080;
      v32 = v20;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Done waiting for devices; %s initialized.",
        buf,
        0x16u);

    }
  }
}

- (void)waitForInitialization
{
  id v3;

  -[ASDTDeviceManager configuration](self, "configuration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager waitForInitializationWithTimeoutUs:](self, "waitForInitializationWithTimeoutUs:", objc_msgSend(v3, "asdtManagerInitializationWaitUs"));

}

- (void)configureDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  __int128 v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[ASDTDeviceManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asdtDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v49;
    v8 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v6 = 138412546;
    v38 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v10, "asdtDeviceUID", v38);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          +[ASDTAudioDeviceFactory forDeviceConfig:withManager:](ASDTAudioDeviceFactory, "forDeviceConfig:withManager:", v10, self);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[ASDTDeviceManager initializingCond](self, "initializingCond");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "lock");

            -[ASDTDeviceManager deviceFactories](self, "deviceFactories");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v12);

            -[ASDTDeviceManager initializingCond](self, "initializingCond");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "unlock");

          }
          else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            -[ASDTDeviceManager name](self, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v38;
            v55 = v21;
            v56 = 2112;
            v57 = v10;
            _os_log_error_impl(&dword_236CEE000, v8, OS_LOG_TYPE_ERROR, "%@: Failure creating factory for: %@", buf, 0x16u);

          }
LABEL_19:

          goto LABEL_20;
        }
        v16 = (void *)objc_msgSend(v10, "asdtSubclass");
        if ((objc_msgSend(v16, "conformsToProtocol:", &unk_25645D6F0) & 1) != 0)
        {
          objc_msgSend(v16, "ioServiceDependenciesForConfig:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            -[ASDTDeviceManager initializingCond](self, "initializingCond");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lock");

            -[ASDTDeviceManager ioServiceDependencies](self, "ioServiceDependencies");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObjectsFromArray:", v12);

            -[ASDTDeviceManager initializingCond](self, "initializingCond");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "unlock");

          }
          else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            -[ASDTDeviceManager name](self, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v38;
            v55 = v22;
            v56 = 2112;
            v57 = v10;
            _os_log_error_impl(&dword_236CEE000, v8, OS_LOG_TYPE_ERROR, "%@: Could not identify service dependencies for configuration: %@", buf, 0x16u);

          }
          goto LABEL_19;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          -[ASDTDeviceManager name](self, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v38;
          v55 = v20;
          v56 = 2112;
          v57 = v10;
          _os_log_error_impl(&dword_236CEE000, v8, OS_LOG_TYPE_ERROR, "%@: Could not identify required services for configuration: %@", buf, 0x16u);

        }
LABEL_20:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v5);
  }

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lock");

  -[ASDTDeviceManager deviceFactories](self, "deviceFactories");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTDeviceManager ioServiceDependencies](self, "ioServiceDependencies");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "unlock");

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = v25;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        if (objc_msgSend(v33, "checkDependencies"))
          -[ASDTDeviceManager buildAndInitializeDevice:](self, "buildAndInitializeDevice:", v33);
      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v30);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = v27;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * k), "addManagerDelegate:", self);
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v35);
  }

  -[ASDTDeviceManager waitForInitialization](self, "waitForInitialization");
}

- (void)ioServiceAvailable:(id)a3 withManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = a4;
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[ASDTDeviceManager ioServiceDependencies](self, "ioServiceDependencies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v8, "copy");

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v27;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_msgSend(v13, "ioServiceMatches:withManager:", v6, v29) & 1) != 0)
        {
          objc_msgSend(v6, "idValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[ASDTDeviceManager initializingCond](self, "initializingCond");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lock");

          -[ASDTDeviceManager matchedDeviceFactories](self, "matchedDeviceFactories");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[ASDTDeviceManager initializingCond](self, "initializingCond");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "unlock");

          if (v18)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              -[ASDTDeviceManager name](self, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v35 = v20;
              v36 = 2112;
              v37 = v15;
              _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Device with UID '%@' already matched.", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(v13, "configuration");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v21, "mutableCopy");

            objc_msgSend(v22, "setObject:forKey:", v15, CFSTR("DeviceUID"));
            +[ASDTAudioDeviceFactory forDeviceConfig:withManager:](ASDTAudioDeviceFactory, "forDeviceConfig:withManager:", v22, self);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              -[ASDTDeviceManager initializingCond](self, "initializingCond");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lock");

              -[ASDTDeviceManager deviceFactories](self, "deviceFactories");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v18);

              -[ASDTDeviceManager initializingCond](self, "initializingCond");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "unlock");

              -[ASDTDeviceManager buildAndInitializeDevice:](self, "buildAndInitializeDevice:", v18);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                -[ASDTDeviceManager name](self, "name");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v35 = v26;
                v36 = 2112;
                v37 = v22;
                _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failure creating factory for: %@", buf, 0x16u);

              }
              -[ASDTDeviceManager deviceConfigurationFailed:](self, "deviceConfigurationFailed:", v22);
            }

          }
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v10);
  }

}

- (void)terminateDevice:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "terminate");
  else
    -[ASDTDeviceManager removeAudioDevice:](self, "removeAudioDevice:", v4);

}

- (void)ioServiceWillTerminate:(id)a3 withManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  id location;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v5 = a3;
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  objc_msgSend(v5, "idValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceList getAudioDeviceWithUID:](self, "getAudioDeviceWithUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  if (v9)
  {
    -[ASDTDeviceManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "deviceUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Terminate %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASDTCondition conditionWithName:](ASDTCondition, "conditionWithName:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "lock");
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      objc_initWeak(&location, self);
      -[ASDTDeviceManager delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __56__ASDTDeviceManager_ioServiceWillTerminate_withManager___block_invoke;
      v19[3] = &unk_250842178;
      objc_copyWeak(&v23, &location);
      v20 = v9;
      v18 = v16;
      v21 = v18;
      v22 = &v25;
      objc_msgSend(v17, "requestConfigurationChangeForDevice:withBlock:", v20, v19);

      while (!*((_BYTE *)v26 + 24))
        objc_msgSend(v18, "wait");
      objc_msgSend(v18, "unlock");

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v25, 8);

    }
    else
    {
      -[ASDTDeviceManager terminateDevice:](self, "terminateDevice:", v9);
    }
  }

}

uint64_t __56__ASDTDeviceManager_ioServiceWillTerminate_withManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "terminateDevice:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "lock");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 40), "signal");
  return objc_msgSend(*(id *)(a1 + 40), "unlock");
}

- (void)deviceConfigurationFailed:(id)a3
{
  id v4;

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTDeviceManager name](self, "name");
    objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager deviceConfigurationFailed:].cold.1();
  }

}

- (void)deviceInitializationFailed:(id)a3
{
  id v4;

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTDeviceManager name](self, "name");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUID");
    objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager deviceInitializationFailed:].cold.1();
  }

}

- (BOOL)allowSystemSleep
{
  return 1;
}

- (void)systemWillSleep
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[ASDTDeviceList audioDevices](self, "audioDevices");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v36, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v19;
    v5 = MEMORY[0x24BDACB70];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = objc_msgSend(v7, "systemSleepPending");
          if (v8)
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              -[ASDTDeviceManager name](self, "name");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "deviceUID");
              v10 = objc_claimAutoreleasedReturnValue();
              v11 = (void *)v10;
              v12 = v8;
              if (v8 - 32 >= 0x5F)
                v12 = 32;
              *(_DWORD *)buf = 138413826;
              v23 = v9;
              v13 = BYTE1(v8);
              if (BYTE1(v8) - 32 >= 0x5F)
                v13 = 32;
              v24 = 1024;
              v25 = v8;
              v14 = BYTE2(v8);
              if (BYTE2(v8) - 32 >= 0x5F)
                v14 = 32;
              v26 = 1024;
              if ((v8 - 0x20000000) >> 24 >= 0x5F)
                v15 = 32;
              else
                v15 = HIBYTE(v8);
              v27 = v15;
              v28 = 1024;
              v29 = v14;
              v30 = 1024;
              v31 = v13;
              v32 = 1024;
              v33 = v12;
              v34 = 2112;
              v35 = v10;
              _os_log_error_impl(&dword_236CEE000, v5, OS_LOG_TYPE_ERROR, "%@: systemWillSleep: Received error %x (%c%c%c%c) from device '%@'.", buf, 0x34u);

            }
          }
        }
        ++v6;
      }
      while (v3 != v6);
      v16 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v36, 16);
      v3 = v16;
    }
    while (v16);
  }

}

- (void)systemHasPoweredOn
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[ASDTDeviceList audioDevices](self, "audioDevices");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v36, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v19;
    v5 = MEMORY[0x24BDACB70];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = objc_msgSend(v7, "systemCompletedPowerOn");
          if (v8)
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              -[ASDTDeviceManager name](self, "name");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "deviceUID");
              v10 = objc_claimAutoreleasedReturnValue();
              v11 = (void *)v10;
              v12 = v8;
              if (v8 - 32 >= 0x5F)
                v12 = 32;
              *(_DWORD *)buf = 138413826;
              v23 = v9;
              v13 = BYTE1(v8);
              if (BYTE1(v8) - 32 >= 0x5F)
                v13 = 32;
              v24 = 1024;
              v25 = v8;
              v14 = BYTE2(v8);
              if (BYTE2(v8) - 32 >= 0x5F)
                v14 = 32;
              v26 = 1024;
              if ((v8 - 0x20000000) >> 24 >= 0x5F)
                v15 = 32;
              else
                v15 = HIBYTE(v8);
              v27 = v15;
              v28 = 1024;
              v29 = v14;
              v30 = 1024;
              v31 = v13;
              v32 = 1024;
              v33 = v12;
              v34 = 2112;
              v35 = v10;
              _os_log_error_impl(&dword_236CEE000, v5, OS_LOG_TYPE_ERROR, "%@: systemHasPoweredOn: Received error %x (%c%c%c%c) from device '%@'.", buf, 0x34u);

            }
          }
        }
        ++v6;
      }
      while (v3 != v6);
      v16 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v36, 16);
      v3 = v16;
    }
    while (v16);
  }

}

- (void)waitForThreadStart
{
  void *v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Failed to start thread.", (uint8_t *)&v3);

  OUTLINED_FUNCTION_0_1();
}

- (void)lockedSignalThread
{
  id v3;

  -[ASDTDeviceManager setThreadWorkToDo:](self, "setThreadWorkToDo:", 1);
  -[ASDTDeviceManager threadCond](self, "threadCond");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signal");

}

- (void)threadLoop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ASDTTime *v18;
  unsigned __int16 *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  unsigned __int16 *v25;
  uint64_t v26;
  unsigned __int16 *v27;
  ASDTTime *v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint8_t v38[128];
  uint8_t buf[16];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTDeviceManager name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Started background thread.", buf, 0xCu);

  }
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[ASDTDeviceManager setThreadStarted:](self, "setThreadStarted:", 1);
  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "broadcast");

  -[ASDTDeviceManager initializingCond](self, "initializingCond");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  -[ASDTDeviceManager thread](self, "thread");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQualityOfService:", 17);

  v36 = 0uLL;
  v37 = 0x10000;
  while (1)
  {
    -[ASDTDeviceManager thread](self, "thread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCancelled");

    if ((v11 & 1) != 0)
      break;
    v12 = (void *)MEMORY[0x23B8022E8]();
    -[ASDTDeviceManager threadCond](self, "threadCond");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lock");

    if (!-[ASDTDeviceManager threadWorkToDo](self, "threadWorkToDo"))
    {
      if ((_QWORD)v36)
      {
        -[ASDTDeviceManager threadCond](self, "threadCond");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v36;
        v35 = v37;
        objc_msgSend(v14, "waitUntilTime:", &v34);
      }
      else
      {
        -[ASDTDeviceManager threadCond](self, "threadCond");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "wait");
      }

    }
    -[ASDTDeviceManager setThreadWorkToDo:](self, "setThreadWorkToDo:", 0);
    -[ASDTDeviceManager devicesRunning](self, "devicesRunning");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASDTDeviceManager threadCond](self, "threadCond");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unlock");

    v18 = (ASDTTime *)objc_msgSend(v16, "count");
    if (!v18)
    {
      ASDTTime::ASDTTime((uint64_t)buf, 0, 1, v19);
LABEL_23:
      v36 = *(_OWORD *)buf;
      v37 = v40;
      goto LABEL_24;
    }
    if (!(_QWORD)v36)
    {
      v28 = (ASDTTime *)-[ASDTDeviceManager runningLogPeriod](self, "runningLogPeriod");
      ASDTTime::futureSecs(v28, v29, (uint64_t)buf);
      goto LABEL_23;
    }
    ASDTTime::machAbsoluteTime(v18, (uint64_t)buf);
    if (*(uint64_t *)buf > (uint64_t)v36)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v20 = v16;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v31;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v20);
            -[ASDTDeviceManager logStatsForDevice:withPowerState:](self, "logStatsForDevice:withPowerState:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23), objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v23), "powerState"));
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v21);
      }

      -[ASDTDeviceManager runningLogPeriod](self, "runningLogPeriod");
      ASDTTime::ASDTTime((uint64_t)buf, (ASDTTime *)llround(v24 * 1000000000.0), 1, v25);
      ASDTTime::operator+=((_anonymous_namespace_ **)&v36, (uint64_t *)buf, v26, v27);
    }
LABEL_24:

    objc_autoreleasePoolPop(v12);
  }

}

- (void)powerStateChangedForDevice:(id)a3 toState:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  int v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = *(_QWORD *)&a4;
  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ASDTDeviceManager threadCond](self, "threadCond");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lock");

    -[ASDTDeviceManager devicesRunning](self, "devicesRunning");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v14);

    if ((_DWORD)v4 == 1920298606)
      v9 = v8;
    else
      v9 = 1;
    if ((v9 & 1) != 0)
    {
      if ((_DWORD)v4 == 1920298606)
        v10 = 0;
      else
        v10 = v8;
      if (v10 != 1)
        goto LABEL_13;
      -[ASDTDeviceManager logStatsForDevice:withPowerState:](self, "logStatsForDevice:withPowerState:", v14, v4);
      -[ASDTDeviceManager devicesRunning](self, "devicesRunning");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", v14);

    }
    else
    {
      -[ASDTDeviceManager devicesRunning](self, "devicesRunning");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

      -[ASDTDeviceManager logStatsForDevice:withPowerState:](self, "logStatsForDevice:withPowerState:", v14, 1920298606);
    }
    -[ASDTDeviceManager lockedSignalThread](self, "lockedSignalThread");
LABEL_13:
    -[ASDTDeviceManager threadCond](self, "threadCond");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlock");

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("powerState")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager powerStateChangedForDevice:toState:](self, "powerStateChangedForDevice:toState:", v11, objc_msgSend(v13, "unsignedIntValue"));

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ASDTDeviceManager;
    -[ASDTDeviceManager observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (id)messageForDroppedPacketsFromDevice:(id)a3 withScope:(unsigned int)a4 andElement:(unsigned int)a5
{
  id v7;
  const char *v8;
  void *v9;
  int v11;
  unsigned int v12;
  _DWORD v13[3];

  v7 = a3;
  v13[0] = 1883533936;
  v13[1] = a4;
  v13[2] = a5;
  if ((objc_msgSend(v7, "hasProperty:", v13) & 1) != 0
    && (v11 = 4,
        v12 = 0,
        (objc_msgSend(v7, "getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:", v13, 0, 0, &v11, &v12, 0) & 1) != 0))
  {
    v8 = "Host";
    if (a5 != 1)
      v8 = "Remote";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %u"), v8, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)messageForDroppedPacketsFromDevice:(id)a3 withScope:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  BOOL v13;
  const char *v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[ASDTDeviceManager messageForDroppedPacketsFromDevice:withScope:andElement:](self, "messageForDroppedPacketsFromDevice:withScope:andElement:", v6, v4, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager messageForDroppedPacketsFromDevice:withScope:andElement:](self, "messageForDroppedPacketsFromDevice:withScope:andElement:", v6, v4, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 | v8)
  {
    if (v7)
      v9 = (const char *)objc_msgSend(objc_retainAutorelease((id)v7), "UTF8String");
    else
      v9 = "";
    if (v8)
      v11 = (const char *)objc_msgSend(objc_retainAutorelease((id)v8), "UTF8String");
    else
      v11 = "";
    v12 = "Output";
    if ((_DWORD)v4 != 1869968496)
      v12 = "Input";
    if (v8)
      v13 = v7 == 0;
    else
      v13 = 1;
    v14 = ", ";
    if (v13)
      v14 = "";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s%s%s"), v12, v9, v14, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)logStatsForDevice:(id)a3 withPowerState:(int)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  BOOL v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTDeviceManager name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "deviceUID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = "not ";
  if (a4 == 1920298606)
    v10 = "";
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: '%@' is %srunning"), v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v30, "addObject:", v11);
  -[ASDTDeviceManager messageForDroppedPacketsFromDevice:withScope:](self, "messageForDroppedPacketsFromDevice:withScope:", v29, 1869968496);
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceManager messageForDroppedPacketsFromDevice:withScope:](self, "messageForDroppedPacketsFromDevice:withScope:", v29, 1768845428);
  v12 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v12;
  if (__PAIR128__((unint64_t)v28, v12) != 0)
  {
    v13 = &stru_250842438;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = &stru_250842438;
    if (v12)
      v15 = v28 == 0;
    else
      v15 = 1;
    v16 = "; ";
    if (v15)
      v16 = "";
    if (v28)
      v13 = v28;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Packets Dropped: %@%s%@"), v13, v16, v14);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v11 = (void *)v17;
      objc_msgSend(v30, "addObject:", v17);
    }
    else
    {
      v11 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v29, "status");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v18, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v24 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v18, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: %@"), v23, v25);
          v26 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v26;
          if (v26)
            objc_msgSend(v30, "addObject:", v26);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v20);
    }

  }
  objc_msgSend(MEMORY[0x24BE0A250], "asdtLogComponents:withSeparator:", v30, CFSTR(", "));

}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (ASDTDeviceManagerDelegate)delegate
{
  return (ASDTDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ASDPlugin)plugin
{
  return (ASDPlugin *)objc_loadWeakRetained((id *)&self->_plugin);
}

- (void)setPlugin:(id)a3
{
  objc_storeWeak((id *)&self->_plugin, a3);
}

- (BOOL)verboseDeviceLogging
{
  return self->_verboseDeviceLogging;
}

- (void)setVerboseDeviceLogging:(BOOL)a3
{
  self->_verboseDeviceLogging = a3;
}

- (NSMutableSet)deviceFactories
{
  return self->_deviceFactories;
}

- (void)setDeviceFactories:(id)a3
{
  objc_storeStrong((id *)&self->_deviceFactories, a3);
}

- (NSMutableDictionary)matchedDeviceFactories
{
  return self->_matchedDeviceFactories;
}

- (void)setMatchedDeviceFactories:(id)a3
{
  objc_storeStrong((id *)&self->_matchedDeviceFactories, a3);
}

- (NSMutableArray)ioServiceDependencies
{
  return self->_ioServiceDependencies;
}

- (void)setIoServiceDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_ioServiceDependencies, a3);
}

- (unsigned)numDevicesToInitialize
{
  return self->_numDevicesToInitialize;
}

- (void)setNumDevicesToInitialize:(unsigned int)a3
{
  self->_numDevicesToInitialize = a3;
}

- (NSMutableDictionary)deviceInitStatus
{
  return self->_deviceInitStatus;
}

- (void)setDeviceInitStatus:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInitStatus, a3);
}

- (OS_dispatch_queue)initializingQueue
{
  return self->_initializingQueue;
}

- (void)setInitializingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_initializingQueue, a3);
}

- (ASDTCondition)initializingCond
{
  return self->_initializingCond;
}

- (void)setInitializingCond:(id)a3
{
  objc_storeStrong((id *)&self->_initializingCond, a3);
}

- (NSThread)thread
{
  return self->_thread;
}

- (void)setThread:(id)a3
{
  objc_storeStrong((id *)&self->_thread, a3);
}

- (ASDTCondition)threadCond
{
  return self->_threadCond;
}

- (void)setThreadCond:(id)a3
{
  objc_storeStrong((id *)&self->_threadCond, a3);
}

- (BOOL)threadWorkToDo
{
  return self->_threadWorkToDo;
}

- (void)setThreadWorkToDo:(BOOL)a3
{
  self->_threadWorkToDo = a3;
}

- (BOOL)threadStarted
{
  return self->_threadStarted;
}

- (void)setThreadStarted:(BOOL)a3
{
  self->_threadStarted = a3;
}

- (NSMutableSet)devicesRunning
{
  return self->_devicesRunning;
}

- (void)setDevicesRunning:(id)a3
{
  objc_storeStrong((id *)&self->_devicesRunning, a3);
}

- (NSSet)underlyingDeviceUIDs
{
  return self->_underlyingDeviceUIDs;
}

- (void)setUnderlyingDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDeviceUIDs, a3);
}

- (double)runningLogPeriod
{
  return self->_runningLogPeriod;
}

- (void)setRunningLogPeriod:(double)a3
{
  self->_runningLogPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_devicesRunning, 0);
  objc_storeStrong((id *)&self->_threadCond, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_initializingCond, 0);
  objc_storeStrong((id *)&self->_initializingQueue, 0);
  objc_storeStrong((id *)&self->_deviceInitStatus, 0);
  objc_storeStrong((id *)&self->_ioServiceDependencies, 0);
  objc_storeStrong((id *)&self->_matchedDeviceFactories, 0);
  objc_storeStrong((id *)&self->_deviceFactories, 0);
  objc_destroyWeak((id *)&self->_plugin);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)initWithConfig:(uint64_t)a3 withDelegate:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Memory allocation error on initializingQueue/Devices/Cond.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)removeAudioDevice:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3, uint8_t *buf)
{
  *(_DWORD *)buf = 138412802;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((_QWORD *)buf + 3) = a3;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Bad or unmanaged device(%p) with UID: %@", buf, 0x20u);

  OUTLINED_FUNCTION_1_5();
}

- (void)removeAudioDevices:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Bad or unmanaged devices to remove. %@", v4, 0x16u);

  OUTLINED_FUNCTION_1_5();
}

- (void)buildAndInitializeDevice:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v4, "%@: Failed to build device '%@' after resources ready.", v5);

  OUTLINED_FUNCTION_1_5();
}

- (void)buildAndInitializeDevice:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v4, "%@: Device with UID '%@' is already matched.", v5);

  OUTLINED_FUNCTION_1_5();
}

- (void)deviceInitialized:withStatus:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_4(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v5, "%@: Initialization of device '%@' failed; not publishing it.",
    v6);

  OUTLINED_FUNCTION_1_5();
}

- (void)deviceInitialized:(uint64_t)a3 withStatus:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: No devices to initialize!", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)publishDeviceLocked:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_4(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v5, "%@: Device factory for '%@' missing device object.", v6);

  OUTLINED_FUNCTION_1_5();
}

- (void)publishDeviceLocked:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Bad device factory.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)waitForInitializationWithTimeoutUs:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Timeout waiting for audio devices to initialize.", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_0_1();
}

- (void)deviceConfigurationFailed:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v4, "%@: Failed creating audio device with configuration:\n%@", v5);

  OUTLINED_FUNCTION_1_5();
}

- (void)deviceInitializationFailed:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_4(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v5, "%@: Failed initializing audio device with UID %@", v6);

  OUTLINED_FUNCTION_1_5();
}

@end
