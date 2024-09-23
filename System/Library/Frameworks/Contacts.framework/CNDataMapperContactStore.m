@implementation CNDataMapperContactStore

uint64_t __69__CNDataMapperContactStore_contactsForFetchRequest_matchInfos_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t *v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[5];

  v9 = a3;
  v10 = a4;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", ", buf, 2u);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v16 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke;
  v46[3] = &__block_descriptor_40_e5_v8__0l;
  v46[4] = v12;
  v17 = (void *)objc_msgSend(v46, "copy");
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _Block_copy(v18);
  objc_msgSend(v15, "push:", v19);

  if (!v9 && pthread_main_np() == 1)
  {
    objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isApplication");

    if (v21)
    {
      if (unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_token_6 != -1)
        dispatch_once(&unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_token_6, &__block_literal_global_54_2);
      v22 = unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_object_6;
      if (os_log_type_enabled((os_log_t)unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_object_6, OS_LOG_TYPE_FAULT))
      {
        -[CNDataMapperContactStore unifiedContactsMatchingPredicate:keysToFetch:error:].cold.1(v22);
      }
    }
  }
  *(_QWORD *)buf = 0;
  v41 = buf;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__18;
  v44 = __Block_byref_object_dispose__18;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__18;
  v38 = __Block_byref_object_dispose__18;
  v39 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_57;
  v29[3] = &unk_1E29FB378;
  v29[4] = self;
  v32 = &v34;
  v30 = v10;
  v31 = v9;
  v33 = buf;
  objc_msgSend(v23, "fetchingContacts:", v29);

  v24 = (void *)v35[5];
  v25 = *((id *)v41 + 5);
  v26 = v25;
  if (a5 && !v25)
    *a5 = objc_retainAutorelease(v24);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(buf, 8);

  objc_msgSend(v15, "popAllWithHandler:", &__block_literal_global_59);
  v27 = (id)objc_opt_self();

  return v26;
}

- (id)contactsForFetchRequest:(id)a3 matchInfos:(id *)a4 error:(id *)a5
{
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNContactFetchRequestExecutor *v19;
  void *v20;
  void **v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[5];
  uint8_t buf[16];

  v9 = a3;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Fetching", ", buf, 2u);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __69__CNDataMapperContactStore_contactsForFetchRequest_matchInfos_error___block_invoke;
  v31[3] = &__block_descriptor_40_e5_v8__0l;
  v31[4] = v11;
  v15 = (void *)objc_msgSend(v31, "copy");
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _Block_copy(v16);
  objc_msgSend(v14, "push:", v17);

  -[CNDataMapperContactStore queryAnalyticsLogger](self, "queryAnalyticsLogger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recordQueryWithFetchRequest:", v9);

  v19 = [CNContactFetchRequestExecutor alloc];
  -[CNDataMapperContactStore mapper](self, "mapper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CNContactFetchRequestExecutor initWithDataMapper:]((id *)&v19->super.isa, v20);

  -[CNContactFetchRequestExecutor observableForFetchRequest:](v21, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allObjects:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_cn_flatten");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "_cn_map:", *MEMORY[0x1E0D13898]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_cn_reduce:initialValue:", &__block_literal_global_75, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_retainAutorelease(v27);
    *a4 = v28;

  }
  objc_msgSend(v14, "popAllWithHandler:", &__block_literal_global_77_0);
  v29 = (id)objc_opt_self();

  return v25;
}

- (CNQueryAnalyticsLogger)queryAnalyticsLogger
{
  return self->_queryAnalyticsLogger;
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_6(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a2;
  v7 = *MEMORY[0x1E0D13830];
  v12 = v6;
  objc_msgSend(v6, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((v7 & 1) != 0)
  {
    v9 = a1[4];
    objc_msgSend(v12, "first");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "second");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v9 + 16))(v9, v10, v11, a1[6]);

    *a4 = *(_BYTE *)a1[6];
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }

}

- (BOOL)requestContactsReadAccessWithError:(id *)a3
{
  return -[CNDataMapperContactStore _requestDataMapperAccessType:error:](self, "_requestDataMapperAccessType:error:", 0, a3);
}

- (CNDataMapperContactStore)initWithDataMapper:(id)a3 dataMapperConfiguration:(id)a4
{
  id v7;
  id v8;
  CNDataMapperContactStore *v9;
  CNDataMapperContactStore *v10;
  id *p_mapper;
  void *v12;
  void *v13;
  uint64_t v14;
  CNContactsLogger *logger;
  id v16;
  uint64_t v17;
  uint64_t v18;
  CNRegulatoryLogger *regulatoryLogger;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  CNQueryAnalyticsLogger *v25;
  uint64_t v26;
  CNQueryAnalyticsLogger *queryAnalyticsLogger;
  CNDataMapperContactStore *v28;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CNDataMapperContactStore;
  v9 = -[CNContactStore init](&v30, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_11;
  p_mapper = (id *)&v9->_mapper;
  objc_storeStrong((id *)&v9->_mapper, a3);
  objc_msgSend(v8, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loggerProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contactsLogger");
  v14 = objc_claimAutoreleasedReturnValue();
  logger = v10->_logger;
  v10->_logger = (CNContactsLogger *)v14;

  v10->_isContactProvider = objc_msgSend(v8, "isContactProvider");
  v16 = objc_alloc(MEMORY[0x1E0D13B50]);
  objc_msgSend(v8, "assumedIdentity");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "initWithAuditToken:assumedIdentity:", 0, v17);
  regulatoryLogger = v10->_regulatoryLogger;
  v10->_regulatoryLogger = (CNRegulatoryLogger *)v18;

  v10->_shouldLogPrivacyAccountingAccessEvents = 1;
  -[CNDataMapperContactStore mapper](v10, "mapper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](v10, "mapper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_shouldLogPrivacyAccountingAccessEvents = objc_msgSend(v21, "shouldLogPrivacyAccountingAccessEvents");

  }
  -[CNDataMapperContactStore mapper](v10, "mapper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  -[CNDataMapperContactStore mapper](v10, "mapper");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shouldCaptureMetricsForQueries");

  if (v24)
  {
    v25 = [CNQueryAnalyticsLogger alloc];
    objc_msgSend(v8, "assumedIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[CNQueryAnalyticsLogger initWithAuditToken:assumedIdentity:](v25, "initWithAuditToken:assumedIdentity:", 0, v22);
    queryAnalyticsLogger = v10->_queryAnalyticsLogger;
    v10->_queryAnalyticsLogger = (CNQueryAnalyticsLogger *)v26;

LABEL_7:
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*p_mapper, "setNotificationSource:", v10);
  v28 = v10;
LABEL_11:

  return v10;
}

- (BOOL)_requestDataMapperAccessType:(unint64_t)a3 error:(id *)a4
{
  int v7;
  void *v8;
  id v9;
  id v11;

  if (-[CNDataMapperContactStore isContactProvider](self, "isContactProvider"))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = objc_msgSend(v8, "requestAccessForEntityType:error:", 0, &v11);
    v9 = v11;

    if (v7)
    {
      -[CNDataMapperContactStore _logContactsAccessWasGrantedForAccessType:](self, "_logContactsAccessWasGrantedForAccessType:", a3);
    }
    else
    {
      -[CNDataMapperContactStore _logContactsAccessWasDeniedForAccessType:error:](self, "_logContactsAccessWasDeniedForAccessType:error:", a3, v9);
      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }

  }
  return v7;
}

- (BOOL)isContactProvider
{
  return self->_isContactProvider;
}

- (void)_logContactsAccessWasGrantedForAccessType:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLogContactsAccess");

  if (v6)
  {
    -[CNDataMapperContactStore logger](self, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactsAccessWasGranted");

    -[CNDataMapperContactStore _logGreenTeaForAccessType:](self, "_logGreenTeaForAccessType:", a3);
    -[CNDataMapperContactStore _logPrivacyAccountingForAccessType:](self, "_logPrivacyAccountingForAccessType:", a3);
  }
}

- (CNDataMapper)mapper
{
  return self->_mapper;
}

- (CNContactsLogger)logger
{
  return self->_logger;
}

- (void)_logPrivacyAccountingForAccessType:(unint64_t)a3
{
  id v4;

  if (a3 != 2)
  {
    if (-[CNDataMapperContactStore shouldLogPrivacyAccountingAccessEvents](self, "shouldLogPrivacyAccountingAccessEvents"))
    {
      -[CNDataMapperContactStore regulatoryLogger](self, "regulatoryLogger");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logContactsDataAccessEvent");

    }
  }
}

- (void)_logGreenTeaForAccessType:(unint64_t)a3
{
  id v3;
  id v4;

  if (a3 == 1)
  {
    -[CNDataMapperContactStore regulatoryLogger](self, "regulatoryLogger");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifyingContactsData");

  }
  else if (!a3)
  {
    -[CNDataMapperContactStore regulatoryLogger](self, "regulatoryLogger");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "readingContactsData");

  }
}

