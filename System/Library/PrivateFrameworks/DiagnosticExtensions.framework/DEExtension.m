@implementation DEExtension

- (DEExtension)initWithNSExtension:(id)a3
{
  id v5;
  char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DEExtension;
  v6 = -[DEExtension init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DEAttachmentsName"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v8;

    objc_storeStrong((id *)v6 + 7, a3);
    objc_msgSend(v5, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v10;

    objc_msgSend(v5, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DEAttachmentsAllowUserSelection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v6[8] = objc_msgSend(v13, "BOOLValue");
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v15 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v14;

    *(_WORD *)(v6 + 9) = 0;
    *((_QWORD *)v6 + 9) = 0;
    objc_msgSend(*((id *)v6 + 7), "setRequestCompletionBlock:", &__block_literal_global_1);
    objc_msgSend(*((id *)v6 + 7), "setRequestCancellationBlock:", &__block_literal_global_52);
    Log_0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[DEExtension initWithNSExtension:].cold.2(v5);

    Log_0();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[DEExtension initWithNSExtension:].cold.1(v5);

  }
  return (DEExtension *)v6;
}

void __35__DEExtension_initWithNSExtension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  Log_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A4EEE000, v6, OS_LOG_TYPE_INFO, "%@ completed request - items: %@", (uint8_t *)&v7, 0x16u);
  }

}

void __35__DEExtension_initWithNSExtension___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  Log_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1A4EEE000, v6, OS_LOG_TYPE_INFO, "%@ cancelled request - error: %@", (uint8_t *)&v8, 0x16u);

  }
}

- (BOOL)isLoggingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  BOOL v28;
  int v29;
  NSObject *v31;
  id v32;
  void *v33;
  __CFString *v34;
  Boolean keyExistsAndHasValidFormat;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[DEExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DEAttachmentsLoggingEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
      goto LABEL_3;
    Log_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Logging is disabled in plist";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("DEAttachmentsLoggingInternal")))
    {
      if (MGGetBoolAnswer())
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", CFSTR("RCInternalMode"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "integerValue"))
        {

          goto LABEL_3;
        }
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForKey:", CFSTR("RCInternalMode"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");

        if (v10 == 2)
        {
LABEL_3:
          v5 = 1;
          goto LABEL_38;
        }
      }
      Log_0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Logging disabled. Requires internal install";
LABEL_36:
        _os_log_impl(&dword_1A4EEE000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      }
    }
    else
    {
      Log_0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Logging disabled. Misconfigured plist (1)";
        goto LABEL_36;
      }
    }
LABEL_37:

    v5 = 0;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    Log_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Logging disabled. Misconfigured plist (2)";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  v13 = v4;
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  CFPreferencesAppSynchronize(v16);
  v34 = (__CFString *)v16;
  objc_msgSend(v13, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v17, "allKeys");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v19)
  {
    v20 = v19;
    v32 = v13;
    v33 = v4;
    v21 = 0;
    v22 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", v24, v32, v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          keyExistsAndHasValidFormat = 0;
          v26 = v24;
          v27 = v34;
          if (CFPreferencesGetAppBooleanValue(v26, v27, &keyExistsAndHasValidFormat))
            v28 = keyExistsAndHasValidFormat == 0;
          else
            v28 = 1;
          v29 = !v28;
          if (objc_msgSend(v25, "BOOLValue") != v29)
          {
            Log_0();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v41 = v27;
              v42 = 2114;
              v43 = v26;
              _os_log_impl(&dword_1A4EEE000, v31, OS_LOG_TYPE_DEFAULT, "Logging is disabled per domain [%{public}@] key [%{public}@]", buf, 0x16u);
            }

            v13 = v32;
            v4 = v33;
            goto LABEL_45;
          }
          v21 = 1;
        }

      }
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v20)
        continue;
      break;
    }

    v13 = v32;
    v4 = v33;
    if ((v21 & 1) != 0)
    {
      v5 = 1;
      goto LABEL_46;
    }
  }
  else
  {

  }
  Log_0();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4EEE000, v18, OS_LOG_TYPE_DEFAULT, "Logging is disabled per domain preference", buf, 2u);
  }
LABEL_45:

  v5 = 0;
LABEL_46:

LABEL_38:
  return v5;
}

