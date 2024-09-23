@implementation CNUICoreFamilyInfoRetriever

+ (NSArray)keysToFetch
{
  return +[CNUICoreContactTypeAssessor keysToFetch](CNUICoreContactTypeAssessor, "keysToFetch");
}

- (CNUICoreFamilyInfoRetriever)init
{
  CNUICoreFamilyInfoRetriever *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyInfoRetriever)initWithMainContactStoreFacade:(id)a3 matchFamilyMembersWithContacts:(BOOL)a4 schedulerProvider:(id)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  CNUICoreFamilyInfoRetriever *v12;

  v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E0D20EB0];
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  objc_msgSend(v11, "setPromptUserToResolveAuthenticatonFailure:", 0);
  v12 = -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:fetchFamilyCircleRequest:matchFamilyMembersWithContacts:schedulerProvider:](self, "initWithMainContactStoreFacade:fetchFamilyCircleRequest:matchFamilyMembersWithContacts:schedulerProvider:", v10, v11, v5, v9);

  return v12;
}

- (CNUICoreFamilyInfoRetriever)initWithMainContactStoreFacade:(id)a3 fetchFamilyCircleRequest:(id)a4 matchFamilyMembersWithContacts:(BOOL)a5 schedulerProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CNUICoreFamilyInfoRetriever *v38;
  CNUICoreFamilyInfoRetriever *v39;
  CNUICoreFamilyInfoRetriever *v40;
  objc_super v42;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_12 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_12, &__block_literal_global_124);
  v14 = CNGuardOSLog_cn_once_object_0_12;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_12, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:fetchFamilyCircleRequest:matchFamilyMembersWithContacts:schedulerProvider:].cold.3(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v12)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v12)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_12 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_12, &__block_literal_global_124);
  v22 = CNGuardOSLog_cn_once_object_0_12;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_12, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:fetchFamilyCircleRequest:matchFamilyMembersWithContacts:schedulerProvider:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
LABEL_10:
  if (!v13)
  {
    if (CNGuardOSLog_cn_once_token_0_12 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_12, &__block_literal_global_124);
    v30 = CNGuardOSLog_cn_once_object_0_12;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_12, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
  }
  v42.receiver = self;
  v42.super_class = (Class)CNUICoreFamilyInfoRetriever;
  v38 = -[CNUICoreFamilyInfoRetriever init](&v42, sel_init);
  v39 = v38;
  if (v38)
  {
    objc_storeStrong((id *)&v38->_mainContactStore, a3);
    objc_storeStrong((id *)&v39->_fetchFamilyCircleRequest, a4);
    v39->_matchFamilyMembersWithContacts = a5;
    objc_storeStrong((id *)&v39->_schedulerProvider, a6);
    v40 = v39;
  }

  return v39;
}

