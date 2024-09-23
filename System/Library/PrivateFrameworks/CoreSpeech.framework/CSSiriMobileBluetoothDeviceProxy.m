@implementation CSSiriMobileBluetoothDeviceProxy

- (NSString)description
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  if (self->_deviceUID)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11.receiver = self;
    v11.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
    -[CSSiriMobileBluetoothDeviceProxy description](&v11, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {deviceUID = %@}"), v4, self->_deviceUID);
  }
  else
  {
    if (!self->_address)
    {
      v9.receiver = self;
      v9.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
      -[CSSiriMobileBluetoothDeviceProxy description](&v9, sel_description);
      return (NSString *)(id)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10.receiver = self;
    v10.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
    -[CSSiriMobileBluetoothDeviceProxy description](&v10, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "initWithFormat:", CFSTR("%@ {address = %@}"), v4, self->_address);
  }
  v7 = (void *)v5;

  return (NSString *)v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  CSSiriMobileBluetoothDeviceProxy *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[CSSiriMobileBluetoothDeviceProxy dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
  -[CSSiriMobileBluetoothDeviceProxy dealloc](&v4, sel_dealloc);
}

- (CSSiriMobileBluetoothDeviceProxy)initWithAddress:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSSiriMobileBluetoothDeviceProxy *v11;
  uint64_t v12;
  NSString *address;
  NSObject *v14;
  NSObject *queue;
  _QWORD block[4];
  CSSiriMobileBluetoothDeviceProxy *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  CSSiriMobileBluetoothDeviceProxy *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
  v11 = -[CSSiriMobileBluetoothDeviceProxy init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    address = v11->_address;
    v11->_address = (NSString *)v12;

    v14 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSiriMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]";
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_dataSource, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    queue = v11->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CSSiriMobileBluetoothDeviceProxy_initWithAddress_dataSource_queue___block_invoke;
    block[3] = &unk_1E7C292C8;
    v18 = v11;
    dispatch_async(queue, block);

  }
  return v11;
}

- (CSSiriMobileBluetoothDeviceProxy)initWithDeviceUID:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSSiriMobileBluetoothDeviceProxy *v11;
  uint64_t v12;
  NSUUID *deviceUID;
  NSObject *v14;
  NSObject *queue;
  _QWORD block[4];
  CSSiriMobileBluetoothDeviceProxy *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  CSSiriMobileBluetoothDeviceProxy *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
  v11 = -[CSSiriMobileBluetoothDeviceProxy init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    deviceUID = v11->_deviceUID;
    v11->_deviceUID = (NSUUID *)v12;

    v14 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSiriMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]";
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_dataSource, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    queue = v11->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__CSSiriMobileBluetoothDeviceProxy_initWithDeviceUID_dataSource_queue___block_invoke;
    block[3] = &unk_1E7C292C8;
    v18 = v11;
    dispatch_async(queue, block);

  }
  return v11;
}

- (void)updateDeviceInfo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CSSiriMobileBluetoothDeviceProxy_updateDeviceInfo___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)reload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CSSiriMobileBluetoothDeviceProxy_reload__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)prewarm
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CSSiriMobileBluetoothDeviceProxy_prewarm__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)identifier
{
  void *address;
  void *v4;
  id v5;

  -[NSUUID UUIDString](self->_deviceUID, "UUIDString");
  address = (void *)objc_claimAutoreleasedReturnValue();
  v4 = address;
  if (!address)
    address = self->_address;
  v5 = address;

  return v5;
}

- (id)deviceInfo
{
  NSObject *queue;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__22668;
  v19 = __Block_byref_object_dispose__22669;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__22668;
  v13 = __Block_byref_object_dispose__22669;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CSSiriMobileBluetoothDeviceProxy_deviceInfo__block_invoke;
  block[3] = &unk_1E7C27C98;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  v3 = v10[5];
  if (v3 && (v4 = dispatch_time(0, 4000000000), dispatch_semaphore_wait(v3, v4)))
  {
    v5 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CSSiriMobileBluetoothDeviceProxy deviceInfo]";
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Slow path timed out after 4 seconds.", buf, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v6 = (id)v16[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (void)getDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__CSSiriMobileBluetoothDeviceProxy_getDeviceInfo___block_invoke;
    v7[3] = &unk_1E7C29150;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getHeadphoneInEarDetectionState:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "-[CSSiriMobileBluetoothDeviceProxy getHeadphoneInEarDetectionState:]";
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v5, 0xCu);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    v3[2](v3, 0);
LABEL_4:

}

