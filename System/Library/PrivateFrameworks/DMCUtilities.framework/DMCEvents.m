@implementation DMCEvents

- (DMCEvents)init
{
  DMCEvents *v2;
  DMCEvents *v3;
  _QWORD block[4];
  DMCEvents *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMCEvents;
  v2 = -[DMCEvents init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __17__DMCEvents_init__block_invoke;
    block[3] = &unk_1E4D37148;
    v6 = v2;
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, block);

  }
  return v3;
}

void __17__DMCEvents_init__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_eventsFileFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v2, 0);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_eventsFileFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  }
}

- (void)logRegularEventForTopic:(id)a3 reason:(id)a4 details:(id)a5
{
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    v8 = (const __CFString *)a4;
  else
    v8 = CFSTR("Unknown");
  v15 = CFSTR("Reason");
  v16[0] = v8;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  -[DMCEvents _injectTimestamps:](self, "_injectTimestamps:", v14);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("Details"));

  -[DMCEvents _logEvent:category:forTopic:](self, "_logEvent:category:forTopic:", v14, CFSTR("Regular"), v12);
}

- (void)logErrorEventForTopic:(id)a3 reason:(id)a4 error:(id)a5 details:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  if (v11)
    v13 = v11;
  else
    v13 = CFSTR("Unknown");
  v22 = CFSTR("Reason");
  v23[0] = v13;
  v14 = (void *)MEMORY[0x1E0C99D80];
  v15 = a6;
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  -[DMCEvents _injectTimestamps:](self, "_injectTimestamps:", v17);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("Details"));

  if (v12)
  {
    objc_msgSend(v12, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("Error Domain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "code"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("Error Code"));

    objc_msgSend(v12, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("Error Description"));

    objc_msgSend(v12, "underlyingErrors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("Error Underlying Errors"));

  }
  -[DMCEvents _logEvent:category:forTopic:](self, "_logEvent:category:forTopic:", v17, CFSTR("Error"), v10);

}

- (void)_logEvent:(id)a3 category:(id)a4 forTopic:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_logEvent_category_forTopic__onceToken != -1)
    dispatch_once(&_logEvent_category_forTopic__onceToken, &__block_literal_global_7);
  v11 = _logEvent_category_forTopic__serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__DMCEvents__logEvent_category_forTopic___block_invoke_2;
  block[3] = &unk_1E4D372B0;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async_and_wait(v11, block);

}

void __41__DMCEvents__logEvent_category_forTopic___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("DMCEvents", 0);
  v1 = (void *)_logEvent_category_forTopic__serialQueue;
  _logEvent_category_forTopic__serialQueue = (uint64_t)v0;

}

void __41__DMCEvents__logEvent_category_forTopic___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_eventsPlistFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__DMCEvents__logEvent_category_forTopic___block_invoke_3;
  v9[3] = &unk_1E4D37288;
  v10 = a1[5];
  v11 = a1[6];
  v5 = a1[7];
  v6 = a1[4];
  v12 = v5;
  v13 = v6;
  objc_msgSend(v4, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v3, 0, v3, 0, &v14, v9);
  v7 = v14;

  if (v7)
  {
    v8 = *DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_ERROR, "[NSFileCoordinator coordinateReadingItemAtURL] failed with error: %{public}@", buf, 0xCu);
    }
  }

}

void __41__DMCEvents__logEvent_category_forTopic___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (!v9)
    goto LABEL_3;
  v10 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v5, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "DMCDictionaryFromFile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (!v13)
  {
LABEL_3:
    v14 = *DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_INFO, "Failed to load event dictionary. Creating a new one", buf, 2u);
    }
    v13 = (void *)objc_opt_new();
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v19 = *DMCLogObjects();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1A4951000, v19, OS_LOG_TYPE_ERROR, "Event category is not a dictionary", v35, 2u);
      }
      objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
    }
  }
  v20 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryWithDictionary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = objc_opt_isKindOfClass();

    if ((v26 & 1) == 0)
    {
      v27 = *DMCLogObjects();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1A4951000, v27, OS_LOG_TYPE_ERROR, "Topic is not an array", v34, 2u);
      }
      objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    }
  }
  v28 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "arrayWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "insertObject:atIndex:", *(_QWORD *)(a1 + 48), 0);
  v31 = objc_msgSend(*(id *)(a1 + 56), "_maximumEventCount");
  if (objc_msgSend(v30, "count") > v31)
    objc_msgSend(v30, "removeObjectsInRange:", v31, objc_msgSend(v30, "count") - v31);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, *(_QWORD *)(a1 + 40));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "absoluteString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "DMCWriteToBinaryFile:", v32);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v6, "absoluteString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    DMCSetSkipBackupAttributeToItemAtPath(v33, 1);

  }
}

- (void)_injectTimestamps:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCDateFormatterFactory isoLocalTimeZoneDateFormatter](DMCDateFormatterFactory, "isoLocalTimeZoneDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Timestamp (Localized)"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("Timestamp"));

}

- (id)_eventsPlistFilePath
{
  NSString *errorFilePath;
  NSString *v4;
  NSString *v5;

  errorFilePath = self->_errorFilePath;
  if (!errorFilePath)
  {
    DMCEventsFilePath();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_errorFilePath;
    self->_errorFilePath = v4;

    errorFilePath = self->_errorFilePath;
  }
  return errorFilePath;
}

- (unint64_t)_maximumEventCount
{
  return 30;
}

- (NSString)errorFilePath
{
  return self->_errorFilePath;
}

- (void)setErrorFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_errorFilePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorFilePath, 0);
}

@end
