@implementation CNUICoreInMemoryWhitelistedContactsDataSourceDecorator

- (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator)initWithDataSource:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  CNUICoreContactStoreProductionFacade *v8;
  id v9;
  CNUICoreContactStoreProductionFacade *v10;
  CNUICoreFamilyInfoRetriever *v11;
  CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *v12;

  v6 = a4;
  v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  v9 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v10 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v8, "initWithContactStore:", v9);

  v11 = -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:]([CNUICoreFamilyInfoRetriever alloc], "initWithMainContactStoreFacade:matchFamilyMembersWithContacts:schedulerProvider:", v10, 1, v6);
  v12 = -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:familyInfoRetriever:schedulerProvider:](self, "initWithDataSource:familyInfoRetriever:schedulerProvider:", v7, v11, v6);

  return v12;
}

- (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator)initWithDataSource:(id)a3 familyInfoRetriever:(id)a4 schedulerProvider:(id)a5
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
  CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *v36;
  CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *v37;
  CNUICoreContactEditingSession *v38;
  CNUICoreContactEditingSession *editingSession;
  CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *v40;
  objc_super v42;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_1 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_157);
  v12 = CNGuardOSLog_cn_once_object_0_1;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:familyInfoRetriever:schedulerProvider:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
    if (v10)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v10)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_1 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_157);
  v20 = CNGuardOSLog_cn_once_object_0_1;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:familyInfoRetriever:schedulerProvider:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_10:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_1 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_157);
    v28 = CNGuardOSLog_cn_once_object_0_1;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator initWithDataSource:familyInfoRetriever:schedulerProvider:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
  }
  v42.receiver = self;
  v42.super_class = (Class)CNUICoreInMemoryWhitelistedContactsDataSourceDecorator;
  v36 = -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator init](&v42, sel_init);
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_dataSource, a3);
    -[CNUICoreFamilyMemberWhitelistedContactsDataSource setObserver:](v37->_dataSource, "setObserver:", v37);
    objc_storeStrong((id *)&v37->_familyInfoRetriever, a4);
    objc_storeStrong((id *)&v37->_schedulerProvider, a5);
    v38 = objc_alloc_init(CNUICoreContactEditingSession);
    editingSession = v37->_editingSession;
    v37->_editingSession = v38;

    v40 = v37;
  }

  return v37;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator endEditingNotificationToken](self, "endEditingNotificationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)CNUICoreInMemoryWhitelistedContactsDataSourceDecorator;
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator dealloc](&v4, sel_dealloc);
}

- (id)contactTypeAssesor
{
  cn_objectResultWithObjectLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __76__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactTypeAssesor__block_invoke(uint64_t a1)
{
  void *v2;
  CNUICoreContactTypeAssessor *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = [CNUICoreContactTypeAssessor alloc];
    objc_msgSend(*(id *)(a1 + 32), "familyInfoRetriever");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "familyInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNUICoreContactTypeAssessor initWithFamilyInfoFuture:](v3, "initWithFamilyInfoFuture:", v5);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v6;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return v2;
}

- (void)familyMemberContactItemsDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __91__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsDidChange__block_invoke;
  v2[3] = &unk_1EA6035F0;
  v2[4] = self;
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator executeBlockIfEditingSessionNotInProgress:](self, "executeBlockIfEditingSessionNotInProgress:", v2);
}

uint64_t __91__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserverContactItemsChange");
}

- (void)notifyObserverContactItemsChange
{
  id v2;

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator observer](self, "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyMemberContactItemsDidChange");

}

- (void)executeBlockIfEditingSessionNotInProgress:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "inProgress");

  v6 = v7;
  if (v7 && (v5 & 1) == 0)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)startEditingSessionIfNecessary
{
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator startEditingSessionIfNecessaryWithSnapshotOfItems:](self, "startEditingSessionIfNecessaryWithSnapshotOfItems:", 0);
}

- (void)startEditingSessionIfNecessaryWithSnapshotOfItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator familyMemberContactItemsSnapshot](self, "familyMemberContactItemsSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (v6)
    {
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator setFamilyMemberContactItemsSnapshot:](self, "setFamilyMemberContactItemsSnapshot:", v6);
    }
    else
    {
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator familyMemberContactItemsFromDataSource](self, "familyMemberContactItemsFromDataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator setFamilyMemberContactItemsSnapshot:](self, "setFamilyMemberContactItemsSnapshot:", v5);

    }
  }

}

- (void)flushEditingSession
{
  CNUICoreContactEditingSession *v3;

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator setFamilyMemberContactItemsSnapshot:](self, "setFamilyMemberContactItemsSnapshot:", 0);
  v3 = objc_alloc_init(CNUICoreContactEditingSession);
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator setEditingSession:](self, "setEditingSession:", v3);

}

