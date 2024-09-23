@implementation CNContactStore

+ (id)storeIdentifier
{
  uint64_t v3;
  void *v4;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = 0;
  }
  else
  {
    NSStringFromClass((Class)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSArray)containersMatchingPredicate:(NSPredicate *)predicate error:(NSError *)error
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerCache, 0);
}

void __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _BYTE *v22;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "mutableObjects"))
  {
    objc_msgSend(v6, "selfOrMutableCopy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request:containsContact:", *(_QWORD *)(a1 + 32), v6);

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_2;
  v17 = &unk_1E29F9AA0;
  v9 = *(id *)(a1 + 40);
  v18 = v9;
  v10 = *(id *)(a1 + 48);
  v21 = v10;
  v11 = v7;
  v19 = v11;
  v13 = v6;
  v20 = v13;
  v22 = a4;
  __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_2((uint64_t)&v14);
  if (*a4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "logger", v13, v14, v15, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientStoppedEnumerationForRequest:", *(_QWORD *)(a1 + 32));

  }
}

- (CNContactStore)init
{
  CNContactStoreConfiguration *v3;
  CNContactStore *v4;
  objc_super v6;

  if (-[CNContactStore isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v3 = objc_alloc_init(CNContactStoreConfiguration);
    v4 = -[CNContactStore initWithConfiguration:](self, "initWithConfiguration:", v3);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNContactStore;
    v4 = -[CNContactStore init](&v6, sel_init);
  }

  return v4;
}

- (id)unifiedContactCountWithError:(id *)a3
{
  return &unk_1E2A40020;
}

- (id)_unifiedMeContactWithKeysToFetch:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "meContactIdentifiers:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:", v7, v5, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __99__CNContactStore_ElaborateSearches___executeFetchRequestsWithInfos_unifyResults_keysToFetch_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_10);
}

+ (int64_t)authorizationStatusForEntityType:(int64_t)a3 assumedIdentity:(id)a4
{
  id v5;
  CNAuthorization *v6;
  int64_t v7;

  v5 = a4;
  v6 = -[CNAuthorization initWithAssumedIdentity:]([CNAuthorization alloc], "initWithAssumedIdentity:", v5);

  v7 = -[CNAuthorization authorizationStatusForEntityType:](v6, "authorizationStatusForEntityType:", a3);
  return v7;
}

+ (CNAuthorizationStatus)authorizationStatusForEntityType:(CNEntityType)entityType
{
  void *v4;
  CNAuthorizationStatus v5;

  if (entityType)
    return 0;
  +[CNContactStore authorizationForCurrentProcess]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "authorizationStatusForEntityType:", 0);

  return v5;
}

+ (id)authorizationForCurrentProcess
{
  objc_opt_self();
  if (authorizationForCurrentProcess_cn_once_token_0 != -1)
    dispatch_once(&authorizationForCurrentProcess_cn_once_token_0, &__block_literal_global_53);
  return (id)authorizationForCurrentProcess_cn_once_object_0;
}

- (BOOL)enumerateContactsWithFetchRequest:(CNContactFetchRequest *)fetchRequest error:(NSError *)error usingBlock:(void *)block
{
  CNContactFetchRequest *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  char v25;
  id v26;
  id v28;
  _QWORD v29[5];
  uint8_t buf[16];

  v9 = fetchRequest;
  v10 = block;
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
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__CNContactStore_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke;
  v29[3] = &__block_descriptor_40_e5_v8__0l;
  v29[4] = v12;
  v16 = (void *)objc_msgSend(v29, "copy");
  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = _Block_copy(v17);
  objc_msgSend(v15, "push:", v18);

  -[CNContactFetchRequest predicate](v9, "predicate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19 && pthread_main_np() == 1)
  {
    objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isApplication");

    if (v21)
    {
      if (enumerateContactsWithFetchRequest_error_usingBlock__cn_once_token_15 != -1)
        dispatch_once(&enumerateContactsWithFetchRequest_error_usingBlock__cn_once_token_15, &__block_literal_global_61);
      if (os_log_type_enabled((os_log_t)enumerateContactsWithFetchRequest_error_usingBlock__cn_once_object_15, OS_LOG_TYPE_FAULT))
      {
        -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:].cold.1();
      }
    }
  }
  v22 = (void *)MEMORY[0x19400675C]();
  v28 = 0;
  v23 = -[CNContactStore pool_enumerateContactsWithFetchRequest:error:usingBlock:](self, v9, &v28, v10);
  v24 = v28;
  objc_autoreleasePoolPop(v22);
  if (error)
    v25 = v23;
  else
    v25 = 1;
  if ((v25 & 1) == 0)
    *error = (NSError *)objc_retainAutorelease(v24);

  objc_msgSend(v15, "popAllWithHandler:", &__block_literal_global_65);
  v26 = (id)objc_opt_self();

  return v23 & 1;
}

+ (CNContactStore)storeWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storeWithEnvironment:options:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactStore *)v6;
}

+ (CNContactStore)storeWithEnvironment:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEnvironment:options:", v6, a4);

  return (CNContactStore *)v7;
}

- (CNContactStore)initWithEnvironment:(id)a3 options:(unint64_t)a4 managedConfiguration:(id)a5
{
  id v8;
  id v9;
  CNContactStoreConfiguration *v10;
  CNContactStore *v11;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(CNContactStoreConfiguration);
  -[CNContactStoreConfiguration setIncludeLocalContacts:](v10, "setIncludeLocalContacts:", a4 & 1);
  -[CNContactStoreConfiguration setIncludeSuggestedContacts:](v10, "setIncludeSuggestedContacts:", (a4 >> 1) & 1);
  -[CNContactStoreConfiguration setIncludeDonatedContacts:](v10, "setIncludeDonatedContacts:", (a4 >> 2) & 1);
  -[CNContactStoreConfiguration setIncludeIncludeManagedAppleIDs:](v10, "setIncludeIncludeManagedAppleIDs:", (a4 >> 3) & 1);
  -[CNContactStoreConfiguration setUseInProcessMapperExclusively:](v10, "setUseInProcessMapperExclusively:", (a4 >> 4) & 1);
  -[CNContactStoreConfiguration setEnvironment:](v10, "setEnvironment:", v9);

  -[CNContactStoreConfiguration setManagedConfiguration:](v10, "setManagedConfiguration:", v8);
  v11 = -[CNContactStore initWithConfiguration:](self, "initWithConfiguration:", v10);

  return v11;
}

- (CNContactStore)initWithEnvironment:(id)a3 options:(unint64_t)a4
{
  return -[CNContactStore initWithEnvironment:options:managedConfiguration:](self, "initWithEnvironment:options:managedConfiguration:", a3, a4, 0);
}

