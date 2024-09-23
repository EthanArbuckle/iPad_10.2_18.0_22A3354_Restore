@implementation EDRemoteContentPersistence

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (a3)
    *a3 = (id)MEMORY[0x1E0C9AA60];
  if (a4)
    *a4 = v4;
  objc_msgSend(a1, "_remoteContentLinksTableSchemaWithName:", CFSTR("remote_content_links"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(a1, "_remoteContentLinksTableSchemaWithName:", CFSTR("additional_remote_content_links"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_remoteContentLinksTableSchemaWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  const __CFString *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v3 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("url"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("requests"), 0, &unk_1E94E49B8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("last_seen_date"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("last_request_date"), 0, &unk_1E94E49B8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithName:rowIDType:columns:", v14, 1, v8);

  v17 = CFSTR("url");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addUniquenessConstraintForColumns:conflictResolution:", v10, 1);

  v16[0] = CFSTR("requests");
  v16[1] = CFSTR("last_request_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v11);

  v15[0] = CFSTR("requests");
  v15[1] = CFSTR("last_seen_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v12);

  return v9;
}

- (EDRemoteContentPersistence)initWithDatabase:(id)a3 useAdditionalTable:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  EDRemoteContentPersistence *v8;
  EDRemoteContentPersistence *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *contentProtectionQueue;
  uint64_t v13;
  NSBackgroundActivityScheduler *analyticsScheduler;
  xpc_object_t v15;
  NSBackgroundActivityScheduler *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  id location;
  objc_super v23;

  v4 = a4;
  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EDRemoteContentPersistence;
  v8 = -[EDRemoteContentPersistence init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_database, a3);
    v9->_useAdditionalTable = v4;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.email.EDRemoteContentPersistence.contentProtectionQueue", v10);
    contentProtectionQueue = v9->_contentProtectionQueue;
    v9->_contentProtectionQueue = (OS_dispatch_queue *)v11;

    *(int64x2_t *)&v9->_currentRowCount = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v9->_maximumRemoteContentLinks = xmmword_1D317A830;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", CFSTR("com.apple.email.EDRemoteContentPersistence.analyticsScheduler"));
    analyticsScheduler = v9->_analyticsScheduler;
    v9->_analyticsScheduler = (NSBackgroundActivityScheduler *)v13;

    -[NSBackgroundActivityScheduler setQualityOfService:](v9->_analyticsScheduler, "setQualityOfService:", 9);
    -[NSBackgroundActivityScheduler setInterval:](v9->_analyticsScheduler, "setInterval:", 86400.0);
    -[NSBackgroundActivityScheduler setRepeats:](v9->_analyticsScheduler, "setRepeats:", 1);
    if (v4)
    {
      v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C808A8], 1);
      -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:](v9->_analyticsScheduler, "_setAdditionalXPCActivityProperties:", v15);

    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v9);
    v16 = v9->_analyticsScheduler;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke;
    v19[3] = &unk_1E94A0560;
    objc_copyWeak(&v20, &location);
    v21 = v4;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v16, "scheduleWithBlock:", v19);
    -[EDRemoteContentPersistence contentProtectionQueue](v9, "contentProtectionQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EFRegisterContentProtectionObserver();

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

void ___ef_log_EDRemoteContentPersistence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDRemoteContentPersistence");
  v1 = (void *)_ef_log_EDRemoteContentPersistence_log;
  _ef_log_EDRemoteContentPersistence_log = (uint64_t)v0;

}

void __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD v9[7];
  char v10;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setupIsComplete");

  if ((v6 & 1) != 0)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0;
    objc_msgSend(WeakRetained, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence initWithDatabase:useAdditionalTable:]_block_invoke");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_2;
    v9[3] = &unk_1E94A0510;
    v9[4] = v13;
    v9[5] = v12;
    v10 = *(_BYTE *)(a1 + 40);
    v9[6] = v11;
    objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v9);

    AnalyticsSendEventLazy();
    v3[2](v3, 1);
    _Block_object_dispose(v11, 8);
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
  }
  else
  {
    v3[2](v3, 1);
  }

}

uint64_t __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[4];
  __int128 v13;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("requests"), CFSTR("remote_content_links"));
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addResult:alias:", v5, CFSTR("count"));

  objc_msgSend(v4, "groupByColumn:", CFSTR("requests"));
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_3;
  v12[3] = &unk_1E94A04E8;
  v13 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v12, 0);
  if (*(_BYTE *)(a1 + 56))
  {
    v7 = objc_alloc(MEMORY[0x1E0D1F040]);
    objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithResult:table:", v8, CFSTR("additional_remote_content_links"));

    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_4;
    v11[3] = &unk_1E949B090;
    v11[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v9, v11, 0);

  }
  return 1;
}

