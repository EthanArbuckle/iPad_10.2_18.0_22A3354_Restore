@implementation HFAccessorySettingAdapter

- (HFAccessorySettingAdapter)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingAdapter.m"), 93, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingAdapter init]",
    v5);

  return 0;
}

- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  id v12;
  id v13;
  id v14;
  HFAccessorySettingAdapter *v15;
  HFAccessorySettingAdapter *v16;
  uint64_t v17;
  id updateHandler;
  uint64_t v19;
  HFHomeKitSettingsValueManager *valueManager;
  uint64_t v21;
  NSSet *keyPaths;
  uint64_t v23;
  NSMutableDictionary *keyPathStringToFuture;
  uint64_t v25;
  HFHomeKitDispatcher *dispatcher;
  NSObject *v27;
  void *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingAdapter.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingAdapter.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPaths"));

LABEL_3:
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v31.receiver = self;
  v31.super_class = (Class)HFAccessorySettingAdapter;
  v15 = -[HFAccessorySettingAdapter init](&v31, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_mode = a5;
    v17 = objc_msgSend(v14, "copy");
    updateHandler = v16->_updateHandler;
    v16->_updateHandler = (id)v17;

    objc_storeStrong((id *)&v16->_homeKitSettingsVendor, a3);
    objc_msgSend(v12, "hf_settingsValueManager");
    v19 = objc_claimAutoreleasedReturnValue();
    valueManager = v16->_valueManager;
    v16->_valueManager = (HFHomeKitSettingsValueManager *)v19;

    v21 = objc_msgSend(v13, "copy");
    keyPaths = v16->_keyPaths;
    v16->_keyPaths = (NSSet *)v21;

    v23 = objc_opt_new();
    keyPathStringToFuture = v16->_keyPathStringToFuture;
    v16->_keyPathStringToFuture = (NSMutableDictionary *)v23;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v25 = objc_claimAutoreleasedReturnValue();
    dispatcher = v16->_dispatcher;
    v16->_dispatcher = (HFHomeKitDispatcher *)v25;

    -[HFHomeKitDispatcher addMediaObjectObserver:](v16->_dispatcher, "addMediaObjectObserver:", v16);
    -[HFHomeKitDispatcher addHomeKitSettingsObserver:](v16->_dispatcher, "addHomeKitSettingsObserver:", v16);
    -[HFAccessorySettingAdapter _updateRootAccessorySettings](v16, "_updateRootAccessorySettings");
    HFLogForCategory(0x39uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v13;
      _os_log_impl(&dword_1DD34E000, v27, OS_LOG_TYPE_DEFAULT, "init HFAccessorySettingAdapter with keyPaths: %@", buf, 0xCu);
    }

  }
  return v16;
}

- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandlerBlock:(id)a5
{
  return -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](self, "initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:", a3, a4, 1, a5);
}

- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  return -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](self, "initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:", a3, a4, 1, a5);
}

- (HFAccessorySettingAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4
{
  return -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](self, "initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:", a3, a4, 1, 0);
}

- (id)updateSettingWithKeyPath:(id)a3 value:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  -[HFAccessorySettingAdapter settingWatchFutureForKeyPath:](self, "settingWatchFutureForKeyPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__HFAccessorySettingAdapter_updateSettingWithKeyPath_value___block_invoke;
  v11[3] = &unk_1EA72AAD8;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __60__HFAccessorySettingAdapter_updateSettingWithKeyPath_value___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSetting:value:", a2, *(_QWORD *)(a1 + 40));
}

