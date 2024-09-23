@implementation CNDowntimeWhitelist

+ (BOOL)isWhitelistedContact:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "downtimeWhitelist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D13738]);

  return v4;
}

- (CNDowntimeWhitelist)initWithContactStore:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CNDowntimeWhitelist *v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNDowntimeWhitelist initWithContactStore:notificationCenter:](self, "initWithContactStore:notificationCenter:", v5, v6);

  return v7;
}

- (CNDowntimeWhitelist)initWithContactStore:(id)a3 notificationCenter:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CNDowntimeWhitelist *v10;

  v6 = (void *)MEMORY[0x1E0C8F2B8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNDowntimeWhitelist initWithContactStore:accountStore:notificationCenter:](self, "initWithContactStore:accountStore:notificationCenter:", v8, v9, v7);

  return v10;
}

- (CNDowntimeWhitelist)initWithContactStore:(id)a3 accountStore:(id)a4 notificationCenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNDowntimeWhitelist *v12;
  CNDowntimeWhitelist *v13;
  CNDowntimeWhitelistContainerFetcher *v14;
  CNDowntimeWhitelistContainerFetching *containerFetcher;
  CNDowntimeWhitelist *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNDowntimeWhitelist;
  v12 = -[CNDowntimeWhitelist init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contactStore, a3);
    objc_storeStrong((id *)&v13->_notificationCenter, a5);
    v14 = -[CNDowntimeWhitelistContainerFetcher initWithContactStore:accountStore:notificationCenter:]([CNDowntimeWhitelistContainerFetcher alloc], "initWithContactStore:accountStore:notificationCenter:", v9, v10, v11);
    containerFetcher = v13->_containerFetcher;
    v13->_containerFetcher = (CNDowntimeWhitelistContainerFetching *)v14;

    -[CNDowntimeWhitelist beginObservingChangeNotifications](v13, "beginObservingChangeNotifications");
    v16 = v13;
  }

  return v13;
}

- (void)beginObservingChangeNotifications
{
  NSNotificationCenter *v3;
  NSNotificationCenter *notificationCenter;
  NSNotificationCenter *v5;
  NSObject *v6;
  NSObject *contactStoreDidChangeNotificationToken;
  _QWORD v8[4];
  NSNotificationCenter *v9;

  v3 = self->_notificationCenter;
  notificationCenter = self->_notificationCenter;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CNDowntimeWhitelist_beginObservingChangeNotifications__block_invoke;
  v8[3] = &unk_1E29FDFD8;
  v9 = v3;
  v5 = v3;
  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](notificationCenter, "addObserverForName:object:queue:usingBlock:", CFSTR("CNContactStoreDidChangeNotification"), 0, 0, v8);
  v6 = objc_claimAutoreleasedReturnValue();
  contactStoreDidChangeNotificationToken = self->_contactStoreDidChangeNotificationToken;
  self->_contactStoreDidChangeNotificationToken = v6;

}

+ (id)os_log
{
  if (os_log_cn_once_token_0_24 != -1)
    dispatch_once(&os_log_cn_once_token_0_24, &__block_literal_global_142);
  return (id)os_log_cn_once_object_0_24;
}

void __29__CNDowntimeWhitelist_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "whitelist");
  v1 = (void *)os_log_cn_once_object_0_24;
  os_log_cn_once_object_0_24 = (uint64_t)v0;

}

- (CNDowntimeWhitelist)init
{
  CNContactStore *v3;
  CNDowntimeWhitelist *v4;

  v3 = objc_alloc_init(CNContactStore);
  v4 = -[CNDowntimeWhitelist initWithContactStore:](self, "initWithContactStore:", v3);

  return v4;
}

void __56__CNDowntimeWhitelist_beginObservingChangeNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CNDowntimeWhitelist_beginObservingChangeNotifications__block_invoke_2;
  v4[3] = &unk_1E29F8508;
  v5 = *(id *)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "afterDelay:performBlock:", v4, 0.0);

}

uint64_t __56__CNDowntimeWhitelist_beginObservingChangeNotifications__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", CFSTR("CNDowntimeWhitelistDidChangeNotification"), 0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self->_contactStoreDidChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)CNDowntimeWhitelist;
  -[CNDowntimeWhitelist dealloc](&v3, sel_dealloc);
}

- (id)whitelistedHandleStringsFromHandleStrings:(id)a3
{
  return -[CNDowntimeWhitelist whitelistedHandleStringsFromHandleStrings:error:](self, "whitelistedHandleStringsFromHandleStrings:error:", a3, 0);
}

- (id)whitelistedHandleStringsFromHandleStrings:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  CNDowntimeWhitelist *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CNDowntimeWhitelist contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDowntimeWhitelist requestForContactsInPermittedContainersWithHandles:](self, "requestForContactsInPermittedContainersWithHandles:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;

  if (v9)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__CNDowntimeWhitelist_whitelistedHandleStringsFromHandleStrings_error___block_invoke;
    v18[3] = &unk_1E29FE000;
    v19 = v9;
    v20 = self;
    objc_msgSend(v6, "_cn_filter:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "os_log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v11, "count");
      v14 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218240;
      v23 = v13;
      v24 = 2048;
      v25 = v14;
      _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_INFO, "%lu of %lu handles were whitelisted", buf, 0x16u);
    }

    objc_msgSend((id)objc_opt_class(), "os_log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CNDowntimeWhitelist whitelistedHandleStringsFromHandleStrings:error:].cold.2();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CNDowntimeWhitelist whitelistedHandleStringsFromHandleStrings:error:].cold.1();

    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v11;
}