- (CNContactStore)initWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  CNSuggestedContactStore *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNSuggestedContactStore *v13;
  CNDataMapperConfiguration *v14;
  CNDonationMapper *v15;
  CNDataMapperContactStore *v16;
  CNDataMapperConfiguration *v17;
  CNMAIDMapper *v18;
  CNDataMapperContactStore *v19;
  CNDataMapperContactStore *v20;
  CNAggregateContactStore *v21;
  CNContactStore *p_super;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v5 = a3;
  objc_msgSend(v5, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v26 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("CNContactStoreConfiguration.environment is unexpectedly nil for %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, v28, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v29);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "includeSuggestedContacts"))
  {
    v8 = [CNSuggestedContactStore alloc];
    objc_msgSend(v5, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suggestionsService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "siriIntelligenceSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CNSuggestedContactStore initWithSuggestionsService:siriIntelligenceSettings:](v8, "initWithSuggestionsService:siriIntelligenceSettings:", v10, v12);

    objc_msgSend(v7, "addObject:", v13);
  }
  if (objc_msgSend(v5, "includeDonatedContacts"))
  {
    v14 = -[CNDataMapperConfiguration initWithContactStoreConfiguration:]([CNDataMapperConfiguration alloc], "initWithContactStoreConfiguration:", v5);
    v15 = -[CNDonationMapper initWithConfiguration:]([CNDonationMapper alloc], "initWithConfiguration:", v14);
    v16 = -[CNDataMapperContactStore initWithDataMapper:dataMapperConfiguration:]([CNDataMapperContactStore alloc], "initWithDataMapper:dataMapperConfiguration:", v15, v14);
    objc_msgSend(v7, "addObject:", v16);

  }
  if (objc_msgSend(v5, "includeIncludeManagedAppleIDs"))
  {
    v17 = -[CNDataMapperConfiguration initWithContactStoreConfiguration:]([CNDataMapperConfiguration alloc], "initWithContactStoreConfiguration:", v5);
    v18 = -[CNMAIDMapper initWithConfiguration:]([CNMAIDMapper alloc], "initWithConfiguration:", v17);
    v19 = -[CNDataMapperContactStore initWithDataMapper:dataMapperConfiguration:]([CNDataMapperContactStore alloc], "initWithDataMapper:dataMapperConfiguration:", v18, v17);
    objc_msgSend(v7, "addObject:", v19);

  }
  if ((objc_msgSend(v5, "includeLocalContacts") & 1) != 0 || !objc_msgSend(v7, "count"))
  {
    v20 = -[CNDataMapperContactStore initWithConfiguration:]([CNDataMapperContactStore alloc], "initWithConfiguration:", v5);
    objc_msgSend(v7, "insertObject:atIndex:", v20, 0);

  }
  if (objc_msgSend(v7, "count") == 1 && objc_msgSend(v5, "leaveSingleStoresUnwrapped"))
  {
    objc_msgSend(v7, "firstObject");
    v21 = (CNAggregateContactStore *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = -[CNAggregateContactStore initWithContactStores:configuration:]([CNAggregateContactStore alloc], "initWithContactStores:configuration:", v7, v5);
  }
  p_super = &v21->super;

  return p_super;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  CNContactStoreFetchExecutor *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  uint8_t buf[16];

  v7 = a3;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", ", buf, 2u);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __44__CNContactStore_executeFetchRequest_error___block_invoke;
  v27[3] = &__block_descriptor_40_e5_v8__0l;
  v27[4] = v9;
  v13 = (void *)objc_msgSend(v27, "copy");
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _Block_copy(v14);
  objc_msgSend(v12, "push:", v15);

  objc_opt_class();
  v16 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
    objc_msgSend(v18, "setResultType:", 0);
  v19 = -[CNContactStoreFetchExecutor initWithContactStore:]([CNContactStoreFetchExecutor alloc], "initWithContactStore:", self);
  -[CNContactStoreFetchExecutor executeFetchRequest:](v19, "executeFetchRequest:", v16);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v20, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v20, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a4)
      *a4 = objc_retainAutorelease(v23);

    v22 = 0;
  }

  objc_msgSend(v12, "popAllWithHandler:", &__block_literal_global_71);
  v25 = (id)objc_opt_self();

  return v22;
}

- (void)pool_enumerateContactsWithFetchRequest:(_QWORD *)a3 error:(void *)a4 usingBlock:
{
  id v7;
  id v8;
  CNAPITriageSession *v9;
  id v10;
  CNAPITriageSession *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  CNAPITriageSession *v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = -[CNAPITriageSession initWithRequest:]([CNAPITriageSession alloc], "initWithRequest:", v7);
    -[CNAPITriageSession open](v9, "open");
    if (objc_msgSend(v7, "shouldFailIfAccountNotYetSynced")
      && (objc_msgSend(a1, "hasAccountFirstSyncCompleted") & 1) == 0)
    {
      +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1007);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAPITriageSession closeWithError:](v9, "closeWithError:", v14);
      if (a3)
        *a3 = objc_retainAutorelease(v14);

      a1 = 0;
      goto LABEL_14;
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v21 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke;
    v16[3] = &unk_1E29F9AC8;
    v10 = v7;
    v17 = v10;
    v11 = v9;
    v18 = v11;
    v19 = v8;
    v20 = &v22;
    a1 = (void *)objc_msgSend(a1, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v10, &v21, v16);
    v12 = v21;
    if (*((_BYTE *)v23 + 24))
    {
      if ((_DWORD)a1)
      {
LABEL_6:
        -[CNAPITriageSession close](v11, "close");
LABEL_10:

        _Block_object_dispose(&v22, 8);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      -[CNAPITriageSession logger](v11, "logger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didReturnAllResultsForContactFetchRequest:", v10);

      if ((_DWORD)a1)
        goto LABEL_6;
    }
    -[CNAPITriageSession closeWithError:](v11, "closeWithError:", v12);
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    goto LABEL_10;
  }
LABEL_15:

  return a1;
}

