@implementation CRRecentContactsLibrary

+ (id)defaultInstance
{
  if (defaultInstance_cn_once_token_1 != -1)
    dispatch_once(&defaultInstance_cn_once_token_1, &__block_literal_global_3);
  return (id)defaultInstance_cn_once_object_1;
}

CRRecentContactsLibrary *__42__CRRecentContactsLibrary_defaultInstance__block_invoke()
{
  CRRecentContactsLibrary *result;

  result = objc_alloc_init(CRRecentContactsLibrary);
  defaultInstance_cn_once_object_1 = (uint64_t)result;
  return result;
}

- (CRRecentContactsLibrary)init
{
  CRRecentContactsLibrary *v2;
  const char *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRRecentContactsLibrary;
  v2 = -[CRRecentContactsLibrary init](&v5, sel_init);
  if (v2)
  {
    v3 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.corerecents.%@.%p"), objc_opt_class(), v2), "UTF8String");
    v2->_replyQueue = (OS_dispatch_queue *)dispatch_queue_create(v3, MEMORY[0x1E0C80D50]);
    -[CRRecentContactsLibrary start](v2, "start");
  }
  return v2;
}

- (void)start
{
  __assert_rtn("-[CRRecentContactsLibrary start]", "CRRecentContactsLibrary.m", 170, "_connection == NULL && \"attempt to start connection multiple times.\");
}

- (id)_newConnection
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corerecents.recentsd"), 4096);
}

- (void)performRecentsSearch:(id)a3 queue:(id)a4 completion:(id)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__CRRecentContactsLibrary_performRecentsSearch_queue_completion___block_invoke;
  v5[3] = &unk_1E4D32760;
  v5[4] = a4;
  v5[5] = a5;
  -[CRRecentContactsLibrary _searchRecentsUsingQuery:completion:](self, "_searchRecentsUsingQuery:completion:", a3, v5);
}

- (void)_searchRecentsUsingQuery:(id)a3 completion:(id)a4
{
  uint64_t v7;
  OS_os_log *v8;
  OS_os_log *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[7];
  _QWORD v14[7];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_searchRecentsUsingQuery_completion__cn_once_token_7 != -1)
    dispatch_once(&_searchRecentsUsingQuery_completion__cn_once_token_7, &__block_literal_global_54);
  v7 = objc_msgSend((id)_searchRecentsUsingQuery_completion__cn_once_object_7, "nextUnsignedInteger");
  v8 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v7;
    _os_log_impl(&dword_1A4942000, (os_log_t)v8, OS_LOG_TYPE_INFO, "Will execute query #%lu", buf, 0xCu);
  }
  if (os_variant_has_internal_diagnostics())
  {
    v9 = +[CRLogging client](CRLogging, "client");
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(a3, "predicate");
      *(_DWORD *)buf = 134218242;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A4942000, (os_log_t)v9, OS_LOG_TYPE_INFO, "Query #%lu predicate: %@", buf, 0x16u);
    }
  }
  v11 = -[CRRecentContactsLibrary _searchRecentsUsingQuery:](self, "_searchRecentsUsingQuery:", a3);
  v12 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_57;
  v14[3] = &unk_1E4D32698;
  v14[5] = a4;
  v14[6] = v7;
  v14[4] = self;
  objc_msgSend(v11, "addSuccessBlock:", v14);
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_60;
  v13[3] = &unk_1E4D326C0;
  v13[5] = a4;
  v13[6] = v7;
  v13[4] = self;
  objc_msgSend(v11, "addFailureBlock:", v13);
}

- (id)_searchRecentsUsingQuery:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  OS_os_log *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "uuid");
  v6 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke;
  v27[3] = &unk_1E4D326E8;
  v27[4] = v5;
  v27[5] = v6;
  v8 = -[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", v27);
  v9 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = objc_msgSend(a3, "weightDecayer");
  v11 = objc_msgSend(a3, "comparator");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider"), "timestamp");
  v13 = v12;
  v14 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v5;
    _os_log_impl(&dword_1A4942000, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Will execute query %{public}@", buf, 0xCu);
  }
  v17 = v7;
  v15 = &__block_literal_global_170;
  v18 = 3221225472;
  v19 = __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke_66;
  v20 = &unk_1E4D32710;
  if (v10)
    v15 = (void *)v10;
  v24 = v15;
  v25 = v11;
  v26 = v13;
  v21 = v9;
  v22 = v5;
  v23 = v6;
  objc_msgSend(v8, "searchRecentsUsingQuery:completion:", a3, &v17);
  return (id)objc_msgSend(v6, "future", v17, v18, v19, v20);
}

