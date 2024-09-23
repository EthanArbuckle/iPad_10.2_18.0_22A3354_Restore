@implementation CNContactListRemoveContactsFromGroupAction

- (CNContactListRemoveContactsFromGroupAction)initWithContacts:(id)a3 configuration:(id)a4 withConfirmation:(BOOL)a5
{
  id v8;
  id v9;
  CNContactListRemoveContactsFromGroupAction *v10;
  CNContactListRemoveContactsFromGroupAction *v11;
  void *v12;
  uint64_t v13;
  CNUIExternalComponentsFactory *componentsFactory;
  uint64_t v15;
  CNContactStore *contactStore;
  CNContactListRemoveContactsFromGroupAction *v17;
  uint64_t v18;
  NSArray *actions;
  CNContactListRemoveContactsFromGroupAction *v20;
  _QWORD v22[4];
  CNContactListRemoveContactsFromGroupAction *v23;
  id v24;
  id v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CNContactListRemoveContactsFromGroupAction;
  v10 = -[CNContactListRemoveContactsFromGroupAction init](&v26, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CNContactListAction setConfiguration:](v10, "setConfiguration:", v9);
    objc_msgSend(v9, "environment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsFactory");
    v13 = objc_claimAutoreleasedReturnValue();
    componentsFactory = v11->_componentsFactory;
    v11->_componentsFactory = (CNUIExternalComponentsFactory *)v13;

    objc_msgSend(v9, "contactStore");
    v15 = objc_claimAutoreleasedReturnValue();
    contactStore = v11->_contactStore;
    v11->_contactStore = (CNContactStore *)v15;

    v11->_confirmAction = a5;
    v11->_originalContactCount = objc_msgSend(v8, "count");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__CNContactListRemoveContactsFromGroupAction_initWithContacts_configuration_withConfirmation___block_invoke;
    v22[3] = &unk_1E204A508;
    v17 = v11;
    v23 = v17;
    v24 = v8;
    v25 = v9;
    objc_msgSend(v24, "_cn_flatMap:", v22);
    v18 = objc_claimAutoreleasedReturnValue();
    actions = v17->_actions;
    v17->_actions = (NSArray *)v18;

    v20 = v17;
  }

  return v11;
}

- (BOOL)shouldReloadListOnCompletion
{
  return 1;
}

- (void)performAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
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
  _QWORD v20[5];
  id v21;

  -[CNContactListRemoveContactsFromGroupAction groupToRemoveFrom](self, "groupToRemoveFrom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactListRemoveContactsFromGroupAction confirmAction](self, "confirmAction"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LIST_ACTION_REMOVE_CONTACT_FROM_LIST"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContactListRemoveContactsFromGroupAction originalContactCount](self, "originalContactCount");
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListRemoveContactsFromGroupAction componentsFactory](self, "componentsFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LIST_ACTION_ALERT_ACTION_REMOVE_FROM_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__CNContactListRemoveContactsFromGroupAction_performAction__block_invoke;
    v20[3] = &unk_1E204FFA8;
    v20[4] = self;
    v21 = v3;
    objc_msgSend(v11, "alertActionWithTitle:style:handler:", v13, 2, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v14);

    -[CNContactListRemoveContactsFromGroupAction componentsFactory](self, "componentsFactory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alertActionWithTitle:style:handler:", v17, 1, &__block_literal_global_58);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v18);

    -[CNContactListAction delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "action:presentViewController:", self, v10);

  }
  else
  {
    -[CNContactListRemoveContactsFromGroupAction performAuthorizedRemoveFromGroup:](self, "performAuthorizedRemoveFromGroup:", v3);
  }

}

- (void)performAuthorizedRemoveFromGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13327;
  v20 = __Block_byref_object_dispose__13328;
  v21 = (id)MEMORY[0x1E0C9AA60];
  -[CNContactListRemoveContactsFromGroupAction actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __79__CNContactListRemoveContactsFromGroupAction_performAuthorizedRemoveFromGroup___block_invoke;
  v13 = &unk_1E20495D0;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  objc_msgSend(v5, "_cn_each:", &v10);

  if (((*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v17[5], v7, v8) & 1) == 0)-[CNContactListRemoveContactsFromGroupAction showRemoveFromGroupFailureAlert](self, "showRemoveFromGroupFailureAlert", v10, v11, v12, v13);
  -[CNContactListAction delegate](self, "delegate", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionDidFinish:", self);

  _Block_object_dispose(&v16, 8);
}

- (void)showRemoveFromGroupFailureAlert
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
  id v13;

  v3 = (void *)MEMORY[0x1E0DC3450];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LIST_ACTION_REMOVE_FROM_GROUP_FAILURE_ALERT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_CARD_SHEET_FAILURE_ALERT_EXPLANATION"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactListRemoveContactsFromGroupAction componentsFactory](self, "componentsFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertActionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v11);

  -[CNContactListAction delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "action:presentViewController:", self, v13);

}

