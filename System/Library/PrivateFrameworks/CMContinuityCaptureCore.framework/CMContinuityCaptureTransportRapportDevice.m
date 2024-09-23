@implementation CMContinuityCaptureTransportRapportDevice

- (CMContinuityCaptureTransportRapportDevice)initWithRapportDevice:(id)a3 capabilities:(id)a4 remote:(BOOL)a5
{
  id v9;
  id v10;
  CMContinuityCaptureTransportRapportDevice *v11;
  CMContinuityCaptureTransportRapportDevice *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  NSUUID *deviceUUID;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *sidebandQueue;
  NSMutableDictionary *v23;
  NSMutableDictionary *activeStreams;
  void *v25;
  void *v26;
  CMContinuityCaptureMagicStateMonitor *v27;
  CMContinuityCaptureMagicStateMonitor *magicStateMonitor;
  CMContinuityCaptureTransportRapportDevice *v29;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CMContinuityCaptureTransportRapportDevice;
  v11 = -[CMContinuityCaptureTransportRapportDevice init](&v31, sel_init);
  v12 = v11;
  if (!v11 || (objc_storeStrong((id *)&v11->_device, a3), objc_storeStrong((id *)&v12->_capabilities, a4), !v10))
  {
LABEL_20:
    v29 = 0;
    goto LABEL_16;
  }
  v12->_remote = a5;
  v13 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v9, "idsDeviceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (objc_msgSend(v9, "idsDeviceIdentifier"), a4 = (id)objc_claimAutoreleasedReturnValue(),
                                                 objc_msgSend(a4, "length")))
  {
    objc_msgSend(v9, "idsDeviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = 1;
  }
  else
  {
    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v16 = 1;
  }
  v18 = objc_msgSend(v13, "initWithUUIDString:", v15);
  deviceUUID = v12->_deviceUUID;
  v12->_deviceUUID = (NSUUID *)v18;

  if (v16)
  {

    if (!v17)
    {
LABEL_9:
      if (!v14)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if (!v17)
  {
    goto LABEL_9;
  }

  if (v14)
LABEL_10:

LABEL_11:
  objc_storeStrong((id *)&v12->_queue, MEMORY[0x24BDAC9B8]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = dispatch_queue_create("com.apple.continuitycapture.sideband", v20);
  sidebandQueue = v12->_sidebandQueue;
  v12->_sidebandQueue = (OS_dispatch_queue *)v21;

  v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  activeStreams = v12->_activeStreams;
  v12->_activeStreams = v23;

  if (v12->_capabilities)
  {
    -[CMContinuityCaptureTransportRapportDevice capabilities](v12, "capabilities");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "devicesCapabilities");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_allFeaturesSupported = CMContinuityCaptureDeviceSupportsAllFeatures(v26);

  }
  if (v12->_remote)
  {
    v27 = -[CMContinuityCaptureMagicStateMonitor initWithDevice:]([CMContinuityCaptureMagicStateMonitor alloc], "initWithDevice:", v12);
    magicStateMonitor = v12->_magicStateMonitor;
    v12->_magicStateMonitor = v27;

    if (!v12->_magicStateMonitor)
      goto LABEL_20;
  }
  v29 = v12;
LABEL_16:

  return v29;
}

- (void)dealloc
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = self->_rpCompanionSidebandSessions;
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_rpCompanionSidebandSessions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
  v8.receiver = self;
  v8.super_class = (Class)CMContinuityCaptureTransportRapportDevice;
  -[CMContinuityCaptureTransportRapportDevice dealloc](&v8, sel_dealloc);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)resetDevice:(id)a3
{
  RPRemoteDisplayDevice *v4;
  RPRemoteDisplayDevice *device;
  CMContinuityCaptureTransportRapportDevice *obj;

  v4 = (RPRemoteDisplayDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  device = obj->_device;
  obj->_device = v4;

  objc_sync_exit(obj);
}

- (BOOL)canReconnect
{
  return -[CMContinuityCaptureTransportRapportDevice userDisconnected](self, "userDisconnected")
      && -[CMContinuityCaptureTransportRapportDevice wired](self, "wired")
      && !-[CMContinuityCaptureTransportRapportDevice disconnectedWhileWired](self, "disconnectedWhileWired");
}

- (RPRemoteDisplayDevice)device
{
  CMContinuityCaptureTransportRapportDevice *v2;
  RPRemoteDisplayDevice *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (void)teardownActiveRapportStreams
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CMContinuityCaptureTransportRapportDevice_teardownActiveRapportStreams__block_invoke;
  block[3] = &unk_24F06AEB0;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
}

uint64_t __73__CMContinuityCaptureTransportRapportDevice_teardownActiveRapportStreams__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6), "stream");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "invalidate");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("activeStreams"));
  v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_sync_exit(v8);

  v10 = *(void **)(a1 + 32);
  v9 = (id *)(a1 + 32);
  objc_msgSend(v10, "didChangeValueForKey:", CFSTR("activeStreams"));
  objc_msgSend(*v9, "willChangeValueForKey:", CFSTR("active"));
  *((_BYTE *)*v9 + 88) = 0;
  return objc_msgSend(*v9, "didChangeValueForKey:", CFSTR("active"));
}

