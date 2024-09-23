@implementation MOAppEngagementReporter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_engagementReporter;
}

void __41__MOAppEngagementReporter_sharedInstance__block_invoke()
{
  MOAppEngagementReporter *v0;
  void *v1;

  v0 = objc_alloc_init(MOAppEngagementReporter);
  v1 = (void *)sharedInstance_engagementReporter;
  sharedInstance_engagementReporter = (uint64_t)v0;

}

- (MOAppEngagementReporter)init
{
  MOAppEngagementReporter *v2;
  void *v3;
  uint64_t v4;
  NSXPCConnection *connection;
  uint64_t v6;
  MOAppEngagementXPCProtocol *proxy;
  NSObject *v8;
  MOAppEngagementReporter *v9;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MOAppEngagementReporter;
  v2 = -[MOAppEngagementReporter init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF99CBA8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.momentsd"), 0);
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v4;

    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", v3);
    -[NSXPCConnection setInterruptionHandler:](v2->connection, "setInterruptionHandler:", &__block_literal_global_6);
    -[NSXPCConnection setInvalidationHandler:](v2->connection, "setInvalidationHandler:", &__block_literal_global_8);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v2->connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
    v6 = objc_claimAutoreleasedReturnValue();
    proxy = v2->proxy;
    v2->proxy = (MOAppEngagementXPCProtocol *)v6;

    -[NSXPCConnection resume](v2->connection, "resume");
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "MOAppEngagementReporter initiate client", v11, 2u);
    }

    v9 = v2;
  }

  return v2;
}

void __31__MOAppEngagementReporter_init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_DEFAULT, "Engagement reporter xpc interrupted", v1, 2u);
  }

}

void __31__MOAppEngagementReporter_init__block_invoke_7()
{
  NSObject *v0;
  uint8_t v1[16];

  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_DEFAULT, "Engagement reporter xpc invalidated", v1, 2u);
  }

}

void __31__MOAppEngagementReporter_init__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __31__MOAppEngagementReporter_init__block_invoke_9_cold_1(v2, v3);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MOAppEngagementReporter;
  -[MOAppEngagementReporter dealloc](&v3, sel_dealloc);
}

- (void)didAppEntryUpdateUsingSuggestions:(id)a3 onEvent:(unint64_t)a4 duringInterval:(id)a5 withInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v11, "count"))
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.7();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAppEngagementReporter.m"), 64, CFSTR("MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: missing suggestionIdentifiers (in %s:%d)"), "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 64);

  }
  if ((unint64_t)objc_msgSend(v11, "count") > 0xA)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.6();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAppEngagementReporter.m"), 65, CFSTR("MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: suggestionIdentifiers count should be up to kMOMaxAppEntrySuggestionsCount (in %s:%d)"), "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 65);

  }
  objc_msgSend(v12, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "compare:", v19);

  if (v20 == 1)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.5();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAppEngagementReporter.m"), 66, CFSTR("MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: can't update entries in the future (in %s:%d)"), "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 66);

  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.4(v23);

  if (a4 - 3 >= 2)
  {
    if (a4 - 1 > 1)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.1();

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAppEngagementReporter.m"), 81, CFSTR("MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Unexpected update event (in %s:%d)"), "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 81);
      goto LABEL_28;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.3();

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAppEngagementReporter.m"), 73, CFSTR("MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Missing .addedCharacters key (in %s:%d)"), "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 73);

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("entryTotalCharacters"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAppEngagementReporter.m"), 74, CFSTR("MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Missing .totalCharacters key (in %s:%d)"), "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 74);
LABEL_28:

    }
  }
  -[MOAppEngagementXPCProtocol didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:](self->proxy, "didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:", v11, a4, v12, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->proxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

void __31__MOAppEngagementReporter_init__block_invoke_9_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedFailureReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = CFSTR("Error on remote object proxy");
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_ERROR, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);

}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Unexpected update event (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Missing .totalCharacters key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Missing .addedCharacters key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didAppEntryUpdateUsingSuggestions:(os_log_t)log onEvent:duringInterval:withInfo:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CAE42000, log, OS_LOG_TYPE_DEBUG, "calling appEntryUpdatedForSuggestionID", v1, 2u);
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: can't update entries in the future (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: suggestionIdentifiers count should be up to kMOMaxAppEntrySuggestionsCount (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: missing suggestionIdentifiers (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
