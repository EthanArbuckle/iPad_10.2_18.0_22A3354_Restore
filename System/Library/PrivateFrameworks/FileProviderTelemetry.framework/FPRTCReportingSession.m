@implementation FPRTCReportingSession

- (id)truncateProviderVersion:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" ("));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (FPRTCReportingSession)initWithWithCommonProperties:(id)a3 manager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FPRTCReportingSession *v9;
  uint64_t v10;
  NSMutableDictionary *commonProperties;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *categoryHooks;
  NSObject *v16;
  FPRTCReportingSession *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("provider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v19.receiver = self;
    v19.super_class = (Class)FPRTCReportingSession;
    v9 = -[FPRTCReportingSession init](&v19, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v6, "mutableCopy");
      commonProperties = v9->_commonProperties;
      v9->_commonProperties = (NSMutableDictionary *)v10;

      -[NSMutableDictionary objectForKey:](v9->_commonProperties, "objectForKey:", CFSTR("providerVersion"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v9->_commonProperties;
        -[FPRTCReportingSession truncateProviderVersion:](v9, "truncateProviderVersion:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, CFSTR("providerVersion"));

      }
      objc_storeStrong((id *)&v9->_backingManager, a4);
      categoryHooks = v9->_categoryHooks;
      v9->_categoryHooks = 0;

      fp_current_or_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[FPRTCReportingSession initWithWithCommonProperties:manager:].cold.1();

    }
    self = v9;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a5;
  v10 = a6;
  v11 = (void *)-[NSMutableDictionary mutableCopy](self->_commonProperties, "mutableCopy");
  objc_msgSend(v11, "addEntriesFromDictionary:", v22);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x24BE7CA88]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v13, *MEMORY[0x24BE7CAA0]);

  if (v10)
  {
    objc_msgSend(v10, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("errorCode"));

    objc_msgSend(v10, "underlyingErrors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("underlyingErrorDomain"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "code"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("underlyingErrorCode"));

    }
    if ((unint64_t)objc_msgSend(v16, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "count") - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("moreUnderlyingErrors"));

    }
  }
  -[FPRTCReportingSessionManager postReportWithCategory:type:payload:error:decoratedPayload:session:observer:](self->_backingManager, "postReportWithCategory:type:payload:error:decoratedPayload:session:observer:", a3, a4, v22, v10, v11, self, self->_observer);

}

- (void)flushMessagesWithCompletion:(id)a3
{
  -[FPRTCReportingSessionManager flushMessagesWithCompletion:](self->_backingManager, "flushMessagesWithCompletion:", a3);
}

- (BOOL)flushMessagesSynchronouslyWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  FPRTCReportingSessionManager *backingManager;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v5 = dispatch_semaphore_create(0);
  backingManager = self->_backingManager;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __61__FPRTCReportingSession_flushMessagesSynchronouslyWithError___block_invoke;
  v16 = &unk_250C657B8;
  v18 = &v19;
  v7 = v5;
  v17 = v7;
  -[FPRTCReportingSessionManager flushMessagesWithCompletion:](backingManager, "flushMessagesWithCompletion:", &v13);
  v8 = dispatch_time(0, 16000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", 60, v13, v14, v15, v16);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v20[5];
    v20[5] = v9;

  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v11 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __61__FPRTCReportingSession_flushMessagesSynchronouslyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_commonProperties, "objectForKeyedSubscript:", CFSTR("provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_commonProperties, "objectForKeyedSubscript:", CFSTR("providerVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p for %@ version: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (void)setModifyDecoratedPayloadHook:(id)a3 forCategory:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *categoryHooks;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  id v14;

  if (self->_categoryHooks)
  {
    v6 = a3;
    v14 = (id)MEMORY[0x23B865544]();

    categoryHooks = self->_categoryHooks;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](categoryHooks, "setObject:forKeyedSubscript:", v14, v8);
  }
  else
  {
    v9 = (objc_class *)MEMORY[0x24BDBCED8];
    v10 = a3;
    v11 = [v9 alloc];
    v14 = (id)MEMORY[0x23B865544](v10);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSMutableDictionary *)objc_msgSend(v11, "initWithObjectsAndKeys:", v14, v8, 0);
    v13 = self->_categoryHooks;
    self->_categoryHooks = v12;

  }
}

- (void)executeModifyDecoratedPayloadHook:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6 decoratedPayload:(id)a7
{
  id v11;
  NSMutableDictionary *categoryHooks;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v15;

  v15 = a6;
  v11 = a7;
  categoryHooks = self->_categoryHooks;
  if (categoryHooks)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](categoryHooks, "objectForKey:", v13);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v14)
      ((void (**)(_QWORD, unint64_t, id, id))v14)[2](v14, a4, v15, v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryHooks, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_backingManager, 0);
  objc_storeStrong((id *)&self->_providerVersion, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_commonProperties, 0);
}

- (void)initWithWithCommonProperties:manager:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_23B49E000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %{public}@ RTC session start", v1);
}

@end
