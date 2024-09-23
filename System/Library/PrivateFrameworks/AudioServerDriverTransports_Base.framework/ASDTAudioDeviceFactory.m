@implementation ASDTAudioDeviceFactory

+ (id)forDeviceConfig:(id)a3 withManager:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (objc_class *)objc_msgSend(v5, "asdtFactorySubclass");
  if ((-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v8 = (void *)objc_msgSend([v7 alloc], "initForDeviceConfig:withManager:", v5, v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[ASDTAudioDeviceFactory forDeviceConfig:withManager:].cold.1(v5);
    v8 = 0;
  }

  return v8;
}

- (id)initForDeviceConfig:(id)a3 withManager:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ASDTAudioDeviceFactory *v12;
  ASDTAudioDeviceFactory *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "asdtDeviceUID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8 || !v7 || !v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTAudioDeviceFactory initForDeviceConfig:withManager:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTAudioDeviceFactory.m"), 65, CFSTR("Bad arguments."));

  }
  v21.receiver = self;
  v21.super_class = (Class)ASDTAudioDeviceFactory;
  v12 = -[ASDTAudioDeviceFactory init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    -[ASDTAudioDeviceFactory setDeviceUID:](v12, "setDeviceUID:", v10);
    -[ASDTAudioDeviceFactory setConfig:](v13, "setConfig:", v7);
    -[ASDTAudioDeviceFactory setManager:](v13, "setManager:", v8);
    -[ASDTAudioDeviceFactory config](v13, "config");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "asdtUnderlyingDeviceUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDeviceFactory setUnderlyingDeviceUID:](v13, "setUnderlyingDeviceUID:", v15);

    objc_msgSend(v8, "underlyingDeviceUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDeviceFactory setDeviceIsUnderlying:](v13, "setDeviceIsUnderlying:", objc_msgSend(v16, "containsObject:", v10));

    -[ASDTAudioDeviceFactory underlyingDeviceUID](v13, "underlyingDeviceUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDTAudioDeviceFactory deviceUID](v13, "deviceUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTAudioDeviceFactory underlyingDeviceUID](v13, "underlyingDeviceUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v18;
        v24 = 2112;
        v25 = v19;
        _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Requires underling device with UID: %@", buf, 0x16u);

      }
    }
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "ioServiceManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeDelegate:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)ASDTAudioDeviceFactory;
  -[ASDTAudioDeviceFactory dealloc](&v9, sel_dealloc);
}

- (void)cleanup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ASDTAudioDeviceFactory setManager:](self, "setManager:", 0);
  -[ASDTAudioDeviceFactory setDevice:](self, "setDevice:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "ioServiceManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeDelegate:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[ASDTAudioDeviceFactory setIoServiceDependencies:](self, "setIoServiceDependencies:", 0);
}

- (BOOL)checkIOServiceDependencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  BOOL v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (!-[ASDTAudioDeviceFactory ioServiceDependenciesDiscovered](self, "ioServiceDependenciesDiscovered"))
  {
    v3 = (void *)objc_opt_class();
    -[ASDTAudioDeviceFactory config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ioServiceDependenciesForConfig:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDeviceFactory setIoServiceDependencies:](self, "setIoServiceDependencies:", v5);

    -[ASDTAudioDeviceFactory setIoServiceDependenciesDiscovered:](self, "setIoServiceDependenciesDiscovered:", 1);
    -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDBCEF0];
      -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v44 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "description");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        }
        while (v13);
      }

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDTAudioDeviceFactory deviceUID](self, "deviceUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v17;
        v51 = 2112;
        v52 = v10;
        _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Dependent on IOServices: %@", buf, 0x16u);

      }
    }
  }
  -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (!v19)
    return 1;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v25, "ioServiceManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
          objc_msgSend(v25, "addManagerDelegate:", self);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v22);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v36;
    while (2)
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "ioService");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          v33 = 0;
          goto LABEL_33;
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (v29)
        continue;
      break;
    }
  }
  v33 = 1;
LABEL_33:

  return v33;
}

- (void)ioServiceAvailable:(id)a3 withManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ASDTAudioDeviceFactory ioServiceDependencies](self, "ioServiceDependencies", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "ioServiceAvailable:withManager:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  if (-[ASDTAudioDeviceFactory checkDependencies](self, "checkDependencies"))
  {
    -[ASDTAudioDeviceFactory manager](self, "manager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resourcesAvailableForDevice:", self);

  }
}

