@implementation CalSuggestionsProvider

+ (id)defaultProvider
{
  if (defaultProvider_onceToken != -1)
    dispatch_once(&defaultProvider_onceToken, &__block_literal_global_15);
  return (id)defaultProvider__defaultProvider;
}

void __41__CalSuggestionsProvider_defaultProvider__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultProvider__defaultProvider;
  defaultProvider__defaultProvider = v0;

}

- (CalSuggestionsProvider)init
{
  CalSuggestionsProvider *v2;
  CalSuggestionsProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalSuggestionsProvider;
  v2 = -[CalSuggestionsProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CalSuggestionsProvider _loadSuggestionsFramework](v2, "_loadSuggestionsFramework");
    if (-[CalSuggestionsProvider suggestionsFrameworkAvailable](v3, "suggestionsFrameworkAvailable"))
    {
      -[objc_class serviceForEvents](NSClassFromString(CFSTR("SGSuggestionsService")), "serviceForEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalSuggestionsProvider setService:](v3, "setService:", v4);

    }
  }
  return v3;
}

- (void)_loadSuggestionsFramework
{
  void *v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  int v8[3];
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315650;
  OUTLINED_FUNCTION_1_3();
  v9 = v4;
  v10 = v6;
  v11 = v7;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to load Suggestions bundle with error: %@ userInfo: %@", (uint8_t *)v8, 0x20u);

}

- (id)sgEventFromUniqueID:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  if (-[CalSuggestionsProvider suggestionsFrameworkAvailable](self, "suggestionsFrameworkAvailable"))
  {
    v7 = dispatch_semaphore_create(0);
    -[CalSuggestionsProvider service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__CalSuggestionsProvider_sgEventFromUniqueID_error___block_invoke;
    v14[3] = &unk_1E2A848C0;
    v16 = &v18;
    v17 = a4;
    v9 = v7;
    v15 = v9;
    objc_msgSend(v8, "eventFromUniqueId:withCompletion:", v6, v14);

    v10 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v9, v10) >= 1)
    {
      +[CalFoundationLogSubsystem suggestions](CalFoundationLogSubsystem, "suggestions");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CalSuggestionsProvider sgEventFromUniqueID:error:].cold.1((uint64_t)v6, v11);

    }
  }
  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __52__CalSuggestionsProvider_sgEventFromUniqueID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)confirmEventWithSuggestionID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[CalSuggestionsProvider suggestionsFrameworkAvailable](self, "suggestionsFrameworkAvailable"))
  {
    -[CalSuggestionsProvider service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__CalSuggestionsProvider_confirmEventWithSuggestionID___block_invoke;
    v6[3] = &unk_1E2A848E8;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "eventFromUniqueId:withCompletion:", v7, v6);

  }
}

void __55__CalSuggestionsProvider_confirmEventWithSuggestionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;

  v5 = a3;
  objc_msgSend(a2, "recordId");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      objc_msgSend(v8, "confirmEventByRecordId:error:", v7, &v10);
      v5 = v10;

      if (v5)
      {
        +[CalFoundationLogSubsystem suggestions](CalFoundationLogSubsystem, "suggestions");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __55__CalSuggestionsProvider_confirmEventWithSuggestionID___block_invoke_cold_1();

      }
    }
  }

}

- (id)senderForEventWithSuggestionID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CalSuggestionsProvider sgEventFromUniqueID:error:](self, "sgEventFromUniqueID:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sgRecordIDForEventWithSuggestionID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[CalSuggestionsProvider sgEventFromUniqueID:error:](self, "sgEventFromUniqueID:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fakeSGRecordID
{
  Class v2;
  void *v3;

  if (-[CalSuggestionsProvider suggestionsFrameworkAvailable](self, "suggestionsFrameworkAvailable"))
  {
    v2 = NSClassFromString(CFSTR("SGRecordId"));
    -[objc_class recordIdWithNumericValue:](v2, "recordIdWithNumericValue:", arc4random());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)confirmSGEventWithRecordID:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;

  v4 = a3;
  if (-[CalSuggestionsProvider suggestionsFrameworkAvailable](self, "suggestionsFrameworkAvailable"))
  {
    v5 = dispatch_semaphore_create(0);
    -[CalSuggestionsProvider service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__CalSuggestionsProvider_confirmSGEventWithRecordID___block_invoke;
    v17[3] = &unk_1E2A84910;
    v7 = v5;
    v18 = v7;
    objc_msgSend(v6, "confirmEventByRecordId:withCompletion:", v4, v17);

    v8 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v7, v8) >= 1)
    {
      +[CalFoundationLogSubsystem suggestions](CalFoundationLogSubsystem, "suggestions");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CalSuggestionsProvider confirmSGEventWithRecordID:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    }
  }

}

intptr_t __53__CalSuggestionsProvider_confirmSGEventWithRecordID___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)rejectSGEventWithRecordID:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;

  v4 = a3;
  if (-[CalSuggestionsProvider suggestionsFrameworkAvailable](self, "suggestionsFrameworkAvailable"))
  {
    v5 = dispatch_semaphore_create(0);
    -[CalSuggestionsProvider service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__CalSuggestionsProvider_rejectSGEventWithRecordID___block_invoke;
    v17[3] = &unk_1E2A84910;
    v7 = v5;
    v18 = v7;
    objc_msgSend(v6, "rejectEventByRecordId:withCompletion:", v4, v17);

    v8 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v7, v8) >= 1)
    {
      +[CalFoundationLogSubsystem suggestions](CalFoundationLogSubsystem, "suggestions");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CalSuggestionsProvider rejectSGEventWithRecordID:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    }
  }

}

intptr_t __52__CalSuggestionsProvider_rejectSGEventWithRecordID___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)eventsFoundInMailEnabled
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("com.apple.iCal")) ^ 1;

  return v3;
}

- (BOOL)suggestionsFrameworkAvailable
{
  return self->_suggestionsFrameworkAvailable;
}

- (void)setSuggestionsFrameworkAvailable:(BOOL)a3
{
  self->_suggestionsFrameworkAvailable = a3;
}

- (SGSuggestionsServiceEventsProtocol)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)sgEventFromUniqueID:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "We timed out waiting for Suggestions to get an event for unique id %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __55__CalSuggestionsProvider_confirmEventWithSuggestionID___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  int v2[3];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_1_3();
  v3 = v0;
  OUTLINED_FUNCTION_0_4(&dword_18FC12000, v1, (uint64_t)v1, "confirmEventWithSuggestionID: %@ failed with error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)confirmSGEventWithRecordID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, a1, a3, "We timed out waiting for Suggestions to confirm our event.", a5, a6, a7, a8, 0);
}

- (void)rejectSGEventWithRecordID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, a1, a3, "We timed out waiting for Suggestions to reject our event.", a5, a6, a7, a8, 0);
}

@end
