@implementation CNContactListDeleteContactsAction

- (CNContactListDeleteContactsAction)initWithContacts:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  CNContactListDeleteContactsAction *v8;
  CNContactListDeleteContactsAction *v9;
  void *v10;
  uint64_t v11;
  CNUIExternalComponentsFactory *componentsFactory;
  void *v13;
  uint64_t v14;
  CNUICoreRecentsManager *recentsManager;
  uint64_t v16;
  CNContactFormatter *contactFormatter;
  uint64_t v18;
  CNContactStore *contactStore;
  CNContactListDeleteContactsAction *v20;
  uint64_t v21;
  NSArray *actions;
  CNContactListDeleteContactsAction *v23;
  _QWORD v25[4];
  CNContactListDeleteContactsAction *v26;
  id v27;
  id v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CNContactListDeleteContactsAction;
  v8 = -[CNContactListDeleteContactsAction init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CNContactListAction setConfiguration:](v8, "setConfiguration:", v7);
    objc_msgSend(v7, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsFactory");
    v11 = objc_claimAutoreleasedReturnValue();
    componentsFactory = v9->_componentsFactory;
    v9->_componentsFactory = (CNUIExternalComponentsFactory *)v11;

    objc_msgSend(v7, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recentsManager");
    v14 = objc_claimAutoreleasedReturnValue();
    recentsManager = v9->_recentsManager;
    v9->_recentsManager = (CNUICoreRecentsManager *)v14;

    objc_msgSend(v7, "contactFormatter");
    v16 = objc_claimAutoreleasedReturnValue();
    contactFormatter = v9->_contactFormatter;
    v9->_contactFormatter = (CNContactFormatter *)v16;

    objc_msgSend(v7, "contactStore");
    v18 = objc_claimAutoreleasedReturnValue();
    contactStore = v9->_contactStore;
    v9->_contactStore = (CNContactStore *)v18;

    v9->_originalContactCount = objc_msgSend(v6, "count");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__CNContactListDeleteContactsAction_initWithContacts_configuration___block_invoke;
    v25[3] = &unk_1E204A508;
    v20 = v9;
    v26 = v20;
    v27 = v6;
    v28 = v7;
    objc_msgSend(v27, "_cn_flatMap:", v25);
    v21 = objc_claimAutoreleasedReturnValue();
    actions = v20->_actions;
    v20->_actions = (NSArray *)v21;

    v23 = v20;
  }

  return v9;
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
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  -[CNContactListDeleteContactsAction alertTitle](self, "alertTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CNContactListDeleteContactsAction originalContactCount](self, "originalContactCount") == 1
    && (-[CNContactListDeleteContactsAction actions](self, "actions"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7 == 1))
  {
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("CARD_ACTION_DELETE_CARD");
  }
  else
  {
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("LIST_ACTION_DELETE_CARDS");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactListDeleteContactsAction componentsFactory](self, "componentsFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__CNContactListDeleteContactsAction_performAction__block_invoke;
  v19[3] = &unk_1E204F7F0;
  v19[4] = self;
  objc_msgSend(v12, "alertActionWithTitle:style:handler:", v11, 2, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v13);

  -[CNContactListDeleteContactsAction componentsFactory](self, "componentsFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alertActionWithTitle:style:handler:", v16, 1, &__block_literal_global_63_22487);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v17);

  -[CNContactListAction delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "action:presentViewController:", self, v5);

}

- (id)alertTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (-[CNContactListDeleteContactsAction originalContactCount](self, "originalContactCount") == 1)
  {
    -[CNContactListDeleteContactsAction actions](self, "actions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactListDeleteContactsAction actions](self, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7 < 2)
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LIST_ACTION_DELETE_CARD"), &stru_1E20507A8, CFSTR("Localized"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListDeleteContactsAction contactFormatter](self, "contactFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromContact:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v11, v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LIST_ACTION_DELETE_CARD_SINGLE_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListDeleteContactsAction actions](self, "actions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v11, objc_msgSend(v12, "count") - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LIST_ACTION_DELETE_CARD_MULTIPLE"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v10, -[CNContactListDeleteContactsAction originalContactCount](self, "originalContactCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)showDeleteFailureAlert
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
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DELETE_CARD_SHEET_FAILURE_ALERT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_CARD_SHEET_FAILURE_ALERT_EXPLANATION"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactListDeleteContactsAction componentsFactory](self, "componentsFactory");
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
  CNContactListDeleteContactsAction *v2;
  void *v3;

  v2 = self;
  -[CNContactListDeleteContactsAction actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNContactListDeleteContactsAction editRequiresAuthorizationCheckForActions:](v2, "editRequiresAuthorizationCheckForActions:", v3);

  return (char)v2;
}

- (BOOL)editRequiresAuthorizationCheckForActions:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__CNContactListDeleteContactsAction_editRequiresAuthorizationCheckForActions___block_invoke;
  v4[3] = &unk_1E204A578;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

- (void)performUndoAction
{
  void *v3;
  id v4;

  -[CNContactListDeleteContactsAction actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_77);

  -[CNContactListAction delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionDidFinish:", self);

}

- (CNUIExternalComponentsFactory)componentsFactory
{
  return self->_componentsFactory;
}

- (CNUICoreRecentsManager)recentsManager
{
  return self->_recentsManager;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_componentsFactory, 0);
}

uint64_t __54__CNContactListDeleteContactsAction_performUndoAction__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoAction");
}

uint64_t __78__CNContactListDeleteContactsAction_editRequiresAuthorizationCheckForActions___block_invoke(uint64_t a1, void *a2)
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

void __50__CNContactListDeleteContactsAction_performAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__22489;
  v7[4] = __Block_byref_object_dispose__22490;
  v8 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(a1 + 32), "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CNContactListDeleteContactsAction_performAction__block_invoke_58;
  v6[3] = &unk_1E204A530;
  v6[4] = v7;
  objc_msgSend(v4, "_cn_each:", v6);

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "showDeleteFailureAlert");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDidFinish:", *(_QWORD *)(a1 + 32));

  _Block_object_dispose(v7, 8);
}

