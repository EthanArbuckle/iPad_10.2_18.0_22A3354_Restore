@implementation _DKSyncRapportContextStorage

+ (id)sharedInstance
{
  if (sharedInstance_initialized_291 != -1)
    dispatch_once(&sharedInstance_initialized_291, &__block_literal_global_293);
  return (id)sharedInstance_sharedInstance_292;
}

- (void)registerRequestIDsWithClient:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke;
  v9[3] = &unk_1E26E6FB0;
  v9[4] = self;
  v5 = a3;
  objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("com.apple.coreduet.fetch-context-values"), 0, v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_2;
  v8[3] = &unk_1E26E6FB0;
  v8[4] = self;
  objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("com.apple.coreduet.send-context-values"), 0, v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_3;
  v7[3] = &unk_1E26E6FB0;
  v7[4] = self;
  objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("com.apple.coreduet.subscribe-to-context-value-changes"), 0, v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_4;
  v6[3] = &unk_1E26E6FB0;
  v6[4] = self;
  objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("com.apple.coreduet.unsubscribe-to-context-value-changes"), 0, v6);

}

- (void)handleFetchContextValuesWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  void (**v7)(id, void *, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[17];

  v30[15] = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v26 = a3;
  v7 = a4;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:].cold.5();
    }

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:].cold.4();
    }

    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("keyPaths"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      _CDPrettyPrintCollection(v11, 0, 0, 0);
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:].cold.3();
    }

    v13 = (void *)a1[2];
    v25 = v13 == 0;
    if (v13)
    {
      objc_msgSend(v13, "remoteContextStorage:archivedObjectsForKeyPaths:", a1, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:].cold.2();
      }

      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
    objc_msgSend(a1, "myDeviceID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = &stru_1E26E9728;
    if (v17)
      v19 = (__CFString *)v17;
    v20 = v19;

    v29[0] = CFSTR("server");
    v29[1] = CFSTR("results");
    v21 = (void *)MEMORY[0x1E0C9AA70];
    if (v14)
      v21 = v14;
    v30[0] = v20;
    v30[1] = v21;
    v29[2] = CFSTR("version");
    v30[2] = CFSTR("3.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:].cold.1();
    }

    v7[2](v7, v22, 0, v15);
    if (v28)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v28, v24, v25);

    }
  }

}

- (void)handleSendContextValuesWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void (**v35)(id, void *, _QWORD, void *);
  id v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[14];

  v43[12] = *MEMORY[0x1E0C80C00];
  v36 = a2;
  v34 = a3;
  v35 = a4;
  if (!a1)
    goto LABEL_34;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.7();
  }

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.6();
  }

  if (!a1[2])
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.2();
    }

    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 1;
    goto LABEL_27;
  }
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("client"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("id"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("objects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "existingPeerWithSourceDeviceID:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("senderIDS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSObject idsDeviceIdentifier](v13, "idsDeviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v14);

    if ((v16 & 1) != 0)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allKeys");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        _CDPrettyPrintCollection(v32, 0, 0, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v30;
        v40 = 2112;
        v41 = v31;
        _os_log_debug_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Received sent context values with key paths '%@'", buf, 0x16u);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = 0;
        objc_msgSend(a1[2], "remoteContextStorage:registrationIdentifier:setArchivedObjects:peer:", a1, v33, v11, v13);
      }
      else
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.4();
        }

        +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v20 = objc_msgSend(v11, "count", v32) == 0;

      goto LABEL_26;
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.5();
    }

  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.3();
    }
  }

  +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
  v20 = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

LABEL_27:
  objc_msgSend(a1, "myDeviceID");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = &stru_1E26E9728;
  if (v23)
    v25 = (__CFString *)v23;
  v26 = v25;

  v42[0] = CFSTR("server");
  v42[1] = CFSTR("version");
  v43[0] = v26;
  v43[1] = CFSTR("3.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.1();
  }

  v35[2](v35, v27, 0, v18);
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v37, v29, v20);

  }
