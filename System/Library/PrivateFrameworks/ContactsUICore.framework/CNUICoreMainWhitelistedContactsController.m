@implementation CNUICoreMainWhitelistedContactsController

+ (id)controllerWithOptions:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  CNUICoreContactStoreProductionFacade *v8;
  id v9;
  CNUICoreContactStoreProductionFacade *v10;
  CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *v11;
  CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *v12;

  v6 = a4;
  v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  v9 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v10 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v8, "initWithContactStore:", v9);

  v11 = (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)objc_msgSend(objc_alloc((Class)a1), "initWiththOptions:mainContactStoreFacade:schedulerProvider:", v7, v10, v6);
  LODWORD(v9) = objc_msgSend(v7, "shouldRequireConfirmationOfChanges");

  if ((_DWORD)v9)
  {
    v12 = -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:schedulerProvider:]([CNUICoreInMemoryWhitelistedContactsDataSourceDecorator alloc], "initWithDataSource:schedulerProvider:", v11, v6);

    v11 = v12;
  }

  return v11;
}

- (CNUICoreMainWhitelistedContactsController)init
{
  CNUICoreMainWhitelistedContactsController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreMainWhitelistedContactsController)initWiththOptions:(id)a3 mainContactStoreFacade:(id)a4 schedulerProvider:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  CNUICoreFamilyMemberContactsModelRetriever *v13;
  int v14;
  CNUICoreFamilyInfoRetriever *v15;
  CNUICoreProposedContactsFetchingDecorator *v16;
  CNUICoreMainWhitelistedContactsController *v17;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C972E0];
  v11 = a3;
  v12 = objc_alloc_init(v10);
  v13 = -[CNUICoreFamilyMemberContactsModelRetriever initWithDowntimeContainerFetcher:schedulerProvider:]([CNUICoreFamilyMemberContactsModelRetriever alloc], "initWithDowntimeContainerFetcher:schedulerProvider:", v12, v9);
  v14 = objc_msgSend(v11, "shouldPrepopulateEmptyWhitelist");

  if (v14)
  {
    v15 = -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:]([CNUICoreFamilyInfoRetriever alloc], "initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:", v8, 1, v9);
    v16 = -[CNUICoreProposedContactsFetchingDecorator initWithModelFetcher:familyInfoFetcher:schedulerProvider:]([CNUICoreProposedContactsFetchingDecorator alloc], "initWithModelFetcher:familyInfoFetcher:schedulerProvider:", v13, v15, v9);

    v13 = (CNUICoreFamilyMemberContactsModelRetriever *)v16;
  }
  v17 = -[CNUICoreMainWhitelistedContactsController initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:](self, "initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:", v13, v8, v12, v9);

  return v17;
}

- (CNUICoreMainWhitelistedContactsController)initWithModelFetcher:(id)a3 mainContactStoreFacade:(id)a4 downtimeContainerFetcher:(id)a5 schedulerProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNUICoreMainWhitelistedContactsController *v15;
  CNUICoreMainWhitelistedContactsController *v16;
  NSArray *familyMemberContactItems;
  CNUICoreMainWhitelistedContactsController *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_19 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_19, &__block_literal_global_171);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_19, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.5();
    if (v12)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v12)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_19 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_19, &__block_literal_global_171);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_19, OS_LOG_TYPE_FAULT))
    -[CNUICoreMainWhitelistedContactsController initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:].cold.3();
  if (v13)
    goto LABEL_14;
LABEL_10:
  if (CNGuardOSLog_cn_once_token_0_19 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_19, &__block_literal_global_171);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_19, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreMainWhitelistedContactsController initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:].cold.2();
    if (v14)
      goto LABEL_19;
  }
  else
  {
LABEL_14:
    if (v14)
      goto LABEL_19;
  }
  if (CNGuardOSLog_cn_once_token_0_19 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_19, &__block_literal_global_171);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_19, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.1();
LABEL_19:
  v20.receiver = self;
  v20.super_class = (Class)CNUICoreMainWhitelistedContactsController;
  v15 = -[CNUICoreMainWhitelistedContactsController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelFetcher, a3);
    objc_storeStrong((id *)&v16->_mainContactStoreFacade, a4);
    objc_storeStrong((id *)&v16->_downtimeContainerFetcher, a5);
    objc_storeStrong((id *)&v16->_schedulerProvider, a6);
    familyMemberContactItems = v16->_familyMemberContactItems;
    v16->_familyMemberContactItems = (NSArray *)MEMORY[0x1E0C9AA60];

    -[CNUICoreMainWhitelistedContactsController setupChangeNotificationResponse](v16, "setupChangeNotificationResponse");
    v18 = v16;
  }

  return v16;
}