- (CNRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (BOOL)shouldLogPrivacyAccountingAccessEvents
{
  return self->_shouldLogPrivacyAccountingAccessEvents;
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithBool:error:", 1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__CNDataMapperContactStore_unifiedContactCountWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  char v6;
  CNContactFetchRequest *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CNContactFetchRequest *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestContactsReadAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapper");
      v7 = (CNContactFetchRequest *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(id *)(v8 + 40);
      -[CNContactFetchRequest unifiedContactCountWithError:](v7, "unifiedContactCountWithError:", &v19);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v8 + 40), v19);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;
    }
    else
    {
      v12 = [CNContactFetchRequest alloc];
      v7 = -[CNContactFetchRequest initWithKeysToFetch:](v12, "initWithKeysToFetch:", MEMORY[0x1E0C9AA60]);
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(id *)(v14 + 40);
      objc_msgSend(v13, "contactsForFetchRequest:matchInfos:error:", v7, 0, &v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v14 + 40), v18);
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

      }
    }

  }
}

- (id)unifiedContactCountWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CNDataMapperContactStore_unifiedContactCountWithError___block_invoke;
  v10[3] = &unk_1E29FB2B0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  objc_msgSend(v5, "fetchingContactCount:", v10);

  v6 = (void *)v12[5];
  v7 = (id)v18[5];
  v8 = v7;
  if (a3 && !v7)
    *a3 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)meContactIdentifiers:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__CNDataMapperContactStore_meContactIdentifiers___block_invoke;
  v11[3] = &unk_1E29FB2D8;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v5, "fetchingMeContactIdentifier:", v11);

  v6 = (id)v13[5];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13748] + 16))())
  {
    objc_msgSend(v6, "left");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "right");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3)
      *a3 = objc_retainAutorelease(v8);

    v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__CNDataMapperContactStore_meContactIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v14 = 0;
  v3 = objc_msgSend(v2, "requestContactsReadAccessWithError:", &v14);
  v4 = v14;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v4;
    objc_msgSend(v5, "meContactIdentifiers:", &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;

    objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithLeft:right:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v4 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithRight:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

}

void __69__CNDataMapperContactStore_contactsForFetchRequest_matchInfos_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

void __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

- (CNDataMapperContactStore)initWithConfiguration:(id)a3
{
  id v4;
  CNDataMapperConfiguration *v5;
  objc_class *v6;
  void *v7;
  CNDataMapperContactStore *v8;

  v4 = a3;
  v5 = -[CNDataMapperConfiguration initWithContactStoreConfiguration:]([CNDataMapperConfiguration alloc], "initWithContactStoreConfiguration:", v4);
  v6 = (objc_class *)objc_msgSend((id)objc_opt_class(), "dataMapperClassForConfiguration:", v4);

  v7 = (void *)objc_msgSend([v6 alloc], "initWithConfiguration:", v5);
  v8 = -[CNDataMapperContactStore initWithDataMapper:dataMapperConfiguration:](self, "initWithDataMapper:dataMapperConfiguration:", v7, v5);

  return v8;
}

+ (Class)dataMapperClassForConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "useOutOfProcessMapperExclusively")
    || !objc_msgSend(v4, "useInProcessMapperExclusively")
    && objc_msgSend(a1, "hasEnvironmentSettingsEnabledContactsOutOfProcess"))
  {
    objc_opt_class();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CN defaultDataMapperClass](CN, "defaultDataMapperClass");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return (Class)v6;
}

+ (BOOL)hasEnvironmentSettingsEnabledContactsOutOfProcess
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SUDO_OOP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if ((objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("TESTING_OUT_OF_PROCESS")) & 1) == 0)
    {
      if (_block_invoke_cn_once_token_0 != -1)
        dispatch_once(&_block_invoke_cn_once_token_0, &__block_literal_global_3_6);
      if (!objc_msgSend((id)_block_invoke_cn_once_object_0, "BOOLValue"))
      {
        v5 = 1;
        goto LABEL_10;
      }
    }
    if (_block_invoke_2_cn_once_token_1 != -1)
      dispatch_once(&_block_invoke_2_cn_once_token_1, &__block_literal_global_7_3);
    v3 = (void *)_block_invoke_2_cn_once_object_1;
  }
  v5 = objc_msgSend(v3, "BOOLValue");
LABEL_10:

  return v5;
}

- (id)currentHistoryAnchor
{
  void *v3;
  char v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0D13B60];
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1005);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
LABEL_6:
    objc_msgSend(v10, "failureWithError:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12 = 0;
  v5 = -[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", &v12);
  v6 = v12;
  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E0D13B60];
    goto LABEL_6;
  }
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentHistoryAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (id)currentHistoryToken
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = 0;
    if (-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentHistoryToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)requestMetadataAccessWithError:(id *)a3
{
  return -[CNDataMapperContactStore _requestDataMapperAccessType:error:](self, "_requestDataMapperAccessType:error:", 2, a3);
}

- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  CNDataMapperContactStore *v35;
  id v36;
  id v37;
  uint8_t *v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[5];

  v9 = a3;
  v10 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", ", buf, 2u);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v16 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke;
  v45[3] = &__block_descriptor_40_e5_v8__0l;
  v45[4] = v12;
  v17 = (void *)objc_msgSend(v45, "copy");
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _Block_copy(v18);
  objc_msgSend(v15, "push:", v19);

  -[CNDataMapperContactStore queryAnalyticsLogger](self, "queryAnalyticsLogger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "recordQueryWithFetchRequest:", v9);

  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__18;
  v43 = __Block_byref_object_dispose__18;
  v44 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v16;
  v32 = 3221225472;
  v33 = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_60;
  v34 = &unk_1E29FB418;
  v35 = self;
  v38 = buf;
  v36 = v9;
  v37 = v10;
  objc_msgSend(v21, "fetchingContacts:", &v31);

  v22 = *((id *)v40 + 5);
  v26 = (*(uint64_t (**)(_QWORD, id, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0D13748] + 16))(*MEMORY[0x1E0D13748], v22, v23, v24, v25);
  if ((v26 & 1) == 0)
  {
    objc_msgSend(v22, "right", v31, v32, v33, v34, v35, v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a4)
      *a4 = objc_retainAutorelease(v27);

  }
  _Block_object_dispose(buf, 8);

  objc_msgSend(v15, "popAllWithHandler:", &__block_literal_global_72_1);
  v29 = (id)objc_opt_self();

  return v26 & 1;
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v6, "count");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_6;
  v7[3] = &unk_1E29FB3C8;
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v10 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

void __77__CNDataMapperContactStore_hasEnvironmentSettingsEnabledContactsOutOfProcess__block_invoke_4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlementVerifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E0D13790], 0));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_block_invoke_2_cn_once_object_1;
  _block_invoke_2_cn_once_object_1 = v2;

}

void __77__CNDataMapperContactStore_hasEnvironmentSettingsEnabledContactsOutOfProcess__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlementVerifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E0D13798], 0));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_block_invoke_cn_once_object_0;
  _block_invoke_cn_once_object_0 = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_mapper, 0);
}

void __55__CNDataMapperContactStore_requestAccessForEntityType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__CNDataMapperContactStore_requestAccessForEntityType___block_invoke_2;
  v9[3] = &unk_1E29FB630;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v3;
  v9[4] = v5;
  v10 = v6;
  v8 = v3;
  objc_msgSend(v4, "requestAccessForEntityType:completionHandler:", v7, v9);

}

- (BOOL)hasGroups
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || !-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
  {
    return 0;
  }
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasGroups");

  return v6;
}

void __55__CNDataMapperContactStore_requestAccessForEntityType___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = *(void **)(a1 + 32);
  if (v6 || !a2)
  {
    objc_msgSend(v5, "_logContactsAccessWasDeniedForAccessType:error:", 0, v6);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "_logContactsAccessWasGrantedForAccessType:", 0);
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  }

}

- (id)requestAccessForEntityType:(int64_t)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v5 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNDataMapperContactStore logger](self, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__CNDataMapperContactStore_requestAccessForEntityType___block_invoke;
  v10[3] = &unk_1E29FB658;
  v11 = v5;
  v12 = a3;
  v10[4] = self;
  v7 = v5;
  objc_msgSend(v6, "requestingAccessForContacts:", v10);

  objc_msgSend(v7, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13820] + 16))() & 1) != 0
    || (-[CNDataMapperContactStore mapper](self, "mapper"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) == 0))
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    if (-[CNDataMapperContactStore requestContactsReadAccessWithError:](self, "requestContactsReadAccessWithError:", 0))
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__18;
      v21 = __Block_byref_object_dispose__18;
      v22 = 0;
      -[CNDataMapperContactStore logger](self, "logger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __72__CNDataMapperContactStore_contactWithUserActivityUserInfo_keysToFetch___block_invoke;
      v13[3] = &unk_1E29FB590;
      v13[4] = self;
      v16 = &v17;
      v14 = v6;
      v15 = v7;
      objc_msgSend(v11, "fetchingContactWithUserActivity:", v13);

      v10 = (id)v18[5];
      _Block_object_dispose(&v17, 8);

    }
  }

  return v10;
}

- (id)userActivityUserInfoForContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = 0;
  if (-[CNDataMapperContactStore requestContactsReadAccessWithError:](self, "requestContactsReadAccessWithError:", 0))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__18;
    v15 = __Block_byref_object_dispose__18;
    v16 = 0;
    -[CNDataMapperContactStore logger](self, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__CNDataMapperContactStore_userActivityUserInfoForContact___block_invoke;
    v8[3] = &unk_1E29FB5B8;
    v8[4] = self;
    v10 = &v11;
    v9 = v4;
    objc_msgSend(v6, "fetchingContactWithUserActivity:", v8);

    v5 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  return v5;
}

void __59__CNDataMapperContactStore_userActivityUserInfoForContact___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userActivityUserInfoForContact:", *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __72__CNDataMapperContactStore_contactWithUserActivityUserInfo_keysToFetch___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactWithUserActivityUserInfo:keysToFetch:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __65__CNDataMapperContactStore_sectionListOffsetsForSortOrder_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(id *)(v9 + 40);
      objc_msgSend(v7, "sectionListOffsetsForSortOrder:error:", v8, &v15);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v9 + 40), v15);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;
    }
    else
    {
      +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", v7, sel_sectionListOffsetsForSortOrder_error_);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }

  }
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18;
  v17 = __Block_byref_object_dispose__18;
  v18 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CNDataMapperContactStore_sectionListOffsetsForSortOrder_error___block_invoke;
  v12[3] = &unk_1E29FB350;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  objc_msgSend(v7, "fetchingContactSectionCounts:", v12);

  v8 = (void *)v14[5];
  v9 = (id)v20[5];
  v10 = v9;
  if (a4 && !v9)
    *a4 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __62__CNDataMapperContactStore_containersMatchingPredicate_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v7 + 40);
    objc_msgSend(v5, "containersMatchingPredicate:error:", v6, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __56__CNDataMapperContactStore_policyWithDescription_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v7 + 40);
    objc_msgSend(v5, "policyWithDescription:error:", v6, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__CNDataMapperContactStore_policyWithDescription_error___block_invoke;
  v13[3] = &unk_1E29FB288;
  v13[4] = self;
  v15 = &v17;
  v16 = &v23;
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "fetchingContainers:", v13);

  v9 = (void *)v18[5];
  v10 = (id)v24[5];
  v11 = v10;
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CNDataMapperContactStore_containersMatchingPredicate_error___block_invoke;
  v13[3] = &unk_1E29FB288;
  v13[4] = self;
  v15 = &v17;
  v16 = &v23;
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "fetchingContainers:", v13);

  v9 = (void *)v18[5];
  v10 = (id)v24[5];
  v11 = v10;
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (CNDataMapperContactStore)init
{
  void *v3;
  CNDataMapperContactStore *v4;

  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNDataMapperContactStore initWithEnvironment:](self, "initWithEnvironment:", v3);

  return v4;
}

