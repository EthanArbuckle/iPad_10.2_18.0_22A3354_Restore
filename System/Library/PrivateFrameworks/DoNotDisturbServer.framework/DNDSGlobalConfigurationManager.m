@implementation DNDSGlobalConfigurationManager

- (DNDSGlobalConfigurationManager)initWithBackingStore:(id)a3
{
  id v5;
  DNDSGlobalConfigurationManager *v6;
  DNDSGlobalConfigurationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSGlobalConfigurationManager;
  v6 = -[DNDSGlobalConfigurationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingStore, a3);
    -[DNDSGlobalConfigurationStoring setDelegate:](v7->_backingStore, "setDelegate:", v7);
    DNDSRegisterSysdiagnoseDataProvider(v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSGlobalConfigurationManager;
  -[DNDSGlobalConfigurationManager dealloc](&v3, sel_dealloc);
}

- (id)getConfigurationReturningError:(id *)a3
{
  DNDSMutableGlobalConfiguration *v3;
  void *v4;

  -[DNDSGlobalConfigurationStoring readRecordWithError:](self->_backingStore, "readRecordWithError:", a3);
  v3 = (DNDSMutableGlobalConfiguration *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(DNDSMutableGlobalConfiguration);
    -[DNDSMutableGlobalConfiguration setAutomaticallyGenerated:](v3, "setAutomaticallyGenerated:", 1);
  }
  v4 = (void *)-[DNDSMutableGlobalConfiguration copy](v3, "copy");

  return v4;
}

- (BOOL)setConfiguration:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v23;

  v6 = a3;
  -[DNDSGlobalConfigurationStoring readRecordWithError:](self->_backingStore, "readRecordWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DNDSGlobalConfigurationManager _writeConfiguration:error:](self, "_writeConfiguration:error:", v6, a4);
  if (v8 != 2)
  {
    v9 = v8 == 1;
    goto LABEL_18;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_msgSend(v7, "preventAutoReply");
  if (v11 != objc_msgSend(v6, "preventAutoReply"))
    objc_msgSend(WeakRetained, "globalConfigurationManager:didUpdatePreventAutoReplySetting:", self, DNDResolvedPreventAutoReplySetting(objc_msgSend(v6, "preventAutoReply")) == 2);
  objc_msgSend(v7, "bypassSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bypassSettings");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 != (void *)v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v7, "bypassSettings");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v6, "bypassSettings");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(v7, "bypassSettings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bypassSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v19, "isEqual:", v20);

        if ((v23 & 1) != 0)
          goto LABEL_15;
        goto LABEL_13;
      }

    }
LABEL_13:
    objc_msgSend(v6, "bypassSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "globalConfigurationManager:didUpdatePhoneCallBypassSettings:", self, v12);
    goto LABEL_14;
  }

LABEL_14:
LABEL_15:
  v21 = objc_msgSend(v7, "modesCanImpactAvailability");
  if (v21 != objc_msgSend(v6, "modesCanImpactAvailability"))
    objc_msgSend(WeakRetained, "globalConfigurationManager:didUpdateModesCanImpactAvailabilitySetting:", self, DNDResolvedModesCanImpactAvailabilitySetting(objc_msgSend(v6, "modesCanImpactAvailability")) == 2);

  v9 = 1;
LABEL_18:

  return v9;
}

