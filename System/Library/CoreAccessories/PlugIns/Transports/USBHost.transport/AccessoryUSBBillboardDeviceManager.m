@implementation AccessoryUSBBillboardDeviceManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AccessoryUSBBillboardDeviceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (id)sharedManager_sharedInstance;
}

void __51__AccessoryUSBBillboardDeviceManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v1;

}

- (AccessoryUSBBillboardDeviceManager)init
{
  AccessoryUSBBillboardDeviceManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *usbBillboardDeviceListeners;
  NSMutableDictionary *v5;
  NSMutableDictionary *detectedBillboardDevices;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AccessoryUSBBillboardDeviceManager;
  v2 = -[AccessoryUSBBillboardDeviceManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    usbBillboardDeviceListeners = v2->_usbBillboardDeviceListeners;
    v2->_usbBillboardDeviceListeners = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    detectedBillboardDevices = v2->_detectedBillboardDevices;
    v2->_detectedBillboardDevices = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceAll](self, "stopDetectUSBBillboardDeviceAll");
  v3.receiver = self;
  v3.super_class = (Class)AccessoryUSBBillboardDeviceManager;
  -[AccessoryUSBBillboardDeviceManager dealloc](&v3, sel_dealloc);
}

- (id)copyDetectedBillboardDevices
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_detectedBillboardDevices;
  objc_sync_enter(v3);
  if (-[NSMutableDictionary count](self->_detectedBillboardDevices, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_detectedBillboardDevices);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)AppleUSBHostBillboardDeviceServiceArrived:(unsigned int)a3 vidpid:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  AccessoryUSBBillboardDevice *v16;
  NSObject *v17;
  id v18;
  id v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BYTE v25[14];
  __int16 v26;
  int v27;
  uint64_t v28;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v7 = +[AccessoryUSBBillboardDevice parentServiceVidPid:](AccessoryUSBBillboardDevice, "parentServiceVidPid:");
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v20 = 136315906;
    v21 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceArrived:vidpid:]";
    v22 = 1024;
    v23 = v5;
    v24 = 1024;
    *(_DWORD *)v25 = v7;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = v4;
    _os_log_impl(&dword_2171C1000, v10, OS_LOG_TYPE_INFO, "%s: service %d (0x%x), vidpid 0x%X", (uint8_t *)&v20, 0x1Eu);
  }

  if (v7 == (_DWORD)v4
    && +[AccessoryUSBBillboardDeviceManager vidpidRequiresNotSupportedPrompt:](AccessoryUSBBillboardDeviceManager, "vidpidRequiresNotSupportedPrompt:", v4))
  {
    v11 = +[AccessoryUSBBillboardDevice getRegistryEntryIDFromService:](AccessoryUSBBillboardDevice, "getRegistryEntryIDFromService:", v5);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136316162;
      v21 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceArrived:vidpid:]";
      v22 = 1024;
      v23 = v5;
      v24 = 1024;
      *(_DWORD *)v25 = v4;
      *(_WORD *)&v25[4] = 2048;
      *(_QWORD *)&v25[6] = v11;
      v26 = 1024;
      v27 = v4;
      _os_log_impl(&dword_2171C1000, v12, OS_LOG_TYPE_DEFAULT, "%s: service %d (0x%x), registryID 0x%llx, vidpid 0x%X", (uint8_t *)&v20, 0x28u);
    }

    if (v11)
    {
      v14 = self->_detectedBillboardDevices;
      objc_sync_enter(v14);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_detectedBillboardDevices, "objectForKey:", v15);
      v16 = (AccessoryUSBBillboardDevice *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v17 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v17 = MEMORY[0x24BDACB70];
          v18 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136315650;
          v21 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceArrived:vidpid:]";
          v22 = 1024;
          v23 = v4;
          v24 = 2048;
          *(_QWORD *)v25 = v11;
          _os_log_impl(&dword_2171C1000, v17, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, Already seen device for registryID 0x%llx", (uint8_t *)&v20, 0x1Cu);
        }

      }
      else
      {
        v16 = -[AccessoryUSBBillboardDevice initWithService:]([AccessoryUSBBillboardDevice alloc], "initWithService:", v5);
        -[NSMutableDictionary setObject:forKey:](self->_detectedBillboardDevices, "setObject:forKey:", v16, v15);
      }

      objc_sync_exit(v14);
      if (v16)
      {
        -[AccessoryUSBBillboardDevice presentNotSupportNotification](v16, "presentNotSupportNotification");
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v16 = (AccessoryUSBBillboardDevice *)*(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v16 = (AccessoryUSBBillboardDevice *)MEMORY[0x24BDACB70];
          v19 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136315650;
          v21 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceArrived:vidpid:]";
          v22 = 1024;
          v23 = v4;
          v24 = 2048;
          *(_QWORD *)v25 = v11;
          _os_log_impl(&dword_2171C1000, &v16->super, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, Failed to create device for registryID 0x%llx", (uint8_t *)&v20, 0x1Cu);
        }
      }

    }
  }
}

