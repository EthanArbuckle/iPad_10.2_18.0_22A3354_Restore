@implementation ASDTPlugin

+ (id)forBundleID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForBundleID:", v4);

  return v5;
}

- (id)initForBundleID:(id)a3
{
  id v4;
  ASDTPlugin *v5;
  ASDTPlugin *v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  ASDTDeviceList *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  ASDTPlugin *v19;
  void *v20;
  uint64_t v21;
  objc_super v23;
  objc_super v24;
  char v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDTPlugin;
  v5 = -[ASDTPlugin init](&v24, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_11;
  atomic_store(0, &v5->_configChangeNumber.__a_.__a_value);
  v7 = v4;
  if (!v4)
  {
    v23.receiver = v5;
    v23.super_class = (Class)ASDTPlugin;
    -[ASDTPlugin bundleID](&v23, sel_bundleID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ASDTPlugin setAsdtBundleID:](v6, "setAsdtBundleID:", v7);
  if (!v4)

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INTERACTIVE, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.AudioServerDriverTransports.ASDTPlugin.concurrentQueue", v8);
  -[ASDTPlugin setConcurrentQueue:](v6, "setConcurrentQueue:", v9);

  -[ASDTPlugin bundleID](v6, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTSystemPowerNotifier notifierForBundleName:delegate:earlyWake:](ASDTSystemPowerNotifier, "notifierForBundleName:delegate:earlyWake:", v10, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTPlugin setSystemPowerNotifier:](v6, "setSystemPowerNotifier:", v11);

  v12 = objc_alloc_init(ASDTDeviceList);
  -[ASDTPlugin setPublishedDevices:](v6, "setPublishedDevices:", v12);

  +[ASDTChangeRequestManager forDelegate:](ASDTChangeRequestManager, "forDelegate:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTPlugin setChangeRequestManager:](v6, "setChangeRequestManager:", v13);

  -[ASDTPlugin concurrentQueue](v6, "concurrentQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ASDTPlugin systemPowerNotifier](v6, "systemPowerNotifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[ASDTPlugin publishedDevices](v6, "publishedDevices");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[ASDTPlugin changeRequestManager](v6, "changeRequestManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
        {

LABEL_11:
          v19 = v6;
          goto LABEL_17;
        }
        goto LABEL_14;
      }

    }
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTPlugin bundleID](v6, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPlugin initForBundleID:].cold.1(v20, (uint64_t)v25, v21);
  }

  v19 = 0;
LABEL_17:

  return v19;
}

- (ASDTPlugin)init
{
  return (ASDTPlugin *)-[ASDTPlugin initForBundleID:](self, "initForBundleID:", 0);
}

- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTPlugin bundleID](self, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v5;
    v18 = 2080;
    v19 = "200.54";
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ %s Initialization Start", buf, 0x16u);

  }
  v15.receiver = self;
  v15.super_class = (Class)ASDTPlugin;
  -[ASDTPlugin halInitializeWithPluginHost:](&v15, sel_halInitializeWithPluginHost_, a3);
  -[ASDTPlugin config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[ASDTDeviceManager deviceManagerWithConfig:withDelegate:](ASDTDeviceManager, "deviceManagerWithConfig:withDelegate:", v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPlugin setDeviceManager:](self, "setDeviceManager:", v7);

    -[ASDTPlugin deviceManager](self, "deviceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = v8 == 0;

    if (!(_DWORD)v7)
    {
      v9 = "Success";
      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTPlugin bundleID](self, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTPlugin halInitializeWithPluginHost:].cold.2(v12, (uint64_t)v22, v13);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTPlugin bundleID](self, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPlugin halInitializeWithPluginHost:].cold.1(v10, (uint64_t)v22, v11);
  }
  v9 = "Failure";
LABEL_11:
  -[ASDTPlugin setInitializationComplete:](self, "setInitializationComplete:", 1);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTPlugin bundleID](self, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = v14;
    v18 = 2080;
    v19 = "200.54";
    v20 = 2080;
    v21 = v9;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ %s Initialization End; Result: %s",
      buf,
      0x20u);

  }
}

- (NSArray)audioDevices
{
  void *v2;
  void *v3;

  -[ASDTPlugin publishedDevices](self, "publishedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addAudioDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[ASDTPlugin publishedDevices](self, "publishedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAudioDevice:", v4);

  -[ASDTPlugin changeRequestManager](self, "changeRequestManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "waitForConfigurationChangesForDevice:", v4);

  v7.receiver = self;
  v7.super_class = (Class)ASDTPlugin;
  -[ASDTPlugin addAudioDevice:](&v7, sel_addAudioDevice_, v4);

}

- (void)addAudioDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASDTPlugin publishedDevices](self, "publishedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAudioDevices:", v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
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
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[ASDTPlugin changeRequestManager](self, "changeRequestManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "waitForConfigurationChangesForDevice:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)ASDTPlugin;
  -[ASDTPlugin addAudioDevices:](&v12, sel_addAudioDevices_, v6);

}

- (void)removeAudioDevice:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ASDTPlugin;
  -[ASDTPlugin removeAudioDevice:](&v6, sel_removeAudioDevice_, v4);
  -[ASDTPlugin publishedDevices](self, "publishedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAudioDevice:", v4);

}