- (BOOL)getPreventAutoReplyReturningError:(id *)a3
{
  void *v3;
  BOOL v4;

  -[DNDSGlobalConfigurationStoring readRecordWithError:](self->_backingStore, "readRecordWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = DNDResolvedPreventAutoReplySetting(objc_msgSend(v3, "preventAutoReply")) == 2;

  return v4;
}

- (BOOL)setPreventAutoReply:(BOOL)a3 withError:(id *)a4
{
  _BOOL4 v5;
  NSObject *v7;
  const char *v8;
  DNDSGlobalConfigurationStoring *backingStore;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "allow";
    if (v5)
      v8 = "prevent";
    *(_DWORD *)buf = 136315138;
    v25 = v8;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Setting auto reply to %s", buf, 0xCu);
  }
  backingStore = self->_backingStore;
  v23 = 0;
  -[DNDSGlobalConfigurationStoring readRecordWithError:](backingStore, "readRecordWithError:", &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  v12 = (void *)objc_msgSend(v10, "mutableCopy");

  v13 = v11 == 0;
  if (v11)
  {
    v14 = DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationManager setPreventAutoReply:withError:].cold.1((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    if (v5)
      v21 = 2;
    else
      v21 = 1;
    if (objc_msgSend(v12, "preventAutoReply") != v21)
    {
      objc_msgSend(v12, "setPreventAutoReply:", v21);
      v13 = -[DNDSGlobalConfigurationManager setConfiguration:withError:](self, "setConfiguration:withError:", v12, a4);
      goto LABEL_15;
    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);
LABEL_15:

  return v13;
}

- (BOOL)getModesCanImpactAvailabilityReturningError:(id *)a3
{
  void *v3;
  BOOL v4;

  -[DNDSGlobalConfigurationStoring readRecordWithError:](self->_backingStore, "readRecordWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = DNDResolvedModesCanImpactAvailabilitySetting(objc_msgSend(v3, "modesCanImpactAvailability")) == 2;

  return v4;
}

- (BOOL)setModesCanImpactAvailability:(BOOL)a3 withError:(id *)a4
{
  _BOOL4 v5;
  NSObject *v7;
  const char *v8;
  DNDSGlobalConfigurationStoring *backingStore;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    if (v5)
      v8 = "YES";
    *(_DWORD *)buf = 136315138;
    v25 = v8;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Setting global availability preference to %s", buf, 0xCu);
  }
  backingStore = self->_backingStore;
  v23 = 0;
  -[DNDSGlobalConfigurationStoring readRecordWithError:](backingStore, "readRecordWithError:", &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  v12 = (void *)objc_msgSend(v10, "mutableCopy");

  v13 = v11 == 0;
  if (v11)
  {
    v14 = DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationManager setModesCanImpactAvailability:withError:].cold.1((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    if (v5)
      v21 = 2;
    else
      v21 = 1;
    if (objc_msgSend(v12, "modesCanImpactAvailability") != v21)
    {
      objc_msgSend(v12, "setModesCanImpactAvailability:", v21);
      v13 = -[DNDSGlobalConfigurationManager setConfiguration:withError:](self, "setConfiguration:withError:", v12, a4);
      goto LABEL_15;
    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);
LABEL_15:

  return v13;
}

- (id)fallbackConfiguration
{
  return (id)objc_msgSend(MEMORY[0x1E0D1D6E0], "defaultConfiguration");
}

- (void)globalConfigurationStore:(id)a3 didUpdatePreventAutoReplySetting:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "globalConfigurationManager:didUpdatePreventAutoReplySetting:", self, v4);

}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  return a4;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.GlobalConfigurationManager");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  void *v4;
  DNDSBackingStoreDictionaryContext *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[DNDSGlobalConfigurationStoring readRecordWithError:](self->_backingStore, "readRecordWithError:", 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, 0, 0);
  objc_msgSend(v4, "dictionaryRepresentationWithContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("globalConfiguration");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_writeConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  DNDSGlobalConfigurationStoring *backingStore;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  backingStore = self->_backingStore;
  v17 = 0;
  v8 = -[DNDSGlobalConfigurationStoring writeRecord:error:](backingStore, "writeRecord:error:", v6, &v17);
  v9 = v17;
  v10 = v9;
  if (v8)
  {
    if (v8 == 1)
    {
      v15 = DNDSLogGlobalConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v10;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Failed to save configuration, but error can be ignored; error=%{public}@",
          buf,
          0xCu);
      }
    }
    else if (v8 == 2)
    {
      v11 = DNDSLogGlobalConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v6;
        _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Saved configuration; configuration=%{public}@",
          buf,
          0xCu);
      }
      v12 = 2;
      goto LABEL_20;
    }
    v12 = 1;
    goto LABEL_20;
  }
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasUnlockedSinceBoot");

  if (v14)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationManager _writeConfiguration:error:].cold.1();
    _DNDSRequestRadar(CFSTR("Error saving configuration"), v10, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSGlobalConfigurationManager.m"), 225);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
  {
    -[DNDSGlobalConfigurationManager _writeConfiguration:error:].cold.2();
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (DNDSGlobalConfigurationManagerDelegate)delegate
{
  return (DNDSGlobalConfigurationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)setPreventAutoReply:(uint64_t)a3 withError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Error reading auto reply state: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setModesCanImpactAvailability:(uint64_t)a3 withError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Error reading global availability state: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_writeConfiguration:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "Failed to save configuration, will request a radar; configuration=%{public}@, error=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_writeConfiguration:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "Failed to save configuration but device is under first lock; configuration=%{public}@, error=%{public}@");
  OUTLINED_FUNCTION_1();
}

@end
