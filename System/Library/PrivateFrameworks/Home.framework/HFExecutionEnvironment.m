@implementation HFExecutionEnvironment

uint64_t __62__HFExecutionEnvironment_dispatchMessageToObserversWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)isMacShortcuts
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 106;

  return v3;
}

+ (BOOL)isSpringBoard
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 100;

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFExecutionEnvironment observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  HFLogForCategory(8uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Added execution env observer: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

+ (BOOL)isHomeApp
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 0;

  return v3;
}

+ (BOOL)isHomeUIService
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 2;

  return v3;
}

+ (BOOL)isHomeControlService
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 3;

  return v3;
}

+ (HFExecutionEnvironment)sharedInstance
{
  if (qword_1ED378FE0 != -1)
    dispatch_once(&qword_1ED378FE0, &__block_literal_global_68);
  return (HFExecutionEnvironment *)(id)_MergedGlobals_242;
}

- (int64_t)hostProcess
{
  if (qword_1ED378FF0 != -1)
    dispatch_once(&qword_1ED378FF0, &__block_literal_global_7_2);
  return qword_1ED378FE8;
}

- (BOOL)isActive
{
  return self->_active;
}

+ (void)_disablePreferencesCloudBackup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("com.apple.Home.group"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library/Preferences/%@.plist"), CFSTR("com.apple.Home.group"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C9AC90];
  v10 = 0;
  v7 = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v6, &v10);
  v8 = v10;
  if ((v7 & 1) == 0)
  {
    HFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = CFSTR("com.apple.Home.group");
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Failed to set resource flag for disabling iCloud backups on %@ preferences. Error: %@", buf, 0x16u);
    }

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFExecutionEnvironment observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  HFLogForCategory(8uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Removed execution env observer: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)executionEnvironmentDidBecomeActive
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  HFLogForCategory(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Application became active", buf, 2u);
  }

  -[HFExecutionEnvironment setRunningState:](self, "setRunningState:", 0);
  -[HFExecutionEnvironment setActive:](self, "setActive:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HFExecutionEnvironment_executionEnvironmentDidBecomeActive__block_invoke;
  v4[3] = &unk_1EA730528;
  v4[4] = self;
  -[HFExecutionEnvironment dispatchMessageToObserversWithBlock:](self, "dispatchMessageToObserversWithBlock:", v4);
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)dispatchMessageToObserversWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HFExecutionEnvironment observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x1E0C809B0];
    v11 = MEMORY[0x1E0C80D38];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __62__HFExecutionEnvironment_dispatchMessageToObserversWithBlock___block_invoke;
        v15[3] = &unk_1EA728120;
        v14 = v4;
        v15[4] = v13;
        v16 = v14;
        dispatch_async(v11, v15);

        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

void __61__HFExecutionEnvironment_executionEnvironmentDidBecomeActive__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "executionEnvironmentDidBecomeActive:", *(_QWORD *)(a1 + 32));

}

- (void)_recordMetricsForAppRunningState
{
  unint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[HFExecutionEnvironment runningState](self, "runningState");
  if (v3 == 1)
  {
    -[HFExecutionEnvironment appForegroundStartTime](self, "appForegroundStartTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFExecutionEnvironment appForegroundStartTime](self, "appForegroundStartTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v9);
      v11 = v10;

      -[HFExecutionEnvironment setAppForegroundStartTime:](self, "setAppForegroundStartTime:", 0);
      if (v11 <= 1.0)
        return;
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject allHomesFuture](v6, "allHomesFuture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __58__HFExecutionEnvironment__recordMetricsForAppRunningState__block_invoke;
      v15[3] = &__block_descriptor_40_e29_v24__0__NSArray_8__NSError_16l;
      *(double *)&v15[4] = v11;
      v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v15);

    }
    else
    {
      HFLogForCategory(6uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Expected appForegroundStartTime to be non-nil when entering background so we could record total foreground time. No metrics will be recorded.", buf, 2u);
      }
    }
  }
  else
  {
    if (v3)
      return;
    -[HFExecutionEnvironment appForegroundStartTime](self, "appForegroundStartTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      HFLogForCategory(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        -[HFExecutionEnvironment appForegroundStartTime](self, "appForegroundStartTime");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Expected appForegroundStartTime to be nil when entering foreground but found value: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    -[HFExecutionEnvironment setAppForegroundStartTime:](self, "setAppForegroundStartTime:", v6);
  }

}