- (void)AppleUSBHostBillboardDeviceServiceTerminated:(unsigned int)a3 vidpid:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  BOOL v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v17 = 136315650;
    v18 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceTerminated:vidpid:]";
    v19 = 1024;
    v20 = v5;
    v21 = 1024;
    LODWORD(v22) = v4;
    _os_log_impl(&dword_2171C1000, v9, OS_LOG_TYPE_INFO, "%s: service %d, vidpid 0x%X", (uint8_t *)&v17, 0x18u);
  }

  if (+[AccessoryUSBBillboardDeviceManager vidpidRequiresNotSupportedPrompt:](AccessoryUSBBillboardDeviceManager, "vidpidRequiresNotSupportedPrompt:", v4))
  {
    v10 = +[AccessoryUSBBillboardDevice getRegistryEntryIDFromService:](AccessoryUSBBillboardDevice, "getRegistryEntryIDFromService:", v5);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315906;
      v18 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceTerminated:vidpid:]";
      v19 = 1024;
      v20 = v5;
      v21 = 2048;
      v22 = v10;
      v23 = 1024;
      v24 = v4;
      _os_log_impl(&dword_2171C1000, v11, OS_LOG_TYPE_DEFAULT, "%s: service %d, registryID 0x%llx, vidpid 0x%X", (uint8_t *)&v17, 0x22u);
    }

    if (v10)
    {
      v13 = self->_detectedBillboardDevices;
      objc_sync_enter(v13);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_detectedBillboardDevices, "objectForKey:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_sync_exit(v13);
      if (v15)
      {
        -[NSObject dismissNotSupportNotification](v15, "dismissNotSupportNotification");
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v15 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v15 = MEMORY[0x24BDACB70];
          v16 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315650;
          v18 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceTerminated:vidpid:]";
          v19 = 1024;
          v20 = v4;
          v21 = 2048;
          v22 = v10;
          _os_log_impl(&dword_2171C1000, v15, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, Failed to find device for registryID 0x%llx", (uint8_t *)&v17, 0x1Cu);
        }
      }

    }
  }
}

- (BOOL)startDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *v9;
  AccessoryUSBBillboardDeviceListener *v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  AccessoryUSBBillboardDeviceListener *v34;
  uint64_t v35;

  v4 = a4;
  v5 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a4 | (a3 << 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_usbBillboardDeviceListeners;
  objc_sync_enter(v9);
  -[NSMutableDictionary objectForKey:](self->_usbBillboardDeviceListeners, "objectForKey:", v8);
  v10 = (AccessoryUSBBillboardDeviceListener *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = -[AccessoryUSBBillboardDeviceListener initWithVID:PID:]([AccessoryUSBBillboardDeviceListener alloc], "initWithVID:PID:", v5, v4);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315650;
      v30 = "-[AccessoryUSBBillboardDeviceManager startDetectUSBBillboardDeviceWithVID:PID:]";
      v31 = 1024;
      v32 = v7;
      v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_2171C1000, v11, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, add listener, %@", (uint8_t *)&v29, 0x1Cu);
    }

    -[NSMutableDictionary setObject:forKey:](self->_usbBillboardDeviceListeners, "setObject:forKey:", v10, v8);
    if (!v10)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v16 = MEMORY[0x24BDACB70];
        v21 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceManager startDetectUSBBillboardDeviceWithVID:PID:].cold.1(v7, v16, v22, v23, v24, v25, v26, v27);
      v10 = 0;
      goto LABEL_42;
    }
  }
  v13 = -[AccessoryUSBBillboardDeviceListener started](v10, "started");
  if (gLogObjects)
    v14 = gNumLogObjects <= 0;
  else
    v14 = 1;
  v15 = !v14;
  if (v13)
  {
    if (v15)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v16 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315650;
      v30 = "-[AccessoryUSBBillboardDeviceManager startDetectUSBBillboardDeviceWithVID:PID:]";
      v31 = 1024;
      v32 = v7;
      v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_2171C1000, v16, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, listener already started, %@", (uint8_t *)&v29, 0x1Cu);
    }
