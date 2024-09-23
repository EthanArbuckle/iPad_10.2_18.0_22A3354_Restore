@implementation FPSearchQueryEnumerator

- (FPSearchQueryEnumerator)initWithSearchQuery:(id)a3 mountPoint:(id)a4
{
  id v7;
  id v8;
  FPSearchQueryEnumerator *v9;
  NSObject *v10;
  uint64_t v11;
  NSString *mountPoint;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPSearchQueryEnumerator;
  v9 = -[FPSearchQueryEnumerator init](&v14, sel_init);
  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[FPSearchQueryEnumerator initWithSearchQuery:mountPoint:].cold.1((uint64_t)v9, (uint64_t)v8, v10);

    objc_storeStrong((id *)&v9->_fileProviderSearchQuery, a3);
    v11 = objc_msgSend(v8, "copy");
    mountPoint = v9->_mountPoint;
    v9->_mountPoint = (NSString *)v11;

  }
  return v9;
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FPSearchQueryEnumerator enumerateItemsForObserver:startingAtPage:].cold.1(v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke;
  v8[3] = &unk_1E444FE70;
  v9 = v5;
  v7 = v5;
  -[FPSearchQueryEnumerator _gatherItemsWithCompletionBlock:](self, "_gatherItemsWithCompletionBlock:", v8);

}

void __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_cold_2(v6, v8);

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB3388];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1004, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "finishEnumeratingWithError:", v11);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_cold_1(v5, v8);

    objc_msgSend(*(id *)(a1 + 32), "didEnumerateItems:", v5);
    objc_msgSend(*(id *)(a1 + 32), "finishEnumeratingUpToPage:", 0);
  }

}

- (void)invalidate
{
  CSSearchQuery *searchQuery;
  CSSearchQuery *v4;

  searchQuery = self->_searchQuery;
  if (searchQuery)
  {
    -[CSSearchQuery cancel](searchQuery, "cancel");
    v4 = self->_searchQuery;
    self->_searchQuery = 0;

  }
}

- (void)_gatherItemsWithCompletionBlock:(id)a3
{
  id v4;
  CSSearchQuery *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  CSSearchQuery *searchQuery;
  CSSearchQuery *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v4 = a3;
  -[FPSearchQueryEnumerator _createSearchQuery](self, "_createSearchQuery");
  v5 = (CSSearchQuery *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  location = 0;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__FPSearchQueryEnumerator__gatherItemsWithCompletionBlock___block_invoke;
  v17[3] = &unk_1E444FE98;
  v8 = v6;
  v18 = v8;
  -[CSSearchQuery setFoundItemsHandler:](v5, "setFoundItemsHandler:", v17);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __59__FPSearchQueryEnumerator__gatherItemsWithCompletionBlock___block_invoke_2;
  v13[3] = &unk_1E444FEC0;
  objc_copyWeak(&v16, &location);
  v9 = v4;
  v15 = v9;
  v10 = v8;
  v14 = v10;
  -[CSSearchQuery setCompletionHandler:](v5, "setCompletionHandler:", v13);
  -[CSSearchQuery start](v5, "start");
  searchQuery = self->_searchQuery;
  self->_searchQuery = v5;
  v12 = v5;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __59__FPSearchQueryEnumerator__gatherItemsWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __59__FPSearchQueryEnumerator__gatherItemsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v4, "_fpItemsFromSearchableItems:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (WeakRetained)
    {
      v6 = (void *)WeakRetained[3];
      WeakRetained[3] = 0;

    }
  }

}