- (CNContact)unifiedContactWithIdentifier:(NSString *)identifier keysToFetch:(NSArray *)keys error:(NSError *)error
{
  NSString *v9;
  NSArray *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CNContactFetchRequest *v20;
  void *v21;
  void *v22;
  CNAPITriageSession *v23;
  BOOL v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v35[7];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[8];
  uint8_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[5];
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v9 = identifier;
  v10 = keys;
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
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke;
  v51[3] = &__block_descriptor_40_e5_v8__0l;
  v51[4] = v12;
  v17 = (void *)objc_msgSend(v51, "copy");
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _Block_copy(v18);
  objc_msgSend(v15, "push:", v19);

  v20 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", v10);
  if (v9)
  {
    v53[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA60];
  }
  +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFetchRequest setPredicate:](v20, "setPredicate:", v22);

  if (v9)
  v23 = -[CNAPITriageSession initWithRequest:]([CNAPITriageSession alloc], "initWithRequest:", v20);
  -[CNAPITriageSession open](v23, "open");
  *(_QWORD *)buf = 0;
  v46 = buf;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__13;
  v49 = __Block_byref_object_dispose__13;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v35[6] = &v37;
  v36 = 0;
  v35[0] = v16;
  v35[1] = 3221225472;
  v35[2] = __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke_41;
  v35[3] = &unk_1E29F9A58;
  v35[4] = buf;
  v35[5] = &v41;
  v24 = -[CNContactStore enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:](self, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v20, &v36, v35);
  v25 = v36;
  v26 = v25;
  if (v24)
  {
    if (!*((_BYTE *)v42 + 24))
      CNSetError(error, 200, 0);
    if (*((_BYTE *)v38 + 24))
    {
      v27 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:].cold.1();

      CNSetError(error, 2, 0);
    }
    (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v46 + 5);
    *((_QWORD *)v46 + 5) = v28;

    if (error && *error)
    {
      -[CNAPITriageSession closeWithError:](v23, "closeWithError:");
    }
    else if (*((_QWORD *)v46 + 5))
    {
      v52 = *((_QWORD *)v46 + 5);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAPITriageSession closeWithContacts:](v23, "closeWithContacts:", v32);

    }
    else
    {
      -[CNAPITriageSession close](v23, "close");
    }
    v31 = *((id *)v46 + 5);
  }
  else
  {
    if (!v25)
    {
      v30 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:].cold.2();

      +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CNAPITriageSession closeWithError:](v23, "closeWithError:", v26);
    v31 = 0;
    if (error)
      *error = (NSError *)objc_retainAutorelease(v26);
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

  objc_msgSend(v15, "popAllWithHandler:", &__block_literal_global_48_0);
  v33 = (id)objc_opt_self();

  return (CNContact *)v31;
}

void __99__CNContactStore_ElaborateSearches___executeFetchRequestsWithInfos_unifyResults_keysToFetch_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  CNContactFetchRequest *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id obj;

  v6 = a2;
  v7 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", *(_QWORD *)(a1 + 32));
  -[CNContactFetchRequest setUnifyResults:](v7, "setUnifyResults:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v6, "predicate");
  v8 = objc_claimAutoreleasedReturnValue();

  -[CNContactFetchRequest setPredicate:](v7, "setPredicate:", v8);
  v9 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v10 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__CNContactStore_ElaborateSearches___executeFetchRequestsWithInfos_unifyResults_keysToFetch_error___block_invoke_2;
  v13[3] = &unk_1E29FD7C0;
  v13[4] = *(_QWORD *)(a1 + 56);
  LOBYTE(v8) = objc_msgSend(v9, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v7, &obj, v13);
  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v8 & 1) == 0)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    *a4 = 1;
  }

}

void __81__CNContactStore_ElaborateSearches___fetchRequestInfosForEmailOrPhoneForContact___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isSuggested") & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v7, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CNContactMatchingFetchRequestInfos fetchRequestInfoForPredicate:properties:](_CNContactMatchingFetchRequestInfos, "fetchRequestInfoForPredicate:properties:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
}

void __81__CNContactStore_ElaborateSearches___fetchRequestInfosForEmailOrPhoneForContact___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isSuggested") & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v7, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CNContactMatchingFetchRequestInfos fetchRequestInfoForPredicate:properties:](_CNContactMatchingFetchRequestInfos, "fetchRequestInfoForPredicate:properties:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
}

+ (id)storeIdentifierFromContactIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("://"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)internalIdentifierFromContactIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("://"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", v4 + v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_ios_meContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  return -[CNContactStore _unifiedMeContactWithKeysToFetch:error:](self, a3, (uint64_t)a4);
}

- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  return -[CNContactStore _unifiedMeContactWithKeysToFetch:error:](self, a3, (uint64_t)a4);
}

- (id)contactsMatchingPropertiesOfContact:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[2];

  v8 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasBeenPersisted"))
  {
    if (objc_msgSend(v10, "areKeysAvailable:", v11))
    {
LABEL_12:
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CNContactMatchingFetchRequestInfos fetchRequestInfoForPredicate:properties:](_CNContactMatchingFetchRequestInfos, "fetchRequestInfoForPredicate:properties:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);

  }
  else
  {
    -[CNContactStore _fetchRequestInfosForEmailOrPhoneForContact:](self, "_fetchRequestInfosForEmailOrPhoneForContact:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v17);

  }
  if (!objc_msgSend(v12, "count"))
  {
LABEL_11:
    if ((objc_msgSend(v10, "areKeysAvailable:", v11) & 1) == 0)
    {
      v21 = +[CNContact newContactWithPropertyKeys:withValuesFromContact:](CNContact, "newContactWithPropertyKeys:withValuesFromContact:", v11, v10);
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    goto LABEL_12;
  }
  -[CNContactStore _executeFetchRequestsWithInfos:unifyResults:keysToFetch:error:](self, "_executeFetchRequestsWithInfos:unifyResults:keysToFetch:error:", v12, v8, v11, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if (objc_msgSend(v18, "count"))
    {
      v20 = v19;
      goto LABEL_9;
    }

    goto LABEL_11;
  }
LABEL_9:

LABEL_14:
  return v19;
}

- (id)_fetchRequestInfosForEmailOrPhoneForContact:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isKeyAvailable:", CFSTR("emailAddresses"));
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_msgSend(v3, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __81__CNContactStore_ElaborateSearches___fetchRequestInfosForEmailOrPhoneForContact___block_invoke;
    v16[3] = &unk_1E29FD798;
    v17 = v4;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

  }
  if (objc_msgSend(v3, "isKeyAvailable:", CFSTR("phoneNumbers")))
  {
    objc_msgSend(v3, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v12 = 3221225472;
    v13 = __81__CNContactStore_ElaborateSearches___fetchRequestInfosForEmailOrPhoneForContact___block_invoke_2;
    v14 = &unk_1E29FD798;
    v15 = v4;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v11);

  }
  v9 = (void *)objc_msgSend(v4, "copy", v11, v12, v13, v14);

  return v9;
}

- (id)_executeFetchRequestsWithInfos:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  CNContactStore *v18;
  uint64_t *v19;
  uint64_t *v20;
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

  v10 = a3;
  v11 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__28;
  v32 = __Block_byref_object_dispose__28;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__28;
  v26 = __Block_byref_object_dispose__28;
  v27 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__CNContactStore_ElaborateSearches___executeFetchRequestsWithInfos_unifyResults_keysToFetch_error___block_invoke;
  v16[3] = &unk_1E29FD7E8;
  v12 = v11;
  v21 = a4;
  v17 = v12;
  v18 = self;
  v19 = &v22;
  v20 = &v28;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);
  if (a6)
  {
    v13 = (void *)v23[5];
    if (v13)
      *a6 = objc_retainAutorelease(v13);
  }
  v14 = (void *)objc_msgSend((id)v29[5], "copy");

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