void __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("requests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v5)
    v9 = *(_QWORD *)(a1 + 32);
  else
    v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) += v8;

}

void __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "unsignedIntegerValue");

}

id __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_5(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[8];
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("totalCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v15[1] = CFSTR("requestedCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v17 = objc_claimAutoreleasedReturnValue();
  v15[2] = CFSTR("percentRequested");
  v2 = *(_QWORD *)(a1 + 48);
  v13 = (void *)v17;
  if (v2)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) / v2);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  v15[3] = CFSTR("unrequestedCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  v15[4] = CFSTR("percentUnrequested");
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 * *(_QWORD *)(a1 + 56) / v4);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  v15[5] = CFSTR("protectedCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v15[6] = CFSTR("percentProtected");
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) / v7);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  v15[7] = CFSTR("hasProtectedLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, v15, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)EDRemoteContentPersistence;
  -[EDRemoteContentPersistence dealloc](&v3, sel_dealloc);
}

- (unint64_t)_currentRowCount
{
  unint64_t currentRowCount;

  currentRowCount = self->_currentRowCount;
  if (currentRowCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EDRemoteContentPersistence _initializeCurrentRowCount](self, "_initializeCurrentRowCount");
    currentRowCount = self->_currentRowCount;
  }
  if (currentRowCount == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return currentRowCount;
}

- (unint64_t)_protectedRowCount
{
  unint64_t protectedRowCount;

  protectedRowCount = self->_protectedRowCount;
  if (protectedRowCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EDRemoteContentPersistence _initializeProtectedRowCount](self, "_initializeProtectedRowCount");
    protectedRowCount = self->_protectedRowCount;
  }
  if (protectedRowCount == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return protectedRowCount;
}

- (void)_incrementCurrentRowCountBy:(unint64_t)a3
{
  int64_t currentRowCount;

  currentRowCount = self->_currentRowCount;
  if (currentRowCount == 0x7FFFFFFFFFFFFFFFLL)
    -[EDRemoteContentPersistence _initializeCurrentRowCount](self, "_initializeCurrentRowCount", a3);
  else
    self->_currentRowCount = currentRowCount + a3;
}

- (void)_decrementCurrentRowCountBy:(unint64_t)a3
{
  int64_t currentRowCount;
  int64_t *p_currentRowCount;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  p_currentRowCount = &self->_currentRowCount;
  currentRowCount = self->_currentRowCount;
  if (currentRowCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EDRemoteContentPersistence _initializeCurrentRowCount](self, "_initializeCurrentRowCount", a3);
  }
  else
  {
    v5 = currentRowCount - a3;
    *p_currentRowCount = v5;
    if (v5 < 0)
    {
      _ef_log_EDRemoteContentPersistence();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[EDRemoteContentPersistence _decrementCurrentRowCountBy:].cold.1((uint64_t)p_currentRowCount, v6, v7, v8, v9, v10, v11, v12);

      *p_currentRowCount = 0;
    }
  }
}

- (void)_incrementProtectedRowCountBy:(unint64_t)a3
{
  int64_t protectedRowCount;

  protectedRowCount = self->_protectedRowCount;
  if (protectedRowCount == 0x7FFFFFFFFFFFFFFFLL)
    -[EDRemoteContentPersistence _initializeProtectedRowCount](self, "_initializeProtectedRowCount", a3);
  else
    self->_protectedRowCount = protectedRowCount + a3;
}

- (void)_decrementProtectedRowCountBy:(unint64_t)a3
{
  int64_t protectedRowCount;
  int64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  protectedRowCount = self->_protectedRowCount;
  if (protectedRowCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EDRemoteContentPersistence _initializeProtectedRowCount](self, "_initializeProtectedRowCount", a3);
  }
  else
  {
    v5 = protectedRowCount - a3;
    self->_protectedRowCount = v5;
    if (v5 < 0)
    {
      _ef_log_EDRemoteContentPersistence();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[EDRemoteContentPersistence _decrementProtectedRowCountBy:].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);

      self->_protectedRowCount = 0;
    }
  }
}

