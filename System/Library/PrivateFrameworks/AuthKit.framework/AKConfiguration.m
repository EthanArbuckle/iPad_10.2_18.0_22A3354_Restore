@implementation AKConfiguration

uint64_t __44__AKConfiguration_configurationValueForKey___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

void __44__AKConfiguration_configurationValueForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)configurationValueForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *settingsQueue;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__4;
    v34 = __Block_byref_object_dispose__4;
    v35 = 0;
    settingsQueue = self->_settingsQueue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__AKConfiguration_configurationValueForKey___block_invoke;
    block[3] = &unk_1E2E5EFE0;
    v29 = &v30;
    block[4] = self;
    v8 = v4;
    v28 = v8;
    dispatch_sync(settingsQueue, block);
    v9 = (void *)v31[5];
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v20 = self->_settingsQueue;
        v24[0] = v7;
        v24[1] = 3221225472;
        v24[2] = __44__AKConfiguration_configurationValueForKey___block_invoke_2;
        v24[3] = &unk_1E2E5FDA0;
        v24[4] = self;
        v25 = v8;
        v21 = v10;
        v26 = v21;
        dispatch_barrier_async(v20, v24);
        v22 = v21;

      }
    }

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKConfiguration configurationValueForKey:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }

  return v10;
}

- (int64_t)shouldAllowTestApplication
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKAddTestApplicationHeader"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_15);
  return (id)sharedConfiguration_sharedConfiguration;
}

- (unint64_t)lastKnownIDMSEnvironment
{
  void *v2;
  unint64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKLastIDMSEnvironment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

void __38__AKConfiguration_sharedConfiguration__block_invoke()
{
  AKConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(AKConfiguration);
  v1 = (void *)sharedConfiguration_sharedConfiguration;
  sharedConfiguration_sharedConfiguration = (uint64_t)v0;

}

- (AKConfiguration)init
{
  AKConfiguration *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *settingsQueue;
  NSObject *v6;
  _QWORD handler[4];
  AKConfiguration *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AKConfiguration;
  v2 = -[AKConfiguration init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.authkit.config", v3);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_settingsQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __23__AKConfiguration_init__block_invoke;
    handler[3] = &unk_1E2E5FD78;
    v9 = v2;
    notify_register_dispatch("AKConfigurationDidChangeNotification", &v2->_notificationToken, v6, handler);

  }
  return v2;
}

- (int64_t)shouldEnableTelemetryOptIn
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int64_t v7;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (!v4)
    return -1;
  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKTelemetryOptIn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue");
  else
    v7 = 1;

  return v7;
}

- (int64_t)forceSOSNeeded
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKShouldForceSOSNeeded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)forceHasSOSActiveDevice
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKShouldForceHasSOSActiveDevice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

uint64_t __23__AKConfiguration_init__block_invoke(uint64_t a1)
{
  NSObject *v2;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __23__AKConfiguration_init__block_invoke_cold_1(v2);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

- (void)dealloc
{
  int notificationToken;
  objc_super v4;

  notificationToken = self->_notificationToken;
  if (notificationToken)
    notify_cancel(notificationToken);
  v4.receiver = self;
  v4.super_class = (Class)AKConfiguration;
  -[AKConfiguration dealloc](&v4, sel_dealloc);
}

- (void)setConfigurationValue:(id)a3 forKey:(id)a4
{
  const __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a4)
  {
    v4 = (const __CFString *)*MEMORY[0x1E0C9B228];
    CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)*MEMORY[0x1E0C9B228]);
    CFPreferencesSynchronize(v4, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    notify_post("AKConfigurationDidChangeNotification");
  }
  else
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AKConfiguration configurationValueForKey:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (int64_t)overrideForKey:(id)a3
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 >= 1)
    v5 = 1;
  else
    v5 = v4;
  if (v5 < 0)
    return -1;
  else
    return v5;
}

- (void)setOverride:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v8, v7);

}

- (int64_t)shouldFakeAuthSuccess
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKFakeAuthSuccess"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldFakeAuthSuccess:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKFakeAuthSuccess"));

}

- (int64_t)shouldDisablePiggybacking
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKDisablePiggy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldDisablePiggybacking:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKDisablePiggy"));

}

- (int64_t)shouldSuppressHSA2Suggestions
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKSuppressHSA2Suggestions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldSuppressHSA2Suggestions:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKSuppressHSA2Suggestions"));

}

