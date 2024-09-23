@implementation CNContactProviderSupportiOSDataMapper

+ (id)os_log
{
  objc_opt_self();
  if (os_log_cn_once_token_0_21 != -1)
    dispatch_once(&os_log_cn_once_token_0_21, &__block_literal_global_131);
  return (id)os_log_cn_once_object_0_21;
}

void __47__CNContactProviderSupportiOSDataMapper_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.provider", "CNContactProviderSupportiOSDataMapper");
  v1 = (void *)os_log_cn_once_object_0_21;
  os_log_cn_once_object_0_21 = (uint64_t)v0;

}

- (CNContactProviderSupportiOSDataMapper)initWithConfiguration:(id)a3
{
  return -[CNContactProviderSupportiOSDataMapper initWithConfiguration:addressBook:](self, "initWithConfiguration:addressBook:", a3, 0);
}

- (CNContactProviderSupportiOSDataMapper)initWithConfiguration:(id)a3 addressBook:(id)a4
{
  id v6;
  id v7;
  CNContactProviderSupportiOSDataMapper *v8;
  CNiOSAddressBookDataMapper *v9;
  CNiOSAddressBookDataMapper *dataMapper;
  uint64_t v11;
  CNContactProviderSupportManager *contactProviderManager;
  uint64_t v13;
  CNManagedConfiguration *managedConfiguration;
  CNContactProviderSupportiOSDataMapper *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNContactProviderSupportiOSDataMapper;
  v8 = -[CNContactProviderSupportiOSDataMapper init](&v17, sel_init);
  if (v8)
  {
    v9 = -[CNiOSAddressBookDataMapper initWithConfiguration:addressBook:]([CNiOSAddressBookDataMapper alloc], "initWithConfiguration:addressBook:", v6, v7);
    dataMapper = v8->_dataMapper;
    v8->_dataMapper = v9;

    objc_msgSend(v6, "contactProviderManager");
    v11 = objc_claimAutoreleasedReturnValue();
    contactProviderManager = v8->_contactProviderManager;
    v8->_contactProviderManager = (CNContactProviderSupportManager *)v11;

    objc_msgSend(v6, "managedConfiguration");
    v13 = objc_claimAutoreleasedReturnValue();
    managedConfiguration = v8->_managedConfiguration;
    v8->_managedConfiguration = (CNManagedConfiguration *)v13;

    v15 = v8;
  }

  return v8;
}

- (void)updateManagedConfiguration
{
  void *v2;
  __CFString *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "providerContainer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v2;
    if (v2)
    {
      objc_msgSend(v2, "identifier");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("Extension not enabled");
    }
    objc_msgSend(*(id *)(a1 + 24), "setProviderContainerIdentifier:", v3);

  }
}

- (BOOL)shouldLogContactsAccess
{
  return 0;
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  return 1;
}

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4;
  NSObject *v5;
  CNiOSAddressBookDataMapper *dataMapper;
  void *v7;
  uint8_t v9[16];

  v4 = a3;
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Calling contactObservableForFetchRequest:", v9, 2u);
  }

  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  -[CNiOSAddressBookDataMapper contactObservableForFetchRequest:](dataMapper, "contactObservableForFetchRequest:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  NSObject *v5;
  CNContactProviderSupportManager *contactProviderManager;
  CNContactProviderSupportManager *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Overriding containersMatchingPredicate:error:, returning provider container", v11, 2u);
  }

  if (self)
    contactProviderManager = self->_contactProviderManager;
  else
    contactProviderManager = 0;
  v7 = contactProviderManager;
  -[CNContactProviderSupportManager providerContainer](v7, "providerContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)defaultContainerIdentifier
{
  NSObject *v2;
  uint8_t buf[16];

  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_INFO, "Overriding defaultContainerIdentifier, returning provider container identifier", buf, 2u);
  }

  cn_objectResultWithObjectLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __67__CNContactProviderSupportiOSDataMapper_defaultContainerIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (!v3)
  {
    -[CNContactProviderSupportiOSDataMapper defaultContainerIdentifierImpl](v2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return v3;
}

- (id)defaultContainerIdentifierImpl
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "providerContainer");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  CNiOSAddressBookDataMapper *dataMapper;
  BOOL v9;
  uint8_t v11[16];

  v6 = a3;
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "Calling executeSaveRequest:error:", v11, 2u);
  }

  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  v9 = -[CNiOSAddressBookDataMapper executeSaveRequest:error:](dataMapper, "executeSaveRequest:error:", v6, a4);

  return v9;
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  CNiOSAddressBookDataMapper *dataMapper;
  BOOL v14;
  uint8_t v16[16];

  v10 = a5;
  v11 = a3;
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_INFO, "Calling executeSaveRequest:response:context:error:", v16, 2u);
  }

  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  v14 = -[CNiOSAddressBookDataMapper executeSaveRequest:response:authorizationContext:error:](dataMapper, "executeSaveRequest:response:authorizationContext:error:", v11, a4, v10, a6);

  return v14;
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  CNiOSAddressBookDataMapper *dataMapper;
  void *v9;
  uint8_t v11[16];

  v6 = a3;
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "Calling groupsMatchingPredicate:error:", v11, 2u);
  }

  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  -[CNiOSAddressBookDataMapper groupsMatchingPredicate:error:](dataMapper, "groupsMatchingPredicate:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  CNiOSAddressBookDataMapper *dataMapper;
  void *v9;
  uint8_t v11[16];

  v6 = a3;
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "Calling policyForContainerWithIdentifier:error:", v11, 2u);
  }

  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  -[CNiOSAddressBookDataMapper policyForContainerWithIdentifier:error:](dataMapper, "policyForContainerWithIdentifier:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  CNiOSAddressBookDataMapper *dataMapper;
  void *v9;
  uint8_t v11[16];

  v6 = a3;
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "Calling policyWithDescription:error:", v11, 2u);
  }

  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  -[CNiOSAddressBookDataMapper policyWithDescription:error:](dataMapper, "policyWithDescription:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)encodedContactsCursorForFetchRequest:(id)a3 cursorCleanupBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  CNiOSAddressBookDataMapper *dataMapper;
  void *v12;
  uint8_t v14[16];

  v8 = a4;
  v9 = a3;
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_INFO, "Calling encodedContactsCursorForFetchRequest:cursorCleanupBlock:error:", v14, 2u);
  }

  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  -[CNiOSAddressBookDataMapper encodedContactsCursorForFetchRequest:cursorCleanupBlock:error:](dataMapper, "encodedContactsCursorForFetchRequest:cursorCleanupBlock:error:", v9, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)fetchContactsForFetchRequest:(id)a3 error:(id *)a4 batchHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  CNiOSAddressBookDataMapper *dataMapper;
  BOOL v12;
  uint8_t v14[16];

  v8 = a5;
  v9 = a3;
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_INFO, "Calling encodedContactsCursorForFetchRequest:error:batchHandler:", v14, 2u);
  }

  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  v12 = -[CNiOSAddressBookDataMapper fetchContactsForFetchRequest:error:batchHandler:](dataMapper, "fetchContactsForFetchRequest:error:batchHandler:", v9, a4, v8);

  return v12;
}