- (unint64_t)runningState
{
  return self->_runningState;
}

- (void)setRunningState:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_runningState == a3)
  {
    if (!a3)
    {
      -[HFExecutionEnvironment appForegroundStartTime](self, "appForegroundStartTime");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        -[HFExecutionEnvironment _recordMetricsForAppRunningState](self, "_recordMetricsForAppRunningState");
    }
  }
  else
  {
    HFLogForCategory(8uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[HFExecutionEnvironment stringForHFExecutionEnvironmentRunningState:](HFExecutionEnvironment, "stringForHFExecutionEnvironmentRunningState:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Running state is now '%@'", buf, 0xCu);

    }
    self->_runningState = a3;
    -[HFExecutionEnvironment _recordMetricsForAppRunningState](self, "_recordMetricsForAppRunningState");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__HFExecutionEnvironment_setRunningState___block_invoke;
    v8[3] = &unk_1EA730528;
    v8[4] = self;
    -[HFExecutionEnvironment dispatchMessageToObserversWithBlock:](self, "dispatchMessageToObserversWithBlock:", v8);
  }
}

- (NSDate)appForegroundStartTime
{
  return self->_appForegroundStartTime;
}

- (void)setAppForegroundStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_appForegroundStartTime, a3);
}

uint64_t __30__HFExecutionEnvironment_init__block_invoke()
{
  return +[HFExecutionEnvironment _disablePreferencesCloudBackup](HFExecutionEnvironment, "_disablePreferencesCloudBackup");
}

+ (BOOL)isHomeWidgetRelatedProcess
{
  if ((objc_msgSend(a1, "isHomeWidget") & 1) != 0 || (objc_msgSend(a1, "isHomeEnergyWidget") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isHomeWidgetInteractive");
}

+ (BOOL)isHomeWidget
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 5;

  return v3;
}

+ (BOOL)isHomeWidgetInteractive
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 6;

  return v3;
}

+ (BOOL)isHomeEnergyWidget
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 7;

  return v3;
}

void __40__HFExecutionEnvironment_sharedInstance__block_invoke()
{
  HFExecutionEnvironment *v0;
  void *v1;

  v0 = objc_alloc_init(HFExecutionEnvironment);
  v1 = (void *)_MergedGlobals_242;
  _MergedGlobals_242 = (uint64_t)v0;

}

- (HFExecutionEnvironment)init
{
  HFExecutionEnvironment *v2;
  HFExecutionEnvironment *v3;
  uint64_t v4;
  NSHashTable *observers;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFExecutionEnvironment;
  v2 = -[HFExecutionEnvironment init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_runningState = 0;
    v2->_macScreenIsLocked = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    if (!-[HFExecutionEnvironment hostProcess](v3, "hostProcess"))
    {
      dispatch_get_global_queue(-2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v6, &__block_literal_global_3_3);

    }
  }
  return v3;
}

