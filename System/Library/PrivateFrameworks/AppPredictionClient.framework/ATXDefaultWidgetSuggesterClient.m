@implementation ATXDefaultWidgetSuggesterClient

- (ATXDefaultWidgetSuggesterClient)init
{
  ATXDefaultWidgetSuggesterClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXDefaultWidgetSuggesterClient;
  v2 = -[ATXDefaultWidgetSuggesterClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.DefaultWidgetSuggester"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    ATXDefaultWidgetSuggesterInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_65);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  return v2;
}

void __39__ATXDefaultWidgetSuggesterClient_init__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_home_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __39__ATXDefaultWidgetSuggesterClient_init__block_invoke_cold_1();

}

+ (BOOL)shouldSuggestTVWithAppLaunchCount:(double)a3 intentDonationCount:(double)a4 upcomingMediaCount:(double)a5
{
  return a5 >= 1.0 && a3 >= 3.0;
}

- (void)defaultWidgetSuggestionOfType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSXPCConnection *xpcConnection;
  id v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  NSObject *v34;
  ATXDefaultWidgetSuggestion *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  _BYTE v48[14];
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 == 1)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v8 = (void *)objc_msgSend(v7, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    v9 = objc_msgSend(v8, "integerForKey:", *MEMORY[0x1E0CF9438]);
    if (v9 < 1)
    {
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CF93F0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CF9400]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CF9408]);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v13)
        v17 = v15 == 0;
      else
        v17 = 1;
      if (v17 || v14 == 0)
      {
        __atxlog_handle_home_screen();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A49EF000, v19, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: requesting full computation of TV widget suggstion", buf, 2u);
        }

        v20 = MEMORY[0x1E0C809B0];
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke;
        v43[3] = &unk_1E4D5AC68;
        v44 = v8;
        v21 = v6;
        v45 = v21;
        v46 = 1;
        v22 = (void *)MEMORY[0x1A85A511C](v43);
        xpcConnection = self->_xpcConnection;
        v41[0] = v20;
        v41[1] = 3221225472;
        v41[2] = __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_16;
        v41[3] = &unk_1E4D571E0;
        v24 = v22;
        v42 = v24;
        -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v41);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v20;
        v37[1] = 3221225472;
        v37[2] = __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_18;
        v37[3] = &unk_1E4D5AC90;
        v38 = v24;
        v39 = v21;
        v40 = 1;
        v26 = v24;
        objc_msgSend(v25, "shouldSuggestTVWithCompletionHandler:", v37);

      }
      else
      {
        v27 = (void *)objc_opt_class();
        objc_msgSend(v13, "doubleValue");
        v29 = v28;
        objc_msgSend(v14, "doubleValue");
        v31 = v30;
        objc_msgSend(v16, "doubleValue");
        v33 = objc_msgSend(v27, "shouldSuggestTVWithAppLaunchCount:intentDonationCount:upcomingMediaCount:", v29, v31, v32);
        __atxlog_handle_home_screen();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v48 = v33;
          *(_WORD *)&v48[4] = 2114;
          *(_QWORD *)&v48[6] = v13;
          v49 = 2114;
          v50 = v14;
          v51 = 2114;
          v52 = v16;
          _os_log_impl(&dword_1A49EF000, v34, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: returning TV widget suggestion (%{BOOL}d) using cached app launches: %{public}@, intent donations: %{public}@, upcoming media: %{public}@", buf, 0x26u);
        }

        if ((v33 & 1) != 0)
        {
          v36 = -[ATXDefaultWidgetSuggestion initWithType:]([ATXDefaultWidgetSuggestion alloc], "initWithType:", 1);
          (*((void (**)(id, ATXDefaultWidgetSuggestion *))v6 + 2))(v6, v36);

        }
        else
        {
          (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
        }
      }

    }
    else
    {
      v10 = v9;
      __atxlog_handle_home_screen();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v48 = v10;
        _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: not making a TV suggestion that we have feedback for: %ld", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }

  }
  else
  {
    __atxlog_handle_home_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXDefaultWidgetSuggesterClient defaultWidgetSuggestionOfType:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  ATXDefaultWidgetSuggestion *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[16];
  __int16 v12;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0CF93F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v8 = "ATXDefaultWidgetSuggesterClient: no cached AzulF key";
      v9 = (uint8_t *)&v12;
LABEL_13:
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
LABEL_14:

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_cold_1();
    goto LABEL_14;
  }
  v3 = objc_msgSend(v2, "BOOLValue");
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      v10 = 0;
      v8 = "ATXDefaultWidgetSuggesterClient: returning TV widget suggestion (NO) using cached AzulF BOOL";
      v9 = (uint8_t *)&v10;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: returning TV widget suggestion (YES) using cached AzulF BOOL", buf, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  v7 = -[ATXDefaultWidgetSuggestion initWithType:]([ATXDefaultWidgetSuggestion alloc], "initWithType:", *(_QWORD *)(a1 + 48));
  (*(void (**)(uint64_t, ATXDefaultWidgetSuggestion *))(v6 + 16))(v6, v7);

LABEL_15:
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_16_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_18(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ATXDefaultWidgetSuggestion *v15;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __atxlog_handle_home_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_18_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

LABEL_9:
    (*(void (**)(void))(a1[4] + 16))();
    goto LABEL_10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = a2;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXDefaultWidgetSuggesterClient: returning TV widget suggestion (%{BOOL}d) after full computation", (uint8_t *)v16, 8u);
  }

  if (!a2)
    goto LABEL_9;
  v14 = a1[5];
  v15 = -[ATXDefaultWidgetSuggestion initWithType:]([ATXDefaultWidgetSuggestion alloc], "initWithType:", a1[6]);
  (*(void (**)(uint64_t, ATXDefaultWidgetSuggestion *))(v14 + 16))(v14, v15);

LABEL_10:
}

- (void)logEventForDefaultWidgetSuggestionType:(int64_t)a3 event:(int64_t)a4
{
  id v5;
  uint64_t *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a3 == 1)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v10 = (id)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    objc_msgSend(v10, "setInteger:forKey:", a4, *MEMORY[0x1E0CF9438]);
    if (a4 == 3)
    {
      v6 = (uint64_t *)MEMORY[0x1E0CF9430];
    }
    else
    {
      if (a4 != 1)
      {
LABEL_11:

        return;
      }
      v6 = (uint64_t *)MEMORY[0x1E0CF9428];
    }
    v8 = *v6;
    objc_msgSend(v10, "objectForKey:", *v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v10, "setDouble:forKey:", v8);
    }
    goto LABEL_11;
  }
  __atxlog_handle_home_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[ATXDefaultWidgetSuggesterClient defaultWidgetSuggestionOfType:completionHandler:].cold.1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __39__ATXDefaultWidgetSuggesterClient_init__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "ATXDefaultWidgetSuggesterClient: connection to ATXDefaultWidgetSuggester server interrupted", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)defaultWidgetSuggestionOfType:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXDefaultWidgetSuggesterClient: currently only the TV widget is supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXDefaultWidgetSuggesterClient: the cached value is not of type NSNumber", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_16_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXDefaultWidgetSuggesterClient: XPC error; could not compute TV widget suggestion via duetexpertd: %@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __83__ATXDefaultWidgetSuggesterClient_defaultWidgetSuggestionOfType_completionHandler___block_invoke_18_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXDefaultWidgetSuggesterClient: could not compute TV widget suggestion via duetexpertd: %@", a5, a6, a7, a8, 2u);
}

@end
