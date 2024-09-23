@implementation CMContinuityCaptureCMIOVideoDevice

- (CMContinuityCaptureCMIOVideoDevice)initWithCaptureDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSMutableArray *v28;
  NSMutableArray *streams;
  NSMutableDictionary *v30;
  NSMutableDictionary *cmControlByPropertyName;
  CMContinuityCaptureVideoDevice **p_captureDevice;
  OS_dispatch_queue *v33;
  OS_dispatch_queue *queue;
  NSObject *v35;
  OS_dispatch_queue *v36;
  OS_dispatch_queue *systemPreferredStatusUpdateQueue;
  NSString *v38;
  NSString *modelID;
  NSString *v40;
  NSString *cmioDeviceConnectionState;
  NSString *v42;
  NSString *cmioDeviceWired;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  CMContinuityCaptureCMIOVideoDevice *v58;
  id WeakRetained;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  CMContinuityCaptureCMIOVideoDevice *v77;
  CMContinuityCaptureCMIOVideoDevice *v78;
  NSObject *v80;
  void *v81;
  void *v82;
  _QWORD v83[4];
  id v84;
  CMContinuityCaptureCMIOVideoDevice *v85;
  _QWORD block[4];
  id v87;
  CMContinuityCaptureCMIOVideoDevice *v88;
  objc_super v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "compositeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureGetDeviceUUID(v8, objc_msgSend(v4, "entity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v26 = 0;
LABEL_22:
    v78 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "entity") == 2)
  {
    objc_msgSend(v7, "deviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureCreateLocalizedString(CFSTR("DESK_VIEW_CAMERA_NAME"), CFSTR("%@ Desk View Camera"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  else
  {
    objc_msgSend(v7, "deviceModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = continuityCaptureNotificationCenter_isiPhone(v17);

    if (v18)
      v19 = CFSTR("CAMERA_NAME_IPHONE");
    else
      v19 = CFSTR("CAMERA_NAME_IPAD");
    objc_msgSend(v7, "deviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureCreateLocalizedString(v19, CFSTR("%@ Camera"), v20, v21, v22, v23, v24, v25, (uint64_t)v10);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  CMContinuityCaptureLog(2);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v91 = v9;
    v92 = 2114;
    v93 = v26;
    _os_log_impl(&dword_227C5D000, v27, OS_LOG_TYPE_DEFAULT, "Publish Device UUID %{public}@ name %{public}@", buf, 0x16u);
  }

  v89.receiver = self;
  v89.super_class = (Class)CMContinuityCaptureCMIOVideoDevice;
  self = -[CMIOExtensionDevice initWithLocalizedName:deviceID:legacyDeviceID:source:](&v89, sel_initWithLocalizedName_deviceID_legacyDeviceID_source_, v26, v9, 0, self);
  if (!self)
    goto LABEL_22;
  v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  streams = self->_streams;
  self->_streams = v28;

  v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  cmControlByPropertyName = self->_cmControlByPropertyName;
  self->_cmControlByPropertyName = v30;

  p_captureDevice = &self->_captureDevice;
  objc_storeWeak((id *)&self->_captureDevice, v4);
  objc_msgSend(v4, "queue");
  v33 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  self->_queue = v33;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.continuitycapture.systempreferredstatus", v35);
  systemPreferredStatusUpdateQueue = self->_systemPreferredStatusUpdateQueue;
  self->_systemPreferredStatusUpdateQueue = v36;

  self->_entity = objc_msgSend(v4, "entity");
  objc_storeStrong((id *)&self->_name, v26);
  objc_storeStrong((id *)&self->_deviceID, v9);
  objc_storeStrong((id *)&self->_nonLocalizedName, self->_name);
  objc_msgSend(v7, "deviceModel");
  v38 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelID = self->_modelID;
  self->_modelID = v38;

  CMIOExtensionPropertyFromPropertyAddress();
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  cmioDeviceConnectionState = self->_cmioDeviceConnectionState;
  self->_cmioDeviceConnectionState = v40;

  CMIOExtensionPropertyFromPropertyAddress();
  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
  cmioDeviceWired = self->_cmioDeviceWired;
  self->_cmioDeviceWired = v42;

  objc_msgSend(v9, "UUIDString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[CMContinuityCaptureCMIOVideoDevice setupStreamsWithDeviceID:](self, "setupStreamsWithDeviceID:", v44);

  if (!v45)
    goto LABEL_22;
  if (-[NSMutableArray count](self->_streams, "count") != 1)
  {
    CMContinuityCaptureLog(2);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureCMIOVideoDevice initWithCaptureDevice:].cold.2();
    goto LABEL_21;
  }
  -[CMContinuityCaptureCMIOVideoDevice setupControls](self, "setupControls");
  if (!-[CMContinuityCaptureCMIOVideoDevice publishDevice:](self, "publishDevice:", 1))
  {
    CMContinuityCaptureLog(2);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureCMIOVideoDevice initWithCaptureDevice:].cold.1();
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(v4, "compositeDelegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "client");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "device");
  v82 = v9;
  v48 = v7;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "magicStateMonitor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "queue");
  v81 = v26;
  v51 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v51);

  objc_msgSend(v4, "compositeDelegate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "client");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "device");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "magicStateMonitor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "queue");
  v56 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CMContinuityCaptureCMIOVideoDevice_initWithCaptureDevice___block_invoke;
  block[3] = &unk_24F06ADE8;
  v57 = v4;
  v87 = v57;
  v58 = self;
  v88 = v58;
  dispatch_async_and_wait(v56, block);

  WeakRetained = objc_loadWeakRetained((id *)p_captureDevice);
  objc_msgSend(WeakRetained, "compositeDelegate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "client");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "device");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "magicStateMonitor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v58->_cachedMagicState = objc_msgSend(v63, "magic");

  -[CMContinuityCaptureCMIOVideoDevice _setCMIOExtensionPropertyAttributesByPropertyNames](v58, "_setCMIOExtensionPropertyAttributesByPropertyNames");
  objc_msgSend(v57, "compositeDelegate");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "client");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "device");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "magicStateMonitor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "magic");

  v69 = v68;
  v7 = v48;
  v9 = v82;
  -[CMContinuityCaptureCMIOVideoDevice setSystemPreferredStatus:withCompletion:](v58, "setSystemPreferredStatus:withCompletion:", v69, 0);
  objc_msgSend(v57, "compositeDelegate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "client");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "device");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v58->_cachedWiredState = objc_msgSend(v72, "wired");

  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "queue");
  v74 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v74);

  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "queue");
  v76 = objc_claimAutoreleasedReturnValue();
  v83[0] = MEMORY[0x24BDAC760];
  v83[1] = 3221225472;
  v83[2] = __60__CMContinuityCaptureCMIOVideoDevice_initWithCaptureDevice___block_invoke_2;
  v83[3] = &unk_24F06ADE8;
  v84 = v57;
  v77 = v58;
  v85 = v77;
  dispatch_async_and_wait(v76, v83);

  v26 = v81;
  self = v77;
  v78 = self;
LABEL_15:

  return v78;
}

