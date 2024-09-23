@implementation CNUICoreFamilyMemberContactsStore

- (CNUICoreFamilyMemberContactsStore)init
{
  CNUICoreFamilyMemberContactsStore *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactsStore)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  CNUICoreContactStoreProductionFacade *v8;
  void *v9;
  CNUICoreContactStoreProductionFacade *v10;
  CNUICoreContactsSyncProductionTrigger *v11;
  CNUICoreFamilyMemberContactsStore *v12;

  v6 = a4;
  v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  objc_msgSend(MEMORY[0x1E0C97298], "storeForFamilyMember:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNUICoreContactStoreProductionFacade initWithContactStore:](v8, "initWithContactStore:", v9);

  v11 = objc_alloc_init(CNUICoreContactsSyncProductionTrigger);
  v12 = -[CNUICoreFamilyMemberContactsStore initWithFamilyMemberScopedContactStoreFacade:familyMember:contactsSyncTrigger:schedulerProvider:](self, "initWithFamilyMemberScopedContactStoreFacade:familyMember:contactsSyncTrigger:schedulerProvider:", v10, v7, v11, v6);

  return v12;
}

- (CNUICoreFamilyMemberContactsStore)initWithFamilyMemberScopedContactStoreFacade:(id)a3 familyMember:(id)a4 contactsSyncTrigger:(id)a5 schedulerProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNUICoreFamilyMemberContactsStore *v15;
  CNUICoreFamilyMemberContactsStore *v16;
  CNUICoreFamilyMemberContactsStore *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_58);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.3();
    if (v12)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v12)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_58);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyMemberContactsStore initWithFamilyMemberScopedContactStoreFacade:familyMember:contactsSyncTrigger:schedulerProvider:].cold.2();
LABEL_10:
  if (!v14)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_58);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.1();
  }
  v19.receiver = self;
  v19.super_class = (Class)CNUICoreFamilyMemberContactsStore;
  v15 = -[CNUICoreFamilyMemberContactsStore init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_familyMemberScopedContactStore, a3);
    objc_storeStrong((id *)&v16->_familyMember, a4);
    objc_storeStrong((id *)&v16->_contactsSyncTrigger, a5);
    objc_storeStrong((id *)&v16->_schedulerProvider, a6);
    v17 = v16;
  }

  return v16;
}

- (CNScheduler)backgroundOrImmediateScheduler
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "backgroundScheduler");
  else
    objc_msgSend(v4, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNScheduler *)v6;
}

- (id)updateContactListByAddingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  id v18;
  CNUICoreFamilyMemberContactsStore *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_58);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactScratchpad scratchpadByAddingContacts:].cold.1();
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreFamilyMemberContactsStore familyMember](self, "familyMember");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyMemberContactsStore familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D13A68];
    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__CNUICoreFamilyMemberContactsStore_updateContactListByAddingContacts___block_invoke;
    v21[3] = &unk_1EA604538;
    v22 = v4;
    -[CNUICoreFamilyMemberContactsStore backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithBlock:scheduler:schedulerProvider:", v21, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v7;
    v19 = self;
    v20 = v6;
    v13 = v6;
    v14 = v7;
    -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider", v9, 3221225472, __71__CNUICoreFamilyMemberContactsStore_updateContactListByAddingContacts___block_invoke_2, &unk_1EA604560);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "flatMap:schedulerProvider:", &v17, v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __71__CNUICoreFamilyMemberContactsStore_updateContactListByAddingContacts___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __71__CNUICoreFamilyMemberContactsStore_updateContactListByAddingContacts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  +[CNUICoreFamilyMemberSaveRequestFactory distinctCopiesOfContacts:](CNUICoreFamilyMemberSaveRequestFactory, "distinctCopiesOfContacts:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByAddingContacts:](CNUICoreFamilyMemberSaveRequestFactory, "saveRequestToUpdateContactListByAddingContacts:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v4, "executeSaveRequest:error:", v5, &v12);
  v7 = v12;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "triggerContactsSyncRequest");
    +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logSuccessUpdatingContactListByAddingContacts:ofFamilyMember:", v3, *(_QWORD *)(a1 + 48));

    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logFailure:updatingContactListByAddingContacts:ofFamilyMember:", v7, v3, *(_QWORD *)(a1 + 48));

    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithError:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)updateContactListByUpdatingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  CNUICoreFamilyMemberContactsStore *v16;

  v4 = a3;
  -[CNUICoreFamilyMemberContactsStore familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__CNUICoreFamilyMemberContactsStore_updateContactListByUpdatingContacts___block_invoke;
  v13[3] = &unk_1EA604588;
  v14 = v5;
  v15 = v4;
  v16 = self;
  v7 = v4;
  v8 = v5;
  -[CNUICoreFamilyMemberContactsStore backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithBlock:scheduler:schedulerProvider:", v13, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __73__CNUICoreFamilyMemberContactsStore_updateContactListByUpdatingContacts___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  id v11;

  v4 = *(void **)(a1 + 32);
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
  objc_msgSend(*(id *)(a1 + 48), "triggerContactsSyncRequest");
  v8 = *(id *)(a1 + 40);
  v9 = v8;
  if (a2 && !v8)
    goto LABEL_6;
LABEL_7:

  return v9;
}

- (id)updateContactListByRemovingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;
  id v16;
  CNUICoreFamilyMemberContactsStore *v17;
  id v18;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_58);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactScratchpad scratchpadByRemovingContacts:].cold.1();
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreFamilyMemberContactsStore familyMember](self, "familyMember");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyMemberContactsStore familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D13A68];
    v14 = MEMORY[0x1E0C809B0];
    v15 = v7;
    v16 = v4;
    v17 = self;
    v18 = v6;
    v9 = v6;
    v10 = v7;
    -[CNUICoreFamilyMemberContactsStore backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler", v14, 3221225472, __73__CNUICoreFamilyMemberContactsStore_updateContactListByRemovingContacts___block_invoke, &unk_1EA6045B0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithBlock:scheduler:schedulerProvider:", &v14, v11, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __73__CNUICoreFamilyMemberContactsStore_updateContactListByRemovingContacts___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v4 = *(void **)(a1 + 32);
  +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByRemovingContacts:](CNUICoreFamilyMemberSaveRequestFactory, "saveRequestToUpdateContactListByRemovingContacts:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = objc_msgSend(v4, "executeSaveRequest:error:", v5, &v13);
  v7 = v13;

  if (!v6)
  {
    +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logFailure:updatingContactListByRemovingContacts:ofFamilyMember:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

    v10 = 0;
    if (!a2)
      goto LABEL_7;
LABEL_6:
    *a2 = objc_retainAutorelease(v7);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 48), "triggerContactsSyncRequest");
  +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logSuccessUpdatingContactListByRemovingContacts:ofFamilyMember:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  v9 = *(id *)(a1 + 40);
  v10 = v9;
  if (a2 && !v9)
    goto LABEL_6;
