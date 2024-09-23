@implementation _DASSystemContext

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___DASSystemContext_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

- (BOOL)allowsDiscretionaryWorkForTask:(id)a3 withPriority:(unint64_t)a4 withParameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1B5E114F8]();
  if (_DASSchedulingPriorityBackground >= a4)
  {
    v13 = -[_DASSystemContext allowDiscretionaryWorkForBackgroundTask:withParameters:](self, "allowDiscretionaryWorkForBackgroundTask:withParameters:", v8, v9);
  }
  else if (_DASSchedulingPriorityDefault >= a4)
  {
    v13 = -[_DASSystemContext allowDiscretionaryWorkForUtilityTask:withParameters:](self, "allowDiscretionaryWorkForUtilityTask:withParameters:", v8, v9);
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", kDASSystemContextKeyNetworkTask);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (!v12)
    {
      v14 = 1;
      goto LABEL_8;
    }
    v13 = -[_DASSystemContext isNetworkAvailable](self, "isNetworkAvailable");
  }
  v14 = v13;
LABEL_8:
  objc_autoreleasePoolPop(v10);

  return v14;
}

- (BOOL)allowDiscretionaryWorkForBackgroundTask:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  int v22;
  BOOL v23;
  int v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_DASSystemContext keyPathForPriority:](self, "keyPathForPriority:", _DASSchedulingPriorityBackground);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", kDASSystemContextKeyPushTask);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12 && -[_DASSystemContext isApplicationFocalForPushTask:](self, "isApplicationFocalForPushTask:", v6))
  {
    -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v6;
      v14 = "Task %@: Application focal";
LABEL_26:
      _os_log_impl(&dword_1B0DF4000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    v15 = (v10 & 1) == 0;
    if ((v10 & 1) != 0)
    {
      -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412546;
        v26 = v6;
        v27 = 2048;
        v28 = 30;
        _os_log_impl(&dword_1B0DF4000, v16, OS_LOG_TYPE_DEFAULT, "Task %@: Battery level below %lu returning NO", (uint8_t *)&v25, 0x16u);
      }

    }
    if ((v10 & 2) != 0)
    {
      -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412546;
        v26 = v6;
        v27 = 2048;
        v28 = 0;
        _os_log_impl(&dword_1B0DF4000, v17, OS_LOG_TYPE_DEFAULT, "Task %@: Thermal pressure level above %lu returning NO", (uint8_t *)&v25, 0x16u);
      }

      v15 = 0;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", kDASSystemContextKeyBypassEnergyBudget);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if ((v19 & 1) == 0 && (v10 & 4) != 0)
    {
      -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412290;
        v26 = v6;
        _os_log_impl(&dword_1B0DF4000, v20, OS_LOG_TYPE_DEFAULT, "Task %@: Out of Energy budget returning NO", (uint8_t *)&v25, 0xCu);
      }

      v15 = 0;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", kDASSystemContextKeyNetworkTask);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22 && (v10 & 0x10) != 0)
    {
      -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412290;
        v26 = v6;
        _os_log_impl(&dword_1B0DF4000, v13, OS_LOG_TYPE_DEFAULT, "Task %@: Inexpensive network not available returning NO", (uint8_t *)&v25, 0xCu);
      }
      v23 = 0;
      goto LABEL_28;
    }
    if (!v15)
    {
      v23 = 0;
      goto LABEL_29;
    }
    -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v6;
      v14 = "Task %@: Returning YES";
      goto LABEL_26;
    }
  }
  v23 = 1;
LABEL_28:

LABEL_29:
  return v23;
}

