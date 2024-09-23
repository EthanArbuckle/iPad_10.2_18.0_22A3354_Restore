@implementation HFLocationSensingCoordinator

id __62__HFLocationSensingCoordinator_locationSensingAvailableFuture__block_invoke_2(uint64_t a1, void *a2)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a2, "intValue") - 3 < 2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __62__HFLocationSensingCoordinator_locationSensingAvailableFuture__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "locationDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationStatusFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flatMap:", &__block_literal_global_11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFLocationSensingCoordinator)initWithDelegate:(id)a3
{
  id v4;
  HFLocationSensingCoordinator *v5;
  HFLocationSensingCoordinator *v6;
  uint64_t v7;
  NSUserDefaults *defaults;
  NAFuture *v9;
  NAFuture *homeSensingFirstFuture;
  const char *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  HFLocationSensingCoordinator *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  HFLocationSensingCoordinator *v22;
  _QWORD handler[4];
  id v24;
  id location;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HFLocationSensingCoordinator;
  v5 = -[HFLocationSensingCoordinator init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Home.group"));
    defaults = v6->_defaults;
    v6->_defaults = (NSUserDefaults *)v7;

    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    homeSensingFirstFuture = v6->_homeSensingFirstFuture;
    v6->_homeSensingFirstFuture = v9;

    objc_initWeak(&location, v6);
    v11 = (const char *)HFHomeSensingDefaultsChangedNotification;
    v12 = MEMORY[0x1E0C80D38];
    v13 = MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__HFLocationSensingCoordinator_initWithDelegate___block_invoke;
    handler[3] = &unk_1EA727D48;
    objc_copyWeak(&v24, &location);
    notify_register_dispatch(v11, &v6->_defaultsChangedNotifyToken, v12, handler);

    objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __49__HFLocationSensingCoordinator_initWithDelegate___block_invoke_2;
    v21[3] = &unk_1EA727DD8;
    v16 = v6;
    v22 = v16;
    v17 = (id)objc_msgSend(v15, "performBlock:", v21);

    +[HFLocationManagerDispatcher sharedDispatcher](HFLocationManagerDispatcher, "sharedDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFLocationSensingCoordinator setLocationDispatcher:](v16, "setLocationDispatcher:", v18);

    -[HFLocationSensingCoordinator locationDispatcher](v16, "locationDispatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:", v16);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (HFLocationManagerDispatcher)locationDispatcher
{
  return self->_locationDispatcher;
}

- (void)setLocationDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_locationDispatcher, a3);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  int v4;
  void *v5;
  char v6;
  id v7;

  v4 = objc_msgSend(a3, "authorizationStatus");
  -[HFLocationSensingCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HFLocationSensingCoordinator delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coordinator:locationSensingAvailabilityDidChange:", self, (v4 - 3) < 2);

  }
}

- (HFLocationSensingCoordinatorDelegate)delegate
{
  return (HFLocationSensingCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __49__HFLocationSensingCoordinator_initWithDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "readHomeSensingDefault");
  HFLogForCategory(0x2AuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "disabled";
    if ((_DWORD)v2)
      v4 = "enabled";
    v7 = 136315138;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Home Sensing is %s", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "homeSensingFirstFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v6);

}

- (BOOL)readHomeSensingDefault
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[HFLocationSensingCoordinator defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HFHomeSensingEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
    self->_cachedHomeSensingValue = v5;
    v6 = 1;
  }
  else
  {
    v6 = 0;
    v5 = 1;
  }
  self->_cachedHomeSensingValueSet = v6;

  return v5;
}

- (NAFuture)locationSensingAvailableFuture
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[HFLocationSensingCoordinator homeSensingFirstFuture](self, "homeSensingFirstFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__HFLocationSensingCoordinator_locationSensingAvailableFuture__block_invoke;
  v6[3] = &unk_1EA727DB0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (NAFuture *)v4;
}

- (NAFuture)homeSensingFirstFuture
{
  return self->_homeSensingFirstFuture;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (BOOL)homeSensingEnabled
{
  return !self->_cachedHomeSensingValueSet || self->_cachedHomeSensingValue;
}

void __49__HFLocationSensingCoordinator_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_defaultsDidChange");

}

- (HFLocationSensingCoordinator)init
{
  return -[HFLocationSensingCoordinator initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[HFLocationSensingCoordinator defaultsChangedNotifyToken](self, "defaultsChangedNotifyToken"));
  v3.receiver = self;
  v3.super_class = (Class)HFLocationSensingCoordinator;
  -[HFLocationSensingCoordinator dealloc](&v3, sel_dealloc);
}

- (void)setHomeSensingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (+[HFExecutionEnvironment isHomeApp](HFExecutionEnvironment, "isHomeApp")
    || +[HFExecutionEnvironment isWatchApp](HFExecutionEnvironment, "isWatchApp"))
  {
    HFLogForCategory(0x2AuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "Disabling";
      if (v3)
        v6 = "Enabling";
      v9 = 136315138;
      v10 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s Home Sensing", (uint8_t *)&v9, 0xCu);
    }

    -[HFLocationSensingCoordinator defaults](self, "defaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBool:forKey:", v3, CFSTR("HFHomeSensingEnabled"));

    self->_cachedHomeSensingValue = v3;
    self->_cachedHomeSensingValueSet = 1;
    notify_post((const char *)HFHomeSensingDefaultsChangedNotification);
  }
  else
  {
    HFLogForCategory(0x2AuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring request to set Home Sensing pref - process is not Home", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)_defaultsDidChange
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[HFLocationSensingCoordinator readHomeSensingDefault](self, "readHomeSensingDefault");
  HFLogForCategory(0x2AuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Home Sensing preferences changed - state is now %{BOOL}d", (uint8_t *)v8, 8u);
  }

  -[HFLocationSensingCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HFLocationSensingCoordinator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coordinator:homeSensingStatusDidChange:", self, v3);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setHomeSensingFirstFuture:(id)a3
{
  objc_storeStrong((id *)&self->_homeSensingFirstFuture, a3);
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (int)defaultsChangedNotifyToken
{
  return self->_defaultsChangedNotifyToken;
}

- (void)setDefaultsChangedNotifyToken:(int)a3
{
  self->_defaultsChangedNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDispatcher, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_homeSensingFirstFuture, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