- (void)_initializeCurrentRowCount
{
  self->_currentRowCount = -[EDRemoteContentPersistence _rowCountForTable:](self, "_rowCountForTable:", CFSTR("remote_content_links"));
}

- (void)_initializeProtectedRowCount
{
  if (-[EDRemoteContentPersistence useAdditionalTable](self, "useAdditionalTable"))
    self->_protectedRowCount = -[EDRemoteContentPersistence _rowCountForTable:](self, "_rowCountForTable:", CFSTR("additional_remote_content_links"));
}

- (int64_t)_rowCountForTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  -[EDRemoteContentPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence _rowCountForTable:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__EDRemoteContentPersistence__rowCountForTable___block_invoke;
  v10[3] = &unk_1E949AFC8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __48__EDRemoteContentPersistence__rowCountForTable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, *(_QWORD *)(a1 + 32));

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__EDRemoteContentPersistence__rowCountForTable___block_invoke_2;
  v8[3] = &unk_1E949B090;
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v8, 0);

  return 1;
}

void __48__EDRemoteContentPersistence__rowCountForTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "integerValue");

  *a4 = 1;
}

- (BOOL)addRemoteContentLinks:(id)a3 newLinks:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__27;
  v21 = __Block_byref_object_dispose__27;
  v22 = 0;
  -[EDRemoteContentPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence addRemoteContentLinks:newLinks:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__EDRemoteContentPersistence_addRemoteContentLinks_newLinks___block_invoke;
  v12[3] = &unk_1E94A0588;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v14 = &v23;
  v15 = &v17;
  v16 = a4 != 0;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v10 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

uint64_t __61__EDRemoteContentPersistence_addRemoteContentLinks_newLinks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v26;
  id obj;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  if (!objc_msgSend(*(id *)(a1 + 32), "useAdditionalTable"))
  {
LABEL_5:
    v10 = *(id *)(a1 + 40);
    v11 = 0;
    goto LABEL_7;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "_currentRowCount");
  v6 = objc_msgSend(*(id *)(a1 + 32), "maximumRemoteContentLinks");
  v7 = *(void **)(a1 + 40);
  if (v5 < v6)
  {
    v8 = objc_msgSend(v7, "count");
    if (v8 + v5 > objc_msgSend(*(id *)(a1 + 32), "maximumRemoteContentLinks"))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "maximumRemoteContentLinks") - v5;
      objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 0, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", v9, objc_msgSend(*(id *)(a1 + 40), "count") - v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v11 = v7;
  v10 = 0;
LABEL_7:
  if (objc_msgSend(v10, "count"))
  {
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v13 + 40);
    v14 = objc_msgSend(v12, "_addRemoteContentLinks:withDate:toTable:withConnection:newLinks:", v10, v4, CFSTR("remote_content_links"), v3, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v14;
    objc_msgSend(*(id *)(a1 + 32), "_incrementCurrentRowCountBy:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
  }
  if (objc_msgSend(v11, "count"))
  {
    v15 = *(void **)(a1 + 32);
    v26 = 0;
    v16 = objc_msgSend(v15, "_addRemoteContentLinks:withDate:toTable:withConnection:newLinks:", v11, v4, CFSTR("additional_remote_content_links"), v3, &v26);
    v17 = v26;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v16;
    objc_msgSend(*(id *)(a1 + 32), "_incrementProtectedRowCountBy:", objc_msgSend(v17, "count"));
    if (*(_BYTE *)(a1 + 64))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v19 = *(void **)(v18 + 40);
      if (v19)
      {
        objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v17);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;
      }
      else
      {
        v23 = v17;
        v22 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v23;
      }

    }
  }
  v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return v24;
}

- (BOOL)_addRemoteContentLinks:(id)a3 withDate:(id)a4 toTable:(id)a5 withConnection:(id)a6 newLinks:(id *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id *v24;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  const __CFString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v27 = a4;
  v12 = a5;
  v13 = a6;
  v24 = a7;
  if (a7)
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v26 = 0;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v11;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v18 = objc_alloc(MEMORY[0x1E0D1F060]);
        v32 = CFSTR("url");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithTable:conflictTarget:", v12, v19);

        objc_msgSend(v17, "absoluteString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("url"));

        objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("last_seen_date"));
        objc_msgSend(v13, "clearLastInsertedDatabaseID");
        if ((objc_msgSend(v13, "executeUpsertStatement:error:", v20, 0) & 1) == 0)
        {

          v22 = 0;
          goto LABEL_16;
        }
        if (objc_msgSend(v13, "lastInsertedDatabaseID"))
          objc_msgSend(v26, "addObject:", v17);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v14)
        continue;
      break;
    }
  }
  v22 = 1;
