@implementation CNAPITriageLogger

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_23 != -1)
    dispatch_once(&os_log_cn_once_token_0_23, &__block_literal_global_136);
  return (OS_os_log *)(id)os_log_cn_once_object_0_23;
}

+ (void)setThreadEntryPoint:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_triage_logger_entry_point"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      NSStringFromSelector(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("_triage_logger_entry_point"));

    }
  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("_triage_logger_entry_point"));
  }

}

- (void)didExecuteFetchRequest:(id)a3 duration:(double)a4
{
  id v6;
  OS_os_log *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *log;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_log;
  v8 = objc_msgSend(v6, "signpostId");
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled((os_log_t)v7))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_18F8BD000, (os_log_t)v7, OS_SIGNPOST_INTERVAL_END, v9, "Fetching Contacts", ", (uint8_t *)&v14, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v12 = log;
    v13 = objc_msgSend(v6, "serialNumber");
    v14 = 134218242;
    v15 = v13;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "%04llx FINISH (%{public}@)", (uint8_t *)&v14, 0x16u);

  }
}

- (void)request:(id)a3 spentTimeInClientCode:(double)a4
{
  id v6;
  void *v7;
  NSObject *log;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = log;
    v10 = 134218242;
    v11 = objc_msgSend(v6, "serialNumber");
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_DEFAULT, "%04llx Time spent in client code: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)request:(id)a3 containsContact:(id)a4
{
  NSObject *log;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = log;
    v8 = a4;
    v9 = objc_msgSend(a3, "serialNumber");
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 134218242;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_DEFAULT, "%04llx Contact: %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)willExecuteFetchRequest:(id)a3
{
  __CFString *v4;
  NSObject *log;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  OS_os_log *v22;
  uint64_t v23;
  os_signpost_id_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = log;
    v25 = 134218243;
    v26 = -[__CFString serialNumber](v4, "serialNumber");
    v27 = 2113;
    v28 = v4;
    _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_DEFAULT, "%04llx BEGIN: Will execute fetch for request: %{private}@", (uint8_t *)&v25, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "threadEntryPoint");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("(unknown)");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = -[__CFString serialNumber](v4, "serialNumber");
    v25 = 134218242;
    v26 = v13;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "%04llx Entry point: %{public}@", (uint8_t *)&v25, 0x16u);

  }
  v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = -[__CFString serialNumber](v4, "serialNumber");
    -[__CFString predicate](v4, "predicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString predicate](v4, "predicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 134218499;
    v26 = v16;
    v27 = 2114;
    v28 = v19;
    v29 = 2113;
    v30 = v20;
    _os_log_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_DEFAULT, "%04llx Predicate: %{public}@ %{private}@", (uint8_t *)&v25, 0x20u);

  }
  -[__CFString predicate](v4, "predicate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cn_triageWithLog:serialNumber:", self->_log, -[__CFString serialNumber](v4, "serialNumber"));

  v22 = self->_log;
  v23 = -[__CFString signpostId](v4, "signpostId");
  if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled((os_log_t)v22))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_18F8BD000, (os_log_t)v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "Fetching Contacts", ", (uint8_t *)&v25, 2u);
    }
  }

}

+ (id)threadEntryPoint
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_triage_logger_entry_point"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)clientStoppedEnumerationForRequest:(id)a3
{
  NSObject *log;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = log;
    v6 = 134217984;
    v7 = objc_msgSend(a3, "serialNumber");
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "%04llx Client stopped enumeration of results", (uint8_t *)&v6, 0xCu);

  }
}

- (CNAPITriageLogger)init
{
  CNAPITriageLogger *v2;
  uint64_t v3;
  OS_os_log *log;
  CNAPITriageLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAPITriageLogger;
  v2 = -[CNAPITriageLogger init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v3 = objc_claimAutoreleasedReturnValue();
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)request:(id)a3 willReturnAnchor:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *log;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isSuccess");
  log = self->_log;
  if (v8)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = log;
      v11 = objc_msgSend(v6, "serialNumber");
      objc_msgSend(v7, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218242;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_DEFAULT, "%04llx History anchor returned to client: %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    -[CNAPITriageLogger request:willReturnAnchor:].cold.1(log, (uint64_t)v6, v7);
  }

}

- (void)didReturnAllResultsForContactFetchRequest:(id)a3
{
  NSObject *log;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = log;
    v6 = 134217984;
    v7 = objc_msgSend(a3, "serialNumber");
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "%04llx All results have been returned to the client", (uint8_t *)&v6, 0xCu);

  }
}

void __27__CNAPITriageLogger_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "api-triage");
  v1 = (void *)os_log_cn_once_object_0_23;
  os_log_cn_once_object_0_23 = (uint64_t)v0;

}

- (void)request:(id)a3 encounteredError:(id)a4
{
  id v5;
  NSObject *log;

  v5 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[CNAPITriageLogger request:encounteredError:].cold.1(log);

}

- (void)request:(id)a3 failedWithError:(id)a4
{
  id v5;
  NSObject *log;

  v5 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[CNAPITriageLogger request:failedWithError:].cold.1(log);

}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)request:(void *)a1 encounteredError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5(&dword_18F8BD000, v2, v3, "%04llx ERROR %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_4();
}

- (void)request:(void *)a3 willReturnAnchor:.cold.1(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_2_3();
  objc_msgSend(a3, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5(&dword_18F8BD000, v5, v6, "%04llx Could not fetch the current history anchor; the client will be handed a nil token, resulting in a full sync o"
    "n the next change history request. Error: %@",
    v7,
    v8,
    v9,
    v10,
    2u);

  OUTLINED_FUNCTION_1_4();
}

- (void)request:(void *)a1 failedWithError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5(&dword_18F8BD000, v2, v3, "%04llx Request failed with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_4();
}

@end
