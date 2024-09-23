@implementation CMContinuityCaptureRapportServer

- (CMContinuityCaptureRapportServer)initWithRapportDisplaySession:(id)a3 queue:(id)a4 voucher:(id)a5 incomingStreamRequestHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CMContinuityCaptureRapportServer *v15;
  NSMutableSet *v16;
  NSMutableSet *createdIdentifiers;
  NSMutableDictionary *v18;
  NSMutableDictionary *pendingActivateStreamsByIdentifier;
  CMContinuityCaptureRemoteCompositeDevice *v20;
  CMContinuityCaptureRemoteCompositeDevice *compositeDevice;
  NSObject *v22;
  CMContinuityCaptureRemoteCompositeDevice *v23;
  CMContinuityCaptureRapportServer *v24;
  objc_super v26;
  uint8_t buf[4];
  CMContinuityCaptureRapportServer *v28;
  __int16 v29;
  CMContinuityCaptureRemoteCompositeDevice *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[CMContinuityCaptureRapportServer rapportDeviceForSession:](CMContinuityCaptureRapportServer, "rapportDeviceForSession:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (v26.receiver = self,
        v26.super_class = (Class)CMContinuityCaptureRapportServer,
        v15 = -[CMContinuityCaptureRapportTransportBase initWithRapportDevice:queue:taskDelegate:](&v26, sel_initWithRapportDevice_queue_taskDelegate_, v14, v11, 0), (self = v15) != 0))
  {
    objc_storeStrong((id *)&v15->_queue, a4);
    objc_storeStrong((id *)&self->_voucher, a5);
    objc_storeStrong((id *)&self->_device, v14);
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    createdIdentifiers = self->_createdIdentifiers;
    self->_createdIdentifiers = v16;

    self->_clientDeviceModel = objc_msgSend(v14, "deviceModelType");
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingActivateStreamsByIdentifier = self->_pendingActivateStreamsByIdentifier;
    self->_pendingActivateStreamsByIdentifier = v18;

    -[CMContinuityCaptureRapportTransportBase setIncomingStreamRequestHandler:](self, "setIncomingStreamRequestHandler:", v13);
    v20 = -[CMContinuityCaptureRemoteCompositeDevice initWithTransportServer:videoPreviewLayer:]([CMContinuityCaptureRemoteCompositeDevice alloc], "initWithTransportServer:videoPreviewLayer:", self, 0);
    compositeDevice = self->_compositeDevice;
    self->_compositeDevice = v20;

    CMContinuityCaptureLog(2);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_compositeDevice;
      *(_DWORD *)buf = 138543618;
      v28 = self;
      v29 = 2114;
      v30 = v23;
      _os_log_impl(&dword_227C5D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ composite device %{public}@", buf, 0x16u);
    }

    -[CMContinuityCaptureRapportServer setupRemoteDisplaySession:](self, "setupRemoteDisplaySession:", v10);
    self = self;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (int64_t)clientDeviceModel
{
  return self->_clientDeviceModel;
}

- (void)resetDisplaySession:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _BYTE buf[12];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v12 = 2080;
    v13 = "-[CMContinuityCaptureRapportServer resetDisplaySession:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__CMContinuityCaptureRapportServer_resetDisplaySession___block_invoke;
  v8[3] = &unk_24F06AE88;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __56__CMContinuityCaptureRapportServer_resetDisplaySession___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[10];
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "destinationDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetDevice:", v4);

    objc_msgSend(v5, "setupRemoteDisplaySession:", *(_QWORD *)(a1 + 32));
    WeakRetained = v5;
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
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
  v5.super_class = (Class)CMContinuityCaptureRapportServer;
  v4 = a3;
  -[CMContinuityCaptureRapportTransportBase setTaskDelegate:](&v5, sel_setTaskDelegate_, v4);
  objc_storeWeak((id *)&self->_delegate, v4);

}

- (CMContinuityCaptureTimeSyncClock)timeSyncClock
{
  CMContinuityCaptureRapportServer *v2;
  CMContinuityCaptureTimeSyncClock *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timeSyncClock;
  objc_sync_exit(v2);

  return v3;
}