LABEL_7:

  return v10;
}

- (id)updateContactWhitelistByAddingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  id v14;
  CNUICoreFamilyMemberContactsStore *v15;
  id v16;
  id v17;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_58);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyMemberContactsStore updateContactWhitelistByAddingContacts:].cold.1();
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreFamilyMemberContactsStore familyMember](self, "familyMember");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyMemberContactsStore familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyMemberContactsStore contactsInsertedIntoFamilyMemberContainerIfMissingFuture:preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore:](self, "contactsInsertedIntoFamilyMemberContainerIfMissingFuture:preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore:", v4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = v7;
    v15 = self;
    v16 = v4;
    v17 = v6;
    v9 = v6;
    v10 = v7;
    -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider", v13, 3221225472, __76__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByAddingContacts___block_invoke, &unk_1EA604600);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flatMap:schedulerProvider:", &v13, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __76__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByAddingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByAddingContacts___block_invoke_2;
  v9[3] = &unk_1EA6045D8;
  v10 = *(id *)(a1 + 32);
  v11 = v3;
  v5 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  v14 = *(id *)(a1 + 56);
  v6 = v3;
  objc_msgSend(v4, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __76__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByAddingContacts___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v4 = *(void **)(a1 + 32);
  +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToupdateContactWhitelistByAddingContacts:](CNUICoreFamilyMemberSaveRequestFactory, "saveRequestToupdateContactWhitelistByAddingContacts:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = objc_msgSend(v4, "executeSaveRequest:error:", v5, &v13);
  v7 = v13;

  if (!v6)
  {
    +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logFailure:updatingContactWhitelistByAddingContacts:ofFamilyMember:", v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

    v10 = 0;
    if (!a2)
      goto LABEL_7;
LABEL_6:
    *a2 = objc_retainAutorelease(v7);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 48), "triggerContactsSyncRequest");
  +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logSuccessUpdatingContactWhitelistByAddingContacts:ofFamilyMember:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  v9 = *(id *)(a1 + 40);
  v10 = v9;
  if (a2 && !v9)
    goto LABEL_6;
LABEL_7:

  return v10;
}

- (void)triggerContactsSyncRequest
{
  id v2;

  -[CNUICoreFamilyMemberContactsStore contactsSyncTrigger](self, "contactsSyncTrigger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fireSyncRequest");

}