- (id)settingWatchFutureForKeyPath:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingAdapter.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  HFLogForCategory(0x39uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v22;
      v38 = 2112;
      v39 = v23;
      v40 = 2112;
      v41 = v5;
      _os_log_debug_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEBUG, "(%@/%@) Checking to see if we already have setting for keyPath '%@'...", buf, 0x20u);

    }
    -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && (objc_msgSend(v11, "setting"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      HFLogForCategory(0x39uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setting");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v37 = v32;
        v38 = 2112;
        v39 = v33;
        v40 = 2112;
        v41 = v5;
        v42 = 2112;
        v43 = v34;
        _os_log_debug_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEBUG, "(%@/%@) Setting '%@' is something we're watching for already! Returning: '%@'", buf, 0x2Au);

      }
      v14 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(v11, "setting");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "futureWithResult:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      HFLogForCategory(0x39uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v29;
        v38 = 2112;
        v39 = v30;
        v40 = 2112;
        v41 = v5;
        _os_log_debug_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEBUG, "(%@/%@) Setting '%@' is something we're watching for, but don't have a setting yet.  Returning a future.", buf, 0x20u);

      }
      -[HFAccessorySettingAdapter keyPathStringToFuture](self, "keyPathStringToFuture");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "na_objectForKey:withDefaultValue:", v5, &__block_literal_global_108_0);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v16;

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v25;
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v5;
      v42 = 2112;
      v43 = v27;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "(%@/%@) Error; '%@' isn't part of watched keyPaths '%@'",
        buf,
        0x2Au);

    }
    v17 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:descriptionFormat:", 7, CFSTR("Could not find accessory setting for keyPath: %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

id __58__HFAccessorySettingAdapter_settingWatchFutureForKeyPath___block_invoke()
{
  return (id)objc_opt_new();
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (HFHomeKitSettingsValueManager)valueManager
{
  HFHomeKitSettingsValueManager *valueManager;
  void *v4;
  HFHomeKitSettingsValueManager *v5;
  HFHomeKitSettingsValueManager *v6;

  valueManager = self->_valueManager;
  if (!valueManager)
  {
    -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_settingsValueManager");
    v5 = (HFHomeKitSettingsValueManager *)objc_claimAutoreleasedReturnValue();
    v6 = self->_valueManager;
    self->_valueManager = v5;

    valueManager = self->_valueManager;
  }
  return valueManager;
}

- (id)updateSetting:(id)a3 value:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  __CFString *v23;
  __CFString *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  -[HFAccessorySettingAdapter valueManager](self, "valueManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "changeValueForSetting:toValue:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __49__HFAccessorySettingAdapter_updateSetting_value___block_invoke;
    v22[3] = &unk_1EA72AB40;
    v23 = v6;
    v24 = v7;
    v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v22);

    v12 = v23;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D519C0];
    v14 = (void *)MEMORY[0x1E0CB35C8];
    if (v6)
      v15 = v6;
    else
      v15 = CFSTR("(null)");
    v25[0] = CFSTR("setting");
    v25[1] = CFSTR("value");
    if (v7)
      v16 = v7;
    else
      v16 = CFSTR("(null)");
    v26[0] = v15;
    v26[1] = v16;
    v25[2] = CFSTR("settings");
    -[HFAccessorySettingAdapter settings](self, "settings");
    v17 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v17;
    if (v17)
      v18 = (const __CFString *)v17;
    else
      v18 = CFSTR("(null)");
    v26[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_errorWithCode:operation:options:", 25, CFSTR("updateSetting:value: failed because value manager is nil!"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void __49__HFAccessorySettingAdapter_updateSetting_value___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x39uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Attempting to update '%@' with value '%@' failed: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEBUG, "Updated '%@' with value '%@'", (uint8_t *)&v11, 0x16u);
  }

}

- (id)settingForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFAccessorySettingAdapter _updateRootAccessorySettingsIfNeeded](self, "_updateRootAccessorySettingsIfNeeded");
  -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)settings:(id)a3 willWriteValueForSettings:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  HFAccessorySettingAdapter *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x39uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v19 = self;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    _os_log_debug_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEBUG, "%@:%@ settings %@, settingsSet %@", buf, 0x2Au);

  }
  -[HFAccessorySettingAdapter _updateRootAccessorySettingsIfNeeded](self, "_updateRootAccessorySettingsIfNeeded");
  -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__HFAccessorySettingAdapter_settings_willWriteValueForSettings___block_invoke;
  v16[3] = &unk_1EA72AB68;
  v17 = v10;
  v12 = v10;
  objc_msgSend(v8, "na_filter:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __64__HFAccessorySettingAdapter_settings_willWriteValueForSettings___block_invoke_2;
  v15[3] = &unk_1EA72AB90;
  v15[4] = self;
  objc_msgSend(v13, "na_each:", v15);

}

uint64_t __64__HFAccessorySettingAdapter_settings_willWriteValueForSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __64__HFAccessorySettingAdapter_settings_willWriteValueForSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportUpdatedValueForSetting:", a2);
}