- (id)_remoteLibraryWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a3);
}

void __65__CRRecentContactsLibrary_performRecentsSearch_queue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];

  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__CRRecentContactsLibrary_performRecentsSearch_queue_completion___block_invoke_2;
    block[3] = &unk_1E4D32738;
    v5 = *(_QWORD *)(a1 + 40);
    block[5] = a3;
    block[6] = v5;
    block[4] = a2;
    dispatch_async(v4, block);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

id __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0D13988]);
  _searchRecentsUsingQuery_completion__cn_once_object_7 = (uint64_t)result;
  return result;
}

+ (id)_recentEventForGroupMembers:(id)a3 displayName:(id)a4 date:(id)a5 weight:(id)a6 metadata:(id)a7 options:(unint64_t)a8
{
  id v16;
  void *v17;
  void *v18;

  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRRecentContactsLibrary.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupMembers"));
    if (a5)
      goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRRecentContactsLibrary.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));
LABEL_3:
  if (!objc_msgSend(a3, "count"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRRecentContactsLibrary.m"), 65, CFSTR("Must specify at least one group member per event."));
  v16 = objc_alloc(MEMORY[0x1E0C99E08]);
  v17 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", a3, CFSTR("members"), a5, CFSTR("timestamp"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8), CFSTR("options"), 0);
  v18 = v17;
  if (a4)
    objc_msgSend(v17, "setObject:forKey:", a4, CFSTR("displayName"));
  if (a7)
    objc_msgSend(v18, "setObject:forKey:", a7, CFSTR("metadata"));
  if (a6)
    objc_msgSend(v18, "setObject:forKey:", a6, CFSTR("weight"));
  return v18;
}

+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6
{
  return (id)objc_msgSend(a1, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", a3, a4, a5, a6, 0, 0, 0);
}

+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 metadata:(id)a7
{
  return (id)objc_msgSend(a1, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", a3, a4, a5, a6, 0, a7, 0);
}

+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 weight:(id)a7 metadata:(id)a8
{
  return (id)objc_msgSend(a1, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", a3, a4, a5, a6, a7, a8, 0);
}

+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 weight:(id)a7 metadata:(id)a8 options:(unint64_t)a9
{
  id v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v15 = a4;
    if (objc_msgSend(a4, "caseInsensitiveCompare:", a3))
      a4 = v15;
    else
      a4 = 0;
  }
  v17[0] = objc_msgSend(a1, "groupMemberWithAddress:displayName:kind:", a3, a4, a5);
  return (id)objc_msgSend(a1, "_recentEventForGroupMembers:displayName:date:weight:metadata:options:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1), 0, a6, a7, a8, a9);
}

+ (id)explicitGroupEventForGroupMembers:(id)a3 displayName:(id)a4 date:(id)a5 metadata:(id)a6 options:(unint64_t)a7
{
  return (id)objc_msgSend(a1, "_recentEventForGroupMembers:displayName:date:weight:metadata:options:", a3, a4, a5, 0, a6, a7 | 0x100000);
}

+ (id)groupMemberWithAddress:(id)a3 displayName:(id)a4 kind:(id)a5
{
  void *v10;

  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRRecentContactsLibrary.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("address"));
    if (a5)
      goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRRecentContactsLibrary.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));
LABEL_3:
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, CFSTR("address"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a5, CFSTR("kind"));
  if (a4)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", a4, CFSTR("displayName"));
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)CRRecentContactsLibrary;
  -[CRRecentContactsLibrary dealloc](&v3, sel_dealloc);
}

- (unint64_t)maxDateEventsPerRecentContact
{
  return 5;
}

