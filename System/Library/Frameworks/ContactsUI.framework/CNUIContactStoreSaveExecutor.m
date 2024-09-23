@implementation CNUIContactStoreSaveExecutor

- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  CNUIContactStoreSaveExecutor *v11;
  void *v12;
  CNUIContactStoreSaveExecutor *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  CNUIContactSaveResult *v17;
  CNUIContactSaveResult *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  CNUIContactSaveResult *v26;
  void *v27;
  int v29;
  CNUIContactStoreSaveExecutor *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CNUILogContactCard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 134349056;
    v30 = self;
    _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "[CNUIContactStoreExecutor] %{public}p will execute save…", (uint8_t *)&v29, 0xCu);
  }

  if (-[CNUIContactStoreSaveExecutor saveShadowContactForSaveConfiguration:](self, "saveShadowContactForSaveConfiguration:", v6))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIContactStoreSaveExecutor validatedContactForSaveConfiguration:preservingIdentifier:](self, "validatedContactForSaveConfiguration:preservingIdentifier:", v6, 1);
    v11 = (CNUIContactStoreSaveExecutor *)objc_claimAutoreleasedReturnValue();
    if (-[CNUIContactStoreSaveExecutor isSuggestedMe](v11, "isSuggestedMe"))
    {
      +[CNDonatedMeCardPersistenceHelper defaultKeysForValuesToPersist](CNDonatedMeCardPersistenceHelper, "defaultKeysForValuesToPersist");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[CNDonatedMeCardPersistenceHelper mutableCopyOfContact:byCopyingModificationsAndValuesForKeysOnly:](CNDonatedMeCardPersistenceHelper, "mutableCopyOfContact:byCopyingModificationsAndValuesForKeysOnly:", v11, v12);

      CNUILogContactCard();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 134349056;
        v30 = v13;
        _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_DEFAULT, "[CNUIContactStoreExecutor] creating new me contact %{public}p", (uint8_t *)&v29, 0xCu);
      }

      objc_msgSend(v6, "contactStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[CNDonatedMeCardPersistenceHelper createNewMeContact:inStore:](CNDonatedMeCardPersistenceHelper, "createNewMeContact:inStore:", v13, v15);

      if (v16)
      {
        v11 = v13;
LABEL_17:
        -[CNUIContactStoreSaveExecutor saveLinkedContactsWithSaveConfiguration:contactToSave:additionalLinkedContacts:issuedRequestIdentifiers:saveDelegate:](self, "saveLinkedContactsWithSaveConfiguration:contactToSave:additionalLinkedContacts:issuedRequestIdentifiers:saveDelegate:", v6, v11, v10, v9, v7);
        v13 = (CNUIContactStoreSaveExecutor *)objc_claimAutoreleasedReturnValue();

        -[CNUIContactStoreSaveExecutor handleGroupContextForSaveConfiguration:contactToSave:issuedRequestIdentifiers:saveDelegate:](self, "handleGroupContextForSaveConfiguration:contactToSave:issuedRequestIdentifiers:saveDelegate:", v6, v13, v9, v7);
        v22 = 1;
        goto LABEL_18;
      }
      v22 = 0;
LABEL_18:
      v26 = [CNUIContactSaveResult alloc];
      v27 = (void *)objc_msgSend(v9, "copy");
      v18 = -[CNUIContactSaveResult initWithSuccess:contact:identifiersOfIssuedSaveRequests:](v26, "initWithSuccess:contact:identifiersOfIssuedSaveRequests:", v22, v13, v27);

      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "featureFlags");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isFeatureEnabled:", 6) & 1) != 0)
    {
      objc_msgSend(v6, "containerContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        if (-[CNUIContactStoreSaveExecutor handleContainerContextForSaveConfiguration:contactToSave:saveDelegate:issuedRequestIdentifiers:additionalLinkedContacts:](self, "handleContainerContextForSaveConfiguration:contactToSave:saveDelegate:issuedRequestIdentifiers:additionalLinkedContacts:", v6, v11, v7, v9, v10))
        {
          goto LABEL_17;
        }
        goto LABEL_13;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "parentGroup");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[CNUIContactStoreSaveExecutor performSaveForMutableContact:group:container:saveConfiguration:issuedRequestIdentifiers:](self, "performSaveForMutableContact:group:container:saveConfiguration:issuedRequestIdentifiers:", v11, v23, v24, v6, v9);

    if (v25)
      goto LABEL_17;
LABEL_13:
    v22 = 0;
    v13 = v11;
    goto LABEL_18;
  }
  v17 = [CNUIContactSaveResult alloc];
  objc_msgSend(v6, "mutableContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CNUIContactSaveResult initWithSuccess:contact:identifiersOfIssuedSaveRequests:](v17, "initWithSuccess:contact:identifiersOfIssuedSaveRequests:", 0, v9, MEMORY[0x1E0C9AA60]);
LABEL_19:

  return v18;
}

