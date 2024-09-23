@implementation ATXSettingsActionsServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_43 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_43, &__block_literal_global_252);
  return (id)sharedInstance__pasExprOnceResult_58;
}

void __42__ATXSettingsActionsServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_58;
  sharedInstance__pasExprOnceResult_58 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXSettingsActionsServer)init
{
  ATXSettingsActionsServer *v2;
  id v3;
  uint64_t v4;
  NSXPCListener *listener;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXSettingsActionsServer;
  v2 = -[ATXSettingsActionsServer init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x1E0CF8B08]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    __atxlog_handle_settings_actions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Listening for connections", v8, 2u);
    }

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v19[16];
  uint8_t buf[16];

  v5 = a4;
  __atxlog_handle_settings_actions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Connection attempted", buf, 2u);
  }

  objc_msgSend(v5, "valueForEntitlement:", *MEMORY[0x1E0CF8B08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    __atxlog_handle_settings_actions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "Connection established", v19, 2u);
    }

    ATXSettingsActionsInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v9);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_9_7);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_11_6);
    objc_msgSend(v5, "resume");
    v10 = 1;
  }
  else
  {
    __atxlog_handle_settings_actions();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXSettingsActionsServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);

    v10 = 0;
  }

  return v10;
}

void __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_settings_actions();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_settings_actions();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_10_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (id)_suggestedActionsWithRequest:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;

  v3 = objc_msgSend(a3, "limit");
  if (v3)
    v4 = v3;
  else
    v4 = 4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9078]), "initWithConsumerSubType:", 46);
  objc_msgSend(v5, "suggestionLayoutFromCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allSuggestionsInLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_14_6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = objc_msgSend(v11, "count");
  if (v4 >= v12)
    v13 = v12;
  else
    v13 = v4;
  objc_msgSend(v11, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __57__ATXSettingsActionsServer__suggestedActionsWithRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CF9098];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithProactiveSuggestion:", v3);

  return v4;
}

- (void)suggestedActionsWithRequest:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = a3;
  __atxlog_handle_settings_actions();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_settings_actions();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RetrieveSuggestedActions", " enableTelemetry=YES ", buf, 2u);
  }

  -[ATXSettingsActionsServer _suggestedActionsWithRequest:](self, "_suggestedActionsWithRequest:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90B0]), "initWithActions:", v12);
  v6[2](v6, v13, 0);

  __atxlog_handle_settings_actions();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v15, OS_SIGNPOST_INTERVAL_END, v9, "RetrieveSuggestedActions", " enableTelemetry=YES ", v16, 2u);
  }

}

- (void)recentActionsWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  os_signpost_id_t spid;
  _QWORD v53[4];
  NSObject *v54;
  uint64_t v55;
  _QWORD v56[5];
  uint8_t v57[8];
  id obj;
  uint8_t buf[8];
  _QWORD v60[4];
  id v61;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  __atxlog_handle_settings_actions();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  __atxlog_handle_settings_actions();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RetrieveRecentActions", " enableTelemetry=YES ", buf, 2u);
  }
  spid = v8;

  v12 = objc_msgSend(v5, "limit");
  if (v12)
    v13 = v12;
  else
    v13 = 10;
  *(_QWORD *)buf = 0;
  v60[0] = buf;
  v60[1] = 0x3032000000;
  v60[2] = __Block_byref_object_copy__107;
  v60[3] = __Block_byref_object_dispose__107;
  v61 = 0;
  v14 = objc_alloc_init(MEMORY[0x1E0D44288]);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id *)(v60[0] + 40);
  obj = *(id *)(v60[0] + 40);
  objc_msgSend(v14, "transcriptPublisherWithStreamName:fromDate:toDate:maxEvents:reversed:error:", 0, v15, v16, 0, 1, &obj);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v17, obj);

  if (v18 && !*(_QWORD *)(v60[0] + 40))
  {
    v30 = (void *)objc_opt_new();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __71__ATXSettingsActionsServer_recentActionsWithRequest_completionHandler___block_invoke;
    v56[3] = &unk_1E82DB658;
    v56[4] = buf;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __71__ATXSettingsActionsServer_recentActionsWithRequest_completionHandler___block_invoke_2;
    v53[3] = &unk_1E82EBA60;
    v29 = v30;
    v54 = v29;
    v55 = v13;
    v31 = (id)objc_msgSend(v18, "sinkWithCompletion:shouldContinue:", v56, v53);
    if (*(_QWORD *)(v60[0] + 40))
    {
      __atxlog_handle_settings_actions();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[ATXSettingsActionsServer recentActionsWithRequest:completionHandler:].cold.2((uint64_t)v60, v32, v33, v34, v35, v36, v37, v38);

      v39 = *(void **)(v60[0] + 40);
      v40 = v39;
      if (!v39)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATXSettingsActionsServer"), -2, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v6[2](v6, 0, v40);
      if (!v39)

      __atxlog_handle_settings_actions();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        *(_WORD *)v57 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v42, OS_SIGNPOST_INTERVAL_END, spid, "RetrieveRecentActions", " enableTelemetry=YES ", v57, 2u);
      }
    }
    else
    {
      v43 = (void *)MEMORY[0x1E0C99E60];
      v44 = (void *)objc_opt_new();
      -[ATXSettingsActionsServer _suggestedActionsWithRequest:](self, "_suggestedActionsWithRequest:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setWithArray:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject minusSet:](v29, "minusSet:", v46);

      v47 = objc_alloc(MEMORY[0x1E0CF90B0]);
      -[NSObject array](v29, "array");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v47, "initWithActions:", v48);

      ((void (**)(id, NSObject *, void *))v6)[2](v6, v42, 0);
      __atxlog_handle_settings_actions();
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_WORD *)v57 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v50, OS_SIGNPOST_INTERVAL_END, spid, "RetrieveRecentActions", " enableTelemetry=YES ", v57, 2u);
      }

    }
  }
  else
  {
    __atxlog_handle_settings_actions();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXSettingsActionsServer recentActionsWithRequest:completionHandler:].cold.1((uint64_t)v60, v19, v20, v21, v22, v23, v24, v25);

    v26 = *(void **)(v60[0] + 40);
    v27 = v26;
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATXSettingsActionsServer"), -1, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6[2](v6, 0, v27);
    if (!v26)

    __atxlog_handle_settings_actions();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)v57 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v29, OS_SIGNPOST_INTERVAL_END, spid, "RetrieveRecentActions", " enableTelemetry=YES ", v57, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

void __71__ATXSettingsActionsServer_recentActionsWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v7, "error");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

BOOL __71__ATXSettingsActionsServer_recentActionsWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    goto LABEL_5;
  v9 = (void *)MEMORY[0x1E0CF9098];
  objc_msgSend(v3, "eventBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "isActionEligibleForSettingsSuggestionsWithBundleIdentifier:actionIdentifier:", v11, v14);

  if ((_DWORD)v9)
  {
    v15 = *(void **)(a1 + 32);
    v16 = objc_alloc(MEMORY[0x1E0CF9098]);
    objc_msgSend(v3, "eventBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventBody");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "executionDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v16, "initWithAction:date:", v18, v20);
    objc_msgSend(v15, "addObject:", v21);

    v22 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 40);
  }
  else
  {
LABEL_5:
    v22 = 1;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Rejecting connection %@ without entitlement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Unexpected interruption", a5, a6, a7, a8, 0);
}

void __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_10_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Connection invalidated", a5, a6, a7, a8, 0);
}

- (void)recentActionsWithRequest:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Unable to create recent action publisher: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)recentActionsWithRequest:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Unable to scan recent Settings actions: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