void __32__CRRecentContactsLibrary_start__block_invoke()
{
  OS_os_log *v0;
  uint8_t v1[16];

  v0 = +[CRLogging log](CRLogging, "log");
  if (os_log_type_enabled((os_log_t)v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4942000, (os_log_t)v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }
}

void __32__CRRecentContactsLibrary_start__block_invoke_51(uint64_t a1)
{
  OS_os_log *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = +[CRLogging log](CRLogging, "log");
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A4942000, (os_log_t)v2, OS_LOG_TYPE_DEFAULT, "Mach service '%{public}@' not found.", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)frecencyComparator
{
  return +[CRSearchQuery frecencyComparator](CRSearchQuery, "frecencyComparator");
}

+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5
{
  return +[CRSearchQuery frecencyComparatorForSearch:preferredKinds:sendingAddress:queryOptions:](CRSearchQuery, "frecencyComparatorForSearch:preferredKinds:sendingAddress:queryOptions:", a3, a4, a5, 0);
}

+ (id)rankedFrecencyComparatorWithPreferredSources:(id)a3
{
  return +[CRSearchQuery rankedFrecencyComparatorWithPreferredSources:](CRSearchQuery, "rankedFrecencyComparatorWithPreferredSources:", a3);
}

+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 queryOptions:(unint64_t)a6
{
  return +[CRSearchQuery frecencyComparatorForSearch:preferredKinds:sendingAddress:queryOptions:](CRSearchQuery, "frecencyComparatorForSearch:preferredKinds:sendingAddress:queryOptions:", a3, a4, a5, a6);
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_57(_QWORD *a1, uint64_t a2)
{
  OS_os_log *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[6];
    *(_DWORD *)buf = 134217984;
    v11 = v5;
    _os_log_impl(&dword_1A4942000, (os_log_t)v4, OS_LOG_TYPE_INFO, "Result for query #%lu received; preparing reply",
      buf,
      0xCu);
  }
  v6 = a1[5];
  v7 = *(NSObject **)(a1[4] + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_58;
  block[3] = &unk_1E4D32670;
  block[1] = 3221225472;
  v8 = a1[6];
  block[5] = v6;
  block[6] = v8;
  block[4] = a2;
  dispatch_async(v7, block);
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_58(uint64_t a1)
{
  OS_os_log *v2;
  uint64_t v3;
  OS_os_log *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1A4942000, (os_log_t)v2, OS_LOG_TYPE_INFO, "Calling completion handler for query #%lu", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = 134217984;
    v7 = v5;
    _os_log_impl(&dword_1A4942000, (os_log_t)v4, OS_LOG_TYPE_INFO, "Did execute query #%lu", (uint8_t *)&v6, 0xCu);
  }
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_60(_QWORD *a1, uint64_t a2)
{
  OS_os_log *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[7];

  v4 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_60_cold_1((uint64_t)a1, v4, v5, v6, v7, v8, v9, v10);
  v11 = a1[5];
  v12 = *(NSObject **)(a1[4] + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_61;
  block[3] = &unk_1E4D32670;
  block[1] = 3221225472;
  v13 = a1[6];
  block[5] = v11;
  block[6] = v13;
  block[4] = a2;
  dispatch_async(v12, block);
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_61(uint64_t a1)
{
  OS_os_log *v2;
  uint64_t v3;
  OS_os_log *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1A4942000, (os_log_t)v2, OS_LOG_TYPE_INFO, "Calling completion handler for query #%lu", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = 134217984;
    v7 = v5;
    _os_log_impl(&dword_1A4942000, (os_log_t)v4, OS_LOG_TYPE_INFO, "Did execute query #%lu", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_searchRecentsUsingQuery:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend((id)objc_msgSend(-[CRRecentContactsLibrary _searchRecentsUsingQuery:](self, "_searchRecentsUsingQuery:", a3), "recover:", &__block_literal_global_167), "resultWithTimeout:error:", a4, 5.0);
}

uint64_t __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  OS_os_log *v4;

  v4 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke_cold_1(a1, a2, (os_log_t)v4);
  return objc_msgSend(*(id *)(a1 + 40), "finishWithError:", a2);
}

void __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke_66(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  OS_os_log *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v7)
    {
      v8 = v7;
      v17 = a3;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(a2);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "weight");
          if (v12)
          {
            (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), objc_msgSend(v11, "mostRecentDate"), v12);
            objc_msgSend(v11, "setDecayedWeight:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"));
          }
          objc_msgSend(v6, "cr_insertObject:usingComparator:", v11, *(_QWORD *)(a1 + 64));
        }
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v8);
      a3 = v17;
    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider"), "timestamp");
  v14 = objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v13 - *(double *)(a1 + 72));
  v15 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_1A4942000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Did execute query %{public}@ (%{public}@)", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:error:", v6, a3);

}