- (CMContinuityCaptureRemoteCompositeDevice)compositeDevice
{
  return self->_compositeDevice;
}

- (void)invalidateCurrentSession:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  RPRemoteDisplaySession *rpDisplaySession;
  CMContinuityCaptureRapportServer *v7;
  CMContinuityCaptureTimeSyncClock *timeSyncClock;
  int v9;
  CMContinuityCaptureRapportServer *v10;
  __int16 v11;
  RPRemoteDisplaySession *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    rpDisplaySession = self->_rpDisplaySession;
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = rpDisplaySession;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidate current session %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[CMContinuityCaptureTransportRapportDevice teardownActiveRapportStreams](self->_device, "teardownActiveRapportStreams");
  -[NSMutableSet removeAllObjects](self->_createdIdentifiers, "removeAllObjects");
  -[CMContinuityCaptureRapportTransportBase disposeTimeSyncClock](self, "disposeTimeSyncClock");
  v7 = self;
  objc_sync_enter(v7);
  timeSyncClock = v7->_timeSyncClock;
  v7->_timeSyncClock = 0;

  objc_sync_exit(v7);
  if (v4)
    v4[2](v4);

}

- (NSDate)sessionActivationStartTime
{
  CMContinuityCaptureRapportServer *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sessionActivationStartTime;
  objc_sync_exit(v2);

  return v3;
}

