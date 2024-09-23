@implementation CNFamilyCircleConfigurationUpdateTask

+ (id)os_log
{
  if (os_log_cn_once_token_1_7 != -1)
    dispatch_once(&os_log_cn_once_token_1_7, &__block_literal_global_37);
  return (id)os_log_cn_once_object_1_7;
}

void __47__CNFamilyCircleConfigurationUpdateTask_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "family-circle-config-update-task");
  v1 = (void *)os_log_cn_once_object_1_7;
  os_log_cn_once_object_1_7 = (uint64_t)v0;

}

- (CNFamilyCircleConfigurationUpdateTask)init
{
  void *v3;
  CNFamilyCircleConfigurationUpdateTask *v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNFamilyCircleConfigurationUpdateTask initWithAccountSource:accountSink:accountStore:](self, "initWithAccountSource:accountSink:accountStore:", 0, 0, v3);

  return v4;
}

- (CNFamilyCircleConfigurationUpdateTask)initWithName:(id)a3
{
  CNFamilyCircleConfigurationUpdateTask *v3;
  CNFamilyCircleConfigurationUpdateTask *v4;
  CNFamilyCircleConfigurationUpdateTask *v5;

  v3 = -[CNFamilyCircleConfigurationUpdateTask init](self, "init", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (CNFamilyCircleConfigurationUpdateTask)initWithAccountSource:(id)a3 accountSink:(id)a4 accountStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNFamilyCircleConfigurationUpdateTask *v12;
  CNFamilyCircleConfigurationUpdateTask *v13;
  NSArray *delegateAccounts;
  void *v15;
  uint64_t v16;
  CNResult *v17;
  CNFamilyCircleConfigurationUpdateTask *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNFamilyCircleConfigurationUpdateTask;
  v12 = -[CNTask initWithName:](&v20, sel_initWithName_, CFSTR("CNFamilyCircleConfigurationUpdateTask"));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountSource, a3);
    objc_storeStrong((id *)&v13->_accountSink, a4);
    objc_storeStrong((id *)&v13->_accountStore, a5);
    delegateAccounts = v13->_delegateAccounts;
    v13->_delegateAccounts = 0;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNResult successWithValue:](CNResult, "successWithValue:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v13->_result;
    v13->_result = (CNResult *)v16;

    v18 = v13;
  }

  return v13;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("accountSource"), self->_accountSource);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("accountSink"), self->_accountSink);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)run:(id *)a3
{
  CNResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CNFamilyCircleConfigurationUpdateTask loadDefaultSourceIfNecessary](self, "loadDefaultSourceIfNecessary");
  -[CNFamilyCircleConfigurationUpdateTask loadDelegateAccountsFromSource](self, "loadDelegateAccountsFromSource");
  -[CNFamilyCircleConfigurationUpdateTask loadDefaultSinkIfNecessary](self, "loadDefaultSinkIfNecessary");
  -[CNFamilyCircleConfigurationUpdateTask updateDelegateAccounts](self, "updateDelegateAccounts");
  v5 = self->_result;
  -[CNResult value](v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNResult value](v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNResult error](v5, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3)
      *a3 = objc_retainAutorelease(v8);

    v7 = 0;
  }

  return v7;
}

- (void)loadDefaultSourceIfNecessary
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_18F80C000, v2, v3, "Failed to fetch family circle: %@ %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)loadDelegateAccountsFromSource
{
  NSArray *v3;
  NSArray *delegateAccounts;
  id v5;

  -[CNDelegateAccountSource delegateAccounts](self->_accountSource, "delegateAccounts");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (NSArray *)objc_msgSend(v5, "copy");
  delegateAccounts = self->_delegateAccounts;
  self->_delegateAccounts = v3;

}

- (void)loadDefaultSinkIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_18F80C000, a2, OS_LOG_TYPE_ERROR, "Parent CardDAV ACAccount not found for appleID: %@", (uint8_t *)&v6, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)updateDelegateAccounts
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_18F80C000, v2, v3, "Error updating family circle CardDAV ACAccounts: %@ %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (CNDelegateAccountSource)accountSource
{
  return self->_accountSource;
}

- (CNDelegateAccountSink)accountSink
{
  return self->_accountSink;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSArray)delegateAccounts
{
  return self->_delegateAccounts;
}

- (CNResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_delegateAccounts, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountSink, 0);
  objc_storeStrong((id *)&self->_accountSource, 0);
}

@end