- (void)addStream:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  CMContinuityCaptureTransportRapportDevice *v10;
  uint8_t buf[4];
  CMContinuityCaptureTransportRapportDevice *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v12 = self;
    v13 = 2080;
    v14 = "-[CMContinuityCaptureTransportRapportDevice addStream:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__CMContinuityCaptureTransportRapportDevice_addStream___block_invoke;
  v8[3] = &unk_24F06ADE8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async_and_wait(queue, v8);

}

void __55__CMContinuityCaptureTransportRapportDevice_addStream___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  CMContinuityCaptureTransportDeviceRapportStream *v6;

  v6 = -[CMContinuityCaptureTransportDeviceRapportStream initWithRapportStream:]([CMContinuityCaptureTransportDeviceRapportStream alloc], "initWithRapportStream:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "willChangeValueForKey:", CFSTR("activeStreams"));
  v2 = *(id *)(a1 + 40);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "count");
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  objc_msgSend(*(id *)(a1 + 32), "streamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  objc_sync_exit(v2);
  objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", CFSTR("activeStreams"));
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "willChangeValueForKey:", CFSTR("active"));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 88) = 1;
    objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", CFSTR("active"));
  }

}

- (void)removeStream:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  CMContinuityCaptureTransportRapportDevice *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v11 = self;
    v12 = 2080;
    v13 = "-[CMContinuityCaptureTransportRapportDevice removeStream:]";
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  objc_msgSend(v4, "invalidate");
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__CMContinuityCaptureTransportRapportDevice_removeStream___block_invoke;
  v8[3] = &unk_24F06ADE8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async_and_wait(queue, v8);

}

void __58__CMContinuityCaptureTransportRapportDevice_removeStream___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _BYTE *v13;
  id v14;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  objc_sync_exit(v2);

  objc_msgSend(*(id *)(a1 + 40), "streamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
    objc_sync_exit(v6);

    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("activeStreams"));
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

    objc_sync_exit(v8);
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("activeStreams"));
    v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    v14 = *(id *)(*(_QWORD *)(a1 + 32) + 56);

    objc_sync_exit(v11);
    if (objc_msgSend(v14, "count") || !v7)
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("active"));
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("active"));
LABEL_10:
    v12 = v14;
    goto LABEL_11;
  }
  if (!objc_msgSend(v3, "count"))
  {
    v13 = *(_BYTE **)(a1 + 32);
    if (v13[88])
    {
      objc_msgSend(v13, "willChangeValueForKey:", CFSTR("active"));
      v14 = v3;
      goto LABEL_9;
    }
  }
  v12 = v3;
LABEL_11:

}

- (BOOL)hasStreamIntent
{
  CMContinuityCaptureTransportRapportDevice *v2;
  BOOL streamIntent;

  v2 = self;
  objc_sync_enter(v2);
  streamIntent = v2->_streamIntent;
  objc_sync_exit(v2);

  return streamIntent;
}

- (void)setStreamIntent:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  CMContinuityCaptureTransportRapportDevice *v6;
  int v7;
  CMContinuityCaptureTransportRapportDevice *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543874;
    v8 = self;
    v9 = 2080;
    v10 = "-[CMContinuityCaptureTransportRapportDevice setStreamIntent:]";
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %d", (uint8_t *)&v7, 0x1Cu);
  }

  v6 = self;
  objc_sync_enter(v6);
  v6->_streamIntent = v3;
  objc_sync_exit(v6);

}