- (void)removeAudioDevices:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ASDTPlugin;
  -[ASDTPlugin removeAudioDevices:](&v6, sel_removeAudioDevices_, v4);
  -[ASDTPlugin publishedDevices](self, "publishedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAudioDevices:", v4);

}

- (BOOL)callRequestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDTPlugin;
  return -[ASDTPlugin requestConfigurationChangeForDevice:withBlock:](&v5, sel_requestConfigurationChangeForDevice_withBlock_, a3, a4);
}

- (BOOL)requestConfigurationChange:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  BOOL v11;
  id *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ASDTPlugin initializationComplete](self, "initializationComplete");
  -[ASDTPlugin publishedDevices](self, "publishedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (objc_msgSend(v4, "object"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "containsObject:", v8),
        v8,
        (v9 & 1) != 0))
  {
    objc_msgSend(v4, "object");
    v10 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __41__ASDTPlugin_requestConfigurationChange___block_invoke_2;
    v17[3] = &unk_250842100;
    v18 = v4;
    v11 = -[ASDTPlugin callRequestConfigurationChangeForDevice:withBlock:](self, "callRequestConfigurationChangeForDevice:withBlock:", v10, v17);
    v12 = &v18;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = "before initialization is complete";
      if (v5)
        v15 = "for unpublished device";
      *(_DWORD *)buf = 136315394;
      v22 = v15;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Executing configuration change %s: %@", buf, 0x16u);

    }
    -[ASDTPlugin concurrentQueue](self, "concurrentQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__ASDTPlugin_requestConfigurationChange___block_invoke;
    block[3] = &unk_250842100;
    v12 = &v20;
    v20 = v4;
    dispatch_async(v10, block);
    v11 = 1;
  }

  return v11;
}

uint64_t __41__ASDTPlugin_requestConfigurationChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "execute");
}

uint64_t __41__ASDTPlugin_requestConfigurationChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "execute");
}

- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  -[ASDTPlugin changeRequestManager](self, "changeRequestManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "requestConfigurationChangeForDevice:withBlock:", v6, v7);

  return v9;
}

- (BOOL)configurationChangePendingForObject:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ASDTPlugin changeRequestManager](self, "changeRequestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "configurationChangePendingForObject:", v4);

  return v6;
}

- (void)waitForConfigurationChangesForDevice:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ASDTPlugin changeRequestManager](self, "changeRequestManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitForConfigurationChangesForDevice:", v5);

}

- (void)waitForChangeRequests
{
  id v2;

  -[ASDTPlugin changeRequestManager](self, "changeRequestManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitForAllConfigurationChanges");

}

- (BOOL)systemIsSleeping
{
  void *v2;
  char v3;

  -[ASDTPlugin systemPowerNotifier](self, "systemPowerNotifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "systemIsSleeping");

  return v3;
}

- (BOOL)allowSystemSleep
{
  void *v3;
  void *v4;
  char v5;

  -[ASDTPlugin deviceManager](self, "deviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[ASDTPlugin deviceManager](self, "deviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowSystemSleep");

  return v5;
}

- (void)systemWillSleep
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASDTPlugin;
  -[ASDTPlugin systemWillSleep](&v4, sel_systemWillSleep);
  -[ASDTPlugin deviceManager](self, "deviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemWillSleep");

}

- (void)systemHasPoweredOn
{
  void *v3;
  objc_super v4;

  -[ASDTPlugin deviceManager](self, "deviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemHasPoweredOn");

  v4.receiver = self;
  v4.super_class = (Class)ASDTPlugin;
  -[ASDTPlugin systemHasPoweredOn](&v4, sel_systemHasPoweredOn);
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentQueue, a3);
}

- (NSDictionary)config
{
  return self->_config;
}

- (ASDTDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (NSString)asdtBundleID
{
  return self->_asdtBundleID;
}

- (void)setAsdtBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_asdtBundleID, a3);
}

- (ASDTSystemPowerNotifier)systemPowerNotifier
{
  return self->_systemPowerNotifier;
}

- (void)setSystemPowerNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_systemPowerNotifier, a3);
}

- (BOOL)initializationComplete
{
  return self->_initializationComplete;
}

- (void)setInitializationComplete:(BOOL)a3
{
  self->_initializationComplete = a3;
}

- (ASDTDeviceList)publishedDevices
{
  return self->_publishedDevices;
}

- (void)setPublishedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_publishedDevices, a3);
}

- (ASDTChangeRequestManager)changeRequestManager
{
  return self->_changeRequestManager;
}

- (void)setChangeRequestManager:(id)a3
{
  objc_storeStrong((id *)&self->_changeRequestManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRequestManager, 0);
  objc_storeStrong((id *)&self->_publishedDevices, 0);
  objc_storeStrong((id *)&self->_systemPowerNotifier, 0);
  objc_storeStrong((id *)&self->_asdtBundleID, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
}

- (void)initForBundleID:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Memory allocation error.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)halInitializeWithPluginHost:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: No configuration found.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)halInitializeWithPluginHost:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Failed creating device manager.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

@end
