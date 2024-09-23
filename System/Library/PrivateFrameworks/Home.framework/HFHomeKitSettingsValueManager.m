@implementation HFHomeKitSettingsValueManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionStacks, 0);
  objc_storeStrong((id *)&self->_homeKitObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (HFHomeKitSettingsValueManager)initWithSettings:(id)a3 homeKitObjectIdentifiers:(id)a4
{
  id v8;
  id v9;
  HFHomeKitSettingsValueManager *v10;
  HFHomeKitSettingsValueManager *v11;
  uint64_t v12;
  NSMutableDictionary *transactionStacks;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomeKitSettingsValueManager.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

  }
  v16.receiver = self;
  v16.super_class = (Class)HFHomeKitSettingsValueManager;
  v10 = -[HFHomeKitSettingsValueManager init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_settings, a3);
    v12 = objc_opt_new();
    transactionStacks = v11->_transactionStacks;
    v11->_transactionStacks = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_homeKitObjectIdentifiers, a4);
  }

  return v11;
}

- (id)changeValueForSetting:(id)a3 toValue:(id)a4
{
  return -[HFHomeKitSettingsValueManager changeValueForSetting:toValue:changeType:](self, "changeValueForSetting:toValue:changeType:", a3, a4, 0);
}

- (id)changeValueForSetting:(id)a3 toValue:(id)a4 changeType:(unint64_t)a5
{
  id v8;
  _HFHomeKitSettingsVendorSettingsWriteValueTransaction *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id location;
  _BYTE buf[24];
  void *v47;
  id v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v37 = a4;
  if (v8)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    -[HFHomeKitSettingsValueManager _valueForSetting:logRead:](self, "_valueForSetting:logRead:", v8, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction initWithSetting:previousValue:value:changeType:]([_HFHomeKitSettingsVendorSettingsWriteValueTransaction alloc], "initWithSetting:previousValue:value:changeType:", v8, v36, v37, a5);
    -[HFHomeKitSettingsValueManager transactionStacks](self, "transactionStacks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_objectForKey:withDefaultValue:", v11, &__block_literal_global_136);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x39uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "--> Queueing write transaction %@", buf, 0xCu);
    }

    v14 = objc_msgSend(v12, "count");
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      if ((unint64_t)objc_msgSend(v12, "count") >= 3)
        NSLog(CFSTR("More than one queued transaction on the stack for setting %@! This should not happen. Stack: %@"), v8, v12);
      objc_msgSend(v12, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HFLogForCategory(0x39uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_INFO, "--> Discarding queued write transaction %@", buf, 0xCu);
      }

      objc_msgSend(v15, "settingWriteFuture");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cancel");

      if (objc_msgSend(v12, "containsObject:", v15))
        NSLog(CFSTR("Cancelled transaction %@, but the transaction was not removed from the stack!"), v15);

    }
    objc_msgSend(v12, "addObject:", v9);
    -[HFHomeKitSettingsValueManager settings](self, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitSettingsValueManager homeKitObjectIdentifiers](self, "homeKitObjectIdentifiers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    v21 = v19;
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __HFHomeKitSettingsValueManagerDispatchWillWriteValueForSettings_block_invoke;
    v47 = &unk_1EA737A98;
    v48 = v20;
    v49 = v21;
    v23 = v21;
    v24 = v20;
    objc_msgSend(v22, "dispatchHomeKitSettingMessage:sender:", buf, 0);

    if (v14)
    {
      HFLogForCategory(0x39uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_INFO, "--> Deferring execution for write transaction %@, as there is already a transaction in-flight (%@)", buf, 0x16u);

      }
    }
    else
    {
      -[HFHomeKitSettingsValueManager _executeNextPendingWriteForSetting:](self, "_executeNextPendingWriteForSetting:", v8);
    }
    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, self);
    -[_HFHomeKitSettingsVendorSettingsWriteValueTransaction settingWriteFuture](v9, "settingWriteFuture");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __74__HFHomeKitSettingsValueManager_changeValueForSetting_toValue_changeType___block_invoke_109;
    v38[3] = &unk_1EA737A48;
    objc_copyWeak(&v43, &location);
    objc_copyWeak(&v44, (id *)buf);
    v31 = v24;
    v39 = v31;
    v32 = v23;
    v40 = v32;
    v33 = v35;
    v41 = v33;
    v42 = v8;
    objc_msgSend(v30, "addCompletionBlock:", v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithError:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v29;
}

id __74__HFHomeKitSettingsValueManager_changeValueForSetting_toValue_changeType___block_invoke()
{
  return (id)objc_opt_new();
}