- (void)settings:(id)a3 didWriteValueForSettings:(id)a4 failedSettings:(id)a5 homeKitObjectIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  HFAccessorySettingAdapter *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  HFLogForCategory(0x39uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v23 = self;
    v24 = 2112;
    v25 = v18;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    _os_log_debug_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEBUG, "%@:%@ settings %@, didWrite %@, failedWrite %@", buf, 0x34u);

  }
  -[HFAccessorySettingAdapter _updateRootAccessorySettingsIfNeeded](self, "_updateRootAccessorySettingsIfNeeded");
  -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __103__HFAccessorySettingAdapter_settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke;
  v20[3] = &unk_1EA72AB68;
  v21 = v14;
  v16 = v14;
  objc_msgSend(v12, "na_filter:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __103__HFAccessorySettingAdapter_settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke_2;
  v19[3] = &unk_1EA72AB90;
  v19[4] = self;
  objc_msgSend(v17, "na_each:", v19);

}

uint64_t __103__HFAccessorySettingAdapter_settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __103__HFAccessorySettingAdapter_settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportUpdatedValueForSetting:", a2);
}

- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  HFLogForCategory(0x39uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Got settings:didUpdateForIdentifier:keyPath: callback for keyPath '%@'", (uint8_t *)&v11, 0xCu);
  }

  -[HFAccessorySettingAdapter settingForKeyPath:](self, "settingForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x39uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Found changed setting:%@ for keyPath: %@", (uint8_t *)&v11, 0x16u);
    }

    -[HFAccessorySettingAdapter _reportUpdatedValueForSetting:](self, "_reportUpdatedValueForSetting:", v8);
  }
  else
  {
    if (v10)
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Cannot find changed setting for keyPath: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)settingsDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HFAccessorySettingAdapter settings](self, "settings");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
    {
      -[HFAccessorySettingAdapter _updateRootAccessorySettings](self, "_updateRootAccessorySettings");
      goto LABEL_31;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (!v8)
      goto LABEL_30;
    v10 = v8;
    v11 = *(_QWORD *)v37;
    *(_QWORD *)&v9 = 138412546;
    v32 = v9;
    v33 = *(_QWORD *)v37;
LABEL_6:
    v12 = 0;
    v34 = v10;
    while (1)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12);
      -[HFAccessorySettingAdapter settingForKeyPath:](self, "settingForKeyPath:", v13, v32);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        HFLogForCategory(0x39uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v16)
        {
          v19 = v4;
          if (v18)
          {
            *(_DWORD *)buf = v32;
            v41 = v15;
            v42 = 2112;
            v43 = v13;
            _os_log_debug_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEBUG, "Found watched setting '%@' @ keyPath '%@'", buf, 0x16u);
          }

          -[HFAccessorySettingAdapter settings](self, "settings");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[_HFObservedAccessorySettingState stateWithSettings:forSetting:](_HFObservedAccessorySettingState, "stateWithSettings:forSetting:", v20, v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "keyPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v21, "isEqual:", v24);

          if ((v25 & 1) == 0)
          {
            HFLogForCategory(0x39uLL);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v32;
              v41 = v15;
              v42 = 2112;
              v43 = v13;
              _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "Found metadata for setting '%@' @ keyPath '%@' has changed; notifying delegate",
                buf,
                0x16u);
            }

            -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "keyPath");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKey:", v21, v28);

            -[HFAccessorySettingAdapter _reportUpdatedValueForSetting:](self, "_reportUpdatedValueForSetting:", v15);
          }

          v4 = v19;
          v11 = v33;
          v10 = v34;
        }
        else
        {
          if (v18)
          {
            *(_DWORD *)buf = v32;
            v41 = v15;
            v42 = 2112;
            v43 = v13;
            _os_log_debug_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEBUG, "Setting '%@' @ keyPath '%@' was deleted.", buf, 0x16u);
          }

          -[HFAccessorySettingAdapter _teardownSetting:](self, "_teardownSetting:", v15);
        }
      }
      else
      {
        HFLogForCategory(0x39uLL);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v32;
          v41 = 0;
          v42 = 2112;
          v43 = v13;
          _os_log_debug_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEBUG, "Unable to find watched setting '%@' @ keyPath '%@'", buf, 0x16u);
        }

        -[HFAccessorySettingAdapter settings](self, "settings");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "hf_accessorySettingAtKeyPath:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_28;
        -[HFAccessorySettingAdapter _watchSetting:](self, "_watchSetting:", v15);
        HFLogForCategory(0x39uLL);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v32;
          v41 = v15;
          v42 = 2112;
          v43 = v13;
          _os_log_debug_impl(&dword_1DD34E000, v31, OS_LOG_TYPE_DEBUG, "Built setting '%@' @ keyPath '%@'", buf, 0x16u);
        }

        -[HFAccessorySettingAdapter _reportUpdatedValueForSetting:](self, "_reportUpdatedValueForSetting:", v15);
      }