LABEL_34:

}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void (**v44)(id, void *, _QWORD, void *);
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v43 = a3;
  v44 = a4;
  if (!a1)
    goto LABEL_31;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.7();
  }

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.6();
  }

  if (!a1[2])
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.2();
    }

    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 1;
    goto LABEL_24;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("client"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("predicate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "existingPeerWithSourceDeviceID:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("senderIDS"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.3();
    }
    goto LABEL_21;
  }
  -[NSObject idsDeviceIdentifier](v14, "idsDeviceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v15);

  if ((v17 & 1) == 0)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.5();
    }

LABEL_21:
    +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend(v12, "length") && v42)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[NSObject me](v14, "me");
      v32 = CFSTR("pseudo ");
      if (!v31)
        v32 = &stru_1E26E9728;
      v38 = v32;
      -[NSObject identifier](v14, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject model](v14, "model");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v36 = (void *)MEMORY[0x1E0CB3940];
        -[NSObject model](v14, "model");
        v34 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR(" (%@)"), v34);
        v33 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
      }
      else
      {
        v33 = &stru_1E26E9728;
      }
      v37 = (__CFString *)v33;
      *(_DWORD *)buf = 138544386;
      v49 = v40;
      v50 = 2112;
      v51 = v12;
      v52 = 2114;
      v53 = v38;
      v54 = 2114;
      v55 = v39;
      v56 = 2114;
      v57 = v33;
      _os_log_debug_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: Received subscribe to context value changes request for '%@' from %{public}@peer %{public}@%{public}@", buf, 0x34u);
      if (v41)
      {

      }
    }

    objc_msgSend(a1[2], "remoteContextStorage:subscribeToChangesWithPeer:registrationIdentifier:predicate:", a1, v14, v12, v42);
    v19 = 0;
    v20 = 0;
    goto LABEL_23;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.4();
  }

  +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  v19 = 1;
LABEL_23:

LABEL_24:
  objc_msgSend(a1, "myDeviceID");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = &stru_1E26E9728;
  if (v23)
    v25 = (__CFString *)v23;
  v26 = v25;

  v46[0] = CFSTR("server");
  v46[1] = CFSTR("version");
  v47[0] = v26;
  v47[1] = CFSTR("3.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.1();
  }

  v44[2](v44, v27, 0, v20);
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v45, v29, v19 != 0);

  }
LABEL_31:

}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void (**v44)(id, void *, _QWORD, void *);
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v43 = a3;
  v44 = a4;
  if (!a1)
    goto LABEL_31;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.7();
  }

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.6();
  }

  if (!a1[2])
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.2();
    }

    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 1;
    goto LABEL_24;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("client"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("predicate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "existingPeerWithSourceDeviceID:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("senderIDS"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.3();
    }
    goto LABEL_21;
  }
  -[NSObject idsDeviceIdentifier](v14, "idsDeviceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v15);

  if ((v17 & 1) == 0)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.5();
    }

LABEL_21:
    +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend(v12, "length") && v42)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[NSObject me](v14, "me");
      v32 = CFSTR("pseudo ");
      if (!v31)
        v32 = &stru_1E26E9728;
      v38 = v32;
      -[NSObject identifier](v14, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject model](v14, "model");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v36 = (void *)MEMORY[0x1E0CB3940];
        -[NSObject model](v14, "model");
        v34 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR(" (%@)"), v34);
        v33 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
      }
      else
      {
        v33 = &stru_1E26E9728;
      }
      v37 = (__CFString *)v33;
      *(_DWORD *)buf = 138544386;
      v49 = v40;
      v50 = 2112;
      v51 = v12;
      v52 = 2114;
      v53 = v38;
      v54 = 2114;
      v55 = v39;
      v56 = 2114;
      v57 = v33;
      _os_log_debug_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: Received unsubscribe to context value changes request for '%@' from %{public}@peer %{public}@%{public}@", buf, 0x34u);
      if (v41)
      {

      }
    }

    objc_msgSend(a1[2], "remoteContextStorage:unsubscribeFromChangesWithPeer:registrationIdentifier:predicate:", a1, v14, v12, v42);
    v19 = 0;
    v20 = 0;
    goto LABEL_23;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.4();
  }

  +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  v19 = 1;
