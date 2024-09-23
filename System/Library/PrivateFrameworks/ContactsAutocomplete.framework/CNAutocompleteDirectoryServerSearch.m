@implementation CNAutocompleteDirectoryServerSearch

- (CNAutocompleteDirectoryServerSearch)init
{
  id v3;
  CNAutocompleteDirectoryServerSearch *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v4 = -[CNAutocompleteDirectoryServerSearch initWithContactStore:](self, "initWithContactStore:", v3);

  return v4;
}

- (CNAutocompleteDirectoryServerSearch)initWithContactStore:(id)a3
{
  id v5;
  CNAutocompleteDirectoryServerSearch *v6;
  CNAutocompleteDirectoryServerSearch *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteDirectoryServerSearch;
  v6 = -[CNAutocompleteDirectoryServerSearch init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactStore, a3);

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  os_signpost_id_t v27;
  uint64_t v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v11 = v10;

  CNALoggingContextTriage();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "triageIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v13;
    v31 = 2048;
    v32 = objc_msgSend(v14, "length");
    _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Directory Servers: Will search (%lu letters)", buf, 0x16u);

  }
  CNALoggingContextTriage();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_generate(v15);

  CNALoggingContextPerformance();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Searching Directory Servers", ", buf, 2u);
  }

  CNALoggingContextDebug();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v6;
    _os_log_impl(&dword_1B9950000, v19, OS_LOG_TYPE_DEFAULT, "Executing request %p against directory servers", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__CNAutocompleteDirectoryServerSearch_executeRequest_completionHandler___block_invoke;
  v24[3] = &unk_1E70DF508;
  v26 = v7;
  v27 = v16;
  v28 = v11;
  v25 = v6;
  v20 = v7;
  v21 = v6;
  -[CNAutocompleteDirectoryServerSearch fetchContactsForFetchRequest:completionHandler:](self, "fetchContactsForFetchRequest:completionHandler:", v21, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __72__CNAutocompleteDirectoryServerSearch_executeRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  CNALoggingContextPerformance();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v8, OS_SIGNPOST_INTERVAL_END, v9, "Searching Directory Servers", ", (uint8_t *)&v26, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timestamp");
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v13 - *(double *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextPerformance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = v16;
    v28 = 2114;
    v29 = (uint64_t)v14;
    _os_log_impl(&dword_1B9950000, v15, OS_LOG_TYPE_INFO, "Time to fetch %@ contacts on directory servers: %{public}@", (uint8_t *)&v26, 0x16u);

  }
  CNALoggingContextTriage();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "triageIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v19;
      v28 = 2114;
      v29 = (uint64_t)v14;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Directory Servers: Search failed (%{public}@): %{public}@", (uint8_t *)&v26, 0x20u);

    }
  }
  else
  {
    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "triageIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v5, "count");
      v22 = objc_msgSend(v5, "count");
      v23 = "results";
      v26 = 138544130;
      v28 = 2048;
      v27 = v20;
      if (v22 == 1)
        v23 = "result";
      v29 = v21;
      v30 = 2080;
      v31 = v23;
      v32 = 2114;
      v33 = v14;
      _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Directory Servers: Search complete (%lu %s, %{public}@)", (uint8_t *)&v26, 0x2Au);

    }
    CNALoggingContextDebug();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_cn_take:", 200);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v24;
      v28 = 2112;
      v29 = (uint64_t)v25;
      _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "Directory Server results (first 200 out of %@): %@", (uint8_t *)&v26, 0x16u);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)fetchContactsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  CNAutocompleteDirectoryServerSearch *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__CNAutocompleteDirectoryServerSearch_fetchContactsForFetchRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E70DF530;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performCancelableBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __86__CNAutocompleteDirectoryServerSearch_fetchContactsForFetchRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNADirectoryServerSearchTask *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CNADirectoryServerSearchTask *v11;

  v3 = a2;
  v4 = [CNADirectoryServerSearchTask alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNADirectoryServerSearchTask initWithRequest:contactStore:cancelationToken:](v4, "initWithRequest:contactStore:cancelationToken:", v5, v6, v3);

  -[CNADirectoryServerSearchTask run](v11, "run");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