uint64_t __71__CNDowntimeWhitelist_whitelistedHandleStringsFromHandleStrings_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)objc_opt_class(), "anyContactIsWhitelisted:", v5);
  return v6;
}

- (BOOL)isHandleStringWhitelisted:(id)a3
{
  return -[CNDowntimeWhitelist isHandleStringWhitelisted:error:](self, "isHandleStringWhitelisted:error:", a3, 0);
}

- (BOOL)isHandleStringWhitelisted:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  _QWORD v15[6];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDowntimeWhitelist requestForContactsInPermittedContainersWithHandles:](self, "requestForContactsInPermittedContainersWithHandles:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNDowntimeWhitelist contactStore](self, "contactStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__CNDowntimeWhitelist_isHandleStringWhitelisted_error___block_invoke;
    v15[3] = &unk_1E29FE028;
    v15[4] = self;
    v15[5] = &v17;
    v11 = objc_msgSend(v10, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, &v16, v15);
    v12 = v16;

    if ((v11 & 1) == 0)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      objc_msgSend((id)objc_opt_class(), "os_log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CNDowntimeWhitelist whitelistedHandleStringsFromHandleStrings:error:].cold.1();

    }
    v7 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  return v7;
}

void __55__CNDowntimeWhitelist_isHandleStringWhitelisted_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend((id)objc_opt_class(), "isWhitelistedContact:", v5))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_INFO, "Whitelisted %@", (uint8_t *)&v7, 0xCu);
    }

    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (id)allWhitelistedHandleStrings
{
  return -[CNDowntimeWhitelist allWhitelistedHandleStrings:](self, "allWhitelistedHandleStrings:", 0);
}

- (id)allWhitelistedHandleStrings:(id *)a3
{
  void *v3;
  void *v4;

  -[CNDowntimeWhitelist allWhitelistedContacts:](self, "allWhitelistedContacts:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_flatMap:", &__block_literal_global_26_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allWhitelistedContacts:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;

  -[CNDowntimeWhitelist contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDowntimeWhitelist requestForContactsInPermittedContainers](self, "requestForContactsInPermittedContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
  {
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__CNDowntimeWhitelist_allWhitelistedContacts___block_invoke;
    v13[3] = &unk_1E29FE050;
    v13[4] = self;
    objc_msgSend(v9, "_cn_filter:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CNDowntimeWhitelist allWhitelistedContacts:].cold.1();

    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v10;
}

uint64_t __46__CNDowntimeWhitelist_allWhitelistedContacts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "isWhitelistedContact:", v2);

  return v3;
}

- (id)requestForContactsInPermittedContainersWithHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNDowntimeWhitelist containerFetcher](self, "containerFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downtimeWhitelistContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E29FF900;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  -[CNDowntimeWhitelist requestForNonUnifiedContacts](self, "requestForNonUnifiedContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact predicateForContactsMatchingHandleStrings:inContainersWithIdentifiers:](CNContact, "predicateForContactsMatchingHandleStrings:inContainersWithIdentifiers:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v13);
  return v11;
}

- (id)requestForContactsInPermittedContainers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  -[CNDowntimeWhitelist containerFetcher](self, "containerFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downtimeWhitelistContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E29FF900;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  -[CNDowntimeWhitelist requestForNonUnifiedContacts](self, "requestForNonUnifiedContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact predicateForContactsInContainerWithIdentifier:](CNContact, "predicateForContactsInContainerWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  return v9;
}

- (id)requestForNonUnifiedContacts
{
  CNContactFetchRequest *v2;
  void *v3;
  CNContactFetchRequest *v4;

  v2 = [CNContactFetchRequest alloc];
  objc_msgSend((id)objc_opt_class(), "keyDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContactFetchRequest initWithKeysToFetch:](v2, "initWithKeysToFetch:", v3);

  -[CNContactFetchRequest setUnifyResults:](v4, "setUnifyResults:", 0);
  return v4;
}

+ (id)keyDescriptor
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("downtimeWhitelist");
  v7[2] = CFSTR("emailAddresses");
  v7[3] = CFSTR("phoneNumbers");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v2, CFSTR("CNDowntimeWhitelist keyDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)anyContactIsWhitelisted:(id)a3
{
  return objc_msgSend(a3, "_cn_any:", &__block_literal_global_21_1);
}

- (void)setTestContainerFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_containerFetcher, a3);
}

- (CNDowntimeWhitelistContainerFetching)containerFetcher
{
  return self->_containerFetcher;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSObject)contactStoreDidChangeNotificationToken
{
  return self->_contactStoreDidChangeNotificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeNotificationToken, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_containerFetcher, 0);
}

- (void)whitelistedHandleStringsFromHandleStrings:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error fetching whitelisted contacts %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)whitelistedHandleStringsFromHandleStrings:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18F8BD000, v0, OS_LOG_TYPE_DEBUG, "Whitelisted handles: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)allWhitelistedContacts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "error fetching whitelisted contacts: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