- (id)keyPathForPriority:(unint64_t)a3
{
  const __CFString *v4;

  if (_DASSchedulingPriorityBackground >= a3)
  {
    v4 = CFSTR("/das/maintenanceConstraints");
  }
  else
  {
    if (_DASSchedulingPriorityDefault < a3)
      return 0;
    v4 = CFSTR("/das/utilityConstraints");
  }
  objc_msgSend(MEMORY[0x1E0D15C78], "keyPathWithKey:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)allowDiscretionaryWorkForUtilityTask:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  const char *v25;
  BOOL v26;
  int v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D15C78], "keyPathWithKey:", CFSTR("/das/utilityConstraints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", kDASSystemContextKeyPushTask);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12 && -[_DASSystemContext isApplicationFocalForPushTask:](self, "isApplicationFocalForPushTask:", v6))
  {
    -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v6;
      v14 = "Task %@: Application focal";
LABEL_28:
      _os_log_impl(&dword_1B0DF4000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v28, 0xCu);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  v15 = (v10 & 1) == 0;
  if ((v10 & 1) != 0)
  {
    -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412546;
      v29 = v6;
      v30 = 2048;
      v31 = 20;
      _os_log_impl(&dword_1B0DF4000, v16, OS_LOG_TYPE_DEFAULT, "Task %@: Battery level below %lu returning NO", (uint8_t *)&v28, 0x16u);
    }

  }
  if ((v10 & 2) != 0)
  {
    -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412546;
      v29 = v6;
      v30 = 2048;
      v31 = 20;
      _os_log_impl(&dword_1B0DF4000, v17, OS_LOG_TYPE_DEFAULT, "Task %@: Thermal pressure level above %lu returning NO", (uint8_t *)&v28, 0x16u);
    }

    v15 = 0;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", kDASSystemContextKeyBypassEnergyBudget);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if ((v19 & 1) == 0 && (v10 & 4) != 0)
  {
    -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v6;
      _os_log_impl(&dword_1B0DF4000, v20, OS_LOG_TYPE_DEFAULT, "Task %@: Out of Energy budget returning NO", (uint8_t *)&v28, 0xCu);
    }

    v15 = 0;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", kDASSystemContextKeyNetworkTask);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    if ((v10 & 0x20) != 0)
    {
      -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 138412290;
        v29 = v6;
        v25 = "Task %@: Network not available returning NO";
        goto LABEL_33;
      }
LABEL_34:
      v26 = 0;
      goto LABEL_35;
    }
    if ((v10 & 0x10) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", kDASSystemContextKeyBypassDataBudget);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      if ((v24 & 1) == 0 && (v10 & 8) != 0)
      {
        -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412290;
          v29 = v6;
          v25 = "Task %@: Out of data budget returning NO";
LABEL_33:
          _os_log_impl(&dword_1B0DF4000, v13, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v28, 0xCu);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
    }
  }
  if (v15)
  {
    -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v6;
      v14 = "Task %@: Returning YES";
      goto LABEL_28;
    }
LABEL_29:
    v26 = 1;
LABEL_35:

    goto LABEL_36;
  }
  v26 = 0;
LABEL_36:

  return v26;
}

- (OS_os_log)dasSystemContextLog
{
  return self->_dasSystemContextLog;
}

- (_DASSystemContext)init
{
  _DASSystemContext *v2;
  uint64_t v3;
  _CDLocalContext *context;
  os_log_t v5;
  OS_os_log *dasSystemContextLog;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASSystemContext;
  v2 = -[_DASSystemContext init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D15C48], "userContext");
    v3 = objc_claimAutoreleasedReturnValue();
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v3;

    v5 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.das"), "UTF8String"), (const char *)objc_msgSend(CFSTR("systemcontext"), "UTF8String"));
    dasSystemContextLog = v2->_dasSystemContextLog;
    v2->_dasSystemContextLog = (OS_os_log *)v5;

  }
  return v2;
}

+ (id)initWithContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[_DASSystemContext sharedInstance](_DASSystemContext, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContext:", v3);

  return v4;
}

+ (id)defaultPathEvaluator
{
  if (defaultPathEvaluator_onceToken != -1)
    dispatch_once(&defaultPathEvaluator_onceToken, &__block_literal_global_1);
  return (id)defaultPathEvaluator_defaultPathEvaluator;
}