+ (id)rapportDeviceForSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int CFPreferenceBooleanWithDefault;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CMContinuityCaptureCapabilities *v14;
  void *v15;
  CMContinuityCaptureTransportRapportDevice *v16;
  void *v17;
  CMContinuityCaptureTransportRapportDevice *v18;
  _QWORD block[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v5 = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC9B8];
  dispatch_assert_queue_not_V2(v5);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CMContinuityCaptureRapportServer_rapportDeviceForSession___block_invoke;
  block[3] = &unk_24F06B090;
  block[4] = &v21;
  dispatch_async_and_wait(v5, block);

  CFPreferenceBooleanWithDefault = FigGetCFPreferenceBooleanWithDefault();
  v8 = v22[5];
  if (!v8 && CFPreferenceBooleanWithDefault)
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = a1;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ use default camera capabilities", buf, 0xCu);
    }

    v10 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CMContinuityCaptureCore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathForResource:ofType:", CFSTR("SampleCameraCapabilities"), CFSTR("plist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithContentsOfFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[CMContinuityCaptureCapabilities initWithDictionaryRepresentation:]([CMContinuityCaptureCapabilities alloc], "initWithDictionaryRepresentation:", v13);
    v15 = (void *)v22[5];
    v22[5] = (uint64_t)v14;

    v8 = v22[5];
  }
  if (v8)
  {
    v16 = [CMContinuityCaptureTransportRapportDevice alloc];
    objc_msgSend(v4, "destinationDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CMContinuityCaptureTransportRapportDevice initWithRapportDevice:capabilities:remote:](v16, "initWithRapportDevice:capabilities:remote:", v17, v22[5], 0);

  }
  else
  {
    v18 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v18;
}

void __60__CMContinuityCaptureRapportServer_rapportDeviceForSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice](CMContinuityCaptureCapabilities, "capabilitiesForCurrentDevice");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)createStreamWithIdentifier:(id)a3 isMediaStream:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(id, _QWORD);
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  void (**v28)(id, _QWORD);
  id v29;
  id v30;
  _QWORD v31[4];
  char *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  char *v36;
  id v37;
  id v38;
  _QWORD block[5];
  id v40;
  id v41;
  id location;
  _BYTE buf[12];
  __int16 v44;
  const char *v45;
  __int16 v46;
  char *v47;
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v23 = (void (**)(id, _QWORD))a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (-[NSMutableSet containsObject:](self->_createdIdentifiers, "containsObject:", v8))
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      v44 = 2114;
      v45 = v8;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ already created, skip", buf, 0x16u);
    }

    v23[2](v23, 0);
  }
  else
  {
    -[NSMutableSet addObject:](self->_createdIdentifiers, "addObject:", v8);
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      v44 = 2080;
      v45 = "-[CMContinuityCaptureRapportServer createStreamWithIdentifier:isMediaStream:completion:]";
      v46 = 2114;
      v47 = v8;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
    }

    v11 = objc_alloc_init(MEMORY[0x24BE7CC70]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingActivateStreamsByIdentifier, "setObject:forKeyedSubscript:", v11, v8);
    objc_msgSend(v11, "setStreamID:", v8);
    objc_msgSend(v11, "setMessenger:", self->_rpDisplaySession);
    if (v6)
      v12 = 3;
    else
      v12 = 2;
    objc_msgSend(v11, "setStreamType:", v12);
    objc_msgSend(v11, "setServiceType:", CFSTR("com.apple.continuitycapture"));
    objc_msgSend(v11, "setStreamFlags:", 2);
    v13 = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC9B8];
    dispatch_assert_queue_not_V2(v13);

    v15 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke;
    block[3] = &unk_24F06AF00;
    objc_copyWeak(&v41, &location);
    block[4] = self;
    v16 = v11;
    v40 = v16;
    v17 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async_and_wait(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v41);
    if (v6)
      objc_msgSend(v16, "setDelegatedProcessUPID:", CMContinuityCaptureGetMediaProcessUniqueID(0));
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v16);
    v35[0] = v15;
    v35[1] = 3221225472;
    v35[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_22;
    v35[3] = &unk_24F06CC58;
    objc_copyWeak(&v37, &location);
    objc_copyWeak(&v38, (id *)buf);
    v18 = v8;
    v36 = v18;
    v22 = (void *)MEMORY[0x22E2A7CB0](v35);
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_23;
    v31[3] = &unk_24F06CC58;
    objc_copyWeak(&v33, &location);
    objc_copyWeak(&v34, (id *)buf);
    v32 = v18;
    v19 = (void *)MEMORY[0x22E2A7CB0](v31);
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_24;
    v27[3] = &unk_24F06CC80;
    objc_copyWeak(&v29, &location);
    objc_copyWeak(&v30, (id *)buf);
    v28 = v23;
    v20 = (void *)MEMORY[0x22E2A7CB0](v27);
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_26;
    v24[3] = &unk_24F06CCA8;
    objc_copyWeak(&v25, &location);
    objc_copyWeak(&v26, (id *)buf);
    v21 = (void *)MEMORY[0x22E2A7CB0](v24);
    objc_msgSend(v16, "setDispatchQueue:", self->_queue);
    objc_msgSend(v16, "setInvalidationHandler:", v22);
    objc_msgSend(v16, "setDisconnectHandler:", v19);
    objc_msgSend(v16, "setReceivedEventHandler:", v21);
    objc_msgSend(v16, "activateWithCompletion:", v20);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);

  }
  objc_destroyWeak(&location);

}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke(uint64_t a1)
{
  unint64_t *WeakRetained;
  unint64_t *v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[14];
    if (v4 < 2)
    {
      CMContinuityCaptureLog(2);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v9 = 138543362;
        v10 = v6;
        v7 = "%{public}@ register traffic flags for Mac: None";
LABEL_8:
        _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (v4 == 2)
    {
      CMContinuityCaptureLog(2);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = 138543362;
        v10 = v8;
        v7 = "%{public}@ register traffic flags for ATV: None";
        goto LABEL_8;
      }
LABEL_9:

      objc_msgSend(*(id *)(a1 + 40), "setTrafficFlags:", 0);
    }
  }

}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_22(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v2);
      v6 = objc_msgSend(WeakRetained, "currentSessionID");
      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      v10 = 138543874;
      v11 = v5;
      v12 = 2048;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stream [sessionID:%llx] %{public}@ invalidated", (uint8_t *)&v10, 0x20u);

    }
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 11));
    v8 = (void *)*((_QWORD *)WeakRetained + 10);
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "removeStream:", v9);

    objc_msgSend(*((id *)WeakRetained + 19), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_23(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v2);
      v6 = objc_msgSend(WeakRetained, "currentSessionID");
      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      v10 = 138543874;
      v11 = v5;
      v12 = 2048;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stream [sessionID:%llx] %{public}@ disconnected", (uint8_t *)&v10, 0x20u);

    }
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 11));
    v8 = (void *)*((_QWORD *)WeakRetained + 10);
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "removeStream:", v9);

    objc_msgSend(*((id *)WeakRetained + 19), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v5)
    {
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_loadWeakRetained((id *)(a1 + 40));
        v8 = objc_loadWeakRetained((id *)(a1 + 48));
        v9 = 138543874;
        v10 = v7;
        v11 = 2114;
        v12 = v8;
        v13 = 2114;
        v14 = v3;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ stream %{public}@ session activate completed with error %{public}@", (uint8_t *)&v9, 0x20u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_26(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v14 = objc_loadWeakRetained((id *)(a1 + 40));
      v15 = 138544130;
      v16 = WeakRetained;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      _os_log_debug_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ StreamSession %{public}@ event %{public}@ options %{public}@", (uint8_t *)&v15, 0x2Au);

    }
  }
  v9 = objc_loadWeakRetained((id *)(a1 + 32));
  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "streamID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enqueueResponse:identifier:", v6, v12);

    }
  }

}

- (void)parseAndActOnStreamsSetupInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t currentSessionID;
  id v14;
  id v15;
  id obj;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureRapportServer *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientStreamsSetupKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey"), v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSetStreamMessageDataIsMediaTypeKey"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          CMContinuityCaptureLog(2);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            currentSessionID = self->_currentSessionID;
            *(_DWORD *)buf = 138543874;
            v26 = self;
            v27 = 2048;
            v28 = currentSessionID;
            v29 = 2114;
            v30 = v9;
            _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Early setup for %{public}@", buf, 0x20u);
          }

          if (v9)
          {
            v17[0] = MEMORY[0x24BDAC760];
            v17[1] = 3221225472;
            v17[2] = __66__CMContinuityCaptureRapportServer_parseAndActOnStreamsSetupInfo___block_invoke;
            v17[3] = &unk_24F06B500;
            objc_copyWeak(&v19, &location);
            v18 = v9;
            -[CMContinuityCaptureRapportServer createStreamWithIdentifier:isMediaStream:completion:](self, "createStreamWithIdentifier:isMediaStream:completion:", v18, v11, v17);

            objc_destroyWeak(&v19);
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
      }
      while (v5);
    }

    v4 = v14;
  }

  objc_destroyWeak(&location);
}

void __66__CMContinuityCaptureRapportServer_parseAndActOnStreamsSetupInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a2 && WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_loadWeakRetained(v4);
      v9 = v6[6];
      v10 = v6[8];
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138544386;
      v13 = v8;
      v14 = 2048;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2112;
      v21 = a2;
      _os_log_error_impl(&dword_227C5D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [sessionID:%llx] create stream (display session %{public}@) for %{public}@ error %@", (uint8_t *)&v12, 0x34u);

    }
  }

}