- (int64_t)shouldAddHSA2CreateHeader
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKAddHS2CreateHeader"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldAddHSA2CreateHeader:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKAddHS2CreateHeader"));

}

- (int64_t)shouldAllowPhoneNumberAccounts
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKAllowPhoneNumberAccounts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldAllowPhoneNumberAccounts:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKAllowPhoneNumberAccounts"));

}

- (int64_t)shouldAllowExperimentalMode
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKAddExperimentalModeHeader"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldAllowExperimentalMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKAddExperimentalModeHeader"));

}

- (int64_t)shouldHideInternalBuildHeader
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKHideInternalBuildHeader"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldHideInternalBuildHeader:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKHideInternalBuildHeader"));

}

- (int64_t)shouldHideSeedBuildHeader
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKHideSeedBuildHeader"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldHideSeedBuildHeader:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKHideSeedBuildHeader"));

}

- (int64_t)shouldAllowDemoMode
{
  void *v3;
  int v4;
  void *v5;
  int64_t v6;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (!v4)
    return -1;
  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKAuthorizationDemoMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (void)setShouldAllowDemoMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKAuthorizationDemoMode"));

}

- (void)setShouldAllowTestApplication:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKAddTestApplicationHeader"));

}

- (int64_t)shouldEnableTestAccountMode
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKAddTestAccountHeader"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldEnableTestAccountMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKAddTestAccountHeader"));

}

- (int64_t)shouldSuppressModalSheetsInMacBuddy
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKSuppressModalSheetsInMacBuddy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldSuppressModalSheetsInMacBuddy:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKSuppressModalSheetsInMacBuddy"));

}

- (int64_t)shouldAutocycleAppsInTiburon
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKAutocycleAppsInTiburon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldAutocycleAppsInTiburon:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKAutocycleAppsInTiburon"));

}

- (int64_t)shouldAlwaysShowWelcome
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKAlwaysShowWelcome"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldAlwaysShowWelcome:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKAlwaysShowWelcome"));

}

- (int64_t)shouldAutocycleAppsInWebTakeover
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKAutocycleAppsInWebTakeOver"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldAutocycleAppsInWebTakeover:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKAutocycleAppsInWebTakeOver"));

}

- (int64_t)shouldAskToBuy
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKAskToBuy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldAskToBuy:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKAskToBuy"));

}

- (void)setShouldEnableTelemetryOptIn:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKTelemetryOptIn"));

}

- (void)setLastKnownIDMSEnvironment:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKLastIDMSEnvironment"));

}

- (int64_t)shouldRequestPiggybackingPresenceEnforcement
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKShouldRequestPiggybackingPresenceEnforcement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)piggybackingIDMSPresenceOverride
{
  return -[AKConfiguration overrideForKey:](self, "overrideForKey:", CFSTR("AKOverridePiggybackingIDMSPresence"));
}

- (void)setPiggybackingIDMSPresenceOverride:(int64_t)a3
{
  -[AKConfiguration setOverride:forKey:](self, "setOverride:forKey:", a3, CFSTR("AKOverridePiggybackingIDMSPresence"));
}

- (int64_t)piggybackingLocalPresenceOverride
{
  return -[AKConfiguration overrideForKey:](self, "overrideForKey:", CFSTR("AKOverridePiggybackingLocalPresence"));
}

- (void)setPiggybackingLocalPresenceOverride:(int64_t)a3
{
  -[AKConfiguration setOverride:forKey:](self, "setOverride:forKey:", a3, CFSTR("AKOverridePiggybackingLocalPresence"));
}

- (int64_t)forceSilentEscrowRecordRepairEnabled
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKForceSilentEscrowRecordRepairEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setForceSilentEscrowRecordRepairEnabled:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKForceSilentEscrowRecordRepairEnabled"));

}

- (int64_t)forceSilentEscrowRecordRepairEnabledV2
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKForceSilentEscrowRecordRepairEnabledV2"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setForceSilentEscrowRecordRepairEnabledV2:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKForceSilentEscrowRecordRepairEnabledV2"));

}

- (int64_t)forceSilentBurnCDPRepairEnabled
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKForceSilentBurnCDPRepairEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setForceSilentBurnCDPRepairEnabled:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKForceSilentBurnCDPRepairEnabled"));

}

