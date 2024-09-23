@implementation CMContinuityCaptureSidecarServer

- (CMContinuityCaptureSidecarServer)initWithRequest:(id)a3
{
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;
  CMContinuityCaptureTransportSidecarDevice *v8;
  void *v9;
  void *v10;
  CMContinuityCaptureTransportSidecarDevice *v11;
  CMContinuityCaptureSidecarServer *v12;
  NSObject *v13;
  CMContinuityCaptureSidecarServer *v14;
  objc_super v16;
  uint8_t buf[4];
  CMContinuityCaptureSidecarServer *v18;
  __int16 v19;
  CMContinuityCaptureTransportSidecarDevice *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.continuity-capture-server", v6);

  if (v5)
  {
    v8 = [CMContinuityCaptureTransportSidecarDevice alloc];
    objc_msgSend(v5, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice](CMContinuityCaptureCapabilities, "capabilitiesForCurrentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CMContinuityCaptureTransportSidecarDevice initWithSidecarDevice:capabilities:remote:](v8, "initWithSidecarDevice:capabilities:remote:", v9, v10, 0);

    if (v11
      && (v16.receiver = self,
          v16.super_class = (Class)CMContinuityCaptureSidecarServer,
          v12 = -[CMContinuityCaptureSidecarTransportBase initWithDevice:queue:taskDelegate:](&v16, sel_initWithDevice_queue_taskDelegate_, v11, v7, 0), (self = v12) != 0))
    {
      objc_storeStrong((id *)&v12->_activeRequest, a3);
      objc_storeStrong((id *)&self->_device, v11);
      objc_storeStrong((id *)&self->_queue, v7);
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v18 = self;
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ created with device %{public}@", buf, 0x16u);
      }

      self = self;
      v14 = self;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v11 = 0;
  }

  return v14;
}

- (NSDate)sessionActivationStartTime
{
  return 0;
}

- (ContinuityCaptureTaskDelegate)delegate
{
  return (ContinuityCaptureTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMContinuityCaptureSidecarServer;
  v4 = a3;
  -[CMContinuityCaptureSidecarTransportBase setTaskDelegate:](&v5, sel_setTaskDelegate_, v4);
  objc_storeWeak((id *)&self->_delegate, v4);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CMContinuityCaptureTimeSyncClock)timeSyncClock
{
  CMContinuityCaptureSidecarServer *v2;
  CMContinuityCaptureTimeSyncClock *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timeSyncClock;
  objc_sync_exit(v2);

  return v3;
}

- (ContinuityCaptureTransportDevice)localDevice
{
  return (ContinuityCaptureTransportDevice *)self->_device;
}

- (int64_t)clientDeviceModel
{
  return 0;
}

- (int64_t)currentTransport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;

  -[CMContinuityCaptureSidecarTransportBase device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[CMContinuityCaptureSidecarTransportBase device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeStreams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[CMContinuityCaptureSidecarTransportBase device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeStreams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  objc_sync_exit(v3);
  if (v8)
  {
    objc_msgSend(v8, "stream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "transport");

    if (v10 == 2)
      v11 = 2;
    else
      v11 = v10 == 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)currentSessionID
{
  CMContinuityCaptureSidecarServer *v2;
  unint64_t currentSessionID;

  v2 = self;
  objc_sync_enter(v2);
  currentSessionID = v2->_currentSessionID;
  objc_sync_exit(v2);

  return currentSessionID;
}

- (void)setCurrentSessionID:(unint64_t)a3
{
  CMContinuityCaptureSidecarServer *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_currentSessionID = a3;
  objc_sync_exit(obj);

}

- (void)_resetRequest:(id)a3
{
  NSObject *v5;
  CMContinuityCaptureTransportSidecarDevice *device;
  void *v7;
  id v8;

  v8 = a3;
  -[CMContinuityCaptureSidecarServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v8)
  {
    device = self->_device;
    objc_msgSend(v8, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureTransportSidecarDevice resetDevice:](device, "resetDevice:", v7);

    objc_storeStrong((id *)&self->_activeRequest, a3);
    -[CMContinuityCaptureSidecarServer _activate](self, "_activate");
  }
  else
  {
    -[CMContinuityCaptureSidecarServer _cancel](self, "_cancel");
  }

}

- (void)resetRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureSidecarServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CMContinuityCaptureSidecarServer_resetRequest___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__CMContinuityCaptureSidecarServer_resetRequest___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[9], "setLegacyReconnectRecovery:", 1);
      v3 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(v4, "_resetRequest:", v3);
    WeakRetained = v4;
  }

}

- (void)activate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureSidecarServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__CMContinuityCaptureSidecarServer_activate__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__CMContinuityCaptureSidecarServer_activate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_activate");
    WeakRetained = v2;
  }

}

- (void)_activate
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  CMContinuityCaptureSidecarServer *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureSidecarServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = self;
    v7 = 2080;
    v8 = "-[CMContinuityCaptureSidecarServer _activate]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
  }

  if (self->_activeRequest)
    -[CMContinuityCaptureSidecarServer setupSidecarStreams](self, "setupSidecarStreams");
}