void __60__CMContinuityCaptureCMIOVideoDevice_initWithCaptureDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "compositeDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "magicStateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("magic"), 3, 0);

  objc_msgSend(*(id *)(a1 + 32), "compositeDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "magicStateMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 200), v8);

}

void __60__CMContinuityCaptureCMIOVideoDevice_initWithCaptureDevice___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "compositeDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("wired"), 3, 0);

  objc_msgSend(*(id *)(a1 + 32), "compositeDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 208), v6);

}

- (void)forceDeviceRemoval
{
  -[CMContinuityCaptureCMIOVideoDevice publishDevice:](self, "publishDevice:", 0);
}

- (BOOL)publishDevice:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  char v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  const char *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  CMContinuityCaptureCMIOVideoDevice *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
  objc_msgSend(WeakRetained, "compositeDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "Unpublish";
      if (v3)
        v9 = "Publish";
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2082;
      v23 = v9;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, " %{public}@ %{public}s", buf, 0x16u);
    }

    objc_msgSend(v7, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    if (v3)
    {
      v19 = 0;
      v11 = objc_msgSend(v7, "addDevice:error:", self, &v19);
      v12 = v19;
    }
    else
    {
      v18 = 0;
      v11 = objc_msgSend(v7, "removeDevice:error:", self, &v18);
      v12 = v18;
    }
    v14 = v12;
    if ((v11 & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = "Unpublish";
        *(_DWORD *)buf = 138543874;
        v21 = self;
        if (v3)
          v17 = "Publish";
        v22 = 2082;
        v23 = v17;
        v24 = 2114;
        v25 = v14;
        _os_log_error_impl(&dword_227C5D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ %{public}s error %{public}@", buf, 0x20u);
      }

      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }

  return v13;
}

- (void)resetTransportDevice:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  CMContinuityCaptureCMIOVideoDevice *v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  CMContinuityCaptureCMIOVideoDevice *v31;
  _QWORD block[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_magicStateObserver);
  objc_msgSend(WeakRetained, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  v7 = objc_loadWeakRetained((id *)&self->_magicStateObserver);
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke;
  block[3] = &unk_24F06AEB0;
  block[4] = self;
  dispatch_async_and_wait(v8, block);

  objc_msgSend(v4, "magicStateMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v11);

  objc_msgSend(v4, "magicStateMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_2;
  v29[3] = &unk_24F06ADE8;
  v14 = v4;
  v30 = v14;
  v31 = self;
  dispatch_async_and_wait(v13, v29);

  v15 = objc_loadWeakRetained(&self->_wiredObserver);
  if (v15)
  {
    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v17);

    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_3;
    v28[3] = &unk_24F06AEB0;
    v28[4] = self;
    dispatch_async_and_wait(v19, v28);

  }
  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v21);

  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "queue");
  v23 = objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_4;
  v25[3] = &unk_24F06ADE8;
  v26 = v14;
  v27 = self;
  v24 = v14;
  dispatch_async_and_wait(v23, v25);

}

