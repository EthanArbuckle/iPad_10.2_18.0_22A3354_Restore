@implementation CNUICoreRecentsManager

- (CNUICoreRecentsManager)initWithRecentsLibrary:(id)a3 schedulerProvider:(id)a4
{
  id v7;
  id v8;
  CNUICoreRecentsManager *v9;
  CNUICoreRecentsManager *v10;
  uint64_t v11;
  CNScheduler *workQueue;
  CNUICoreRecentsManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUICoreRecentsManager;
  v9 = -[CNUICoreRecentsManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recentsLibrary, a3);
    objc_msgSend(v8, "backgroundScheduler");
    v11 = objc_claimAutoreleasedReturnValue();
    workQueue = v10->_workQueue;
    v10->_workQueue = (CNScheduler *)v11;

    v13 = v10;
  }

  return v10;
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(a1, "supportedPropertyDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNUICoreRecentsManager descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNKeyDescriptor *)v6;
}

- (CNUICoreRecentsManager)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CNUICoreRecentsManager *v7;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coreRecentsLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNUICoreRecentsManager initWithRecentsLibrary:schedulerProvider:](self, "initWithRecentsLibrary:schedulerProvider:", v4, v6);
  return v7;
}

- (id)recentContactsMatchingAllPropertiesOfContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "areKeysAvailable:", v6) & 1) == 0)
    -[CNUICoreRecentsManager recentContactsMatchingAllPropertiesOfContact:].cold.2();

  objc_msgSend((id)objc_opt_class(), "allHandlesToSearchForFromContact:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CNUICoreRecentsManager recentContactsMatchingAllPropertiesOfContact:].cold.1();

    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreRecentsManager recentsContactsMatchingHandles:](self, "recentsContactsMatchingHandles:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)sortedRecentHandlesMatchingAllPropertiesOfContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "areKeysAvailable:", v6) & 1) == 0)
    -[CNUICoreRecentsManager sortedRecentHandlesMatchingAllPropertiesOfContact:].cold.2();

  objc_msgSend((id)objc_opt_class(), "allHandlesToSearchForFromContact:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CNUICoreRecentsManager recentContactsMatchingAllPropertiesOfContact:].cold.1();

    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreRecentsManager recentsContactsMatchingHandles:sorted:](self, "recentsContactsMatchingHandles:sorted:", v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "flatMap:", &__block_literal_global_12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id __76__CNUICoreRecentsManager_sortedRecentHandlesMatchingAllPropertiesOfContact___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "_cn_map:", &__block_literal_global_14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __76__CNUICoreRecentsManager_sortedRecentHandlesMatchingAllPropertiesOfContact___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "address");
}

+ (id)allHandlesToSearchForFromContact:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "supportedPropertyDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__CNUICoreRecentsManager_allHandlesToSearchForFromContact___block_invoke;
  v9[3] = &unk_1EA603EE8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "_cn_flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __59__CNUICoreRecentsManager_allHandlesToSearchForFromContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "CNValueForContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "transformForPropertyDescription:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_cn_flatMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)recentContactsMatchingContactProperties:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "handlesForContactProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CNUICoreRecentsManager recentContactsMatchingContactProperties:].cold.1();

    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreRecentsManager recentsContactsMatchingHandles:](self, "recentsContactsMatchingHandles:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)handlesForContactProperties:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_17_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");
  v8 = MEMORY[0x1E0C809B0];
  if (v6 != v7)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_2;
      v16[3] = &unk_1EA603F30;
      v17 = v5;
      objc_msgSend(v4, "_cn_filter:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_debug_impl(&dword_1DD140000, v9, OS_LOG_TYPE_DEBUG, "Detected invalid properties passed in, are you sure you meant to do this? %@", buf, 0xCu);

    }
  }
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_19;
  v15[3] = &__block_descriptor_40_e27_B16__0__CNContactProperty_8l;
  v15[4] = a1;
  objc_msgSend(v5, "_cn_filter:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_2_20;
  v14[3] = &__block_descriptor_40_e36___NSArray_16__0__CNContactProperty_8l;
  v14[4] = a1;
  objc_msgSend(v10, "_cn_flatMap:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C971A0], "contactPropertiesByKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v2, "labeledValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_19(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "supportedPropertyDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C971A0], "contactPropertiesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containsObject:", v7);

  return v8;
}

id __54__CNUICoreRecentsManager_handlesForContactProperties___block_invoke_2_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C971A0], "contactPropertiesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transformForPropertyDescription:", v7);
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v8)[2](v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)recentsContactsMatchingHandles:(id)a3
{
  return -[CNUICoreRecentsManager recentsContactsMatchingHandles:sorted:](self, "recentsContactsMatchingHandles:sorted:", a3, 0);
}

- (id)recentsContactsMatchingHandles:(id)a3 sorted:(BOOL)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "queryForHandles:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      -[CNUICoreRecentsManager recentsContactsMatchingHandles:sorted:].cold.2(v6, (uint64_t)v5, v7);

    -[CNUICoreRecentsManager recentsLibrary](self, "recentsLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_recentContactsWithQuery:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_24_0);
    objc_msgSend(v10, "addSuccessBlock:", &__block_literal_global_27_0);
  }
  else
  {
    if (v8)
      -[CNUICoreRecentsManager recentsContactsMatchingHandles:sorted:].cold.1(v7);

    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __64__CNUICoreRecentsManager_recentsContactsMatchingHandles_sorted___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1DD140000, v3, OS_LOG_TYPE_INFO, "Searching CoreRecents failed with %@", (uint8_t *)&v4, 0xCu);
  }

}

void __64__CNUICoreRecentsManager_recentsContactsMatchingHandles_sorted___block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __64__CNUICoreRecentsManager_recentsContactsMatchingHandles_sorted___block_invoke_25_cold_1(v2, v3);

}