- (void)parseAndNotifySessionStartInfo:(id)a3 transportInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  unint64_t currentSessionID;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSString *v22;
  NSString *peerAddress;
  NSObject *v24;
  NSString *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  int64_t v32;
  NSObject *v33;
  unint64_t v34;
  int64_t currentTransport;
  void *v36;
  BOOL v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *WeakRetained;
  _QWORD v44[4];
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureRapportServer *v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  int v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
    goto LABEL_18;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSessionIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (!v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSessionIDKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentSessionID = objc_msgSend(v10, "unsignedLongLongValue");

    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      currentSessionID = self->_currentSessionID;
      *(_DWORD *)buf = 138543618;
      v55 = self;
      v56 = 2048;
      v57 = currentSessionID;
      _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] connected to host", buf, 0x16u);
    }

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientInActiveEntitiesForConnectionChange"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
LABEL_18:
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE7CCC8]);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      peerAddress = self->_peerAddress;
      self->_peerAddress = v22;

      CMContinuityCaptureLog(2);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_peerAddress;
        *(_DWORD *)buf = 138543619;
        v55 = self;
        v56 = 2113;
        v57 = (unint64_t)v25;
        _os_log_impl(&dword_227C5D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ peerAddress:%{private}@", buf, 0x16u);
      }

      v26 = *MEMORY[0x24BE7CCA0];
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE7CCA0]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27 == 0;

      if (!v28)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "unsignedIntegerValue");

        CMContinuityCaptureLog(2);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v55 = self;
          v56 = 2048;
          v57 = v30;
          _os_log_impl(&dword_227C5D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ dataLinkType:%lu", buf, 0x16u);
        }

        v32 = 1;
        if ((unint64_t)(v30 - 7) < 3)
          v32 = 2;
        self->_currentTransport = v32;
        CMContinuityCaptureLog(2);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = self->_currentSessionID;
          currentTransport = self->_currentTransport;
          *(_DWORD *)buf = 138543874;
          v55 = self;
          v56 = 2048;
          v57 = v34;
          v58 = 1024;
          v59 = currentTransport;
          _os_log_impl(&dword_227C5D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] connected over transport %d", buf, 0x1Cu);
        }

      }
    }
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientPreStartConfigurationKey"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36 == 0;

      if (!v37)
      {
        v38 = (void *)MEMORY[0x24BDD1620];
        v39 = objc_opt_class();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientPreStartConfigurationKey"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        objc_msgSend(v38, "unarchivedObjectOfClass:fromData:error:", v39, v40, &v48);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v48;

        if (v41)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (!WeakRetained)
          {

LABEL_39:
            goto LABEL_40;
          }
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __81__CMContinuityCaptureRapportServer_parseAndNotifySessionStartInfo_transportInfo___block_invoke_30;
          v44[3] = &unk_24F06CCF0;
          objc_copyWeak(&v47, &location);
          v45 = v42;
          v46 = v41;
          -[NSObject startStream:option:completion:](WeakRetained, "startStream:option:completion:", v46, 0, v44);

          objc_destroyWeak(&v47);
        }
        else
        {
          CMContinuityCaptureLog(2);
          WeakRetained = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
            -[CMContinuityCaptureRapportServer parseAndNotifySessionStartInfo:transportInfo:].cold.1((uint64_t)self, (uint64_t)v42, WeakRetained);
        }

      }
    }
    CMContinuityCaptureLog(2);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v55 = self;
      v56 = 2112;
      v57 = (unint64_t)v7;
      _os_log_impl(&dword_227C5D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ TransportInfo %@", buf, 0x16u);
    }
    goto LABEL_39;
  }
  CMContinuityCaptureLog(2);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientInActiveEntitiesForConnectionChange"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = self;
    v56 = 2114;
    v57 = (unint64_t)v16;
    _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ inActiveEntities on connection change %{public}@", buf, 0x16u);

  }
  v17 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v17)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientInActiveEntitiesForConnectionChange"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "stopStream:option:completion:", objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "integerValue"), 0, &__block_literal_global_16);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      }
      while (v19);
    }

    goto LABEL_18;
  }
LABEL_40:
  objc_destroyWeak(&location);

}

void __81__CMContinuityCaptureRapportServer_parseAndNotifySessionStartInfo_transportInfo___block_invoke_30(uint64_t a1, uint64_t a2)
{
  id *v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_loadWeakRetained(v4);
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        v17 = 2112;
        v18 = a2;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Pre-StartStream for configuration %@ error %@", buf, 0x20u);

      }
    }
    v9 = WeakRetained[11];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __81__CMContinuityCaptureRapportServer_parseAndNotifySessionStartInfo_transportInfo___block_invoke_31;
    v10[3] = &unk_24F06AE88;
    objc_copyWeak(&v12, v4);
    v11 = *(id *)(a1 + 40);
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
  }

}