void __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("magic"), 0);

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 200), 0);
  }
}

void __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "magicStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("magic"), 3, 0);

  objc_msgSend(*(id *)(a1 + 32), "magicStateMonitor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 200), v3);

}

id __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 208));
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("wired"), 0);

  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 208), 0);
}

id __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("wired"), 3, 0);
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 208), *(id *)(a1 + 32));
}

- (void)terminateComplete:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  id v29;
  _QWORD v30[5];
  _QWORD block[4];
  id v32;
  CMContinuityCaptureCMIOVideoDevice *v33;
  _BYTE buf[12];
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v35 = 2080;
    v36 = "-[CMContinuityCaptureCMIOVideoDevice terminateComplete:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  if (self->_terminated)
  {
    v4[2](v4);
  }
  else
  {
    self->_terminated = 1;
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)&self->_captureDevice);
      objc_msgSend(v7, "compositeDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "provider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        if (-[NSMutableArray count](self->_streams, "count"))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_streams, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "terminateComplete:", &__block_literal_global_3);

        }
        -[NSMutableArray removeAllObjects](self->_streams, "removeAllObjects");
        objc_msgSend(WeakRetained, "compositeDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "client");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "device");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "magicStateMonitor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "queue");
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_not_V2(v15);

        objc_msgSend(WeakRetained, "compositeDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "client");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "device");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "magicStateMonitor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "queue");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_2;
        block[3] = &unk_24F06ADE8;
        v32 = WeakRetained;
        v33 = self;
        dispatch_async_and_wait(v20, block);

        +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "queue");
        v23 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_not_V2(v23);

        +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "queue");
        v25 = objc_claimAutoreleasedReturnValue();
        v30[0] = v21;
        v30[1] = 3221225472;
        v30[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_3;
        v30[3] = &unk_24F06AEB0;
        v30[4] = self;
        dispatch_async_and_wait(v25, v30);

        objc_msgSend(v9, "queue");
        v26 = objc_claimAutoreleasedReturnValue();
        v27[0] = v21;
        v27[1] = 3221225472;
        v27[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_4;
        v27[3] = &unk_24F06B548;
        objc_copyWeak(&v29, (id *)buf);
        v28 = v4;
        dispatch_async(v26, v27);

        objc_destroyWeak(&v29);
      }

    }
    objc_destroyWeak((id *)buf);
  }

}

id __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "compositeDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "magicStateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("magic"), 0);

  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 200), 0);
}

id __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 208));
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("wired"), 0);

  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 208), 0);
}

void __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_5;
    v4[3] = &unk_24F06B548;
    objc_copyWeak(&v6, v2);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "setSystemPreferredStatus:withCompletion:", 0, v4);

    objc_destroyWeak(&v6);
  }

}

void __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_5(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 16);
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "compositeDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "queue");
        v9 = objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_6;
        v10[3] = &unk_24F06B548;
        objc_copyWeak(&v12, v2);
        v11 = *(id *)(a1 + 32);
        dispatch_async(v9, v10);

        objc_destroyWeak(&v12);
      }

    }
  }

}

