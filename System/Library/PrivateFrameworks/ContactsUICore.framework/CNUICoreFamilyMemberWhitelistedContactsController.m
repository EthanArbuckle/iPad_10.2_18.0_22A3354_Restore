@implementation CNUICoreFamilyMemberWhitelistedContactsController

+ (NSArray)propertyKeysContainingSenstiveData
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (id)contactByRemovingSensitiveDataFromContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  +[CNUICoreContactPropertyFilterBuilder whitelistedContactsFilterBuilder](CNUICoreContactPropertyFilterBuilder, "whitelistedContactsFilterBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterPropertyValuesFromContact:", v3);
  return v3;
}

+ (id)controllerWithFamilyMember:(id)a3 options:(id)a4 schedulerProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *v11;
  CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)objc_msgSend(objc_alloc((Class)a1), "initWithFamilyMember:options:schedulerProvider:", v10, v9, v8);

  LODWORD(v10) = objc_msgSend(v9, "shouldRequireConfirmationOfChanges");
  if ((_DWORD)v10)
  {
    v12 = -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:schedulerProvider:]([CNUICoreInMemoryWhitelistedContactsDataSourceDecorator alloc], "initWithDataSource:schedulerProvider:", v11, v8);

    v11 = v12;
  }

  return v11;
}

- (CNUICoreFamilyMemberWhitelistedContactsController)init
{
  CNUICoreFamilyMemberWhitelistedContactsController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberWhitelistedContactsController)initWithFamilyMember:(id)a3 options:(id)a4 schedulerProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNUICoreFamilyMemberContactsModelRetriever *v11;
  CNUICoreFamilyMemberContactsStore *v12;
  CNUICoreContactStoreProductionFacade *v13;
  void *v14;
  CNUICoreContactStoreProductionFacade *v15;
  CNUICoreContactStoreProductionFacade *v16;
  id v17;
  CNUICoreContactStoreProductionFacade *v18;
  CNUICoreProposedContactsFetchingDecorator *v19;
  CNUICoreFamilyMemberWhitelistedContactsController *v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = -[CNUICoreFamilyMemberContactsModelRetriever initWithFamilyMember:schedulerProvider:]([CNUICoreFamilyMemberContactsModelRetriever alloc], "initWithFamilyMember:schedulerProvider:", v8, v9);
  v12 = -[CNUICoreFamilyMemberContactsStore initWithFamilyMember:schedulerProvider:]([CNUICoreFamilyMemberContactsStore alloc], "initWithFamilyMember:schedulerProvider:", v8, v9);
  v13 = [CNUICoreContactStoreProductionFacade alloc];
  objc_msgSend(MEMORY[0x1E0C97298], "storeForFamilyMember:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v13, "initWithContactStore:", v14);

  v16 = [CNUICoreContactStoreProductionFacade alloc];
  v17 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v18 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v16, "initWithContactStore:", v17);

  LODWORD(v17) = objc_msgSend(v10, "shouldPrepopulateEmptyWhitelist");
  if ((_DWORD)v17)
  {
    v19 = -[CNUICoreProposedContactsFetchingDecorator initWithModelFetcher:familyMember:schedulerProvider:]([CNUICoreProposedContactsFetchingDecorator alloc], "initWithModelFetcher:familyMember:schedulerProvider:", v11, v8, v9);

    v11 = (CNUICoreFamilyMemberContactsModelRetriever *)v19;
  }
  v20 = -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:](self, "initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:", v11, v12, v15, v18, v9);

  return v20;
}

- (CNUICoreFamilyMemberWhitelistedContactsController)initWithModelFetcher:(id)a3 familyMemberContactsUpdator:(id)a4 familyMemberScopedContactStoreFacade:(id)a5 mainContactStoreFacade:(id)a6 schedulerProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CNUICoreFamilyMemberWhitelistedContactsController *v17;
  CNUICoreFamilyMemberWhitelistedContactsController *v18;
  NSArray *familyMemberContactItems;
  CNUICoreFamilyMemberWhitelistedContactsController *v20;
  id obj;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_8 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_167);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.5();
    if (v13)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v13)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_8 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_167);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.4();
  if (v14)
    goto LABEL_14;