- (BOOL)familyMemberContainerIsEmpty
{
  void *v2;
  char v3;

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "familyMemberContainerIsEmpty");

  return v3;
}

- (int64_t)fetchStatus
{
  void *v2;
  int64_t v3;

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fetchStatus");

  return v3;
}

- (NSArray)familyMemberContactItems
{
  void *v3;
  int v4;

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inProgress");

  if (v4)
    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits](self, "familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits");
  else
    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator familyMemberContactItemsFromDataSource](self, "familyMemberContactItemsFromDataSource");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits
{
  void *v3;
  void *v4;
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
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  id (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;

  v3 = (void *)objc_opt_class();
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator contactTypeAssesor](self, "contactTypeAssesor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelBuilderForAddedContacts:withContactTypeAssessor:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatedContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator contactTypeAssesor](self, "contactTypeAssesor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelBuilderForContacts:withContactTypeAssessor:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removedContacts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_cn_map:", &__block_literal_global_8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "items");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_cn_indexBy:", &__block_literal_global_16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator familyMemberContactItemsSnapshot](self, "familyMemberContactItemsSnapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __122__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits__block_invoke;
  v35[3] = &unk_1EA603618;
  v36 = v17;
  v22 = v17;
  objc_msgSend(v20, "_cn_filter:", v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v21;
  v31 = 3221225472;
  v32 = __122__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits__block_invoke_2;
  v33 = &unk_1EA603640;
  v34 = v19;
  v24 = v19;
  objc_msgSend(v23, "_cn_map:", &v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items", v30, v31, v32, v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUICoreFamilyMemberContactsModelBuilder itemsBySortingItems:](CNUICoreFamilyMemberContactsModelBuilder, "itemsBySortingItems:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

uint64_t __122__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

id __122__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_familyMemberContactItemsFromDataSourceAugmentedWithInMemoryEdits__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v3;
  }

  return v9;
}

- (id)familyMemberContactItemsFromDataSource
{
  void *v3;
  void *v4;

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyMemberContactItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator startImplicitEditngSessionForAnyItemsNotPersistedInItems:](self, "startImplicitEditngSessionForAnyItemsNotPersistedInItems:", v4);
  return v4;
}

- (void)startImplicitEditngSessionForAnyItemsNotPersistedInItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a3;
  objc_msgSend(v9, "_cn_filter:", &__block_literal_global_17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_filter:", &__block_literal_global_18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __115__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_startImplicitEditngSessionForAnyItemsNotPersistedInItems___block_invoke;
    v10[3] = &unk_1EA603668;
    v10[4] = self;
    objc_msgSend(v9, "_cn_map:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_filter:", *MEMORY[0x1E0D13830]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator startEditingSessionIfNecessaryWithSnapshotOfItems:](self, "startEditingSessionIfNecessaryWithSnapshotOfItems:", v5);
    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addContacts:", v7);

  }
}

id __115__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_startImplicitEditngSessionForAnyItemsNotPersistedInItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactRepresentingItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateWhitelistByAddingContacts:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator startEditingSessionIfNecessary](self, "startEditingSessionIfNecessary");
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addContacts:", v4);

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator notifyObserverContactItemsChange](self, "notifyObserverContactItemsChange");
}

- (void)updateWhitelistByUpdatingContacts:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator startEditingSessionIfNecessary](self, "startEditingSessionIfNecessary");
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateContacts:", v4);

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator notifyObserverContactItemsChange](self, "notifyObserverContactItemsChange");
}

- (void)updateWhitelistByRemovingContacts:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator startEditingSessionIfNecessary](self, "startEditingSessionIfNecessary");
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeContacts:", v4);

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator notifyObserverContactItemsChange](self, "notifyObserverContactItemsChange");
}