void __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "publishDevice:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *queue;
  id *v22;
  _QWORD *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  char v32;
  _QWORD block[5];
  id v34;
  char v35;
  _BYTE buf[12];
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  CMContinuityCaptureLog(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v10;
    _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ keypath:%{public}@ object:%{public}@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("magic")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = v14 == objc_msgSend(v15, "integerValue");

    if ((v14 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
      objc_msgSend(WeakRetained, "compositeDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "client");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "device");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "magicStateMonitor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "magic");

      -[CMContinuityCaptureCMIOVideoDevice setSystemPreferredStatus:withCompletion:](self, "setSystemPreferredStatus:withCompletion:", v29, 0);
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __85__CMContinuityCaptureCMIOVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_24F06B570;
      v22 = &v34;
      objc_copyWeak(&v34, (id *)buf);
      v35 = v29;
      block[4] = self;
      v23 = block;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("wired")))
  {
    v16 = objc_loadWeakRetained((id *)&self->_captureDevice);
    objc_msgSend(v16, "compositeDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "client");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "wired");

    queue = self->_queue;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __85__CMContinuityCaptureCMIOVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v30[3] = &unk_24F06B570;
    v22 = &v31;
    objc_copyWeak(&v31, (id *)buf);
    v32 = v20;
    v30[4] = self;
    v23 = v30;
LABEL_8:
    dispatch_async(queue, v23);
    objc_destroyWeak(v22);
  }
  objc_destroyWeak((id *)buf);

}

void __85__CMContinuityCaptureCMIOVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    if (*((unsigned __int8 *)WeakRetained + 193) != v4)
    {
      *((_BYTE *)WeakRetained + 193) = v4;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a1 + 48, 1);
      v6 = (void *)MEMORY[0x24BDC1378];
      objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "propertyStateWithValue:attributes:", v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && v3[18])
      {
        v9 = *(void **)(a1 + 32);
        v11 = v3[18];
        v12[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "notifyPropertiesChanged:", v10);

      }
    }
  }

}

void __85__CMContinuityCaptureCMIOVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    if (*((unsigned __int8 *)WeakRetained + 194) != v4)
    {
      *((_BYTE *)WeakRetained + 194) = v4;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a1 + 48, 1);
      v6 = (void *)MEMORY[0x24BDC1378];
      objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "propertyStateWithValue:attributes:", v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && v3[19])
      {
        v9 = *(void **)(a1 + 32);
        v11 = v3[19];
        v12[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "notifyPropertiesChanged:", v10);

      }
    }
  }

}

- (void)setSystemPreferredStatus:(BOOL)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (id)deviceID
{
  return self->_deviceID;
}

- (BOOL)setupStreamsWithDeviceID:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  BOOL v16;
  CMContinuityCaptureVideoStream *v17;
  NSObject *p_super;
  BOOL v19;
  id v20;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  CMContinuityCaptureCMIOVideoDevice *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
  v6 = WeakRetained;
  if (!WeakRetained
    || (objc_msgSend(WeakRetained, "capabilities"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    v16 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "manualFramingSupportedStreamFormats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v6, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "manualFramingSupportedStreamFormats");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      v15 = "%{public}@ setup using manual framing stream formats";
LABEL_9:
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v11, "streamFormats");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      v15 = "%{public}@ setup using non-manual framing stream formats";
      goto LABEL_9;
    }
  }

  v17 = -[CMContinuityCaptureVideoStream initWithDevice:streamFormats:deviceID:queue:]([CMContinuityCaptureVideoStream alloc], "initWithDevice:streamFormats:deviceID:queue:", v6, v13, v4, self->_queue);
  if (v17)
  {
    p_super = &v17->super.super;
    v23 = 0;
    v19 = -[CMIOExtensionDevice addStream:error:](self, "addStream:error:", v17, &v23);
    v20 = v23;
    if (v19)
    {
      -[NSMutableArray addObject:](self->_streams, "addObject:", p_super);

      v16 = 1;
    }
    else
    {
      CMContinuityCaptureLog(2);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureCMIOVideoDevice setupStreamsWithDeviceID:].cold.2();

      v16 = 0;
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureCMIOVideoDevice setupStreamsWithDeviceID:].cold.1();
    v16 = 0;
    v20 = v13;
  }

LABEL_14:
  return v16;
}