- (void)getHeadphoneListeningMode:(id)a3
{
  void (**v3)(id, uint64_t);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t))a3;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "-[CSSiriMobileBluetoothDeviceProxy getHeadphoneListeningMode:]";
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v5, 0xCu);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    v3[2](v3, 1);
LABEL_4:

}

- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a4;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "-[CSSiriMobileBluetoothDeviceProxy setHeadphoneListeningMode:completion:]";
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v6, 0xCu);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
LABEL_3:
    v4[2](v4, 0);
LABEL_4:

}

- (void)connect:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CSSiriMobileBluetoothDeviceProxy_connect___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)disconnect:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CSSiriMobileBluetoothDeviceProxy_disconnect___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__CSSiriMobileBluetoothDeviceProxy_addObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__CSSiriMobileBluetoothDeviceProxy_removeObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getConversationAwareness:(id)a3
{
  void (**v3)(id, void *);
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *))a3;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "-[CSSiriMobileBluetoothDeviceProxy getConversationAwareness:]";
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v6, 0xCu);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE818]), "initWithValue:status:", 0, 3);
    v3[2](v3, v5);

  }
LABEL_4:

}

- (void)getPersonalVolume:(id)a3
{
  void (**v3)(id, void *);
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *))a3;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "-[CSSiriMobileBluetoothDeviceProxy getPersonalVolume:]";
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v6, 0xCu);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE818]), "initWithValue:status:", 0, 3);
    v3[2](v3, v5);

  }
LABEL_4:

}

- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a4;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[CSSiriMobileBluetoothDeviceProxy setConversationAwareness:completion:]";
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v7, 0xCu);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE818]), "initWithValue:status:", 0, 3);
    v4[2](v4, v6);

  }
LABEL_4:

}

- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a4;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[CSSiriMobileBluetoothDeviceProxy setPersonalVolume:completion:]";
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v7, 0xCu);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE818]), "initWithValue:status:", 0, 3);
    v4[2](v4, v6);

  }
LABEL_4:

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CSSiriMobileBluetoothDeviceProxy_invalidate__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reload:(BOOL)a3
{
  BOOL v3;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  CSSiriMobileBluetoothDeviceProxy *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_deviceInfo)
    v3 = !a3;
  else
    v3 = 0;
  if (!v3)
  {
    v5 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[CSSiriMobileBluetoothDeviceProxy _reload:]";
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s Reloading device info for %@...", buf, 0x16u);
    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__CSSiriMobileBluetoothDeviceProxy__reload___block_invoke;
    v6[3] = &unk_1E7C28190;
    v6[4] = self;
    -[CSSiriMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:](self, "_fetchDeviceInfoWithCompletion:", v6);
  }
}

- (void)_getDeviceInfo:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (v4)
  {
    if (self->_deviceInfo)
    {
      v4[2](v4);
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __51__CSSiriMobileBluetoothDeviceProxy__getDeviceInfo___block_invoke;
      v6[3] = &unk_1E7C27CE8;
      v6[4] = self;
      v7 = v4;
      -[CSSiriMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:](self, "_fetchDeviceInfoWithCompletion:", v6);

    }
  }

}