- (id)_createSearchQuery
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  Class (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v5 = (void *)getCSSearchQueryContextClass_softClass_1;
  v39 = getCSSearchQueryContextClass_softClass_1;
  if (!getCSSearchQueryContextClass_softClass_1)
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __getCSSearchQueryContextClass_block_invoke_1;
    v34 = &unk_1E444B188;
    v35 = &v36;
    __getCSSearchQueryContextClass_block_invoke_1((uint64_t)&v31);
    v5 = (void *)v37[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v36, 8);
  v7 = (void *)objc_opt_new();
  FPDefaultFetchedAttributes();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchAttributes:", v8);

  v9 = (void *)objc_opt_new();
  if (self->_mountPoint)
  {
    v42[0] = self->_mountPoint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMountPoints:", v10);

  }
  v41 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  FPFileProviderOriginatedItemsQueryStringFragment((void *)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v12);
  -[NSFileProviderSearchQuery filename](self->_fileProviderSearchQuery, "filename");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = v13 == 0;

  if ((v11 & 1) == 0)
  {
    -[NSFileProviderSearchQuery filename](self->_fileProviderSearchQuery, "filename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderSearchQuery keyboardLanguage](self->_fileProviderSearchQuery, "keyboardLanguage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FPSpotlightQueryStringForFilename(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v16);
  }
  -[NSFileProviderSearchQuery allowedContentTypes](self->_fileProviderSearchQuery, "allowedContentTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FPContentTypeQueryStringForFileTypes(v18, MEMORY[0x1E0C9AA60]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v19);
  -[NSFileProviderSearchQuery csQueryScopes](self->_fileProviderSearchQuery, "csQueryScopes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScopes:", v20);

  if (-[NSFileProviderSearchQuery trashedItemsMembership](self->_fileProviderSearchQuery, "trashedItemsMembership"))
  {
    FPIsTrashedQueryStringFragment(-[NSFileProviderSearchQuery trashedItemsMembership](self->_fileProviderSearchQuery, "trashedItemsMembership") == 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v21);

  }
  -[NSFileProviderSearchQuery scopeFragment](self->_fileProviderSearchQuery, "scopeFragment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
  {
    -[NSFileProviderSearchQuery scopeFragment](self->_fileProviderSearchQuery, "scopeFragment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v24);

  }
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" && "));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v26 = (void *)getCSSearchQueryClass_softClass_1;
  v39 = getCSSearchQueryClass_softClass_1;
  if (!getCSSearchQueryClass_softClass_1)
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __getCSSearchQueryClass_block_invoke_1;
    v34 = &unk_1E444B188;
    v35 = &v36;
    __getCSSearchQueryClass_block_invoke_1((uint64_t)&v31);
    v26 = (void *)v37[3];
  }
  v27 = objc_retainAutorelease(v26);
  _Block_object_dispose(&v36, 8);
  v28 = (void *)objc_msgSend([v27 alloc], "initWithQueryString:context:", v25, v7);
  v40 = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProtectionClasses:", v29);

  return v28;
}

- (id)_fpItemsFromSearchableItems:(id)a3
{
  return (id)objc_msgSend(a3, "fp_map:", &__block_literal_global_61);
}

FPItem *__55__FPSearchQueryEnumerator__fpItemsFromSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FPItem *v3;
  NSObject *v4;

  v2 = a2;
  v3 = -[FPItem initWithSearchableItem:]([FPItem alloc], "initWithSearchableItem:", v2);
  if (!v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__FPSearchQueryEnumerator__fpItemsFromSearchableItems___block_invoke_cold_1();

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);
  objc_storeStrong((id *)&self->_fileProviderSearchQuery, 0);
}

- (void)initWithSearchQuery:(NSObject *)a3 mountPoint:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] New %@ for mount point: %@", v7, 0x16u);

}

- (void)enumerateItemsForObserver:(os_log_t)log startingAtPage:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Enumerating items ...", v1, 2u);
}

void __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully enumerated %ld items", v3, 0xCu);
  OUTLINED_FUNCTION_6_1();
}

void __68__FPSearchQueryEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Error occurred while enumerating items: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __55__FPSearchQueryEnumerator__fpItemsFromSearchableItems___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Unable to transform searchable item to FileProvider item: %@", v2);
}

@end