void __81__CMContinuityCaptureRapportServer_parseAndNotifySessionStartInfo_transportInfo___block_invoke_31(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("preStartConfiguration"));
    objc_storeStrong(v3 + 20, *(id *)(a1 + 32));
    objc_msgSend(v3, "didChangeValueForKey:", CFSTR("preStartConfiguration"));
    WeakRetained = v3;
  }

}

- (void)relayTerminationComplete
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
    v9 = "-[CMContinuityCaptureRapportServer relayTerminationComplete]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__CMContinuityCaptureRapportServer_relayTerminationComplete__block_invoke;
  v5[3] = &unk_24F06CD18;
  v5[4] = self;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __60__CMContinuityCaptureRapportServer_relayTerminationComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = CFSTR("ContinuityCaptureRapportClientMessageTypeKey");
  v7[0] = &unk_24F07F9F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__CMContinuityCaptureRapportServer_relayTerminationComplete__block_invoke_33;
  v4[3] = &unk_24F06AFC8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v2, "sendEventID:event:destinationID:options:completion:", CFSTR("ContinuityCaptureSessionEventID"), v3, *MEMORY[0x24BE7CC80], 0, v4);

  objc_destroyWeak(&v5);
}

void __60__CMContinuityCaptureRapportServer_relayTerminationComplete__block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v7)
      {
        v8 = objc_loadWeakRetained(v4);
        v9 = WeakRetained[8];
        v14 = 138543874;
        v15 = v8;
        v16 = 2114;
        v17 = v9;
        v18 = 2114;
        v19 = v3;
        v10 = "%{public}@ terminate display session %{public}@ send message error %{public}@";
        v11 = v6;
        v12 = 32;
LABEL_7:
        _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);

      }
    }
    else if (v7)
    {
      v8 = objc_loadWeakRetained(v4);
      v13 = WeakRetained[8];
      v14 = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v13;
      v10 = "%{public}@ terminate display session %{public}@ send message success";
      v11 = v6;
      v12 = 22;
      goto LABEL_7;
    }

  }
}

- (RPRemoteDisplaySession)displaySession
{
  return self->_rpDisplaySession;
}