- (BOOL)fetchEncodedContactsForFetchRequest:(id)a3 error:(id *)a4 cancelationToken:(id)a5 batchHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  CNiOSAddressBookDataMapper *dataMapper;
  BOOL v15;
  uint8_t v17[16];

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_18F8BD000, v13, OS_LOG_TYPE_INFO, "Calling encodedContactsCursorForFetchRequest:error:cancelationToken:batchHandler:", v17, 2u);
  }

  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  v15 = -[CNiOSAddressBookDataMapper fetchEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:](dataMapper, "fetchEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:", v12, a4, v11, v10);

  return v15;
}

- (id)currentHistoryAnchor
{
  NSObject *v3;
  CNiOSAddressBookDataMapper *dataMapper;
  uint8_t v6[16];

  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18F8BD000, v3, OS_LOG_TYPE_INFO, "Calling currentHistoryAnchor", v6, 2u);
  }

  if (self)
    dataMapper = self->_dataMapper;
  else
    dataMapper = 0;
  -[CNiOSAddressBookDataMapper currentHistoryAnchor](dataMapper, "currentHistoryAnchor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  NSObject *v4;

  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CNContactProviderSupportiOSDataMapper authorizedKeysForContactKeys:error:].cold.1();

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  NSObject *v4;

  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CNContactProviderSupportiOSDataMapper accountsMatchingPredicate:error:].cold.1();

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  NSObject *v4;

  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CNContactProviderSupportiOSDataMapper serverSearchContainersMatchingPredicate:error:].cold.1();

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  NSObject *v4;

  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CNContactProviderSupportiOSDataMapper subgroupsOfGroupWithIdentifier:error:].cold.1();

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  NSObject *v4;

  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CNContactProviderSupportiOSDataMapper contactCountForFetchRequest:error:].cold.1();

  return &unk_1E2A40188;
}

- (id)meContactIdentifiers:(id *)a3
{
  NSObject *v3;

  objc_opt_class();
  +[CNContactProviderSupportiOSDataMapper os_log]();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CNContactProviderSupportiOSDataMapper meContactIdentifiers:].cold.1();

  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactProviderManager, 0);
  objc_storeStrong((id *)&self->_dataMapper, 0);
}

- (void)authorizedKeysForContactKeys:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Unexpected usage of authorizedKeysForContactKeys:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)accountsMatchingPredicate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Unexpected usage of accountsMatchingPredicate:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)serverSearchContainersMatchingPredicate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Unexpected usage of serverSearchContainersMatchingPredicate:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)subgroupsOfGroupWithIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Unexpected usage of subgroupsOfGroupWithIdentifier:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)contactCountForFetchRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Unexpected usage of contactCountForFetchRequest:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)meContactIdentifiers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Unexpected usage of meContactIdentifiers:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
