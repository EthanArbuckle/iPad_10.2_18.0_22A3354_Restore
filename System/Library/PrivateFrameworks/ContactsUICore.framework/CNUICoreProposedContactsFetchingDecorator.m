@implementation CNUICoreProposedContactsFetchingDecorator

- (CNUICoreProposedContactsFetchingDecorator)initWithModelFetcher:(id)a3 familyMember:(id)a4 schedulerProvider:(id)a5
{
  id v7;
  id v8;
  CNUICoreContactStoreProductionFacade *v9;
  id v10;
  CNUICoreContactStoreProductionFacade *v11;
  CNUICoreFamilyInfoRetriever *v12;
  CNUICoreProposedContactsFetchingDecorator *v13;

  v7 = a5;
  v8 = a3;
  v9 = [CNUICoreContactStoreProductionFacade alloc];
  v10 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v11 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v9, "initWithContactStore:", v10);

  v12 = -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:]([CNUICoreFamilyInfoRetriever alloc], "initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:", v11, 1, v7);
  v13 = -[CNUICoreProposedContactsFetchingDecorator initWithModelFetcher:familyInfoFetcher:schedulerProvider:](self, "initWithModelFetcher:familyInfoFetcher:schedulerProvider:", v8, v12, v7);

  return v13;
}

- (CNUICoreProposedContactsFetchingDecorator)initWithModelFetcher:(id)a3 familyInfoFetcher:(id)a4 schedulerProvider:(id)a5
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
  CNUICoreProposedContactsFetchingDecorator *v36;
  CNUICoreProposedContactsFetchingDecorator *v37;
  CNUICoreProposedContactsFetchingDecorator *v38;
  objc_super v40;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_23 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_23, &__block_literal_global_83);
  v12 = CNGuardOSLog_cn_once_object_0_23;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_23, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreProposedContactsFetchingDecorator initWithModelFetcher:familyInfoFetcher:schedulerProvider:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
    if (v10)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v10)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_23 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_23, &__block_literal_global_83);
  v20 = CNGuardOSLog_cn_once_object_0_23;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_23, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_10:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_23 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_23, &__block_literal_global_83);
    v28 = CNGuardOSLog_cn_once_object_0_23;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_23, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
  }
  v40.receiver = self;
  v40.super_class = (Class)CNUICoreProposedContactsFetchingDecorator;
  v36 = -[CNUICoreProposedContactsFetchingDecorator init](&v40, sel_init);
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_modelFetcher, a3);
    objc_storeStrong((id *)&v37->_familyInfoFetcher, a4);
    objc_storeStrong((id *)&v37->_schedulerProvider, a5);
    v38 = v37;
  }

  return v37;
}

- (id)allContactsModel
{
  void *v2;
  void *v3;

  -[CNUICoreProposedContactsFetchingDecorator modelFetcher](self, "modelFetcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allContactsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)whitelistedContactsModel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[CNUICoreProposedContactsFetchingDecorator modelFetcher](self, "modelFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "whitelistedContactsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreProposedContactsFetchingDecorator familyInfoFetcher](self, "familyInfoFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__CNUICoreProposedContactsFetchingDecorator_whitelistedContactsModel__block_invoke;
  v10[3] = &unk_1EA6056F8;
  v11 = v5;
  v6 = v5;
  -[CNUICoreProposedContactsFetchingDecorator schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:schedulerProvider:", v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __69__CNUICoreProposedContactsFetchingDecorator_whitelistedContactsModel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNUICoreFamilyMemberContactsModel *v13;
  void *v14;

  v3 = a2;
  v4 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v3, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "familyInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNUICoreProposedContactsFetchingDecorator modelWithProposedContactsFromFamilyInfo:](CNUICoreProposedContactsFetchingDecorator, "modelWithProposedContactsFromFamilyInfo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0D13A68];
    v13 = -[CNUICoreFamilyMemberContactsModel initWithItems:]([CNUICoreFamilyMemberContactsModel alloc], "initWithItems:", v11);
    objc_msgSend(v12, "futureWithResult:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)modelWithProposedContactsFromFamilyInfo:(id)a3
{
  id v4;
  CNUICoreFamilyMemberContactsModelBuilder *v5;
  void *v6;
  CNUICoreContactTypeAssessor *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(CNUICoreFamilyMemberContactsModelBuilder);
  objc_msgSend(a1, "proposedContactsFromFamilyInfo:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsModelBuilder setContacts:](v5, "setContacts:", v6);

  v7 = -[CNUICoreContactTypeAssessor initWithFamilyInfo:]([CNUICoreContactTypeAssessor alloc], "initWithFamilyInfo:", v4);
  -[CNUICoreFamilyMemberContactsModelBuilder setContactTypeAssessor:](v5, "setContactTypeAssessor:", v7);

  -[CNUICoreFamilyMemberContactsModelBuilder setContactFormatterStyle:](v5, "setContactFormatterStyle:", +[CNUICoreFamilyMemberContactsModelRetriever contactFormatterStyle](CNUICoreFamilyMemberContactsModelRetriever, "contactFormatterStyle"));
  -[CNUICoreFamilyMemberContactsModelBuilder setSortItemsByName:](v5, "setSortItemsByName:", 1);
  -[CNUICoreFamilyMemberContactsModelBuilder setMarkItemsAsProposed:](v5, "setMarkItemsAsProposed:", 1);
  -[CNUICoreFamilyMemberContactsModelBuilder setMarkItemsAsPersisted:](v5, "setMarkItemsAsPersisted:", 0);
  -[CNUICoreFamilyMemberContactsModelBuilder build](v5, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)proposedContactsFromFamilyInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "meContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  v7 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v3, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v3, "elements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_cn_filter:", &__block_literal_global_12_2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_cn_compactMap:", &__block_literal_global_76);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v11);

  }
  return v4;
}

- (CNUICoreFamilyMemberContactsModelFetching)modelFetcher
{
  return self->_modelFetcher;
}

- (CNUICoreFamilyInfoFetching)familyInfoFetcher
{
  return self->_familyInfoFetcher;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_familyInfoFetcher, 0);
  objc_storeStrong((id *)&self->_modelFetcher, 0);
}

- (void)initWithModelFetcher:(uint64_t)a3 familyInfoFetcher:(uint64_t)a4 schedulerProvider:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘modelFetcher’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