- (void)setupRemoteDisplaySession:(id)a3
{
  id v5;
  RPRemoteDisplaySession **p_rpDisplaySession;
  CMContinuityCaptureRapportServer *v7;
  uint64_t v8;
  NSDate *sessionActivationStartTime;
  NSObject *v10;
  CMContinuityCaptureTransportRapportDevice *device;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureRapportServer *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  CMContinuityCaptureTransportRapportDevice *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  p_rpDisplaySession = &self->_rpDisplaySession;
  objc_storeStrong((id *)&self->_rpDisplaySession, a3);
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = objc_claimAutoreleasedReturnValue();
  sessionActivationStartTime = v7->_sessionActivationStartTime;
  v7->_sessionActivationStartTime = (NSDate *)v8;

  objc_sync_exit(v7);
  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    device = v7->_device;
    -[RPRemoteDisplaySession destinationDevice](*p_rpDisplaySession, "destinationDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v7;
    v22 = 2080;
    v23 = "-[CMContinuityCaptureRapportServer setupRemoteDisplaySession:]";
    v24 = 2114;
    v25 = device;
    v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Device %{public}@ destinationDevice %{public}@ ", buf, 0x2Au);

  }
  v13 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke;
  v17[3] = &unk_24F06AFC8;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v5, "setErrorHandler:", v17);
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_35;
  v15[3] = &unk_24F06B468;
  objc_copyWeak(&v16, &location);
  v14 = (void *)MEMORY[0x22E2A7CB0](v15);
  objc_msgSend(v5, "registerEventID:options:handler:", CFSTR("ContinuityCaptureSessionEventID"), 0, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v4);
      v8 = WeakRetained[8];
      v9 = 138543874;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ display session %{public}@ error %{public}@", (uint8_t *)&v9, 0x20u);

    }
  }

}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id WeakRetained;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  uint64_t v65;
  const __CFString *v66;
  _QWORD v67[4];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v50 = a3;
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)buf = 138543874;
      v59 = WeakRetained;
      v60 = 2114;
      v61 = v5;
      v62 = 2114;
      v63 = v50;
      _os_log_debug_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ DisplaySession event %{public}@ options %{public}@", buf, 0x20u);

    }
  }
  v7 = (id *)(a1 + 32);
  v8 = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "integerValue") == 0,
          v12,
          v11,
          v13))
    {
      CMContinuityCaptureLog(2);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = objc_loadWeakRetained(v7);
        v44 = (void *)*((_QWORD *)v9 + 8);
        *(_DWORD *)buf = 138543618;
        v59 = v43;
        v60 = 2114;
        v61 = v44;
        _os_log_impl(&dword_227C5D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ display session %{public}@", buf, 0x16u);

      }
      objc_msgSend(v9, "parseAndNotifySessionStartInfo:transportInfo:", v5, v50);
      objc_msgSend(v9, "parseAndActOnStreamsSetupInfo:", v5);
      v45 = (void *)*((_QWORD *)v9 + 8);
      v66 = CFSTR("ContinuityCaptureRapportClientMessageTypeKey");
      v67[0] = &unk_24F07FA08;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = MEMORY[0x24BDAC760];
      v56[0] = MEMORY[0x24BDAC760];
      v56[1] = 3221225472;
      v56[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_37;
      v56[3] = &unk_24F06AFC8;
      objc_copyWeak(&v57, v7);
      objc_msgSend(v45, "sendEventID:event:destinationID:options:completion:", CFSTR("ContinuityCaptureSessionEventID"), v46, *MEMORY[0x24BE7CC80], 0, v56);

      v48 = *((_QWORD *)v9 + 15);
      v54[0] = v47;
      v54[1] = 3221225472;
      v54[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_38;
      v54[3] = &unk_24F06C0A8;
      objc_copyWeak(&v55, v7);
      objc_msgSend(v9, "createTimeSyncClockWithPeerAddress:completion:", v48, v54);
      objc_destroyWeak(&v55);
      objc_destroyWeak(&v57);
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "integerValue") == 2
          && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey")), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSetStreamMessageDataIsMediaTypeKey"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (!v18)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSetStreamMessageDataIsMediaTypeKey"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "BOOLValue");

            v51[0] = MEMORY[0x24BDAC760];
            v51[1] = 3221225472;
            v51[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_40;
            v51[3] = &unk_24F06B500;
            objc_copyWeak(&v53, v7);
            v22 = v19;
            v52 = v22;
            objc_msgSend(v9, "createStreamWithIdentifier:isMediaStream:completion:", v22, v21, v51);

            objc_destroyWeak(&v53);
            goto LABEL_31;
          }
        }
        else
        {

        }
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23
        && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey")),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "integerValue") == 4,
            v24,
            v23,
            v25))
      {
        CMContinuityCaptureLog(2);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = objc_loadWeakRetained(v7);
          v28 = (void *)*((_QWORD *)v9 + 6);
          v29 = (void *)*((_QWORD *)v9 + 8);
          *(_DWORD *)buf = 138543874;
          v59 = v27;
          v60 = 2048;
          v61 = v28;
          v62 = 2114;
          v63 = v29;
          _os_log_impl(&dword_227C5D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx]  Terminate display session %{public}@", buf, 0x20u);

        }
        objc_msgSend(*((id *)v9 + 9), "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventTerminate"), 0, 0);
      }
      else
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "integerValue") == 3)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32 == 0;

            if (!v33)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*((id *)v9 + 13), "objectForKey:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                CMContinuityCaptureLog(2);
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  v37 = objc_loadWeakRetained(v7);
                  v38 = (void *)*((_QWORD *)v9 + 6);
                  v39 = *((_QWORD *)v9 + 8);
                  *(_DWORD *)buf = 138544130;
                  v59 = v37;
                  v60 = 2048;
                  v61 = v38;
                  v62 = 2114;
                  v63 = v34;
                  v64 = 2114;
                  v65 = v39;
                  _os_log_impl(&dword_227C5D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] stream %{public}@ (display session %{public}@) activate complete", buf, 0x2Au);

                }
                v40 = (void *)*((_QWORD *)v9 + 10);
                objc_msgSend(*((id *)v9 + 13), "objectForKeyedSubscript:", v34);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "addStream:", v41);

                objc_msgSend(*((id *)v9 + 13), "removeObjectForKey:", v34);
              }

            }
          }
          else
          {

          }
        }
      }
    }
  }
