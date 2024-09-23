@implementation CMContinuityCaptureTransportSidecarDevice

- (CMContinuityCaptureTransportSidecarDevice)initWithSidecarDevice:(id)a3 capabilities:(id)a4 remote:(BOOL)a5
{
  id v9;
  id v10;
  CMContinuityCaptureTransportSidecarDevice *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v15;
  NSMutableDictionary *activeStreams;
  void *v17;
  void *v18;
  CMContinuityCaptureMagicStateMonitor *v19;
  CMContinuityCaptureMagicStateMonitor *magicStateMonitor;
  CMContinuityCaptureTransportSidecarDevice *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CMContinuityCaptureTransportSidecarDevice;
  v11 = -[CMContinuityCaptureTransportSidecarDevice init](&v23, sel_init);
  if (!v11)
    goto LABEL_5;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("com.apple.continuitycapture.sidecardevice", v12);
  queue = v11->_queue;
  v11->_queue = (OS_dispatch_queue *)v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  activeStreams = v11->_activeStreams;
  v11->_activeStreams = v15;

  objc_storeStrong((id *)&v11->_device, a3);
  v11->_remote = a5;
  objc_storeStrong((id *)&v11->_capabilities, a4);
  -[CMContinuityCaptureTransportSidecarDevice capabilities](v11, "capabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "devicesCapabilities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v11->_allFeaturesSupported = CMContinuityCaptureDeviceSupportsAllFeatures(v18);

  v19 = -[CMContinuityCaptureMagicStateMonitor initWithDevice:]([CMContinuityCaptureMagicStateMonitor alloc], "initWithDevice:", v11);
  magicStateMonitor = v11->_magicStateMonitor;
  v11->_magicStateMonitor = v19;

  if (v11->_magicStateMonitor)
    v21 = v11;
  else
LABEL_5:
    v21 = 0;

  return v21;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)resetDevice:(id)a3
{
  SidecarDevice *v4;
  SidecarDevice *device;
  CMContinuityCaptureTransportSidecarDevice *obj;

  v4 = (SidecarDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  device = obj->_device;
  obj->_device = v4;

  objc_sync_exit(obj);
}

- (void)teardownStreams
{
  NSObject *v3;
  CMContinuityCaptureTransportSidecarDevice *v4;
  int v5;
  CMContinuityCaptureTransportSidecarDevice *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = self;
    v7 = 2080;
    v8 = "-[CMContinuityCaptureTransportSidecarDevice teardownStreams]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v5, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[CMContinuityCaptureTransportSidecarDevice willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("activeStreams"));
  -[NSMutableDictionary removeAllObjects](v4->_activeStreams, "removeAllObjects");
  -[CMContinuityCaptureTransportSidecarDevice didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("activeStreams"));
  -[CMContinuityCaptureTransportSidecarDevice willChangeValueForKey:](v4, "willChangeValueForKey:", CFSTR("active"));
  v4->_active = 0;
  -[CMContinuityCaptureTransportSidecarDevice didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("active"));
  objc_sync_exit(v4);

}

- (BOOL)active
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  BOOL active;

  v2 = self;
  objc_sync_enter(v2);
  active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (BOOL)remote
{
  return self->_remote;
}

- (id)streamForIdentifier:(id)a3
{
  id v4;
  CMContinuityCaptureTransportSidecarDevice *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_activeStreams, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)activateStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__CMContinuityCaptureTransportSidecarDevice_activateStream___block_invoke;
  v6[3] = &unk_24F06B500;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  objc_msgSend(v5, "activate:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __60__CMContinuityCaptureTransportSidecarDevice_activateStream___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  if (!a2 || !objc_msgSend(a2, "code"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v5 = WeakRetained[8];
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __60__CMContinuityCaptureTransportSidecarDevice_activateStream___block_invoke_2;
      v6[3] = &unk_24F06ADE8;
      v7 = WeakRetained;
      v8 = *(id *)(a1 + 32);
      dispatch_async(v5, v6);

    }
  }
}

void __60__CMContinuityCaptureTransportSidecarDevice_activateStream___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("activeStreams"));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v4, "streamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("activeStreams"));
  objc_sync_exit(v2);

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("active"));
    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 1;
    objc_sync_exit(v7);

    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("active"));
  }
}

- (CMContinuityCaptureMagicStateMonitor)magicStateMonitor
{
  return self->_magicStateMonitor;
}

