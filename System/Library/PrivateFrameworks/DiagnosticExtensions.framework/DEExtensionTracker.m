@implementation DEExtensionTracker

+ (void)checkIn
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, a1);
  objc_msgSend((id)objc_opt_class(), "sharedSerialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__DEExtensionTracker_checkIn__block_invoke;
  v3[3] = &unk_1E4E350B0;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __29__DEExtensionTracker_checkIn__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[DEExtensionTracker checkIn]_block_invoke";
    _os_log_impl(&dword_1A4EEE000, v2, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %s", (uint8_t *)&v5, 0xCu);
  }

  +[DEExtensionManager sharedInstance](DEExtensionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadExtensions");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend((id)objc_opt_class(), "_updateXPCActivityDate");

}

+ (BOOL)shouldSetupWithIdentifier:(id)a3 session:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  id location;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_initWeak(&location, a1);
  objc_msgSend((id)objc_opt_class(), "sharedSerialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__DEExtensionTracker_shouldSetupWithIdentifier_session_expirationDate___block_invoke;
  v16[3] = &unk_1E4E350D8;
  v17 = v8;
  v18 = v9;
  v20 = &v23;
  v12 = v9;
  v13 = v8;
  objc_copyWeak(&v21, &location);
  v19 = v10;
  v14 = v10;
  dispatch_sync(v11, v16);

  LOBYTE(v11) = *((_BYTE *)v24 + 24);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v23, 8);
  return (char)v11;
}

void __71__DEExtensionTracker_shouldSetupWithIdentifier_session_expirationDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 136315650;
    v11 = "+[DEExtensionTracker shouldSetupWithIdentifier:session:expirationDate:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1A4EEE000, v2, OS_LOG_TYPE_INFO, "%s %@, %@", (uint8_t *)&v10, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "hasInactiveLoggingSession:", *(_QWORD *)(a1 + 32));

  v6 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend((id)objc_opt_class(), "increaseRetainCountWithIdentifier:session:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v7 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend((id)objc_opt_class(), "updateExpirationDateWithIdentifier:expirationDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  Log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v10 = 67109120;
    LODWORD(v11) = v9;
    _os_log_impl(&dword_1A4EEE000, v8, OS_LOG_TYPE_INFO, "isFirstTimeRunningExtension: %i", (uint8_t *)&v10, 8u);
  }

}

+ (BOOL)shouldTeardownWithIdentifier:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t *v15;
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_initWeak(&location, a1);
  objc_msgSend((id)objc_opt_class(), "sharedSerialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__DEExtensionTracker_shouldTeardownWithIdentifier_session___block_invoke;
  block[3] = &unk_1E4E35100;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_copyWeak(&v16, &location);
  v15 = &v18;
  dispatch_sync(v8, block);

  LOBYTE(v8) = *((_BYTE *)v19 + 24);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);
  return (char)v8;
}

void __59__DEExtensionTracker_shouldTeardownWithIdentifier_session___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v15 = 136315650;
    v16 = "+[DEExtensionTracker shouldTeardownWithIdentifier:session:]_block_invoke";
    v17 = 2112;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1A4EEE000, v2, OS_LOG_TYPE_INFO, "%s %@, %@", (uint8_t *)&v15, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = objc_msgSend((id)objc_opt_class(), "hasInactiveLoggingSession:", *(_QWORD *)(a1 + 32));

  v7 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v7, "decreaseRetainCountWithIdentifier:session:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 48);
    v8 = a1 + 48;
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 0;
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 56));
    v11 = objc_msgSend((id)objc_opt_class(), "hasInactiveLoggingSession:", *(_QWORD *)(a1 + 32));
    v12 = *(_QWORD *)(a1 + 48);
    v8 = a1 + 48;
    *(_BYTE *)(*(_QWORD *)(v12 + 8) + 24) = v11;

  }
  Log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24);
    v15 = 67109120;
    LODWORD(v16) = v14;
    _os_log_impl(&dword_1A4EEE000, v13, OS_LOG_TYPE_INFO, "shouldTeardownExtension: %i", (uint8_t *)&v15, 8u);
  }

}

+ (id)currentLoggingExtensions
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("com.apple.DiagnosticExtensions.extensionTracker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DiagnosticExtensions.extensionTracker"));
}

+ (void)saveCurrentLoggingExtensionsWithDictionary:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("com.apple.DiagnosticExtensions.extensionTracker"));

  objc_msgSend(v4, "synchronize");
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "currentLoggingExtensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A4EEE000, v5, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: currentLoggingExtensions: %@", (uint8_t *)&v7, 0xCu);

  }
}

+ (BOOL)hasInactiveLoggingSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "currentLoggingExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Sessions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__DEExtensionTracker_hasInactiveLoggingSession___block_invoke;
  v10[3] = &unk_1E4E35128;
  v10[4] = &v11;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = *((_DWORD *)v12 + 6) == 0;
  else
    v8 = 1;

  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __48__DEExtensionTracker_hasInactiveLoggingSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "intValue");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)sharedSerialQueue
{
  if (sharedSerialQueue_onceToken != -1)
    dispatch_once(&sharedSerialQueue_onceToken, &__block_literal_global);
  return (id)sharedSerialQueue_sharedDispatchQueue;
}