LABEL_42:

    v20 = 0;
    goto LABEL_43;
  }
  if (v15)
  {
    v17 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v17 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136315650;
    v30 = "-[AccessoryUSBBillboardDeviceManager startDetectUSBBillboardDeviceWithVID:PID:]";
    v31 = 1024;
    v32 = v7;
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_2171C1000, v17, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, start listener, %@", (uint8_t *)&v29, 0x1Cu);
  }

  -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice](v10, "startDetectUSBBillboardDevice");
  v20 = 1;
LABEL_43:

  objc_sync_exit(v9);
  return v20;
}

- (BOOL)stopDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  unsigned int v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  int v23;
  const char *v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a4 | (a3 << 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_usbBillboardDeviceListeners;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKey:](self->_usbBillboardDeviceListeners, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "started");
    v11 = v10;
    if (gLogObjects)
      v12 = gNumLogObjects <= 0;
    else
      v12 = 1;
    v13 = !v12;
    if (v10)
    {
      if (v13)
      {
        v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v14 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315650;
        v24 = "-[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceWithVID:PID:]";
        v25 = 1024;
        v26 = v5;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_2171C1000, v14, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, stop listener, %@", (uint8_t *)&v23, 0x1Cu);
      }

      objc_msgSend(v9, "stopDetectUSBBillboardDevice");
    }
    else
    {
      if (v13)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v16 = MEMORY[0x24BDACB70];
        v19 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315650;
        v24 = "-[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceWithVID:PID:]";
        v25 = 1024;
        v26 = v5;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_2171C1000, v16, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, listener already stopped, %@", (uint8_t *)&v23, 0x1Cu);
      }

    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v20 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315650;
      v24 = "-[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceWithVID:PID:]";
      v25 = 1024;
      v26 = v5;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_2171C1000, v20, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, remove listener, %@", (uint8_t *)&v23, 0x1Cu);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_usbBillboardDeviceListeners, "removeObjectForKey:", v6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v15 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315394;
      v24 = "-[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceWithVID:PID:]";
      v25 = 1024;
      v26 = v5;
      _os_log_impl(&dword_2171C1000, v15, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, Failed to find listener!!!", (uint8_t *)&v23, 0x12u);
    }

    v11 = 0;
  }

  objc_sync_exit(v7);
  return v11;
}

- (void)stopDetectUSBBillboardDeviceAll
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = self->_usbBillboardDeviceListeners;
  objc_sync_enter(v3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_usbBillboardDeviceListeners, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "stopDetectUSBBillboardDevice");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_usbBillboardDeviceListeners, "removeAllObjects");
  objc_sync_exit(v3);

}

- (BOOL)isStartedDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4 | ((unint64_t)a3 << 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_usbBillboardDeviceListeners;
  objc_sync_enter(v6);
  -[NSMutableDictionary objectForKey:](self->_usbBillboardDeviceListeners, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "started");
  else
    v9 = 0;

  objc_sync_exit(v6);
  return v9;
}

+ (BOOL)vidpidRequiresNotSupportedPrompt:(unsigned int)a3
{
  return a3 >> 1 == 47582088;
}

- (OS_dispatch_queue)accessoryUSBBillboardDeviceListenerQueue
{
  return self->_accessoryUSBBillboardDeviceListenerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUSBBillboardDeviceListenerQueue, 0);
  objc_storeStrong((id *)&self->_detectedBillboardDevices, 0);
  objc_storeStrong((id *)&self->_usbBillboardDeviceListeners, 0);
}

- (void)startDetectUSBBillboardDeviceWithVID:(uint64_t)a3 PID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2171C1000, a2, a3, "%s: vidpid 0x%X, Failed to create listener!!!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