- (void)endUsingExtension
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[DEExtension serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__DEExtension_endUsingExtension__block_invoke;
  v4[3] = &unk_1E4E350B0;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__DEExtension_endUsingExtension__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  int v26;
  NSObject *v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "adoptsExtensionTrackerFlow");

    if ((v6 & 1) != 0)
      goto LABEL_6;
    v7 = objc_loadWeakRetained(v1);
    v8 = objc_msgSend(v7, "callCount") - 1;
    v9 = objc_loadWeakRetained(v1);
    objc_msgSend(v9, "setCallCount:", v8);

    v10 = objc_loadWeakRetained(v1);
    v11 = objc_msgSend(v10, "callCount");

    if (v11 < 1)
    {
LABEL_6:
      Log_0();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_loadWeakRetained(v1);
        objc_msgSend(v18, "extension");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v20;
        _os_log_impl(&dword_1A4EEE000, v17, OS_LOG_TYPE_DEFAULT, "Ending using extension %{public}@", (uint8_t *)&v28, 0xCu);

      }
      v21 = objc_loadWeakRetained(v1);
      objc_msgSend(v21, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_UUID");
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v23 = objc_loadWeakRetained(v1);
        objc_msgSend(v23, "extension");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cancelExtensionRequestWithIdentifier:", v12);

        v25 = objc_loadWeakRetained(v1);
        objc_msgSend(v25, "setContext:", 0);

      }
    }
    else
    {
      Log_0();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_loadWeakRetained(v1);
        objc_msgSend(v13, "extension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_loadWeakRetained(v1);
        v28 = 138543618;
        v29 = v15;
        v30 = 2048;
        v31 = objc_msgSend(v16, "callCount");
        _os_log_impl(&dword_1A4EEE000, v12, OS_LOG_TYPE_DEFAULT, "[Legacy] Extension %{public}@ is done, but there's [%ld] other executions in flight.", (uint8_t *)&v28, 0x16u);

      }
    }
  }
  else
  {
    v26 = objc_msgSend(v4, "isFetchingExtensionHostContext");

    if (v26)
    {
      Log_0();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __32__DEExtension_endUsingExtension__block_invoke_cold_2(v1, v27);

    }
    Log_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __32__DEExtension_endUsingExtension__block_invoke_cold_1(v1, v12);
  }

}

- (void)createExtensionHostContextCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[DEExtension extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__DEExtension_createExtensionHostContextCompletion___block_invoke;
  v7[3] = &unk_1E4E353F8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "beginExtensionRequestWithInputItems:completion:", MEMORY[0x1E0C9AA60], v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char isKindOfClass;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_extensionContextForUUID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "setContext:", v9);

    v11 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v13, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        Log_0();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_3((id *)(a1 + 40), v16);

        v17 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v17, "setContext:", 0);

      }
      v18 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v18, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_auxiliaryConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForEntitlement:", CFSTR("com.apple.DiagnosticExtensions.extension"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        Log_0();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_2(v22);

        v23 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v23, "setContext:", 0);

      }
    }
  }
  if (v6)
  {
    Log_0();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_1(v6, v24);

  }
  v25 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v25, "extension");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __52__DEExtension_createExtensionHostContextCompletion___block_invoke_63;
  v39[3] = &unk_1E4E353A8;
  v29 = v27;
  v40 = v29;
  objc_copyWeak(&v41, (id *)(a1 + 40));
  v30 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v30, "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_auxiliaryConnection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setInvalidationHandler:", v39);

  v37[0] = v28;
  v37[1] = 3221225472;
  v37[2] = __52__DEExtension_createExtensionHostContextCompletion___block_invoke_64;
  v37[3] = &unk_1E4E353D0;
  v33 = v29;
  v38 = v33;
  v34 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v34, "context");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_auxiliaryConnection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setInterruptionHandler:", v37);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_destroyWeak(&v41);

}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_63(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A4EEE000, v2, OS_LOG_TYPE_INFO, "Connection was invalidated for extension [%{public}@]", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setContext:", 0);

}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_64(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A4EEE000, v2, OS_LOG_TYPE_INFO, "Connection was interrupted for extension [%{public}@]", (uint8_t *)&v4, 0xCu);
  }

}

- (OS_dispatch_queue)serialQueue
{
  DEExtension *v2;
  void *v3;
  id v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_serialQueue)
  {
    -[DEExtension identifier](v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".serialQueue"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

  }
  objc_sync_exit(v2);

  return v2->_serialQueue;
}

