@implementation ASCRebootstrapNotifier

+ (ASCRebootstrapNotifier)sharedNotifier
{
  if (sharedNotifier_onceToken != -1)
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_24);
  return (ASCRebootstrapNotifier *)(id)sharedNotifier_sharedObserver;
}

void __40__ASCRebootstrapNotifier_sharedNotifier__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ASCRebootstrapNotifier _initSingleton]([ASCRebootstrapNotifier alloc], "_initSingleton");
  v1 = (void *)sharedNotifier_sharedObserver;
  sharedNotifier_sharedObserver = (uint64_t)v0;

}

- (id)_initSingleton
{
  ASCRebootstrapNotifier *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t state;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;
  _DWORD v22[6];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)ASCRebootstrapNotifier;
  v2 = -[ASCRebootstrapNotifier init](&v21, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __40__ASCRebootstrapNotifier__initSingleton__block_invoke;
    v18 = &unk_1E7561790;
    objc_copyWeak(&v19, &location);
    v4 = notify_register_dispatch("com.apple.appstorecomponentsd.rebootstrap", &v2->_token, MEMORY[0x1E0C80D38], &v15);

    if ((_DWORD)v4)
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        ASCStringFromNotifyStatus(v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCRebootstrapNotifier _initSingleton].cold.2(v7, v22);
      }

      v2->_token = -1;
    }
    else
    {
      state = notify_get_state(v2->_token, &v2->_rebootstrapCounterSnapshot);
      if ((_DWORD)state)
      {
        v9 = MEMORY[0x1E0C81028];
        v10 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          ASCStringFromNotifyStatus(state);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCRebootstrapNotifier _initSingleton].cold.1(v11, v22);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_postLocalNotificationIfNeeded, *MEMORY[0x1E0DC4750], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_postLocalNotificationIfNeeded, *MEMORY[0x1E0CB29E8], 0);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__ASCRebootstrapNotifier__initSingleton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "postLocalNotification");

}

- (void)dealloc
{
  int token;
  objc_super v4;

  token = self->_token;
  if (token != -1)
    notify_cancel(token);
  v4.receiver = self;
  v4.super_class = (Class)ASCRebootstrapNotifier;
  -[ASCRebootstrapNotifier dealloc](&v4, sel_dealloc);
}

- (void)setRebootstrapCounterSnapshot:(unint64_t)a3
{
  if (self->_rebootstrapCounterSnapshot != a3)
  {
    self->_rebootstrapCounterSnapshot = a3;
    -[ASCRebootstrapNotifier postLocalNotification](self, "postLocalNotification");
  }
}

- (void)postLocalNotificationIfNeeded
{
  void *v1;
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ASCStringFromNotifyStatus(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 136446466;
  v4 = "-[ASCRebootstrapNotifier postLocalNotificationIfNeeded]";
  v5 = 2114;
  v6 = v1;
  OUTLINED_FUNCTION_0_4(&dword_1BCB7B000, MEMORY[0x1E0C81028], v2, "%{public}s/notify_get_state failed: %{public}@", (uint8_t *)&v3);

}

- (void)postLocalNotification
{
  void *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Daemon re-bootstrap detected", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ASCRebootstrapDidStartNotification"), self);

}

- (int)token
{
  return self->_token;
}

- (unint64_t)rebootstrapCounterSnapshot
{
  return self->_rebootstrapCounterSnapshot;
}

- (void)_initSingleton
{
  uint64_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  OUTLINED_FUNCTION_1_3((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[ASCRebootstrapNotifier _initSingleton]");
  OUTLINED_FUNCTION_0_4(&dword_1BCB7B000, MEMORY[0x1E0C81028], v3, "%{public}s/notify_register_dispatch failed: %{public}@", v4);

}

@end