- (id)contactRepresentingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addedContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactRepresentingItem___block_invoke;
  v23[3] = &unk_1EA603568;
  v8 = v4;
  v24 = v8;
  objc_msgSend(v6, "_cn_firstObjectPassingTest:", v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatedContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v7;
  v19 = 3221225472;
  v20 = __82__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactRepresentingItem___block_invoke_2;
  v21 = &unk_1EA603568;
  v12 = v8;
  v22 = v12;
  objc_msgSend(v11, "_cn_firstObjectPassingTest:", &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v14 = v9;
  }
  else
  {
    if (!v13)
    {
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator dataSource](self, "dataSource", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contactRepresentingItem:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v14 = v13;
  }
  v15 = v14;
LABEL_6:

  return v15;
}

uint64_t __82__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactRepresentingItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __82__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_contactRepresentingItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)persistInMemoryContactsWhitelistState
{
  void *v3;
  void *v4;
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
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "inProgress") & 1) != 0)
  {
    -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator endEditingNotificationToken](self, "endEditingNotificationToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator dataSource](self, "dataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addedContacts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateWhitelistByAddingContacts:", v6);

      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updatedContacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWhitelistByUpdatingContacts:", v9);

      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator dataSource](self, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator editingSession](self, "editingSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removedContacts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateWhitelistByRemovingContacts:", v12);

      objc_initWeak(&location, self);
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator schedulerProvider](self, "schedulerProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mainThreadScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __95__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_persistInMemoryContactsWhitelistState__block_invoke;
      v17[3] = &unk_1EA603690;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v14, "afterDelay:performBlock:", v17, 2.5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator setEndEditingNotificationToken:](self, "setEndEditingNotificationToken:", v15);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __95__CNUICoreInMemoryWhitelistedContactsDataSourceDecorator_persistInMemoryContactsWhitelistState__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)MEMORY[0x1DF0D61B4]();
  objc_msgSend(WeakRetained, "finishPersistenceOfInMemoryContactsWhitelistState");
  objc_autoreleasePoolPop(v1);

}

- (void)finishPersistenceOfInMemoryContactsWhitelistState
{
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator flushEditingSession](self, "flushEditingSession");
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator notifyObserverContactItemsChange](self, "notifyObserverContactItemsChange");
  -[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator setEndEditingNotificationToken:](self, "setEndEditingNotificationToken:", 0);
}

+ (id)modelBuilderForAddedContacts:(id)a3 withContactTypeAssessor:(id)a4
{
  void *v4;

  objc_msgSend(a1, "modelBuilderForContacts:withContactTypeAssessor:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarkItemsAsPersisted:", 0);
  return v4;
}

+ (id)modelBuilderForContacts:(id)a3 withContactTypeAssessor:(id)a4
{
  id v5;
  id v6;
  CNUICoreFamilyMemberContactsModelBuilder *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CNUICoreFamilyMemberContactsModelBuilder);
  -[CNUICoreFamilyMemberContactsModelBuilder setContacts:](v7, "setContacts:", v6);

  -[CNUICoreFamilyMemberContactsModelBuilder setContactTypeAssessor:](v7, "setContactTypeAssessor:", v5);
  -[CNUICoreFamilyMemberContactsModelBuilder setContactFormatterStyle:](v7, "setContactFormatterStyle:", +[CNUICoreFamilyMemberContactsModelRetriever contactFormatterStyle](CNUICoreFamilyMemberContactsModelRetriever, "contactFormatterStyle"));
  -[CNUICoreFamilyMemberContactsModelBuilder setSortItemsByName:](v7, "setSortItemsByName:", 1);
  return v7;
}

- (CNUICoreFamilyMemberContactsObserver)observer
{
  return (CNUICoreFamilyMemberContactsObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (CNUICoreFamilyMemberWhitelistedContactsDataSource)dataSource
{
  return self->_dataSource;
}

- (CNUICoreContactStoreFacade)mainContactStore
{
  return self->_mainContactStore;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUICoreFamilyInfoFetching)familyInfoRetriever
{
  return self->_familyInfoRetriever;
}

- (CNUICoreContactTypeAssessor)contactTypeAssessor
{
  return self->_contactTypeAssessor;
}

- (CNUICoreContactEditingSession)editingSession
{
  return self->_editingSession;
}

- (void)setEditingSession:(id)a3
{
  objc_storeStrong((id *)&self->_editingSession, a3);
}

- (NSArray)familyMemberContactItemsSnapshot
{
  return self->_familyMemberContactItemsSnapshot;
}

- (void)setFamilyMemberContactItemsSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_familyMemberContactItemsSnapshot, a3);
}

- (CNCancelable)endEditingNotificationToken
{
  return self->_endEditingNotificationToken;
}

- (void)setEndEditingNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_endEditingNotificationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEditingNotificationToken, 0);
  objc_storeStrong((id *)&self->_familyMemberContactItemsSnapshot, 0);
  objc_storeStrong((id *)&self->_editingSession, 0);
  objc_storeStrong((id *)&self->_contactTypeAssessor, 0);
  objc_storeStrong((id *)&self->_familyInfoRetriever, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_mainContactStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (void)initWithDataSource:(uint64_t)a3 familyInfoRetriever:(uint64_t)a4 schedulerProvider:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘schedulerProvier’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDataSource:(uint64_t)a3 familyInfoRetriever:(uint64_t)a4 schedulerProvider:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘familyInfoRetriever’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDataSource:(uint64_t)a3 familyInfoRetriever:(uint64_t)a4 schedulerProvider:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘dataSource’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
