@implementation CNUICoreFamilyMemberContactsController

+ (NSArray)propertyKeysContainingSenstiveData
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C96708];
  v5[0] = *MEMORY[0x1E0C967A0];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0C96840];
  v5[2] = *MEMORY[0x1E0C96890];
  v5[3] = v3;
  v5[4] = *MEMORY[0x1E0C967B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)contactByRemovingSensitiveDataFromContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  +[CNUICoreContactPropertyFilterBuilder managedContactsFilterBuilder](CNUICoreContactPropertyFilterBuilder, "managedContactsFilterBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterPropertyValuesFromContact:", v3);
  return v3;
}

- (CNUICoreFamilyMemberContactsController)init
{
  CNUICoreFamilyMemberContactsController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactsController)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  CNUICoreFamilyMemberContactsModelRetriever *v8;
  CNUICoreFamilyMemberContactsStore *v9;
  CNUICoreFamilyMemberContactsController *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CNUICoreFamilyMemberContactsModelRetriever initWithFamilyMember:schedulerProvider:]([CNUICoreFamilyMemberContactsModelRetriever alloc], "initWithFamilyMember:schedulerProvider:", v7, v6);
  v9 = -[CNUICoreFamilyMemberContactsStore initWithFamilyMember:schedulerProvider:]([CNUICoreFamilyMemberContactsStore alloc], "initWithFamilyMember:schedulerProvider:", v7, v6);
  v10 = -[CNUICoreFamilyMemberContactsController initWithFamilyMember:modelFetcher:familyMemberContactsUpdator:schedulerProvider:](self, "initWithFamilyMember:modelFetcher:familyMemberContactsUpdator:schedulerProvider:", v7, v8, v9, v6);

  return v10;
}

- (CNUICoreFamilyMemberContactsController)initWithFamilyMember:(id)a3 modelFetcher:(id)a4 familyMemberContactsUpdator:(id)a5 schedulerProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNUICoreFamilyMemberContactsController *v15;
  CNUICoreFamilyMemberContactsController *v16;
  CNUICoreFamilyMemberContactsController *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_16 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_16, &__block_literal_global_142);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_16, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberContactsStore initWithFamilyMemberScopedContactStoreFacade:familyMember:contactsSyncTrigger:schedulerProvider:].cold.2();
    if (v12)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v12)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_16 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_16, &__block_literal_global_142);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_16, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.5();
  if (v13)
    goto LABEL_14;
LABEL_10:
  if (CNGuardOSLog_cn_once_token_0_16 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_16, &__block_literal_global_142);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_16, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.4();
    if (v14)
      goto LABEL_19;
  }
  else
  {
LABEL_14:
    if (v14)
      goto LABEL_19;
  }
  if (CNGuardOSLog_cn_once_token_0_16 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_16, &__block_literal_global_142);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_16, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.1();
LABEL_19:
  v19.receiver = self;
  v19.super_class = (Class)CNUICoreFamilyMemberContactsController;
  v15 = -[CNUICoreFamilyMemberContactsController init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_familyMember, a3);
    objc_storeStrong((id *)&v16->_modelFetcher, a4);
    objc_storeStrong((id *)&v16->_familyMemberContactsUpdator, a5);
    objc_storeStrong((id *)&v16->_schedulerProvider, a6);
    -[CNUICoreFamilyMemberContactsController setupChangeNotificationResponse](v16, "setupChangeNotificationResponse");
    v17 = v16;
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
  v14 = __73__CNUICoreFamilyMemberContactsController_setupChangeNotificationResponse__block_invoke;
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

void __73__CNUICoreFamilyMemberContactsController_setupChangeNotificationResponse__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "triggerCountOfFamilyMemberContactsFetch");

}