- (void)performWithHostContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[DEExtension serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DEExtension_performWithHostContext___block_invoke;
  block[3] = &unk_1E4E35498;
  objc_copyWeak(&v12, &location);
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __38__DEExtension_performWithHostContext___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    Log_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[4], "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = (uint64_t)v6;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_1A4EEE000, v5, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Firing handler for existing context: [%{public}@], DE [%{public}@]", buf, 0x16u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__DEExtension_performWithHostContext___block_invoke_67;
    block[3] = &unk_1E4E35420;
    v8 = a1[5];
    v27 = a1[6];
    objc_copyWeak(&v28, v2);
    dispatch_async(v8, block);
    objc_destroyWeak(&v28);

  }
  else
  {
    v9 = objc_loadWeakRetained(v2);
    v10 = objc_msgSend(v9, "isFetchingExtensionHostContext");

    Log_0();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4EEE000, v11, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Is fetching context, will store handler.", buf, 2u);
      }

      v13 = objc_loadWeakRetained(v2);
      objc_msgSend(v13, "contextFetchHandlers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1A85AB6F4](a1[6]);
      objc_msgSend(v14, "addObject:", v15);

      Log_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_loadWeakRetained(v2);
        objc_msgSend(v17, "contextFetchHandlers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 134217984;
        v30 = v19;
        _os_log_impl(&dword_1A4EEE000, v16, OS_LOG_TYPE_INFO, "performWithHostContext - Stored context fetch handlers [%lu]", buf, 0xCu);

      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4EEE000, v11, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Will create extension host.", buf, 2u);
      }

      v20 = objc_loadWeakRetained(v2);
      objc_msgSend(v20, "setIsFetchingExtensionHostContext:", 1);

      v21 = objc_loadWeakRetained(v2);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __38__DEExtension_performWithHostContext___block_invoke_68;
      v22[3] = &unk_1E4E35470;
      v22[4] = a1[4];
      objc_copyWeak(&v25, v2);
      v23 = a1[5];
      v24 = a1[6];
      objc_msgSend(v21, "createExtensionHostContextCompletion:", v22);

      objc_destroyWeak(&v25);
    }
  }
}

void __38__DEExtension_performWithHostContext___block_invoke_67(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __38__DEExtension_performWithHostContext___block_invoke_68(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1[4], "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DEExtension_performWithHostContext___block_invoke_2;
  block[3] = &unk_1E4E35448;
  objc_copyWeak(&v6, a1 + 7);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __38__DEExtension_performWithHostContext___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[4];
  id v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setIsFetchingExtensionHostContext:", 0);

  Log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v6;
    v32 = 2114;
    v33 = v8;
    _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Created extension host: [%{public}@] for [%{public}@]", buf, 0x16u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DEExtension_performWithHostContext___block_invoke_69;
  block[3] = &unk_1E4E35420;
  v9 = *(NSObject **)(a1 + 32);
  v27 = *(id *)(a1 + 40);
  objc_copyWeak(&v28, v2);
  dispatch_async(v9, block);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "contextFetchHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        Log_0();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4EEE000, v16, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Executing stored context fetch handler", buf, 2u);
        }

        v17 = *(NSObject **)(a1 + 32);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __38__DEExtension_performWithHostContext___block_invoke_70;
        v20[3] = &unk_1E4E35420;
        v20[4] = v15;
        objc_copyWeak(&v21, v2);
        dispatch_async(v17, v20);
        objc_destroyWeak(&v21);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    }
    while (v12);
  }

  v18 = objc_loadWeakRetained(v2);
  objc_msgSend(v18, "contextFetchHandlers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  objc_destroyWeak(&v28);
}

void __38__DEExtension_performWithHostContext___block_invoke_69(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __38__DEExtension_performWithHostContext___block_invoke_70(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

- (void)attachmentListWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__DEExtension_attachmentListWithHandler___block_invoke;
  v6[3] = &unk_1E4E354E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[DEExtension performWithHostContext:](self, "performWithHostContext:", v6);

}

void __41__DEExtension_attachmentListWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (v3 && objc_msgSend(*(id *)(a1 + 32), "isLoggingEnabled"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__DEExtension_attachmentListWithHandler___block_invoke_2;
    v5[3] = &unk_1E4E354C0;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "attachmentListWithHandler:", v5);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

uint64_t __41__DEExtension_attachmentListWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)attachmentsForParameters:(id)a3 andHandler:(id)a4
{
  -[DEExtension attachmentsForParameters:withProgressHandler:andHandler:](self, "attachmentsForParameters:withProgressHandler:andHandler:", a3, 0, a4);
}

- (void)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[DEExtension adoptsExtensionTrackerFlow](self, "adoptsExtensionTrackerFlow");
  v12 = MEMORY[0x1E0C809B0];
  if (!v11)
  {
    -[DEExtension serialQueue](self, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke;
    block[3] = &unk_1E4E353D0;
    block[4] = self;
    dispatch_sync(v13, block);

  }
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke_73;
  v17[3] = &unk_1E4E35538;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  -[DEExtension performWithHostContext:](self, "performWithHostContext:", v17);

}

void __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCallCount:", objc_msgSend(*(id *)(a1 + 32), "callCount") + 1);
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "callCount");
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 134218242;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1A4EEE000, v2, OS_LOG_TYPE_INFO, "[Legacy] attachmentsForParameters:withProgressHandler was called [%ld] times for [%{public}@].", (uint8_t *)&v5, 0x16u);

  }
}

