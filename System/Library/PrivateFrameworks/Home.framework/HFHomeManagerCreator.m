@implementation HFHomeManagerCreator

- (HFHomeManagerCreator)initWithHostProcess:(int64_t)a3 configuration:(id)a4 homeStatus:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  HFHomeManagerCreator *v13;
  HFHomeManagerCreator *v14;
  HMHomeManagerConfiguration *v15;
  HMHomeManagerConfiguration *configuration;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HFHomeManagerCreator;
  v13 = -[HFHomeManagerCreator init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_hostProcessType = a3;
    objc_storeStrong((id *)&v13->_homeStatus, a5);
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_creationPolicy = -[HFHomeManagerCreator _homeManagerCreationPolicy](v14, "_homeManagerCreationPolicy");
    if (v10)
    {
      v15 = (HMHomeManagerConfiguration *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CBA558], "defaultPrivateConfiguration");
      v15 = (HMHomeManagerConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    configuration = v14->_configuration;
    v14->_configuration = v15;

  }
  return v14;
}

- (unint64_t)_homeManagerCreationPolicy
{
  unint64_t v2;
  unint64_t v3;
  NSObject *v4;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = -[HFHomeManagerCreator hostProcessType](self, "hostProcessType") - 100;
  if (v2 > 2)
    v3 = 0;
  else
    v3 = qword_1DD669958[v2];
  HFLogForCategory(0x24uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HMHomeManager creation policy: %lu", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)_createHomeManager
{
  id v4;
  void *v5;
  void *v6;

  if (-[HFHomeManagerCreator hostProcessType](self, "hostProcessType") == 100
    || -[HFHomeManagerCreator hostProcessType](self, "hostProcessType") == 101)
  {
    -[HFHomeManagerCreator _createHomeManagerOnQueue](self, "_createHomeManagerOnQueue");
    return 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CBA550]);
    -[HFHomeManagerCreator configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithHomeMangerConfiguration:", v5);

    return v6;
  }
}

- (int64_t)hostProcessType
{
  return self->_hostProcessType;
}

- (HMHomeManagerConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)_shouldCreateHomeManager
{
  unint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  int v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest")
    || objc_msgSend((id)objc_opt_class(), "allowCreationInTest"))
  {
    v3 = -[HFHomeManagerCreator creationPolicy](self, "creationPolicy");
    if (v3 == 1)
    {
      -[HFHomeManagerCreator homeStatus](self, "homeStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "areAnyAccessoriesConfigured");

      HFLogForCategory(0x24uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        return v5;
      }
      v10 = 67109120;
      v11 = v5;
      v7 = "areAnyAccessoriesConfigured: %d";
    }
    else
    {
      if (v3 != 2)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      -[HFHomeManagerCreator homeStatus](self, "homeStatus");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "areHomesConfigured");

      HFLogForCategory(0x24uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v10 = 67109120;
      v11 = v5;
      v7 = "areAnyHomesConfigured: %d";
    }
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 8u);
    goto LABEL_11;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (unint64_t)creationPolicy
{
  return self->_creationPolicy;
}

- (id)createHomeManagerIfNeeded
{
  void *v3;

  if (-[HFHomeManagerCreator _shouldCreateHomeManager](self, "_shouldCreateHomeManager"))
  {
    -[HFHomeManagerCreator _createHomeManager](self, "_createHomeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (HFHomeConfigurationStatus)homeStatus
{
  return self->_homeStatus;
}

+ (BOOL)allowCreationInTest
{
  return __allowCreationInTest;
}

+ (void)setAllowCreationInTest:(BOOL)a3
{
  __allowCreationInTest = a3;
}

- (HFHomeManagerCreator)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHostProcess_configuration_homeStatus_delegate_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomeManagerCreator.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFHomeManagerCreator init]",
    v5);

  return 0;
}

- (void)_createHomeManagerOnQueue
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__HFHomeManagerCreator__createHomeManagerOnQueue__block_invoke;
  v3[3] = &unk_1EA728AE8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__HFHomeManagerCreator__createHomeManagerOnQueue__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_alloc(MEMORY[0x1E0CBA550]);
  objc_msgSend(WeakRetained, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithHomeMangerConfiguration:", v2);

  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManagerWasCreated:", v3);

}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setHostProcessType:(int64_t)a3
{
  self->_hostProcessType = a3;
}

- (void)setCreationPolicy:(unint64_t)a3
{
  self->_creationPolicy = a3;
}

- (void)setHomeStatus:(id)a3
{
  objc_storeStrong((id *)&self->_homeStatus, a3);
}

- (HFHomeManagerCreatorDelegate)delegate
{
  return (HFHomeManagerCreatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeStatus, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