- (NSArray)activeStreams
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[NSMutableDictionary allValues](v2->_activeStreams, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (void)setUserDisconnected:(BOOL)a3
{
  CMContinuityCaptureTransportSidecarDevice *v4;
  CMContinuityCaptureTransportSidecarDevice *obj;

  v4 = self;
  objc_sync_enter(v4);
  v4->_userDisconnected = a3;
  objc_sync_exit(v4);

  if (-[CMContinuityCaptureTransportSidecarDevice wired](v4, "wired"))
  {
    obj = v4;
    objc_sync_enter(obj);
    obj->_disconnectedWhileWired = 1;
    objc_sync_exit(obj);

  }
}

- (BOOL)userDisconnected
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  BOOL userDisconnected;

  v2 = self;
  objc_sync_enter(v2);
  userDisconnected = v2->_userDisconnected;
  objc_sync_exit(v2);

  return userDisconnected;
}

- (BOOL)wifiP2pActive
{
  void *v2;
  unint64_t v3;

  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "status") >> 9) & 1;

  return v3;
}

- (BOOL)allFeaturesSupported
{
  return self->_allFeaturesSupported;
}

- (SidecarDevice)device
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  SidecarDevice *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (NSUUID)deviceIdentifier
{
  void *v2;
  void *v3;

  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)deviceName
{
  void *v2;
  void *v3;

  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)deviceModel
{
  void *v2;
  void *v3;

  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)deviceModelType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CMContinuityCaptureDeviceModelFromModelString();

  return v4;
}

- (unint64_t)deviceStatus
{
  void *v2;
  unint64_t v3;

  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return v3;
}

- (BOOL)wired
{
  void *v2;
  unint64_t v3;

  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "status") >> 24) & 1;

  return v3;
}

- (BOOL)usable
{
  void *v2;
  BOOL v3;

  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cameraState") == 1;

  return v3;
}

- (unint64_t)deviceMajorVersion
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  unint64_t deviceMajorVersion;

  v2 = self;
  objc_sync_enter(v2);
  deviceMajorVersion = v2->_deviceMajorVersion;
  objc_sync_exit(v2);

  return deviceMajorVersion;
}

- (void)setDeviceMajorVersion:(unint64_t)a3
{
  CMContinuityCaptureTransportSidecarDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_deviceMajorVersion = a3;
  objc_sync_exit(obj);

}

- (unint64_t)deviceMinorVersion
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  unint64_t deviceMinorVersion;

  v2 = self;
  objc_sync_enter(v2);
  deviceMinorVersion = v2->_deviceMinorVersion;
  objc_sync_exit(v2);

  return deviceMinorVersion;
}

- (void)setDeviceMinorVersion:(unint64_t)a3
{
  CMContinuityCaptureTransportSidecarDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_deviceMinorVersion = a3;
  objc_sync_exit(obj);

}

- (BOOL)guest
{
  return 0;
}

- (BOOL)terminationDeferred
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  BOOL terminationDeferred;

  v2 = self;
  objc_sync_enter(v2);
  terminationDeferred = v2->_terminationDeferred;
  objc_sync_exit(v2);

  return terminationDeferred;
}

- (void)setTerminationDeferred:(BOOL)a3
{
  CMContinuityCaptureTransportSidecarDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_terminationDeferred = a3;
  objc_sync_exit(obj);

}

- (BOOL)canDeferTermination
{
  int v3;
  void *v4;
  void *v5;

  if (-[CMContinuityCaptureTransportSidecarDevice hasStreamIntent](self, "hasStreamIntent")
    && !-[CMContinuityCaptureTransportSidecarDevice userDisconnected](self, "userDisconnected"))
  {
    -[CMContinuityCaptureTransportSidecarDevice capabilities](self, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CMContinuityCaptureTransportSidecarDevice capabilities](self, "capabilities");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "userDisabled") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isPlacementStepSkipped
{
  return 1;
}

- (BOOL)disconnectedWhileWired
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  BOOL disconnectedWhileWired;

  v2 = self;
  objc_sync_enter(v2);
  disconnectedWhileWired = v2->_disconnectedWhileWired;
  objc_sync_exit(v2);

  return disconnectedWhileWired;
}

- (BOOL)legacyReconnectRecovery
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  BOOL legacyRecovery;

  v2 = self;
  objc_sync_enter(v2);
  legacyRecovery = v2->_legacyRecovery;
  objc_sync_exit(v2);

  return legacyRecovery;
}

- (void)setLegacyReconnectRecovery:(BOOL)a3
{
  CMContinuityCaptureTransportSidecarDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_legacyRecovery = a3;
  objc_sync_exit(obj);

}