- (void)setupControls
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ Invalid system controls ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableArray count](self->_streams, "count"))
  {
    +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "logTryItNowAnalytics");

    if (v9)
    {
      CMSetAttachment(a3, CFSTR("com.apple.cmio.buffer_attachment.continuity_capture_try_it_now_active"), MEMORY[0x24BDBD1C8], 1u);
      CMContinuityCaptureLog(2);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "Setting kCMIOSampleBufferAttachmentKey_ContinuityCaptureTryItNowActive attachment complete", v13, 2u);
      }

      +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLogTryItNowAnalytics:", 0);

    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_streams, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dispatchFrame:entity:completion:", a3, self->_entity, v7);

  }
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  CMContinuityCaptureCMIOVideoDevice *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  CMContinuityCaptureCMIOVideoDevice *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  id v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v33 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = self;
  -[NSMutableDictionary allKeys](self->_cmControlByPropertyName, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
      -[NSMutableDictionary objectForKeyedSubscript:](v34->_cmControlByPropertyName, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if ((v15 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    -[NSMutableDictionary objectForKeyedSubscript:](v34->_cmControlByPropertyName, "objectForKeyedSubscript:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;

    if (!v17)
      goto LABEL_19;
    objc_msgSend(v35, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v20 = 0;
    if (v16)
    {
      v21 = v33;
      if ((isKindOfClass & 1) == 0)
        goto LABEL_26;
      if ((objc_msgSend(v16, "containsString:", CFSTR("btst")) & 1) == 0)
      {
        objc_msgSend(v17, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToNumber:", v23);

        if ((v24 & 1) != 0)
        {
          v20 = 0;
          goto LABEL_26;
        }
      }
      objc_msgSend(v35, "value");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:", v25);

      v26 = (void *)MEMORY[0x24BDC1378];
      objc_msgSend(v35, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "propertyStateWithValue:attributes:", v27, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v48 = v16;
        v49 = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMIOExtensionDevice notifyPropertiesChanged:](v34, "notifyPropertiesChanged:", v28);

      }
      CMContinuityCaptureLog(2);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v35, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v41 = v34;
        v42 = 2112;
        v43 = v17;
        v44 = 2112;
        v45 = v30;
        v46 = 2114;
        v47 = v20;
        _os_log_impl(&dword_227C5D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ update property %@ [%@] with state %{public}@", buf, 0x2Au);

      }
      goto LABEL_23;
    }
LABEL_25:
    v21 = v33;
    goto LABEL_26;
  }
LABEL_9:

  v16 = 0;
LABEL_19:
  if (!-[NSMutableArray count](v34->_streams, "count"))
  {
    v17 = 0;
    v20 = 0;
    goto LABEL_25;
  }
  CMContinuityCaptureLog(2);
  v31 = objc_claimAutoreleasedReturnValue();
  v21 = v33;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v35, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v34;
    v42 = 2114;
    v43 = v35;
    v44 = 2112;
    v45 = v32;
    _os_log_impl(&dword_227C5D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ to stream with value %@", buf, 0x20u);

  }
  -[NSMutableArray objectAtIndexedSubscript:](v34->_streams, "objectAtIndexedSubscript:", 0);
  v29 = objc_claimAutoreleasedReturnValue();
  -[NSObject setValueForControl:completion:](v29, "setValueForControl:completion:", v35, v33);
  v17 = 0;
  v20 = 0;
LABEL_23:

LABEL_26:
}

- (NSArray)controls
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_cmControlByPropertyName, "allValues");
}

- (NSSet)availableProperties
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__CMContinuityCaptureCMIOVideoDevice_availableProperties__block_invoke;
  v6[3] = &unk_24F06B238;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __57__CMContinuityCaptureCMIOVideoDevice_availableProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_availableProperties");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_availableProperties
{
  id v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v3, "addObject:", *MEMORY[0x24BDC1320]);
  objc_msgSend(v3, "addObject:", *MEMORY[0x24BDC1328]);
  objc_msgSend(v3, "addObject:", *MEMORY[0x24BDC1330]);
  if (self->_entity == 1)
    objc_msgSend(v3, "addObject:", CFSTR("CMIOExtensionPropertyDeviceCompanionDeskcamDeviceUUID"));
  objc_msgSend(v3, "addObject:", self->_cmioDeviceConnectionState);
  objc_msgSend(v3, "addObject:", self->_cmioDeviceWired);
  objc_msgSend(v3, "addObject:", CFSTR("CMIOExtensionPropertyRapportDeviceUniqueID"));
  objc_msgSend(v3, "addObject:", CFSTR("DockedTrackingActive"));
  if (-[NSMutableDictionary count](self->_cmControlByPropertyName, "count"))
  {
    -[NSMutableDictionary allKeys](self->_cmControlByPropertyName, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
  return v3;
}

- (id)devicePropertiesForProperties:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__CMContinuityCaptureCMIOVideoDevice_devicePropertiesForProperties_error___block_invoke;
  v11[3] = &unk_24F06B4D8;
  v13 = &v21;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v15;
  dispatch_async_and_wait(queue, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v9;
}

void __74__CMContinuityCaptureCMIOVideoDevice_devicePropertiesForProperties_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_devicePropertiesForProperties:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_devicePropertiesForProperties:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSString *nonLocalizedName;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  _QWORD v74[8];
  char v75;
  char v76;
  _QWORD v77[5];
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
  if (WeakRetained)
  {
    v85 = 0;
    v86 = &v85;
    v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__3;
    v89 = __Block_byref_object_dispose__3;
    v90 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(MEMORY[0x24BDC1368], "devicePropertiesWithDictionary:", MEMORY[0x24BDBD1B8]);
    v90 = (id)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    v80 = &v79;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__3;
    v83 = __Block_byref_object_dispose__3;
    v84 = 0;
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x3032000000;
    v77[3] = __Block_byref_object_copy__3;
    v77[4] = __Block_byref_object_dispose__3;
    v78 = 0;
    objc_msgSend(WeakRetained, "compositeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      goto LABEL_42;
    objc_msgSend(v7, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "magicStateMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "magic");

    v76 = v12;
    objc_msgSend(v8, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "wired");

    v75 = v15;
    if (!v5)
      goto LABEL_42;
    if (v86[5])
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      if (objc_msgSend(v5, "containsObject:", *MEMORY[0x24BDC1320]))
        objc_msgSend((id)v86[5], "setModel:", self->_modelID);
      if (objc_msgSend(v5, "containsObject:", self->_cmioDeviceConnectionState))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v76, 1);
        v17 = (void *)MEMORY[0x24BDC1378];
        objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "propertyStateWithValue:attributes:", v16, v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v80[5];
        v80[5] = v19;

        v21 = v80[5];
        if (v21)
          objc_msgSend((id)v86[5], "setPropertyState:forProperty:", v21, self->_cmioDeviceConnectionState);

      }
      if (objc_msgSend(v5, "containsObject:", self->_cmioDeviceWired))
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v75, 1);
        v23 = (void *)MEMORY[0x24BDC1378];
        objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "propertyStateWithValue:attributes:", v22, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v80[5];
        v80[5] = v25;

        v27 = v80[5];
        if (v27)
          objc_msgSend((id)v86[5], "setPropertyState:forProperty:", v27, self->_cmioDeviceWired);

      }
      v28 = *MEMORY[0x24BDC1328];
      if (objc_msgSend(v5, "containsObject:", *MEMORY[0x24BDC1328]))
      {
        v29 = (void *)MEMORY[0x24BDC1378];
        nonLocalizedName = self->_nonLocalizedName;
        objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "propertyStateWithValue:attributes:", nonLocalizedName, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v80[5];
        v80[5] = v32;

        v34 = v80[5];
        if (v34)
          objc_msgSend((id)v86[5], "setPropertyState:forProperty:", v34, v28);
      }
      v35 = *MEMORY[0x24BDC1330];
      if (objc_msgSend(v5, "containsObject:", *MEMORY[0x24BDC1330]))
      {
        v36 = (void *)MEMORY[0x24BDC1378];
        v37 = (void *)MEMORY[0x24BDD16E0];
        v38 = objc_msgSend(WeakRetained, "entity") == 2 ? 1 : 2;
        objc_msgSend(v37, "numberWithInteger:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "propertyStateWithValue:attributes:", v39, v40);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v80[5];
        v80[5] = v41;

        v43 = v80[5];
        if (v43)
          objc_msgSend((id)v86[5], "setPropertyState:forProperty:", v43, v35);
      }
      if (objc_msgSend(v5, "containsObject:", CFSTR("CMIOExtensionPropertyDeviceCompanionDeskcamDeviceUUID")))
      {
        objc_msgSend(WeakRetained, "transportDevice");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "deviceIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        CMContinuityCaptureGetDeviceUUID(v45, 2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          v47 = (void *)MEMORY[0x24BDC1378];
          objc_msgSend(v46, "UUIDString");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "propertyStateWithValue:attributes:", v48, v49);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = (void *)v80[5];
          v80[5] = v50;

          v52 = v80[5];
          if (v52)
            objc_msgSend((id)v86[5], "setPropertyState:forProperty:", v52, CFSTR("CMIOExtensionPropertyDeviceCompanionDeskcamDeviceUUID"));
        }

      }
      if (objc_msgSend(v5, "containsObject:", CFSTR("CMIOExtensionPropertyContinuityCaptureDeviceState")))
      {
        objc_msgSend(WeakRetained, "stateMachineCurrentState");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          v54 = (void *)MEMORY[0x24BDC1378];
          objc_msgSend(WeakRetained, "stateMachineCurrentState");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "name");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "propertyStateWithValue:attributes:", v56, v57);
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = (void *)v80[5];
          v80[5] = v58;

          v60 = v80[5];
          if (v60)
            objc_msgSend((id)v86[5], "setPropertyState:forProperty:", v60, CFSTR("CMIOExtensionPropertyContinuityCaptureDeviceState"));
        }
      }
      if (objc_msgSend(v5, "containsObject:", CFSTR("CMIOExtensionPropertyContinuityCaptureDeviceStateEvent")))
      {
        objc_msgSend(MEMORY[0x24BDC1378], "propertyStateWithValue:attributes:", CFSTR("NA"), 0);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)v80[5];
        v80[5] = v61;

        v63 = v80[5];
        if (v63)
          objc_msgSend((id)v86[5], "setPropertyState:forProperty:", v63, CFSTR("CMIOExtensionPropertyContinuityCaptureDeviceStateEvent"));
      }
      if (objc_msgSend(v5, "containsObject:", CFSTR("CMIOExtensionPropertyRapportDeviceUniqueID")))
      {
        objc_msgSend(WeakRetained, "transportDevice");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "deviceIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "UUIDString");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          v67 = (void *)MEMORY[0x24BDC1378];
          objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "propertyStateWithValue:attributes:", v66, v68);
          v69 = objc_claimAutoreleasedReturnValue();
          v70 = (void *)v80[5];
          v80[5] = v69;

          v71 = v80[5];
          if (v71)
            objc_msgSend((id)v86[5], "setPropertyState:forProperty:", v71, CFSTR("CMIOExtensionPropertyRapportDeviceUniqueID"));
        }

      }
      v74[0] = MEMORY[0x24BDAC760];
      v74[1] = 3221225472;
      v74[2] = __75__CMContinuityCaptureCMIOVideoDevice__devicePropertiesForProperties_error___block_invoke;
      v74[3] = &unk_24F06B598;
      v74[4] = self;
      v74[5] = v77;
      v74[6] = &v79;
      v74[7] = &v85;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v74);
      v72 = (id)v86[5];
    }
    else
    {
LABEL_42:
      v72 = 0;
    }

    _Block_object_dispose(v77, 8);
    _Block_object_dispose(&v79, 8);

    _Block_object_dispose(&v85, 8);
  }
  else
  {
    v72 = 0;
  }

  return v72;
}