LABEL_23:

LABEL_24:
  objc_msgSend(a1, "myDeviceID");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = &stru_1E26E9728;
  if (v23)
    v25 = (__CFString *)v23;
  v26 = v25;

  v46[0] = CFSTR("server");
  v46[1] = CFSTR("version");
  v47[0] = v26;
  v47[1] = CFSTR("3.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.1();
  }

  v44[2](v44, v27, 0, v20);
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v45, v29, v19 != 0);

  }
LABEL_31:

}

- (void)fetchContextValuesFromPeer:(id)a3 forKeyPaths:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  int v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  __CFString *v47;
  __int16 v48;
  id v49;
  _QWORD v50[3];
  _QWORD v51[6];

  v7 = a5;
  v51[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[_DKSyncRapportStorage myDeviceID](self, "myDeviceID");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[_DKSyncRapportStorage isAvailable](self, "isAvailable")
    && (objc_msgSend(v10, "idsDeviceIdentifier"), (v15 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v16 = (void *)v15,
        v17 = -[_DKSyncRapportStorage isTransportActiveForPeer:](self, "isTransportActiveForPeer:", v10),
        v16,
        v17))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = &stru_1E26E9728;
    if (v14)
      v20 = v14;
    else
      v20 = &stru_1E26E9728;
    v50[0] = CFSTR("client");
    v50[1] = CFSTR("keyPaths");
    v21 = (id)MEMORY[0x1E0C9AA60];
    if (v11)
      v21 = v11;
    v51[0] = v20;
    v51[1] = v21;
    v50[2] = CFSTR("version");
    v51[2] = CFSTR("3.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v10, "me");
      v27 = CFSTR("pseudo ");
      if (!v26)
        v27 = &stru_1E26E9728;
      v30 = v27;
      objc_msgSend(v10, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "model");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "model");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR(" (%@)"), v29);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v41 = v33;
      v42 = 2114;
      v43 = v30;
      v44 = 2114;
      v45 = v32;
      v46 = 2114;
      v47 = v19;
      v48 = 2112;
      v49 = v22;
      _os_log_debug_impl(&dword_18DDBE000, v23, OS_LOG_TYPE_DEBUG, "%{public}@: Sending fetch context values request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v31)
      {

      }
    }

    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __95___DKSyncRapportContextStorage_fetchContextValuesFromPeer_forKeyPaths_highPriority_completion___block_invoke;
    v36[3] = &unk_1E26E7028;
    v36[4] = self;
    v37 = v10;
    v38 = v18;
    v39 = v12;
    v24 = v12;
    v25 = v18;
    -[_DKSyncRapportStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self, "sendRequestID:request:peer:highPriority:options:responseHandler:", CFSTR("com.apple.coreduet.fetch-context-values"), v22, v37, v7, 0, v36);

  }
  else
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __95___DKSyncRapportContextStorage_fetchContextValuesFromPeer_forKeyPaths_highPriority_completion___block_invoke_2;
    v34[3] = &unk_1E26E2FE8;
    v35 = v12;
    v22 = v12;
    -[_DKSyncRapportStorage handleAvailabilityFailureWithPeer:completion:](self, "handleAvailabilityFailureWithPeer:completion:", v10, v34);
    v25 = v35;
  }

}

