@implementation CNContactDeleteContactAction

- (CNContactDeleteContactAction)initWithContact:(id)a3 recentsManager:(id)a4 componentsFactory:(id)a5
{
  id v9;
  id v10;
  CNContactDeleteContactAction *v11;
  CNContactDeleteContactAction *v12;
  CNContactDeleteContactAction *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNContactDeleteContactAction;
  v11 = -[CNContactAction initWithContact:](&v15, sel_initWithContact_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_componentsFactory, a5);
    objc_storeStrong((id *)&v12->_recentsManager, a4);
    v13 = v12;
  }

  return v12;
}

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];

  v4 = a3;
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_DELETE_CARD"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactAction contact](self, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainStoreLinkedContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 2)
  {
    v15 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_DELETE_CARD_MULTIPLE"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAction contact](self, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mainStoreLinkedContacts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v12, objc_msgSend(v14, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v15, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactDeleteContactAction componentsFactory](self, "componentsFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__CNContactDeleteContactAction_performActionWithSender___block_invoke;
  v26[3] = &unk_1E204F7F0;
  v26[4] = self;
  objc_msgSend(v17, "alertActionWithTitle:style:handler:", v6, 2, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v19);

  -[CNContactDeleteContactAction componentsFactory](self, "componentsFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __56__CNContactDeleteContactAction_performActionWithSender___block_invoke_2;
  v25[3] = &unk_1E204F7F0;
  v25[4] = self;
  objc_msgSend(v20, "alertActionWithTitle:style:handler:", v22, 1, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v23);

  -[CNContactAction delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "action:presentViewController:sender:", self, v16, v4);

}

- (BOOL)deleteContact
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v3, "setIgnoresGuardianRestrictions:", 1);
  -[CNContactAction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactViewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactAction mutableContact](self, "mutableContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[CNContactAction mutableContact](self, "mutableContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteContact:", v9);

  v22 = 0;
  objc_msgSend(v6, "executeSaveRequest:error:", v3, &v22);
  v10 = v22;
  v15 = v10;
  if (v10)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactDeleteContactAction.m", 105, 3, CFSTR("Could not delete contact: %@"), v11, v12, v13, v14, (uint64_t)v10);
  }
  else
  {
    -[CNContactDeleteContactAction recentsManager](self, "recentsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recentContactsMatchingAllPropertiesOfContact:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __45__CNContactDeleteContactAction_deleteContact__block_invoke;
    v20[3] = &unk_1E204BDA8;
    v21 = v16;
    v18 = v16;
    objc_msgSend(v17, "addSuccessBlock:", v20);

  }
  return v15 == 0;
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

  -[CNContactDeleteContactAction componentsFactory](self, "componentsFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertActionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v11);

  -[CNContactAction delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "action:presentViewController:sender:", self, v13, self);

}

- (id)_makeAvatarImageForTraitCollection:(id)a3
{
  id v4;
  CNAvatarImageRenderer *v5;
  void *v6;
  CNAvatarImageRenderer *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [CNAvatarImageRenderer alloc];
  +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNAvatarImageRenderer initWithSettings:](v5, "initWithSettings:", v6);

  objc_msgSend(v4, "displayScale");
  v9 = v8;
  v10 = objc_msgSend(v4, "layoutDirection");

  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v10 == 1, 0, 40.0, 40.0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarImageRenderer avatarImageForContacts:scope:](v7, "avatarImageForContacts:scope:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[CNAvatarImageRenderer placeholderImageProvider](v7, "placeholderImageProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageForSize:scale:", 40.0, 40.0, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (CNUIExternalComponentsFactory)componentsFactory
{
  return self->_componentsFactory;
}

- (CNUICoreRecentsManager)recentsManager
{
  return self->_recentsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_componentsFactory, 0);
}

uint64_t __45__CNContactDeleteContactAction_deleteContact__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRecents:completionHandler:", a2, 0);
}

void __56__CNContactDeleteContactAction_performActionWithSender___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "deleteContact") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "showDeleteFailureAlert");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

void __56__CNContactDeleteContactAction_performActionWithSender___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWasCanceled:", *(_QWORD *)(a1 + 32));

}

@end