void __50__CNContactListDeleteContactsAction_performAction__block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "executeAction") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "arrayByAddingObject:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

id __68__CNContactListDeleteContactsAction_initWithContacts_configuration___block_invoke(uint64_t a1, void *a2)
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
      v11[2] = __68__CNContactListDeleteContactsAction_initWithContacts_configuration___block_invoke_48;
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
      _os_log_error_impl(&dword_18AC56000, v7, OS_LOG_TYPE_ERROR, "Contact was nil for delete action with contacts: %@", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

id __68__CNContactListDeleteContactsAction_initWithContacts_configuration___block_invoke_48(uint64_t a1, void *a2)
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
  if (log_cn_once_token_4_22501 != -1)
    dispatch_once(&log_cn_once_token_4_22501, &__block_literal_global_39_22502);
  return (id)log_cn_once_object_4_22503;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0D13CE8], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C966A0];
  v10[1] = v4;
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactListDeleteContactsAction descriptorForRequiredKeys]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)actionForContact:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactListDeleteContactAction *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactListDeleteContactAction *v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "contactViewCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerForContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [CNContactListDeleteContactAction alloc];
  objc_msgSend(v5, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "recentsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNContactListDeleteContactAction initWithContact:contactStore:containerIdentifier:recentsManager:](v10, "initWithContact:contactStore:containerIdentifier:recentsManager:", v6, v11, v9, v13);

  return v14;
}

void __40__CNContactListDeleteContactsAction_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIListDeleteContactsAction");
  v1 = (void *)log_cn_once_object_4_22503;
  log_cn_once_object_4_22503 = (uint64_t)v0;

}

@end
