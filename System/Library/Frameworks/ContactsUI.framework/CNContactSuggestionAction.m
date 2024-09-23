@implementation CNContactSuggestionAction

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v4 = a3;
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_IGNORE"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessage:", v9);

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__CNContactSuggestionAction_performActionWithSender___block_invoke;
  v18[3] = &unk_1E204F7F0;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v6, 2, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  v12 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __53__CNContactSuggestionAction_performActionWithSender___block_invoke_2;
  v17[3] = &unk_1E204F7F0;
  v17[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v15);

  -[CNContactAction delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "action:presentViewController:sender:", self, v7, v4);

}

- (BOOL)_confirmOrReject:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  id v18;

  v3 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactViewCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C973F0]);
  objc_msgSend(v8, "setSuppressChangeNotifications:", 1);
  -[CNContactAction contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v8, "confirmSuggestion:", v9);
  else
    objc_msgSend(v8, "rejectSuggestion:", v9);

  v18 = 0;
  objc_msgSend(v7, "executeSaveRequest:error:", v8, &v18);
  v10 = v18;
  if (v10)
  {
    if (v3)
      v11 = CFSTR("confirm");
    else
      v11 = CFSTR("reject");
    -[CNContactAction contact](self, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactSuggestionAction.m", 60, 3, CFSTR("Could not %@ suggestion for contact %@, error: %@"), v12, v13, v14, v15, (uint64_t)v11);

  }
  return v10 == 0;
}

- (BOOL)ignoreSuggestion
{
  return -[CNContactSuggestionAction _confirmOrReject:](self, "_confirmOrReject:", 0);
}

- (BOOL)confirmSuggestion
{
  return -[CNContactSuggestionAction _confirmOrReject:](self, "_confirmOrReject:", 1);
}

void __53__CNContactSuggestionAction_performActionWithSender___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ignoreSuggestion");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

void __53__CNContactSuggestionAction_performActionWithSender___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWasCanceled:", *(_QWORD *)(a1 + 32));

}

@end
