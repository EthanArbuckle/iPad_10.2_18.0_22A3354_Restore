@implementation CNAutocompleteCalendarServerSearch

+ (BOOL)isSupported
{
  return -[objc_class isSupported](getEKDirectorySearchOperationClass_0(), "isSupported");
}

- (CNAutocompleteCalendarServerSearch)init
{
  void *v3;
  CNAutocompleteCalendarServerOperationFactory *v4;
  CNAutocompleteCalendarServerSearch *v5;

  v3 = (void *)objc_msgSend(objc_alloc(getEKEphemeralCacheEventStoreProviderClass()), "initWithCreationBlock:", &__block_literal_global_28);
  v4 = objc_alloc_init(CNAutocompleteCalendarServerOperationFactory);
  v5 = -[CNAutocompleteCalendarServerSearch initWithEventStoreProvider:operationFactory:](self, "initWithEventStoreProvider:operationFactory:", v3, v4);

  return v5;
}

id __42__CNAutocompleteCalendarServerSearch_init__block_invoke()
{
  return objc_alloc_init(getEKEventStoreClass_0());
}

- (CNAutocompleteCalendarServerSearch)initWithEventStoreProvider:(id)a3 operationFactory:(id)a4
{
  id v7;
  id v8;
  CNAutocompleteCalendarServerSearch *v9;
  CNAutocompleteCalendarServerSearch *v10;
  CNStringTokenizer *v11;
  CNStringTokenizer *tokenizer;
  CNAutocompleteCalendarServerSearch *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAutocompleteCalendarServerSearch;
  v9 = -[CNAutocompleteCalendarServerSearch init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v10->_operationFactory, a4);
    v11 = (CNStringTokenizer *)objc_alloc_init(MEMORY[0x1E0D13B98]);
    tokenizer = v10->_tokenizer;
    v10->_tokenizer = v11;

    v13 = v10;
  }

  return v10;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v6, "fetchContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendingAddressAccountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    CNALoggingContextDebug();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "Will not run a calendar server search because there's no sending account identifier", buf, 2u);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D68];
    v32[0] = CFSTR("Missing sending account identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CNContactAutocompleteErrorDomain"), 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v13);
    v14 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  }
  else
  {
    -[EKEphemeralCacheEventStoreProvider eventStore](self->_eventStoreProvider, "eventStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sourceWithIdentifier:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    CNALoggingContextDebug();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_impl(&dword_1B9950000, v16, OS_LOG_TYPE_DEFAULT, "Using source: %@", buf, 0xCu);
      }

      objc_msgSend(v6, "priorityDomainForSorting");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendingAddress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNAutocompleteCalendarServerSearch executeRequest:source:resultsFactory:withCompletionHandler:](self, "executeRequest:source:resultsFactory:withCompletionHandler:", v6, v13, v21, v7);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_impl(&dword_1B9950000, v16, OS_LOG_TYPE_DEFAULT, "No source found for sending account identifier %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not get a source from EventKit with account identifier: %@"), v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("CNContactAutocompleteErrorDomain"), 0, v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0, v21);
      v22 = objc_alloc_init(MEMORY[0x1E0D139B8]);
    }
    v14 = v22;

  }
  return v14;
}

- (id)executeRequest:(id)a3 source:(id)a4 resultsFactory:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  CNAutocompleteCalendarServerSearch *v50;
  id v51;
  id v52;
  _BYTE *v53;
  id v54[3];
  id location;
  _QWORD v56[4];
  id v57;
  id v58;
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v43 = a4;
  v42 = a5;
  v41 = a6;
  -[CNAutocompleteCalendarServerSearch queryForFetchRequest:](self, "queryForFetchRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextDebug();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "terms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "Using query: %@ terms: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0D13BD8]);
  -[CNAutocompleteCalendarServerSearch operationFactory](self, "operationFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke;
  v56[3] = &unk_1E70E01E0;
  v17 = v15;
  v57 = v17;
  v18 = v14;
  v58 = v18;
  objc_msgSend(v16, "eventKitDirectorySearchOperationForSource:query:resultsBlock:", v43, v11, v56);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextTriage();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "triageIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v23;
    _os_log_impl(&dword_1B9950000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calendar Servers: Will search (%lu letters)", buf, 0x16u);

  }
  CNALoggingContextTriage();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (char *)os_signpost_id_generate(v24);

  CNALoggingContextPerformance();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v27, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v25, "Searching Calendar Servers", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v60 = __Block_byref_object_copy__3;
  v61 = __Block_byref_object_dispose__3;
  v62 = 0;
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "timestamp");
  v30 = v29;

  objc_initWeak(&location, v19);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_15;
  v46[3] = &unk_1E70E0230;
  objc_copyWeak(v54, &location);
  v54[1] = v25;
  v54[2] = v30;
  v31 = v10;
  v47 = v31;
  v32 = v41;
  v52 = v32;
  v33 = v17;
  v48 = v33;
  v34 = v18;
  v53 = buf;
  v49 = v34;
  v50 = self;
  v35 = v42;
  v51 = v35;
  objc_msgSend(v19, "setCompletionBlock:", v46);
  v36 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_21;
  v44[3] = &unk_1E70DEE90;
  v37 = v19;
  v45 = v37;
  objc_msgSend(v36, "addCancelationBlock:", v44);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v38;

  objc_msgSend(v37, "start");
  objc_destroyWeak(v54);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  return v36;
}