void __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  if (v3 && objc_msgSend(*(id *)(a1 + 32), "isLoggingEnabled"))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke_2;
    v8[3] = &unk_1E4E35510;
    v6 = *(id *)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    objc_msgSend(v3, "attachmentsForParameters:withProgressHandler:withHandler:", v4, v5, v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }

}

void __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  if ((objc_msgSend(*(id *)(a1 + 32), "adoptsExtensionTrackerFlow") & 1) == 0)
  {
    Log_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A4EEE000, v5, OS_LOG_TYPE_INFO, "Host is using legacy DE flow without setup/teardown; ending extension.",
        v6,
        2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "endUsingExtension");
  }

}

- (void)setupWithParameters:(id)a3 session:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 7200.0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[DEExtension setupWithParameters:session:expirationDate:](self, "setupWithParameters:session:expirationDate:", v8, v7, v10);
}

- (void)setupWithParameters:(id)a3 session:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[DEExtension identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v22 = "-[DEExtension setupWithParameters:session:expirationDate:]";
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v12;
    v27 = 2114;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_1A4EEE000, v11, OS_LOG_TYPE_DEFAULT, "%s, parameters:%@, identifier:%@, sessionID:%{public}@, date:%@", buf, 0x34u);

  }
  -[DEExtension setAdoptsExtensionTrackerFlow:](self, "setAdoptsExtensionTrackerFlow:", 1);
  v13 = -[DEExtension extensionTrackerClass](self, "extensionTrackerClass");
  -[DEExtension identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[objc_class shouldSetupWithIdentifier:session:expirationDate:](v13, "shouldSetupWithIdentifier:session:expirationDate:", v14, v9, v10);

  Log_0();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4EEE000, v17, OS_LOG_TYPE_DEFAULT, "DEExtension: Start setupForParameters:", buf, 2u);
    }

    -[DEExtension installLoggingProfileWithSessionID:](self, "installLoggingProfileWithSessionID:", v9);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__DEExtension_setupWithParameters_session_expirationDate___block_invoke;
    v19[3] = &unk_1E4E35580;
    v20 = v8;
    -[DEExtension performWithHostContext:](self, "performWithHostContext:", v19);
    v17 = v20;
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    -[DEExtension identifier](self, "identifier");
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v18;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1A4EEE000, v17, OS_LOG_TYPE_INFO, "DEExtension: already called setup method for %@, %@", buf, 0x16u);

  }
}

uint64_t __58__DEExtension_setupWithParameters_session_expirationDate___block_invoke(uint64_t result, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "setupForParameters:withHandler:", *(_QWORD *)(result + 32), &__block_literal_global_75);
  return result;
}

void __58__DEExtension_setupWithParameters_session_expirationDate___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  Log_0();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4EEE000, v0, OS_LOG_TYPE_DEFAULT, "DEExtension: Done setupForParameters:", v1, 2u);
  }

}

- (void)teardownWithParameters:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  _QWORD v16[4];
  NSObject *v17;
  DEExtension *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Log_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[DEExtension identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v20 = "-[DEExtension teardownWithParameters:session:]";
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v9;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_1A4EEE000, v8, OS_LOG_TYPE_DEFAULT, "%s parameters:%@, identifier:%@, sessionID:%{public}@", buf, 0x2Au);

  }
  v10 = -[DEExtension extensionTrackerClass](self, "extensionTrackerClass");
  -[DEExtension identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[objc_class shouldTeardownWithIdentifier:session:](v10, "shouldTeardownWithIdentifier:session:", v11, v7);

  Log_0();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4EEE000, v14, OS_LOG_TYPE_DEFAULT, "DEExtension: Start teardownWithParameters:", buf, 2u);
    }

    -[DEExtension removeLoggingProfileWithSessionID:](self, "removeLoggingProfileWithSessionID:", v7);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46__DEExtension_teardownWithParameters_session___block_invoke;
    v16[3] = &unk_1E4E355A8;
    v17 = v6;
    v18 = self;
    -[DEExtension performWithHostContext:](self, "performWithHostContext:", v16);
    v14 = v17;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[DEExtension identifier](self, "identifier");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v15;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1A4EEE000, v14, OS_LOG_TYPE_INFO, "DEExtension is still needed. Teardown method is not called for %@, %@", buf, 0x16u);

  }
}

