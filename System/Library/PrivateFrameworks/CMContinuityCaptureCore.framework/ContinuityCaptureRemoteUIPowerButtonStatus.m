@implementation ContinuityCaptureRemoteUIPowerButtonStatus

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_7);
  return (id)_powerButtonStatus;
}

void __60__ContinuityCaptureRemoteUIPowerButtonStatus_sharedInstance__block_invoke()
{
  ContinuityCaptureRemoteUIPowerButtonStatus *v0;
  uint64_t v1;
  void *v2;

  v0 = [ContinuityCaptureRemoteUIPowerButtonStatus alloc];
  v1 = -[ContinuityCaptureRemoteUIPowerButtonStatus initWithQueue:](v0, "initWithQueue:", MEMORY[0x24BDAC9B8]);
  v2 = (void *)_powerButtonStatus;
  _powerButtonStatus = v1;

}

+ (void)invalidate
{
  if ((objc_msgSend((id)_powerButtonStatus, "invalidated") & 1) == 0)
  {
    objc_msgSend((id)_powerButtonStatus, "invalidate");
    objc_msgSend((id)_powerButtonStatus, "setInvalidated:", 1);
  }
}

- (void)invalidate
{
  HIDEventSystemClient *hidEventSystemClient;

  hidEventSystemClient = self->_hidEventSystemClient;
  if (hidEventSystemClient)
    -[HIDEventSystemClient cancel](hidEventSystemClient, "cancel");
}

- (ContinuityCaptureRemoteUIPowerButtonStatus)initWithQueue:(id)a3
{
  id v5;
  ContinuityCaptureRemoteUIPowerButtonStatus *v6;
  ContinuityCaptureRemoteUIPowerButtonStatus *v7;
  ContinuityCaptureButtonPressTracker *v8;
  ContinuityCaptureButtonPressTracker *hidButtonTracker;
  NSObject *queue;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ContinuityCaptureRemoteUIPowerButtonStatus;
  v6 = -[ContinuityCaptureRemoteUIPowerButtonStatus init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_alloc_init(ContinuityCaptureButtonPressTracker);
    hidButtonTracker = v7->_hidButtonTracker;
    v7->_hidButtonTracker = v8;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    queue = v7->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __60__ContinuityCaptureRemoteUIPowerButtonStatus_initWithQueue___block_invoke;
    v12[3] = &unk_24F06AE60;
    objc_copyWeak(&v13, &location);
    dispatch_async(queue, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __60__ContinuityCaptureRemoteUIPowerButtonStatus_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setupPowerButtonMonitor");
    WeakRetained = v2;
  }

}

- (void)setupPowerButtonMonitor
{
  HIDEventSystemClient *v3;
  HIDEventSystemClient *hidEventSystemClient;
  NSObject *v5;
  HIDEventSystemClient *v6;
  HIDEventSystemClient *v7;
  void *v8;
  HIDEventSystemClient *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id location;
  uint8_t buf[4];
  ContinuityCaptureRemoteUIPowerButtonStatus *v18;
  __int16 v19;
  HIDEventSystemClient *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (!self->_hidEventSystemClient)
  {
    v3 = (HIDEventSystemClient *)objc_msgSend(objc_alloc(MEMORY[0x24BE3E800]), "initWithType:", 1);
    hidEventSystemClient = self->_hidEventSystemClient;
    self->_hidEventSystemClient = v3;

    if (self->_hidEventSystemClient)
    {
      CMContinuityCaptureLog(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = self->_hidEventSystemClient;
        *(_DWORD *)buf = 138412546;
        v18 = self;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ hidEventSystemClient: %@", buf, 0x16u);
      }

      -[HIDEventSystemClient setMatching:](self->_hidEventSystemClient, "setMatching:", &unk_24F07FDA0);
      v7 = self->_hidEventSystemClient;
      dispatch_get_global_queue(0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HIDEventSystemClient setDispatchQueue:](v7, "setDispatchQueue:", v8);

      v9 = self->_hidEventSystemClient;
      v11 = MEMORY[0x24BDAC760];
      v12 = 3221225472;
      v13 = __69__ContinuityCaptureRemoteUIPowerButtonStatus_setupPowerButtonMonitor__block_invoke;
      v14 = &unk_24F06C208;
      objc_copyWeak(&v15, &location);
      -[HIDEventSystemClient setEventHandler:](v9, "setEventHandler:", &v11);
      -[HIDEventSystemClient activate](self->_hidEventSystemClient, "activate", v11, v12, v13, v14);
      objc_destroyWeak(&v15);
    }
    else
    {
      CMContinuityCaptureLog(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = self;
        _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%@ hidEventSystemClient failure ", buf, 0xCu);
      }

    }
  }
  objc_destroyWeak(&location);
}

void __69__ContinuityCaptureRemoteUIPowerButtonStatus_setupPowerButtonMonitor__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;
  _QWORD *WeakRetained;
  NSObject *v10;
  id v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[4];
  id v16[3];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 3)
  {
    v5 = objc_msgSend(v4, "integerValueForField:", 196608);
    v6 = (void *)objc_msgSend(v4, "integerValueForField:", 196609);
    v7 = (void *)objc_msgSend(v4, "integerValueForField:", 196610);
    v8 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      CMContinuityCaptureLog(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_loadWeakRetained(v8);
        v12 = objc_msgSend(v4, "type");
        v13 = WeakRetained[3];
        *(_DWORD *)buf = 138413570;
        v18 = v11;
        v19 = 1024;
        v20 = v12;
        v21 = 2048;
        v22 = v5;
        v23 = 2048;
        v24 = v6;
        v25 = 2048;
        v26 = v7;
        v27 = 2114;
        v28 = v13;
        _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%@ type: %d uP: %ld u: %ld down: %ld _hidPowerButtonTracker %{public}@", buf, 0x3Au);

      }
      if (v5 == 12)
      {
        v14 = WeakRetained[1];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __69__ContinuityCaptureRemoteUIPowerButtonStatus_setupPowerButtonMonitor__block_invoke_34;
        block[3] = &unk_24F06C1E0;
        objc_copyWeak(v16, v8);
        v16[1] = v6;
        v16[2] = v7;
        dispatch_async(v14, block);
        objc_destroyWeak(v16);
      }
    }

  }
}

void __69__ContinuityCaptureRemoteUIPowerButtonStatus_setupPowerButtonMonitor__block_invoke_34(uint64_t a1)
{
  id *WeakRetained;
  BOOL v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[3], "registerCordPress:down:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) != 0);
    v3 = !*(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 40) == 48 && (objc_msgSend(v4[3], "valid") & 1) != 0;
    objc_msgSend(v4, "willChangeValueForKey:", CFSTR("powerButtonPressed"));
    *((_BYTE *)v4 + 32) = v3;
    objc_msgSend(v4, "didChangeValueForKey:", CFSTR("powerButtonPressed"));
    WeakRetained = v4;
    if (!*(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 40) == 48)
    {
      objc_msgSend(v4[3], "clear");
      WeakRetained = v4;
    }
  }

}

- (BOOL)powerButtonPressed
{
  return self->_powerButtonPressed;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidButtonTracker, 0);
  objc_storeStrong((id *)&self->_hidEventSystemClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
