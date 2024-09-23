@implementation CNAutocompleteRecentsSearch

- (CNAutocompleteRecentsSearch)init
{
  void *v3;
  CNAutocompleteRecentsSearch *v4;

  objc_msgSend(MEMORY[0x1E0D18290], "defaultInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNAutocompleteRecentsSearch initWithCoreRecentContactsLibrary:](self, "initWithCoreRecentContactsLibrary:", v3);

  return v4;
}

- (CNAutocompleteRecentsSearch)initWithCoreRecentContactsLibrary:(id)a3
{
  id v5;
  CNAutocompleteRecentsSearch *v6;
  CNAutocompleteRecentsSearch *v7;
  CNAutocompleteRecentsSearch *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteRecentsSearch;
  v6 = -[CNAutocompleteRecentsSearch init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
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
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CNALoggingContextDebug();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = v6;
    _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %p against recent contacts", buf, 0xCu);
  }

  -[CNAutocompleteRecentsSearch library](self, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteRecentContactsLibrary library:recentContactsWithRequest:](CNAutocompleteRecentContactsLibrary, "library:recentContactsWithRequest:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke;
  v26[3] = &unk_1E70E04B8;
  v26[4] = self;
  v27 = v6;
  v12 = v6;
  objc_msgSend(v10, "flatMap:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_2;
  v24[3] = &unk_1E70DF0F8;
  v14 = v7;
  v25 = v14;
  objc_msgSend(v13, "addSuccessBlock:", v24);
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_3;
  v22[3] = &unk_1E70DF120;
  v23 = v14;
  v15 = v14;
  objc_msgSend(v13, "addFailureBlock:", v22);
  v16 = (void *)MEMORY[0x1E0D139B8];
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_4;
  v20[3] = &unk_1E70DEE90;
  v21 = v13;
  v17 = v13;
  objc_msgSend(v16, "tokenWithCancelationBlock:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "autocompleteResultsForRecentContacts:request:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)autocompleteResultsForRecentContacts:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNAutocompleteResultTokenMatcher *v12;
  void *v13;
  CNAutocompleteResultTokenMatcher *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteRecentsSearch library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteRecentContactsTransform transformForRequest:library:](CNAutocompleteRecentContactsTransform, "transformForRequest:library:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_cn_map:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_cn_filter:", *MEMORY[0x1E0D13830]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [CNAutocompleteResultTokenMatcher alloc];
  objc_msgSend(v6, "searchString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CNAutocompleteResultTokenMatcher initWithSearchString:](v12, "initWithSearchString:", v13);
  -[CNAutocompleteResultTokenMatcher filterAdapter](v14, "filterAdapter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_filter:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CRRecentContactsLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
}

@end
