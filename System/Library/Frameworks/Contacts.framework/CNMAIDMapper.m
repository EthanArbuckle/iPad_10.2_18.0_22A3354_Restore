@implementation CNMAIDMapper

+ (id)os_log
{
  if (os_log_cn_once_token_0_10 != -1)
    dispatch_once(&os_log_cn_once_token_0_10, &__block_literal_global_66);
  return (id)os_log_cn_once_object_0_10;
}

void __22__CNMAIDMapper_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "maid");
  v1 = (void *)os_log_cn_once_object_0_10;
  os_log_cn_once_object_0_10 = (uint64_t)v0;

}

- (CNMAIDMapper)init
{
  void *v3;
  void *v4;
  CNMAIDMapper *v5;

  objc_msgSend(MEMORY[0x1E0C93E18], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNMAIDMapper initWithDataStore:environment:](self, "initWithDataStore:environment:", v3, v4);

  return v5;
}

- (CNMAIDMapper)initWithConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CNMAIDMapper *v8;

  v4 = (void *)MEMORY[0x1E0C93E18];
  v5 = a3;
  objc_msgSend(v4, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNMAIDMapper initWithDataStore:environment:](self, "initWithDataStore:environment:", v6, v7);
  return v8;
}

- (CNMAIDMapper)initWithDataStore:(id)a3 environment:(id)a4
{
  id v6;
  CNMAIDMapper *v7;
  CNMAIDMapper *v8;
  CNMAIDMapper *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNMAIDMapper;
  v7 = -[CNMAIDMapper init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataStore, a3);
    v9 = v8;
  }

  return v8;
}

- (NSString)description
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)shouldLogContactsAccess
{
  return 0;
}

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[CNMAIDMapper dataStore](self, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "predicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE18FFE8))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      -[CNMAIDMapper dataStore](self, "dataStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contactsFromCLSDataStore:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "isFailure"))
      {
        objc_msgSend(v10, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "os_log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CNMAIDMapper contactObservableForFetchRequest:].cold.2((uint64_t)v11, v12);

        objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_cn_filter:", &__block_literal_global_51);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_cn_map:", &__block_literal_global_55);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CNMAIDMapper contactObservableForFetchRequest:].cold.1(v14);

    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)meContactIdentifiers:(id *)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  return 1;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  CNPolicyDescription *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(CNPolicyDescription);
  -[CNPolicyDescription setContainerIdentifier:](v7, "setContainerIdentifier:", v6);

  -[CNMAIDMapper policyWithDescription:error:](self, "policyWithDescription:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)defaultContainerIdentifier
{
  return 0;
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  id v5;
  CNMAIDMapper *v6;
  id v7;

  v5 = a3;
  v6 = self;
  CNUnimplementedMethodException();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  return &unk_1E2A40068;
}

- (CLSDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
}

- (void)contactObservableForFetchRequest:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "No MAID data store", v1, 2u);
}

- (void)contactObservableForFetchRequest:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Error searching for MAID results: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