- (void)cancel
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureSidecarServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__CMContinuityCaptureSidecarServer_cancel__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__CMContinuityCaptureSidecarServer_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancel");
    WeakRetained = v2;
  }

}

- (void)_cancel
{
  NSObject *v3;
  NSObject *v4;
  SidecarRequest *activeRequest;
  int v6;
  CMContinuityCaptureSidecarServer *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureSidecarServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2080;
    v9 = "-[CMContinuityCaptureSidecarServer _cancel]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  -[CMContinuityCaptureSidecarServer teardownSidecarStreams](self, "teardownSidecarStreams");
  activeRequest = self->_activeRequest;
  self->_activeRequest = 0;

}

- (void)setupSidebandSidecarStreamForIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  -[SidecarRequest openStreamForType:identifier:completion:](self->_activeRequest, "openStreamForType:identifier:completion:", a4, a3, a5);
}

- (void)setupMediaSidecarStreamForIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  SidecarRequest *activeRequest;
  id v8;
  id v9;

  activeRequest = self->_activeRequest;
  v8 = a5;
  v9 = a3;
  -[SidecarRequest openStreamForType:flags:identifier:processUniqueID:completion:](activeRequest, "openStreamForType:flags:identifier:processUniqueID:completion:", a4, 2, v9, CMContinuityCaptureGetMediaProcessUniqueID(0), v8);

}

- (void)setupSidecarStreams
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  objc_super v7;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureSidecarServer *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7.receiver = self;
  v7.super_class = (Class)CMContinuityCaptureSidecarServer;
  -[CMContinuityCaptureSidecarTransportBase setupSidecarStreams](&v7, sel_setupSidecarStreams);
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ActivateRequest", buf, 0xCu);
  }

  -[SidecarRequest session](self->_activeRequest, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__CMContinuityCaptureSidecarServer_setupSidecarStreams__block_invoke;
  v5[3] = &unk_24F06C0A8;
  objc_copyWeak(&v6, &location);
  -[CMContinuityCaptureSidecarTransportBase createTimeSyncClockForSession:completion:](self, "createTimeSyncClockForSession:completion:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__CMContinuityCaptureSidecarServer_setupSidecarStreams__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("timeSyncClock"));
    v8 = v7;
    objc_sync_enter(v8);
    objc_storeStrong(v8 + 10, a2);
    objc_sync_exit(v8);

    objc_msgSend(v8, "didChangeValueForKey:", CFSTR("timeSyncClock"));
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_loadWeakRetained(v5);
      v11 = v8[10];
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ got timeSync clock %@", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (void)teardownSidecarStreams
{
  SidecarRequest *activeRequest;
  CMContinuityCaptureTimeSyncClock *timeSyncClock;
  objc_super v5;

  activeRequest = self->_activeRequest;
  self->_activeRequest = 0;

  timeSyncClock = self->_timeSyncClock;
  self->_timeSyncClock = 0;

  v5.receiver = self;
  v5.super_class = (Class)CMContinuityCaptureSidecarServer;
  -[CMContinuityCaptureSidecarTransportBase teardownSidecarStreams](&v5, sel_teardownSidecarStreams);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
}

@end
