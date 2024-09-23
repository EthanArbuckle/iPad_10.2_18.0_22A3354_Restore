@implementation HFAccessorySettingSiriLanguageAdapter

- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  HFAccessorySettingSiriLanguageAdapter *v9;
  uint64_t v10;
  NSHashTable *observers;
  uint64_t v12;
  NSSet *availableLanguageOptions;
  id v14;
  objc_super v16;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", CFSTR("root.siri.language"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HFAccessorySettingSiriLanguageAdapter;
  v9 = -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](&v16, sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_, v7, v8, a4, 0);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    availableLanguageOptions = v9->_availableLanguageOptions;
    v9->_availableLanguageOptions = (NSSet *)v12;

    v14 = -[HFAccessorySettingSiriLanguageAdapter _reloadLanguagesFromHomeKitNotifyingObservers:](v9, "_reloadLanguagesFromHomeKitNotifyingObservers:", 0);
  }

  return v9;
}

- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingSiriLanguageAdapter.m"), 54, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingSiriLanguageAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingSiriLanguageAdapter.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingSiriLanguageAdapter initWithHomeKitSettingsVendor:keyPaths:updateHandler:]",
    v8);

  return 0;
}

- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x39uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Siri language was updated to value [%@] - for setting [%@] - self.homeKitSettingsVendor [%@] - reloading", (uint8_t *)&v11, 0x20u);

  }
  v10 = -[HFAccessorySettingSiriLanguageAdapter _reloadLanguagesFromHomeKitNotifyingObservers:](self, "_reloadLanguagesFromHomeKitNotifyingObservers:", 1);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFAccessorySettingSiriLanguageAdapter observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFAccessorySettingSiriLanguageAdapter observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)updateAvailableLanguageOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[HFAccessorySettingAdapter mode](self, "mode") == 1)
  {
    objc_initWeak(location, self);
    -[HFAccessorySettingSiriLanguageAdapter languageSettingFuture](self, "languageSettingFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke;
    v11[3] = &unk_1EA72A4B0;
    v12 = v4;
    objc_copyWeak(&v13, location);
    objc_msgSend(v5, "flatMap:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v13);

    objc_destroyWeak(location);
  }
  else
  {
    HFLogForCategory(0x39uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = self;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Attempted to update available languages on adapter %@ when syncing of available options is disabled!", (uint8_t *)location, 0xCu);
    }

    v8 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 25, CFSTR("HFOperationUpdateHomePodAvailableLanguageOptions"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_11_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x39uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Updating available Siri language options...", buf, 2u);
  }

  HFLogForCategory(0x39uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v27;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Old languages: %@", buf, 0xCu);
  }

  HFLogForCategory(0x39uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v28;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "New languages: %@", buf, 0xCu);
  }

  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v27, v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "additions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_13;
  v37[3] = &unk_1EA72A3E8;
  v13 = v3;
  v38 = v13;
  objc_msgSend(v11, "na_map:", v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "deletions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v12;
  v35[1] = 3221225472;
  v35[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_18;
  v35[3] = &unk_1EA72A3E8;
  v25 = v13;
  v36 = v25;
  objc_msgSend(v14, "na_map:", v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v12;
  v33[1] = 3221225472;
  v33[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_24;
  v33[3] = &unk_1EA72A438;
  v20 = (id *)(a1 + 40);
  objc_copyWeak(&v34, v20);
  objc_msgSend(v19, "flatMap:", v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  v31[1] = 3221225472;
  v31[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_26;
  v31[3] = &unk_1EA72A460;
  objc_copyWeak(&v32, v20);
  objc_msgSend(v21, "addCompletionBlock:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_30;
  v29[3] = &unk_1EA72A488;
  objc_copyWeak(&v30, v20);
  objc_msgSend(v22, "recover:", v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  return v23;
}

uint64_t __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializedRepresentation");
}

uint64_t __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "title");
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_14;
  v8[3] = &unk_1EA729F18;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "lazyFutureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x39uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Adding available language: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2B0]), "initWithTitle:", *(_QWORD *)(a1 + 32));
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addItem:completionHandler:", v6, v8);
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_19;
  v8[3] = &unk_1EA729F18;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "lazyFutureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_19(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_3_20;
  v15 = &unk_1EA72A410;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v5, "na_firstObjectPassingTest:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    HFLogForCategory(0x39uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Removing available language: %@", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v4, "errorOnlyCompletionHandlerAdapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeItem:completionHandler:", v6, v10);
  }
  else
  {
    NSLog(CFSTR("Could not find matching item to remove for option %@!"), *(_QWORD *)(a1 + 40), v12, v13, v14, v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v11);

  }
}

uint64_t __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_3_20(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_24(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadLanguagesFromHomeKitNotifyingObservers:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory(0x39uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed to updateAvailableLanguageOptions: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dumpAvailableLanguageOptionsWithReason:", CFSTR("Finished updateAvailableLanguageOptions"));

}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_30(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadLanguagesFromHomeKitNotifyingObservers:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)updateSelectedLanguageOption:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HFAccessorySettingSiriLanguageAdapter *v11;
  id v12;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_initWeak(&location, self);
  -[HFAccessorySettingSiriLanguageAdapter languageSettingFuture](self, "languageSettingFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke;
  v9[3] = &unk_1EA72A528;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v7;
}

id __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *WeakRetained;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "allSerializedRepresentations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  objc_msgSend(v3, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke_33;
  v21[3] = &unk_1EA72A4D8;
  v7 = v4;
  v22 = v7;
  v23 = &v24;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v21);

  if (v25[5])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    HFLogForCategory(0x39uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "selectedLanguageOption");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      *(_DWORD *)buf = 138412546;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Updating selected Siri language option from: %@ to: %@", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "updateSetting:value:", v3, v25[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke_37;
    v18[3] = &unk_1EA72A500;
    v19 = a1[4];
    objc_copyWeak(&v20, a1 + 6);
    objc_msgSend(v12, "addCompletionBlock:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v20);

  }
  else
  {
    v14 = a1[4];
    objc_msgSend(a1[5], "availableLanguageOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not find selection item for language option %@ when it is in our set of available language options %@!"), v14, v15);

    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", WeakRetained);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke_33(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v11 = v7;
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x39uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Error updating selected language option to %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated selected language option to: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dumpAvailableLanguageOptionsWithReason:", CFSTR("Finished updateSelectedLanguageOption"));

}

- (void)_dumpAvailableLanguageOptionsWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x39uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "------", buf, 2u);
  }

  HFLogForCategory(0x39uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_debug_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEBUG, "[Dumping language options for reason: %@]", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HFAccessorySettingSiriLanguageAdapter availableLanguageOptions](self, "availableLanguageOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        HFLogForCategory(0x39uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v12;
          _os_log_debug_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEBUG, "OPTION: %@", buf, 0xCu);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  HFLogForCategory(0x39uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEBUG, "------", buf, 2u);
  }

}