void __48__CNContactStore_authorizationForCurrentProcess__block_invoke()
{
  CNAuthorization *v0;
  void *v1;

  v0 = objc_alloc_init(CNAuthorization);
  v1 = (void *)authorizationForCurrentProcess_cn_once_object_0;
  authorizationForCurrentProcess_cn_once_object_0 = (uint64_t)v0;

}

+ (id)storeInfoClasses
{
  return 0;
}

+ (Class)storeClassWithIdentifier:(id)a3
{
  if (a3)
    NSClassFromString((NSString *)a3);
  else
    objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

id __28__CNContactStore_initialize__block_invoke()
{
  return +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
}

- (BOOL)hasGroups
{
  return 0;
}

uint64_t __63__CNContactStore_requestAccessForEntityType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  _QWORD *v16;

  objc_msgSend(*(id *)(a1 + 32), "timeProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  if (v5)
    v9 = *(_QWORD *)(a1 + 40);
  else
    v9 = *(_QWORD *)(a1 + 48);
  v10 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
  v16 = v7;
  v11 = v5;
  v12 = v6;
  v10(v16, v9, v8);
  objc_msgSend(*(id *)(a1 + 32), "timeProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "addClientCalloutTime:", v15 - v4);
}

void __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke(uint64_t a1)
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

- (void)requestAccessForEntityType:(CNEntityType)entityType completionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = completionHandler;
  -[CNContactStore requestAccessForEntityType:](self, "requestAccessForEntityType:", entityType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__CNContactStore_requestAccessForEntityType_completionHandler___block_invoke;
  v13[3] = &unk_1E29F9A08;
  v9 = v6;
  v14 = v9;
  objc_msgSend(v7, "addSuccessBlock:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __63__CNContactStore_requestAccessForEntityType_completionHandler___block_invoke_2;
  v11[3] = &unk_1E29F9A30;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v7, "addFailureBlock:", v11);

}

void __44__CNContactStore_executeFetchRequest_error___block_invoke(uint64_t a1)
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

void __69__CNContactStore_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1)
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

+ (BOOL)isXPCDataMapperStoreForFavorites:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  CNPolicyDescription *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(CNPolicyDescription);
  -[CNPolicyDescription setContainerIdentifier:](v7, "setContainerIdentifier:", v6);

  -[CNContactStore policyWithDescription:error:](self, "policyWithDescription:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)storeForFamilyMember:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D139D8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFamilyMember:", v5);

  objc_msgSend(a1, "storeWithDelegateInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (CNContactStore)storeWithDelegateInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNContactStoreConfiguration *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copyWithDelegateInfos:", v6);

  v8 = objc_alloc_init(CNContactStoreConfiguration);
  -[CNContactStoreConfiguration setEnvironment:](v8, "setEnvironment:", v7);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:", v8);

  return (CNContactStore *)v9;
}

+ (BOOL)eraseAllDataAtLocationWithName:(id)a3 error:(id *)a4
{
  void *v6;
  char v7;

  +[CNContactsEnvironment baseURLWithDataLocationName:](CNContactsEnvironment, "baseURLWithDataLocationName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = objc_msgSend(a1, "eraseAllDataAtURL:error:", v6, a4);
  else
    v7 = 1;

  return v7;
}

+ (BOOL)eraseAllDataAtURL:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  char v11;
  id v13;

  v5 = (objc_class *)MEMORY[0x1E0CB3620];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v13 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v13);

  v9 = v13;
  if ((v8 & 1) == 0)
  {
    if (!objc_msgSend(MEMORY[0x1E0D13A50], "isError:errorWithDomain:code:", v9, *MEMORY[0x1E0CB28A8], 4))
    {
      v10 = 0;
      goto LABEL_6;
    }

    v9 = 0;
  }
  v10 = 1;
LABEL_6:
  v11 = objc_msgSend(MEMORY[0x1E0D13A50], "ifResultIsNo:setOutputError:toError:", v10, a4, v9);

  return v11;
}

+ (id)contactIdentifierFromInternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    +[CNContact makeIdentifierString](CNContact, "makeIdentifierString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v5, CFSTR("://"), v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

+ (BOOL)isSharedNamePhotoEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFeatureEnabled:", 13);

  return v4;
}

- (CNContactStore)initWithEnvironment:(id)a3
{
  return -[CNContactStore initWithEnvironment:options:](self, "initWithEnvironment:options:", a3, 1);
}

uint64_t __63__CNContactStore_requestAccessForEntityType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)requestAccessForEntityType:(int64_t)a3
{
  CNContactStore *v3;
  id v4;

  v3 = self;
  CNAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

void __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke_41(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v9 = v10;
  if (v10)
  {
    *v8 = 0;

    *a4 = 1;
    v11 = a1[6];
  }
  else
  {
    objc_storeStrong(v8, a2);
    v11 = a1[5];
  }
  *(_BYTE *)(*(_QWORD *)(v11 + 8) + 24) = 1;

}

uint64_t __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke_46(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)meContactIdentifiers:(id *)a3
{
  CNSetError(a3, 200, 0);
  return 0;
}

- (id)_ios_meContactIdentifierWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[CNContactStore meContactIdentifiers:](self, "meContactIdentifiers:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNContact)unifiedMeContactWithKeysToFetch:(NSArray *)keys error:(NSError *)error
{
  NSArray *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint8_t buf[16];

  v7 = keys;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", ", buf, 2u);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__CNContactStore_unifiedMeContactWithKeysToFetch_error___block_invoke;
  v19[3] = &__block_descriptor_40_e5_v8__0l;
  v19[4] = v9;
  v13 = (void *)objc_msgSend(v19, "copy");
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _Block_copy(v14);
  objc_msgSend(v12, "push:", v15);

  -[CNContactStore _unifiedMeContactWithKeysToFetch:error:](self, v7, (uint64_t)error);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "popAllWithHandler:", &__block_literal_global_50_1);
  v17 = (id)objc_opt_self();

  return (CNContact *)v16;
}

void __56__CNContactStore_unifiedMeContactWithKeysToFetch_error___block_invoke(uint64_t a1)
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

uint64_t __56__CNContactStore_unifiedMeContactWithKeysToFetch_error___block_invoke_49(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)unifiedMeContactMatchingEmailAddresses:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](self, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v9, "emailAddresses", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lowercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "_cn_map:", &__block_literal_global_54_1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "intersectsSet:", v20))
    v21 = v9;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

uint64_t __75__CNContactStore_unifiedMeContactMatchingEmailAddresses_keysToFetch_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lowercaseString");
}

