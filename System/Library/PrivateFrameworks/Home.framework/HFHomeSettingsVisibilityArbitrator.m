@implementation HFHomeSettingsVisibilityArbitrator

- (void)_reloadVisibilityStateIncludingInstallState:(BOOL)a3
{
  int AppBooleanValue;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _BYTE location[12];
  __int16 v20;
  void *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_initWeak((id *)location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __82__HFHomeSettingsVisibilityArbitrator__reloadVisibilityStateIncludingInstallState___block_invoke;
    v17[3] = &unk_1EA728AE8;
    objc_copyWeak(&v18, (id *)location);
    -[HFHomeSettingsVisibilityArbitrator _queryHomeAppInstallStateWithCompletion:](self, "_queryHomeAppInstallStateWithCompletion:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
    return;
  }
  -[HFHomeSettingsVisibilityArbitrator setHomesConfigured:](self, "setHomesConfigured:", CFPreferencesGetAppBooleanValue(CFSTR("kHomesConfigured"), CFSTR("com.apple.homed"), 0) != 0);
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("kIncomingInvitesPresent"), CFSTR("com.apple.homed"), 0);
  v6 = CFPreferencesGetAppBooleanValue(CFSTR("kDisplayResetButton"), CFSTR("com.apple.HomeSettings"), 0);
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138413314;
    *(_QWORD *)&location[4] = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 1024;
    v23 = -[HFHomeSettingsVisibilityArbitrator homesConfigured](self, "homesConfigured");
    v24 = 1024;
    v25 = AppBooleanValue != 0;
    v26 = 1024;
    v27 = v6 != 0;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ homesConfigured: %{BOOL}d invitesExist: %{BOOL}d displayResetButton: %{BOOL}d", location, 0x28u);

  }
  if (!v6)
  {
    v11 = -[HFHomeSettingsVisibilityArbitrator homeAppInstallState](self, "homeAppInstallState") == 2;
    v12 = -[HFHomeSettingsVisibilityArbitrator homesConfigured](self, "homesConfigured");
    if (v11)
    {
      if (AppBooleanValue)
        v13 = 1;
      else
        v13 = v12;
      if (v13 != 1)
      {
        v10 = 2;
        goto LABEL_22;
      }
      objc_msgSend((id)objc_opt_class(), "homeManagerConfigurationWithExpandedOptions:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateHomeManagerConfiguration:", v14);

      v10 = 1;
    }
    else
    {
      if (!v12)
      {
        v10 = 0;
        goto LABEL_22;
      }
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "homeManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (objc_msgSend(v14, "isThisDeviceResidentCapable"))
          v10 = 1;
        else
          v10 = 2;
      }
      else
      {
        v10 = 0;
      }
    }

    goto LABEL_22;
  }
  v10 = 1;
LABEL_22:
  -[HFHomeSettingsVisibilityArbitrator setVisibilityState:](self, "setVisibilityState:", v10);
}

- (BOOL)homesConfigured
{
  return self->_homesConfigured;
}

void __83__HFHomeSettingsVisibilityArbitrator__startListeningForManagedConfigurationChanges__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  dispatch_get_global_queue(17, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", (int *)&_startListeningForManagedConfigurationChanges_token, v2, *(notify_handler_t *)(a1 + 32));

}

uint64_t __78__HFHomeSettingsVisibilityArbitrator__queryHomeAppInstallStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    v2 = 1;
  else
    v2 = 2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setHomeAppInstallState:", v2);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __78__HFHomeSettingsVisibilityArbitrator__queryHomeAppInstallStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.Home"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstalled");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HFHomeSettingsVisibilityArbitrator__queryHomeAppInstallStateWithCompletion___block_invoke_2;
  block[3] = &unk_1EA73CA00;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v8 = v4;
  v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
}

void __42__HFHomeSettingsVisibilityArbitrator_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadVisibilityStateIncludingInstallState:", 0);

}

- (unint64_t)visibilityState
{
  return self->_visibilityState;
}

- (void)setVisibilityStateChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setVisibilityState:(unint64_t)a3
{
  void *v5;
  void (**v6)(id, unint64_t);

  if (self->_visibilityState != a3)
  {
    self->_visibilityState = a3;
    -[HFHomeSettingsVisibilityArbitrator visibilityStateChangeHandler](self, "visibilityStateChangeHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HFHomeSettingsVisibilityArbitrator visibilityStateChangeHandler](self, "visibilityStateChangeHandler");
      v6 = (void (**)(id, unint64_t))objc_claimAutoreleasedReturnValue();
      v6[2](v6, a3);

    }
  }
}

- (void)setHomesConfigured:(BOOL)a3
{
  self->_homesConfigured = a3;
}

- (void)setHomeAppInstallState:(unint64_t)a3
{
  self->_homeAppInstallState = a3;
}