- (id)preferredRecognitionLanguageOptionsForSelectedOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HFAccessorySettingSiriLanguageAdapter availableLanguageOptions](self, "availableLanguageOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "voiceNameWithDefaultFallback");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "outputLanguage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (!v15)
        {
          objc_msgSend(v13, "stringByAppendingString:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  -[HFAccessorySettingSiriLanguageAdapter availableLanguageOptions](self, "availableLanguageOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__HFAccessorySettingSiriLanguageAdapter_preferredRecognitionLanguageOptionsForSelectedOption___block_invoke;
  v22[3] = &unk_1EA72A550;
  v23 = v4;
  v24 = v5;
  v18 = v5;
  v19 = v4;
  objc_msgSend(v17, "na_filter:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __94__HFAccessorySettingSiriLanguageAdapter_preferredRecognitionLanguageOptionsForSelectedOption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outputVoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recognitionLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceSimilarToVoice:inSiriSessionLanguage:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11
    || (objc_msgSend(v9, "stringByAppendingString:", v8),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12),
        v12,
        !v13))
  {
    HFLogForCategory(0x39uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "recognitionLanguage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v7;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "Most similar voice %@ in recognition language %@ not available. Using default", (uint8_t *)&v23, 0x16u);

    }
    v19 = objc_msgSend(v3, "isDefaultVoiceForRecognitionLanguage");
  }
  else
  {
    objc_msgSend(v3, "voiceNameWithDefaultFallback");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (v16)
    {
      HFLogForCategory(0x39uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 32);
        v23 = 138412546;
        v24 = v3;
        v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Option %@ most similar to current selected option %@", (uint8_t *)&v23, 0x16u);
      }

      v19 = 1;
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (id)preferredOutputVoiceOptionsForSelectedOption:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFAccessorySettingSiriLanguageAdapter availableLanguageOptions](self, "availableLanguageOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceOptionsForSelectedOption___block_invoke;
  v9[3] = &unk_1EA72A578;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __86__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceOptionsForSelectedOption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "recognitionLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recognitionLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(v3, "outputLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "outputLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)preferredOutputVoiceAccentOptionsForSelectedOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HFAccessorySettingSiriLanguageAdapter availableLanguageOptions](self, "availableLanguageOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "recognitionLanguage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recognitionLanguage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          objc_msgSend(v11, "outputLanguage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v15, &__block_literal_global_46_2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_2;
  v23[3] = &unk_1EA72A620;
  v24 = v4;
  v19 = v4;
  objc_msgSend(v18, "na_map:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

id __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_3;
  v6[3] = &unk_1EA72A578;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_47_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "anyObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

uint64_t __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CFE900];
  v4 = a2;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outputVoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceSimilarToVoice:inSiriSessionLanguage:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "voiceNameWithDefaultFallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  return v11;
}

uint64_t __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDefaultVoiceForRecognitionLanguage");
}

- (NAFuture)languageSettingFuture
{
  void *v2;
  void *v3;

  -[HFAccessorySettingAdapter settingWatchFutureForKeyPath:](self, "settingWatchFutureForKeyPath:", CFSTR("root.siri.language"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_50_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v3;
}

id __62__HFAccessorySettingSiriLanguageAdapter_languageSettingFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  v4 = objc_opt_class();
  v5 = v2;
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  objc_msgSend(v3, "futureWithResult:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_reloadLanguagesFromHomeKitNotifyingObservers:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  id location;

  objc_initWeak(&location, self);
  -[HFAccessorySettingSiriLanguageAdapter languageSettingFuture](self, "languageSettingFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__HFAccessorySettingSiriLanguageAdapter__reloadLanguagesFromHomeKitNotifyingObservers___block_invoke;
  v8[3] = &unk_1EA72A6B0;
  objc_copyWeak(&v9, &location);
  v10 = a3;
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __87__HFAccessorySettingSiriLanguageAdapter__reloadLanguagesFromHomeKitNotifyingObservers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  v50 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __87__HFAccessorySettingSiriLanguageAdapter__reloadLanguagesFromHomeKitNotifyingObservers___block_invoke_2;
  v42[3] = &unk_1EA72A688;
  v42[4] = WeakRetained;
  v7 = v3;
  v43 = v7;
  v44 = &v45;
  objc_msgSend(v6, "na_map:", v42);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "availableLanguageOptions");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v10 == v11)
  {
    v12 = 1;
  }
  else if (v10)
  {
    v12 = objc_msgSend(v10, "isEqual:", v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(WeakRetained, "setAvailableLanguageOptions:", v11);
  objc_msgSend(WeakRetained, "selectedLanguageOption");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v46[5];
  v15 = v13;
  v16 = v14;
  if (v15 == v16)
  {
    v17 = 1;
  }
  else if (v15)
  {
    v17 = objc_msgSend(v15, "isEqual:", v16);
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(WeakRetained, "setSelectedLanguageOption:", v46[5]);
  if ((v12 & 1) == 0 && *(_BYTE *)(a1 + 40))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(WeakRetained, "observers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    v32 = a1;
    v33 = v7;
    if (v20)
    {
      v21 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v23, "siriLanguageAdapter:availableLanguageOptionsDidChange:", WeakRetained, v11);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      }
      while (v20);
    }

    a1 = v32;
    v7 = v33;
  }
  if ((v17 & 1) == 0 && *(_BYTE *)(a1 + 40))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(WeakRetained, "observers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v29, "siriLanguageAdapter:selectedLanguageOptionDidChange:", WeakRetained, v46[5]);
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
      }
      while (v26);
    }

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", v32, v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v45, 8);
  return v30;
}

HFSiriLanguageOption *__87__HFAccessorySettingSiriLanguageAdapter__reloadLanguagesFromHomeKitNotifyingObservers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  HFSiriLanguageOption *v5;
  void *v6;
  void *v7;
  int v8;

  v3 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFSiriLanguageOption initWithSerializedRepresentation:]([HFSiriLanguageOption alloc], "initWithSerializedRepresentation:", v4);
  objc_msgSend(*(id *)(a1 + 32), "valueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForSetting:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v3);

  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);

  return v5;
}