- (void)_updateDeviceInfo:(id)a3
{
  AFBluetoothDeviceInfo *v4;
  NSObject **v5;
  NSObject *v6;
  AFBluetoothDeviceInfo *deviceInfo;
  AFBluetoothDeviceInfo *v8;
  AFBluetoothDeviceInfo *v9;
  AFBluetoothDeviceInfo *v10;
  AFBluetoothDeviceInfo *v11;
  NSObject *v12;
  AFBluetoothDeviceInfo *v13;
  AFBluetoothDeviceInfo *v14;
  _QWORD v15[5];
  AFBluetoothDeviceInfo *v16;
  AFBluetoothDeviceInfo *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  AFBluetoothDeviceInfo *v21;
  __int16 v22;
  AFBluetoothDeviceInfo *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (AFBluetoothDeviceInfo *)a3;
  v5 = (NSObject **)MEMORY[0x1E0CFE6A8];
  v6 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSSiriMobileBluetoothDeviceProxy _updateDeviceInfo:]";
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s deviceInfo = %@", buf, 0x16u);
  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo != v4 && (-[AFBluetoothDeviceInfo isEqual:](deviceInfo, "isEqual:", v4) & 1) == 0)
  {
    v8 = self->_deviceInfo;
    v9 = (AFBluetoothDeviceInfo *)-[AFBluetoothDeviceInfo copy](v4, "copy");
    v10 = self->_deviceInfo;
    self->_deviceInfo = v9;

    v11 = self->_deviceInfo;
    v12 = *v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[CSSiriMobileBluetoothDeviceProxy _updateDeviceInfo:]";
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s deviceInfo changed from %@ to %@", buf, 0x20u);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__CSSiriMobileBluetoothDeviceProxy__updateDeviceInfo___block_invoke;
    v15[3] = &unk_1E7C27D10;
    v15[4] = self;
    v16 = v8;
    v17 = v11;
    v13 = v11;
    v14 = v8;
    -[CSSiriMobileBluetoothDeviceProxy _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v15);

  }
}

- (void)_fetchDeviceInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  CSSiriMobileBluetoothDeviceProxy *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSSiriMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:]";
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s Fetching device info for %@...", buf, 0x16u);
    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__CSSiriMobileBluetoothDeviceProxy__fetchDeviceInfoWithCompletion___block_invoke;
    v6[3] = &unk_1E7C27D60;
    v6[4] = self;
    v7 = v4;
    -[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:](self, "_accessBTDeviceAndAccessoryManagerUsingBlock:", v6);

  }
}

- (void)_accessBTDeviceAndAccessoryManagerUsingBlock:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  id WeakRetained;
  NSUUID *deviceUID;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSString *address;
  const char *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  CSSiriMobileBluetoothDeviceProxy *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (os_log_t *)MEMORY[0x1E0CFE6A8];
    v6 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
      v20 = 2112;
      v21 = self;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Getting BTDevice and BTAccessoryManager for %@...", buf, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      deviceUID = self->_deviceUID;
      if (deviceUID)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke;
        v16[3] = &unk_1E7C27D60;
        v16[4] = self;
        v17 = v4;
        objc_msgSend(WeakRetained, "getBTDeviceWithDeviceUID:completion:", deviceUID, v16);
        v9 = v17;
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      address = self->_address;
      if (address)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_2;
        v14[3] = &unk_1E7C27D60;
        v14[4] = self;
        v15 = v4;
        objc_msgSend(WeakRetained, "getBTDeviceWithAddress:completion:", address, v14);
        v9 = v15;
        goto LABEL_13;
      }
      v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
        v20 = 2112;
        v21 = self;
        v13 = "%s Device UID and address of %@ are nil.";
LABEL_19:
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
      }
    }
    else
    {
      v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
        v20 = 2112;
        v21 = self;
        v13 = "%s Data source of %@ is nil.";
        goto LABEL_19;
      }
    }
    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
      v20 = 2112;
      v21 = self;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Failed getting BTDevice and BTAccessoryManager for %@.", buf, 0x16u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)_invalidate
{
  NSObject *v3;
  AFBluetoothDeviceInfo *deviceInfo;
  AFBluetoothHeadphoneInEarDetectionState *headphoneInEarDetectionState;
  uint64_t v6;
  NSHashTable *observers;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSSiriMobileBluetoothDeviceProxy _invalidate]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_storeWeak((id *)&self->_dataSource, 0);
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = 0;

  headphoneInEarDetectionState = self->_headphoneInEarDetectionState;
  self->_headphoneInEarDetectionState = 0;

  v6 = MEMORY[0x1E0C809B0];
  self->_headphoneListeningMode = 0;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __47__CSSiriMobileBluetoothDeviceProxy__invalidate__block_invoke;
  v8[3] = &unk_1E7C27DB0;
  v8[4] = self;
  -[CSSiriMobileBluetoothDeviceProxy _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v8);
  observers = self->_observers;
  self->_observers = 0;

}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4;
  NSHashTable *observers;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      v7 = v4;
      -[NSHashTable setRepresentation](observers, "setRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __66__CSSiriMobileBluetoothDeviceProxy__enumerateObserversUsingBlock___block_invoke;
      v8[3] = &unk_1E7C27DD8;
      v9 = v7;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

      v4 = v7;
    }
  }

}

