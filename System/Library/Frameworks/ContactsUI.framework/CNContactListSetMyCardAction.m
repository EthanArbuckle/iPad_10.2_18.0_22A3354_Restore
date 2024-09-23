@implementation CNContactListSetMyCardAction

+ (id)log
{
  if (log_cn_once_token_1_33348 != -1)
    dispatch_once(&log_cn_once_token_1_33348, &__block_literal_global_33349);
  return (id)log_cn_once_object_1_33350;
}

void __35__CNContactListSetMyCardAction_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIContactListSetMyCardAction");
  v1 = (void *)log_cn_once_object_1_33350;
  log_cn_once_object_1_33350 = (uint64_t)v0;

}

- (CNContactListSetMyCardAction)initWithContact:(id)a3 configuration:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CNContactListSetMyCardAction *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNContactListAction initWithContacts:configuration:](self, "initWithContacts:configuration:", v9, v7, v12, v13);
  return v10;
}

- (id)updatedMeContact
{
  void *v2;
  void *v3;

  -[CNContactListAction contacts](self, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performAction
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v3 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LIST_MENU_ACTION_MY_CARD_ALERT_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListAction configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListSetMyCardAction updatedMeContact](self, "updatedMeContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromContact:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListAction configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LIST_MENU_ACTION_MY_CARD"), &stru_1E20507A8, CFSTR("Localized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__CNContactListSetMyCardAction_performAction__block_invoke;
  v25[3] = &unk_1E204F7F0;
  v25[4] = self;
  objc_msgSend(v14, "alertActionWithTitle:style:handler:", v16, 0, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17);

  -[CNContactListAction configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "environment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "alertActionWithTitle:style:handler:", v22, 1, &__block_literal_global_15_33379);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v23);

  -[CNContactListAction delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "action:presentViewController:", self, v11);

}

- (void)fetchOriginalMeContact
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CNContactListAction configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", MEMORY[0x1E0C9AA60], &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;

  -[CNContactListSetMyCardAction setOriginalMeContact:](self, "setOriginalMeContact:", v5);
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_18AC56000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch current me contact: %@", buf, 0xCu);
    }

  }
}

- (void)updateMeContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactListAction configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "setMeContact:error:", v4, &v10);

  v8 = v10;
  if ((v7 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "Failed to set contact as me contact: %@", buf, 0xCu);
    }

  }
}

- (void)performUndoAction
{
  void *v3;
  id v4;

  -[CNContactListSetMyCardAction originalMeContact](self, "originalMeContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListSetMyCardAction updateMeContact:](self, "updateMeContact:", v3);

  -[CNContactListAction delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionDidFinish:", self);

}

- (CNContact)originalMeContact
{
  return self->_originalMeContact;
}

- (void)setOriginalMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_originalMeContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMeContact, 0);
}

void __45__CNContactListSetMyCardAction_performAction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "fetchOriginalMeContact");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "updatedMeContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMeContact:", v3);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

@end