void __75__CMContinuityCaptureCMIOVideoDevice__devicePropertiesForProperties_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1[4] + 176), "objectForKeyedSubscript:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v6)
  {
    objc_msgSend(v6, "value");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v11 = (void *)MEMORY[0x24BDC1378];
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1[4] + 216), "objectForKeyedSubscript:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "propertyStateWithValue:attributes:", v12, v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1[6] + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        v17 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
        if (v17)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setPropertyState:forProperty:", v17, v18);
      }
    }
  }

}

- (void)_setCMIOExtensionPropertyAttributesByPropertyNames
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *cmioExtensionPropertyAttributesByCMIOExtensionPropertyName;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDC1318];
  objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cmioExtensionPropertyAttributesByCMIOExtensionPropertyName = self->_cmioExtensionPropertyAttributesByCMIOExtensionPropertyName;
  self->_cmioExtensionPropertyAttributesByCMIOExtensionPropertyName = v4;

}

- (BOOL)setDeviceProperties:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__CMContinuityCaptureCMIOVideoDevice_setDeviceProperties_error___block_invoke;
  v11[3] = &unk_24F06B4D8;
  v13 = &v21;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v15;
  dispatch_async_and_wait(queue, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v9;
}

void __64__CMContinuityCaptureCMIOVideoDevice_setDeviceProperties_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_setDeviceProperties:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_setDeviceProperties:(id)a3 error:(id *)a4
{
  NSObject *queue;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *WeakRetained;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  int v31;
  CMContinuityCaptureVideoDevice **p_captureDevice;
  id v33;
  void *v34;
  void *v35;
  id v36;
  int v38;
  CMContinuityCaptureCMIOVideoDevice *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return a3 != 0;
  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v7, "propertiesDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  CMContinuityCaptureLog(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138543618;
    v39 = self;
    v40 = 2114;
    v41 = v8;
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ propertyDict %{public}@", (uint8_t *)&v38, 0x16u);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByPropertyName, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyDeviceHidden"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyDeviceHidden"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    objc_msgSend(v10, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "BOOLValue"))
    {
      CMContinuityCaptureLog(2);
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = self;
        v40 = 2112;
        v41 = v17;
        _os_log_impl(&dword_227C5D000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip updating %@ to YES", (uint8_t *)&v38, 0x16u);

      }
    }
    else
    {
      if ((objc_msgSend(v14, "isEqualToNumber:", v15) & 1) != 0)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v12, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:", v18);

      CMContinuityCaptureLog(2);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543874;
        v39 = self;
        v40 = 2112;
        v41 = v20;
        v42 = 2112;
        v43 = v21;
        _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated %@ to %@", (uint8_t *)&v38, 0x20u);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
      -[NSObject compositeDelegate](WeakRetained, "compositeDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_loadWeakRetained((id *)&self->_captureDevice);
      objc_msgSend(v22, "device:updatedValueForControl:", v23, v10);

    }
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyContinuityCaptureDeviceStateEvent"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "value");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      objc_msgSend(v24, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v24, "value");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        CMContinuityCaptureRemoteEventToBeRelayedList();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "containsObject:", v29);
        p_captureDevice = &self->_captureDevice;
        v33 = objc_loadWeakRetained((id *)&self->_captureDevice);
        v34 = v33;
        if (v31)
          objc_msgSend(v33, "transportDevice");
        else
          objc_msgSend(v33, "compositeDelegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_loadWeakRetained((id *)p_captureDevice);
        objc_msgSend(v35, "postEvent:entity:data:", v29, objc_msgSend(v36, "entity"), 0);

      }
    }
  }

  return a3 != 0;
}

