@implementation VSPrivacyInfoCenter

+ (id)sharedPrivacyInfoCenter
{
  if (sharedPrivacyInfoCenter___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedPrivacyInfoCenter___vs_lazy_init_predicate, &__block_literal_global_53);
  return (id)sharedPrivacyInfoCenter___vs_lazy_init_variable;
}

void __46__VSPrivacyInfoCenter_sharedPrivacyInfoCenter__block_invoke()
{
  VSPrivacyInfoCenter *v0;
  void *v1;

  v0 = objc_alloc_init(VSPrivacyInfoCenter);
  v1 = (void *)sharedPrivacyInfoCenter___vs_lazy_init_variable;
  sharedPrivacyInfoCenter___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSPrivacyInfoCenter)init
{
  VSPrivacyInfoCenter *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint32_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD handler[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VSPrivacyInfoCenter;
  v2 = -[VSPrivacyInfoCenter init](&v18, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __27__VSPrivacyInfoCenter_init__block_invoke;
    handler[3] = &unk_1E93A1060;
    objc_copyWeak(&v16, &location);
    v6 = notify_register_dispatch("com.apple.tcc.access.changed", &v2->_registrationToken, v3, handler);

    if (v6)
    {
      VSErrorLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[VSPrivacyInfoCenter init].cold.1(v7);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __27__VSPrivacyInfoCenter_init__block_invoke_6;
    v13[3] = &unk_1E939EEB0;
    objc_copyWeak(&v14, &location);
    v10 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, v9, v13);

    +[VSManagedProfileConnection sharedConnection](VSManagedProfileConnection, "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerObserver:", v2);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__VSPrivacyInfoCenter_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "TCC access changed notification received.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateAccountAccessStatus");

}

void __27__VSPrivacyInfoCenter_init__block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Application did enter background, invalidating access status cache.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateAccountAccessStatus");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (notify_is_valid_token(self->_registrationToken))
    notify_cancel(self->_registrationToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[VSManagedProfileConnection sharedConnection](VSManagedProfileConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)VSPrivacyInfoCenter;
  -[VSPrivacyInfoCenter dealloc](&v5, sel_dealloc);
}

- (void)_invalidateAccountAccessStatus
{
  -[VSPrivacyInfoCenter setAccountAccessStatus:](self, "setAccountAccessStatus:", 0);
}

- (void)updateAccountAccessStatusWithResponse:(id)a3
{
  -[VSPrivacyInfoCenter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("accountAccessStatus"));
  -[VSPrivacyInfoCenter setAccountAccessStatus:](self, "setAccountAccessStatus:", 3);
  -[VSPrivacyInfoCenter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("accountAccessStatus"));
}

- (id)updateAccountAccessStatusWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (VSErrorIsPrivateError(v4, -13))
    -[VSPrivacyInfoCenter updateAccountAccessStatusWithError:].cold.1(v4);
  if (VSErrorIsPrivateError(v4, -11))
  {
    v5 = 2;
LABEL_8:
    VSPublicError(0, 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (VSErrorIsPrivateError(v4, -12))
  {
    v5 = 0;
    goto LABEL_8;
  }
  if (VSErrorIsPrivateError(v4, -23))
  {
    v5 = 1;
    goto LABEL_8;
  }
  v6 = v4;
  if (!VSErrorIsPublicError(v4, 7))
    goto LABEL_10;
  v5 = 0;
  v6 = v4;
LABEL_9:
  -[VSPrivacyInfoCenter setAccountAccessStatus:](self, "setAccountAccessStatus:", v5);
LABEL_10:

  return v6;
}

- (int64_t)accountAccessStatus
{
  return self->_accountAccessStatus;
}

- (void)setAccountAccessStatus:(int64_t)a3
{
  self->_accountAccessStatus = a3;
}

- (int)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(int)a3
{
  self->_registrationToken = a3;
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Error registering for TCC notification.", v1, 2u);
}

- (void)updateAccountAccessStatusWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog((NSString *)CFSTR("%@"), v1);

  abort();
}

@end
