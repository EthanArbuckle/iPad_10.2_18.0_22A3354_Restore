@implementation NRConnectivitySubscriber

void __32__NRConnectivitySubscriber_init__block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (notify_register_check("com.apple.nanoregistry.dropoutcounter", &notifyHandle))
  {
    nr_framework_log();
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);

    if (v1)
    {
      nr_framework_log();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = 136315138;
        v4 = "com.apple.nanoregistry.dropoutcounter";
        _os_log_impl(&dword_1A0BDB000, v2, OS_LOG_TYPE_DEFAULT, "Failed to register block and get notify token for %s", (uint8_t *)&v3, 0xCu);
      }

    }
  }
}

+ (BOOL)getDropoutCounter:(unint64_t *)a3
{
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  v4 = objc_opt_new();
  if (a3)
  {
    if (v4)
      v5 = *(_QWORD *)(v4 + 16);
    else
      v5 = 0;
    *a3 = v5;
  }
  if (v4)
    v6 = *(_BYTE *)(v4 + 8) == 0;
  else
    v6 = 1;

  return v6;
}

- (NRConnectivitySubscriber)init
{
  NRConnectivitySubscriber *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  objc_super v10;
  uint64_t state64;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NRConnectivitySubscriber;
  v2 = -[NRConnectivitySubscriber init](&v10, sel_init);
  if (v2)
  {
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_16);
    if (notifyHandle != -1)
    {
      state64 = 0;
      if (notify_get_state(notifyHandle, &state64))
      {
        nr_framework_log();
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

        if (v4)
        {
          nr_framework_log();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            v6 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v13 = v6;
            v7 = v6;
            _os_log_impl(&dword_1A0BDB000, v5, OS_LOG_TYPE_DEFAULT, "Failed to read notify token in %@", buf, 0xCu);

          }
        }
      }
      else
      {
        v8 = state64;
        v2->_connected = (state64 & 0x8000000000000000) == 0;
        v2->_dropoutCounter = v8 & 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return v2;
}

@end