- (BOOL)editRequiresAuthorization
{
  CNContactListRemoveContactsFromGroupAction *v2;
  void *v3;

  v2 = self;
  -[CNContactListRemoveContactsFromGroupAction actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNContactListRemoveContactsFromGroupAction editRequiresAuthorizationCheckForActions:](v2, "editRequiresAuthorizationCheckForActions:", v3);

  return (char)v2;
}

- (BOOL)editRequiresAuthorizationCheckForActions:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__CNContactListRemoveContactsFromGroupAction_editRequiresAuthorizationCheckForActions___block_invoke;
  v4[3] = &unk_1E20495F8;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

- (void)performUndoAction
{
  void *v3;
  id v4;

  -[CNContactListRemoveContactsFromGroupAction actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_67_13314);

  -[CNContactListAction delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionDidFinish:", self);

}

- (id)groupToRemoveFrom
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
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v20;
  uint8_t buf[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[CNContactListAction configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactStoreFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactListRemoveContactsFromGroupAction contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C97318];
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateForGroupsWithIdentifiers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v8, "groupsMatchingPredicate:error:", v11, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;

  if (!v12)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v14 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    v16 = "Failed to remove contact from group: %@";
    v17 = v15;
    v18 = 12;
LABEL_10:
    _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_7;
  }
  if (objc_msgSend(v12, "count") != 1)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v16 = "Failed to remove contact from group, multiple matching groups found";
    v17 = v15;
    v18 = 2;
    goto LABEL_10;
  }
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v14;
}

- (CNUIExternalComponentsFactory)componentsFactory
{
  return self->_componentsFactory;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (int64_t)originalContactCount
{
  return self->_originalContactCount;
}

- (void)setOriginalContactCount:(int64_t)a3
{
  self->_originalContactCount = a3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (BOOL)confirmAction
{
  return self->_confirmAction;
}

- (void)setConfirmAction:(BOOL)a3
{
  self->_confirmAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_componentsFactory, 0);
}

uint64_t __63__CNContactListRemoveContactsFromGroupAction_performUndoAction__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoAction");
}

uint64_t __87__CNContactListRemoveContactsFromGroupAction_editRequiresAuthorizationCheckForActions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v2, "editRequiresAuthorizationCheckForContact:containerIdentifier:", v4, v5);
  return v6;
}

void __79__CNContactListRemoveContactsFromGroupAction_performAuthorizedRemoveFromGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setGroup:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(v6, "executeAction") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObject:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t __59__CNContactListRemoveContactsFromGroupAction_performAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAuthorizedRemoveFromGroup:", *(_QWORD *)(a1 + 40));
}

id __94__CNContactListRemoveContactsFromGroupAction_initWithContacts_configuration_withConfirmation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isUnified"))
    {
      objc_msgSend(v4, "linkedContacts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __94__CNContactListRemoveContactsFromGroupAction_initWithContacts_configuration_withConfirmation___block_invoke_45;
      v11[3] = &unk_1E204A4E0;
      v12 = *(id *)(a1 + 32);
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v5, "_cn_map:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "actionForContact:configuration:", v4, *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_error_impl(&dword_18AC56000, v7, OS_LOG_TYPE_ERROR, "Contact was nil for remove from group action with contacts: %@", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

id __94__CNContactListRemoveContactsFromGroupAction_initWithContacts_configuration_withConfirmation___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "actionForContact:configuration:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)log
{
  if (log_cn_once_token_4 != -1)
    dispatch_once(&log_cn_once_token_4, &__block_literal_global_39);
  return (id)log_cn_once_object_4;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  v7[0] = *MEMORY[0x1E0C966A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactListRemoveContactsFromGroupAction descriptorForRequiredKeys]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)actionForContact:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactListRemoveContactFromGroupAction *v10;
  void *v11;
  CNContactListRemoveContactFromGroupAction *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "contactViewCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerForContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [CNContactListRemoveContactFromGroupAction alloc];
  objc_msgSend(v5, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CNContactListRemoveContactFromGroupAction initWithContact:contactStore:containerIdentifier:](v10, "initWithContact:contactStore:containerIdentifier:", v6, v11, v9);
  return v12;
}

void __49__CNContactListRemoveContactsFromGroupAction_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIListRemoveContactsFromGroupAction");
  v1 = (void *)log_cn_once_object_4;
  log_cn_once_object_4 = (uint64_t)v0;

}

@end