LABEL_28:
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (!v10)
        {
LABEL_30:

          break;
        }
        goto LABEL_6;
      }
    }
  }
LABEL_31:

}

- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a3;
  -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if (v7)
    -[HFAccessorySettingAdapter _updateRootAccessorySettingsIfNeeded](self, "_updateRootAccessorySettingsIfNeeded");
}

- (BOOL)_updateRootAccessorySettingsIfNeeded
{
  HFAccessorySettingAdapter *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  uint8_t v13[16];

  v2 = self;
  -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1DF0DABF0]();
    -[HFAccessorySettingAdapter settings](v2, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v4);

    if ((v7 & 1) != 0)
    {
      -[HFAccessorySettingAdapter _missingKeyPaths](v2, "_missingKeyPaths");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
        -[HFAccessorySettingAdapter _setupMissingKeyPaths](v2, "_setupMissingKeyPaths");
    }
    else
    {
      LOBYTE(v2) = -[HFAccessorySettingAdapter _updateRootAccessorySettings](v2, "_updateRootAccessorySettings");
    }
    objc_autoreleasePoolPop(v5);
    v11 = (v7 ^ 1) & v2;
  }
  else
  {
    HFLogForCategory(0x39uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Settings aren't setup yet; aborting cycling settings...",
        v13,
        2u);
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)_updateRootAccessorySettings
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v11;
  void *v12;
  __int16 v13;
  HFAccessorySettingAdapter *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x39uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingAdapter settings](self, "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v7;
      v13 = 2112;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Cycling settings object for homeKitSettingsVendor %@ / adapter %@ to settings '%@' from settings '%@'", (uint8_t *)&v11, 0x2Au);

    }
    -[HFAccessorySettingAdapter _tearDownKeyPaths](self, "_tearDownKeyPaths");
    objc_storeStrong((id *)&self->_settings, v4);
    v9 = -[HFAccessorySettingAdapter _setupKeyPaths](self, "_setupKeyPaths");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Settings aren't setup yet; aborting cycling settings...",
        (uint8_t *)&v11,
        2u);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)_setupKeyPaths
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  HFAccessorySettingAdapter *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HFAccessorySettingAdapter settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[HFAccessorySettingAdapter setWatchedSettings:](self, "setWatchedSettings:", v4);

    HFLogForCategory(0x39uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = self;
      v25 = 2112;
      v26 = v17;
      _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "Setting up adapter '%@' to watch keypaths '%@'", buf, 0x16u);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HFAccessorySettingAdapter keyPaths](self, "keyPaths", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
          -[HFAccessorySettingAdapter settings](self, "settings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "hf_accessorySettingAtKeyPath:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            -[HFAccessorySettingAdapter _watchSetting:](self, "_watchSetting:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    HFLogForCategory(0x39uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = self;
      v25 = 2112;
      v26 = v15;
      _os_log_debug_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEBUG, "Adapter '%@' setup with settings '%@'", buf, 0x16u);

    }
  }
  else
  {
    HFLogForCategory(0x39uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "Cannot setup keypaths; there are no accessory settings yet!",
        buf,
        2u);
    }
  }

  return v3 != 0;
}