- (BOOL)active
{
  CMContinuityCaptureTransportRapportDevice *v2;
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

- (CMContinuityCaptureMagicStateMonitor)magicStateMonitor
{
  return self->_magicStateMonitor;
}

- (NSArray)activeStreams
{
  CMContinuityCaptureTransportRapportDevice *v2;
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
  CMContinuityCaptureTransportRapportDevice *v4;
  CMContinuityCaptureTransportRapportDevice *obj;

  v4 = self;
  objc_sync_enter(v4);
  v4->_userDisconnected = a3;
  objc_sync_exit(v4);

  if (-[CMContinuityCaptureTransportRapportDevice wired](v4, "wired"))
  {
    obj = v4;
    objc_sync_enter(obj);
    obj->_disconnectedWhileWired = 1;
    objc_sync_exit(obj);

  }
}

- (BOOL)userDisconnected
{
  CMContinuityCaptureTransportRapportDevice *v2;
  BOOL userDisconnected;

  v2 = self;
  objc_sync_enter(v2);
  userDisconnected = v2->_userDisconnected;
  objc_sync_exit(v2);

  return userDisconnected;
}

- (BOOL)disconnectedWhileWired
{
  CMContinuityCaptureTransportRapportDevice *v2;
  BOOL disconnectedWhileWired;

  v2 = self;
  objc_sync_enter(v2);
  disconnectedWhileWired = v2->_disconnectedWhileWired;
  objc_sync_exit(v2);

  return disconnectedWhileWired;
}

- (BOOL)wifiP2pActive
{
  void *v2;
  unint64_t v3;

  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "statusFlags") >> 9) & 1;

  return v3;
}

- (BOOL)allFeaturesSupported
{
  return self->_allFeaturesSupported;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceUUID;
}

- (NSString)deviceName
{
  void *v2;
  void *v3;

  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)deviceModel
{
  void *v2;
  void *v3;

  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
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

  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
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

  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusFlags");

  return v3;
}

- (BOOL)wired
{
  void *v2;
  unint64_t v3;

  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "statusFlags") >> 24) & 1;

  return v3;
}

- (BOOL)usable
{
  void *v2;
  BOOL v3;

  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cameraState") == 1;

  return v3;
}

- (unint64_t)deviceMajorVersion
{
  CMContinuityCaptureTransportRapportDevice *v2;
  unint64_t deviceMajorVersion;

  v2 = self;
  objc_sync_enter(v2);
  deviceMajorVersion = v2->_deviceMajorVersion;
  objc_sync_exit(v2);

  return deviceMajorVersion;
}

- (void)setDeviceMajorVersion:(unint64_t)a3
{
  CMContinuityCaptureTransportRapportDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_deviceMajorVersion = a3;
  objc_sync_exit(obj);

}

- (unint64_t)deviceMinorVersion
{
  CMContinuityCaptureTransportRapportDevice *v2;
  unint64_t deviceMinorVersion;

  v2 = self;
  objc_sync_enter(v2);
  deviceMinorVersion = v2->_deviceMinorVersion;
  objc_sync_exit(v2);

  return deviceMinorVersion;
}

- (void)setDeviceMinorVersion:(unint64_t)a3
{
  CMContinuityCaptureTransportRapportDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_deviceMinorVersion = a3;
  objc_sync_exit(obj);

}

- (BOOL)terminationDeferred
{
  CMContinuityCaptureTransportRapportDevice *v2;
  BOOL terminationDeferred;

  v2 = self;
  objc_sync_enter(v2);
  terminationDeferred = v2->_terminationDeferred;
  objc_sync_exit(v2);

  return terminationDeferred;
}

- (void)setTerminationDeferred:(BOOL)a3
{
  CMContinuityCaptureTransportRapportDevice *obj;

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

  if (-[CMContinuityCaptureTransportRapportDevice hasStreamIntent](self, "hasStreamIntent")
    && !-[CMContinuityCaptureTransportRapportDevice userDisconnected](self, "userDisconnected"))
  {
    -[CMContinuityCaptureTransportRapportDevice capabilities](self, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CMContinuityCaptureTransportRapportDevice capabilities](self, "capabilities");
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
  CMContinuityCaptureTransportRapportDevice *v2;
  BOOL placementStepSkipped;

  v2 = self;
  objc_sync_enter(v2);
  placementStepSkipped = v2->_placementStepSkipped;
  objc_sync_exit(v2);

  return placementStepSkipped;
}

- (BOOL)guest
{
  void *v2;
  unint64_t v3;

  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "statusFlags") >> 37) & 1;

  return v3;
}

- (BOOL)legacyReconnectRecovery
{
  return 0;
}

- (void)setPlacementStepSkipped:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  CMContinuityCaptureTransportRapportDevice *v6;
  int v7;
  CMContinuityCaptureTransportRapportDevice *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = self;
    v9 = 2080;
    v10 = "-[CMContinuityCaptureTransportRapportDevice setPlacementStepSkipped:]";
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s %d", (uint8_t *)&v7, 0x1Cu);
  }

  v6 = self;
  objc_sync_enter(v6);
  v6->_placementStepSkipped = v3;
  objc_sync_exit(v6);

}