- (id)familyInfo
{
  cn_objectResultWithObjectLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__CNUICoreFamilyInfoRetriever_familyInfo__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[5];
  if (!v3)
  {
    objc_msgSend(v2, "createFamilyFuture");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return v3;
}

- (id)createFamilyFuture
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = -[CNUICoreFamilyInfoRetriever matchFamilyMembersWithContacts](self, "matchFamilyMembersWithContacts");
  -[CNUICoreFamilyInfoRetriever schedulerProvider](self, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyInfoRetriever mainContactStore](self, "mainContactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "meContactFromStore:schedulerProvider:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)objc_opt_class();
  -[CNUICoreFamilyInfoRetriever fetchFamilyCircleRequest](self, "fetchFamilyCircleRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "familyCircleFromRequest:schedulerProvider:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13A68], "join:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__CNUICoreFamilyInfoRetriever_createFamilyFuture__block_invoke;
  v15[3] = &unk_1EA6048E0;
  v17 = v3;
  v16 = v5;
  v12 = v5;
  objc_msgSend(v11, "flatMap:schedulerProvider:", v15, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __49__CNUICoreFamilyInfoRetriever_createFamilyFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {

    v4 = 0;
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {

    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  v8 = (void *)MEMORY[0x1E0D13A68];
  if (*(_BYTE *)(a1 + 40))
    +[CNUICoreFamilyInfoRetriever familyInfoWithFamilyMembers:meContact:matchedWithContactsInContactStore:](CNUICoreFamilyInfoRetriever, "familyInfoWithFamilyMembers:meContact:matchedWithContactsInContactStore:", v6, v4, *(_QWORD *)(a1 + 32));
  else
    +[CNUICoreFamilyInfoRetriever familyInfoWithFamilyMembers:meContact:](CNUICoreFamilyInfoRetriever, "familyInfoWithFamilyMembers:meContact:", v6, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)meContactFromStore:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    objc_msgSend(v6, "backgroundScheduler");
  else
    objc_msgSend(v6, "immediateScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__CNUICoreFamilyInfoRetriever_meContactFromStore_schedulerProvider___block_invoke;
  v13[3] = &unk_1EA604908;
  v14 = v5;
  v9 = v5;
  objc_msgSend(v8, "futureWithBlock:scheduler:schedulerProvider:", v13, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recover:schedulerProvider:", &__block_literal_global_41, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __68__CNUICoreFamilyInfoRetriever_meContactFromStore_schedulerProvider___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v10;

  v3 = *(void **)(a1 + 32);
  +[CNUICoreFamilyInfoRetriever keysToFetch](CNUICoreFamilyInfoRetriever, "keysToFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2 && !v7)
    *a2 = objc_retainAutorelease(v6);

  return v8;
}

id __68__CNUICoreFamilyInfoRetriever_meContactFromStore_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logFetchingMeError:", v2);

  v4 = (void *)MEMORY[0x1E0D13A68];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)familyCircleFromRequest:(id)a3 schedulerProvider:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0D13B20];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithSchedulerProvider:", v6);
  objc_msgSend(v8, "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startRequestWithCompletionHandler:", v9);

  objc_msgSend(v8, "future");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recover:schedulerProvider:", &__block_literal_global_25_0, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __73__CNUICoreFamilyInfoRetriever_familyCircleFromRequest_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logFetchingFamilyCircleError:", v2);

  v4 = (void *)MEMORY[0x1E0D13A68];
  v5 = objc_alloc_init(MEMORY[0x1E0D20E88]);
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)familyInfoWithFamilyMembers:(id)a3 meContact:(id)a4
{
  id v5;
  void *v6;
  CNUICoreFamilyInfo *v7;

  v5 = a4;
  objc_msgSend(a3, "_cn_map:", &__block_literal_global_28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNUICoreFamilyInfo initWithMeContact:elements:]([CNUICoreFamilyInfo alloc], "initWithMeContact:elements:", v5, v6);

  return v7;
}

CNUICoreFamilyElement *__69__CNUICoreFamilyInfoRetriever_familyInfoWithFamilyMembers_meContact___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNUICoreFamilyElement *v3;
  CNUICoreFamilyElement *v4;

  v2 = a2;
  v3 = [CNUICoreFamilyElement alloc];
  v4 = -[CNUICoreFamilyElement initWithFamilyMember:matchingContacts:](v3, "initWithFamilyMember:matchingContacts:", v2, MEMORY[0x1E0C9AA60]);

  return v4;
}

+ (id)familyInfoWithFamilyMembers:(id)a3 meContact:(id)a4 matchedWithContactsInContactStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CNUICoreFamilyInfo *v12;
  CNUICoreFamilyInfo *v13;
  uint64_t v15;
  uint64_t v16;
  CNUICoreFamilyElement *(*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v8 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __103__CNUICoreFamilyInfoRetriever_familyInfoWithFamilyMembers_meContact_matchedWithContactsInContactStore___block_invoke;
  v18 = &unk_1EA604970;
  v19 = v8;
  v20 = a1;
  v9 = v8;
  v10 = a4;
  objc_msgSend(a3, "_cn_map:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [CNUICoreFamilyInfo alloc];
  v13 = -[CNUICoreFamilyInfo initWithMeContact:elements:](v12, "initWithMeContact:elements:", v10, v11, v15, v16, v17, v18);

  return v13;
}

CNUICoreFamilyElement *__103__CNUICoreFamilyInfoRetriever_familyInfoWithFamilyMembers_meContact_matchedWithContactsInContactStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNUICoreFamilyElement *v4;
  void *v5;
  CNUICoreFamilyElement *v6;

  v3 = a2;
  v4 = [CNUICoreFamilyElement alloc];
  objc_msgSend(*(id *)(a1 + 40), "contactsMatchingFamilyMember:inContactStore:", v3, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNUICoreFamilyElement initWithFamilyMember:matchingContacts:](v4, "initWithFamilyMember:matchingContacts:", v3, v5);

  return v6;
}

+ (id)contactsMatchingFamilyMember:(id)a3 inContactStore:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (objc_class *)MEMORY[0x1E0C97210];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  +[CNUICoreFamilyInfoRetriever keysToFetch](CNUICoreFamilyInfoRetriever, "keysToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKeysToFetch:", v9);

  objc_msgSend(v10, "setUnifyResults:", 0);
  v11 = (void *)MEMORY[0x1E0C97200];
  +[CNUICoreContactMatcher nameFromFammilyMember:](CNUICoreContactMatcher, "nameFromFammilyMember:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "predicateForContactsMatchingName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v13);

  +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:](CNUICoreContactFetchRequestAccumulator, "resultOfFetchRequest:fromStore:", v10, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isSuccess"))
  {
    objc_msgSend(v14, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (CNUICoreContactStoreFacade)mainContactStore
{
  return self->_mainContactStore;
}

- (FAFetchFamilyCircleRequest)fetchFamilyCircleRequest
{
  return self->_fetchFamilyCircleRequest;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (BOOL)matchFamilyMembersWithContacts
{
  return self->_matchFamilyMembersWithContacts;
}

- (CNFuture)familyFuture
{
  return self->_familyFuture;
}

- (void)setFamilyFuture:(id)a3
{
  objc_storeStrong((id *)&self->_familyFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyFuture, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_fetchFamilyCircleRequest, 0);
  objc_storeStrong((id *)&self->_mainContactStore, 0);
}

- (void)initWithMainContactStoreFacade:(uint64_t)a3 fetchFamilyCircleRequest:(uint64_t)a4 matchFamilyMembersWithContacts:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘fetchFamilyCircleRequest’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMainContactStoreFacade:(uint64_t)a3 fetchFamilyCircleRequest:(uint64_t)a4 matchFamilyMembersWithContacts:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘mainContactStore’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