void __39__DEExtensionTracker_sharedSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.DiagnosticExtensions.extensionTracker"), "UTF8String"), 0);
  v1 = (void *)sharedSerialQueue_sharedDispatchQueue;
  sharedSerialQueue_sharedDispatchQueue = (uint64_t)v0;

}

+ (void)updateExpirationDateWithIdentifier:(id)a3 expirationDate:(id)a4
{
  objc_msgSend(a1, "_updateExtensionExpirationDateWithIdentifier:expirationDate:", a3, a4);
  objc_msgSend(a1, "_updateXPCActivityDate");
}

+ (void)_updateExtensionExpirationDateWithIdentifier:(id)a3 expirationDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "currentLoggingExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0C9AA70];
  if (!v7)
    v7 = (void *)MEMORY[0x1E0C9AA70];
  v10 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v10, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = v9;
  v13 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ExpirationDate"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v6;
  v17 = v16;

  objc_msgSend(v17, "laterDate:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("ExpirationDate"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v5);
  Log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v5;
    v24 = 2112;
    v25 = v18;
    _os_log_impl(&dword_1A4EEE000, v19, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: Updating %@ expiration date to %@", (uint8_t *)&v22, 0x16u);
  }

  v20 = (void *)objc_opt_class();
  v21 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v20, "saveCurrentLoggingExtensionsWithDictionary:", v21);

}

+ (void)_updateXPCActivityDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "currentLoggingExtensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("XPCActivity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("XPCActivity"));
      v8 = (void *)objc_opt_class();
      v9 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v8, "saveCurrentLoggingExtensionsWithDictionary:", v9);

      goto LABEL_16;
    }
  }
  else
  {

  }
  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __44__DEExtensionTracker__updateXPCActivityDate__block_invoke;
  v22[3] = &unk_1E4E35170;
  v22[4] = &v23;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v22);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24[5], "compare:", v10) == -1)
  {
    Log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (const __CFString *)v24[5];
      *(_DWORD *)buf = 138412546;
      v32 = v12;
      v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_1A4EEE000, v11, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: extensionEarliestDate is aged out (%@), assign to %@ instead", buf, 0x16u);
    }

    objc_storeStrong(v24 + 5, v10);
  }
  v13 = v24[5];
  objc_msgSend((id)objc_opt_class(), "xpcActivityTimeInterval");
  objc_msgSend(v13, "dateByAddingTimeInterval:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24[5];
  v29[0] = CFSTR("EarliestExpirationDate");
  v29[1] = CFSTR("XPCActivityScheduledDate");
  v30[0] = v15;
  v30[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("XPCActivity"));

  Log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = v24[5];
    *(_DWORD *)buf = 138412546;
    v32 = CFSTR("XPCActivity");
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1A4EEE000, v17, OS_LOG_TYPE_INFO, "DEExtensionTracker: Updating %@ to %@", buf, 0x16u);
  }

  Log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v32 = CFSTR("XPCActivityScheduledDate");
    v33 = 2112;
    v34 = v14;
    _os_log_impl(&dword_1A4EEE000, v19, OS_LOG_TYPE_INFO, "DEExtensionTracker: Updating %@ to %@", buf, 0x16u);
  }

  v20 = (void *)objc_opt_class();
  v21 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v20, "saveCurrentLoggingExtensionsWithDictionary:", v21);

  objc_msgSend(a1, "scheduleXPCActivity");
  _Block_object_dispose(&v23, 8);

LABEL_16:
}

void __44__DEExtensionTracker__updateXPCActivityDate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id obj;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ExpirationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    obj = v4;
    v6 = objc_msgSend(v4, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v5 = obj;
    if (v6 == -1)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
      v5 = obj;
    }
  }

}

+ (double)xpcActivityTimeInterval
{
  return 7200.0;
}

+ (id)criteria:(id)a3
{
  id v3;
  xpc_object_t v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], 0);
  objc_msgSend(v3, "timeIntervalSinceNow");
  v6 = v5;

  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v6);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80790], 30);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  return v4;
}

+ (void)scheduleXPCActivity
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "+[DEExtensionTracker scheduleXPCActivity]";
    _os_log_impl(&dword_1A4EEE000, v3, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %s", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "currentLoggingExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("XPCActivity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("XPCActivityScheduledDate"));
  v8 = (char *)objc_claimAutoreleasedReturnValue();

  Log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1A4EEE000, v9, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: scheduleXPCActivityToDate %@", buf, 0xCu);
    }

    v11 = (const char *)objc_msgSend(CFSTR("com.apple.DiagnosticExtensions.extensionTracker"), "UTF8String");
    v12 = (void *)*MEMORY[0x1E0C80748];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__DEExtensionTracker_scheduleXPCActivity__block_invoke;
    v13[3] = &unk_1E4E35198;
    v15 = a1;
    v14 = v8;
    xpc_activity_register(v11, v12, v13);
    v9 = v14;
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4EEE000, v9, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: tracker dict is empty. There's nothing to schedule.", buf, 2u);
  }

}