- (CNDataMapperContactStore)initWithEnvironment:(id)a3
{
  return -[CNDataMapperContactStore initWithEnvironment:managedConfiguration:](self, "initWithEnvironment:managedConfiguration:", a3, 0);
}

- (CNDataMapperContactStore)initWithEnvironment:(id)a3 managedConfiguration:(id)a4
{
  id v6;
  id v7;
  CNContactStoreConfiguration *v8;
  CNDataMapperContactStore *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CNContactStoreConfiguration);
  -[CNContactStoreConfiguration setEnvironment:](v8, "setEnvironment:", v7);

  -[CNContactStoreConfiguration setManagedConfiguration:](v8, "setManagedConfiguration:", v6);
  v9 = -[CNDataMapperContactStore initWithConfiguration:](self, "initWithConfiguration:", v8);

  return v9;
}

- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CNDataMapperContactStore_setDefaultAccountIdentifier_error___block_invoke;
  v11[3] = &unk_1E29FB288;
  v11[4] = self;
  v13 = &v19;
  v14 = &v15;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "settingDefaultAccount:", v11);

  v9 = *((unsigned __int8 *)v16 + 24);
  if (a4 && !*((_BYTE *)v16 + 24))
    *a4 = objc_retainAutorelease((id)v20[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9 != 0;
}

void __62__CNDataMapperContactStore_setDefaultAccountIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v4, "requestMetadataAccessWithError:", &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(id *)(v9 + 40);
      v10 = objc_msgSend(v7, "setDefaultAccountIdentifier:error:", v8, &v15);
      objc_storeStrong((id *)(v9 + 40), v15);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", v14, sel_setDefaultAccountIdentifier_error_);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (BOOL)resetSortDataIfNeededWithError:(id *)a3
{
  void *v5;
  char v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18;
  v17 = __Block_byref_object_dispose__18;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CNDataMapperContactStore_resetSortDataIfNeededWithError___block_invoke;
  v8[3] = &unk_1E29FB2B0;
  v8[4] = self;
  v8[5] = &v13;
  v8[6] = &v9;
  objc_msgSend(v5, "resettingSortDataIfNeeded:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __59__CNDataMapperContactStore_resetSortDataIfNeededWithError___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v4, "requestContactsWriteAccessWithError:", &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(id *)(v8 + 40);
      v9 = objc_msgSend(v7, "resetSortDataIfNeededWithError:", &v14);
      objc_storeStrong((id *)(v8 + 40), v14);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", v13, sel_resetSortDataIfNeededWithError_);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDataMapperContactStore mapper](self, "mapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("mapper"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)identifierWithError:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  if (-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:")
    && (-[CNDataMapperContactStore mapper](self, "mapper"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifierWithError:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int)saveSequenceCount
{
  void *v3;
  char v4;
  void *v5;
  int v6;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || !-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
  {
    return -1;
  }
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "saveSequenceCount");

  return v6;
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  v20 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__CNDataMapperContactStore_setMeContact_error___block_invoke;
  v11[3] = &unk_1E29FB288;
  v11[4] = self;
  v13 = &v15;
  v14 = &v21;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "changingMeContact:", v11);

  v9 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((_BYTE *)v22 + 24))
    *a4 = objc_retainAutorelease((id)v16[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9 != 0;
}

void __47__CNDataMapperContactStore_setMeContact_error___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v4, "requestContactsWriteAccessWithError:", &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(id *)(v9 + 40);
      v10 = objc_msgSend(v7, "setMeContact:error:", v8, &v17);
      objc_storeStrong((id *)(v9 + 40), v17);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;

      +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didChangeMeContactSuccessfully:fromContactStore:requestIdentifier:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 32), 0);

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "logger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "changedMeContact:", *(_QWORD *)(a1 + 40));

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", v16, sel_setMeContact_error_);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__18;
  v24 = __Block_byref_object_dispose__18;
  v25 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__CNDataMapperContactStore_setMeContact_forContainer_error___block_invoke;
  v15[3] = &unk_1E29FB300;
  v15[4] = self;
  v18 = &v20;
  v19 = &v26;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  objc_msgSend(v10, "changingMeContact:", v15);

  v13 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
    *a5 = objc_retainAutorelease((id)v21[5]);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13 != 0;
}

void __60__CNDataMapperContactStore_setMeContact_forContainer_error___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v4, "requestContactsWriteAccessWithError:", &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = *(id *)(v10 + 40);
      v11 = objc_msgSend(v7, "setMeContact:forContainer:error:", v8, v9, &v18);
      objc_storeStrong((id *)(v10 + 40), v18);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;

      +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didChangeMeContactSuccessfully:fromContactStore:requestIdentifier:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 32), 0);

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "logger");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "changedMeContact:", *(_QWORD *)(a1 + 40));

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", v17, sel_setMeContact_forContainer_error_);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  int v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__18;
  v29 = __Block_byref_object_dispose__18;
  v30 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__CNDataMapperContactStore_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke;
  v19[3] = &unk_1E29FB328;
  v19[4] = self;
  v23 = &v25;
  v24 = &v31;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  objc_msgSend(v13, "changingMeContact:", v19);

  v17 = *((unsigned __int8 *)v32 + 24);
  if (a6 && !*((_BYTE *)v32 + 24))
    *a6 = objc_retainAutorelease((id)v26[5]);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17 != 0;
}

void __81__CNDataMapperContactStore_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestContactsWriteAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(id *)(v9 + 40);
    v10 = objc_msgSend(v5, "setBestMeIfNeededForGivenName:familyName:email:error:", v6, v7, v8, &v16);
    objc_storeStrong((id *)(v9 + 40), v16);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v10;

    +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didChangeMeContactSuccessfully:fromContactStore:requestIdentifier:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 32), 0);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v12 = *(void **)(a1 + 32);
      v18[0] = CFSTR("givenName");
      v18[1] = CFSTR("familyName");
      v18[2] = CFSTR("emailAddresses");
      v18[3] = CFSTR("phoneNumbers");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "logger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "changedMeContact:", v14);

    }
  }
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  if (objc_msgSend(v6, "shouldFailIfAccountNotYetSynced")
    && !-[CNContactStore hasAccountFirstSyncCompleted](self, "hasAccountFirstSyncCompleted"))
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1007);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);

    v10 = 0;
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__18;
    v28 = __Block_byref_object_dispose__18;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__18;
    v22 = __Block_byref_object_dispose__18;
    v23 = 0;
    -[CNDataMapperContactStore logger](self, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__CNDataMapperContactStore_contactCountForFetchRequest_error___block_invoke;
    v14[3] = &unk_1E29FB288;
    v14[4] = self;
    v16 = &v18;
    v17 = &v24;
    v15 = v6;
    objc_msgSend(v7, "fetchingContactCount:", v14);

    v8 = (void *)v19[5];
    v9 = (id)v25[5];
    v10 = v9;
    if (a4 && !v9)
      *a4 = objc_retainAutorelease(v8);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

  }
  return v10;
}