- (void)setupChangeNotificationResponse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNCancelable *v10;
  CNCancelable *contactStoreDidChangeToken;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v3 = (void *)MEMORY[0x1E0D13AE8];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observableOnNotificationCenter:withName:object:", v4, *MEMORY[0x1E0C96870], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNSchedulerProvider mainThreadScheduler](self->_schedulerProvider, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observeOn:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0D13AF0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __76__CNUICoreMainWhitelistedContactsController_setupChangeNotificationResponse__block_invoke;
  v15 = &unk_1EA6043A0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v8, "observerWithResultBlock:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", v9, v12, v13, v14, v15);
  v10 = (CNCancelable *)objc_claimAutoreleasedReturnValue();
  contactStoreDidChangeToken = self->_contactStoreDidChangeToken;
  self->_contactStoreDidChangeToken = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __76__CNUICoreMainWhitelistedContactsController_setupChangeNotificationResponse__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "triggerContactItemsFetch");

}

- (void)dealloc
{
  objc_super v3;

  -[CNUICoreMainWhitelistedContactsController cancelContactItemsFetch](self, "cancelContactItemsFetch");
  -[CNCancelable cancel](self->_contactStoreDidChangeToken, "cancel");
  -[CNFuture cancel](self->_addContactsToWhitelistFuture, "cancel");
  -[CNFuture cancel](self->_updateContactsInWhitelistFuture, "cancel");
  -[CNFuture cancel](self->_deleteContactsFromWhitelistFuture, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CNUICoreMainWhitelistedContactsController;
  -[CNUICoreMainWhitelistedContactsController dealloc](&v3, sel_dealloc);
}

- (CNScheduler)backgroundOrImmediateScheduler
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[CNUICoreMainWhitelistedContactsController schedulerProvider](self, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "backgroundScheduler");
  else
    objc_msgSend(v4, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNScheduler *)v6;
}

- (int64_t)fetchStatus
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[CNUICoreMainWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNUICoreMainWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if (!v5)
    return 2;
  -[CNUICoreMainWhitelistedContactsController downtimeContainerFetcher](self, "downtimeContainerFetcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downtimeWhitelistContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 3;
  else
    return 1;
}

- (NSArray)familyMemberContactItems
{
  void *v3;

  -[CNUICoreMainWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNUICoreMainWhitelistedContactsController triggerContactItemsFetch](self, "triggerContactItemsFetch");
  return self->_familyMemberContactItems;
}

- (BOOL)familyMemberContainerIsEmpty
{
  return 0;
}

- (BOOL)hasDowntimeWhitelistContainer
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNUICoreMainWhitelistedContactsController downtimeContainerFetcher](self, "downtimeContainerFetcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downtimeWhitelistContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setFamilyMemberContactItems:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_familyMemberContactItems, a3);
  -[CNUICoreMainWhitelistedContactsController observer](self, "observer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyMemberContactItemsDidChange");

}

- (void)triggerContactItemsFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id location;

  -[CNUICoreMainWhitelistedContactsController cancelContactItemsFetch](self, "cancelContactItemsFetch");
  -[CNUICoreMainWhitelistedContactsController contactItemFutureFromFetcher](self, "contactItemFutureFromFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreMainWhitelistedContactsController setFamilyMemberContactItemsFuture:](self, "setFamilyMemberContactItemsFuture:", v3);

  objc_initWeak(&location, self);
  -[CNUICoreMainWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v8, &location);
  -[CNUICoreMainWhitelistedContactsController schedulerProvider](self, "schedulerProvider", v7, 3221225472, __69__CNUICoreMainWhitelistedContactsController_triggerContactItemsFetch__block_invoke, &unk_1EA6043C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSuccessBlock:scheduler:", &v7, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __69__CNUICoreMainWhitelistedContactsController_triggerContactItemsFetch__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setFamilyMemberContactItems:", v3);

}

