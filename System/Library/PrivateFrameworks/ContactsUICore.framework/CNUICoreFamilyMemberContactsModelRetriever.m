@implementation CNUICoreFamilyMemberContactsModelRetriever

+ (int64_t)contactFormatterStyle
{
  return 0;
}

+ (NSArray)keysToFetch
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", objc_msgSend(a1, "contactFormatterStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreFamilyInfoRetriever keysToFetch](CNUICoreFamilyInfoRetriever, "keysToFetch", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C96708];
  v11[1] = v3;
  v11[2] = v4;
  v5 = *MEMORY[0x1E0C96688];
  v11[3] = *MEMORY[0x1E0C96890];
  v11[4] = v5;
  v6 = *MEMORY[0x1E0C967C0];
  v11[5] = *MEMORY[0x1E0C96700];
  v11[6] = v6;
  v7 = *MEMORY[0x1E0C966A0];
  v11[7] = *MEMORY[0x1E0C966A8];
  v11[8] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_flatten");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (CNUICoreFamilyMemberContactsModelRetriever)init
{
  CNUICoreFamilyMemberContactsModelRetriever *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactsModelRetriever)initWithDowntimeContainerFetcher:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  CNUICoreContactStoreProductionFacade *v8;
  id v9;
  CNUICoreContactStoreProductionFacade *v10;
  CNUICoreFamilyInfoRetriever *v11;
  CNUICoreFamilyMemberContactsModelRetriever *v12;

  v6 = a4;
  v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  v9 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v10 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v8, "initWithContactStore:", v9);

  v11 = -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:]([CNUICoreFamilyInfoRetriever alloc], "initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:", v10, 0, v6);
  v12 = -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:](self, "initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:", v10, v11, v7, v6);

  return v12;
}

- (CNUICoreFamilyMemberContactsModelRetriever)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  CNUICoreContactStoreProductionFacade *v8;
  void *v9;
  CNUICoreContactStoreProductionFacade *v10;
  CNUICoreContactStoreProductionFacade *v11;
  id v12;
  CNUICoreContactStoreProductionFacade *v13;
  CNUICoreFamilyInfoRetriever *v14;
  CNUICoreFamilyMemberContactsModelRetriever *v15;

  v6 = a4;
  v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  objc_msgSend(MEMORY[0x1E0C97298], "storeForFamilyMember:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v8, "initWithContactStore:", v9);
  v11 = [CNUICoreContactStoreProductionFacade alloc];
  v12 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v13 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v11, "initWithContactStore:", v12);

  v14 = -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:]([CNUICoreFamilyInfoRetriever alloc], "initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:", v13, 0, v6);
  v15 = -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:](self, "initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:", v10, v14, 0, v6);

  return v15;
}

- (CNUICoreFamilyMemberContactsModelRetriever)initWithContactStoreFacade:(id)a3 familyInfoFetcher:(id)a4 downtimeContainerFetcher:(id)a5 schedulerProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CNUICoreFamilyMemberContactsModelRetriever *v39;
  CNUICoreFamilyMemberContactsModelRetriever *v40;
  CNUICoreFamilyMemberContactsModelRetriever *v41;
  objc_super v43;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_3 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_104);
  v15 = CNGuardOSLog_cn_once_object_0_3;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);
    if (v12)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v12)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_3 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_104);
  v23 = CNGuardOSLog_cn_once_object_0_3;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);
LABEL_10:
  if (!v14)
  {
    if (CNGuardOSLog_cn_once_token_0_3 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_104);
    v31 = CNGuardOSLog_cn_once_object_0_3;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);
  }
  v43.receiver = self;
  v43.super_class = (Class)CNUICoreFamilyMemberContactsModelRetriever;
  v39 = -[CNUICoreFamilyMemberContactsModelRetriever init](&v43, sel_init);
  v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_contactStore, a3);
    objc_storeStrong((id *)&v40->_familyInfoFetcher, a4);
    objc_storeStrong((id *)&v40->_downtimeContainerFetcher, a5);
    objc_storeStrong((id *)&v40->_schedulerProvider, a6);
    v41 = v40;
  }

  return v40;
}

- (CNScheduler)backgroundOrImmediateScheduler
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[CNUICoreFamilyMemberContactsModelRetriever schedulerProvider](self, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "backgroundScheduler");
  else
    objc_msgSend(v4, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNScheduler *)v6;
}

