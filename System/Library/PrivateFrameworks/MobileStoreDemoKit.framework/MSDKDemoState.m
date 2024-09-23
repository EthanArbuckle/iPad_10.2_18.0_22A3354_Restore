@implementation MSDKDemoState

- (BOOL)_isStoreDemoModeEnabled:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel__isStoreDemoModeEnabled_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKDemoState cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  if (v4)
  {
    -[MSDKDemoState cache](self, "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MSDKDemoState cache](self, "cache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend(v9, "BOOLValue");

      objc_sync_exit(v5);
      goto LABEL_12;
    }
  }
  objc_sync_exit(v5);

  if (geteuid())
  {
    LODWORD(v10) = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0) != 0;
    if (!v4)
      goto LABEL_12;
    goto LABEL_10;
  }
  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[MSDKDemoState _isStoreDemoModeEnabled:]";
    _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "%s - Caller is in root user session, making call to MobileGestalt", (uint8_t *)&v15, 0xCu);
  }

  LODWORD(v10) = MGGetBoolAnswer();
  if (v4)
  {
LABEL_10:
    if ((_DWORD)v10)
    {
      -[MSDKDemoState cache](self, "cache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v12);
      -[MSDKDemoState cache](self, "cache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v10, v4);

      objc_sync_exit(v12);
      LOBYTE(v10) = 1;
    }
  }
LABEL_12:

  return (char)v10;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_6);
  return (id)sharedInstance_sharedInstance_1;
}

void __31__MSDKDemoState_sharedInstance__block_invoke()
{
  MSDKDemoState *v0;
  void *v1;

  v0 = objc_alloc_init(MSDKDemoState);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (MSDKDemoState)init
{
  MSDKDemoState *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  MSDKDemoState *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)MSDKDemoState;
  v2 = -[MSDKDemoState init](&v10, sel_init);
  if (v2)
  {
    defaultLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A7E000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_213AB433A, buf, 2u);
    }

    defaultLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_213A7E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ started to use MobileStoreDemoKit/MSDKDemoState.", buf, 0xCu);

    }
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[MSDKDemoState setCache:](v2, "setCache:", v7);

    v8 = v2;
  }

  return v2;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (BOOL)isStoreDemoModeEnabled
{
  return -[MSDKDemoState _isStoreDemoModeEnabled:](self, "_isStoreDemoModeEnabled:", 0);
}

- (BOOL)isDeviceEnrolledWithDeKOTA
{
  return -[MSDKDemoState _isDeviceEnrolledWithDeKOTA:](self, "_isDeviceEnrolledWithDeKOTA:", 0);
}

- (BOOL)_isPressDemoModeEnabled:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int AppBooleanValue;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  NSStringFromSelector(sel__isPressDemoModeEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKDemoState cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  if (v4
    && (-[MSDKDemoState cache](self, "cache"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKey:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[MSDKDemoState cache](self, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    if (geteuid())
    {
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PressDemoMode"), CFSTR("com.apple.demo-settings"), 0);
      v10 = AppBooleanValue != 0;
      if (v4 && AppBooleanValue)
      {
        -[MSDKDemoState cache](self, "cache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v12);
        -[MSDKDemoState cache](self, "cache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v14, v4);

        objc_sync_exit(v12);
        v10 = 1;
      }
    }
    else
    {
      defaultLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MSDKDemoState _isPressDemoModeEnabled:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)_isPressDemoModeEnabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PressDemoMode"));

  return v3;
}

- (BOOL)_isMuseBuddyDemoModeEnabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.musebuddy"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DemoMode"));

  return v3;
}

- (BOOL)_isDeviceEnrolledWithDeKOTA:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  char v13;

  NSStringFromSelector(sel_isDeviceEnrolledWithDeKOTA);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKDemoState cache](self, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  if (v5)
  {
    -[MSDKDemoState cache](self, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[MSDKDemoState cache](self, "cache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend(v10, "BOOLValue");
LABEL_11:

      objc_sync_exit(v6);
      goto LABEL_12;
    }
  }
  objc_sync_exit(v6);

  if (os_variant_has_internal_content()
    && (+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "fakeActivationDemoBit"),
        v12,
        (v13 & 1) != 0))
  {
    v11 = 1;
    if (!v5)
      goto LABEL_12;
  }
  else
  {
    v11 = (-[MSDKDemoState _activationConfigurationFlags:](self, "_activationConfigurationFlags:", a3) >> 1) & 1;
    if (!v5)
      goto LABEL_12;
  }
  if (v11)
  {
    -[MSDKDemoState cache](self, "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v6);
    -[MSDKDemoState cache](self, "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v5);
    LOBYTE(v11) = 1;
    goto LABEL_11;
  }
LABEL_12:

  return v11;
}

- (int)_activationConfigurationFlags:(id *)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (os_variant_has_internal_content())
  {
    +[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "deviceActivationFlag");

    if ((v5 & 0x8000000000000000) == 0)
    {
      defaultLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[MSDKDemoState _activationConfigurationFlags:]";
        v26 = 2048;
        v27 = v5;
        _os_log_impl(&dword_213A7E000, v6, OS_LOG_TYPE_DEFAULT, "%s - Using device activation flag: %ld for internal testing", buf, 0x16u);
      }

      return v5;
    }
  }
  v23 = 0;
  MEMORY[0x2199BB794](&v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  if (v8)
  {
    v12 = v8;
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDKDemoState _activationConfigurationFlags:].cold.2(v12, v13);

    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v12, "localizedDescription");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorDomainMSDWithCode:message:reason:", 3727741187, CFSTR("Failed to retrieve activation record."), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if (!v7)
  {
    v22 = 0;
    safeAssignError(&v22, 3727741187, (uint64_t)CFSTR("Failed to retrieve activation record."));
    v10 = v22;
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDKDemoState _activationConfigurationFlags:].cold.1(v9, v15, v16, v17, v18, v19, v20, v21);
LABEL_18:
    LODWORD(v5) = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags"));
  v9 = objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[NSObject intValue](v9, "intValue");
  v10 = 0;
LABEL_9:

  if (a3)
    *a3 = objc_retainAutorelease(v10);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)_isPressDemoModeEnabled:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Caller is in root user session, erroring out!", a5, a6, a7, a8, 2u);
}

- (void)_activationConfigurationFlags:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Activation record is NULL", a5, a6, a7, a8, 2u);
}

- (void)_activationConfigurationFlags:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[MSDKDemoState _activationConfigurationFlags:]";
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_213A7E000, a2, OS_LOG_TYPE_ERROR, "%s - Could not get activation record with error - %{public}@", (uint8_t *)&v4, 0x16u);

}

@end