- (void)cancelContactItemsFetch
{
  void *v3;

  -[CNUICoreMainWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNUICoreMainWhitelistedContactsController setFamilyMemberContactItemsFuture:](self, "setFamilyMemberContactItemsFuture:", 0);
}

- (id)contactItemFutureFromFetcher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNUICoreMainWhitelistedContactsController modelFetcher](self, "modelFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "whitelistedContactsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreMainWhitelistedContactsController schedulerProvider](self, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:schedulerProvider:", &__block_literal_global_67, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __73__CNUICoreMainWhitelistedContactsController_contactItemFutureFromFetcher__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13A68];
  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateWhitelistByAddingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    -[CNUICoreMainWhitelistedContactsController addContactsToWhitelistFuture](self, "addContactsToWhitelistFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

    v6 = (void *)MEMORY[0x1E0D13A68];
    v9 = MEMORY[0x1E0C809B0];
    v10 = v4;
    -[CNUICoreMainWhitelistedContactsController backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler", v9, 3221225472, __77__CNUICoreMainWhitelistedContactsController_updateWhitelistByAddingContacts___block_invoke, &unk_1EA603880, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithBlock:scheduler:", &v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreMainWhitelistedContactsController setAddContactsToWhitelistFuture:](self, "setAddContactsToWhitelistFuture:", v8);

  }
}

id __77__CNUICoreMainWhitelistedContactsController_updateWhitelistByAddingContacts___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "downtimeContainerFetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downtimeWhitelistContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_cn_filter:", &__block_literal_global_22_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C968C8], 1008, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a2)
        *a2 = objc_retainAutorelease(v17);

      goto LABEL_17;
    }
    +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByAddingContacts:toContainer:](CNUICoreFamilyMemberSaveRequestFactory, "saveRequestToUpdateContactListByAddingContacts:toContainer:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mainContactStoreFacade");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v8 = objc_msgSend(v10, "executeSaveRequest:error:", v9, &v21);
    v7 = v21;

  }
  objc_msgSend(*(id *)(a1 + 32), "mainContactStoreFacade");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToupdateContactWhitelistByAddingContacts:](CNUICoreFamilyMemberSaveRequestFactory, "saveRequestToupdateContactWhitelistByAddingContacts:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  v13 = objc_msgSend(v11, "executeSaveRequest:error:", v12, &v20);
  v14 = v20;

  if (!v8 || !v13)
  {
    if (a2)
      *a2 = objc_retainAutorelease(v14);

LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  v15 = *(id *)(a1 + 40);
  v16 = v15;
  if (a2 && !v15)
    *a2 = objc_retainAutorelease(v14);

LABEL_18:
  return v16;
}

uint64_t __77__CNUICoreMainWhitelistedContactsController_updateWhitelistByAddingContacts___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasBeenPersisted") ^ 1;
}

- (void)updateWhitelistByUpdatingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    -[CNUICoreMainWhitelistedContactsController updateContactsInWhitelistFuture](self, "updateContactsInWhitelistFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

    v6 = (void *)MEMORY[0x1E0D13A68];
    v9 = MEMORY[0x1E0C809B0];
    v10 = v4;
    -[CNUICoreMainWhitelistedContactsController backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler", v9, 3221225472, __79__CNUICoreMainWhitelistedContactsController_updateWhitelistByUpdatingContacts___block_invoke, &unk_1EA603880, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithBlock:scheduler:", &v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreMainWhitelistedContactsController setUpdateContactsInWhitelistFuture:](self, "setUpdateContactsInWhitelistFuture:", v8);

  }
}

id __79__CNUICoreMainWhitelistedContactsController_updateWhitelistByUpdatingContacts___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "mainContactStoreFacade");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByUpdatingContacts:](CNUICoreFamilyMemberSaveRequestFactory, "saveRequestToUpdateContactListByUpdatingContacts:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v4, "executeSaveRequest:error:", v5, &v11);
  v7 = v11;

  if (!v6)
  {
    v9 = 0;
    if (!a2)
      goto LABEL_7;
LABEL_6:
    *a2 = objc_retainAutorelease(v7);
    goto LABEL_7;
  }
  v8 = *(id *)(a1 + 40);
  v9 = v8;
  if (a2 && !v8)
    goto LABEL_6;
LABEL_7:

  return v9;
}