- (BOOL)checkUnderlyingDeviceDependency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ASDTAudioDeviceFactory underlyingDeviceUID](self, "underlyingDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  if (!-[ASDTAudioDeviceFactory didRegisterInterestInUnderlyingDevice](self, "didRegisterInterestInUnderlyingDevice"))
  {
    -[ASDTAudioDeviceFactory setDidRegisterInterestInUnderlyingDevice:](self, "setDidRegisterInterestInUnderlyingDevice:", 1);
    -[ASDTAudioDeviceFactory manager](self, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDeviceFactory underlyingDeviceUID](self, "underlyingDeviceUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerObject:withInterests:forUID:", self, 1, v5);

  }
  -[ASDTAudioDeviceFactory underlyingDevice](self, "underlyingDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)interestNotification:(int)a3 forDevice:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a4;
  -[ASDTAudioDeviceFactory underlyingDeviceUID](self, "underlyingDeviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[ASDTAudioDeviceFactory setUnderlyingDevice:](self, "setUnderlyingDevice:", v9);
    if (-[ASDTAudioDeviceFactory checkDependencies](self, "checkDependencies"))
    {
      -[ASDTAudioDeviceFactory manager](self, "manager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resourcesAvailableForDevice:", self);

    }
  }

}

- (BOOL)checkDependencies
{
  BOOL v3;

  v3 = -[ASDTAudioDeviceFactory checkIOServiceDependencies](self, "checkIOServiceDependencies");
  return -[ASDTAudioDeviceFactory checkUnderlyingDeviceDependency](self, "checkUnderlyingDeviceDependency") && v3;
}

- (BOOL)buildDevice
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[ASDTAudioDeviceFactory checkDependencies](self, "checkDependencies");
  if (v3)
  {
    -[ASDTAudioDeviceFactory config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDeviceFactory manager](self, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDeviceFactory manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "plugin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASDTAudioDevice deviceForConfig:withDeviceManager:andPlugin:](ASDTAudioDevice, "deviceForConfig:withDeviceManager:andPlugin:", v4, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDeviceFactory setDevice:](self, "setDevice:", v8);

    -[ASDTAudioDeviceFactory device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v3)
      {
        -[ASDTAudioDeviceFactory buildDevice].cold.1(self);
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (int)initializeDevice
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  int v7;

  -[ASDTAudioDeviceFactory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[ASDTAudioDeviceFactory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pmSequencer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "executeSequenceToState:", 1768189029);

  return v7;
}

- (void)publishDevice
{
  id v3;

  if (!-[ASDTAudioDeviceFactory deviceIsUnderlying](self, "deviceIsUnderlying"))
  {
    -[ASDTAudioDeviceFactory manager](self, "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "publishDevice:", self);

  }
}

+ (void)addDependenciesFromConfig:(id)a3 toArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v8, "asdtSubclass");
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_25645D6F0))
    {
      objc_msgSend(v6, "ioServiceDependenciesForConfig:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
        objc_msgSend(v5, "addObjectsFromArray:", v7);

    }
  }

}

+ (void)addDependenciesFromConfigArray:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "addDependenciesFromConfig:toArray:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addDependenciesFromConfig:toArray:", v5, v6);
  objc_msgSend(v5, "asdtControls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addDependenciesFromConfigArray:toArray:", v7, v6);

  objc_msgSend(v5, "asdtCustomProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addDependenciesFromConfigArray:toArray:", v8, v6);

  objc_msgSend(v5, "asdtPMDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addDependenciesFromConfigArray:toArray:", v9, v6);

  objc_msgSend(v5, "asdtStreams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addDependenciesFromConfigArray:toArray:", v10, v6);
  if (objc_msgSend(v6, "count"))
    v11 = (void *)objc_msgSend(v6, "copy");
  else
    v11 = 0;

  return v11;
}

+ (id)factoryWithUID:(id)a3 fromList:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "deviceUID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (ASDTDeviceManager)manager
{
  return (ASDTDeviceManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUID, a3);
}

- (BOOL)deviceIsBuilding
{
  return self->_deviceIsBuilding;
}

- (void)setDeviceIsBuilding:(BOOL)a3
{
  self->_deviceIsBuilding = a3;
}

- (ASDAudioDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)deviceIsUnderlying
{
  return self->_deviceIsUnderlying;
}

- (void)setDeviceIsUnderlying:(BOOL)a3
{
  self->_deviceIsUnderlying = a3;
}

- (ASDAudioDevice)underlyingDevice
{
  return (ASDAudioDevice *)objc_loadWeakRetained((id *)&self->_underlyingDevice);
}

- (void)setUnderlyingDevice:(id)a3
{
  objc_storeWeak((id *)&self->_underlyingDevice, a3);
}

- (NSArray)ioServiceDependencies
{
  return self->_ioServiceDependencies;
}

- (void)setIoServiceDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_ioServiceDependencies, a3);
}

- (NSString)underlyingDeviceUID
{
  return self->_underlyingDeviceUID;
}

- (void)setUnderlyingDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDeviceUID, a3);
}

- (BOOL)didRegisterInterestInUnderlyingDevice
{
  return self->_didRegisterInterestInUnderlyingDevice;
}

- (void)setDidRegisterInterestInUnderlyingDevice:(BOOL)a3
{
  self->_didRegisterInterestInUnderlyingDevice = a3;
}

- (BOOL)ioServiceDependenciesDiscovered
{
  return self->_ioServiceDependenciesDiscovered;
}

- (void)setIoServiceDependenciesDiscovered:(BOOL)a3
{
  self->_ioServiceDependenciesDiscovered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDeviceUID, 0);
  objc_storeStrong((id *)&self->_ioServiceDependencies, 0);
  objc_destroyWeak((id *)&self->_underlyingDevice);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_config, 0);
}

+ (void)forDeviceConfig:(void *)a1 withManager:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("FactorySubclass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Subclass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid subclass name: %@ (or %@Factory)", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

- (void)initForDeviceConfig:withManager:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Bad arguments.", v0, 2u);
}

- (void)buildDevice
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create device '%@'.", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_0_1();
}

@end