- (id)unifiedMeContactMatchingEmailAddress:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStore unifiedMeContactMatchingEmailAddresses:keysToFetch:error:](self, "unifiedMeContactMatchingEmailAddresses:keysToFetch:error:", v11, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", self, sel_setMeContact_error_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return 0;
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", self, sel_setMeContact_forContainer_error_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a5)
    *a5 = objc_retainAutorelease(v6);

  return 0;
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  return 0;
}

- (NSArray)unifiedContactsMatchingPredicate:(NSPredicate *)predicate keysToFetch:(NSArray *)keys error:(NSError *)error
{
  return 0;
}

void __69__CNContactStore_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_60()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runtime-issues", "Contacts");
  v1 = (void *)enumerateContactsWithFetchRequest_error_usingBlock__cn_once_object_15;
  enumerateContactsWithFetchRequest_error_usingBlock__cn_once_object_15 = (uint64_t)v0;

}

uint64_t __69__CNContactStore_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (BOOL)enumerateNonUnifiedContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9;
  id v10;
  BOOL v11;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v9, "unifyResults"))
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    v15 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Can't set -[CNContactFetchRequest unifyResults] to YES with %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v18);
  }
  v11 = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](self, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, a4, v10);

  return v11;
}

- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  void *v6;
  void *v7;

  +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1005, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return 0;
}

- (NSArray)groupsMatchingPredicate:(NSPredicate *)predicate error:(NSError *)error
{
  return 0;
}

- (id)groupWithIdentifier:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)executeSaveRequest:(CNSaveRequest *)saveRequest error:(NSError *)error
{
  return 0;
}

- (BOOL)supportsSaveRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "storeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v8 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v4, "storeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "storeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v5)
    goto LABEL_6;
LABEL_7:

  return v8;
}

- (NSString)defaultContainerIdentifier
{
  return 0;
}

- (BOOL)hasMultipleGroupsOrAccounts
{
  return 0;
}

uint64_t __44__CNContactStore_executeFetchRequest_error___block_invoke_70(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)executeFetchRequestAndCountResults:(void *)a1
{
  void *v2;
  id v3;
  void *v4;
  CNFetchResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNFetchResult *v10;
  id v12;

  if (!a1)
    return 0;
  v12 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", a2, &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "failureWithError:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [CNFetchResult alloc];
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentHistoryToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNFetchResult initWithValue:currentHistoryToken:](v5, "initWithValue:currentHistoryToken:", v8, v9);

    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  CNContactStoreFetchExecutor *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  uint8_t buf[16];

  v7 = a3;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", ", buf, 2u);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __45__CNContactStore_countForFetchRequest_error___block_invoke;
  v28[3] = &__block_descriptor_40_e5_v8__0l;
  v28[4] = v9;
  v13 = (void *)objc_msgSend(v28, "copy");
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _Block_copy(v14);
  objc_msgSend(v12, "push:", v15);

  objc_opt_class();
  v16 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    objc_msgSend(v18, "setResultType:", 1);
    v19 = -[CNContactStoreFetchExecutor initWithContactStore:]([CNContactStoreFetchExecutor alloc], "initWithContactStore:", self);
    -[CNContactStoreFetchExecutor countForFetchRequest:](v19, "countForFetchRequest:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNContactStore executeFetchRequestAndCountResults:](self, (uint64_t)v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  objc_msgSend(v21, "value");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v21, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v21, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a4)
      *a4 = objc_retainAutorelease(v24);

    v23 = 0;
  }

  objc_msgSend(v12, "popAllWithHandler:", &__block_literal_global_76_0);
  v26 = (id)objc_opt_self();

  return v23;
}

void __45__CNContactStore_countForFetchRequest_error___block_invoke(uint64_t a1)
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

uint64_t __45__CNContactStore_countForFetchRequest_error___block_invoke_75(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (CNFetchResult)enumeratorForContactFetchRequest:(CNContactFetchRequest *)request error:(NSError *)error
{
  CNContactFetchRequest *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  CNFetchResult *v20;
  void *v21;
  void *v22;
  void *v23;
  CNFetchResult *v24;
  id v25;
  _QWORD v27[5];
  uint8_t buf[16];

  v7 = request;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", ", buf, 2u);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __57__CNContactStore_enumeratorForContactFetchRequest_error___block_invoke;
  v27[3] = &__block_descriptor_40_e5_v8__0l;
  v27[4] = v9;
  v13 = (void *)objc_msgSend(v27, "copy");
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _Block_copy(v14);
  objc_msgSend(v12, "push:", v15);

  -[CNContactFetchRequest predicate](v7, "predicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 && pthread_main_np() == 1)
  {
    objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isApplication");

    if (v18)
    {
      if (enumeratorForContactFetchRequest_error__cn_once_token_29 != -1)
        dispatch_once(&enumeratorForContactFetchRequest_error__cn_once_token_29, &__block_literal_global_78_0);
      if (os_log_type_enabled((os_log_t)enumeratorForContactFetchRequest_error__cn_once_object_29, OS_LOG_TYPE_FAULT))
        -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:].cold.1();
    }
  }
  -[CNContactStore executeFetchRequest:error:](self, "executeFetchRequest:error:", v7, error);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = [CNFetchResult alloc];
    objc_msgSend(v19, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectEnumerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentHistoryToken");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[CNFetchResult initWithValue:currentHistoryToken:](v20, "initWithValue:currentHistoryToken:", v22, v23);

  }
  else
  {
    v24 = 0;
  }

  objc_msgSend(v12, "popAllWithHandler:", &__block_literal_global_80);
  v25 = (id)objc_opt_self();

  return v24;
}

void __57__CNContactStore_enumeratorForContactFetchRequest_error___block_invoke(uint64_t a1)
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

void __57__CNContactStore_enumeratorForContactFetchRequest_error___block_invoke_77()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runtime-issues", "Contacts");
  v1 = (void *)enumeratorForContactFetchRequest_error__cn_once_object_29;
  enumeratorForContactFetchRequest_error__cn_once_object_29 = (uint64_t)v0;

}