- (id)contactsInsertedIntoFamilyMemberContainerIfMissingFuture:(id)a3 preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v6 = a3;
  -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[CNUICoreFamilyMemberContactsStore contactsFoundAndNotFoundInFamilyMemberContainerFuture:](self, "contactsFoundAndNotFoundInFamilyMemberContainerFuture:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke;
  v13[3] = &unk_1EA604650;
  objc_copyWeak(&v16, &location);
  v17 = a4;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "flatMap:schedulerProvider:", v13, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

id __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_cn_indexBy:", &__block_literal_global_34);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke_2;
    v18[3] = &unk_1EA603540;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v19;
    objc_msgSend(v6, "_cn_map:", v18);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  objc_msgSend(WeakRetained, "updateContactListByAddingContacts:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke_3;
  v16[3] = &unk_1EA604628;
  v17 = v6;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  objc_msgSend(v11, "flatMap:schedulerProvider:", v16, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D13A68];
  v3 = *(_QWORD *)(a1 + 32);
  v10[0] = a2;
  v10[1] = v3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_flatten");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contactsFoundAndNotFoundInFamilyMemberContainerFuture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  -[CNUICoreFamilyMemberContactsStore familyMember](self, "familyMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsStore familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D13A68];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__CNUICoreFamilyMemberContactsStore_contactsFoundAndNotFoundInFamilyMemberContainerFuture___block_invoke;
  v15[3] = &unk_1EA604678;
  v16 = v6;
  v17 = v4;
  v18 = v5;
  v8 = v5;
  v9 = v4;
  v10 = v6;
  -[CNUICoreFamilyMemberContactsStore backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithBlock:scheduler:schedulerProvider:", v15, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __91__CNUICoreFamilyMemberContactsStore_contactsFoundAndNotFoundInFamilyMemberContainerFuture___block_invoke(_QWORD *a1, _QWORD *a2)
{
  CNUICoreContactRefetcher *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:]([CNUICoreContactRefetcher alloc], "initWithContactStore:contactsToRefetch:", a1[4], a1[5]);
  -[CNUICoreContactRefetcher contactsFoundAndNotFound](v4, "contactsFoundAndNotFound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isSuccess") & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D13B60];
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultWithValue:orError:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logResultOfFetchingContacts:ofFamilyMember:", v10, a1[6]);

    objc_msgSend(v5, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
      *a2 = objc_retainAutorelease(v11);

    v6 = 0;
  }

  return v6;
}

- (id)updateContactWhitelistByRemovingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;
  id v16;
  CNUICoreFamilyMemberContactsStore *v17;
  id v18;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_58);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyMemberContactsStore updateContactWhitelistByRemovingContacts:].cold.1();
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUICoreFamilyMemberContactsStore familyMember](self, "familyMember");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyMemberContactsStore familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D13A68];
    v14 = MEMORY[0x1E0C809B0];
    v15 = v7;
    v16 = v4;
    v17 = self;
    v18 = v6;
    v9 = v6;
    v10 = v7;
    -[CNUICoreFamilyMemberContactsStore backgroundOrImmediateScheduler](self, "backgroundOrImmediateScheduler", v14, 3221225472, __78__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByRemovingContacts___block_invoke, &unk_1EA6045B0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyMemberContactsStore schedulerProvider](self, "schedulerProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithBlock:scheduler:schedulerProvider:", &v14, v11, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __78__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByRemovingContacts___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v4 = *(void **)(a1 + 32);
  +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactWhitelistByRemovingContacts:](CNUICoreFamilyMemberSaveRequestFactory, "saveRequestToUpdateContactWhitelistByRemovingContacts:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = objc_msgSend(v4, "executeSaveRequest:error:", v5, &v13);
  v7 = v13;

  if (!v6)
  {
    +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logFailure:updatingContactWhitelistByRemovingContacts:ofFamilyMember:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

    v10 = 0;
    if (!a2)
      goto LABEL_7;
LABEL_6:
    *a2 = objc_retainAutorelease(v7);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 48), "triggerContactsSyncRequest");
  +[CNUIDowntimeLogger sharedLogger](CNUIDowntimeLogger, "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logSuccessUpdatingContactWhitelistByRemovingContacts:ofFamilyMember:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  v9 = *(id *)(a1 + 40);
  v10 = v9;
  if (a2 && !v9)
    goto LABEL_6;
LABEL_7:

  return v10;
}

- (CNUICoreContactStoreFacade)familyMemberScopedContactStore
{
  return self->_familyMemberScopedContactStore;
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (CNUICoreContactsSyncTrigger)contactsSyncTrigger
{
  return self->_contactsSyncTrigger;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_contactsSyncTrigger, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
}

- (void)initWithFamilyMemberScopedContactStoreFacade:familyMember:contactsSyncTrigger:schedulerProvider:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘familyMember’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateContactWhitelistByAddingContacts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘contactsToWhitelist’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateContactWhitelistByRemovingContacts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘contactsToClearFromWhitelist’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