- (id)whitelistedContactsModel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  id v10;

  -[CNUICoreFamilyMemberContactsModelRetriever familyInfoFetcher](self, "familyInfoFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsModelRetriever allContacts](self, "allContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = v3;
  v5 = v3;
  -[CNUICoreFamilyMemberContactsModelRetriever schedulerProvider](self, "schedulerProvider", v9, 3221225472, __70__CNUICoreFamilyMemberContactsModelRetriever_whitelistedContactsModel__block_invoke, &unk_1EA603858, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:schedulerProvider:", &v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __70__CNUICoreFamilyMemberContactsModelRetriever_whitelistedContactsModel__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "familyInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelBuilderForWhitelistedContacts:familyInfo:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allContacts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;

  -[CNUICoreFamilyMemberContactsModelRetriever contactStore](self, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D13A68];
  v10 = MEMORY[0x1E0C809B0];
  v11 = v3;
  v5 = v3;
  -[CNUICoreFamilyMemberContactsModelRetriever backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler", v10, 3221225472, __57__CNUICoreFamilyMemberContactsModelRetriever_allContacts__block_invoke, &unk_1EA603880, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsModelRetriever schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithBlock:scheduler:schedulerProvider:", &v10, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __57__CNUICoreFamilyMemberContactsModelRetriever_allContacts__block_invoke(uint64_t a1, _QWORD *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = objc_alloc(MEMORY[0x1E0C97210]);
  objc_msgSend((id)objc_opt_class(), "keysToFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithKeysToFetch:", v5);

  objc_msgSend(v6, "setUnifyResults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "downtimeContainerFetcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "downtimeContainerFetcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "downtimeWhitelistContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C968C8], 1008, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v18;
      if (a2)
      {
        v15 = 0;
        *a2 = objc_retainAutorelease(v18);
        goto LABEL_12;
      }
LABEL_11:
      v15 = 0;
      goto LABEL_12;
    }
    v10 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateForContactsInContainerWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v12);

  }
  +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:](CNUICoreContactFetchRequestAccumulator, "resultOfFetchRequest:fromStore:", v6, *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v13, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
      *a2 = objc_retainAutorelease(v16);

    goto LABEL_11;
  }
  objc_msgSend(v13, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v15;
}

- (id)modelBuilderForWhitelistedContacts:(id)a3 familyInfo:(id)a4
{
  void *v4;

  -[CNUICoreFamilyMemberContactsModelRetriever modelBuilderForContacts:familyInfo:](self, "modelBuilderForContacts:familyInfo:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeWhitelistedContactsOnly:", 1);
  return v4;
}

- (id)modelBuilderForContacts:(id)a3 familyInfo:(id)a4
{
  id v5;
  id v6;
  CNUICoreFamilyMemberContactsModelBuilder *v7;
  CNUICoreContactTypeAssessor *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CNUICoreFamilyMemberContactsModelBuilder);
  -[CNUICoreFamilyMemberContactsModelBuilder setContacts:](v7, "setContacts:", v6);

  v8 = -[CNUICoreContactTypeAssessor initWithFamilyInfoFuture:]([CNUICoreContactTypeAssessor alloc], "initWithFamilyInfoFuture:", v5);
  -[CNUICoreFamilyMemberContactsModelBuilder setContactTypeAssessor:](v7, "setContactTypeAssessor:", v8);

  -[CNUICoreFamilyMemberContactsModelBuilder setContactFormatterStyle:](v7, "setContactFormatterStyle:", +[CNUICoreFamilyMemberContactsModelRetriever contactFormatterStyle](CNUICoreFamilyMemberContactsModelRetriever, "contactFormatterStyle"));
  -[CNUICoreFamilyMemberContactsModelBuilder setSortItemsByName:](v7, "setSortItemsByName:", 1);
  return v7;
}

- (id)allContactsModel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  id v10;

  -[CNUICoreFamilyMemberContactsModelRetriever familyInfoFetcher](self, "familyInfoFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsModelRetriever allContacts](self, "allContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = v3;
  v5 = v3;
  -[CNUICoreFamilyMemberContactsModelRetriever schedulerProvider](self, "schedulerProvider", v9, 3221225472, __62__CNUICoreFamilyMemberContactsModelRetriever_allContactsModel__block_invoke, &unk_1EA603858, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:schedulerProvider:", &v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __62__CNUICoreFamilyMemberContactsModelRetriever_allContactsModel__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "familyInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelBuilderForContacts:familyInfo:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CNUICoreContactStoreFacade)contactStore
{
  return self->_contactStore;
}

- (CNUICoreFamilyInfoFetching)familyInfoFetcher
{
  return self->_familyInfoFetcher;
}

- (CNDowntimeWhitelistContainerFetching)downtimeContainerFetcher
{
  return self->_downtimeContainerFetcher;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_downtimeContainerFetcher, 0);
  objc_storeStrong((id *)&self->_familyInfoFetcher, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)initWithContactStoreFacade:(uint64_t)a3 familyInfoFetcher:(uint64_t)a4 downtimeContainerFetcher:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘schedulerProvider’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithContactStoreFacade:(uint64_t)a3 familyInfoFetcher:(uint64_t)a4 downtimeContainerFetcher:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘familyInfoFetcher’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