- (void)notifyDeviceStateChange
{
  CMContinuityCaptureTransportRapportDevice *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!-[CMContinuityCaptureTransportRapportDevice wired](self, "wired")
    && -[CMContinuityCaptureTransportRapportDevice userDisconnected](self, "userDisconnected"))
  {
    v3 = self;
    objc_sync_enter(v3);
    v3->_disconnectedWhileWired = 0;
    objc_sync_exit(v3);

  }
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CMContinuityCaptureTransportRapportDevice notifyDeviceStateChange]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[CMContinuityCaptureTransportRapportDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("deviceStatus"));
  -[CMContinuityCaptureTransportRapportDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("deviceStatus"));
  -[CMContinuityCaptureTransportRapportDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("usable"));
  -[CMContinuityCaptureTransportRapportDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("usable"));
  -[CMContinuityCaptureTransportRapportDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("wired"));
  -[CMContinuityCaptureTransportRapportDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("wired"));
  -[CMContinuityCaptureTransportRapportDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("nearby"));
  -[CMContinuityCaptureTransportRapportDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("nearby"));
}

- (void)relayUserDisconnectForTransport:(int64_t)a3 reason:(id)a4 shieldSessionID:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __100__CMContinuityCaptureTransportRapportDevice_relayUserDisconnectForTransport_reason_shieldSessionID___block_invoke;
  v13[3] = &unk_24F06CF38;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __100__CMContinuityCaptureTransportRapportDevice_relayUserDisconnectForTransport_reason_shieldSessionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("ContinuityCaptureRapportClientMessageTypeKey");
  v5[1] = CFSTR("ContinuityCaptureRapportClientUserDisconnectReasonKey");
  v3 = (void *)a1[4];
  v2 = a1[5];
  v6[0] = &unk_24F07FAC8;
  v6[1] = v2;
  v5[2] = CFSTR("ContinuityCaptureRapportClientShieldSessionIDKey");
  v6[2] = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_relaySidebandMessageType:overTransport:", v4, a1[7]);

}

- (void)preLaunchShieldUIForTransport:(int64_t)a3 data:(id)a4
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
  v9[2] = __80__CMContinuityCaptureTransportRapportDevice_preLaunchShieldUIForTransport_data___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a3;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureTransportRapportDevice_preLaunchShieldUIForTransport_data___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24F07FAE0, CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ContinuityCaptureRapportClientShieldLaunchDataKey"));
    objc_msgSend(v5, "_relaySidebandMessageType:overTransport:", v3, *(_QWORD *)(a1 + 48));

    WeakRetained = v5;
  }

}

- (void)relaySkipPlacementStepForTranport:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__CMContinuityCaptureTransportRapportDevice_relaySkipPlacementStepForTranport___block_invoke;
  block[3] = &unk_24F06C780;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __79__CMContinuityCaptureTransportRapportDevice_relaySkipPlacementStepForTranport___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = CFSTR("ContinuityCaptureRapportClientMessageTypeKey");
    v5[0] = &unk_24F07FAF8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_relaySidebandMessageType:overTransport:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)updateSystemState
{
  NSObject *v3;
  NSObject *queue;
  _QWORD v5[5];
  id v6;
  _BYTE buf[12];
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v8 = 2080;
    v9 = "-[CMContinuityCaptureTransportRapportDevice updateSystemState]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__CMContinuityCaptureTransportRapportDevice_updateSystemState__block_invoke;
  v5[3] = &unk_24F06AE88;
  objc_copyWeak(&v6, (id *)buf);
  v5[4] = self;
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __62__CMContinuityCaptureTransportRapportDevice_updateSystemState__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "wired") & 1) != 0)
    {
      v4 = 2;
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "wifiP2pActive") & 1) == 0)
      {
        CMContinuityCaptureLog(2);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __62__CMContinuityCaptureTransportRapportDevice_updateSystemState__block_invoke_cold_1(v2, v6);
        goto LABEL_11;
      }
      v4 = 1;
    }
    CMContinuityCaptureLog(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = WeakRetained;
      v11 = 2080;
      v12 = "-[CMContinuityCaptureTransportRapportDevice updateSystemState]_block_invoke";
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s: calling _relaySidebandMessageType of ContinuityCaptureRapportSidebandClientMessageTypeUpdateSystemState", buf, 0x16u);
    }

    v7 = CFSTR("ContinuityCaptureRapportClientMessageTypeKey");
    v8 = &unk_24F07FB10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_relaySidebandMessageType:overTransport:", v6, v4);