- (void)updateWhitelistByRemovingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    -[CNUICoreMainWhitelistedContactsController deleteContactsFromWhitelistFuture](self, "deleteContactsFromWhitelistFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

    v6 = (void *)MEMORY[0x1E0D13A68];
    v9 = MEMORY[0x1E0C809B0];
    v10 = v4;
    -[CNUICoreMainWhitelistedContactsController backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler", v9, 3221225472, __79__CNUICoreMainWhitelistedContactsController_updateWhitelistByRemovingContacts___block_invoke, &unk_1EA603880, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithBlock:scheduler:", &v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreMainWhitelistedContactsController setDeleteContactsFromWhitelistFuture:](self, "setDeleteContactsFromWhitelistFuture:", v8);

  }
}

id __79__CNUICoreMainWhitelistedContactsController_updateWhitelistByRemovingContacts___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "mainContactStoreFacade");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactWhitelistByRemovingContacts:](CNUICoreFamilyMemberSaveRequestFactory, "saveRequestToUpdateContactWhitelistByRemovingContacts:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v4, "executeSaveRequest:error:", v5, &v11);
  v7 = v11;

  if (!v6)
  {
    v9 = 0;
    if (!a2)
      goto LABEL_7;
LABEL_6:
    *a2 = objc_retainAutorelease(v7);
    goto LABEL_7;
  }
  v8 = *(id *)(a1 + 40);
  v9 = v8;
  if (a2 && !v8)
    goto LABEL_6;
LABEL_7:

  return v9;
}

- (id)contactRepresentingItem:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
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
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C97210];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0C97248], "keyVectorWithAllKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v8);

  v10 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v5, "contactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForContactsWithIdentifiers:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v13);

  objc_msgSend(v9, "setUnifyResults:", 0);
  -[CNUICoreMainWhitelistedContactsController mainContactStoreFacade](self, "mainContactStoreFacade");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:](CNUICoreContactFetchRequestAccumulator, "resultOfFetchRequest:fromStore:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "isSuccess"))
  {
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CNUICoreFamilyMemberContactsObserver)observer
{
  return (CNUICoreFamilyMemberContactsObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (CNUICoreFamilyMemberContactsModelFetching)modelFetcher
{
  return self->_modelFetcher;
}

- (CNUICoreContactStoreFacade)mainContactStoreFacade
{
  return self->_mainContactStoreFacade;
}

- (CNDowntimeWhitelistContainerFetching)downtimeContainerFetcher
{
  return self->_downtimeContainerFetcher;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNFuture)familyMemberContactItemsFuture
{
  return self->_familyMemberContactItemsFuture;
}

- (void)setFamilyMemberContactItemsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_familyMemberContactItemsFuture, a3);
}

- (CNFuture)addContactsToWhitelistFuture
{
  return self->_addContactsToWhitelistFuture;
}

- (void)setAddContactsToWhitelistFuture:(id)a3
{
  objc_storeStrong((id *)&self->_addContactsToWhitelistFuture, a3);
}

- (CNFuture)updateContactsInWhitelistFuture
{
  return self->_updateContactsInWhitelistFuture;
}

- (void)setUpdateContactsInWhitelistFuture:(id)a3
{
  objc_storeStrong((id *)&self->_updateContactsInWhitelistFuture, a3);
}

- (CNFuture)deleteContactsFromWhitelistFuture
{
  return self->_deleteContactsFromWhitelistFuture;
}

- (void)setDeleteContactsFromWhitelistFuture:(id)a3
{
  objc_storeStrong((id *)&self->_deleteContactsFromWhitelistFuture, a3);
}

- (CNCancelable)contactStoreDidChangeToken
{
  return self->_contactStoreDidChangeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeToken, 0);
  objc_storeStrong((id *)&self->_deleteContactsFromWhitelistFuture, 0);
  objc_storeStrong((id *)&self->_updateContactsInWhitelistFuture, 0);
  objc_storeStrong((id *)&self->_addContactsToWhitelistFuture, 0);
  objc_storeStrong((id *)&self->_familyMemberContactItemsFuture, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_downtimeContainerFetcher, 0);
  objc_storeStrong((id *)&self->_mainContactStoreFacade, 0);
  objc_storeStrong((id *)&self->_modelFetcher, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_familyMemberContactItems, 0);
}

- (void)initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘downtimeContainerFetcher’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘mainContactStoreFacade’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