- (NSString)address
{
  return self->_address;
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_headphoneInEarDetectionState, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __66__CSSiriMobileBluetoothDeviceProxy__enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__CSSiriMobileBluetoothDeviceProxy__invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "bluetoothDeviceDidInvalidate:", *(_QWORD *)(a1 + 32));

}

void __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v15 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]_block_invoke";
    v16 = 2048;
    v17 = a2;
    v18 = 2048;
    v19 = a3;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Got BTDevice %p and BTAccessoryManager %p for %@.", buf, 0x2Au);
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_122;
  block[3] = &unk_1E7C27D88;
  v11 = v8;
  v12 = a2;
  v13 = a3;
  dispatch_async(v9, block);

}

void __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v15 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]_block_invoke_2";
    v16 = 2048;
    v17 = a2;
    v18 = 2048;
    v19 = a3;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Got BTDevice %p and BTAccessoryManager %p for %@.", buf, 0x2Au);
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_123;
  block[3] = &unk_1E7C27D88;
  v11 = v8;
  v12 = a2;
  v13 = a3;
  dispatch_async(v9, block);

}

uint64_t __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_123(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

uint64_t __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_122(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

void __67__CSSiriMobileBluetoothDeviceProxy__fetchDeviceInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  os_log_t *v5;
  void *v8;
  int DeviceId;
  BOOL v10;
  int v11;
  NSObject *v12;
  int IsAppleAudioDevice;
  int v14;
  NSObject *v15;
  int FeatureCapability;
  int v17;
  NSObject *v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  int v23;
  NSObject *v24;
  int v25;
  int v26;
  NSObject *v27;
  int v28;
  int v29;
  NSObject *v30;
  int AnnounceMessagesSupport;
  int v32;
  NSObject *v33;
  int AnnounceCallsSupport;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE buf[24];
  void *v53;
  id v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C809B0];
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  if (!a2)
  {
    v35 = 0;
    goto LABEL_41;
  }
  _CSSiriBTDeviceGetAddress(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = 0;
  DeviceId = BTDeviceGetDeviceId();
  v10 = DeviceId != 0;
  if (DeviceId)
  {
    v11 = DeviceId;
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v53) = v11;
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Failed getting vendor id and product id from BTDevice %p (result = %d).", buf, 0x1Cu);
    }
  }
  v49 = 0;
  IsAppleAudioDevice = BTDeviceIsAppleAudioDevice();
  if (IsAppleAudioDevice)
  {
    v14 = IsAppleAudioDevice;
    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v53) = v14;
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s Failed getting vendor id and product id from BTDevice %p (result = %d).", buf, 0x1Cu);
    }
    v10 = 1;
  }
  v47 = 0;
  v48 = 0;
  if (a3)
  {
    FeatureCapability = BTAccessoryManagerGetFeatureCapability();
    if (FeatureCapability)
    {
      v17 = FeatureCapability;
      v18 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a2;
        *(_WORD *)&buf[22] = 2048;
        v53 = a3;
        LOWORD(v54) = 1024;
        *(_DWORD *)((char *)&v54 + 2) = v17;
        _os_log_error_impl(&dword_1C2614000, v18, OS_LOG_TYPE_ERROR, "%s Failed getting InEar capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
      }
      v10 = 1;
    }
    v19 = BTAccessoryManagerGetFeatureCapability();
    if (v19)
    {
      v20 = v19;
      v21 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a2;
        *(_WORD *)&buf[22] = 2048;
        v53 = a3;
        LOWORD(v54) = 1024;
        *(_DWORD *)((char *)&v54 + 2) = v20;
        _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, "%s Failed getting DoAP capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
      }
      v10 = 1;
    }
  }
  v46 = 0;
  v22 = BTAccessoryManagerGetFeatureCapability();
  if (v22)
  {
    v23 = v22;
    v24 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v53 = a3;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = v23;
      _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s Failed getting ANC capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    v10 = 1;
  }
  v45 = 0;
  v25 = BTAccessoryManagerGetFeatureCapability();
  if (v25)
  {
    v26 = v25;
    v27 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v53 = a3;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = v26;
      _os_log_error_impl(&dword_1C2614000, v27, OS_LOG_TYPE_ERROR, "%s Failed getting Transparency capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    v10 = 1;
  }
  v44 = 0;
  v28 = BTAccessoryManagerGetFeatureCapability();
  if (v28)
  {
    v29 = v28;
    v30 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v53 = a3;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = v29;
      _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s Failed getting Software Volume capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    v10 = 1;
  }
  v43 = 0;
  AnnounceMessagesSupport = BTAccessoryManagerGetAnnounceMessagesSupport();
  if (AnnounceMessagesSupport)
  {
    v32 = AnnounceMessagesSupport;
    v33 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v53 = a3;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = v32;
      _os_log_error_impl(&dword_1C2614000, v33, OS_LOG_TYPE_ERROR, "%s Failed getting Announce Messages capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    v42 = 0;
    AnnounceCallsSupport = BTAccessoryManagerGetAnnounceCallsSupport();
    if (!AnnounceCallsSupport)
      goto LABEL_39;
    goto LABEL_37;
  }
  v42 = 0;
  AnnounceCallsSupport = BTAccessoryManagerGetAnnounceCallsSupport();
  if (AnnounceCallsSupport)
  {
LABEL_37:
    v36 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v53 = a3;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = AnnounceCallsSupport;
      _os_log_error_impl(&dword_1C2614000, v36, OS_LOG_TYPE_ERROR, "%s Failed getting Announce Calls capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    goto LABEL_39;
  }
  if (!v10)
  {
    v40 = (void *)MEMORY[0x1E0CFE820];
    *(_QWORD *)buf = v4;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___CSSiriBTDeviceGetDeviceInfo_block_invoke;
    v53 = &unk_1E7C27E00;
    v54 = v8;
    v55 = v51;
    v56 = HIDWORD(v50);
    v57 = v49;
    v58 = v48;
    v59 = v47;
    v60 = v43;
    v61 = v46;
    v62 = v45;
    v63 = v42;
    v35 = (void *)objc_msgSend(v40, "newWithBuilder:", buf);

    goto LABEL_40;
  }
LABEL_39:
  v35 = 0;
LABEL_40:

LABEL_41:
  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __67__CSSiriMobileBluetoothDeviceProxy__fetchDeviceInfoWithCompletion___block_invoke_2;
  v41[3] = &unk_1E7C27D38;
  v41[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v35, "mutatedCopyWithMutator:", v41);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    v39 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSSiriMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2112;
    v53 = v39;
    _os_log_impl(&dword_1C2614000, v38, OS_LOG_TYPE_INFO, "%s Fetched device info %@ for %@.", buf, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __67__CSSiriMobileBluetoothDeviceProxy__fetchDeviceInfoWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

void __54__CSSiriMobileBluetoothDeviceProxy__updateDeviceInfo___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "bluetoothDevice:deviceInfoDidChangeFrom:to:", a1[4], a1[5], a1[6]);

}

void __51__CSSiriMobileBluetoothDeviceProxy__getDeviceInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_updateDeviceInfo:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __44__CSSiriMobileBluetoothDeviceProxy__reload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateDeviceInfo:", v3);
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[CSSiriMobileBluetoothDeviceProxy _reload:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s Reloaded device info %@ for %@.", (uint8_t *)&v6, 0x20u);
  }

}

uint64_t __46__CSSiriMobileBluetoothDeviceProxy_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __51__CSSiriMobileBluetoothDeviceProxy_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__CSSiriMobileBluetoothDeviceProxy_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __47__CSSiriMobileBluetoothDeviceProxy_disconnect___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__CSSiriMobileBluetoothDeviceProxy_disconnect___block_invoke_2;
  v2[3] = &unk_1E7C27CC0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_accessBTDeviceAndAccessoryManagerUsingBlock:", v2);

}