- (void)requestRecentsUsingPredicate:(id)a3 inDomains:(id)a4 comparator:(id)a5 queue:(id)a6 completion:(id)a7
{
  CRSearchQuery *v13;

  v13 = objc_alloc_init(CRSearchQuery);
  -[CRSearchQuery setPredicate:](v13, "setPredicate:", a3);
  -[CRSearchQuery setDomains:](v13, "setDomains:", a4);
  -[CRSearchQuery setComparator:](v13, "setComparator:", a5);
  -[CRRecentContactsLibrary performRecentsSearch:queue:completion:](self, "performRecentsSearch:queue:completion:", v13, a6, a7);

}

uint64_t __65__CRRecentContactsLibrary_performRecentsSearch_queue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performRecentsSearch:(id)a3 operationQueue:(id)a4 completion:(id)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__CRRecentContactsLibrary_performRecentsSearch_operationQueue_completion___block_invoke;
  v5[3] = &unk_1E4D32760;
  v5[4] = a4;
  v5[5] = a5;
  -[CRRecentContactsLibrary _searchRecentsUsingQuery:completion:](self, "_searchRecentsUsingQuery:completion:", a3, v5);
}

uint64_t __74__CRRecentContactsLibrary_performRecentsSearch_operationQueue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  _QWORD v7[7];

  v4 = *(void **)(a1 + 32);
  if (!v4)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__CRRecentContactsLibrary_performRecentsSearch_operationQueue_completion___block_invoke_2;
  v7[3] = &unk_1E4D32738;
  v5 = *(_QWORD *)(a1 + 40);
  v7[5] = a3;
  v7[6] = v5;
  v7[4] = a2;
  return objc_msgSend(v4, "addOperationWithBlock:", v7);
}

uint64_t __74__CRRecentContactsLibrary_performRecentsSearch_operationQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)copyOrderedRecentsForSearchText:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 kinds:(id)a6
{
  return -[CRRecentContactsLibrary _searchRecentsUsingQuery:error:](self, "_searchRecentsUsingQuery:error:", +[CRSearchQuery searchQueryForSearchTerm:preferredKinds:sendingAddress:recentsDomain:](CRSearchQuery, "searchQueryForSearchTerm:preferredKinds:sendingAddress:recentsDomain:", a3, a6, a5, a4), 0);
}

- (id)copyRecentsForDomain:(id)a3
{
  CRSearchQuery *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(CRSearchQuery);
  v7[0] = a3;
  -[CRSearchQuery setDomains:](v5, "setDomains:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  return -[CRRecentContactsLibrary _searchRecentsUsingQuery:error:](self, "_searchRecentsUsingQuery:error:", v5, 0);
}

- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5
{
  -[CRRecentContactsLibrary recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:](self, "recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:", a3, a4, a5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), 0);
}

- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 userInitiated:(BOOL)a6
{
  -[CRRecentContactsLibrary recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:](self, "recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:", a3, a4, a5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), a6);
}

- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 source:(id)a6 userInitiated:(BOOL)a7
{
  -[CRRecentContactsLibrary _recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:completion:](self, "_recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:completion:", a3, a4, a5, a6, a7, 0);
}

- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 completion:(id)a6
{
  -[CRRecentContactsLibrary _recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:completion:](self, "_recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:completion:", a3, a4, a5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), 0, a6);
}

- (void)_recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 source:(id)a6 userInitiated:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  OS_os_log *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  OS_os_log *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v9 = a7;
  v43 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v29 = a8;
    v30 = a4;
    v31 = a5;
    v15 = +[CRLogging client](CRLogging, "client");
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(a3, "count");
      v17 = objc_msgSend(a3, "count");
      v18 = "events";
      if (v17 == 1)
        v18 = "event";
      *(_DWORD *)buf = 134218242;
      v40 = v16;
      v41 = 2080;
      v42 = v18;
      _os_log_impl(&dword_1A4942000, (os_log_t)v15, OS_LOG_TYPE_INFO, "Recording %lu %s", buf, 0x16u);
    }
    v32 = a6;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(a3);
          v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v22);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v9)
              goto LABEL_15;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRRecentContactsLibrary.m"), 472, CFSTR("CRRecentContactsLibrary: recent events must be CRRecentEvent instances."));
            if (!v9)
              goto LABEL_15;
          }
          v24 = (void *)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("options"));
          if (v24)
            objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "unsignedIntegerValue") | 1), CFSTR("options"));