void __62__CNDataMapperContactStore_contactCountForFetchRequest_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestContactsReadAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v7 + 40);
    objc_msgSend(v5, "contactCountForFetchRequest:error:", v6, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  int v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__18;
  v33 = __Block_byref_object_dispose__18;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__CNDataMapperContactStore_moveContacts_fromContainer_toContainer_error___block_invoke;
  v19[3] = &unk_1E29FB328;
  v19[4] = self;
  v23 = &v29;
  v24 = &v25;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  objc_msgSend(v13, "fetchingContactSectionCounts:", v19);

  v17 = *((unsigned __int8 *)v26 + 24);
  if (a6 && !*((_BYTE *)v26 + 24))
    *a6 = objc_retainAutorelease((id)v30[5]);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17 != 0;
}

void __73__CNDataMapperContactStore_moveContacts_fromContainer_toContainer_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestContactsWriteAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v16 = *(id *)(v11 + 40);
      v12 = objc_msgSend(v7, "moveContacts:fromContainer:toContainer:error:", v8, v9, v10, &v16);
      objc_storeStrong((id *)(v11 + 40), v16);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v12;
    }
    else
    {
      +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", v7, sel_moveContacts_fromContainer_toContainer_error_);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
}

void __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_53()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runtime-issues", "Contacts");
  v1 = (void *)unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_object_6;
  unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_object_6 = (uint64_t)v0;

}

void __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_57(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  CNContactFetchRequest *v5;
  CNAPITriageSession *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestContactsReadAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", a1[5]);
    -[CNContactFetchRequest setPredicate:](v5, "setPredicate:", a1[6]);
    v6 = -[CNAPITriageSession initWithRequest:]([CNAPITriageSession alloc], "initWithRequest:", v5);
    -[CNAPITriageSession open](v6, "open");
    v7 = (void *)a1[4];
    v8 = *(_QWORD *)(a1[7] + 8);
    v12 = *(id *)(v8 + 40);
    objc_msgSend(v7, "contactsForFetchRequest:matchInfos:error:", v5, 0, &v12);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), v12);
    v10 = *(_QWORD *)(a1[8] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    -[CNAPITriageSession closeWithContacts:orError:](v6, "closeWithContacts:orError:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  }
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  CNContactFetchRequestExecutor *v7;
  void *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v38 = 0;
  v5 = objc_msgSend(v4, "requestContactsReadAccessWithError:", &v38);
  v6 = v38;
  if ((v5 & 1) != 0)
  {
    v7 = [CNContactFetchRequestExecutor alloc];
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNContactFetchRequestExecutor initWithDataMapper:]((id *)&v7->super.isa, v8);

    -[CNContactFetchRequestExecutor observableForFetchRequest:](v9, *(void **)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_2;
    v37[3] = &unk_1E29FB3A0;
    v37[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v10, "doOnError:", v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    v36[1] = 3221225472;
    v36[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_3;
    v36[3] = &unk_1E29F98A8;
    v36[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v12, "doOnCompletion:", v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_4;
    v35[3] = &unk_1E29F98A8;
    v35[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v13, "doOnCancel:", v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_5;
    v23[3] = &unk_1E29FB3F0;
    v25 = &v27;
    v26 = &v31;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v23);
    if (v32[3])
    {
      v15 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_60_cold_1(v15);

      v16 = (void *)MEMORY[0x1E0D13A18];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNErrorDomain"), 2, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "eitherWithRight:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      objc_msgSend(MEMORY[0x1E0D13B78], "simulateCrashWithMessage:", CFSTR("enumerateContactsAndMatchInfoWithFetchRequest encountered NSNull %lu times where %lu CNContact objects where expcted"), v32[3], v28[3]);
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithRight:", v6);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void ***)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
  }

}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithRight:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithBool:error:", 1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_71(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

id __69__CNDataMapperContactStore_contactsForFetchRequest_matchInfos_error___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "second");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v4;
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  CNDataMapperContactStore *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "Fetching", ", buf, 2u);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v17 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke;
  v37[3] = &__block_descriptor_40_e5_v8__0l;
  v37[4] = v13;
  v18 = (void *)objc_msgSend(v37, "copy");
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = _Block_copy(v19);
  objc_msgSend(v16, "push:", v20);

  v21 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  -[CNDataMapperContactStore logger](self, "logger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v17;
  v29 = 3221225472;
  v30 = __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_79;
  v31 = &unk_1E29FB4A8;
  v35 = v11;
  v32 = v9;
  v33 = self;
  v23 = v21;
  v34 = v23;
  v36 = v10;
  objc_msgSend(v22, "fetchingContacts:", &v28);

  v24 = v36;
  v25 = v23;

  objc_msgSend(v16, "popAllWithHandler:", &__block_literal_global_84_1, v28, v29, v30, v31);
  v26 = (id)objc_opt_self();

  return v25;
}

void __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

void __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  int8x16_t v11;
  _QWORD v12[4];
  id v13;
  int8x16_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_2;
  aBlock[3] = &unk_1E29F9A30;
  v19 = *(id *)(a1 + 56);
  v5 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = *(void **)(a1 + 40);
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_3;
    v12[3] = &unk_1E29FB480;
    v15 = v3;
    v13 = *(id *)(a1 + 48);
    v16 = v5;
    v11 = *(int8x16_t *)(a1 + 32);
    v9 = (id)v11.i64[0];
    v14 = vextq_s8(v11, v11, 8uLL);
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v8, "requestReadAccessForEntityType:completionHandler:", 0, v12);

    v10 = v15;
  }
  else
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v5 + 2))(v5, v10);
  }

}

uint64_t __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v5 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    if ((a2 & 1) == 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_8:
      v6 = v11;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v6 = v11;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "mapper");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "executeFetchRequest:progressiveResults:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(*(id *)(a1 + 32), "addCancelable:", v10);

      goto LABEL_8;
    }
  }
LABEL_9:

}

uint64_t __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__CNDataMapperContactStore_groupsMatchingPredicate_error___block_invoke;
  v13[3] = &unk_1E29FB288;
  v13[4] = self;
  v15 = &v17;
  v16 = &v23;
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "fetchingGroups:", v13);

  v9 = (void *)v18[5];
  v10 = (id)v24[5];
  v11 = v10;
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __58__CNDataMapperContactStore_groupsMatchingPredicate_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v7 + 40);
    objc_msgSend(v5, "groupsMatchingPredicate:error:", v6, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)groupWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__CNDataMapperContactStore_groupWithIdentifier_error___block_invoke;
  v13[3] = &unk_1E29FB288;
  v13[4] = self;
  v15 = &v17;
  v16 = &v23;
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "fetchingGroups:", v13);

  v9 = (void *)v18[5];
  v10 = (id)v24[5];
  v11 = v10;
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __54__CNDataMapperContactStore_groupWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id obj;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v20 = *(id *)(v9 + 40);
      objc_msgSend(v7, "groupsWithIdentifiers:error:", v8, &v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v9 + 40), v20);
      objc_msgSend(v10, "firstObject");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    else
    {
      v22 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNGroup predicateForGroupsWithIdentifiers:](CNGroup, "predicateForGroupsWithIdentifiers:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(id *)(v16 + 40);
      objc_msgSend(v15, "groupsMatchingPredicate:error:", v7, &v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v16 + 40), v19);
      objc_msgSend(v8, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;
    }

  }
}

- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
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

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__18;
  v32 = __Block_byref_object_dispose__18;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__18;
  v26 = __Block_byref_object_dispose__18;
  v27 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__CNDataMapperContactStore_membersOfGroupWithIdentifier_keysToFetch_error___block_invoke;
  v17[3] = &unk_1E29FB378;
  v17[4] = self;
  v20 = &v22;
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v21 = &v28;
  objc_msgSend(v10, "fetchingContacts:", v17);

  v13 = (void *)v23[5];
  v14 = (id)v29[5];
  v15 = v14;
  if (a5 && !v14)
    *a5 = objc_retainAutorelease(v13);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __75__CNDataMapperContactStore_membersOfGroupWithIdentifier_keysToFetch_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  CNContactFetchRequest *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestContactsReadAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    +[CNContact predicateForContactsInGroupWithIdentifier:](CNContact, "predicateForContactsInGroupWithIdentifier:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", a1[6]);
    -[CNContactFetchRequest setPredicate:](v6, "setPredicate:", v5);
    v7 = (void *)a1[4];
    v8 = *(_QWORD *)(a1[7] + 8);
    v12 = *(id *)(v8 + 40);
    objc_msgSend(v7, "contactsForFetchRequest:matchInfos:error:", v6, 0, &v12);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), v12);
    v10 = *(_QWORD *)(a1[8] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__CNDataMapperContactStore_subgroupsOfGroupWithIdentifier_error___block_invoke;
  v13[3] = &unk_1E29FB288;
  v13[4] = self;
  v15 = &v17;
  v16 = &v23;
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "fetchingGroups:", v13);

  v9 = (void *)v18[5];
  v10 = (id)v24[5];
  v11 = v10;
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __65__CNDataMapperContactStore_subgroupsOfGroupWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v7 + 40);
    objc_msgSend(v5, "subgroupsOfGroupWithIdentifier:error:", v6, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)contactsInContainerWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__CNDataMapperContactStore_serverSearchContainersMatchingPredicate_error___block_invoke;
  v13[3] = &unk_1E29FB288;
  v13[4] = self;
  v15 = &v17;
  v16 = &v23;
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "fetchingContainers:", v13);

  v9 = (void *)v18[5];
  v10 = (id)v24[5];
  v11 = v10;
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __74__CNDataMapperContactStore_serverSearchContainersMatchingPredicate_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v7 + 40);
    objc_msgSend(v5, "serverSearchContainersMatchingPredicate:error:", v6, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "usedLabelsForPropertyWithKey:error:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", a4))
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountsMatchingPredicate:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return -[CNDataMapperContactStore executeSaveRequest:response:authorizationContext:error:](self, "executeSaveRequest:response:authorizationContext:error:", a3, 0, 0, a4);
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  id v28;
  id v30;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[8];
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint8_t v51[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.contacts", "api-triage");
  v11 = os_signpost_id_generate(v10);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v15 = v14;

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_DEFAULT, "Will save", buf, 2u);
  }
  v16 = v10;
  v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Saving Contacts", ", buf, 2u);
  }

  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  *(_QWORD *)buf = 0;
  v45[0] = buf;
  v45[1] = 0x3032000000;
  v45[2] = __Block_byref_object_copy__18;
  v45[3] = __Block_byref_object_dispose__18;
  v46 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__18;
  v42 = __Block_byref_object_dispose__18;
  v43 = 0;
  -[CNDataMapperContactStore logger](self, "logger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __83__CNDataMapperContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke;
  v32[3] = &unk_1E29FB4F0;
  v32[4] = self;
  v35 = buf;
  v28 = v8;
  v33 = v28;
  v30 = v9;
  v34 = v30;
  v36 = &v47;
  v37 = &v38;
  objc_msgSend(v18, "saving:", v32);

  v19 = v17;
  v20 = v19;
  if (v11 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v20, OS_SIGNPOST_INTERVAL_END, v11, "Saving Contacts", ", v51, 2u);
  }

  if (a4)
    *a4 = objc_retainAutorelease((id)v39[5]);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timestamp");
  v24 = v23;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v24 - v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v48 + 24))
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v51 = 138543362;
      v52 = v25;
      _os_log_impl(&dword_18F8BD000, v20, OS_LOG_TYPE_DEFAULT, "Did save successfully (%{public}@)", v51, 0xCu);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    -[CNDataMapperContactStore executeSaveRequest:response:authorizationContext:error:].cold.1((uint64_t)v25, (uint64_t)v45, v20);
  }
  v26 = *((unsigned __int8 *)v48 + 24);
  if (a6 && !*((_BYTE *)v48 + 24))
    *a6 = objc_retainAutorelease(*(id *)(v45[0] + 40));

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v47, 8);
  return v26 != 0;
}

void __83__CNDataMapperContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestContactsWriteAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v29 = *(id *)(v8 + 40);
    v9 = objc_msgSend(v5, "isValidSaveRequest:authorizationContext:error:", v6, v7, &v29);
    objc_storeStrong((id *)(v8 + 40), v29);
    if (v9)
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "suppressChangeNotifications");
      if ((v10 & 1) == 0)
      {
        +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "willSaveChanges");

      }
      +[CNChangeHistoryTriageLogger saveLogger](CNChangeHistoryTriageLogger, "saveLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "willExecuteSaveRequest");
      objc_msgSend(*(id *)(a1 + 40), "acceptChangeHistoryEventVisitor:", v12);
      objc_msgSend(*(id *)(a1 + 32), "mapper");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v15 = *(void **)(v14 + 40);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v27 = *(id *)(v18 + 40);
      v28 = v15;
      v19 = objc_msgSend(v13, "executeSaveRequest:response:authorizationContext:error:", v16, &v28, v17, &v27);
      objc_storeStrong((id *)(v14 + 40), v28);
      objc_storeStrong((id *)(v18 + 40), v27);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v19;

      objc_msgSend(v12, "didExecuteSaveRequest");
      if ((v10 & 1) == 0)
      {
        +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v22 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "saveRequestIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "didSaveChangesSuccessfully:fromContactStore:requestIdentifier:", v21, v22, v23);

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "didAffectMeCard"))
          {
            +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "saveRequestIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "didChangeMeContactSuccessfully:fromContactStore:requestIdentifier:", 1, v25, v26);

          }
        }
      }

    }
  }
}