void __47__CSSiriMobileBluetoothDeviceProxy_disconnect___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = BTDeviceDisconnect();
  _CSSiriBTResultGetError(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 != 0);
    v3 = v5;
  }

}

void __44__CSSiriMobileBluetoothDeviceProxy_connect___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__CSSiriMobileBluetoothDeviceProxy_connect___block_invoke_2;
  v2[3] = &unk_1E7C27CC0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_accessBTDeviceAndAccessoryManagerUsingBlock:", v2);

}

void __44__CSSiriMobileBluetoothDeviceProxy_connect___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = BTDeviceConnect();
  _CSSiriBTResultGetError(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 != 0);
    v3 = v5;
  }

}

uint64_t __50__CSSiriMobileBluetoothDeviceProxy_getDeviceInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getDeviceInfo:", *(_QWORD *)(a1 + 40));
}

void __46__CSSiriMobileBluetoothDeviceProxy_deviceInfo__block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  CFAbsoluteTime Current;
  dispatch_semaphore_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  __int128 v10;
  CFAbsoluteTime v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v2);
  }
  else
  {
    v3 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSSiriMobileBluetoothDeviceProxy deviceInfo]_block_invoke";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s Using slow path...", buf, 0xCu);
    }
    Current = CFAbsoluteTimeGetCurrent();
    v5 = dispatch_semaphore_create(0);
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = (void *)a1[4];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__CSSiriMobileBluetoothDeviceProxy_deviceInfo__block_invoke_114;
    v9[3] = &unk_1E7C27C70;
    v11 = Current;
    v10 = *(_OWORD *)(a1 + 5);
    objc_msgSend(v8, "_getDeviceInfo:", v9);
  }
}