LABEL_16:

  if (v24)
    *v24 = objc_retainAutorelease(v26);

  return v22;
}

- (BOOL)updateRequestCountForRemoteContentLinks:(id)a3 updateLastSeen:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  -[EDRemoteContentPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence updateRequestCountForRemoteContentLinks:updateLastSeen:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__EDRemoteContentPersistence_updateRequestCountForRemoteContentLinks_updateLastSeen___block_invoke;
  v11[3] = &unk_1E94A05B0;
  v9 = v6;
  v14 = a4;
  v12 = v9;
  v13 = &v15;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v11);

  LOBYTE(v6) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v6;
}

BOOL __85__EDRemoteContentPersistence_updateRequestCountForRemoteContentLinks_updateLastSeen___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  id obj;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("remote_content_links"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, CFSTR("last_request_date"));
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("requests"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "plus:", &unk_1E94E49D0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("requests"));

      if (*(_BYTE *)(a1 + 48))
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, CFSTR("last_seen_date"));
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("url"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteString");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "equalTo:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWhereClause:", v13);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v17, "executeUpdateStatement:error:", v8, 0);
      LOBYTE(v12) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;

      if ((v12 & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return v14;
}

- (id)remoteContentLinksBelowCount:(unint64_t)a3 limit:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;
  unint64_t v15;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDRemoteContentPersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence remoteContentLinksBelowCount:limit:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke;
  v12[3] = &unk_1E949E368;
  v14 = a3;
  v15 = a4;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v12);

  return v10;
}

uint64_t __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("url"), CFSTR("remote_content_links"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("requests"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lessThan:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v7);

  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v4, "setLimit:");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke_2;
  v10[3] = &unk_1E949AF78;
  v11 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v10, 0);

  return v8;
}

void __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  else
  {
    _ef_log_EDRemoteContentPersistence();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v5;
      if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
      {
        v9 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke_2_cold_1(v8, v9, (uint64_t)v10, v7);
    }

  }
}

- (unint64_t)countOfLinksLastSeenSince:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[EDRemoteContentPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence countOfLinksLastSeenSince:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __56__EDRemoteContentPersistence_countOfLinksLastSeenSince___block_invoke;
  v14 = &unk_1E949AFC8;
  v7 = v4;
  v15 = v7;
  v16 = &v17;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, &v11);

  v8 = -[EDRemoteContentPersistence _protectedRowCount](self, "_protectedRowCount", v11, v12, v13, v14);
  v9 = v18[3] + v8;

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __56__EDRemoteContentPersistence_countOfLinksLastSeenSince___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, CFSTR("remote_content_links"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("last_seen_date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "greaterThan:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__EDRemoteContentPersistence_countOfLinksLastSeenSince___block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v10, 0);

  return 1;
}

void __56__EDRemoteContentPersistence_countOfLinksLastSeenSince___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "integerValue");

  *a4 = 1;
}

- (unint64_t)countOfUnrequestedLinks
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[EDRemoteContentPersistence database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence countOfUnrequestedLinks]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__EDRemoteContentPersistence_countOfUnrequestedLinks__block_invoke;
  v8[3] = &unk_1E949BF68;
  v8[4] = &v9;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v8);

  v5 = -[EDRemoteContentPersistence _protectedRowCount](self, "_protectedRowCount");
  v6 = v10[3] + v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __53__EDRemoteContentPersistence_countOfUnrequestedLinks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, CFSTR("remote_content_links"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("requests"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", &unk_1E94E49B8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__EDRemoteContentPersistence_countOfUnrequestedLinks__block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v10, 0);

  return 1;
}

void __53__EDRemoteContentPersistence_countOfUnrequestedLinks__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "integerValue");

  *a4 = 1;
}