- (id)_missingKeyPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setByRemovingObjectsFromSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setupMissingKeyPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  HFAccessorySettingAdapter *v41;
  __int16 v42;
  NSObject *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1DF0DABF0](self, a2);
  -[HFAccessorySettingAdapter settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    HFLogForCategory(0x39uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v9 = "Cannot setup missing keypaths; there are no accessory settings yet!";
    goto LABEL_6;
  }
  -[HFAccessorySettingAdapter settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    -[HFAccessorySettingAdapter settings](self, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      goto LABEL_8;
    HFLogForCategory(0x39uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v9 = "Cannot setup missing keypaths; Accessory Settings haven't finished populating yet!";
LABEL_6:
    _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, v9, buf, 2u);
    goto LABEL_37;
  }

LABEL_8:
  -[HFAccessorySettingAdapter _missingKeyPaths](self, "_missingKeyPaths");
  v8 = objc_claimAutoreleasedReturnValue();
  v14 = -[NSObject count](v8, "count");
  HFLogForCategory(0x39uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    v35 = v3;
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      v41 = self;
      v42 = 2112;
      v43 = v8;
      _os_log_debug_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEBUG, "Setting up adapter '%@' to watch any missing keypaths: '%@'", buf, 0x16u);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = v8;
    v17 = v8;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          v22 = *(NSObject **)(*((_QWORD *)&v36 + 1) + 8 * v21);
          v23 = (void *)MEMORY[0x1DF0DABF0]();
          -[HFAccessorySettingAdapter settings](self, "settings");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "hf_accessorySettingAtKeyPath:", v22);
          v25 = objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject keyPath](v25, "keyPath");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKey:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            HFLogForCategory(0x39uLL);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
            if (v28)
            {
              if (v30)
              {
                *(_DWORD *)buf = 138412546;
                v41 = self;
                v42 = 2112;
                v43 = v25;
                _os_log_debug_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEBUG, "Adapter '%@' is already watching '%@'", buf, 0x16u);
              }

            }
            else
            {
              if (v30)
              {
                *(_DWORD *)buf = 138412546;
                v41 = self;
                v42 = 2112;
                v43 = v25;
                _os_log_debug_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEBUG, "Adapter '%@' is setting up missed setting '%@'", buf, 0x16u);
              }

              -[HFAccessorySettingAdapter _watchSetting:](self, "_watchSetting:", v25);
              HFLogForCategory(0x39uLL);
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v41 = self;
                v42 = 2112;
                v43 = v25;
                _os_log_debug_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_DEBUG, "Adapter '%@' is setting up missed setting '%@'", buf, 0x16u);
              }

              -[HFAccessorySettingAdapter _reportUpdatedValueForSetting:](self, "_reportUpdatedValueForSetting:", v25);
            }
          }
          else
          {
            HFLogForCategory(0x39uLL);
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v41 = self;
              v42 = 2112;
              v43 = v22;
              _os_log_debug_impl(&dword_1DD34E000, v31, OS_LOG_TYPE_DEBUG, "Adapter '%@' cannot watch keypath '%@' -- doesn't exist in HomeKit?  Please file a radar if you're seeing this a lot.", buf, 0x16u);
            }

          }
          objc_autoreleasePoolPop(v23);
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v19);
    }

    HFLogForCategory(0x39uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v41 = self;
      v42 = 2112;
      v43 = v17;
      v44 = 2112;
      v45 = v33;
      _os_log_debug_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEBUG, "Adapter '%@' setup missed keypaths '%@' with settings '%@'", buf, 0x20u);

    }
    v8 = v34;
    v3 = v35;
  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEBUG, "All keypaths accounted for!", buf, 2u);
  }

LABEL_37:
  objc_autoreleasePoolPop(v3);
}

- (void)_tearDownKeyPaths
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HFAccessorySettingAdapter__tearDownKeyPaths__block_invoke;
  v8[3] = &unk_1EA72ABB8;
  v8[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    NSLog(CFSTR("After teardown, there shouldn't be anything in here!"));
  -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

void __46__HFAccessorySettingAdapter__tearDownKeyPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "setting");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_teardownSetting:", v4);

}

