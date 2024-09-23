@implementation EKDataProtectionObserver

+ (NSString)stateChangedNotificationName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D0BB00], "stateChangedNotificationName");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProtectionObserver, 0);
  objc_storeStrong(&self->_stateChangedCallback, 0);
}

- (BOOL)dataIsAccessible
{
  void *v2;
  char v3;

  -[EKDataProtectionObserver dataProtectionObserver](self, "dataProtectionObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataIsAccessible");

  return v3;
}

- (void)setStateChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (EKDataProtectionObserver)init
{
  EKDataProtectionObserver *v2;
  id v3;
  void *v4;
  uint64_t v6;
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKDataProtectionObserver;
  v2 = -[EKDataProtectionObserver init](&v9, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = objc_alloc_init(MEMORY[0x1E0D0BB00]);
    -[EKDataProtectionObserver setDataProtectionObserver:](v2, "setDataProtectionObserver:", v3);

    v6 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v7, &location);
    -[EKDataProtectionObserver dataProtectionObserver](v2, "dataProtectionObserver", v6, 3221225472, __32__EKDataProtectionObserver_init__block_invoke, &unk_1E4785050);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStateChangedCallback:", &v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (CDBDataProtectionObserver)dataProtectionObserver
{
  return self->_dataProtectionObserver;
}

- (void)setDataProtectionObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionObserver, a3);
}

void __32__EKDataProtectionObserver_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dataProtectionStateChanged");

}

- (void)_dataProtectionStateChanged
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(a2, "dataIsAccessible"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_debug_impl(&dword_1A2318000, v4, OS_LOG_TYPE_DEBUG, "Data protection state changed.  New 'dataIsAccessible' state: [%@].", (uint8_t *)&v6, 0xCu);

}

- (id)stateChangedCallback
{
  return self->_stateChangedCallback;
}

@end