- (id)_beginMonitoringSettingsKeyPath:(id)a3
{
  return -[HFAccessorySettingSiriLanguageAdapter _reloadLanguagesFromHomeKitNotifyingObservers:](self, "_reloadLanguagesFromHomeKitNotifyingObservers:", 1);
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  HFUserItem *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HFUserItem *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("root.siri.personalRequests"));

  if (v6)
  {
    -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isContainedWithinItemGroup");

    if ((v8 & 1) == 0)
    {
      v13 = [HFUserItem alloc];
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v16, "home");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17, "currentUser");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HFUserItem initWithHome:user:nameStyle:](v13, "initWithHome:user:nameStyle:", v15, v18, 0);

      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = objc_msgSend(v21, "hf_currentUserIsOwner");

      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      self = (HFAccessorySettingSiriLanguageAdapter *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingAdapter home](self, "home");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v22, "hf_currentUserIsAdministrator");

      LODWORD(self) = v16 | v17 & -[HFUserItem isIdentifyVoiceEnabled](v19, "isIdentifyVoiceEnabled");
      goto LABEL_15;
    }
  }
  objc_msgSend(v4, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("root.siri.identifyVoice"));

  if ((v10 & 1) == 0)
  {
    -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isContainedWithinItemGroup");

    if ((v12 & 1) != 0)
    {
      LOBYTE(self) = 0;
      goto LABEL_16;
    }
    objc_msgSend(v4, "keyPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("root.siri.recognitionLanguage"));

    if (v24)
    {
      -[HFAccessorySettingSiriLanguageAdapter selectedLanguageOption](self, "selectedLanguageOption");
      v19 = (HFUserItem *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingSiriLanguageAdapter preferredRecognitionLanguageOptionsForSelectedOption:](self, "preferredRecognitionLanguageOptionsForSelectedOption:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = (unint64_t)objc_msgSend(v25, "count") > 1;
    }
    else
    {
      objc_msgSend(v4, "keyPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("root.siri.outputVoice"));

      if (!v27)
        goto LABEL_4;
      -[HFAccessorySettingSiriLanguageAdapter selectedLanguageOption](self, "selectedLanguageOption");
      v19 = (HFUserItem *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingSiriLanguageAdapter preferredOutputVoiceOptionsForSelectedOption:](self, "preferredOutputVoiceOptionsForSelectedOption:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v25, "count") > 1)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        -[HFAccessorySettingSiriLanguageAdapter selectedLanguageOption](self, "selectedLanguageOption");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFAccessorySettingSiriLanguageAdapter preferredOutputVoiceAccentOptionsForSelectedOption:](self, "preferredOutputVoiceAccentOptionsForSelectedOption:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(self) = (unint64_t)objc_msgSend(v29, "count") > 1;

      }
    }

LABEL_15:
    goto LABEL_16;
  }
LABEL_4:
  LOBYTE(self) = 1;
LABEL_16:

  return (char)self;
}

- (NSSet)availableLanguageOptions
{
  return self->_availableLanguageOptions;
}

- (void)setAvailableLanguageOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (HFSiriLanguageOption)selectedLanguageOption
{
  return self->_selectedLanguageOption;
}

- (void)setSelectedLanguageOption:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLanguageOption, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_selectedLanguageOption, 0);
  objc_storeStrong((id *)&self->_availableLanguageOptions, 0);
}

@end