- (unint64_t)internalFeaturesMaskValue
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  int v6;

  v3 = -[AKConfiguration shouldBypassCustodianDeviceCheck](self, "shouldBypassCustodianDeviceCheck") == 1;
  if (-[AKConfiguration shouldEnableBeneficiaryLiveOn](self, "shouldEnableBeneficiaryLiveOn") == 1)
    v3 |= 2uLL;
  if (-[AKConfiguration shouldRequestPiggybackingPresenceEnforcement](self, "shouldRequestPiggybackingPresenceEnforcement") == 1)v3 |= 0x20uLL;
  if (-[AKConfiguration shouldForceBaaValidation](self, "shouldForceBaaValidation") == 1)
    v3 |= 0x40uLL;
  if (-[AKConfiguration contactKeyVerification](self, "contactKeyVerification") == 1)
    v4 = v3 | 0x80;
  else
    v4 = v3;
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAABrandingEnabled");

  if (v6)
    return v4 | 0x400;
  else
    return v4;
}

- (int64_t)shouldBypassCustodianDeviceCheck
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKByPassCustodianDeviceCheck"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldBypassCustodianDeviceCheck:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKByPassCustodianDeviceCheck"));

}

- (int64_t)shouldEnableBeneficiaryLiveOn
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKBeneficiaryLiveOnKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldEnableBeneficiaryLiveOn:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKBeneficiaryLiveOnKey"));

}

- (int64_t)shouldForceBaaValidation
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKShouldForceBaaValidation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldForceBaaValidation:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKShouldForceBaaValidation"));

}

- (int64_t)contactKeyVerification
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKContactKeyVerification"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setContactKeyVerification:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKContactKeyVerification"));

}

- (int64_t)requestedCloudPartition
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKCloudPartition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)_validCloudPartition:(int64_t)a3
{
  return 1;
}

- (void)setRequestedCloudPartition:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKCloudPartition"));

}

- (NSString)lastKnownLocale
{
  return (NSString *)-[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKLastLocale"));
}

- (void)setLastKnownLocale:(id)a3
{
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", a3, CFSTR("AKLastLocale"));
}

- (void)setForceHasSOSActiveDevice:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKShouldForceHasSOSActiveDevice"));

}

- (void)setForceSOSNeeded:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKShouldForceSOSNeeded"));

}

- (int64_t)telemetryOptInGracePeriodOverride
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKOverrideTelemetryOptInGracePeriod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setTelemetryOptInGracePeriodOverride:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("_AKOverrideTelemetryOptInGracePeriod"));

}

- (void)setStrongDeviceIdentityMarker:(id)a3
{
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", a3, CFSTR("_AKBAACertMarkerKey"));
}

- (NSData)strongDeviceIdentityMarker
{
  return (NSData *)-[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("_AKBAACertMarkerKey"));
}

- (int64_t)criticalAccountEditsAllowedOverride
{
  return -[AKConfiguration overrideForKey:](self, "overrideForKey:", CFSTR("AKOverrideCriticalAccountEdits"));
}

- (void)setCriticalAccountEditsAllowedOverride:(int64_t)a3
{
  -[AKConfiguration setOverride:forKey:](self, "setOverride:forKey:", a3, CFSTR("AKOverrideCriticalAccountEdits"));
}

- (int64_t)deviceSafetyRestrictionReasonOverride
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKDeviceSafetyRestrictionReasonOverride"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setDeviceSafetyRestrictionReasonOverride:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKDeviceSafetyRestrictionReasonOverride"));

}

- (int64_t)shouldEnableAttestationLogging
{
  void *v2;
  int64_t v3;

  -[AKConfiguration configurationValueForKey:](self, "configurationValueForKey:", CFSTR("AKOverrideAttestationLoggingKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShouldEnableAttestationLogging:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKConfiguration setConfigurationValue:forKey:](self, "setConfigurationValue:forKey:", v4, CFSTR("AKOverrideAttestationLoggingKey"));

}

- (int64_t)shouldEnablePiggybackingPresence
{
  return self->_shouldEnablePiggybackingPresence;
}

- (void)setShouldEnablePiggybackingPresence:(int64_t)a3
{
  self->_shouldEnablePiggybackingPresence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_cachedSettings, 0);
}

void __23__AKConfiguration_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Cached AuthKit configurations have changed. Clearing cache...", v1, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)configurationValueForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Nil key!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

@end