LABEL_10:
  if (CNGuardOSLog_cn_once_token_0_8 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_167);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.3();
    if (v15)
      goto LABEL_19;
  }
  else
  {
LABEL_14:
    if (v15)
      goto LABEL_19;
  }
  if (CNGuardOSLog_cn_once_token_0_8 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_167);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.2();
LABEL_19:
  if (!v16)
  {
    if (CNGuardOSLog_cn_once_token_0_8 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_167);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.1();
  }
  v24.receiver = self;
  v24.super_class = (Class)CNUICoreFamilyMemberWhitelistedContactsController;
  v17 = -[CNUICoreFamilyMemberWhitelistedContactsController init](&v24, sel_init, a7);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modelFetcher, a3);
    objc_storeStrong((id *)&v18->_familyMemberContactsUpdator, a4);
    objc_storeStrong((id *)&v18->_familyMemberScopedContactStore, a5);
    objc_storeStrong((id *)&v18->_mainContactStoreFacade, a6);
    objc_storeStrong((id *)&v18->_schedulerProvider, obj);
    familyMemberContactItems = v18->_familyMemberContactItems;
    v18->_familyMemberContactItems = (NSArray *)MEMORY[0x1E0C9AA60];

    -[CNUICoreFamilyMemberWhitelistedContactsController setupChangeNotificationResponse](v18, "setupChangeNotificationResponse");
    v20 = v18;
  }

  return v18;
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
  v14 = __84__CNUICoreFamilyMemberWhitelistedContactsController_setupChangeNotificationResponse__block_invoke;
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

void __84__CNUICoreFamilyMemberWhitelistedContactsController_setupChangeNotificationResponse__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "triggerContactItemsFetch");

}

- (void)dealloc
{
  objc_super v3;

  -[CNUICoreFamilyMemberWhitelistedContactsController cancelContactItemsFetch](self, "cancelContactItemsFetch");
  -[CNCancelable cancel](self->_contactStoreDidChangeToken, "cancel");
  -[CNFuture cancel](self->_addContactsToWhitelistFuture, "cancel");
  -[CNFuture cancel](self->_updateContactsInWhitelistFuture, "cancel");
  -[CNFuture cancel](self->_deleteContactsFromWhitelistFuture, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CNUICoreFamilyMemberWhitelistedContactsController;
  -[CNUICoreFamilyMemberWhitelistedContactsController dealloc](&v3, sel_dealloc);
}

- (int64_t)fetchStatus
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  int64_t v9;
  id v11;

  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if (!v5)
    return 2;
  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = (id)objc_msgSend(v6, "result:", &v11);
  v8 = v11;

  if (v8)
    v9 = 1;
  else
    v9 = 3;

  return v9;
}

- (NSArray)familyMemberContactItems
{
  void *v3;

  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNUICoreFamilyMemberWhitelistedContactsController triggerContactItemsFetch](self, "triggerContactItemsFetch");
  return self->_familyMemberContactItems;
}

- (BOOL)familyMemberContainerIsEmpty
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CNUICoreFamilyMemberWhitelistedContactsController modelFetcher](self, "modelFetcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allContactsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "result:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  return v6;
}

- (void)setFamilyMemberContactItems:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_familyMemberContactItems, a3);
  -[CNUICoreFamilyMemberWhitelistedContactsController observer](self, "observer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyMemberContactItemsDidChange");

}

- (void)triggerContactItemsFetch
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[CNUICoreFamilyMemberWhitelistedContactsController cancelContactItemsFetch](self, "cancelContactItemsFetch");
  -[CNUICoreFamilyMemberWhitelistedContactsController contactItemFutureFromFetcher](self, "contactItemFutureFromFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberWhitelistedContactsController setFamilyMemberContactItemsFuture:](self, "setFamilyMemberContactItemsFuture:", v3);

  objc_initWeak(&location, self);
  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CNUICoreFamilyMemberWhitelistedContactsController_triggerContactItemsFetch__block_invoke;
  v13[3] = &unk_1EA6043C8;
  objc_copyWeak(&v14, &location);
  -[CNUICoreFamilyMemberWhitelistedContactsController schedulerProvider](self, "schedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSuccessBlock:scheduler:", v13, v7);

  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __77__CNUICoreFamilyMemberWhitelistedContactsController_triggerContactItemsFetch__block_invoke_2;
  v11[3] = &unk_1EA6043F0;
  objc_copyWeak(&v12, &location);
  -[CNUICoreFamilyMemberWhitelistedContactsController schedulerProvider](self, "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addFailureBlock:scheduler:", v11, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__CNUICoreFamilyMemberWhitelistedContactsController_triggerContactItemsFetch__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setFamilyMemberContactItems:", v3);

}

void __77__CNUICoreFamilyMemberWhitelistedContactsController_triggerContactItemsFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = v3;
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C968C8]) & 1) != 0)
    {
      v6 = objc_msgSend(v7, "code");

      if (v6 == 1007)
        goto LABEL_7;
    }
    else
    {

    }
  }
  objc_msgSend(WeakRetained, "setFamilyMemberContactItemsFuture:", 0);