void __74__HFHomeKitSettingsValueManager_changeValueForSetting_toValue_changeType___block_invoke_109(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  _BYTE v32[24];
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v6 = objc_loadWeakRetained((id *)(a1 + 72));
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transactionStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v4)
  {
    objc_msgSend(v6, "setError:", v4);
    objc_msgSend(WeakRetained, "_clearTransaction:", v6);
    v11 = objc_msgSend(v4, "na_isCancelledError");
    HFLogForCategory(0x39uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v32 = 138412290;
        *(_QWORD *)&v32[4] = v6;
        _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_INFO, "--> Cancelled write transaction %@", v32, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v32 = 138412802;
        *(_QWORD *)&v32[4] = v6;
        *(_WORD *)&v32[12] = 2048;
        *(_QWORD *)&v32[14] = v10;
        *(_WORD *)&v32[22] = 2112;
        v33 = v4;
        _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "--> FAILED write transaction %@ (Execution Time: %.3f) error: %@", v32, 0x20u);
      }

      v24 = *(void **)(a1 + 40);
      v25 = *(void **)(a1 + 48);
      v26 = *(id *)(a1 + 32);
      v27 = v24;
      v28 = v25;
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v32 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v32[8] = 3221225472;
      *(_QWORD *)&v32[16] = __HFHomeKitSettingsValueManagerDispatchDidWriteValueForSettings_block_invoke;
      v33 = &unk_1EA737AC0;
      v34 = v26;
      v35 = 0;
      v36 = v27;
      v37 = v28;
      v30 = v28;
      v31 = v27;
      v13 = v26;
      objc_msgSend(v29, "dispatchHomeKitSettingMessage:sender:", v32, 0);

    }
  }
  else
  {
    HFLogForCategory(0x39uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138412546;
      *(_QWORD *)&v32[4] = v6;
      *(_WORD *)&v32[12] = 2048;
      *(_QWORD *)&v32[14] = v10;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "--> Finished write transaction for %@ (Execution Time: %.3f)", v32, 0x16u);
    }

    v15 = *(void **)(a1 + 40);
    v16 = *(void **)(a1 + 48);
    v17 = *(id *)(a1 + 32);
    v18 = v15;
    v19 = v16;
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v32 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v32[8] = 3221225472;
    *(_QWORD *)&v32[16] = __HFHomeKitSettingsValueManagerDispatchDidWriteValueForSettings_block_invoke;
    v33 = &unk_1EA737AC0;
    v34 = v17;
    v35 = v18;
    v36 = 0;
    v37 = v19;
    v21 = v19;
    v22 = v18;
    v23 = v17;
    objc_msgSend(v20, "dispatchHomeKitSettingMessage:sender:", v32, 0);

    objc_msgSend(WeakRetained, "_clearTransaction:", v6);
  }
  objc_msgSend(WeakRetained, "_executeNextPendingWriteForSetting:", *(_QWORD *)(a1 + 56));

}

- (void)_executeNextPendingWriteForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFHomeKitSettingsValueManager transactionStacks](self, "transactionStacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v7, "count") != 1)
      NSLog(CFSTR("More than one queued transaction on the stack for setting %@! This should not happen. Stack: %@"), v4, v7);
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hasStarted") & 1) == 0)
    {
      HFLogForCategory(0x39uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "--> Executing pending write transaction %@", buf, 0xCu);
      }

      objc_msgSend(v8, "setStarted:", 1);
      objc_opt_class();
      v10 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      if (v12 && objc_msgSend(v8, "changeType") == 1)
      {
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "settingWriteFuture");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorOnlyCompletionHandlerAdapter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "replaceItems:withItems:completionHandler:", v13, v14, v16);

      }
      else
      {
        objc_msgSend(v8, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "settingWriteFuture");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorOnlyCompletionHandlerAdapter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateValue:completionHandler:", v13, v15);
      }

    }
  }

}

- (id)valueForSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFHomeKitSettingsValueManager _valueForSetting:logRead:](self, "_valueForSetting:logRead:", v4, +[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_valueForSetting:(id)a3 logRead:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitSettingsValueManager transactionStacks](self, "transactionStacks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("Transaction");
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(v7, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("Settings");
    if (!v4)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CBA7F0], "hf_debugDescriptionForValue:keyPath:", v13, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x39uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = v18;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEBUG, "--> (%@) Reading %@ Value for %@ (%@)", (uint8_t *)&v19, 0x2Au);

  }
LABEL_8:

  return v13;
}

- (id)valueForSettingAtKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFHomeKitSettingsValueManager settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HFHomeKitSettingsValueManager valueForSetting:](self, "valueForSetting:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSSet)pendingWrites
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  -[HFHomeKitSettingsValueManager transactionStacks](self, "transactionStacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HFHomeKitSettingsValueManager_pendingWrites__block_invoke;
  v8[3] = &unk_1EA737A70;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "na_each:", v8);

  return (NSSet *)v6;
}

void __46__HFHomeKitSettingsValueManager_pendingWrites__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);

}

- (void)_clearTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HFHomeKitSettingsValueManager transactionStacks](self, "transactionStacks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x39uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_INFO, "--> Clearing transaction %@", buf, 0xCu);
    }

    if ((objc_msgSend(v8, "containsObject:", v4) & 1) == 0)
      NSLog(CFSTR("Tried to clear transactionStack for non-existant transaction %@"), v4);
    objc_msgSend(v8, "removeObject:", v4);
    HFLogForCategory(0x39uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_INFO, "--> Cleared transaction %@", buf, 0xCu);
    }

    if (!objc_msgSend(v8, "count"))
    {
      HFLogForCategory(0x39uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_INFO, "--> Tearing down transactionStack for setting key path '%@'", buf, 0xCu);
      }

      objc_msgSend(v5, "removeObjectForKey:", v7);
    }

  }
}

- (HMSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (NSSet)homeKitObjectIdentifiers
{
  return self->_homeKitObjectIdentifiers;
}

- (void)setHomeKitObjectIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitObjectIdentifiers, a3);
}

- (NSMutableDictionary)transactionStacks
{
  return self->_transactionStacks;
}

- (void)setTransactionStacks:(id)a3
{
  objc_storeStrong((id *)&self->_transactionStacks, a3);
}

@end