LABEL_11:

  }
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5 forTransport:(int64_t)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[3];
  id location;

  v10 = a3;
  v11 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__CMContinuityCaptureTransportRapportDevice_postEvent_entity_data_forTransport___block_invoke;
  v15[3] = &unk_24F06CF60;
  objc_copyWeak(v18, &location);
  v16 = v10;
  v17 = v11;
  v18[1] = (id)a4;
  v18[2] = (id)a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureTransportRapportDevice_postEvent_entity_data_forTransport___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8[0] = CFSTR("ContinuityCaptureRapportClientMessageTypeKey");
    v8[1] = CFSTR("ContinuityCaptureRapportClientEventNameKey");
    v3 = *(_QWORD *)(a1 + 32);
    v9[0] = &unk_24F07FB28;
    v9[1] = v3;
    v8[2] = CFSTR("ContinuityCaptureRapportClientEventEntityTypeKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v8[3] = CFSTR("ContinuityCaptureRapportClientEventDataKey");
    v6 = *(_QWORD *)(a1 + 40);
    if (!v6)
      v6 = MEMORY[0x24BDBD1B8];
    v9[2] = v4;
    v9[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_relaySidebandMessageType:overTransport:", v7, *(_QWORD *)(a1 + 64));

  }
}

+ (void)queryCameraCapabilitiesFromRemoteDevice:(id)a3 transport:(int64_t)a4
{
  int v4;
  id v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  NSObject *v18;
  id v19;
  _BYTE buf[12];
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "+[CMContinuityCaptureTransportRapportDevice queryCameraCapabilitiesFromRemoteDevice:transport:]";
    v21 = 2114;
    v22 = v5;
    v23 = 1024;
    v24 = v4;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%s for device %{public}@ for transport %d", buf, 0x1Cu);
  }

  v7 = dispatch_semaphore_create(0);
  v8 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
  v9 = objc_alloc_init(MEMORY[0x24BE7CBF8]);
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v10);

  objc_msgSend(v8, "setDestinationDevice:", v9);
  objc_msgSend(v8, "setServiceType:", CFSTR("com.apple.continuitycapture.sideband"));
  dispatch_get_global_queue(0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDispatchQueue:", v11);

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v8);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __95__CMContinuityCaptureTransportRapportDevice_queryCameraCapabilitiesFromRemoteDevice_transport___block_invoke;
  v17 = &unk_24F06B500;
  objc_copyWeak(&v19, (id *)buf);
  v12 = v7;
  v18 = v12;
  objc_msgSend(v8, "activateWithCompletion:", &v14);
  v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  objc_msgSend(v8, "invalidate", v14, v15, v16, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __95__CMContinuityCaptureTransportRapportDevice_queryCameraCapabilitiesFromRemoteDevice_transport___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = CFSTR("ContinuityCaptureRapportClientMessageTypeKey");
    v7[0] = &unk_24F07FB40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __95__CMContinuityCaptureTransportRapportDevice_queryCameraCapabilitiesFromRemoteDevice_transport___block_invoke_142;
    v4[3] = &unk_24F06CF88;
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "sendEventID:event:options:completion:", CFSTR("ContinuityCaptureSidebandSessionEventID"), v3, 0, v4);

  }
}