- (BOOL)pruneAllRemoteContentLinksWithMinimumCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  -[EDRemoteContentPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence pruneAllRemoteContentLinksWithMinimumCount:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__EDRemoteContentPersistence_pruneAllRemoteContentLinksWithMinimumCount___block_invoke;
  v8[3] = &unk_1E949E298;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

uint64_t __73__EDRemoteContentPersistence_pruneAllRemoteContentLinksWithMinimumCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_currentRowCount");
  if (v4 > objc_msgSend(*(id *)(a1 + 32), "pruneThreshold"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("requests"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "greaterThanEqualTo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("remote_content_links"), v7);
    objc_msgSend(v8, "orderBy:ascending:", CFSTR("last_seen_date"), 1);
    objc_msgSend(v8, "setLimit:", v4 - ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "pruneThreshold") >> 1));
    v11 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "executeDeleteStatement:rowsChanged:", v8, &v11);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "_decrementCurrentRowCountBy:");
      objc_msgSend(*(id *)(a1 + 32), "_currentRowCount");
      if (objc_msgSend(v3, "protectedDatabaseAttached"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_refillFromAdditionalTable");
        objc_msgSend(*(id *)(a1 + 32), "_currentRowCount");
      }
      AnalyticsSendEventLazy();
    }

  }
  v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v9;
}

id __73__EDRemoteContentPersistence_pruneAllRemoteContentLinksWithMinimumCount___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("beforeCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("prunedCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("refilledCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("hasProtectedLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "useAdditionalTable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("didRefill");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_refillFromAdditionalTable
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[EDRemoteContentPersistence useAdditionalTable](self, "useAdditionalTable"))
  {
    -[EDRemoteContentPersistence database](self, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence _refillFromAdditionalTable]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__EDRemoteContentPersistence__refillFromAdditionalTable__block_invoke;
    v5[3] = &unk_1E949B7F0;
    v5[4] = self;
    objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v5);

  }
}

uint64_t __56__EDRemoteContentPersistence__refillFromAdditionalTable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = a2;
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0
    && (v4 = objc_msgSend(*(id *)(a1 + 32), "maximumRemoteContentLinks"),
        v5 = objc_msgSend(*(id *)(a1 + 32), "_currentRowCount"),
        v6 = v4 - v5,
        v4 > v5))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT OR IGNORE INTO %@ SELECT * FROM %@ ORDER BY ROWID ASC LIMIT %lu"), CFSTR("remote_content_links"), CFSTR("additional_remote_content_links"), v6);
    v8 = objc_msgSend(v3, "executeStatementString:errorMessage:", v7, CFSTR("Refilling remote_content_links from additional table"));
    if ((_DWORD)v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("additional_remote_content_links"));
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "orderBy:ascending:", v10, 1);

      objc_msgSend(v9, "setLimit:", v6);
      v12 = 0;
      if (objc_msgSend(v3, "executeDeleteStatement:rowsChanged:", v9, &v12))
        objc_msgSend(*(id *)(a1 + 32), "_decrementProtectedRowCountBy:", v12);
      objc_msgSend(*(id *)(a1 + 32), "_initializeCurrentRowCount");

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v6;
  BOOL v7;

  -[EDRemoteContentPersistence contentProtectionQueue](self, "contentProtectionQueue", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = -[EDRemoteContentPersistence useAdditionalTable](self, "useAdditionalTable");
  if (!a3 && v7)
    -[EDRemoteContentPersistence _refillFromAdditionalTable](self, "_refillFromAdditionalTable");
}

- (id)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 error:(id *)a6
{
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[10];
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__27;
  v38 = __Block_byref_object_dispose__27;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__27;
  v32 = __Block_byref_object_dispose__27;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__27;
  v26 = __Block_byref_object_dispose__27;
  v27 = 0;
  -[EDRemoteContentPersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRemoteContentPersistence getRemoteContentURLInfoOrderedBy:inReverseOrder:limit:error:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__EDRemoteContentPersistence_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_error___block_invoke;
  v20[3] = &unk_1E94A0600;
  v20[4] = self;
  v20[5] = &v28;
  v21 = a4;
  v20[8] = a3;
  v20[9] = a5;
  v20[6] = &v34;
  v20[7] = &v22;
  objc_msgSend(v11, "__performReadWithCaller:usingBlock:", v12, v20);

  if (v29[5])
  {
    if (a6)
      *a6 = 0;
    v13 = objc_alloc(MEMORY[0x1E0D1EF38]);
    v14 = v29[5];
    v15 = v23[5];
  }
  else
  {
    if (a6)
    {
      v16 = (void *)v35[5];
      if (v16)
      {
        *a6 = objc_retainAutorelease(v16);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to get remote content url info"));
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a6 = v17;

      }
    }
    v13 = objc_alloc(MEMORY[0x1E0D1EF38]);
    v14 = 0;
    v15 = 0;
  }
  v18 = (void *)objc_msgSend(v13, "initWithFirst:second:", v14, v15);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

uint64_t __90__EDRemoteContentPersistence_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v4, "_getRemoteContentURLInfoForTable:orderedBy:inReverseOrder:limit:connection:error:", CFSTR("remote_content_links"), v6, v5, v7, v3, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && objc_msgSend(*(id *)(a1 + 32), "useAdditionalTable"))
  {
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12 < 0x7FFFFFFFFFFFFFFFLL)
      v13 = v12;
    v14 = *(_QWORD *)(a1 + 72);
    if (v14 > v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "_getRemoteContentURLInfoForTable:orderedBy:inReverseOrder:limit:connection:error:", CFSTR("additional_remote_content_links"), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), v14 - v13, v3, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
  }

  return 1;
}