LABEL_15:
          if (os_variant_has_internal_diagnostics())
          {
            v25 = +[CRLogging client](CRLogging, "client");
            if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
            {
              v26 = objc_msgSend((id)objc_opt_class(), "apiLogDescriptionOfEvent:", v23);
              *(_DWORD *)buf = 138412290;
              v40 = v26;
              _os_log_impl(&dword_1A4942000, (os_log_t)v25, OS_LOG_TYPE_INFO, "Recording event: %@", buf, 0xCu);
            }
          }
          ++v22;
        }
        while (v20 != v22);
        v27 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v20 = v27;
      }
      while (v27);
    }
    if (v29)
      v28 = v29;
    else
      v28 = &__block_literal_global_76;
    objc_msgSend(-[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", 0), "recordContactEvents:domain:sendingAddress:source:completion:", a3, v30, v31, v32, v28);
  }
}

+ (id)apiLogDescriptionOfEvent:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("members")), "_cn_compactMap:", &__block_literal_global_78), "componentsJoinedByString:", CFSTR(", "));
}

uint64_t __52__CRRecentContactsLibrary_apiLogDescriptionOfEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("displayName"));
  v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("address"));
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v3, v4);
}

- (BOOL)_removeRecentContactsWithRecentIDs:(id)a3 syncKeys:(id)a4 recentsDomain:(id)a5 error:(id *)a6
{
  OS_os_log *v11;
  id v12;
  OS_os_log *v13;
  BOOL result;
  uint64_t v15;
  void *v16;
  OS_os_log *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134218242;
    v25 = objc_msgSend(a3, "count");
    v26 = 2114;
    v27 = a5;
    _os_log_impl(&dword_1A4942000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Will remove %lu recents from %{public}@ domain", (uint8_t *)&v24, 0x16u);
  }
  if (objc_msgSend(a3, "count"))
  {
    v12 = -[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", 0);
    if (v12)
    {
      objc_msgSend(v12, "removeRecentContactsWithRecentIDs:syncKeys:domain:", a3, a4, a5);
      v13 = +[CRLogging client](CRLogging, "client");
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1A4942000, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Did remove recents", (uint8_t *)&v24, 2u);
      }
      return 1;
    }
    v15 = 2;
  }
  else
  {
    v15 = 9999;
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CRRecentContactsErrorDomain"), v15, 0);
  v17 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    -[CRRecentContactsLibrary _removeRecentContactsWithRecentIDs:syncKeys:recentsDomain:error:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
  result = 0;
  if (a6)
    *a6 = v16;
  return result;
}

- (BOOL)removeRecentContactsWithRecentIDs:(id)a3 recentsDomain:(id)a4 error:(id *)a5
{
  return -[CRRecentContactsLibrary _removeRecentContactsWithRecentIDs:syncKeys:recentsDomain:error:](self, "_removeRecentContactsWithRecentIDs:syncKeys:recentsDomain:error:", a3, 0, a4, a5);
}

- (BOOL)removeRecentContacts:(id)a3 error:(id *)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "cr_map:", sCRRecentRecentIdentifier);
  return -[CRRecentContactsLibrary _removeRecentContactsWithRecentIDs:syncKeys:recentsDomain:error:](self, "_removeRecentContactsWithRecentIDs:syncKeys:recentsDomain:error:", v7, objc_msgSend(a3, "cr_map:", sCRRecentSyncKeyDict), objc_msgSend((id)objc_msgSend(a3, "firstObject"), "recentsDomain"), a4);
}