void __41__DEExtensionTracker_scheduleXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    Log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A4EEE000, v7, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: XPC_ACTIVITY_STATE_RUN", v8, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "extensionTrackerCleanup");
  }
  else if (!state)
  {
    Log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4EEE000, v5, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: XPC_ACTIVITY_STATE_CHECK_IN", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "criteria:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(v3, v6);

  }
}

+ (void)extensionTrackerCleanup
{
  NSObject *v3;
  _QWORD block[4];
  id v5[2];
  id location;

  objc_initWeak(&location, a1);
  objc_msgSend((id)objc_opt_class(), "sharedSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke;
  block[3] = &unk_1E4E351E8;
  objc_copyWeak(v5, &location);
  v5[1] = a1;
  dispatch_async(v3, block);

  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  __int128 *p_buf;
  uint64_t v16;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[DEExtensionTracker extensionTrackerCleanup]_block_invoke";
    _os_log_impl(&dword_1A4EEE000, v2, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %s", (uint8_t *)&buf, 0xCu);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend((id)objc_opt_class(), "currentLoggingExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("XPCActivity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("XPCActivityScheduledDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = (id)objc_msgSend(v5, "mutableCopy");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke_24;
    v13[3] = &unk_1E4E351C0;
    v8 = v7;
    v14 = v8;
    p_buf = &buf;
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);
    v9 = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = (void *)objc_opt_class();
    v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "copy");
    objc_msgSend(v10, "saveCurrentLoggingExtensionsWithDictionary:", v11);

    v12 = objc_loadWeakRetained(v3);
    objc_msgSend((id)objc_opt_class(), "_updateXPCActivityDate");

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A4EEE000, v8, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: Exit early. Nothing to clean up.", (uint8_t *)&buf, 2u);
    }
  }

}

void __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ExpirationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32));
    Log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9 == 1)
    {
      if (v11)
      {
        v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v28 = v12;
        _os_log_impl(&dword_1A4EEE000, v10, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %@ (%@) is NOT due (%@). Start cleaning up '0' retain count.", buf, 0x20u);
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Sessions"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v28 = __Block_byref_object_copy_;
      v29 = __Block_byref_object_dispose_;
      v30 = (id)objc_msgSend(v13, "mutableCopy");
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke_25;
      v26[3] = &unk_1E4E35128;
      v26[4] = buf;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v26);
      v14 = (void *)objc_msgSend(v6, "mutableCopy");
      v15 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "copy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("Sessions"));

      v16 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v16, v5);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v11)
      {
        v17 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v28 = v17;
        _os_log_impl(&dword_1A4EEE000, v10, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %@ (%@) is due (%@). Calling checkAndTeardownWithHandler:", buf, 0x20u);
      }

      +[DEExtensionManager sharedInstance](DEExtensionManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "extensionForIdentifier:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v13, "checkAndTeardown");
      Log();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v5;
          _os_log_impl(&dword_1A4EEE000, v20, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: %@ is done cleaning up.", buf, 0xCu);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", 0, v5);
      }
      else
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4EEE000, v20, OS_LOG_TYPE_DEFAULT, "DEExtensionTracker: extension failed to turn off. Reschedule to (now + 2 hours).", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "xpcActivityTimeInterval");
        objc_msgSend(v22, "dateByAddingTimeInterval:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("ExpirationDate"));
        v25 = (void *)objc_msgSend(v24, "copy");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v25, v5);

      }
    }

  }
}

void __45__DEExtensionTracker_extensionTrackerCleanup__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!objc_msgSend(a3, "intValue"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", 0, v5);
    Log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A4EEE000, v6, OS_LOG_TYPE_INFO, "DEExtensionTracker: %@ retain count is 0. Removing it.", (uint8_t *)&v7, 0xCu);
    }

  }
}

+ (void)increaseRetainCountWithIdentifier:(id)a3 session:(id)a4
{
  objc_msgSend(a1, "updateRetainCountWithIdentifier:session:offsetBy:", a3, a4, 1);
}

+ (void)decreaseRetainCountWithIdentifier:(id)a3 session:(id)a4
{
  objc_msgSend(a1, "updateRetainCountWithIdentifier:session:offsetBy:", a3, a4, 0xFFFFFFFFLL);
}

+ (void)updateRetainCountWithIdentifier:(id)a3 session:(id)a4 offsetBy:(int)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "currentLoggingExtensions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0C9AA70];
  if (!v9)
    v9 = (void *)MEMORY[0x1E0C9AA70];
  v26 = (id)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v26, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = v11;
  v14 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Sessions"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = v11;
  v17 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v17, "objectForKeyedSubscript:", v7);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = &unk_1E4E398A0;
  if (v18)
    v20 = (void *)v18;
  v21 = v20;

  v22 = objc_msgSend(v21, "integerValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (v22 + a5) & ~((v22 + a5) >> 63));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, v7);

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("Sessions"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v14, v8);

  v24 = (void *)objc_opt_class();
  v25 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v24, "saveCurrentLoggingExtensionsWithDictionary:", v25);

}

@end