- (id)_getRemoteContentURLInfoForTable:(id)a3 orderedBy:(int64_t)a4 inReverseOrder:(BOOL)a5 limit:(int64_t)a6 connection:(id)a7 error:(id *)a8
{
  int v11;
  id v13;
  id v14;
  void *v15;
  __CFString *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;

  v11 = a5;
  v13 = a3;
  v14 = a7;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("url"), v13);
  objc_msgSend(v15, "addResultColumn:", CFSTR("requests"));
  objc_msgSend(v15, "addResultColumn:", CFSTR("last_seen_date"));
  objc_msgSend(v15, "addResultColumn:", CFSTR("last_request_date"));
  if ((unint64_t)a4 >= 4)
  {
    v16 = 0;
    v17 = 1;
  }
  else
  {
    v16 = off_1E94A0620[a4];
    v17 = dword_1D317A840[a4];
  }
  objc_msgSend(v15, "orderByColumn:ascending:", v16, v17 != v11);
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v15, "setLimit:", a6 & ~(a6 >> 63));
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __111__EDRemoteContentPersistence__getRemoteContentURLInfoForTable_orderedBy_inReverseOrder_limit_connection_error___block_invoke;
  v23[3] = &unk_1E949AF78;
  v24 = v18;
  v19 = v18;
  if (objc_msgSend(v14, "executeSelectStatement:withBlock:error:", v15, v23, a8))
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

void __111__EDRemoteContentPersistence__getRemoteContentURLInfoForTable_orderedBy_inReverseOrder_limit_connection_error___block_invoke(uint64_t a1, void *a2)
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
  id v15;

  v15 = a2;
  v3 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithString:", v5);

  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "integerValue"))
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E270]), "initWithURL:requestCount:lastSeen:lastRequested:", v6, v8 & ~(v8 >> 63), v10, v13);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

}

- (void)test_tearDown
{
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id location;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDRemoteContentPersistence.m"), 603, CFSTR("%s can only be called from unit tests"), "-[EDRemoteContentPersistence test_tearDown]");

  }
  -[EDRemoteContentPersistence contentProtectionQueue](self, "contentProtectionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    EFUnregisterContentProtectionObserver();
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[EDRemoteContentPersistence contentProtectionQueue](self, "contentProtectionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__EDRemoteContentPersistence_test_tearDown__block_invoke;
    block[3] = &unk_1E949C258;
    objc_copyWeak(&v8, &location);
    dispatch_sync(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __43__EDRemoteContentPersistence_test_tearDown__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[5];
  WeakRetained[5] = 0;

}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (BOOL)useAdditionalTable
{
  return self->_useAdditionalTable;
}

- (NSBackgroundActivityScheduler)analyticsScheduler
{
  return self->_analyticsScheduler;
}

- (unint64_t)maximumRemoteContentLinks
{
  return self->_maximumRemoteContentLinks;
}

- (void)setMaximumRemoteContentLinks:(unint64_t)a3
{
  self->_maximumRemoteContentLinks = a3;
}

- (unint64_t)pruneThreshold
{
  return self->_pruneThreshold;
}

- (void)setPruneThreshold:(unint64_t)a3
{
  self->_pruneThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsScheduler, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_decrementCurrentRowCountBy:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Decremented row count past zero to %ld", a5, a6, a7, a8, 0);
}

- (void)_decrementProtectedRowCountBy:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Decremented protected row count past zero to %ld", a5, a6, a7, a8, 0);
}

void __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke_2_cold_1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{

  *(_DWORD *)a3 = 138412290;
  *(_QWORD *)(a3 + 4) = a2;
  _os_log_error_impl(&dword_1D2F2C000, a4, OS_LOG_TYPE_ERROR, "Invalid url string %@", (uint8_t *)a3, 0xCu);

}

@end