- (id)removeRecents:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D13B20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "errorOnlyCompletionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreRecentsManager removeRecents:completionHandler:](self, "removeRecents:completionHandler:", v5, v7);

  objc_msgSend(v6, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)removeRecents:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  _QWORD v9[5];
  id v10;
  void (**v11)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    -[CNUICoreRecentsManager workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__CNUICoreRecentsManager_removeRecents_completionHandler___block_invoke;
    v9[3] = &unk_1EA603FD8;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    objc_msgSend(v8, "performBlock:", v9);

  }
}

void __58__CNUICoreRecentsManager_removeRecents_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "recentsLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  v4 = objc_msgSend(v2, "removeRecentContacts:error:", v3, &v11);
  v5 = v11;

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __58__CNUICoreRecentsManager_removeRecents_completionHandler___block_invoke_cold_1((id *)(a1 + 40), v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134218242;
    v13 = v8;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1DD140000, v7, OS_LOG_TYPE_INFO, "Failed to delete %ld recent(s): %{public}@", buf, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    if (v4)
      v10 = 0;
    else
      v10 = v5;
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }

}

- (void)removeRecentsWithIdentifiers:(id)a3 domain:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void (**v15)(id, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
    -[CNUICoreRecentsManager workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__CNUICoreRecentsManager_removeRecentsWithIdentifiers_domain_completionHandler___block_invoke;
    v12[3] = &unk_1EA604000;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    objc_msgSend(v11, "performBlock:", v12);

  }
}

void __80__CNUICoreRecentsManager_removeRecentsWithIdentifiers_domain_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "recentsLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v9 = 0;
  v5 = objc_msgSend(v2, "removeRecentContactsWithRecentIDs:recentsDomain:error:", v3, v4, &v9);
  v6 = v9;

  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    if (v5)
      v8 = 0;
    else
      v8 = v6;
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

- (id)restoreRecents:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUICoreRecentsManager recentsLibrary](self, "recentsLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restorePreviouslyDeletedRecentContacts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)queryForHandles:(id)a3
{
  return (id)objc_msgSend(a1, "queryForHandles:sorted:", a3, 0);
}

+ (id)queryForHandles:(id)a3 sorted:(BOOL)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "predicateForSearchingHandlesForAllSupportedKinds:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D182A0]);
    objc_msgSend(v7, "setSearchPredicate:", v6);
    objc_msgSend(a1, "supportedRecentsDomains");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDomains:", v8);

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0D182A0], "frecencyComparator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setComparator:", v9);

    }
    else
    {
      objc_msgSend(v7, "setComparator:", 0);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)predicateForSearchingHandlesForAllSupportedKinds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D18298], "predicateForKey:inCollection:", *MEMORY[0x1E0D18238], v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D18298];
    v8 = *MEMORY[0x1E0D18248];
    objc_msgSend(a1, "supportedRecentsKinds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForKey:inCollection:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D18298];
    v14[0] = v10;
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateSatisfyingAllSubpredicates:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)supportedRecentsDomains
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18278];
  v4[0] = *MEMORY[0x1E0D18268];
  v4[1] = v2;
  v4[2] = *MEMORY[0x1E0D18258];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedRecentsKinds
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18228];
  v4[0] = *MEMORY[0x1E0D18208];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedPropertyDescriptions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C971A0], "emailAddressesDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C971A0], "phoneNumbersDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)transformForPropertyDescription:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C971A0], "emailAddressesDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    v6 = &__block_literal_global_33;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C971A0], "phoneNumbersDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v3)
      v6 = &__block_literal_global_36;
    else
      v6 = 0;
  }

  return v6;
}

- (CRRecentContactsLibrary)recentsLibrary
{
  return self->_recentsLibrary;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_recentsLibrary, 0);
}

- (void)recentContactsMatchingAllPropertiesOfContact:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DD140000, v0, v1, "No property to search CoreRecents for in contact %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)recentContactsMatchingAllPropertiesOfContact:.cold.2()
{
  __assert_rtn("-[CNUICoreRecentsManager recentContactsMatchingAllPropertiesOfContact:]", "CNUICoreRecentsManager.m", 64, "[contact areKeysAvailable:@[[[self class] descriptorForRequiredKeys]]]");
}

- (void)sortedRecentHandlesMatchingAllPropertiesOfContact:.cold.2()
{
  __assert_rtn("-[CNUICoreRecentsManager sortedRecentHandlesMatchingAllPropertiesOfContact:]", "CNUICoreRecentsManager.m", 75, "[contact areKeysAvailable:@[[[self class] descriptorForRequiredKeys]]]");
}

- (void)recentContactsMatchingContactProperties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DD140000, v0, v1, "No property to search CoreRecents for in %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)recentsContactsMatchingHandles:(os_log_t)log sorted:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD140000, log, OS_LOG_TYPE_DEBUG, "No property to search CoreRecents for", v1, 2u);
}

- (void)recentsContactsMatchingHandles:(NSObject *)a3 sorted:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1DD140000, a3, OS_LOG_TYPE_DEBUG, "Searching CoreRecents with query predicate %@ for handles %@", v6, 0x16u);

}

void __64__CNUICoreRecentsManager_recentsContactsMatchingHandles_sorted___block_invoke_25_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DD140000, a2, v3, "Searching CoreRecents succeeded, got %ld contact(s)!", v4);
  OUTLINED_FUNCTION_2_2();
}

void __58__CNUICoreRecentsManager_removeRecents_completionHandler___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "count");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DD140000, a2, v3, "Deleted %ld recent(s)", v4);
  OUTLINED_FUNCTION_2_2();
}

@end
