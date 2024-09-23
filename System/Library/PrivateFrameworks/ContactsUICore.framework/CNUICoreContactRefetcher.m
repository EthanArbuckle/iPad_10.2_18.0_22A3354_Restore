@implementation CNUICoreContactRefetcher

- (CNUICoreContactRefetcher)init
{
  CNUICoreContactRefetcher *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactRefetcher)initWithContactStore:(id)a3 contactsToRefetch:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CNUICoreContactRefetcher *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C97248];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "keyVectorWithAllKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:](self, "initWithContactStore:contactsToRefetch:keysToFetch:", v8, v7, v10);

  return v11;
}

- (CNUICoreContactRefetcher)initWithContactStore:(id)a3 contactsToRefetch:(id)a4 keysToFetch:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CNUICoreContactRefetcher *v36;
  CNUICoreContactRefetcher *v37;
  CNUICoreContactRefetcher *v38;
  id v40;
  objc_super v41;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_0 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_46);
  v12 = CNGuardOSLog_cn_once_object_0_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
    if (v10)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v10)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_0 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_46);
  v20 = CNGuardOSLog_cn_once_object_0_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
    -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_10:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_46);
    v28 = CNGuardOSLog_cn_once_object_0_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("contactsToRefetch cannot be empty"), 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v41.receiver = self;
  v41.super_class = (Class)CNUICoreContactRefetcher;
  v36 = -[CNUICoreContactRefetcher init](&v41, sel_init);
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_contactStore, a3);
    objc_storeStrong((id *)&v37->_contactsToRefetch, a4);
    objc_storeStrong((id *)&v37->_keysToFetch, a5);
    v38 = v37;
  }

  return v37;
}

- (id)allContacts
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[CNUICoreContactRefetcher foundContacts](self, "foundContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CNUICoreContactRefetcher_allContacts__block_invoke;
  v6[3] = &unk_1EA6034D0;
  v6[4] = self;
  objc_msgSend(v3, "map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __39__CNUICoreContactRefetcher_allContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "contactsToRefetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactsByReplacingContacts:withContactsHavingMatchingIdentifier:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)foundContacts
{
  void *v2;
  void *v3;

  -[CNUICoreContactRefetcher contactsFoundAndNotFound](self, "contactsFoundAndNotFound");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "map:", &__block_literal_global_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __41__CNUICoreContactRefetcher_foundContacts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

- (id)contactsFoundAndNotFound
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = (void *)objc_opt_class();
  -[CNUICoreContactRefetcher contactsToRefetch](self, "contactsToRefetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactRefetcher contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactRefetcher keysToFetch](self, "keysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refetchedContacts:fromStore:keysToFetch:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__CNUICoreContactRefetcher_contactsFoundAndNotFound__block_invoke;
  v10[3] = &unk_1EA603518;
  v10[4] = self;
  objc_msgSend(v7, "map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __52__CNUICoreContactRefetcher_contactsFoundAndNotFound__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "contactsToRefetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactsFoundAndNotFoundByPartioningContacts:usingFoundContacts:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D13AF8];
  objc_msgSend(v6, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pairWithFirst:second:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)refetchedContacts:(id)a3 fromStore:(id)a4 keysToFetch:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (objc_class *)MEMORY[0x1E0C97210];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithKeysToFetch:", v8);

  v12 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v10, "_cn_map:", &__block_literal_global_19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "predicateForContactsWithIdentifiers:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v14);

  objc_msgSend(v11, "setUnifyResults:", 0);
  +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:](CNUICoreContactFetchRequestAccumulator, "resultOfFetchRequest:fromStore:", v11, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)contactsByReplacingContacts:(id)a3 withContactsHavingMatchingIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "_cn_indexBy:", &__block_literal_global_19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__CNUICoreContactRefetcher_contactsByReplacingContacts_withContactsHavingMatchingIdentifier___block_invoke;
  v10[3] = &unk_1EA603540;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "_cn_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __93__CNUICoreContactRefetcher_contactsByReplacingContacts_withContactsHavingMatchingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

+ (id)contactsFoundAndNotFoundByPartioningContacts:(id)a3 usingFoundContacts:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "_cn_indexBy:", &__block_literal_global_19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__CNUICoreContactRefetcher_contactsFoundAndNotFoundByPartioningContacts_usingFoundContacts___block_invoke;
  v10[3] = &unk_1EA603568;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "_cn_partition:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __92__CNUICoreContactRefetcher_contactsFoundAndNotFoundByPartioningContacts_usingFoundContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (CNUICoreContactStoreFacade)contactStore
{
  return self->_contactStore;
}

- (NSArray)contactsToRefetch
{
  return self->_contactsToRefetch;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactsToRefetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)initWithContactStore:(uint64_t)a3 contactsToRefetch:(uint64_t)a4 keysToFetch:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘keysToFetch’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithContactStore:(uint64_t)a3 contactsToRefetch:(uint64_t)a4 keysToFetch:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contactsToRefetch’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithContactStore:(uint64_t)a3 contactsToRefetch:(uint64_t)a4 keysToFetch:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contactStore’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