- (void)handleFetchContextValuesWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void (*v28)(_QWORD *, void *, id);
  const __CFString *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v35 = a3;
  v14 = a4;
  v36 = a5;
  v15 = a6;
  v16 = a7;
  if (!a1)
    goto LABEL_22;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleFetchContextValuesWithResponse:options:error:peer:plStartDate:completion:].cold.1();
  }

  if (v14)
  {
    if (objc_msgSend(v14, "code") == -6714
      && (objc_msgSend(v14, "domain"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D83988]),
          v19,
          v20))
    {
      +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v36);

      v22 = 0;
      v23 = 1;
      if (!v15)
        goto LABEL_17;
    }
    else
    {
      objc_msgSend(a1, "transformResponseError:", v14);
      v24 = objc_claimAutoreleasedReturnValue();

      v22 = 0;
      v23 = 1;
      v14 = (id)v24;
      if (!v15)
        goto LABEL_17;
    }
    goto LABEL_16;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "me"))
      v29 = CFSTR("pseudo ");
    else
      v29 = &stru_1E26E9728;
    objc_msgSend(v36, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "model");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v36, "model");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR(" (%@)"), v17);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = &stru_1E26E9728;
    }
    *(_DWORD *)buf = 138544386;
    v38 = v34;
    v39 = 2114;
    v40 = v29;
    v41 = 2114;
    v42 = v33;
    v43 = 2114;
    v44 = v31;
    v45 = 2112;
    v46 = v13;
    _os_log_debug_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch context values response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
    if (v30)
    {

    }
  }

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("results"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v26;
  if (v26)
  {
    v14 = 0;
    v23 = objc_msgSend(v26, "count") == 0;
    if (!v15)
      goto LABEL_17;
    goto LABEL_16;
  }
  +[_DKSyncErrors invalidResponse](_DKSyncErrors, "invalidResponse");
  v23 = 1;
  v22 = 0;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v15, v27, v23);

  }
LABEL_17:
  if (v16)
  {
    v28 = (void (*)(_QWORD *, void *, id))v16[2];
    if (v14)
      v28(v16, 0, v14);
    else
      v28(v16, v22, 0);
  }

LABEL_22:
}

- (void)sendContextValuesToPeer:(id)a3 registrationIdentifier:(id)a4 archivedObjects:(id)a5 highPriority:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  id v25;
  int v26;
  const __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  void *v52;
  _QWORD v53[4];
  _QWORD v54[7];

  v8 = a6;
  v54[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  -[_DKSyncRapportStorage myDeviceID](self, "myDeviceID");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13
    && objc_msgSend(v14, "count")
    && -[_DKSyncRapportStorage isAvailable](self, "isAvailable")
    && (objc_msgSend(v12, "idsDeviceIdentifier"), (v18 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v19 = (void *)v18,
        v20 = -[_DKSyncRapportStorage isTransportActiveForPeer:](self, "isTransportActiveForPeer:", v12),
        v19,
        v20))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = &stru_1E26E9728;
    if (v17)
      v22 = v17;
    v53[0] = CFSTR("client");
    v53[1] = CFSTR("id");
    v54[0] = v22;
    v54[1] = v13;
    v53[2] = CFSTR("objects");
    v53[3] = CFSTR("version");
    v54[2] = v14;
    v54[3] = CFSTR("3.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v33 = v21;
      v34 = v23;
      objc_msgSend((id)objc_opt_class(), "description");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v12, "me");
      v27 = CFSTR("pseudo ");
      v28 = &stru_1E26E9728;
      if (!v26)
        v27 = &stru_1E26E9728;
      v32 = v27;
      objc_msgSend(v12, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "model");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "model");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR(" (%@)"), v31);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v44 = v36;
      v45 = 2114;
      v46 = v32;
      v47 = 2114;
      v48 = v35;
      v49 = 2114;
      v50 = v28;
      v51 = 2112;
      v52 = v34;
      _os_log_debug_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Sending send context values to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v29)
      {

      }
      v21 = v33;
      v23 = v34;
    }

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __119___DKSyncRapportContextStorage_sendContextValuesToPeer_registrationIdentifier_archivedObjects_highPriority_completion___block_invoke;
    v39[3] = &unk_1E26E7028;
    v39[4] = self;
    v40 = v12;
    v41 = v21;
    v42 = v15;
    v25 = v21;
    -[_DKSyncRapportStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self, "sendRequestID:request:peer:highPriority:options:responseHandler:", CFSTR("com.apple.coreduet.send-context-values"), v23, v40, v8, 0, v39);

  }
  else if (objc_msgSend(v14, "count"))
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __119___DKSyncRapportContextStorage_sendContextValuesToPeer_registrationIdentifier_archivedObjects_highPriority_completion___block_invoke_2;
    v37[3] = &unk_1E26E2FE8;
    v38 = v15;
    -[_DKSyncRapportStorage handleAvailabilityFailureWithPeer:completion:](self, "handleAvailabilityFailureWithPeer:completion:", v12, v37);

  }
  else
  {
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

- (void)handleSendContextValuesWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  void *v7;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void (*v26)(_QWORD *, NSObject *);
  int v27;
  const __CFString *v28;
  __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v20);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithResponse:options:error:peer:plStartDate:completion:].cold.1();
    }

    if (v16)
    {
      if (-[NSObject code](v16, "code") == -6714
        && (-[NSObject domain](v16, "domain"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D83988]),
            v22,
            v23))
      {
        +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeActiveTransports:fromPeer:](v24, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v17);
      }
      else
      {
        objc_msgSend(a1, "transformResponseError:", v16);
        v24 = v16;
        v16 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v17, "me");
        v28 = &stru_1E26E9728;
        if (v27)
          v28 = CFSTR("pseudo ");
        v31 = v28;
        objc_msgSend(v17, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "model");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v17, "model");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", CFSTR(" (%@)"), v7);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = &stru_1E26E9728;
        }
        *(_DWORD *)buf = 138544386;
        v36 = v33;
        v37 = 2114;
        v38 = v31;
        v39 = 2114;
        v40 = v32;
        v41 = 2114;
        v42 = v29;
        v43 = 2112;
        v44 = v14;
        _os_log_debug_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Received sent context values response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v34)
        {

        }
      }
      v16 = 0;
    }

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v18, v25, 1);

    }
    if (v19)
    {
      v26 = (void (*)(_QWORD *, NSObject *))v19[2];
      if (v16)
      {
        v26(v19, v16);
      }
      else
      {
        v26(v19, 0);
        v16 = 0;
      }
    }
  }

}