uint64_t __57__CNContactStore_enumeratorForContactFetchRequest_error___block_invoke_79(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (CNFetchResult)enumeratorForChangeHistoryFetchRequest:(CNChangeHistoryFetchRequest *)request error:(NSError *)error
{
  void *v4;
  CNFetchResult *v5;
  void *v6;
  void *v7;
  void *v8;
  CNFetchResult *v9;

  -[CNContactStore executeFetchRequest:error:](self, "executeFetchRequest:error:", request, error);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CNFetchResult alloc];
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentHistoryToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNFetchResult initWithValue:currentHistoryToken:](v5, "initWithValue:currentHistoryToken:", v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)executeFetchRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(_QWORD *, uint64_t);
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  _QWORD v39[5];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Fetching", ", buf, 2u);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v14 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __49__CNContactStore_executeFetchRequest_completion___block_invoke;
  v39[3] = &__block_descriptor_40_e5_v8__0l;
  v39[4] = v10;
  v15 = (void *)objc_msgSend(v39, "copy");
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _Block_copy(v16);
  objc_msgSend(v13, "push:", v17);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v14;
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CNContactStore_executeFetchRequest_completion___block_invoke_82;
  aBlock[3] = &unk_1E29F9B30;
  v20 = v18;
  v37 = v20;
  v21 = v19;
  v38 = v21;
  v22 = _Block_copy(aBlock);
  v29 = v14;
  v30 = 3221225472;
  v31 = __49__CNContactStore_executeFetchRequest_completion___block_invoke_2;
  v32 = &unk_1E29F9B58;
  v35 = v8;
  v23 = v20;
  v33 = v23;
  v24 = v21;
  v34 = v24;
  v25 = _Block_copy(&v29);
  -[CNContactStore executeFetchRequest:progressiveResults:completion:](self, "executeFetchRequest:progressiveResults:completion:", v7, v22, v25, v29, v30, v31, v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "popAllWithHandler:", &__block_literal_global_84_0);
  v27 = (id)objc_opt_self();

  return v26;
}

void __49__CNContactStore_executeFetchRequest_completion___block_invoke(uint64_t a1)
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

void __49__CNContactStore_executeFetchRequest_completion___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v5);
  }

}

void __49__CNContactStore_executeFetchRequest_completion___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  id v4;

  v2 = a1[6];
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(v2 + 16))(a1[6], 0, 0, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", a1[4]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v4, a1[5], 0);

  }
}

uint64_t __49__CNContactStore_executeFetchRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  return 0;
}

- (id)identifierWithError:(id *)a3
{
  return 0;
}

- (int)saveSequenceCount
{
  return -1;
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  return &unk_1E2A40020;
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  return 0;
}

+ (id)standardLabelsForPropertyWithKey:(id)a3
{
  return (id)objc_msgSend(a1, "standardLabelsForPropertyWithKey:options:", a3, 0);
}

+ (id)standardLabelsForPropertyWithKey:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "standardLabelsWithOptions:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)mainContactStore
{
  void *v3;
  CNContactStore *v4;

  objc_msgSend((id)objc_opt_class(), "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = 0;
  else
    v4 = self;
  return v4;
}

- (BOOL)resetSortDataIfNeededWithError:(id *)a3
{
  void *v4;
  void *v5;

  +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", self, sel_resetSortDataIfNeededWithError_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    *a3 = objc_retainAutorelease(v4);

  return 0;
}

- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", self, sel_setDefaultAccountIdentifier_error_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return 0;
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", self, sel_sectionListOffsetsForSortOrder_error_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return 0;
}

- (id)descriptorForRequiredKeysForUserActivityUserInfo
{
  CNContactStore *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  return 0;
}

- (id)userActivityUserInfoForContact:(id)a3
{
  return 0;
}

- (BOOL)supportsMatchingDictionaries
{
  return 0;
}

- (id)descriptorForRequiredKeysForMatchingDictionary
{
  CNContactStore *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)matchingDictionaryForContact:(id)a3
{
  return 0;
}

- (id)contactWithMatchingDictionary:(id)a3 keysToFetch:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CNContactStore contactIdentifierWithMatchingDictionary:](self, "contactIdentifierWithMatchingDictionary:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](self, "unifiedContactWithIdentifier:keysToFetch:error:", v7, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)contactIdentifierWithMatchingDictionary:(id)a3
{
  return 0;
}

- (NSData)currentHistoryToken
{
  return 0;
}

- (CNResult)currentHistoryAnchor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13B60];
  +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1005);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNResult *)v4;
}

- (id)individualContactCountWithError:(id *)a3
{
  return &unk_1E2A40020;
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 error:(id *)a4
{
  return -[CNContactStore registerChangeHistoryClientIdentifier:forContainerIdentifier:error:](self, "registerChangeHistoryClientIdentifier:forContainerIdentifier:error:", a3, 0, a4);
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 error:(id *)a4
{
  return -[CNContactStore unregisterChangeHistoryClientIdentifier:forContainerIdentifier:error:](self, "unregisterChangeHistoryClientIdentifier:forContainerIdentifier:error:", a3, 0, a4);
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)clearChangeHistoryForClientIdentifier:(id)a3 toChangeAnchor:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CNChangeHistoryClearRequest *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[CNChangeHistoryClearRequest initWithClientIdentifier:]([CNChangeHistoryClearRequest alloc], "initWithClientIdentifier:", v9);

  -[CNChangeHistoryClearRequest setToChangeAnchor:](v10, "setToChangeAnchor:", v8);
  LOBYTE(a5) = -[CNContactStore executeChangeHistoryClearRequest:error:](self, "executeChangeHistoryClearRequest:error:", v10, a5);

  return (char)a5;
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)latestConsumedChangeHistoryAnchorForClientIdentifier:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)verifyChangeHistoryForClientIdentifier:(id)a3 error:(id *)a4
{
  return 1;
}

+ (BOOL)isAccessRestrictedForEntityType:(int64_t)a3
{
  void *v4;

  +[CNContactStore authorizationForCurrentProcess]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "isAccessRestrictedForEntityType:", a3);

  return a3;
}

+ (BOOL)isAccessLimitedForEntityType:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  +[CNContactStore authorizationForCurrentProcess]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "authorizationStatusForEntityType:", a3);

  return v5 == 4;
}

- (void)requestAuthorization:(int64_t)a3 entityType:(int64_t)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  _QWORD v8[4];
  void (**v9)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend((id)objc_opt_class(), "isAccessRestrictedForEntityType:", a4))
  {
    v7[2](v7, 4, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__CNContactStore_requestAuthorization_entityType_completionHandler___block_invoke;
    v8[3] = &unk_1E29F8AF8;
    v9 = v7;
    -[CNContactStore requestAccessForEntityType:completionHandler:](self, "requestAccessForEntityType:completionHandler:", a4, v8);

  }
}

uint64_t __68__CNContactStore_requestAuthorization_entityType_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 6;
  else
    v3 = 4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (id)authorizedKeysForContactKeys:(id)a3
{
  id v4;
  CNContactStore *v5;
  CNContactStore *v6;
  CNContactStore *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  v5 = self;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  -[CNContactStore mapper](v7, "mapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "authorizedKeysForContactKeys:error:", v4, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v4;
  }
  v12 = v11;

  return v12;
}

