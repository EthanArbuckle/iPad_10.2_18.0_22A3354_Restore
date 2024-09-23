@implementation CNContactListActionConfiguration

+ (id)log
{
  if (log_cn_once_token_1_62280 != -1)
    dispatch_once(&log_cn_once_token_1_62280, &__block_literal_global_62281);
  return (id)log_cn_once_object_1_62282;
}

void __39__CNContactListActionConfiguration_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNContactListActionConfiguration");
  v1 = (void *)log_cn_once_object_1_62282;
  log_cn_once_object_1_62282 = (uint64_t)v0;

}

- (id)containerForContainerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    v5 = (void *)MEMORY[0x1E0C972C0];
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContainersWithIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactListActionConfiguration contactStore](self, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v8, "containersMatchingPredicate:error:", v7, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v4;
        v17 = 2112;
        v18 = v10;
        _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Error fetching container for container identifier:%@, error: %@", buf, 0x16u);
      }

      v12 = 0;
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setContactViewCache:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewCache, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (CNContactStoreFilter)contactStoreFilter
{
  return self->_contactStoreFilter;
}

- (void)setContactStoreFilter:(id)a3
{
  objc_storeStrong((id *)&self->_contactStoreFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreFilter, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