- (BOOL)saveShadowContactForSaveConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "shadowCopyOfReadonlyContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultContainerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      CNUILogContactCard();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEFAULT, "[CNUIContactStoreExecutor] Failed to get default container identifier to save shadow copy of readonly contact", buf, 2u);
      }
      v14 = 1;
      goto LABEL_17;
    }
    v7 = (void *)MEMORY[0x1E0C972C0];
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForContainersWithIdentifiers:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "contactStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v10, "containersMatchingPredicate:error:", v9, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v12 != 0;
    if (v12)
    {
      CNUILogContactCard();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v12;
        v16 = "[CNUIContactStoreExecutor] Failed to get default container to save shadow copy of readonly contact, error %@";
LABEL_14:
        _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v3, "shadowCopyOfReadonlyContact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "contactStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "parentGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "saveContactInStore:group:container:", v18, v19, v13);

      if ((v20 & 1) != 0)
      {
        v14 = 1;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      CNUILogContactCard();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = 0;
        v16 = "[CNUIContactStoreExecutor] Failed to save shadow copy of readonly contact, error %@";
        goto LABEL_14;
      }
    }

    goto LABEL_16;
  }
  v14 = 1;
LABEL_18:

  return v14;
}

- (id)validatedContactForSaveConfiguration:(id)a3 preservingIdentifier:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "mutableContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C973A0]);
  objc_msgSend(v5, "parentContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContainerIdentifier:", v9);

  if ((objc_msgSend(v5, "ignoresParentalRestrictions") & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v5, "saveWasAuthorized");
  objc_msgSend(v7, "setIgnoresGuardianRestrictions:", v10);
  objc_msgSend(v5, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v11, "policyWithDescription:error:", v7, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;

  if (v13)
  {
    CNUILogContactCard();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "parentContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_error_impl(&dword_18AC56000, v14, OS_LOG_TYPE_ERROR, "[CNUIContactStoreExecutor] failed to get policy for container %{public}@", buf, 0xCu);

    }
    goto LABEL_9;
  }
  objc_msgSend(v6, "updateContactTypeWithPolicy:", v12);
  if (objc_msgSend(v6, "hasBeenPersisted"))
  {
LABEL_9:
    v15 = v6;
    goto LABEL_10;
  }
  if (v4)
    v17 = 13;
  else
    v17 = 5;
  objc_msgSend(MEMORY[0x1E0C97258], "contactFromContact:conformingToPolicy:options:", v6, v12, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v6;
  v15 = v20;

LABEL_10:
  return v15;
}

- (BOOL)handleContainerContextForSaveConfiguration:(id)a3 contactToSave:(id)a4 saveDelegate:(id)a5 issuedRequestIdentifiers:(id)a6 additionalLinkedContacts:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v40;
  void *v41;
  void *v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v44 = a5;
  v13 = a6;
  v14 = a7;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v11, "containerContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addedContainers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v16;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v17)
  {
    v18 = v17;
    v41 = v14;
    v42 = v12;
    v40 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v46 != v40)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v44, "contactViewCache");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "policyForContainer:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "parentContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "isEqualToString:", v25);

        if ((v26 & 1) != 0)
        {
          v27 = v42;
          objc_msgSend(v11, "parentGroup");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C97258], "contactFromContact:conformingToPolicy:options:", v42, v22, 5);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          v28 = 0;
        }
        v29 = objc_alloc_init(MEMORY[0x1E0C973D0]);
        if ((objc_msgSend(v11, "ignoresParentalRestrictions") & 1) != 0)
          v30 = 1;
        else
          v30 = objc_msgSend(v11, "saveWasAuthorized");
        objc_msgSend(v29, "setIgnoresGuardianRestrictions:", v30);
        objc_msgSend(v29, "saveRequestIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v31);

        v32 = -[CNUIContactStoreSaveExecutor performSaveForMutableContact:group:container:saveConfiguration:issuedRequestIdentifiers:](self, "performSaveForMutableContact:group:container:saveConfiguration:issuedRequestIdentifiers:", v27, v28, v20, v11, v13);
        objc_msgSend(v41, "addObject:", v27);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v18);
    v14 = v41;
    v12 = v42;
  }
  else
  {
    v32 = 0;
  }

  objc_msgSend(v11, "containerContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "originalContainers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    objc_msgSend(v11, "parentGroup");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentContainer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[CNUIContactStoreSaveExecutor performSaveForMutableContact:group:container:saveConfiguration:issuedRequestIdentifiers:](self, "performSaveForMutableContact:group:container:saveConfiguration:issuedRequestIdentifiers:", v12, v36, v37, v11, v13);

    objc_msgSend(v14, "addObject:", v12);
  }

  return v32;
}