- (BOOL)isValidSaveRequest:(id)a3 authorizationContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  id *v14;
  BOOL v15;
  char v16;
  id *v17;
  id v19;
  id obj;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "storeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__18;
  v28 = __Block_byref_object_dispose__18;
  v29 = 0;
  objc_msgSend(v7, "addedContactsByContainerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__CNDataMapperContactStore_isValidSaveRequest_authorizationContext_error___block_invoke;
  v21[3] = &unk_1E29FB540;
  v12 = v9;
  v22 = v12;
  v23 = &v24;
  v13 = objc_msgSend(v11, "_cn_all:", v21);

  if (v13)
  {
    v14 = (id *)(v25 + 5);
    obj = (id)v25[5];
    v15 = +[CNSaveRequestVerifier isValidSaveRequest:error:](CNSaveRequestVerifier, "isValidSaveRequest:error:", v7, &obj);
    objc_storeStrong(v14, obj);
    v16 = !v15;
    if (!v8)
      v16 = 1;
    if ((v16 & 1) == 0)
    {
      v17 = (id *)(v25 + 5);
      v19 = (id)v25[5];
      v15 = +[CNSaveRequestVerifier isSaveRequest:authorizedForSavingWithContext:error:](CNSaveRequestVerifier, "isSaveRequest:authorizedForSavingWithContext:error:", v7, v8, &v19);
      objc_storeStrong(v17, v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if (a5 && !v15)
    *a5 = objc_retainAutorelease((id)v25[5]);

  _Block_object_dispose(&v24, 8);
  return v15;
}

uint64_t __74__CNDataMapperContactStore_isValidSaveRequest_authorizationContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CNDataMapperContactStore_isValidSaveRequest_authorizationContext_error___block_invoke_2;
  v8[3] = &unk_1E29FB518;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = objc_msgSend(a2, "_cn_all:", v8);

  return v6;
}

uint64_t __74__CNDataMapperContactStore_isValidSaveRequest_authorizationContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 || *(_QWORD *)(a1 + 32))
    && (objc_msgSend(v3, "storeIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v14 = v3;
    v15 = CFSTR("CNInvalidRecords");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 302, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)defaultContainerIdentifier
{
  id v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = 0;
  if (-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__18;
    v11 = __Block_byref_object_dispose__18;
    v12 = 0;
    -[CNDataMapperContactStore logger](self, "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__CNDataMapperContactStore_defaultContainerIdentifier__block_invoke;
    v6[3] = &unk_1E29FB568;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v4, "fetchingDefaultContainerIdentifier:", v6);

    v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  return v3;
}

void __54__CNDataMapperContactStore_defaultContainerIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultContainerIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)legacyTetheredSyncDeviceAnchor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = 0;
    if (-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "legacyTetheredSyncDeviceAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && -[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegacyTetheredSyncDeviceAnchor:", v7);

  }
}

- (id)legacyTetheredSyncComputerAnchor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = 0;
    if (-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "legacyTetheredSyncComputerAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setLegacyTetheredSyncComputerAnchor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && -[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegacyTetheredSyncComputerAnchor:", v7);

  }
}

- (BOOL)supportsMatchingDictionaries
{
  void *v2;
  char v3;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (id)descriptorForRequiredKeysForMatchingDictionary
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptorForRequiredKeysForMatchingDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)contactIdentifierWithMatchingDictionary:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = 0;
    if (-[CNDataMapperContactStore requestContactsReadAccessWithError:](self, "requestContactsReadAccessWithError:", 0))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__18;
      v17 = __Block_byref_object_dispose__18;
      v18 = 0;
      -[CNDataMapperContactStore logger](self, "logger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__CNDataMapperContactStore_contactIdentifierWithMatchingDictionary___block_invoke;
      v10[3] = &unk_1E29FB5E0;
      v12 = &v13;
      v10[4] = self;
      v11 = v4;
      objc_msgSend(v8, "fetchingContactIdentifierWithMatchingDictionary:", v10);

      v7 = (id)v14[5];
      _Block_object_dispose(&v13, 8);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __68__CNDataMapperContactStore_contactIdentifierWithMatchingDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactIdentifierWithMatchingDictionary:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)matchingDictionaryForContact:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = 0;
    if (-[CNDataMapperContactStore requestContactsReadAccessWithError:](self, "requestContactsReadAccessWithError:", 0))
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "matchingDictionaryForContact:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__18;
    v24 = __Block_byref_object_dispose__18;
    v25 = 0;
    -[CNDataMapperContactStore logger](self, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__CNDataMapperContactStore_registerChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke;
    v15[3] = &unk_1E29FB300;
    v15[4] = self;
    v18 = &v20;
    v19 = &v26;
    v16 = v8;
    v17 = v9;
    objc_msgSend(v12, "registeringForChangeHistory:", v15);

    v13 = *((_BYTE *)v27 + 24) != 0;
    if (a5 && !*((_BYTE *)v27 + 24))
      *a5 = objc_retainAutorelease((id)v21[5]);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __95__CNDataMapperContactStore_registerChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(id *)(v8 + 40);
    v9 = objc_msgSend(v5, "registerChangeHistoryClientIdentifier:forContainerIdentifier:error:", v6, v7, &v10);
    objc_storeStrong((id *)(v8 + 40), v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v9;

  }
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__18;
    v24 = __Block_byref_object_dispose__18;
    v25 = 0;
    -[CNDataMapperContactStore logger](self, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __97__CNDataMapperContactStore_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke;
    v15[3] = &unk_1E29FB300;
    v15[4] = self;
    v18 = &v20;
    v19 = &v26;
    v16 = v8;
    v17 = v9;
    objc_msgSend(v12, "unregisteringForChangeHistory:", v15);

    v13 = *((_BYTE *)v27 + 24) != 0;
    if (a5 && !*((_BYTE *)v27 + 24))
      *a5 = objc_retainAutorelease((id)v21[5]);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __97__CNDataMapperContactStore_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(id *)(v8 + 40);
    v9 = objc_msgSend(v5, "unregisterChangeHistoryClientIdentifier:forContainerIdentifier:error:", v6, v7, &v10);
    objc_storeStrong((id *)(v8 + 40), v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v9;

  }
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CNChangeHistoryLegacyResultConverter *v15;
  void *v16;
  CNChangeHistoryLegacyResultConverter *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  CNDataMapperContactStore *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    v16 = 0;
    goto LABEL_18;
  }
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__18;
  v43 = __Block_byref_object_dispose__18;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__18;
  v37 = __Block_byref_object_dispose__18;
  v38 = 0;
  +[CNChangeHistoryTriageLogger fetchLogger](CNChangeHistoryTriageLogger, "fetchLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "willFetchHistoryWithRequest:", v6);
  -[CNDataMapperContactStore logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __64__CNDataMapperContactStore_changeHistoryWithFetchRequest_error___block_invoke;
  v28 = &unk_1E29FB288;
  v29 = self;
  v31 = &v33;
  v32 = &v39;
  v11 = v6;
  v30 = v11;
  objc_msgSend(v10, "fetchingChangeHistory:", &v25);

  v12 = objc_msgSend(v11, "resultType", v25, v26, v27, v28, v29);
  if (v40[5])
  {
    v13 = v12;
    if (!objc_msgSend(v11, "resultType") || v13 == 2)
    {
      v17 = [CNChangeHistoryLegacyResultConverter alloc];
      objc_msgSend(v11, "additionalContactKeyDescriptors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CNChangeHistoryLegacyResultConverter initWithContactStore:additionalContactKeyDescriptors:](v17, "initWithContactStore:additionalContactKeyDescriptors:", self, v18);

      -[CNChangeHistoryLegacyResultConverter eventsFromResult:](v15, "eventsFromResult:", v40[5]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isSuccess"))
      {
        objc_msgSend(v19, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v40[5], "latestChangeAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didFetchHistoryEvents:anchor:", v20, v21);

      }
      else
      {
        objc_msgSend(v19, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fetchDidFailWithError:", v20);
      }

    }
    else
    {
      if (objc_msgSend(v11, "resultType") != 1)
        goto LABEL_14;
      v14 = objc_msgSend((id)v40[5], "changesCount");
      objc_msgSend((id)v40[5], "latestChangeAnchor");
      v15 = (CNChangeHistoryLegacyResultConverter *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didFetchHistoryEventsCount:anchor:truncated:", v14, v15, objc_msgSend((id)v40[5], "changesTruncated"));
    }

  }
  else
  {
    objc_msgSend(v9, "fetchDidFailWithError:", v34[5]);
  }
LABEL_14:
  v22 = (void *)v34[5];
  v23 = (id)v40[5];
  v16 = v23;
  if (a4 && !v23)
    *a4 = objc_retainAutorelease(v22);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

LABEL_18:
  return v16;
}

void __64__CNDataMapperContactStore_changeHistoryWithFetchRequest_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestContactsReadAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v7 + 40);
    objc_msgSend(v5, "changeHistoryWithFetchRequest:error:", v6, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__18;
    v20 = __Block_byref_object_dispose__18;
    v21 = 0;
    -[CNDataMapperContactStore logger](self, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__CNDataMapperContactStore_executeChangeHistoryClearRequest_error___block_invoke;
    v12[3] = &unk_1E29FB288;
    v12[4] = self;
    v14 = &v16;
    v15 = &v22;
    v13 = v6;
    objc_msgSend(v9, "clearingChangeHistory:", v12);

    v10 = *((_BYTE *)v23 + 24) != 0;
    if (a4 && !*((_BYTE *)v23 + 24))
      *a4 = objc_retainAutorelease((id)v17[5]);

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __67__CNDataMapperContactStore_executeChangeHistoryClearRequest_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "requestMetadataAccessWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(id *)(v7 + 40);
    v8 = objc_msgSend(v5, "executeChangeHistoryClearRequest:error:", v6, &v9);
    objc_storeStrong((id *)(v7 + 40), v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;

  }
}

- (BOOL)hasMultipleGroupsOrAccounts
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || !-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:", 0))
  {
    return 0;
  }
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMultipleGroupsOrAccounts");

  return v6;
}

- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__18;
    v34 = __Block_byref_object_dispose__18;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__18;
    v28 = __Block_byref_object_dispose__18;
    v29 = 0;
    -[CNDataMapperContactStore logger](self, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__CNDataMapperContactStore_getBackgroundColorOnImageData_bitmapFormat_error___block_invoke;
    v19[3] = &unk_1E29FB608;
    v22 = &v30;
    v19[4] = self;
    v20 = v8;
    v21 = v9;
    v23 = &v24;
    objc_msgSend(v12, "gettingBackgroundColor:", v19);

    v13 = (void *)v25[5];
    v14 = (id)v31[5];
    v15 = v14;
    if (a5 && !v14)
      *a5 = objc_retainAutorelease(v13);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1005);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);

    v15 = 0;
  }

  return v15;
}

void __77__CNDataMapperContactStore_getBackgroundColorOnImageData_bitmapFormat_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "mapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "getBackgroundColorOnImageData:bitmapFormat:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)requestReadAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void (**v8)(id, uint64_t, _QWORD);
  _QWORD v9[5];
  id v10;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[CNDataMapperContactStore isContactProvider](self, "isContactProvider"))
    v6[2](v6, 1, 0);
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__CNDataMapperContactStore_requestReadAccessForEntityType_completionHandler___block_invoke;
  v9[3] = &unk_1E29FB680;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "requestAccessForEntityType:completionHandler:", a3, v9);

}