void __95__CMContinuityCaptureTransportRapportDevice_queryCameraCapabilitiesFromRemoteDevice_transport___block_invoke_142(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "+[CMContinuityCaptureTransportRapportDevice queryCameraCapabilitiesFromRemoteDevice:transport:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s inErrorMessageSend %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_relaySidebandMessageType:(id)a3 overTransport:(int64_t)a4
{
  char *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *rpCompanionSidebandSessions;
  NSMutableArray *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSObject *v18;
  uint64_t v19;
  char *v20;
  dispatch_time_t v21;
  NSObject *sidebandQueue;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD v27[5];
  char *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  _BYTE buf[12];
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    v38 = 2112;
    v39 = v6;
    v40 = 1024;
    LODWORD(v41) = a4;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ relay message %@ for transport %d", buf, 0x1Cu);
  }

  -[CMContinuityCaptureTransportRapportDevice queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
  v23 = objc_alloc_init(MEMORY[0x24BE7CBF8]);
  -[CMContinuityCaptureTransportRapportDevice device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIdentifier:", v11);

  objc_msgSend(v9, "setDestinationDevice:", v23);
  objc_msgSend(v9, "setServiceType:", CFSTR("com.apple.continuitycapture.sideband"));
  objc_msgSend(v9, "setDispatchQueue:", self->_sidebandQueue);
  v12 = objc_msgSend(v9, "controlFlags");
  v13 = 6;
  if (a4 == 2)
    v13 = 0x40000;
  objc_msgSend(v9, "setControlFlags:", v12 | v13);
  rpCompanionSidebandSessions = self->_rpCompanionSidebandSessions;
  if (!rpCompanionSidebandSessions)
  {
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = self->_rpCompanionSidebandSessions;
    self->_rpCompanionSidebandSessions = v15;

    rpCompanionSidebandSessions = self->_rpCompanionSidebandSessions;
  }
  v17 = rpCompanionSidebandSessions;
  objc_sync_enter(v17);
  -[NSMutableArray addObject:](self->_rpCompanionSidebandSessions, "addObject:", v9);
  objc_sync_exit(v17);

  CMContinuityCaptureLog(2);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    v38 = 2082;
    v39 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]";
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s created sideband session %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v9);
  v19 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke;
  v33[3] = &unk_24F06C9E0;
  objc_copyWeak(&v34, &location);
  objc_copyWeak(&v35, (id *)buf);
  objc_msgSend(v9, "setInterruptionHandler:", v33);
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_145;
  v30[3] = &unk_24F06C9E0;
  objc_copyWeak(&v31, &location);
  objc_copyWeak(&v32, (id *)buf);
  objc_msgSend(v9, "setInvalidationHandler:", v30);
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_146;
  v27[3] = &unk_24F06CFD8;
  v27[4] = self;
  objc_copyWeak(&v29, (id *)buf);
  v20 = v6;
  v28 = v20;
  objc_msgSend(v9, "activateWithCompletion:", v27);
  v21 = dispatch_time(0, 5000000000);
  sidebandQueue = self->_sidebandQueue;
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_150;
  block[3] = &unk_24F06C9E0;
  objc_copyWeak(&v25, &location);
  objc_copyWeak(&v26, (id *)buf);
  dispatch_after(v21, sidebandQueue, block);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);

  objc_destroyWeak(&location);
}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  id v7;
  id *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v10 = 138543874;
    v11 = WeakRetained;
    v12 = 2082;
    v13 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]_block_invoke";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s interrupted sideband session %@", (uint8_t *)&v10, 0x20u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    v7 = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id *)v7;
    if (v7)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)v7 + 10));
      v9 = v8[14];
      objc_sync_enter(v9);
      objc_msgSend(v8[14], "removeObject:", v6);
      objc_sync_exit(v9);

    }
  }

}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_145(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  id *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = 138543874;
    v10 = WeakRetained;
    v11 = 2082;
    v12 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]_block_invoke";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s invalidated sideband session %@", (uint8_t *)&v9, 0x20u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = (id *)v6;
    if (v6)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)v6 + 10));
      v8 = v7[14];
      objc_sync_enter(v8);
      objc_msgSend(v7[14], "removeObject:", v5);
      objc_sync_exit(v8);

    }
  }

}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v13 = v5;
    v14 = 2082;
    v15 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]_block_invoke";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s error %@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = (void *)GestaltCopyAnswer();
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE7CD08]);
    objc_msgSend(v8, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_149;
    v10[3] = &unk_24F06CFB0;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v9 = v8;
    objc_msgSend(WeakRetained, "sendEventID:event:options:completion:", CFSTR("ContinuityCaptureSidebandSessionEventID"), v9, 0, v10);

  }
}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_149(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138544130;
    v8 = v5;
    v9 = 2082;
    v10 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]_block_invoke";
    v11 = 2114;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s %{public}@ inErrorMessageSend %@", (uint8_t *)&v7, 0x2Au);
  }

}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_150(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  id *v7;
  id *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v10 = 138543618;
    v11 = WeakRetained;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating sideband session after message send timeout %@", (uint8_t *)&v10, 0x16u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    v7 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    v8 = v7;
    if (v7)
    {
      v9 = v7[14];
      objc_sync_enter(v9);
      objc_msgSend(v8[14], "removeObject:", v6);
      objc_sync_exit(v9);

    }
  }

}

- (CMContinuityCaptureCapabilities)capabilities
{
  CMContinuityCaptureTransportRapportDevice *v2;
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
  CMContinuityCaptureTransportRapportDevice *obj;

  v4 = (CMContinuityCaptureCapabilities *)a3;
  obj = self;
  objc_sync_enter(obj);
  capabilities = obj->_capabilities;
  obj->_capabilities = v4;

  objc_sync_exit(obj);
}

- (BOOL)nearby
{
  CMContinuityCaptureTransportRapportDevice *v2;
  BOOL nearby;

  v2 = self;
  objc_sync_enter(v2);
  nearby = v2->_nearby;
  objc_sync_exit(v2);

  return nearby;
}

