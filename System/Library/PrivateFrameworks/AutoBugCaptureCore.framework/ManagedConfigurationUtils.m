@implementation ManagedConfigurationUtils

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  int v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "effectiveBoolValueForSetting:", CFSTR("allowDiagnosticSubmission"), a4);
  symptomsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("OFF");
    if (v5 == 1)
      v7 = CFSTR("ON");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "MCProfile Settings Changed, we must check the value for allowDiagnosticSubmission. It's %@", (uint8_t *)&v8, 0xCu);
  }

  if ((v5 == 1) != -[ManagedConfigurationUtils diagnosticsAndUsageEnabled](self, "diagnosticsAndUsageEnabled"))
    -[ManagedConfigurationUtils setDiagnosticsAndUsageEnabled:](self, "setDiagnosticsAndUsageEnabled:", v5 == 1);
}

- (BOOL)diagnosticsAndUsageEnabled
{
  return self->_diagnosticsAndUsageEnabled;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

void __43__ManagedConfigurationUtils_sharedInstance__block_invoke()
{
  ManagedConfigurationUtils *v0;
  void *v1;

  v0 = objc_alloc_init(ManagedConfigurationUtils);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (ManagedConfigurationUtils)init
{
  ManagedConfigurationUtils *v2;
  void *v3;
  Class Class;
  NSObject *v5;
  void *v6;
  const char *v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ManagedConfigurationUtils;
  v2 = -[ManagedConfigurationUtils init](&v10, sel_init);
  if (v2)
  {
    v3 = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 4);
    v2->_managedConfigurationDylibHandle = v3;
    if (v3)
    {
      Class = objc_getClass("MCProfileConnection");
      sMCProfileConnectionClass = (uint64_t)Class;
      if (Class)
      {
        -[objc_class sharedConnection](Class, "sharedConnection");
        v5 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObserver:](v5, "addObserver:", v2);
        -[NSObject installedProfileIdentifiersWithFilterFlags:](v5, "installedProfileIdentifiersWithFilterFlags:", 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ManagedConfigurationUtils setInstalledVisibleProfileIdentifiers:](v2, "setInstalledVisibleProfileIdentifiers:", v6);

        -[ManagedConfigurationUtils setDiagnosticsAndUsageEnabled:](v2, "setDiagnosticsAndUsageEnabled:", -[NSObject effectiveBoolValueForSetting:](v5, "effectiveBoolValueForSetting:", CFSTR("allowDiagnosticSubmission")) == 1);
LABEL_10:

        return v2;
      }
      symptomsLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_WORD *)v9 = 0;
      v7 = "Couldn't load MCProfileConnection";
    }
    else
    {
      symptomsLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_WORD *)v9 = 0;
      v7 = "Couldn't load ManagedConfiguration framework";
    }
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, v7, v9, 2u);
    goto LABEL_10;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *managedConfigurationDylibHandle;
  objc_super v5;

  objc_msgSend((id)sMCProfileConnectionClass, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  managedConfigurationDylibHandle = self->_managedConfigurationDylibHandle;
  if (managedConfigurationDylibHandle)
    dlclose(managedConfigurationDylibHandle);
  v5.receiver = self;
  v5.super_class = (Class)ManagedConfigurationUtils;
  -[ManagedConfigurationUtils dealloc](&v5, sel_dealloc);
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "installedProfileIdentifiersWithFilterFlags:", 1, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  symptomsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Received ProfileListChangedNotification with installed visible profiles: %@", (uint8_t *)&v10, 0xCu);
  }

  -[ManagedConfigurationUtils installedVisibleProfileIdentifiers](self, "installedVisibleProfileIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToArray:", v5);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_msgSend(v5, "copy");
    -[ManagedConfigurationUtils setInstalledVisibleProfileIdentifiers:](self, "setInstalledVisibleProfileIdentifiers:", v9);

  }
}

- (void)setDiagnosticsAndUsageEnabled:(BOOL)a3
{
  self->_diagnosticsAndUsageEnabled = a3;
}

- (NSArray)installedVisibleProfileIdentifiers
{
  return self->_installedVisibleProfileIdentifiers;
}

- (void)setInstalledVisibleProfileIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_installedVisibleProfileIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedVisibleProfileIdentifiers, 0);
}

@end