- (HFHomeSettingsVisibilityArbitrator)init
{
  HFHomeSettingsVisibilityArbitrator *v2;
  HFHomeSettingsVisibilityArbitrator *v3;
  void *v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD handler[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HFHomeSettingsVisibilityArbitrator;
  v2 = -[HFHomeSettingsVisibilityArbitrator init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_visibilityState = 0;
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", v3);

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHomeManagerObserver:", v3);

    objc_initWeak(&location, v3);
    v6 = (const char *)*MEMORY[0x1E0CB9060];
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __42__HFHomeSettingsVisibilityArbitrator_init__block_invoke;
    handler[3] = &unk_1EA727D48;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v6, &v3->_homeKitPreferencesChangeNotifyToken, v7, handler);

    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __42__HFHomeSettingsVisibilityArbitrator_init__block_invoke_2;
    v11[3] = &unk_1EA728AE8;
    objc_copyWeak(&v12, &location);
    -[HFHomeSettingsVisibilityArbitrator _queryHomeAppInstallStateWithCompletion:](v3, "_queryHomeAppInstallStateWithCompletion:", v11);
    -[HFHomeSettingsVisibilityArbitrator _startListeningForManagedConfigurationChanges](v3, "_startListeningForManagedConfigurationChanges");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (unint64_t)homeAppInstallState
{
  return self->_homeAppInstallState;
}

- (void)_startListeningForManagedConfigurationChanges
{
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HFHomeSettingsVisibilityArbitrator__startListeningForManagedConfigurationChanges__block_invoke_2;
  block[3] = &unk_1EA73AD88;
  v3 = &__block_literal_global_191;
  if (_startListeningForManagedConfigurationChanges_once == -1)
  {

  }
  else
  {
    dispatch_once(&_startListeningForManagedConfigurationChanges_once, block);

  }
}

- (void)_queryHomeAppInstallStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HFHomeSettingsVisibilityArbitrator__queryHomeAppInstallStateWithCompletion___block_invoke;
  block[3] = &unk_1EA730E40;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (void)initialize
{
  id v2;

  objc_msgSend(a1, "homeManagerConfigurationWithExpandedOptions:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher setConfiguration:](HFHomeKitDispatcher, "setConfiguration:", v2);

}

+ (id)homeManagerConfigurationWithExpandedOptions:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  if (a3)
    v3 = 4075;
  else
    v3 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA6C8]), "initWithOptions:cachePolicy:", v3, 1);
  objc_msgSend(v4, "setDiscretionary:", 1);
  objc_msgSend(v4, "setAdaptive:", 1);
  return v4;
}

void __42__HFHomeSettingsVisibilityArbitrator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadVisibilityStateIncludingInstallState:", 0);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[HFHomeSettingsVisibilityArbitrator homeKitPreferencesChangeNotifyToken](self, "homeKitPreferencesChangeNotifyToken"));
  v3.receiver = self;
  v3.super_class = (Class)HFHomeSettingsVisibilityArbitrator;
  -[HFHomeSettingsVisibilityArbitrator dealloc](&v3, sel_dealloc);
}

- (void)reloadVisibilityState
{
  -[HFHomeSettingsVisibilityArbitrator _reloadVisibilityStateIncludingInstallState:](self, "_reloadVisibilityStateIncludingInstallState:", 1);
}

void __82__HFHomeSettingsVisibilityArbitrator__reloadVisibilityStateIncludingInstallState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadVisibilityStateIncludingInstallState:", 0);

}

uint64_t __83__HFHomeSettingsVisibilityArbitrator__startListeningForManagedConfigurationChanges__block_invoke()
{
  return CFPreferencesSynchronize(CFSTR("com.apple.HomeSettings"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HFHomeSettingsVisibilityArbitrator *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__HFHomeSettingsVisibilityArbitrator_applicationsDidUninstall___block_invoke;
  v6[3] = &unk_1EA727188;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __63__HFHomeSettingsVisibilityArbitrator_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectPassingTest:", &__block_literal_global_20_7);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "setHomeAppInstallState:", 2);
    return objc_msgSend(*(id *)(a1 + 40), "_reloadVisibilityStateIncludingInstallState:", 0);
  }
  return result;
}

uint64_t __63__HFHomeSettingsVisibilityArbitrator_applicationsDidUninstall___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "applicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Home"));

  return v3;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HFHomeSettingsVisibilityArbitrator *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HFHomeSettingsVisibilityArbitrator_applicationsDidInstall___block_invoke;
  v6[3] = &unk_1EA727188;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __61__HFHomeSettingsVisibilityArbitrator_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectPassingTest:", &__block_literal_global_21_12);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "setHomeAppInstallState:", 1);
    return objc_msgSend(*(id *)(a1 + 40), "_reloadVisibilityStateIncludingInstallState:", 0);
  }
  return result;
}

uint64_t __61__HFHomeSettingsVisibilityArbitrator_applicationsDidInstall___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "applicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Home"));

  return v3;
}

- (void)homeManager:(id)a3 didUpdateThisDeviceIsResidentCapable:(BOOL)a4
{
  -[HFHomeSettingsVisibilityArbitrator _reloadVisibilityStateIncludingInstallState:](self, "_reloadVisibilityStateIncludingInstallState:", 0, a4);
}

- (id)visibilityStateChangeHandler
{
  return self->_visibilityStateChangeHandler;
}

- (int)homeKitPreferencesChangeNotifyToken
{
  return self->_homeKitPreferencesChangeNotifyToken;
}

- (void)setHomeKitPreferencesChangeNotifyToken:(int)a3
{
  self->_homeKitPreferencesChangeNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_visibilityStateChangeHandler, 0);
}

@end