- (void)dealloc
{
  objc_super v3;

  -[CNUICoreFamilyMemberContactsController cancelCountOfFamilyMemberContactsFetch](self, "cancelCountOfFamilyMemberContactsFetch");
  -[CNCancelable cancel](self->_contactStoreDidChangeToken, "cancel");
  -[CNFuture cancel](self->_countOfFamilyMemberContactsFuture, "cancel");
  -[CNFuture cancel](self->_updateContactListByAddingContactsFuture, "cancel");
  -[CNFuture cancel](self->_updateContactListByRemovingContactsFuture, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CNUICoreFamilyMemberContactsController;
  -[CNUICoreFamilyMemberContactsController dealloc](&v3, sel_dealloc);
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

  -[CNUICoreFamilyMemberContactsController countOfFamilyMemberContactsFuture](self, "countOfFamilyMemberContactsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNUICoreFamilyMemberContactsController countOfFamilyMemberContactsFuture](self, "countOfFamilyMemberContactsFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if (!v5)
    return 2;
  -[CNUICoreFamilyMemberContactsController countOfFamilyMemberContactsFuture](self, "countOfFamilyMemberContactsFuture");
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

- (NSNumber)countOfFamilyMemberContacts
{
  void *v3;

  -[CNUICoreFamilyMemberContactsController countOfFamilyMemberContactsFuture](self, "countOfFamilyMemberContactsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNUICoreFamilyMemberContactsController triggerCountOfFamilyMemberContactsFetch](self, "triggerCountOfFamilyMemberContactsFetch");
  return self->_countOfFamilyMemberContacts;
}

- (void)setCountOfFamilyMemberContacts:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_countOfFamilyMemberContacts, a3);
  -[CNUICoreFamilyMemberContactsController observer](self, "observer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyMemberContactItemsDidChange");

}

- (void)triggerCountOfFamilyMemberContactsFetch
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

  -[CNUICoreFamilyMemberContactsController cancelCountOfFamilyMemberContactsFetch](self, "cancelCountOfFamilyMemberContactsFetch");
  -[CNUICoreFamilyMemberContactsController countOfFamilyMemberContactsFutureFromFetcher](self, "countOfFamilyMemberContactsFutureFromFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsController setCountOfFamilyMemberContactsFuture:](self, "setCountOfFamilyMemberContactsFuture:", v3);

  objc_initWeak(&location, self);
  -[CNUICoreFamilyMemberContactsController countOfFamilyMemberContactsFuture](self, "countOfFamilyMemberContactsFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__CNUICoreFamilyMemberContactsController_triggerCountOfFamilyMemberContactsFetch__block_invoke;
  v13[3] = &unk_1EA604E50;
  objc_copyWeak(&v14, &location);
  -[CNUICoreFamilyMemberContactsController schedulerProvider](self, "schedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSuccessBlock:scheduler:", v13, v7);

  -[CNUICoreFamilyMemberContactsController countOfFamilyMemberContactsFuture](self, "countOfFamilyMemberContactsFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __81__CNUICoreFamilyMemberContactsController_triggerCountOfFamilyMemberContactsFetch__block_invoke_2;
  v11[3] = &unk_1EA6043F0;
  objc_copyWeak(&v12, &location);
  -[CNUICoreFamilyMemberContactsController schedulerProvider](self, "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addFailureBlock:scheduler:", v11, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __81__CNUICoreFamilyMemberContactsController_triggerCountOfFamilyMemberContactsFetch__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setCountOfFamilyMemberContacts:", v3);

}

void __81__CNUICoreFamilyMemberContactsController_triggerCountOfFamilyMemberContactsFetch__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "setCountOfFamilyMemberContactsFuture:", 0);
LABEL_7:

}

- (void)cancelCountOfFamilyMemberContactsFetch
{
  void *v3;

  -[CNUICoreFamilyMemberContactsController countOfFamilyMemberContactsFuture](self, "countOfFamilyMemberContactsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNUICoreFamilyMemberContactsController setCountOfFamilyMemberContactsFuture:](self, "setCountOfFamilyMemberContactsFuture:", 0);
}

- (id)countOfFamilyMemberContactsFutureFromFetcher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNUICoreFamilyMemberContactsController modelFetcher](self, "modelFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allContactsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsController schedulerProvider](self, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:schedulerProvider:", &__block_literal_global_54, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __86__CNUICoreFamilyMemberContactsController_countOfFamilyMemberContactsFutureFromFetcher__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D13A68];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateListByAddingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNUICoreFamilyMemberContactsController updateContactListByAddingContactsFuture](self, "updateContactListByAddingContactsFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNUICoreFamilyMemberContactsController familyMemberContactsUpdator](self, "familyMemberContactsUpdator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateContactListByAddingContacts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreFamilyMemberContactsController setUpdateContactListByAddingContactsFuture:](self, "setUpdateContactListByAddingContactsFuture:", v6);
}

- (void)updateListByRemovingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNUICoreFamilyMemberContactsController updateContactListByRemovingContactsFuture](self, "updateContactListByRemovingContactsFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNUICoreFamilyMemberContactsController familyMemberContactsUpdator](self, "familyMemberContactsUpdator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateContactListByRemovingContacts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreFamilyMemberContactsController setUpdateContactListByRemovingContactsFuture:](self, "setUpdateContactListByRemovingContactsFuture:", v6);
}

- (CNUICoreFamilyMemberContactsObserver)observer
{
  return (CNUICoreFamilyMemberContactsObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
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

- (CNFuture)countOfFamilyMemberContactsFuture
{
  return self->_countOfFamilyMemberContactsFuture;
}

- (void)setCountOfFamilyMemberContactsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_countOfFamilyMemberContactsFuture, a3);
}

- (CNFuture)updateContactListByAddingContactsFuture
{
  return self->_updateContactListByAddingContactsFuture;
}

- (void)setUpdateContactListByAddingContactsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_updateContactListByAddingContactsFuture, a3);
}

- (CNFuture)updateContactListByRemovingContactsFuture
{
  return self->_updateContactListByRemovingContactsFuture;
}

- (void)setUpdateContactListByRemovingContactsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_updateContactListByRemovingContactsFuture, a3);
}

- (CNCancelable)contactStoreDidChangeToken
{
  return self->_contactStoreDidChangeToken;
}

- (void)setContactStoreDidChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeToken, 0);
  objc_storeStrong((id *)&self->_updateContactListByRemovingContactsFuture, 0);
  objc_storeStrong((id *)&self->_updateContactListByAddingContactsFuture, 0);
  objc_storeStrong((id *)&self->_countOfFamilyMemberContactsFuture, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_familyMemberContactsUpdator, 0);
  objc_storeStrong((id *)&self->_modelFetcher, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_countOfFamilyMemberContacts, 0);
}

@end