- (NSString)description
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
  objc_msgSend(WeakRetained, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)debugInfo
{
  return 0;
}

- (void)_updateCameraHiddenControlIfApplicable
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CMContinuityCaptureVideoDevice **p_captureDevice;
  id WeakRetained;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  uint8_t buf[4];
  CMContinuityCaptureCMIOVideoDevice *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByPropertyName, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyDeviceHidden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v19 = self;
    v20 = 2080;
    v21 = "-[CMContinuityCaptureCMIOVideoDevice _updateCameraHiddenControlIfApplicable]";
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s. cameraHiddenControl:%@", buf, 0x20u);
  }

  if (v3)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      CMContinuityCaptureLog(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v19 = self;
        v20 = 2112;
        v21 = (const char *)v3;
        _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated %@ value to NO.", buf, 0x16u);
      }

      objc_msgSend(v3, "setValue:", MEMORY[0x24BDBD1C0]);
      v8 = (void *)MEMORY[0x24BDC1378];
      objc_msgSend(v3, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "propertyStateWithValue:attributes:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v16 = CFSTR("CMIOExtensionPropertyDeviceHidden");
        v17 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMIOExtensionDevice notifyPropertiesChanged:](self, "notifyPropertiesChanged:", v11);

      }
      p_captureDevice = &self->_captureDevice;
      WeakRetained = objc_loadWeakRetained((id *)p_captureDevice);
      objc_msgSend(WeakRetained, "compositeDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_loadWeakRetained((id *)p_captureDevice);
      objc_msgSend(v14, "device:updatedValueForControl:", v15, v3);

    }
  }

}

