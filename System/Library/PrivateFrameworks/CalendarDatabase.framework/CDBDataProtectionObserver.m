@implementation CDBDataProtectionObserver

- (void)setStateChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CDBDataProtectionObserver)init
{
  CDBDataProtectionObserver *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CDBDataProtectionObserver;
  v2 = -[CDBDataProtectionObserver init](&v12, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = objc_alloc(MEMORY[0x1E0D0C2D8]);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __33__CDBDataProtectionObserver_init__block_invoke;
    v9 = &unk_1E4F83F10;
    objc_copyWeak(&v10, &location);
    v4 = (void *)objc_msgSend(v3, "initWithStateChangedCallback:", &v6);
    -[CDBDataProtectionObserver setDeviceLockObserver:](v2, "setDeviceLockObserver:", v4, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setDeviceLockObserver:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLockObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLockObserver, 0);
  objc_storeStrong(&self->_stateChangedCallback, 0);
}

+ (NSString)stateChangedNotificationName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D0C2D8], "stateChangedNotificationName");
}

- (BOOL)dataIsAccessible
{
  void *v2;
  char v3;

  -[CDBDataProtectionObserver deviceLockObserver](self, "deviceLockObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBeenUnlockedSinceBoot");

  return v3;
}

- (CalDeviceLockObserver)deviceLockObserver
{
  return self->_deviceLockObserver;
}

void __33__CDBDataProtectionObserver_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deviceLockStateChanged");

}

- (void)_deviceLockStateChanged
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    -[CDBDataProtectionObserver dataIsAccessible](self, "dataIsAccessible");
    CalBooleanAsString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A5CCB000, v4, OS_LOG_TYPE_DEBUG, "Device lock state changed.  New 'dataIsAccessible' state: [%@].", (uint8_t *)&v8, 0xCu);

  }
  -[CDBDataProtectionObserver stateChangedCallback](self, "stateChangedCallback");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t))(v6 + 16))(v6);

}

- (id)stateChangedCallback
{
  return self->_stateChangedCallback;
}

@end