- (void)subscribeToContextValueChangeNotificationsFromPeer:(id)a3 registrationIdentifier:(id)a4 predicate:(id)a5 highPriority:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  int v28;
  const __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  void *v54;
  _QWORD v55[4];
  _QWORD v56[7];

  v8 = a6;
  v56[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  -[_DKSyncRapportStorage myDeviceID](self, "myDeviceID");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "length");
  if (v14
    && v18
    && -[_DKSyncRapportStorage isAvailable](self, "isAvailable")
    && (objc_msgSend(v12, "idsDeviceIdentifier"), (v19 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v20 = (void *)v19,
        v21 = -[_DKSyncRapportStorage isTransportActiveForPeer:](self, "isTransportActiveForPeer:", v12),
        v20,
        v21))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = &stru_1E26E9728;
    if (v17)
      v23 = v17;
    v55[0] = CFSTR("client");
    v55[1] = CFSTR("id");
    v56[0] = v23;
    v56[1] = v13;
    v55[2] = CFSTR("predicate");
    v55[3] = CFSTR("version");
    v56[2] = v14;
    v56[3] = CFSTR("3.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v35 = v22;
      v36 = v24;
      objc_msgSend((id)objc_opt_class(), "description");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v12, "me");
      v29 = CFSTR("pseudo ");
      v30 = &stru_1E26E9728;
      if (!v28)
        v29 = &stru_1E26E9728;
      v34 = v29;
      objc_msgSend(v12, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "model");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "model");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR(" (%@)"), v33);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v46 = v38;
      v47 = 2114;
      v48 = v34;
      v49 = 2114;
      v50 = v37;
      v51 = 2114;
      v52 = v30;
      v53 = 2112;
      v54 = v36;
      _os_log_debug_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Sending subscribe to context value changes request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v31)
      {

      }
      v22 = v35;
      v24 = v36;
    }

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __140___DKSyncRapportContextStorage_subscribeToContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke;
    v41[3] = &unk_1E26E7028;
    v41[4] = self;
    v42 = v12;
    v43 = v22;
    v44 = v15;
    v26 = v22;
    -[_DKSyncRapportStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self, "sendRequestID:request:peer:highPriority:options:responseHandler:", CFSTR("com.apple.coreduet.subscribe-to-context-value-changes"), v24, v42, v8, 0, v41);

  }
  else if (objc_msgSend(v13, "length"))
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __140___DKSyncRapportContextStorage_subscribeToContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke_2;
    v39[3] = &unk_1E26E2FE8;
    v40 = v15;
    -[_DKSyncRapportStorage handleAvailabilityFailureWithPeer:completion:](self, "handleAvailabilityFailureWithPeer:completion:", v12, v39);

  }
  else
  {
    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v27);

  }
}