void __46__CSSiriMobileBluetoothDeviceProxy_deviceInfo__block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  CFAbsoluteTime v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  CFAbsoluteTime v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    v10 = 136315394;
    v11 = "-[CSSiriMobileBluetoothDeviceProxy deviceInfo]_block_invoke";
    v12 = 2048;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s Slow path took %f seconds.", (uint8_t *)&v10, 0x16u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;
  v9 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __43__CSSiriMobileBluetoothDeviceProxy_prewarm__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reload:", 0);
}

uint64_t __42__CSSiriMobileBluetoothDeviceProxy_reload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reload:", 1);
}

uint64_t __53__CSSiriMobileBluetoothDeviceProxy_updateDeviceInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDeviceInfo:", *(_QWORD *)(a1 + 40));
}

void __71__CSSiriMobileBluetoothDeviceProxy_initWithDeviceUID_dataSource_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSSiriMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_INFO, "%s Loading device info for %@...", buf, 0x16u);
  }
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__CSSiriMobileBluetoothDeviceProxy_initWithDeviceUID_dataSource_queue___block_invoke_113;
  v5[3] = &unk_1E7C28190;
  v6 = v4;
  objc_msgSend(v6, "_fetchDeviceInfoWithCompletion:", v5);

}

void __71__CSSiriMobileBluetoothDeviceProxy_initWithDeviceUID_dataSource_queue___block_invoke_113(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateDeviceInfo:", v3);
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[CSSiriMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s Loaded device info %@ for %@.", (uint8_t *)&v6, 0x20u);
  }

}

void __69__CSSiriMobileBluetoothDeviceProxy_initWithAddress_dataSource_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSSiriMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_INFO, "%s Loading device info for %@...", buf, 0x16u);
  }
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__CSSiriMobileBluetoothDeviceProxy_initWithAddress_dataSource_queue___block_invoke_112;
  v5[3] = &unk_1E7C28190;
  v6 = v4;
  objc_msgSend(v6, "_fetchDeviceInfoWithCompletion:", v5);

}

void __69__CSSiriMobileBluetoothDeviceProxy_initWithAddress_dataSource_queue___block_invoke_112(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateDeviceInfo:", v3);
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[CSSiriMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s Loaded device info %@ for %@.", (uint8_t *)&v6, 0x20u);
  }

}

@end