- (void)_removeAllRecentContactsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  v6 = (void *)objc_msgSend(v5, "future");
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__CRRecentContactsLibrary__removeAllRecentContactsWithCompletion___block_invoke;
  v10[3] = &unk_1E4D32808;
  v10[4] = a3;
  objc_msgSend(v6, "addSuccessBlock:", v10);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __66__CRRecentContactsLibrary__removeAllRecentContactsWithCompletion___block_invoke_2;
  v9[3] = &unk_1E4D32830;
  v9[4] = a3;
  objc_msgSend((id)objc_msgSend(v5, "future"), "addFailureBlock:", v9);
  v8 = -[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter"));
  if (v8)
    objc_msgSend(v8, "removeAllRecentContactsWithCompletion:", objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter"));
}

uint64_t __66__CRRecentContactsLibrary__removeAllRecentContactsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__CRRecentContactsLibrary__removeAllRecentContactsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_removeRecentContactsMatchingQuery:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v5 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  v6 = -[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter"));
  v7 = -[CRRecentContactsLibrary _searchRecentsUsingQuery:](self, "_searchRecentsUsingQuery:", a3);
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke;
  v11[3] = &unk_1E4D328C0;
  v11[4] = v6;
  v11[5] = v5;
  objc_msgSend(v7, "addSuccessBlock:", v11);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_4;
  v10[3] = &unk_1E4D328E8;
  v10[4] = v5;
  objc_msgSend(v7, "addFailureBlock:", v10);
  return (id)objc_msgSend(v5, "future");
}

void __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend(a2, "_cn_groupBy:", &__block_literal_global_86);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_3;
  v4[3] = &unk_1E4D32898;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = &v5;
  objc_msgSend(v3, "_cn_each:", v4);
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6[3]));
  _Block_object_dispose(&v5, 8);
}

uint64_t __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recentsDomain");
}

uint64_t __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  uint64_t result;

  v6 = (void *)objc_msgSend(a3, "cr_map:", sCRRecentRecentIdentifier);
  objc_msgSend(*(id *)(a1 + 32), "removeRecentContactsWithRecentIDs:syncKeys:domain:", v6, objc_msgSend(a3, "cr_map:", sCRRecentSyncKeyDict), a2);
  result = objc_msgSend(v6, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)restorePreviouslyDeletedRecentContacts:(id)a3
{
  id v5;
  OS_os_log *v6;
  void *v7;
  OS_os_log *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  v6 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1A4942000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Will restore %lu recents which were previously deleted", (uint8_t *)&v10, 0xCu);
  }
  if (objc_msgSend(a3, "count"))
  {
    objc_msgSend(-[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter")), "restorePreviouslyDeletedRecentContacts:completion:", a3, objc_msgSend(v5, "completionHandlerAdapter"));
    v7 = (void *)objc_msgSend(v5, "future");
    objc_msgSend(v7, "addSuccessBlock:", &__block_literal_global_89);
    objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_91);
  }
  else
  {
    v8 = +[CRLogging client](CRLogging, "client");
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A4942000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Did not need to restore 0 recents", (uint8_t *)&v10, 2u);
    }
    return (id)objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
  }
  return v7;
}

void __66__CRRecentContactsLibrary_restorePreviouslyDeletedRecentContacts___block_invoke()
{
  OS_os_log *v0;
  uint8_t v1[16];

  v0 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4942000, (os_log_t)v0, OS_LOG_TYPE_DEFAULT, "Did restore recents", v1, 2u);
  }
}

void __66__CRRecentContactsLibrary_restorePreviouslyDeletedRecentContacts___block_invoke_90(uint64_t a1, uint64_t a2)
{
  OS_os_log *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = +[CRLogging client](CRLogging, "client");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    __66__CRRecentContactsLibrary_restorePreviouslyDeletedRecentContacts___block_invoke_90_cold_1(a2, v3, v4, v5, v6, v7, v8, v9);
}

- (int)_daemonProcessID
{
  return -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_60_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4942000, a2, a3, "Error for query #%lu received; preparing reply", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1A4942000, log, OS_LOG_TYPE_ERROR, "Query %{public}@ failed: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_removeRecentContactsWithRecentIDs:(uint64_t)a3 syncKeys:(uint64_t)a4 recentsDomain:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4942000, a2, a3, "Could not remove recents: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __66__CRRecentContactsLibrary_restorePreviouslyDeletedRecentContacts___block_invoke_90_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4942000, a2, a3, "Error restoring recents: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