LABEL_31:

}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_loadWeakRetained(v4);
        v9 = WeakRetained[8];
        v11 = 138543874;
        v12 = v8;
        v13 = 2114;
        v14 = v9;
        v15 = 2114;
        v16 = v3;
        _os_log_error_impl(&dword_227C5D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ display session %{public}@ send message error %{public}@", (uint8_t *)&v11, 0x20u);
LABEL_7:

      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained(v4);
      v10 = WeakRetained[8];
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ display session %{public}@ send message success", (uint8_t *)&v11, 0x16u);
      goto LABEL_7;
    }

  }
}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_38(uint64_t a1, void *a2)
{
  id v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("timeSyncClock"));
    v8 = v7;
    objc_sync_enter(v8);
    objc_storeStrong(v8 + 12, a2);
    objc_sync_exit(v8);

    objc_msgSend(v8, "didChangeValueForKey:", CFSTR("timeSyncClock"));
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_loadWeakRetained(v5);
      v11 = v8[6];
      v12 = v8[12];
      v13 = 138543874;
      v14 = v10;
      v15 = 2048;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] got timeSync clock %@", (uint8_t *)&v13, 0x20u);

    }
  }

}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_40(uint64_t a1, uint64_t a2)
{
  id *v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a2 && WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_loadWeakRetained(v4);
      v9 = v6[6];
      v10 = v6[8];
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138544386;
      v13 = v8;
      v14 = 2048;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2112;
      v21 = a2;
      _os_log_error_impl(&dword_227C5D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [sessionID:%llx] create stream (display session %{public}@) for %{public}@ error %@", (uint8_t *)&v12, 0x34u);

    }
  }

}

- (unint64_t)currentSessionID
{
  return self->_currentSessionID;
}

- (void)setCurrentSessionID:(unint64_t)a3
{
  self->_currentSessionID = a3;
}

- (int64_t)currentTransport
{
  return self->_currentTransport;
}

- (ContinuityCaptureTransportDevice)localDevice
{
  return (ContinuityCaptureTransportDevice *)self->_device;
}

- (void)cancel
{
  NSObject *v3;
  NSMutableDictionary *pendingActivateStreamsByIdentifier;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  CMContinuityCaptureRapportServer *v16;
  __int16 v17;
  NSMutableDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingActivateStreamsByIdentifier = self->_pendingActivateStreamsByIdentifier;
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = pendingActivateStreamsByIdentifier;
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ _pendingActivateStreamsByIdentifier %{public}@", buf, 0x16u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_pendingActivateStreamsByIdentifier, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "invalidate");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSMutableDictionary removeAllObjects](self->_pendingActivateStreamsByIdentifier, "removeAllObjects");
  -[CMContinuityCaptureRapportServer invalidateCurrentSession:](self, "invalidateCurrentSession:", 0);
}

- (CMContinuityCaptureConfiguration)preStartConfiguration
{
  return (CMContinuityCaptureConfiguration *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preStartConfiguration, 0);
  objc_storeStrong((id *)&self->_createdIdentifiers, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_sessionActivationStartTime, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);
  objc_storeStrong((id *)&self->_pendingActivateStreamsByIdentifier, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_compositeDevice, 0);
  objc_storeStrong((id *)&self->_rpDisplaySession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)parseAndNotifySessionStartInfo:(os_log_t)log transportInfo:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "%{public}@ error unarchivedObjectOfClass %@", (uint8_t *)&v3, 0x16u);
}

@end