void __77__CNDataMapperContactStore_requestReadAccessForEntityType_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = v7;
  if (a3 || !a2)
    objc_msgSend(v6, "_logContactsAccessWasDeniedForAccessType:error:", 0, v7);
  else
    objc_msgSend(v6, "_logContactsAccessWasGrantedForAccessType:", 0, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)requestContactsWriteAccessWithError:(id *)a3
{
  return -[CNDataMapperContactStore _requestDataMapperAccessType:error:](self, "_requestDataMapperAccessType:error:", 1, a3);
}

- (void)_logContactsAccessWasDeniedForAccessType:(unint64_t)a3 error:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLogContactsAccess");

  if (v6)
  {
    -[CNDataMapperContactStore logger](self, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactsAccessWasDeniedWithError:", v8);

  }
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && (-[CNDataMapperContactStore mapper](self, "mapper"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchLimitedAccessContactIdentifiersForBundle:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addLimitedAccessForBundle:contactIdentifier:", v12, v6);

    }
  }

}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeLimitedAccessForBundle:contactIdentifier:", v12, v6);

    }
  }

}

- (id)getLimitedAccessContactsCountForBundle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getLimitedAccessContactsCountForBundle:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && (-[CNDataMapperContactStore mapper](self, "mapper"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "populateSyncTableForLimitedAccessAboveSequenceNumber:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "purgeLimitedAccessRecordsForBundle:", v9);

    }
  }

}

- (void)updateLimitedAccessTable:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateLimitedAccessTable:", v9);

    }
  }

}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getLimitedAccessLastSyncSequenceNumber:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && (-[CNDataMapperContactStore mapper](self, "mapper"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getWatchLimitedAccessSyncDataStartingAtSequenceNumber:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)applyLimitedAccessSyncEvents:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "applyLimitedAccessSyncEvents:", v9);

    }
  }

}

- (void)dropAllLimitedAccessRows
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  id v7;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dropAllLimitedAccessRows");

    }
  }
}

- (void)dropAllLimitedAccessRowsAndSyncNotify
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  id v7;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dropAllLimitedAccessRowsAndSyncNotify");

    }
  }
}

- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNDataMapperContactStore mapper](self, "mapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CNDataMapperContactStore mapper](self, "mapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLimitedAccessTableCurrentSequenceNumber:", v9);

    }
  }

}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  char v8;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldAnalyzeDatabaseWithError:", a3);

  return v8;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  char v8;

  -[CNDataMapperContactStore mapper](self, "mapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 1;
  -[CNDataMapperContactStore mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "analyzeDatabaseWithError:", a3);

  return v8;
}

- (id)iOSMapper
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[CNDataMapperContactStore mapper](self, "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)unifiedContactsMatchingPredicate:(os_log_t)log keysToFetch:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F8BD000, log, OS_LOG_TYPE_FAULT, "This method should not be called on the main thread as it may lead to UI unresponsiveness.", v1, 2u);
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_60_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Encountered null object(s) (data mapper)", v1, 2u);
}

- (void)executeSaveRequest:(os_log_t)log response:authorizationContext:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Did fail to save (%{public}@): %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