void __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  CNRunWithLock();

}

void __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "people");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

void __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_15(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t v30[4];
  void *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  CNALoggingContextPerformance();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 96);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Searching Directory Servers", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v8 - *(double *)(a1 + 104));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__3;
    v40 = __Block_byref_object_dispose__3;
    v41 = 0;
    v28 = MEMORY[0x1E0C809B0];
    v29 = *(id *)(a1 + 48);
    CNRunWithLock();
    CNALoggingContextTriage();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "triageIdentifier", v28, 3221225472, __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_17, &unk_1E70E0208, v29, buf);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)&v19 = COERCE_DOUBLE(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"));
      v20 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
      v21 = "results";
      *(_DWORD *)v30 = 138544130;
      v31 = v18;
      v32 = 2048;
      if (v20 == 1)
        v21 = "result";
      v33 = *(double *)&v19;
      v34 = 2080;
      v35 = v21;
      v36 = 2114;
      v37 = v9;
      _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calendar Servers: Search complete (%lu %s, %{public}@)", v30, 0x2Au);

    }
    CNALoggingContextPerformance();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "timeIntervalSinceNow");
      *(_DWORD *)v30 = 138412546;
      v31 = v23;
      v32 = 2048;
      v33 = v24 * -1000.0;
      _os_log_impl(&dword_1B9950000, v22, OS_LOG_TYPE_INFO, "Time to fetch Calendar Server: %@ results, in %.3fms", v30, 0x16u);

    }
    v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
    objc_msgSend(*(id *)(a1 + 56), "resultTransformWithFactory:", *(_QWORD *)(a1 + 64));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_cn_map:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    _Block_object_dispose(buf, 8);

  }
  else
  {
    CNALoggingContextTriage();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "triageIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "error");
      v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v39 = v14;
      _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calendar Servers: Search failed (%{public}@): %{public}@", buf, 0x20u);

    }
    v15 = *(_QWORD *)(a1 + 72);
    objc_msgSend(WeakRetained, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

  }
}

void __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)queryForFetchRequest:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (Class (__cdecl *)())getEKDirectorySearchQueryClass;
  v5 = a3;
  v6 = objc_alloc_init(v4());
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[CNAutocompleteCalendarServerSearch tokenizer](self, "tokenizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tokenizeString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTerms:", v11);
  objc_msgSend(v6, "setFindGroups:", 0);
  objc_msgSend(v6, "setFindLocations:", 0);
  objc_msgSend(v6, "setFindResources:", 0);
  objc_msgSend(v6, "setFindUsers:", 1);

  return v6;
}

- (id)resultTransformWithFactory:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CNAutocompleteCalendarServerSearch_resultTransformWithFactory___block_invoke;
  aBlock[3] = &unk_1E70E0258;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

id __65__CNAutocompleteCalendarServerSearch_resultTransformWithFactory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNAutocompleteResultValue *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = objc_alloc_init(CNAutocompleteResultValue);
  v5 = *MEMORY[0x1E0D13778];
  objc_msgSend(v3, "preferredAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultValue setAddress:](v4, "setAddress:", v7);

  -[CNAutocompleteResultValue setAddressType:](v4, "setAddressType:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v3, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendarServerResultWithDisplayName:value:nameComponents:userInfo:", v10, v4, 0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CNAutocompleteCalendarServerOperationFactory)operationFactory
{
  return self->_operationFactory;
}

- (CNStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_operationFactory, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

@end