LABEL_7:

}

- (void)cancelContactItemsFetch
{
  void *v3;

  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactItemsFuture](self, "familyMemberContactItemsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNUICoreFamilyMemberWhitelistedContactsController setFamilyMemberContactItemsFuture:](self, "setFamilyMemberContactItemsFuture:", 0);
}

- (id)contactItemFutureFromFetcher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNUICoreFamilyMemberWhitelistedContactsController modelFetcher](self, "modelFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "whitelistedContactsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberWhitelistedContactsController schedulerProvider](self, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:schedulerProvider:", &__block_literal_global_32, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __81__CNUICoreFamilyMemberWhitelistedContactsController_contactItemFutureFromFetcher__block_invoke(uint64_t a1, void *a2)
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
  id v7;

  v4 = a3;
  -[CNUICoreFamilyMemberWhitelistedContactsController addContactsToWhitelistFuture](self, "addContactsToWhitelistFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactsUpdator](self, "familyMemberContactsUpdator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateContactWhitelistByAddingContacts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreFamilyMemberWhitelistedContactsController setAddContactsToWhitelistFuture:](self, "setAddContactsToWhitelistFuture:", v6);
}

- (void)updateWhitelistByUpdatingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNUICoreFamilyMemberWhitelistedContactsController updateContactsInWhitelistFuture](self, "updateContactsInWhitelistFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactsUpdator](self, "familyMemberContactsUpdator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateContactListByUpdatingContacts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreFamilyMemberWhitelistedContactsController setUpdateContactsInWhitelistFuture:](self, "setUpdateContactsInWhitelistFuture:", v6);
}

- (void)updateWhitelistByRemovingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNUICoreFamilyMemberWhitelistedContactsController deleteContactsFromWhitelistFuture](self, "deleteContactsFromWhitelistFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberContactsUpdator](self, "familyMemberContactsUpdator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateContactWhitelistByRemovingContacts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreFamilyMemberWhitelistedContactsController setDeleteContactsFromWhitelistFuture:](self, "setDeleteContactsFromWhitelistFuture:", v6);
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C97210];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0C97248], "keyVectorWithAllKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v8);

  v10 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v5, "contactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForContactsWithIdentifiers:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v13);

  objc_msgSend(v9, "setUnifyResults:", 0);
  -[CNUICoreFamilyMemberWhitelistedContactsController familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:](CNUICoreContactFetchRequestAccumulator, "resultOfFetchRequest:fromStore:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "isSuccess")
    && (v16 = *MEMORY[0x1E0D137F8],
        objc_msgSend(v15, "value"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17),
        v17,
        (v16 & 1) == 0))
  {
    objc_msgSend(v15, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController mainContactStoreFacade](self, "mainContactStoreFacade");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:](CNUICoreContactFetchRequestAccumulator, "resultOfFetchRequest:fromStore:", v9, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "isSuccess"))
    {
      objc_msgSend(v19, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
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

- (CNUICoreFamilyMemberContactsUpdating)familyMemberContactsUpdator
{
  return self->_familyMemberContactsUpdator;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUICoreContactStoreFacade)familyMemberScopedContactStore
{
  return self->_familyMemberScopedContactStore;
}

- (CNUICoreContactStoreFacade)mainContactStoreFacade
{
  return self->_mainContactStoreFacade;
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
  objc_storeStrong((id *)&self->_mainContactStoreFacade, 0);
  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_familyMemberContactsUpdator, 0);
  objc_storeStrong((id *)&self->_modelFetcher, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_familyMemberContactItems, 0);
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘schedulerProvider’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘mainContactStore’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘familyMemberScopedContactStore’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘familyMemberContactsUpdator’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘modelFetcher’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
