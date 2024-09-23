@implementation CNDonationMapper

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
  void *v12;
  _QWORD *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _Unwind_Exception *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &unk_1EE1857C8;
  if (objc_msgSend(v5, "conformsToProtocol:", v6))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[CNDonationMapper donationStore](self, "donationStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactsFromDonationStore:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isRight"))
    {
      objc_msgSend(v10, "right");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "code") != 1)
      {
        objc_msgSend(v11, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v27 = &v26;
        v28 = 0x2020000000;
        v13 = (_QWORD *)getCNDonationErrorDomainSymbolLoc_ptr;
        v29 = getCNDonationErrorDomainSymbolLoc_ptr;
        if (!getCNDonationErrorDomainSymbolLoc_ptr)
        {
          v14 = (void *)ContactsDonationLibrary();
          v13 = dlsym(v14, "CNDonationErrorDomain");
          v27[3] = (uint64_t)v13;
          getCNDonationErrorDomainSymbolLoc_ptr = (uint64_t)v13;
        }
        _Block_object_dispose(&v26, 8);
        if (!v13)
        {
          v23 = (_Unwind_Exception *)-[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:].cold.1();
          _Block_object_dispose(&v26, 8);
          _Unwind_Resume(v23);
        }
        v15 = objc_msgSend(v12, "isEqualToString:", *v13);

        if ((v15 & 1) == 0)
        {
          objc_msgSend((id)objc_opt_class(), "log");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[CNDonationMapper contactObservableForFetchRequest:].cold.2((uint64_t)v11, v16);

        }
      }
      objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "left");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_cn_filter:", &__block_literal_global_51_0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __53__CNDonationMapper_contactObservableForFetchRequest___block_invoke;
      v24[3] = &unk_1E29FDA18;
      v25 = v8;
      objc_msgSend(v19, "_cn_map:", v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_cn_map:", &__block_literal_global_55_1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (CNDonationStore)donationStore
{
  return self->_donationStore;
}

- (BOOL)shouldLogContactsAccess
{
  return 0;
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  return 1;
}

- (id)meContactIdentifiers:(id *)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("2D0447ED-BB88-45F9-909B-EB36C6920675");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CNDonationMapper)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  CNDonationMapper *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)getCNDonationStoreClass_softClass;
  v15 = getCNDonationStoreClass_softClass;
  if (!getCNDonationStoreClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getCNDonationStoreClass_block_invoke;
    v11[3] = &unk_1E29F98A8;
    v11[4] = &v12;
    __getCNDonationStoreClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v4, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNDonationMapper initWithDonationStore:environment:](self, "initWithDonationStore:environment:", v7, v8);

  return v9;
}

- (CNDonationMapper)initWithDonationStore:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  CNDonationMapper *v9;
  CNDonationMapper *v10;
  CNDonationMapper *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNDonationMapper;
  v9 = -[CNDonationMapper init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a4);
    objc_storeStrong((id *)&v10->_donationStore, a3);
    v11 = v10;
  }

  return v10;
}

+ (NSString)mapperIdentifier
{
  return (NSString *)CFSTR("CNDonationMapper");
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)log
{
  if (log_cn_once_token_0_13 != -1)
    dispatch_once(&log_cn_once_token_0_13, &__block_literal_global_122);
  return (id)log_cn_once_object_0_13;
}

void __23__CNDonationMapper_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.donation", "analytics");
  v1 = (void *)log_cn_once_object_0_13;
  log_cn_once_object_0_13 = (uint64_t)v0;

}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

id __53__CNDonationMapper_contactObservableForFetchRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNDonatedContactSanitizer sanitizeDonatedContact:matchingPredicate:](CNDonatedContactSanitizer, "sanitizeDonatedContact:matchingPredicate:", a2, *(_QWORD *)(a1 + 32));
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  return 1;
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

  -[CNDonationMapper policyWithDescription:error:](self, "policyWithDescription:error:", v7, a4);
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

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  return &unk_1E2A40158;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationStore, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)contactObservableForFetchRequest:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Error retrieving contacts from daemon: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