- (void)_updateCameraReadyToUnhideControlIfApplicable
{
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CMContinuityCaptureVideoDevice **p_captureDevice;
  id WeakRetained;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  uint8_t buf[4];
  CMContinuityCaptureCMIOVideoDevice *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByPropertyName, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyDeviceReadyToUnhide"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v19 = self;
    v20 = 2080;
    v21 = "-[CMContinuityCaptureCMIOVideoDevice _updateCameraReadyToUnhideControlIfApplicable]";
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s. cameraReadyToUnhideControl:%@", buf, 0x20u);
  }

  if (v3)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((v6 & 1) == 0)
    {
      CMContinuityCaptureLog(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v19 = self;
        v20 = 2112;
        v21 = (const char *)v3;
        _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated %@ value to YES.", buf, 0x16u);
      }

      objc_msgSend(v3, "setValue:", MEMORY[0x24BDBD1C8]);
      v8 = (void *)MEMORY[0x24BDC1378];
      objc_msgSend(v3, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "propertyStateWithValue:attributes:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v16 = CFSTR("CMIOExtensionPropertyDeviceReadyToUnhide");
        v17 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMIOExtensionDevice notifyPropertiesChanged:](self, "notifyPropertiesChanged:", v11);

      }
      p_captureDevice = &self->_captureDevice;
      WeakRetained = objc_loadWeakRetained((id *)p_captureDevice);
      objc_msgSend(WeakRetained, "compositeDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_loadWeakRetained((id *)p_captureDevice);
      objc_msgSend(v14, "device:updatedValueForControl:", v15, v3);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmioExtensionPropertyAttributesByCMIOExtensionPropertyName, 0);
  objc_destroyWeak(&self->_wiredObserver);
  objc_destroyWeak((id *)&self->_magicStateObserver);
  objc_storeStrong((id *)&self->_systemPreferredStatusUpdateQueue, 0);
  objc_storeStrong((id *)&self->_cmControlByPropertyName, 0);
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_cmioDeviceWired, 0);
  objc_storeStrong((id *)&self->_cmioDeviceConnectionState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_captureDevice);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_nonLocalizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithCaptureDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ Unable to publish", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCaptureDevice:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ Invalid streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setupStreamsWithDeviceID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ Failed to create stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setupStreamsWithDeviceID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ Failed to Add stream error %@");
  OUTLINED_FUNCTION_1_0();
}

@end