- (void)_watchSetting:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  HFAccessorySettingAdapter *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory(0x39uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Adapter '%@' started watching for '%@'", buf, 0x16u);
    }

    -[HFAccessorySettingAdapter keyPathStringToFuture](self, "keyPathStringToFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFAccessorySettingAdapter settings](self, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HFObservedAccessorySettingState stateWithSettings:forSetting:](_HFObservedAccessorySettingState, "stateWithSettings:forSetting:", v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_safeSetObject:forKey:", v10, v12);

    -[HFAccessorySettingAdapter keyPathStringToFuture](self, "keyPathStringToFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v14);

    HFLogForCategory(0x39uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Adapter '%@' is setting up '%@' for first use...", buf, 0x16u);
    }

    -[HFAccessorySettingAdapter _beginMonitoringSettingsKeyPath:](self, "_beginMonitoringSettingsKeyPath:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__HFAccessorySettingAdapter__watchSetting___block_invoke;
    v19[3] = &unk_1EA726EF8;
    v19[4] = self;
    v20 = v4;
    v21 = v8;
    v17 = v8;
    v18 = (id)objc_msgSend(v16, "addCompletionBlock:", v19);

  }
}

void __43__HFAccessorySettingAdapter__watchSetting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0x39uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Adapter '%@' failed to setup setting '%@' for initial state with error '%@'", (uint8_t *)&v17, 0x20u);
    }

  }
  v8 = *(_QWORD *)(a1 + 48);
  HFLogForCategory(0x39uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v17 = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Adapter '%@' is done setting up '%@'; firing watchFuture",
        (uint8_t *)&v17,
        0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v10)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Adapter '%@' is done setting up '%@'!", (uint8_t *)&v17, 0x16u);
    }

  }
}

- (void)_teardownSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  HFAccessorySettingAdapter *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    -[HFAccessorySettingAdapter keyPathStringToFuture](self, "keyPathStringToFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    HFLogForCategory(0x39uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Adapter '%@' stopped watching for '%@'", (uint8_t *)&v11, 0x16u);
    }

    v10 = -[HFAccessorySettingAdapter _endMonitoringSettingsKeyPath:](self, "_endMonitoringSettingsKeyPath:", v4);
  }

}

- (void)_reportUpdatedValueForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  HFAccessorySettingAdapter *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v5) & 1) != 0)
  {
    -[HFAccessorySettingAdapter watchedSettings](self, "watchedSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v4);

    if ((v10 & 1) != 0)
    {
      -[HFAccessorySettingAdapter valueManager](self, "valueManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueForSetting:", v4);
      v12 = objc_claimAutoreleasedReturnValue();

      HFLogForCategory(0x39uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v17 = 138412802;
        v18 = self;
        v19 = 2112;
        v20 = v4;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_INFO, "Adapter '%@' received update to setting '%@': %@", (uint8_t *)&v17, 0x20u);
      }

      -[HFAccessorySettingAdapter homeKitSettingWasUpdated:value:](self, "homeKitSettingWasUpdated:value:", v4, v12);
      -[HFAccessorySettingAdapter updateHandler](self, "updateHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[HFAccessorySettingAdapter updateHandler](self, "updateHandler");
        v15 = objc_claimAutoreleasedReturnValue();
        -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(NSObject *, void *, id, NSObject *))v15[2].isa)(v15, v16, v4, v12);

LABEL_10:
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  HFLogForCategory(0x39uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[HFAccessorySettingAdapter keyPaths](self, "keyPaths");
    v15 = objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v15;
    _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Adapter %@ does not watch for keyPath '%@'; this is a bug!  This adapter watches keypaths: %@",
      (uint8_t *)&v17,
      0x20u);
    goto LABEL_10;
  }
LABEL_11:

}

- (id)_beginMonitoringSettingsKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3);
}