+ (id)defaultInexpensivePathEvaluator
{
  if (defaultInexpensivePathEvaluator_onceToken != -1)
    dispatch_once(&defaultInexpensivePathEvaluator_onceToken, &__block_literal_global_26);
  return (id)defaultInexpensivePathEvaluator_defaultInexpensivePathEvaluator;
}

+ (BOOL)isPluggedIn:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D15C50];
  v4 = a3;
  objc_msgSend(v3, "keyPathForPluginStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

- (BOOL)isNetworkAvailable
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "defaultPathEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  return v4 != 2;
}

- (BOOL)isInexpensiveNetworkAvailable
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "defaultInexpensivePathEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  return v4 != 2;
}

- (BOOL)isApplicationFocalForPushTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _CDLocalContext *context;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.apsd.")))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.apsd."), "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.icloud-container.")))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.icloud-container."), "length"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForAppUsageDataDictionaries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D15C50], "appUsageBundleID", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 && (objc_msgSend(v18, "hasPrefix:", v7) & 1) != 0)
        {

          LOBYTE(v12) = 1;
          goto LABEL_16;
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_16:

  return v12;
}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DASSystemContext dasSystemContextLog](self, "dasSystemContextLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Updating system constraints to: %@", (uint8_t *)&v8, 0xCu);

  }
  +[_DASScheduler sharedScheduler](_DASScheduler, "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSystemConstraintsWithParameters:", v4);

}

- (void)addNotificationHandlerForTaskName:(id)a3 withPriority:(unint64_t)a4 withParameters:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _DASSystemContext *v22;
  NSMutableArray *registrations;
  uint64_t v24;
  NSMutableArray *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0D15C88];
  -[_DASSystemContext keyPathForPriority:](self, "keyPathForPriority:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForChangeAtKeyPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E0D15C68];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.das.systemcontext.%@"), v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __95___DASSystemContext_addNotificationHandlerForTaskName_withPriority_withParameters_withHandler___block_invoke;
  v26[3] = &unk_1E624B9F0;
  objc_copyWeak(v30, &location);
  v18 = v12;
  v29 = v18;
  v19 = v10;
  v27 = v19;
  v30[1] = (id)a4;
  v20 = v11;
  v28 = v20;
  objc_msgSend(v16, "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", v17, v15, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = self;
  objc_sync_enter(v22);
  registrations = v22->_registrations;
  if (!registrations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v22->_registrations;
    v22->_registrations = (NSMutableArray *)v24;

    registrations = v22->_registrations;
  }
  -[NSMutableArray addObject:](registrations, "addObject:", v21);
  objc_sync_exit(v22);

  -[_CDLocalContext registerCallback:](v22->_context, "registerCallback:", v21);
  (*((void (**)(id, BOOL))v18 + 2))(v18, -[_DASSystemContext allowsDiscretionaryWorkForTask:withPriority:withParameters:](v22, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", v19, a4, v20));

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);

}

- (void)removeNotificationHandlerForTaskName:(id)a3
{
  id v4;
  void *v5;
  _DASSystemContext *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  _DASSystemContext *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.das.systemcontext.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6->_registrations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v5);

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (!v14)
      goto LABEL_12;
    -[NSMutableArray removeObject:](v6->_registrations, "removeObject:", v14);
    objc_sync_exit(v6);

    -[_CDLocalContext deregisterCallback:](v6->_context, "deregisterCallback:", v14);
    v6 = v14;
  }
  else
  {
LABEL_9:

LABEL_12:
    objc_sync_exit(v6);
  }

}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setDasSystemContextLog:(id)a3
{
  objc_storeStrong((id *)&self->_dasSystemContextLog, a3);
}

- (NSMutableArray)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (int64_t)networkPathStatus
{
  return self->_networkPathStatus;
}

- (void)setNetworkPathStatus:(int64_t)a3
{
  self->_networkPathStatus = a3;
}

- (int64_t)inexpensiveNetworkPathStatus
{
  return self->_inexpensiveNetworkPathStatus;
}

- (void)setInexpensiveNetworkPathStatus:(int64_t)a3
{
  self->_inexpensiveNetworkPathStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_dasSystemContextLog, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