- (void)setNearby:(BOOL)a3
{
  CMContinuityCaptureTransportRapportDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_nearby = a3;
  objc_sync_exit(obj);

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
  -[CMContinuityCaptureTransportRapportDevice deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CMContinuityCaptureTransportRapportDevice deviceIdentifier](self, "deviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, v8, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, 0, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

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
  block[2] = __120__CMContinuityCaptureTransportRapportDevice_synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke;
  block[3] = &unk_24F06C5C0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v11[2] = (id)a4;
  v11[3] = (id)a5;
  dispatch_async(queue, block);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __120__CMContinuityCaptureTransportRapportDevice_synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke(uint64_t a1)
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

- (id)activeStreamForIdentifier:(id)a3
{
  id v4;
  CMContinuityCaptureTransportRapportDevice *v5;
  void *v6;
  NSObject *v7;
  int v9;
  CMContinuityCaptureTransportRapportDevice *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_activeStreams, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (!v6)
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid stream for %{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  return v6;
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
  v22[0] = &unk_24F07FAF8;
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

  -[CMContinuityCaptureTransportRapportDevice activeStreamForIdentifier:](self, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureCommand"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __121__CMContinuityCaptureTransportRapportDevice__synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke;
  v16[3] = &unk_24F06B500;
  objc_copyWeak(&v18, &location);
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v15, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __121__CMContinuityCaptureTransportRapportDevice__synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke(uint64_t a1, uint64_t a2)
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
    v9 = 2114;
    v10 = v6;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ SendMessage %{public}@ Error %@", (uint8_t *)&v7, 0x20u);

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
  v9[2] = __73__CMContinuityCaptureTransportRapportDevice_didCaptureStillImage_entity___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a4;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __73__CMContinuityCaptureTransportRapportDevice_didCaptureStillImage_entity___block_invoke(uint64_t a1)
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
  CMContinuityCaptureTransportRapportDevice *v23;
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
    v21[0] = &unk_24F07FAE0;
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

    -[CMContinuityCaptureTransportRapportDevice activeStreamForIdentifier:](self, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __74__CMContinuityCaptureTransportRapportDevice__didCaptureStillImage_entity___block_invoke;
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

void __74__CMContinuityCaptureTransportRapportDevice__didCaptureStillImage_entity___block_invoke(uint64_t a1, uint64_t a2)
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
  v4[2] = __82__CMContinuityCaptureTransportRapportDevice_handleSynchronizeAudioClockCompletion__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __82__CMContinuityCaptureTransportRapportDevice_handleSynchronizeAudioClockCompletion__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4[0] = CFSTR("ContinuityCaptureSelector");
    v4[1] = CFSTR("ContinuityCaptureArgs");
    v5[0] = &unk_24F07FB40;
    v5[1] = &unk_24F07FE08;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureCommand"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v2, &__block_literal_global_20);

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
  block[2] = __81__CMContinuityCaptureTransportRapportDevice_captureStillImage_entity_completion___block_invoke;
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

void __81__CMContinuityCaptureTransportRapportDevice_captureStillImage_entity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
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
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (v4)
    {
      v17[0] = &unk_24F07FB58;
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

      objc_msgSend(WeakRetained, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureCommand"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __81__CMContinuityCaptureTransportRapportDevice_captureStillImage_entity_completion___block_invoke_155;
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

uint64_t __81__CMContinuityCaptureTransportRapportDevice_captureStillImage_entity_completion___block_invoke_155(uint64_t a1)
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
  v9[2] = __74__CMContinuityCaptureTransportRapportDevice_enqueueReactionEffect_entity___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a4;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportRapportDevice_enqueueReactionEffect_entity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v14 = WeakRetained;
      v15 = 2114;
      v16 = v4;
      v17 = 1024;
      v18 = v5;
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueReactionEffect %{public}@ entity:%d", buf, 0x1Cu);
    }

    v12[0] = &unk_24F07FB70;
    v11[0] = CFSTR("ContinuityCaptureSelector");
    v11[1] = CFSTR("ContinuityCaptureArgs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureCommand"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v8, &__block_literal_global_158);

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
  v11[2] = __75__CMContinuityCaptureTransportRapportDevice_setValueForControl_completion___block_invoke;
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

void __75__CMContinuityCaptureTransportRapportDevice_setValueForControl_completion___block_invoke(uint64_t a1)
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
  CMContinuityCaptureTransportRapportDevice *v25;
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
  v17[2] = __76__CMContinuityCaptureTransportRapportDevice__setValueForControl_completion___block_invoke;
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
    v23[0] = &unk_24F07FAC8;
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

    -[CMContinuityCaptureTransportRapportDevice activeStreamForIdentifier:](self, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureControl"));
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

uint64_t __76__CMContinuityCaptureTransportRapportDevice__setValueForControl_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;

  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __76__CMContinuityCaptureTransportRapportDevice__setValueForControl_completion___block_invoke_cold_1(a1, a2, v4);

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
  v9[2] = __71__CMContinuityCaptureTransportRapportDevice_handleAVCNegotiation_data___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureTransportRapportDevice_handleAVCNegotiation_data___block_invoke(uint64_t a1)
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
  CMContinuityCaptureTransportRapportDevice *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v24[0] = CFSTR("ContinuityCaptureSelector");
  v24[1] = CFSTR("ContinuityCaptureArgs");
  v25[0] = &unk_24F07FB88;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v18 = self;
    v19 = 2080;
    v20 = "-[CMContinuityCaptureTransportRapportDevice _handleAVCNegotiation:data:]";
    v21 = 1024;
    v22 = a3;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s for entity %d", buf, 0x1Cu);
  }

  -[CMContinuityCaptureTransportRapportDevice activeStreamForIdentifier:](self, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureControl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__CMContinuityCaptureTransportRapportDevice__handleAVCNegotiation_data___block_invoke;
  v13[3] = &unk_24F06B500;
  objc_copyWeak(&v15, &location);
  v12 = v9;
  v14 = v12;
  objc_msgSend(v11, "sendMessage:message:completion:", CFSTR("ContinuityCaptureControl"), v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __72__CMContinuityCaptureTransportRapportDevice__handleAVCNegotiation_data___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __72__CMContinuityCaptureTransportRapportDevice__handleAVCNegotiation_data___block_invoke_cold_1(a1, (uint64_t)v3, v4);

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
  block[2] = __75__CMContinuityCaptureTransportRapportDevice_startStream_option_completion___block_invoke;
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

void __75__CMContinuityCaptureTransportRapportDevice_startStream_option_completion___block_invoke(uint64_t a1)
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
  CMContinuityCaptureTransportRapportDevice *v25;
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
    v23[0] = &unk_24F07FAC8;
    v22[0] = CFSTR("ContinuityCaptureSelector");
    v22[1] = CFSTR("ContinuityCaptureArgs");
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v13;
    v21[2] = &unk_24F07FBA0;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMContinuityCaptureTransportRapportDevice activeStreamForIdentifier:](self, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureCommand"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __76__CMContinuityCaptureTransportRapportDevice__startStream_option_completion___block_invoke;
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

uint64_t __76__CMContinuityCaptureTransportRapportDevice__startStream_option_completion___block_invoke(uint64_t a1)
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
  block[2] = __74__CMContinuityCaptureTransportRapportDevice_stopStream_option_completion___block_invoke;
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

void __74__CMContinuityCaptureTransportRapportDevice_stopStream_option_completion___block_invoke(uint64_t a1)
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
  CMContinuityCaptureTransportRapportDevice *v22;
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
    v20[0] = &unk_24F07FB88;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    v18[2] = &unk_24F07FBA0;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMContinuityCaptureTransportRapportDevice activeStreamForIdentifier:](self, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureCommand"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __75__CMContinuityCaptureTransportRapportDevice__stopStream_option_completion___block_invoke;
    v16[3] = &unk_24F06C608;
    v17 = v8;
    objc_msgSend(v15, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v14, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __75__CMContinuityCaptureTransportRapportDevice__stopStream_option_completion___block_invoke(uint64_t a1)
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
  block[2] = __67__CMContinuityCaptureTransportRapportDevice_postEvent_entity_data___block_invoke;
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

void __67__CMContinuityCaptureTransportRapportDevice_postEvent_entity_data___block_invoke(uint64_t a1)
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
  v15[0] = &unk_24F07FB28;
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

  -[CMContinuityCaptureTransportRapportDevice activeStreamForIdentifier:](self, "activeStreamForIdentifier:", CFSTR("ContinuityCaptureCommand"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:message:completion:", CFSTR("ContinuityCaptureCommand"), v11, &__block_literal_global_162);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpCompanionSidebandSessions, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_sidebandQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_magicStateMonitor, 0);
  objc_storeStrong((id *)&self->_activeStreams, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __62__CMContinuityCaptureTransportRapportDevice_updateSystemState__block_invoke_cold_1(id *a1, NSObject *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_2_0();
  v6 = 2080;
  v7 = "-[CMContinuityCaptureTransportRapportDevice updateSystemState]_block_invoke";
  OUTLINED_FUNCTION_2_2(&dword_227C5D000, a2, v4, "%@ %s No valid transport to query state", v5);

  OUTLINED_FUNCTION_8();
}

void __76__CMContinuityCaptureTransportRapportDevice__setValueForControl_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
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

  OUTLINED_FUNCTION_13_0();
}

void __72__CMContinuityCaptureTransportRapportDevice__handleAVCNegotiation_data___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  OUTLINED_FUNCTION_2_0();
  v8 = 2112;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_227C5D000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ handleAVCNegotiation SendMessage %@ Error %@", v7, 0x20u);

}

@end
