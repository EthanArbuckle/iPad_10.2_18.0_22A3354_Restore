@implementation CNContactClearRecentsDataAction

- (CNContactClearRecentsDataAction)initWithRecentsData:(id)a3 coreRecentsManager:(id)a4
{
  id v7;
  id v8;
  CNContactClearRecentsDataAction *v9;
  CNContactClearRecentsDataAction *v10;
  CNContactClearRecentsDataAction *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactClearRecentsDataAction;
  v9 = -[CNContactAction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recentsData, a3);
    objc_storeStrong((id *)&v10->_coreRecentsManager, a4);
    v11 = v10;
  }

  return v10;
}

- (id)title
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CLEAR_RECENTS"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDestructive
{
  return 1;
}

- (BOOL)canPerformAction
{
  return 1;
}

- (void)performActionWithSender:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CNContactClearRecentsDataAction coreRecentsManager](self, "coreRecentsManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactClearRecentsDataAction recentsData](self, "recentsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentContactID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactClearRecentsDataAction recentsData](self, "recentsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CNContactClearRecentsDataAction_performActionWithSender___block_invoke;
  v10[3] = &unk_1E204D1E8;
  v10[4] = self;
  objc_msgSend(v4, "removeRecentsWithIdentifiers:domain:completionHandler:", v7, v9, v10);

}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (CNUICoreRecentsManager)coreRecentsManager
{
  return self->_coreRecentsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreRecentsManager, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
}

void __59__CNContactClearRecentsDataAction_performActionWithSender___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__CNContactClearRecentsDataAction_performActionWithSender___block_invoke_2;
  v3[3] = &unk_1E204F648;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "performBlock:", v3);

}

void __59__CNContactClearRecentsDataAction_performActionWithSender___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

@end