- (id)_endMonitoringSettingsKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (NSSet)keyPaths
{
  return self->_keyPaths;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (NSMutableDictionary)watchedSettings
{
  return self->_watchedSettings;
}

- (void)setWatchedSettings:(id)a3
{
  objc_storeStrong((id *)&self->_watchedSettings, a3);
}

- (NSMutableDictionary)keyPathStringToFuture
{
  return self->_keyPathStringToFuture;
}

- (void)setKeyPathStringToFuture:(id)a3
{
  objc_storeStrong((id *)&self->_keyPathStringToFuture, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_keyPathStringToFuture, 0);
  objc_storeStrong((id *)&self->_watchedSettings, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong((id *)&self->_valueManager, 0);
}

+ (id)createDefaultHomeSettingAdapterCollectionForProfile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  HFAccessorySettingDefaultAdapterCollection *v18;
  HFAccessorySettingManagedConfigurationAdapter *v19;
  HFAccessorySettingSiriLanguageAdapter *v20;

  v3 = a3;
  v4 = &unk_1F0449888;
  v5 = v3;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (objc_msgSend(v5, "conformsToProtocol:", v4))
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v11);

LABEL_7:
    v8 = 0;
  }

  objc_msgSend(v6, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCurrentAccessory");

  if ((v13 & 1) == 0)
    NSLog(CFSTR("HFAccessorySettingAdapter's for SoundBoard are only supported for the *CURRENT* accessory"));
  objc_msgSend(v6, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "category");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "categoryType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", *MEMORY[0x1E0CB7A58]);

  if ((v17 & 1) == 0)
    NSLog(&CFSTR("HFAccessorySettingAdapter is being initialized on a non-HomePod.  Please file a radar with a sysdiagnose on S"
                 "oundBoard / HomeKit.").isa);
  v18 = objc_alloc_init(HFAccessorySettingDefaultAdapterCollection);
  v19 = -[HFAccessorySettingManagedConfigurationAdapter initWithHomeKitSettingsVendor:mode:]([HFAccessorySettingManagedConfigurationAdapter alloc], "initWithHomeKitSettingsVendor:mode:", v6, 1);
  -[HFAccessorySettingDefaultAdapterCollection setManagedConfigurationAdapter:](v18, "setManagedConfigurationAdapter:", v19);

  v20 = -[HFAccessorySettingSiriLanguageAdapter initWithHomeKitSettingsVendor:mode:]([HFAccessorySettingSiriLanguageAdapter alloc], "initWithHomeKitSettingsVendor:mode:", v6, 1);
  -[HFAccessorySettingDefaultAdapterCollection setSiriLanguageAdapter:](v18, "setSiriLanguageAdapter:", v20);

  return v18;
}

+ (id)createDefaultHomeSettingAdapterCollectionWithoutMobileTimerAdapterForProfile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  HFAccessorySettingDefaultAdapterCollection *v18;
  HFAccessorySettingManagedConfigurationAdapter *v19;
  HFAccessorySettingSiriLanguageAdapter *v20;

  v3 = a3;
  v4 = &unk_1F0449888;
  v5 = v3;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (objc_msgSend(v5, "conformsToProtocol:", v4))
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v11);

LABEL_7:
    v8 = 0;
  }

  objc_msgSend(v6, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCurrentAccessory");

  if ((v13 & 1) == 0)
    NSLog(CFSTR("%s HFAccessorySettingAdapter's for SoundBoard are only supported for the *CURRENT* accessory"), "+[HFAccessorySettingAdapter(SoundBoardAdditions) createDefaultHomeSettingAdapterCollectionWithoutMobileTimerAdapterForProfile:]");
  objc_msgSend(v6, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "category");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "categoryType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", *MEMORY[0x1E0CB7A58]);

  if ((v17 & 1) == 0)
    NSLog(CFSTR("%s HFAccessorySettingAdapter is being initialized on a non-HomePod.  Please file a radar with a sysdiagnose on SoundBoard / HomeKit."), "+[HFAccessorySettingAdapter(SoundBoardAdditions) createDefaultHomeSettingAdapterCollectionWithoutMobileTimerAdapterForProfile:]");
  v18 = objc_alloc_init(HFAccessorySettingDefaultAdapterCollection);
  v19 = -[HFAccessorySettingManagedConfigurationAdapter initWithHomeKitSettingsVendor:mode:]([HFAccessorySettingManagedConfigurationAdapter alloc], "initWithHomeKitSettingsVendor:mode:", v6, 1);
  -[HFAccessorySettingDefaultAdapterCollection setManagedConfigurationAdapter:](v18, "setManagedConfigurationAdapter:", v19);

  v20 = -[HFAccessorySettingSiriLanguageAdapter initWithHomeKitSettingsVendor:mode:]([HFAccessorySettingSiriLanguageAdapter alloc], "initWithHomeKitSettingsVendor:mode:", v6, 1);
  -[HFAccessorySettingDefaultAdapterCollection setSiriLanguageAdapter:](v18, "setSiriLanguageAdapter:", v20);

  return v18;
}

@end
