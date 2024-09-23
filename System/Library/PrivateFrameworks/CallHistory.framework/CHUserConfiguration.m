@implementation CHUserConfiguration

+ (id)registeredDefaults
{
  if (registeredDefaults_onceToken != -1)
    dispatch_once(&registeredDefaults_onceToken, &__block_literal_global_2);
  return (id)registeredDefaults_sRegisteredDefaults;
}

void __41__CHUserConfiguration_registeredDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("cloudKitEnabled");
  v3[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)registeredDefaults_sRegisteredDefaults;
  registeredDefaults_sRegisteredDefaults = v0;

}

+ (id)userDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CHUserConfiguration_userDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userDefaults_onceToken_0 != -1)
    dispatch_once(&userDefaults_onceToken_0, block);
  return (id)userDefaults_sUserDefaults_0;
}

void __35__CHUserConfiguration_userDefaults__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CallHistory"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CallHistory"));
  }
  v6 = (void *)userDefaults_sUserDefaults_0;
  userDefaults_sUserDefaults_0 = v5;

  v7 = (void *)userDefaults_sUserDefaults_0;
  objc_msgSend(*(id *)(a1 + 32), "registeredDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerDefaults:", v8);

}

- (CHUserConfiguration)init
{
  void *v3;
  CHUserConfiguration *v4;
  objc_super v6;

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("cloudKitEnabled"), 0, &CHUserConfigurationKeyValueObserverContext);
  v6.receiver = self;
  v6.super_class = (Class)CHUserConfiguration;
  v4 = -[CHConfiguration initWithDataSource:](&v6, sel_initWithDataSource_, v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CHConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("cloudKitEnabled"), &CHUserConfigurationKeyValueObserverContext);

  v4.receiver = self;
  v4.super_class = (Class)CHUserConfiguration;
  -[CHUserConfiguration dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  ch_framework_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_DEFAULT, "Received a key-value observing notification for key path (%{public}@) object (%{public}@).", buf, 0x16u);
  }

  if (a6 == &CHUserConfigurationKeyValueObserverContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[CHUserConfiguration propertyNameForKeyPath:](self, "propertyNameForKeyPath:", v9))
      {
        -[CHConfiguration delegateController](self, "delegateController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __70__CHUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v13[3] = &unk_1E6746548;
        v13[4] = self;
        objc_msgSend(v12, "enumerateDelegatesUsingBlock:", v13);

      }
    }
  }

}

void __70__CHUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__CHUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v9[3] = &unk_1E6746520;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    dispatch_async(v6, v9);

  }
}

uint64_t __70__CHUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "propertiesDidChangeForConfiguration:", *(_QWORD *)(a1 + 40));
}

- (BOOL)propertyNameForKeyPath:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("cloudKitEnabled"));
}

@end