- (void)notifyDeviceStateChange
{
  CMContinuityCaptureTransportSidecarDevice *v3;

  if (!-[CMContinuityCaptureTransportSidecarDevice wired](self, "wired")
    && -[CMContinuityCaptureTransportSidecarDevice userDisconnected](self, "userDisconnected"))
  {
    v3 = self;
    objc_sync_enter(v3);
    v3->_disconnectedWhileWired = 0;
    objc_sync_exit(v3);

  }
  -[CMContinuityCaptureTransportSidecarDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("deviceStatus"));
  -[CMContinuityCaptureTransportSidecarDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("deviceStatus"));
  -[CMContinuityCaptureTransportSidecarDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("usable"));
  -[CMContinuityCaptureTransportSidecarDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("usable"));
  -[CMContinuityCaptureTransportSidecarDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("wired"));
  -[CMContinuityCaptureTransportSidecarDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("wired"));
  -[CMContinuityCaptureTransportSidecarDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("nearby"));
  -[CMContinuityCaptureTransportSidecarDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("nearby"));
}

- (CMContinuityCaptureCapabilities)capabilities
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  CMContinuityCaptureCapabilities *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_capabilities;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCapabilities:(id)a3
{
  CMContinuityCaptureCapabilities *v4;
  CMContinuityCaptureCapabilities *capabilities;
  CMContinuityCaptureTransportSidecarDevice *obj;

  v4 = (CMContinuityCaptureCapabilities *)a3;
  obj = self;
  objc_sync_enter(obj);
  capabilities = obj->_capabilities;
  obj->_capabilities = v4;

  objc_sync_exit(obj);
}

- (BOOL)nearby
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  BOOL nearby;

  v2 = self;
  objc_sync_enter(v2);
  nearby = v2->_nearby;
  objc_sync_exit(v2);

  return nearby;
}

- (void)setNearby:(BOOL)a3
{
  CMContinuityCaptureTransportSidecarDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_nearby = a3;
  objc_sync_exit(obj);

}

- (BOOL)hasStreamIntent
{
  CMContinuityCaptureTransportSidecarDevice *v2;
  BOOL streamIntent;

  v2 = self;
  objc_sync_enter(v2);
  streamIntent = v2->_streamIntent;
  objc_sync_exit(v2);

  return streamIntent;
}

- (void)setStreamIntent:(BOOL)a3
{
  CMContinuityCaptureTransportSidecarDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_streamIntent = a3;
  objc_sync_exit(obj);

}

- (BOOL)canReconnect
{
  return -[CMContinuityCaptureTransportSidecarDevice userDisconnected](self, "userDisconnected")
      && -[CMContinuityCaptureTransportSidecarDevice wired](self, "wired")
      && !-[CMContinuityCaptureTransportSidecarDevice disconnectedWhileWired](self, "disconnectedWhileWired");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureTransportSidecarDevice device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5
{
  NSObject *queue;
  _QWORD block[4];
  id v11[4];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__CMContinuityCaptureTransportSidecarDevice_synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke;
  block[3] = &unk_24F06C5C0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v11[2] = (id)a4;
  v11[3] = (id)a5;
  dispatch_async(queue, block);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __120__CMContinuityCaptureTransportSidecarDevice_synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_synchronizeAudioClockWithSampleTime:networkTime:clockGrandMasterIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    WeakRetained = v3;
  }

}

- (void)_synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v22[0] = &unk_24F07F8A0;
  v21[0] = CFSTR("ContinuityCaptureSelector");
  v21[1] = CFSTR("ContinuityCaptureArgs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_activeStreams, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureCommand"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __121__CMContinuityCaptureTransportSidecarDevice__synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke;
  v16[3] = &unk_24F06B500;
  objc_copyWeak(&v18, &location);
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v15, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __121__CMContinuityCaptureTransportSidecarDevice__synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = WeakRetained;
    v9 = 2114;
    v10 = v6;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%@ SendMessage %{public}@ Error %@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__CMContinuityCaptureTransportSidecarDevice_didCaptureStillImage_entity___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a4;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __73__CMContinuityCaptureTransportSidecarDevice_didCaptureStillImage_entity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_didCaptureStillImage:entity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  CMContinuityCaptureTransportSidecarDevice *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v21[0] = &unk_24F07F8B8;
    v20[0] = CFSTR("ContinuityCaptureSelector");
    v20[1] = CFSTR("ContinuityCaptureArgs");
    v19[0] = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_activeStreams, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __74__CMContinuityCaptureTransportSidecarDevice__didCaptureStillImage_entity___block_invoke;
    v14[3] = &unk_24F06B500;
    objc_copyWeak(&v16, &location);
    v13 = v11;
    v15 = v13;
    objc_msgSend(v12, "sendMessage:message:completion:", CFSTR("ContinuityCaptureData"), v13, v14);

    objc_destroyWeak(&v16);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v23 = self;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      _os_log_error_impl(&dword_227C5D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive request %@ error %@", buf, 0x20u);
    }
  }

  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportSidecarDevice__didCaptureStillImage_entity___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543874;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ SendMessage didCaptureStillImage %@ Error %@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)handleSynchronizeAudioClockCompletion
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __82__CMContinuityCaptureTransportSidecarDevice_handleSynchronizeAudioClockCompletion__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __82__CMContinuityCaptureTransportSidecarDevice_handleSynchronizeAudioClockCompletion__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4[0] = CFSTR("ContinuityCaptureSelector");
    v4[1] = CFSTR("ContinuityCaptureArgs");
    v5[0] = &unk_24F07F8D0;
    v5[1] = &unk_24F07FDF0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[6], "objectForKeyedSubscript:", CFSTR("ContinuityCaptureCommand"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v2, &__block_literal_global_10);

  }
}

- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__CMContinuityCaptureTransportSidecarDevice_captureStillImage_entity_completion___block_invoke;
  block[3] = &unk_24F06B068;
  objc_copyWeak(v16, &location);
  v14 = v8;
  v15 = v9;
  v16[1] = (id)a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __81__CMContinuityCaptureTransportSidecarDevice_captureStillImage_entity_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  id *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (v4)
    {
      v17[0] = &unk_24F07F900;
      v16[0] = CFSTR("ContinuityCaptureSelector");
      v16[1] = CFSTR("ContinuityCaptureArgs");
      v15[0] = v4;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained[6], "objectForKeyedSubscript:", CFSTR("ContinuityCaptureCommand"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __81__CMContinuityCaptureTransportSidecarDevice_captureStillImage_entity_completion___block_invoke_110;
      v12[3] = &unk_24F06C608;
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v9, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v8, v12);

    }
    else
    {
      CMContinuityCaptureLog(2);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v19 = WeakRetained;
        v20 = 2112;
        v21 = v11;
        v22 = 2112;
        v23 = v5;
        _os_log_error_impl(&dword_227C5D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ archivedDataWithRootObject %@ Error %@", buf, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __81__CMContinuityCaptureTransportSidecarDevice_captureStillImage_entity_completion___block_invoke_110(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__CMContinuityCaptureTransportSidecarDevice_enqueueReactionEffect_entity___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a4;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportSidecarDevice_enqueueReactionEffect_entity___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  id *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v13 = WeakRetained;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueReactionEffect %{public}@", buf, 0x16u);
    }

    v11[0] = &unk_24F07F918;
    v10[0] = CFSTR("ContinuityCaptureSelector");
    v10[1] = CFSTR("ContinuityCaptureArgs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained[6], "objectForKeyedSubscript:", CFSTR("ContinuityCaptureCommand"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v7, &__block_literal_global_113);

  }
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__CMContinuityCaptureTransportSidecarDevice_setValueForControl_completion___block_invoke;
  v11[3] = &unk_24F06B2D0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__CMContinuityCaptureTransportSidecarDevice_setValueForControl_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_setValueForControl:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_setValueForControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  CMContinuityCaptureTransportSidecarDevice *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__CMContinuityCaptureTransportSidecarDevice__setValueForControl_completion___block_invoke;
  v17[3] = &unk_24F06B040;
  objc_copyWeak(&v19, &location);
  v8 = v7;
  v18 = v8;
  v9 = (void *)MEMORY[0x22E2A7CB0](v17);
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v10)
  {
    v23[0] = &unk_24F07F930;
    v22[0] = CFSTR("ContinuityCaptureSelector");
    v22[1] = CFSTR("ContinuityCaptureArgs");
    v21 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v13 = objc_claimAutoreleasedReturnValue();

    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ setValueForControl %{public}@", buf, 0x16u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_activeStreams, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureControl"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendMessage:message:completion:", CFSTR("ContinuityCaptureControl"), v13, v9);

  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v25 = self;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v6;
      _os_log_error_impl(&dword_227C5D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ archivedDataWithRootObject Error %@ for control %@", buf, 0x20u);
    }
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

uint64_t __76__CMContinuityCaptureTransportSidecarDevice__setValueForControl_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;

  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __76__CMContinuityCaptureTransportSidecarDevice__setValueForControl_completion___block_invoke_cold_1(a1, a2, v4);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__CMContinuityCaptureTransportSidecarDevice_handleAVCNegotiation_data___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureTransportSidecarDevice_handleAVCNegotiation_data___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleAVCNegotiation:data:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureTransportSidecarDevice *v18;
  __int16 v19;
  int v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v22[0] = CFSTR("ContinuityCaptureSelector");
  v22[1] = CFSTR("ContinuityCaptureArgs");
  v23[0] = &unk_24F07F948;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  v21[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 1024;
    v20 = a3;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sendAVCNegotiation for entity %d", buf, 0x12u);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_activeStreams, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureControl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__CMContinuityCaptureTransportSidecarDevice__handleAVCNegotiation_data___block_invoke;
  v13[3] = &unk_24F06B500;
  objc_copyWeak(&v15, &location);
  v12 = v9;
  v14 = v12;
  objc_msgSend(v11, "sendMessage:message:completion:", CFSTR("ContinuityCaptureControl"), v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __72__CMContinuityCaptureTransportSidecarDevice__handleAVCNegotiation_data___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __72__CMContinuityCaptureTransportSidecarDevice__handleAVCNegotiation_data___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__CMContinuityCaptureTransportSidecarDevice_startStream_option_completion___block_invoke;
  block[3] = &unk_24F06B068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __75__CMContinuityCaptureTransportSidecarDevice_startStream_option_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_startStream:option:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  CMContinuityCaptureTransportSidecarDevice *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = self;
    v26 = 2114;
    v27 = v8;
    v28 = 1024;
    v29 = a4;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream for configuration %{public}@ option %d", buf, 0x1Cu);
  }

  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  if (v11)
  {
    v23[0] = &unk_24F07F930;
    v22[0] = CFSTR("ContinuityCaptureSelector");
    v22[1] = CFSTR("ContinuityCaptureArgs");
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v13;
    v21[2] = &unk_24F07F960;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_activeStreams, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureCommand"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __76__CMContinuityCaptureTransportSidecarDevice__startStream_option_completion___block_invoke;
    v18[3] = &unk_24F06C608;
    v19 = v9;
    objc_msgSend(v16, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v15, v18);

  }
  else
  {
    CMContinuityCaptureLog(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureTransportSidecarDevice _startStream:option:completion:].cold.1();

    (*((void (**)(id, id))v9 + 2))(v9, v12);
  }

}

uint64_t __76__CMContinuityCaptureTransportSidecarDevice__startStream_option_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[3];
  id location;

  v8 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CMContinuityCaptureTransportSidecarDevice_stopStream_option_completion___block_invoke;
  block[3] = &unk_24F06B158;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v13[2] = (id)a4;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportSidecarDevice_stopStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_stopStream:option:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  CMContinuityCaptureTransportSidecarDevice *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  CMContinuityCaptureMediaIdentifierFromEntityType(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v9)
  {
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 1024;
      v24 = a3;
      v25 = 1024;
      v26 = a4;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ stopStream for entity %u option %d", buf, 0x18u);
    }

    v19[0] = CFSTR("ContinuityCaptureSelector");
    v19[1] = CFSTR("ContinuityCaptureArgs");
    v20[0] = &unk_24F07F948;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    v18[2] = &unk_24F07F960;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_activeStreams, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureCommand"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __75__CMContinuityCaptureTransportSidecarDevice__stopStream_option_completion___block_invoke;
    v16[3] = &unk_24F06C608;
    v17 = v8;
    objc_msgSend(v15, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v14, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __75__CMContinuityCaptureTransportSidecarDevice__stopStream_option_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CMContinuityCaptureTransportSidecarDevice_postEvent_entity_data___block_invoke;
  block[3] = &unk_24F06C3D8;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __67__CMContinuityCaptureTransportSidecarDevice_postEvent_entity_data___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_postEvent:entity:data:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  NSObject *queue;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  v15[0] = &unk_24F07F8E8;
  v14[0] = CFSTR("ContinuityCaptureSelector");
  v14[1] = CFSTR("ContinuityCaptureArgs");
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_activeStreams, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureCommand"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v11, &__block_literal_global_118);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_magicStateMonitor, 0);
  objc_storeStrong((id *)&self->_activeStreams, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __76__CMContinuityCaptureTransportSidecarDevice__setValueForControl_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = 138543618;
  v7 = WeakRetained;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_227C5D000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ setValueForControl completion error %@", (uint8_t *)&v6, 0x16u);

}

void __72__CMContinuityCaptureTransportSidecarDevice__handleAVCNegotiation_data___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = 138543874;
  v9 = WeakRetained;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_227C5D000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ handleAVCNegotiation SendMessage %@ Error %@", (uint8_t *)&v8, 0x20u);

}

- (void)_startStream:option:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ archivedDataWithRootObject Error %@");
  OUTLINED_FUNCTION_1_0();
}

@end