- (void)handleSubscribeToContextValueChangeNotificationsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  void *v7;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void (*v26)(_QWORD *, NSObject *);
  int v27;
  const __CFString *v28;
  __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v20);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:].cold.1();
    }

    if (v16)
    {
      if (-[NSObject code](v16, "code") == -6714
        && (-[NSObject domain](v16, "domain"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D83988]),
            v22,
            v23))
      {
        +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeActiveTransports:fromPeer:](v24, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v17);
      }
      else
      {
        objc_msgSend(a1, "transformResponseError:", v16);
        v24 = v16;
        v16 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v17, "me");
        v28 = &stru_1E26E9728;
        if (v27)
          v28 = CFSTR("pseudo ");
        v31 = v28;
        objc_msgSend(v17, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "model");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v17, "model");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", CFSTR(" (%@)"), v7);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = &stru_1E26E9728;
        }
        *(_DWORD *)buf = 138544386;
        v36 = v33;
        v37 = 2114;
        v38 = v31;
        v39 = 2114;
        v40 = v32;
        v41 = 2114;
        v42 = v29;
        v43 = 2112;
        v44 = v14;
        _os_log_debug_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Received subscribe to context value changes response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v34)
        {

        }
      }
      v16 = 0;
    }

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v18, v25, 1);

    }
    if (v19)
    {
      v26 = (void (*)(_QWORD *, NSObject *))v19[2];
      if (v16)
      {
        v26(v19, v16);
      }
      else
      {
        v26(v19, 0);
        v16 = 0;
      }
    }
  }

}

- (void)unsubscribeFromContextValueChangeNotificationsFromPeer:(id)a3 registrationIdentifier:(id)a4 predicate:(id)a5 highPriority:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  int v28;
  const __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  void *v54;
  _QWORD v55[4];
  _QWORD v56[7];

  v8 = a6;
  v56[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  -[_DKSyncRapportStorage myDeviceID](self, "myDeviceID");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "length");
  if (v14
    && v18
    && -[_DKSyncRapportStorage isAvailable](self, "isAvailable")
    && (objc_msgSend(v12, "idsDeviceIdentifier"), (v19 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v20 = (void *)v19,
        v21 = -[_DKSyncRapportStorage isTransportActiveForPeer:](self, "isTransportActiveForPeer:", v12),
        v20,
        v21))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = &stru_1E26E9728;
    if (v17)
      v23 = v17;
    v55[0] = CFSTR("client");
    v55[1] = CFSTR("id");
    v56[0] = v23;
    v56[1] = v13;
    v55[2] = CFSTR("predicate");
    v55[3] = CFSTR("version");
    v56[2] = v14;
    v56[3] = CFSTR("3.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v35 = v22;
      v36 = v24;
      objc_msgSend((id)objc_opt_class(), "description");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v12, "me");
      v29 = CFSTR("pseudo ");
      v30 = &stru_1E26E9728;
      if (!v28)
        v29 = &stru_1E26E9728;
      v34 = v29;
      objc_msgSend(v12, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "model");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "model");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR(" (%@)"), v33);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v46 = v38;
      v47 = 2114;
      v48 = v34;
      v49 = 2114;
      v50 = v37;
      v51 = 2114;
      v52 = v30;
      v53 = 2112;
      v54 = v36;
      _os_log_debug_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Sending unsubscribe to context value changes request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v31)
      {

      }
      v22 = v35;
      v24 = v36;
    }

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __144___DKSyncRapportContextStorage_unsubscribeFromContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke;
    v41[3] = &unk_1E26E7028;
    v41[4] = self;
    v42 = v12;
    v43 = v22;
    v44 = v15;
    v26 = v22;
    -[_DKSyncRapportStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self, "sendRequestID:request:peer:highPriority:options:responseHandler:", CFSTR("com.apple.coreduet.unsubscribe-to-context-value-changes"), v24, v42, v8, 0, v41);

  }
  else if (objc_msgSend(v13, "length"))
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __144___DKSyncRapportContextStorage_unsubscribeFromContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke_2;
    v39[3] = &unk_1E26E2FE8;
    v40 = v15;
    -[_DKSyncRapportStorage handleAvailabilityFailureWithPeer:completion:](self, "handleAvailabilityFailureWithPeer:completion:", v12, v39);

  }
  else
  {
    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v27);

  }
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  void *v7;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void (*v26)(_QWORD *, NSObject *);
  int v27;
  const __CFString *v28;
  __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v20);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:].cold.1();
    }

    if (v16)
    {
      if (-[NSObject code](v16, "code") == -6714
        && (-[NSObject domain](v16, "domain"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D83988]),
            v22,
            v23))
      {
        +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeActiveTransports:fromPeer:](v24, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v17);
      }
      else
      {
        objc_msgSend(a1, "transformResponseError:", v16);
        v24 = v16;
        v16 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v17, "me");
        v28 = &stru_1E26E9728;
        if (v27)
          v28 = CFSTR("pseudo ");
        v31 = v28;
        objc_msgSend(v17, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "model");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v17, "model");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", CFSTR(" (%@)"), v7);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = &stru_1E26E9728;
        }
        *(_DWORD *)buf = 138544386;
        v36 = v33;
        v37 = 2114;
        v38 = v31;
        v39 = 2114;
        v40 = v32;
        v41 = 2114;
        v42 = v29;
        v43 = 2112;
        v44 = v14;
        _os_log_debug_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Received unsubscribe to context value changes response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v34)
        {

        }
      }
      v16 = 0;
    }

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v18, v25, 1);

    }
    if (v19)
    {
      v26 = (void (*)(_QWORD *, NSObject *))v19[2];
      if (v16)
      {
        v26(v19, v16);
      }
      else
      {
        v26(v19, 0);
        v16 = 0;
      }
    }
  }

}