uint64_t __46__DEExtension_teardownWithParameters_session___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  _QWORD v3[5];

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __46__DEExtension_teardownWithParameters_session___block_invoke_2;
    v3[3] = &unk_1E4E353D0;
    v2 = *(_QWORD *)(result + 32);
    v3[4] = *(_QWORD *)(result + 40);
    return objc_msgSend(a2, "teardownForParameters:withHandler:", v2, v3);
  }
  return result;
}

uint64_t __46__DEExtension_teardownWithParameters_session___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4EEE000, v2, OS_LOG_TYPE_DEFAULT, "DEExtension: Done teardownWithParameters:", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endUsingExtension");
}

- (BOOL)checkAndTeardown
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  BOOL v7;
  _QWORD v9[5];
  NSObject *v10;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Log_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[DEExtension checkAndTeardown]";
    _os_log_impl(&dword_1A4EEE000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__DEExtension_checkAndTeardown__block_invoke;
  v9[3] = &unk_1E4E35648;
  v9[4] = self;
  p_buf = &buf;
  v5 = v4;
  v10 = v5;
  -[DEExtension performWithHostContext:](self, "performWithHostContext:", v9);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __31__DEExtension_checkAndTeardown__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __31__DEExtension_checkAndTeardown__block_invoke_2;
    v6[3] = &unk_1E4E35620;
    v5 = (void *)a1[5];
    v4 = a1[6];
    v6[4] = a1[4];
    v9 = v4;
    v7 = v5;
    v8 = v3;
    objc_msgSend(v8, "isExtensionEnhancedLoggingStateOnWithHandler:", v6);

  }
}

void __31__DEExtension_checkAndTeardown__block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  Log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_DEFAULT, "DEExtension: %@ is NOT off. Will try to tear it down.", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __31__DEExtension_checkAndTeardown__block_invoke_76;
    v13[3] = &unk_1E4E355F8;
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v14 = v8;
    v15 = v9;
    v17 = *(_QWORD *)(a1 + 56);
    v16 = v10;
    objc_msgSend(v8, "teardownForParameters:withHandler:", MEMORY[0x1E0C9AA70], v13);

  }
  else
  {
    v11 = a2 ^ 1;
    if (v5)
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_DEFAULT, "DEExtension: %@ is already off.", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

void __31__DEExtension_checkAndTeardown__block_invoke_76(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__DEExtension_checkAndTeardown__block_invoke_2_77;
  v4[3] = &unk_1E4E355D0;
  v1 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 48);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "isExtensionEnhancedLoggingStateOnWithHandler:", v4);

}

intptr_t __31__DEExtension_checkAndTeardown__block_invoke_2_77(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  Log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("OFF");
    v6 = *(_QWORD *)(a1 + 32);
    if (a2)
      v5 = CFSTR("ON");
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_DEFAULT, "DEExtension: Final %@ EnhancedLoggingState is %@.", (uint8_t *)&v8, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 ^ 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[DEExtension context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DEExtension setCallCount:](self, "setCallCount:", 1);
    -[DEExtension endUsingExtension](self, "endUsingExtension");
  }
  v4.receiver = self;
  v4.super_class = (Class)DEExtension;
  -[DEExtension dealloc](&v4, sel_dealloc);
}

- (BOOL)requiresDataClassBAccessToRun
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  char v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[DEExtension cachedRequiresDataClassBAccessToRun](self, "cachedRequiresDataClassBAccessToRun");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DEExtension cachedRequiresDataClassBAccessToRun](self, "cachedRequiresDataClassBAccessToRun");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    return v5;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__DEExtension_requiresDataClassBAccessToRun__block_invoke;
    v9[3] = &unk_1E4E35670;
    v9[4] = &v10;
    -[DEExtension accessBundleWithSynchronousHandler:](self, "accessBundleWithSynchronousHandler:", v9);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v11 + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEExtension setCachedRequiresDataClassBAccessToRun:](self, "setCachedRequiresDataClassBAccessToRun:", v7);

    v8 = *((_BYTE *)v11 + 24);
    _Block_object_dispose(&v10, 8);
    return v8;
  }
}

void __44__DEExtension_requiresDataClassBAccessToRun__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("DERequiresClassBDataClass"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "BOOLValue");

}

- (void)accessBundleWithSynchronousHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[DEExtension extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_plugIn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0D7D420], "defaultHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__DEExtension_accessBundleWithSynchronousHandler___block_invoke;
  v15[3] = &unk_1E4E35698;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v7, "accessPlugIns:synchronously:flags:extensions:", v8, 1, 0, v15);

  if (v17[5])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(objc_retainAutorelease((id)v17[5]), "UTF8String");
      if (sandbox_extension_consume() == -1)
      {
        Log_0();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          -[DEExtension identifier](self, "identifier");
          objc_claimAutoreleasedReturnValue();
          -[DEExtension accessBundleWithSynchronousHandler:].cold.2();
        }
      }
      else
      {
        v9 = v6;
        v10 = (void *)MEMORY[0x1E0CB34D0];
        -[NSObject url](v9, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleWithURL:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v4[2](v4, v12);
        }
        else
        {
          Log_0();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            -[DEExtension identifier](self, "identifier");
            objc_claimAutoreleasedReturnValue();
            -[DEExtension accessBundleWithSynchronousHandler:].cold.3();
          }

        }
        sandbox_extension_release();

      }
    }
    else
    {
      Log_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        objc_claimAutoreleasedReturnValue();
        -[DEExtension accessBundleWithSynchronousHandler:].cold.4();
      }
    }
  }
  else
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[DEExtension identifier](self, "identifier");
      objc_claimAutoreleasedReturnValue();
      -[DEExtension accessBundleWithSynchronousHandler:].cold.1();
    }
  }

  _Block_object_dispose(&v16, 8);
}

void __50__DEExtension_accessBundleWithSynchronousHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    Log_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __50__DEExtension_accessBundleWithSynchronousHandler___block_invoke_cold_1(a1);

  }
  objc_msgSend(v3, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)localizedConsentTextWithLocalization:(id)a3
{
  return -[DEExtension _localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:](self, "_localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:", CFSTR("DELocalizedConsentText"), CFSTR("DELocalizedConsentFilename"), a3);
}

- (id)localizedDataCollectedExplanationWithLocalization:(id)a3
{
  return -[DEExtension _localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:](self, "_localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:", CFSTR("DELocalizedDataCollectedExplanationText"), CFSTR("DELocalizedDataCollectedExplanationFilename"), a3);
}

- (id)localizedDataCollectedSummaryWithLocalization:(id)a3
{
  return -[DEExtension _localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:](self, "_localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:", CFSTR("DELocalizedDataCollectedSummaryText"), 0, a3);
}