void __37__HFExecutionEnvironment_hostProcess__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  int v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  HFHomeAppBundleID();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v11, "isEqualToString:", v1);

  if ((v2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    HFNanoHomeAppBundleID();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "isEqualToString:", v4);

    if ((v5 & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      HFHomeUIServiceBundleID();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
      {
        v3 = 2;
      }
      else
      {
        HFHomeControlServiceBundleID();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v11, "isEqualToString:", v8);

        if ((v9 & 1) != 0)
        {
          v3 = 3;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Home.HomeNotification")) & 1) != 0)
        {
          v3 = 4;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Home.HomeWidget")) & 1) != 0)
        {
          v3 = 5;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Home.HomeEnergyWidgets")) & 1) != 0)
        {
          v3 = 7;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Home.HomeWidget.Interactive")) & 1) != 0)
        {
          v3 = 6;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Home.HomeWidgetIntentsExtension")) & 1) != 0)
        {
          v3 = 10;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) != 0)
        {
          v3 = 100;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Carousel")) & 1) != 0)
        {
          v3 = 101;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
        {
          v3 = 102;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.proximitycontrold")) & 1) != 0)
        {
          v3 = 104;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.PCViewService")) & 1) != 0)
        {
          v3 = 105;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.HomeControlServiceTestApp")) & 1) != 0)
        {
          v3 = 103;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.WorkflowUI.CatalystContentExtension")) & 1) != 0)
        {
          v3 = 106;
        }
        else
        {
          v10 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.shortcuts"));
          v3 = 107;
          if (!v10)
            v3 = -1;
        }
      }
    }
  }
  qword_1ED378FE8 = v3;

}

+ (BOOL)isWatchApp
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 1;

  return v3;
}

+ (BOOL)isShortcuts
{
  BOOL v2;
  void *v3;

  if ((objc_msgSend(a1, "isMacShortcuts") & 1) != 0)
    return 1;
  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "hostProcess") == 107;

  return v2;
}

+ (BOOL)isCarousel
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 101;

  return v3;
}

+ (BOOL)isSettings
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 102;

  return v3;
}

+ (BOOL)isHomeNotification
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 4;

  return v3;
}

+ (BOOL)isHomeWidgetIntents
{
  void *v2;
  BOOL v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostProcess") == 10;

  return v3;
}

+ (BOOL)isHomeRelatedProcess
{
  if ((objc_msgSend(a1, "isHomeApp") & 1) != 0
    || (objc_msgSend(a1, "isWatchApp") & 1) != 0
    || (objc_msgSend(a1, "isHomeUIService") & 1) != 0
    || (objc_msgSend(a1, "isHomeControlService") & 1) != 0
    || (objc_msgSend(a1, "isHomeNotification") & 1) != 0
    || (objc_msgSend(a1, "isHomeWidget") & 1) != 0
    || (objc_msgSend(a1, "isHomeEnergyWidget") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isHomeWidgetInteractive");
  }
}

void __42__HFExecutionEnvironment_setRunningState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "executionEnvironmentRunningStateDidChange:", *(_QWORD *)(a1 + 32));

}

- (void)executionEnvironmentWillEnterForeground
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  HFLogForCategory(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Application entering foreground", buf, 2u);
  }

  -[HFExecutionEnvironment setRunningState:](self, "setRunningState:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HFExecutionEnvironment_executionEnvironmentWillEnterForeground__block_invoke;
  v4[3] = &unk_1EA730528;
  v4[4] = self;
  -[HFExecutionEnvironment dispatchMessageToObserversWithBlock:](self, "dispatchMessageToObserversWithBlock:", v4);
}

void __65__HFExecutionEnvironment_executionEnvironmentWillEnterForeground__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "executionEnvironmentWillEnterForeground:", *(_QWORD *)(a1 + 32));

}

- (void)executionEnvironmentWillResignActive
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  HFLogForCategory(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Application resigning active", buf, 2u);
  }

  -[HFExecutionEnvironment setActive:](self, "setActive:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__HFExecutionEnvironment_executionEnvironmentWillResignActive__block_invoke;
  v4[3] = &unk_1EA730528;
  v4[4] = self;
  -[HFExecutionEnvironment dispatchMessageToObserversWithBlock:](self, "dispatchMessageToObserversWithBlock:", v4);
}

void __62__HFExecutionEnvironment_executionEnvironmentWillResignActive__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "executionEnvironmentWillResignActive:", *(_QWORD *)(a1 + 32));

}

- (void)executionEnvironmentDidEnterBackground
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  HFLogForCategory(8uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Application entered background", buf, 2u);
  }

  -[HFExecutionEnvironment setRunningState:](self, "setRunningState:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__HFExecutionEnvironment_executionEnvironmentDidEnterBackground__block_invoke;
  v4[3] = &unk_1EA730528;
  v4[4] = self;
  -[HFExecutionEnvironment dispatchMessageToObserversWithBlock:](self, "dispatchMessageToObserversWithBlock:", v4);
}

void __64__HFExecutionEnvironment_executionEnvironmentDidEnterBackground__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "executionEnvironmentDidEnterBackground:", *(_QWORD *)(a1 + 32));

}

void __58__HFExecutionEnvironment__recordMetricsForAppRunningState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "accessories", (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  v16[0] = CFSTR("foregroundDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v16[1] = CFSTR("userHasAccessories");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 0, v11);
}

+ (id)stringForHFExecutionEnvironmentRunningState:(unint64_t)a3
{
  __CFString *v3;

  v3 = CFSTR("inactive");
  if (a3 == 1)
    v3 = CFSTR("background");
  if (a3)
    return v3;
  else
    return CFSTR("foreground");
}

- (BOOL)macScreenIsLocked
{
  return self->_macScreenIsLocked;
}

- (void)setMacScreenIsLocked:(BOOL)a3
{
  self->_macScreenIsLocked = a3;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appForegroundStartTime, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
