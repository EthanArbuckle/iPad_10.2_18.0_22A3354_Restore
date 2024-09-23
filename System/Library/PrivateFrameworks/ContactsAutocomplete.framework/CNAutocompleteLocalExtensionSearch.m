@implementation CNAutocompleteLocalExtensionSearch

- (CNAutocompleteLocalExtensionSearch)init
{
  void *v3;
  CNAutocompleteLocalExtensionSearch *v4;

  objc_msgSend(MEMORY[0x1E0C93E20], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNAutocompleteLocalExtensionSearch initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (CNAutocompleteLocalExtensionSearch)initWithDataStore:(id)a3
{
  id v5;
  CNAutocompleteLocalExtensionSearch *v6;
  CNAutocompleteLocalExtensionSearch *v7;
  CNAutocompleteLocalExtensionSearch *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteLocalExtensionSearch;
  v6 = -[CNAutocompleteLocalExtensionSearch init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CNALoggingContextDebug();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = v6;
    _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %p against local extensions", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v11 = v10;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__CNAutocompleteLocalExtensionSearch_executeRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E70DF4B8;
  v17 = v11;
  v16 = v7;
  v12 = v7;
  -[CNAutocompleteLocalExtensionSearch fetchContactsForFetchRequest:completionHandler:](self, "fetchContactsForFetchRequest:completionHandler:", v6, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __71__CNAutocompleteLocalExtensionSearch_executeRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D13BB0], "sharedFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  objc_msgSend(v7, "stringForTimeInterval:", v9 - *(double *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextPerformance();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v12)
    {
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_INFO, "Fetching from local extensions failed after %@. Error: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_INFO, "Time to fetch %@ contacts from local extensions: %@", (uint8_t *)&v16, 0x16u);

    }
    CNALoggingContextDebug();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_cn_take:", 200);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "Local Extensions results (first 200 out of %@): %@", (uint8_t *)&v16, 0x16u);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchContactsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  CLSDataStore *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  CLSDataStore *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  CLSDataStore *v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  if ((objc_msgSend(v8, "isCanceled") & 1) == 0)
  {
    if (objc_msgSend(v6, "shouldIncludeGroupResults"))
    {
      if (objc_msgSend(v6, "addressableGroupResultStyle") == 1)
        v9 = 51;
      else
        v9 = 19;
    }
    else
    {
      v9 = 1;
    }
    if (objc_msgSend(v6, "includeDirectoryServers"))
      v10 = 3;
    else
      v10 = 1;
    v11 = self->_dataStore;
    v12 = objc_alloc(MEMORY[0x1E0C93E30]);
    objc_msgSend(v6, "searchString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithOptions:behaviors:searchString:", v9, v10, v13);

    -[CLSDataStore _cna_objectsMatching:](self->_dataStore, "_cna_objectsMatching:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__CNAutocompleteLocalExtensionSearch_fetchContactsForFetchRequest_completionHandler___block_invoke;
    v22[3] = &unk_1E70DF4E0;
    v23 = v6;
    v24 = v11;
    v17 = v7;
    v25 = v17;
    v18 = v11;
    objc_msgSend(v15, "addSuccessBlock:", v22);
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __85__CNAutocompleteLocalExtensionSearch_fetchContactsForFetchRequest_completionHandler___block_invoke_9;
    v20[3] = &unk_1E70DF120;
    v21 = v17;
    objc_msgSend(v15, "addFailureBlock:", v20);

  }
  return v8;
}

void __85__CNAutocompleteLocalExtensionSearch_fetchContactsForFetchRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  CNAClassKitResultTransformVisitor *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNALoggingContextDebug();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Count of MAID objects: %lu", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "priorityDomainForSorting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sendingAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNAClassKitResultTransformVisitor initWithFactory:dataStore:searchType:addressableGroupResultStyle:]([CNAClassKitResultTransformVisitor alloc], "initWithFactory:dataStore:searchType:addressableGroupResultStyle:", v7, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "searchType"), objc_msgSend(*(id *)(a1 + 32), "addressableGroupResultStyle"));
  -[CNAClassKitResultTransformVisitor reduceCollection:](v8, "reduceCollection:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextDebug();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v9, "count");
    v12 = 134217984;
    v13 = v11;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "Count of converted MAID results: %lu", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __85__CNAutocompleteLocalExtensionSearch_fetchContactsForFetchRequest_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNALoggingContextDebug();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "MAID search failure: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CLSDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