- (BOOL)hasAccountFirstSyncCompleted
{
  CNContainerCache *containerCache;
  CNContainerCache *v4;
  CNContainerCache *v5;
  void *v6;
  void *v7;
  BOOL v8;

  containerCache = self->_containerCache;
  if (!containerCache)
  {
    v4 = -[CNContainerCache initWithContactStore:]([CNContainerCache alloc], "initWithContactStore:", self);
    v5 = self->_containerCache;
    self->_containerCache = v4;

    containerCache = self->_containerCache;
  }
  -[CNContainerCache primaryiCloudContainer](containerCache, "primaryiCloudContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastSyncDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)getLimitedAccessContactsCountForBundle:(id)a3
{
  return 0;
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  void *v4;
  void *v5;

  +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    *a3 = objc_retainAutorelease(v4);

  return 0;
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  return 0;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  return 1;
}

+ (id)logSpotlight
{
  if (logSpotlight_cn_once_token_1 != -1)
    dispatch_once(&logSpotlight_cn_once_token_1, &__block_literal_global_75);
  return (id)logSpotlight_cn_once_object_1;
}

void __41__CNContactStore_Spotlight__logSpotlight__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "spotlight");
  v1 = (void *)logSpotlight_cn_once_object_1;
  logSpotlight_cn_once_object_1 = (uint64_t)v0;

}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isXPCDataMapperStoreForSpotlight:", self) & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "logSpotlight");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138543362;
        v21 = v4;
        v7 = "Will reindex searchable items: %{public}@";
        v8 = v5;
        v9 = 12;
LABEL_10:
        _os_log_impl(&dword_18F8BD000, v8, OS_LOG_TYPE_INFO, v7, buf, v9);
      }
    }
    else if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = "Will reindex all searchable items";
      v8 = v5;
      v9 = 2;
      goto LABEL_10;
    }

    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timestamp");
    v14 = v13;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.contactsd"), 0);
    +[CNXPCDataMapper serviceProtocolInterface](CNXPCDataMapper, "serviceProtocolInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v15);

    -[NSObject resume](v10, "resume");
    v16 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke;
    v19[3] = &unk_1E29F89E0;
    v19[4] = self;
    -[NSObject synchronousRemoteObjectProxyWithErrorHandler:](v10, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_15;
    v18[3] = &unk_1E29FA9C0;
    v18[5] = v14;
    v18[4] = self;
    objc_msgSend(v17, "reindexSearchableItemsWithIdentifiers:withReply:", v4, v18);
    -[NSObject invalidate](v10, "invalidate");

LABEL_12:
    goto LABEL_13;
  }
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "logSpotlight");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CNContactStore(Spotlight) reindexSearchableItemsWithIdentifiers:].cold.1(v10);
    goto LABEL_12;
  }
LABEL_13:

}

void __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "logSpotlight");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v5 - *(double *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "logSpotlight");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "Did reindex searchable items (%{public}@)", (uint8_t *)&v8, 0xCu);
  }

}

- (id)verifyIndexWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[5];

  if ((objc_msgSend((id)objc_opt_class(), "isXPCDataMapperStoreForSpotlight:", self) & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.contactsd"), 0);
    +[CNXPCDataMapper serviceProtocolInterface](CNXPCDataMapper, "serviceProtocolInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    objc_msgSend(v5, "resume");
    v7 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __50__CNContactStore_Spotlight__verifyIndexWithError___block_invoke;
    v26[3] = &unk_1E29F89E0;
    v26[4] = self;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__20;
    v24 = __Block_byref_object_dispose__20;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__20;
    v18 = __Block_byref_object_dispose__20;
    v19 = 0;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __50__CNContactStore_Spotlight__verifyIndexWithError___block_invoke_17;
    v13[3] = &unk_1E29FB740;
    v13[4] = &v20;
    v13[5] = &v14;
    objc_msgSend(v8, "verifyIndexWithReply:", v13);
    objc_msgSend(v5, "invalidate");
    v9 = (void *)v15[5];
    v10 = (id)v21[5];
    v11 = v10;
    if (a3 && !v10)
      *a3 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    CNSetError(a3, 1002, 0);
    v11 = 0;
  }
  return v11;
}

void __50__CNContactStore_Spotlight__verifyIndexWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "logSpotlight");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __50__CNContactStore_Spotlight__verifyIndexWithError___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (id)IsSpotlightIndexingSupported
{
  return &__block_literal_global_20_0;
}

uint64_t __57__CNContactStore_Spotlight__IsSpotlightIndexingSupported__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSpotlightIndexingSupported");
}

- (BOOL)isSpotlightIndexingSupported
{
  return objc_msgSend((id)objc_opt_class(), "isXPCDataMapperStoreForSpotlight:", self);
}

+ (BOOL)isXPCDataMapperStoreForSpotlight:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "mapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (CNiOSAddressBookDataMapper)iOSMapper
{
  return 0;
}

- (CNiOSAddressBook)addressBook
{
  void *v2;
  void *v3;

  -[CNContactStore iOSMapper](self, "iOSMapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSAddressBookDataMapper addressBook]((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNiOSAddressBook *)v3;
}

- (BOOL)setDefaultContainer:(id)a3 forAccount:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, const void *);
  void *v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__24;
  v31 = __Block_byref_object_dispose__24;
  v32 = 0;
  -[CNContactStore iOSMapper](self, "iOSMapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSAddressBookDataMapper addressBook]((uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __73__CNContactStore_iOSABUnitTesting__setDefaultContainer_forAccount_error___block_invoke;
  v22 = &unk_1E29FC338;
  v12 = v8;
  v23 = v12;
  v25 = &v33;
  v26 = &v27;
  v13 = v9;
  v24 = v13;
  objc_msgSend(v11, "performSynchronousWorkWithInvalidatedAddressBook:", &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isSuccess", v19, v20, v21, v22) & 1) != 0)
  {
    v15 = *((_BYTE *)v34 + 24) != 0;
    if (a5 && !*((_BYTE *)v34 + 24))
    {
      v15 = 0;
      *a5 = objc_retainAutorelease((id)v28[5]);
    }
  }
  else
  {
    objc_msgSend(v14, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);

    v15 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

void __73__CNContactStore_iOSABUnitTesting__setDefaultContainer_forAccount_error___block_invoke(uint64_t a1, const void *a2)
{
  void *v4;
  const __CFArray *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  CFIndex v13;
  const void *ValueAtIndex;
  const void *v15;
  void *v16;
  int v17;
  CFTypeRef v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  CFErrorRef error;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v5 = (const __CFArray *)ABAddressBookCopySourcesWithUUIDs();

  if (v5 && CFArrayGetCount(v5) == 1)
  {
    CFArrayGetValueAtIndex(v5, 0);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v31 = *(_QWORD *)(a1 + 32);
    v32 = CFSTR("CNInvalidRecords");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v11 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
    v12 = v11;
    if (!v11 || CFArrayGetCount(v11) < 1)
      goto LABEL_16;
    v13 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v12, v13);
      v15 = (const void *)ABAccountCopyInternalUUID();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFEqual(v15, v16);

      if (v15)
        CFRelease(v15);
      if (v17)
        break;
      if (++v13 >= CFArrayGetCount(v12))
        goto LABEL_16;
    }
    v18 = CFRetain(ValueAtIndex);
    if (!v18)
    {
LABEL_16:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v28 = *(_QWORD *)(a1 + 40);
      v29 = CFSTR("CNInvalidRecords");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      v18 = 0;
    }
    if (v12)
      CFRelease(v12);
  }
  else
  {
    v18 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    error = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABAddressBookSetDefaultSourceForAccount();
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABAddressBookSave(a2, &error)) == 0)
    {
      +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", error);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      if (error)
        CFRelease(error);
    }
  }
  if (v18)
    CFRelease(v18);
  if (v5)
    CFRelease(v5);
}