- (id)_localizedTextFromLocalizedStringKey:(id)a3 fallbackFileContentsKey:(id)a4 localization:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEExtension _localizedStringFromPlistWithKey:localization:](self, "_localizedStringFromPlistWithKey:localization:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    if (!v9)
    {
      v15 = 0;
      goto LABEL_8;
    }
    Log_0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[DEExtension _localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:].cold.1();

    -[DEExtension _fileContentsFromPlistWithKey:localization:](self, "_fileContentsFromPlistWithKey:localization:", v9, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v13;
LABEL_8:

  return v15;
}

- (id)_fileContentsFromPlistWithKey:(id)a3 localization:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__DEExtension__fileContentsFromPlistWithKey_localization___block_invoke;
  v12[3] = &unk_1E4E356C0;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[DEExtension accessBundleWithSynchronousHandler:](self, "accessBundleWithSynchronousHandler:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __58__DEExtension__fileContentsFromPlistWithKey_localization___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:subdirectory:localization:", v8, v9, 0, a1[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      Log_0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = a1[4];
        v13 = a1[5];
        *(_DWORD *)buf = 138544386;
        v23 = v12;
        v24 = 2114;
        v25 = v6;
        v26 = 2114;
        v27 = v8;
        v28 = 2114;
        v29 = v9;
        v30 = 2114;
        v31 = v13;
        _os_log_impl(&dword_1A4EEE000, v11, OS_LOG_TYPE_DEFAULT, "Cannot read file contents for key [%{public}@]: url [%{public}@] fileName [%{public}@] extension [%{public}@] localization [%{public}@]", buf, 0x34u);
      }

      objc_msgSend(v3, "URLForResource:withExtension:subdirectory:", v8, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v10, 4, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    if (v15)
    {
      Log_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = a1[4];
        v18 = (void *)a1[5];
        *(_DWORD *)buf = 138543874;
        v23 = v17;
        v24 = 2114;
        v25 = v18;
        v26 = 2114;
        v27 = v15;
        _os_log_error_impl(&dword_1A4EEE000, v16, OS_LOG_TYPE_ERROR, "Cannot read file contents for key [%{public}@]: localization [%{public}@] error [%{public}@]", buf, 0x20u);
      }
    }
    else
    {
      v19 = *(_QWORD *)(a1[6] + 8);
      v20 = v14;
      v16 = *(NSObject **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v20;
    }

  }
}

- (id)_localizedStringFromPlistWithKey:(id)a3 localization:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__DEExtension__localizedStringFromPlistWithKey_localization___block_invoke;
  v12[3] = &unk_1E4E356C0;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[DEExtension accessBundleWithSynchronousHandler:](self, "accessBundleWithSynchronousHandler:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __61__DEExtension__localizedStringFromPlistWithKey_localization___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = a1 + 4;
  objc_msgSend(v3, "localizedStringForKey:value:table:localization:", a1[4], &stru_1E4E35D68, CFSTR("InfoPlist"), a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length") || objc_msgSend(v5, "isEqualToString:", *v4))
  {
    Log_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __61__DEExtension__localizedStringFromPlistWithKey_localization___block_invoke_cold_1(a1 + 4, a1 + 5, v6);

    objc_msgSend(v3, "infoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", *v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  if (objc_msgSend(v5, "length"))
    v9 = v5;
  else
    v9 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v9);

}

- (Class)extensionTrackerClass
{
  return (Class)objc_opt_class();
}

- (void)installLoggingProfileWithSessionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DEExtension loggingProfileURLsFromExtension](self, "loggingProfileURLsFromExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = 0;
    +[DELoggingPreferences combinedLoggingPayloadForURLs:error:](DELoggingPreferences, "combinedLoggingPayloadForURLs:error:", v5, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v7)
    {
      v8 = v7;
      Log_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[DEExtension identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v4;
        v18 = 2114;
        v19 = v10;
        v20 = 2114;
        v21 = v8;
        v11 = "Error loading logging preference for sessionID [%{public}@] extension [%{public}@] : [%{public}@]";
LABEL_8:
        _os_log_error_impl(&dword_1A4EEE000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0x20u);

      }
    }
    else
    {
      -[DEExtension identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      +[DELoggingPreferences installLoggingProfile:sessionIdentifier:extensionIdentifier:error:](DELoggingPreferences, "installLoggingProfile:sessionIdentifier:extensionIdentifier:error:", v6, v4, v12, &v14);
      v8 = v14;

      Log_0();
      v13 = objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (!v8)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v17 = v6;
          _os_log_impl(&dword_1A4EEE000, v9, OS_LOG_TYPE_DEFAULT, "Installed logging preference payload [%{public}@]", buf, 0xCu);
        }
        v8 = 0;
        goto LABEL_12;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[DEExtension identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v4;
        v18 = 2114;
        v19 = v10;
        v20 = 2114;
        v21 = v8;
        v11 = "Error installing logging preference for sessionID [%{public}@] extension [%{public}@] : [%{public}@]";
        goto LABEL_8;
      }
    }
LABEL_12:

  }
}

- (void)removeLoggingProfileWithSessionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DEExtension identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  +[DELoggingPreferences removeLoggingProfileForSessionIdentifier:extensionIdentifier:error:](DELoggingPreferences, "removeLoggingProfileForSessionIdentifier:extensionIdentifier:error:", v4, v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v7)
  {
    Log_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[DEExtension identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v4;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1A4EEE000, v8, OS_LOG_TYPE_ERROR, "Error removing logging preference for sessionID [%{public}@] extension [%{public}@] : [%{public}@]", buf, 0x20u);

    }
  }
  else
  {
    if (!v6)
      goto LABEL_5;
    Log_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1A4EEE000, v8, OS_LOG_TYPE_DEFAULT, "Removed payload [%{public}@]", buf, 0xCu);
    }
  }

LABEL_5:
}

- (id)loggingProfileURLsFromExtension
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[16];
  uint8_t v29[128];
  uint8_t buf[4];
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[DEExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v3, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("DELoggingPreferenceSubsystems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[DEExtension loggingProfileURLsFromExtension].cold.1(v9);
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEExtension loggingProfileURLsFromExtension].cold.5(v9, v20, v21);
    goto LABEL_24;
  }
  if (!objc_msgSend(v8, "count"))
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v31 = CFSTR("DELoggingPreferenceSubsystems");
      _os_log_impl(&dword_1A4EEE000, v9, OS_LOG_TYPE_INFO, "%{public}@ is empty.", buf, 0xCu);
    }