- (void)handleGroupContextForSaveConfiguration:(id)a3 contactToSave:(id)a4 issuedRequestIdentifiers:(id)a5 saveDelegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  CNUIGroupsAndContainersSaveManager *v15;
  void *v16;
  void *v17;
  CNUIGroupsAndContainersSaveManager *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "groupContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if ((objc_msgSend(v9, "ignoresParentalRestrictions") & 1) != 0)
      v14 = 1;
    else
      v14 = objc_msgSend(v9, "saveWasAuthorized");
    v15 = [CNUIGroupsAndContainersSaveManager alloc];
    objc_msgSend(v9, "contactStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contactViewCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:contactViewCache:](v15, "initWithContactStore:contactViewCache:", v16, v17);

    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CNUIGroupsAndContainersSaveManager updateContacts:forGroupContext:ignoresGuardianRestrictions:issuedRequestIdentifiers:](v18, "updateContacts:forGroupContext:ignoresGuardianRestrictions:issuedRequestIdentifiers:", v19, v20, v14, v11);

  }
}

- (id)saveLinkedContactsWithSaveConfiguration:(id)a3 contactToSave:(id)a4 additionalLinkedContacts:(id)a5 issuedRequestIdentifiers:(id)a6 saveDelegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  CNUIContactStoreLinkedContactSaveExecutor *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = *MEMORY[0x1E0D137F8];
  if ((*(unsigned int (**)(_QWORD, id))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v13)
    && (objc_msgSend(v11, "editingLinkedContacts"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17),
        v17,
        v18))
  {
    v19 = (void *)objc_msgSend(v12, "copy");
  }
  else
  {
    v20 = v11;
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v20, "editingLinkedContacts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectsFromArray:", v21);

      v22 = objc_msgSend(v20, "copyWithEditingLinkedContacts:", v13);
      v20 = (id)v22;
    }
    v23 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
    -[CNUIContactStoreLinkedContactSaveExecutor executeSaveWithConfiguration:saveDelegate:](v23, "executeSaveWithConfiguration:saveDelegate:", v20, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifiersOfIssuedSaveRequests");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v25);

    objc_msgSend(v24, "contact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v24, "contact");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = objc_msgSend(v12, "copy");
    }
    v19 = (void *)v27;

  }
  return v19;
}

- (BOOL)performSaveForMutableContact:(id)a3 group:(id)a4 container:(id)a5 saveConfiguration:(id)a6 issuedRequestIdentifiers:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CNUIContactStoreSaveDelegate *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v11 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(CNUIContactStoreSaveDelegate);
  v17 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  if ((objc_msgSend(v11, "ignoresParentalRestrictions") & 1) != 0)
    v18 = 1;
  else
    v18 = objc_msgSend(v11, "saveWasAuthorized");
  objc_msgSend(v17, "setIgnoresGuardianRestrictions:", v18);
  objc_msgSend(v17, "setDelegate:", v16);
  objc_msgSend(v17, "saveRequestIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v19);

  objc_msgSend(v11, "contactStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v15, "saveContactInStore:group:container:request:", v20, v14, v13, v17);

  return (char)v19;
}

@end