- (id)contactFromPerson:(void *)a3
{
  return -[CNContactStore contactFromPerson:mutable:](self, "contactFromPerson:mutable:", a3, 0);
}

- (id)contactFromPerson:(void *)a3 mutable:(BOOL)a4
{
  _BOOL8 v4;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStore contactFromPerson:keysToFetch:mutable:](self, "contactFromPerson:keysToFetch:mutable:", a3, v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)contactFromPersonID:(int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v3 = *(_QWORD *)&a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStore contactFromPersonID:keysToFetch:](self, "contactFromPersonID:keysToFetch:", v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4
{
  return +[CNContact contactFromPerson:keysToFetch:mutable:](CNContact, "contactFromPerson:keysToFetch:mutable:", a3, a4, 0);
}

- (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5
{
  return +[CNContact contactFromPerson:keysToFetch:mutable:](CNContact, "contactFromPerson:keysToFetch:mutable:", a3, a4, a5);
}

- (id)_contactFromPersonID:(int)a3 keysToFetch:(id)a4
{
  uint64_t v4;
  id v6;
  CNContactFetchRequest *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", v6);
  +[CNContact predicateForLegacyIdentifier:](CNContact, "predicateForLegacyIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFetchRequest setPredicate:](v7, "setPredicate:", v8);

  -[CNContactFetchRequest setUnifyResults:](v7, "setUnifyResults:", 0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__27;
  v18 = __Block_byref_object_dispose__27;
  v19 = 0;
  v12[4] = &v14;
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__CNContactStore_iOSABLegacyCompatibility___contactFromPersonID_keysToFetch___block_invoke;
  v12[3] = &unk_1E29F80D0;
  -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](self, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v13, v12);
  v9 = v13;
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __77__CNContactStore_iOSABLegacyCompatibility___contactFromPersonID_keysToFetch___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(_QWORD *)(v3 + 40) = 0;

    *a3 = 1;
  }
  else
  {
    v7 = objc_msgSend(a2, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)contactIdentifierFromPersonID:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = *(_QWORD *)&a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStore _contactFromPersonID:keysToFetch:](self, "_contactFromPersonID:keysToFetch:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (void)personFromContact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (objc_msgSend(v4, "hasBeenPersisted")
    && ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
  {
    -[CNContactStore iOSMapper](self, "iOSMapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isUnified");
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v4, "linkedContacts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    -[CNiOSAddressBookDataMapper addressBook]((uint64_t)v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__CNContactStore_iOSABLegacyCompatibility__personFromContact___block_invoke;
    v15[3] = &unk_1E29FD450;
    v17 = &v19;
    v16 = v10;
    v18 = v7;
    v12 = (id)objc_msgSend(v11, "performSynchronousWorkWithInvalidatedAddressBook:", v15);

    goto LABEL_8;
  }
LABEL_9:
  v13 = (void *)v20[3];
  if (!v13)
  {
    if (objc_msgSend(v4, "isUnified"))
    {
      v13 = (void *)v20[3];
    }
    else
    {
      v13 = (void *)objc_msgSend(v4, "detachedPerson");
      v20[3] = (uint64_t)v13;
    }
  }
  _Block_object_dispose(&v19, 8);

  return v13;
}

const void *__62__CNContactStore_iOSABLegacyCompatibility__personFromContact___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *result;

  v2 = (const void *)ABAddressBookCopyPersonMatchingInternalUUID();
  if (v2)
    v2 = CFAutorelease(v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;
  result = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (result && *(_BYTE *)(a1 + 48))
  {
    result = (const void *)ABPersonCreateUnifiedPerson();
    if (result)
      result = CFAutorelease(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (int)multiValueIdentifierFromLabeledValue:(id)a3
{
  return objc_msgSend(a3, "iOSLegacyIdentifier");
}

- (id)labeledValueFromMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  int v15;

  v7 = a5;
  v8 = a4;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "CNValueForContact:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__CNContactStore_iOSABLegacyCompatibility__labeledValueFromMultiValueIdentifier_contact_key___block_invoke;
  v14[3] = &__block_descriptor_36_e24_B16__0__CNLabeledValue_8l;
  v15 = a3;
  objc_msgSend(v11, "_cn_firstObjectPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __93__CNContactStore_iOSABLegacyCompatibility__labeledValueFromMultiValueIdentifier_contact_key___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iOSLegacyIdentifier") == *(_DWORD *)(a1 + 32);
}

- (id)_contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(getABSPublicABCNCompatibilityClass_0(), "contactFromPublicABPerson:keysToFetch:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_publicABPersonFromContact:(id)a3 publicAddressBook:(const void *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(getABSPublicABCNCompatibilityClass_0(), "publicABPersonFromContact:contactStore:publicAddressBook:", v6, self, a4);

  return v7;
}

- (int)_publicMultiValueIdentifierFromLabeledValue:(id)a3
{
  id v4;

  v4 = a3;
  LODWORD(self) = objc_msgSend(getABSPublicABCNCompatibilityClass_0(), "publicMultiValueIdentifierFromLabeledValue:contactStore:", v4, self);

  return (int)self;
}

- (id)_labeledValueFromPublicMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(getABSPublicABCNCompatibilityClass_0(), "labeledValueFromPublicMultiValueIdentifier:contact:key:contactStore:", v6, v9, v8, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_contactStoreForPublicAddressBook:(void *)a3
{
  if (!a3)
    return 0;
  objc_msgSend(getABSPublicABCNCompatibilityClass_0(), "contactStoreForPublicAddressBook:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)originForSuggestion:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)unifiedContactWithIdentifier:keysToFetch:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Found extra contacts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)unifiedContactWithIdentifier:keysToFetch:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error unifying contact", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)enumerateContactsWithFetchRequest:error:usingBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F8BD000, v0, v1, "This method should not be called on the main thread as it may lead to UI unresponsiveness.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Could not obtain contacts service proxy for Spotlight query, error = %@", a5, a6, a7, a8, 2u);
}

@end