LABEL_24:
    v19 = 0;
    goto LABEL_25;
  }
  v23 = v3;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", v15, CFSTR("plist"), 0);
          v16 = objc_claimAutoreleasedReturnValue();
          Log_0();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v16)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[DEExtension loggingProfileURLsFromExtension].cold.2();

            goto LABEL_31;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[DEExtension loggingProfileURLsFromExtension].cold.3((uint64_t)v28, (uint64_t)v16);

          -[NSObject addObject:](v9, "addObject:", v16);
        }
        else
        {
          Log_0();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[DEExtension loggingProfileURLsFromExtension].cold.4((uint64_t)buf, v15);
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (-[NSObject count](v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_31:
    v19 = 0;
  }
  v3 = v23;
LABEL_25:

  return v19;
}

- (NSString)attachmentsName
{
  return self->_attachmentsName;
}

- (void)setAttachmentsName:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentsName, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (DEExtensionHostContext)context
{
  return (DEExtensionHostContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)allowUserAttachmentSelection
{
  return self->_allowUserAttachmentSelection;
}

- (void)setAllowUserAttachmentSelection:(BOOL)a3
{
  self->_allowUserAttachmentSelection = a3;
}

- (NSString)loggingConsent
{
  return self->_loggingConsent;
}

- (void)setLoggingConsent:(id)a3
{
  objc_storeStrong((id *)&self->_loggingConsent, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSMutableArray)contextFetchHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContextFetchHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isFetchingExtensionHostContext
{
  return self->_isFetchingExtensionHostContext;
}

- (void)setIsFetchingExtensionHostContext:(BOOL)a3
{
  self->_isFetchingExtensionHostContext = a3;
}

- (BOOL)adoptsExtensionTrackerFlow
{
  return self->_adoptsExtensionTrackerFlow;
}

- (void)setAdoptsExtensionTrackerFlow:(BOOL)a3
{
  self->_adoptsExtensionTrackerFlow = a3;
}

- (int64_t)callCount
{
  return self->_callCount;
}

- (void)setCallCount:(int64_t)a3
{
  self->_callCount = a3;
}

- (NSNumber)cachedRequiresDataClassBAccessToRun
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCachedRequiresDataClassBAccessToRun:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRequiresDataClassBAccessToRun, 0);
  objc_storeStrong((id *)&self->_contextFetchHandlers, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_loggingConsent, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attachmentsName, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)initWithNSExtension:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v2, v3, "Extension identifier: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)initWithNSExtension:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v2, v3, "Extension attributes: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __32__DEExtension_endUsingExtension__block_invoke_cold_1(id *a1, NSObject *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(v3, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1A4EEE000, a2, OS_LOG_TYPE_FAULT, "Tried to end using extension %{public}@, but there's no context.", v6, 0xCu);

  OUTLINED_FUNCTION_3();
}

void __32__DEExtension_endUsingExtension__block_invoke_cold_2(id *a1, NSObject *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(v3, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v6, "A context is being created, but the extension %{public}@ is being shut down. This is an error.", v7);

  OUTLINED_FUNCTION_3();
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "DEExtension beginRequest error: %@", v5);

  OUTLINED_FUNCTION_0();
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4EEE000, log, OS_LOG_TYPE_ERROR, "Failed entitlement check", v1, 2u);
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_3(id *a1, NSObject *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint8_t v8[24];

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_2();
  v6 = v5;
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v7, "Host Context is the wrong kind of class: %@", v8);

  OUTLINED_FUNCTION_3();
}

- (void)accessBundleWithSynchronousHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v3, (uint64_t)v3, "Failed to get extension token for [%{public}@]: Token is nil", v4);

  OUTLINED_FUNCTION_6();
}

- (void)accessBundleWithSynchronousHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v3, (uint64_t)v3, "Failed to consume extension token for [%{public}@]", v4);

  OUTLINED_FUNCTION_6();
}

- (void)accessBundleWithSynchronousHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v3, (uint64_t)v3, "Plugin url is nil for [%{public}@]", v4);

  OUTLINED_FUNCTION_6();
}

- (void)accessBundleWithSynchronousHandler:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v3, (uint64_t)v3, "Failed to get extension token for [%{public}@]: Unknown token kind", v4);

  OUTLINED_FUNCTION_6();
}

void __50__DEExtension_accessBundleWithSynchronousHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v2, v3, "Got sandbox extension token for [%{public}@].", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)_localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_1A4EEE000, v0, v1, "Could not find [%{public}@] for any localization. Falling back to value in file for [%{public}@] plist key");
  OUTLINED_FUNCTION_5();
}

void __61__DEExtension__localizedStringFromPlistWithKey_localization___block_invoke_cold_1(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_5_0(&dword_1A4EEE000, (uint64_t)a2, a3, "Could not find [%{public}@] for localization [%{public}@]. Falling back to value in plist value", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

- (void)loggingProfileURLsFromExtension
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = CFSTR("DELoggingPreferenceSubsystems");
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a1, a3, "%{public}@ does not contain an array of strings. Cannot load subsystems.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

@end