- (void)setDelegate:(id)a3
{
  _DKSyncRemoteContextStorageDelegate *v4;
  NSObject *v5;
  _DKSyncRemoteContextStorageDelegate *delegate;
  _DKSyncRemoteContextStorageDelegate *v7;
  void *v8;
  id v9;

  v4 = (_DKSyncRemoteContextStorageDelegate *)a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  delegate = self->_delegate;
  self->_delegate = v4;
  v7 = v4;

  -[_DKSyncRemoteContextStorageDelegate deviceUUID](self->_delegate, "deviceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_DKSyncRapportStorage setDeviceID:](self, "setDeviceID:", v9);
}

- (_DKSyncRemoteContextStorageDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Calling response handler with fetch context values response: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to fetch context values, missing delegate", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_0_12(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received fetch context values request for key paths '%@'", v5, v6);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received fetch context values request: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling fetch context values request", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Calling response handler with sent context values response: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to receive sent context values, missing delegate", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18DDBE000, "%{public}@: Failed to receive sent context values, unknown peer source device id: %{public}@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18DDBE000, "%{public}@: Failed to receive sent context values, invalid object class: %{public}@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18DDBE000, "%{public}@: Invalid request, client attempting to masquerade as client %{public}@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received sent context values: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling sent context values", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Calling response handler with subscribe to context value changes response: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to subscribe to context value changes, missing delegate", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18DDBE000, "%{public}@: Failed to subscribe to context value changes, unknown peer source device id: %{public}@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to subscribe to context value changes, missing registration identifier", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received subscribe to context value changes request: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling subscribe to context value changes request", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Calling response handler with unsubscribe to context value changes response: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to unsubscribe to context value changes, missing delegate", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received unsubscribe to context value changes request: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling unsubscribe to context value changes request", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchContextValuesWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling fetch context values response", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSendContextValuesWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling sent context values response", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleSubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling subscribe to context value changes response", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling unsubscribe to context value changes response", v5);

  OUTLINED_FUNCTION_33();
}

@end
