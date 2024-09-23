@implementation CNUICoreContactStoreProductionFacade

- (CNUICoreContactStoreProductionFacade)init
{
  CNUICoreContactStoreProductionFacade *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactStoreProductionFacade)initWithContactStore:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CNUICoreContactStoreProductionFacade *v14;
  CNUICoreContactStoreProductionFacade *v15;
  CNUICoreContactStoreProductionFacade *v16;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_14 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_14, &__block_literal_global_117);
    v6 = CNGuardOSLog_cn_once_object_0_14;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_14, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v18.receiver = self;
  v18.super_class = (Class)CNUICoreContactStoreProductionFacade;
  v14 = -[CNUICoreContactStoreProductionFacade init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactStore, a3);
    v16 = v15;
  }

  return v15;
}

- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CNUICoreContactStoreProductionFacade contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[CNUICoreContactStoreProductionFacade contactStore](self, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v10, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, a4, v8);

  return (char)a4;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CNUICoreContactStoreProductionFacade contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "executeSaveRequest:error:", v6, a4);

  return (char)a4;
}

- (id)containerForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CNUICoreContactStoreProductionFacade contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C972C0];
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "predicateForContainerOfContactWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containersMatchingPredicate:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
