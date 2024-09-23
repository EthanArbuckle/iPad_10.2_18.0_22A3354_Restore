@implementation CNContactIgnoreDonatedInformationAction

- (CNContactIgnoreDonatedInformationAction)initWithContact:(id)a3
{
  id v4;
  CNContactIgnoreDonatedInformationAction *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNInitializerUnavailableException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CNContactIgnoreDonatedInformationAction)initWithContact:(id)a3 donationStore:(id)a4 componentsFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CNContactIgnoreDonatedInformationAction *v12;
  CNContactIgnoreDonatedInformationAction *v13;
  CNContactIgnoreDonatedInformationAction *v14;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("parameter ‘contact’ must be nonnull");
    goto LABEL_10;
  }
  if (!v9)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("parameter ‘donationStore’ must be nonnull");
    goto LABEL_10;
  }
  v11 = v10;
  if (!v10)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("parameter ‘componentsFactory’ must be nonnull");
LABEL_10:
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)CNContactIgnoreDonatedInformationAction;
  v12 = -[CNContactAction initWithContact:](&v20, sel_initWithContact_, v8);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_componentsFactory, a5);
    objc_storeStrong((id *)&v13->_donationStore, a4);
    v14 = v13;
  }

  return v13;
}

- (void)performActionWithSender:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v4 = a3;
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_IGNORE_CARD"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactIgnoreDonatedInformationAction componentsFactory](self, "componentsFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__CNContactIgnoreDonatedInformationAction_performActionWithSender___block_invoke;
  v17[3] = &unk_1E204F7F0;
  v17[4] = self;
  objc_msgSend(v8, "alertActionWithTitle:style:handler:", v6, 2, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  -[CNContactIgnoreDonatedInformationAction componentsFactory](self, "componentsFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __67__CNContactIgnoreDonatedInformationAction_performActionWithSender___block_invoke_2;
  v16[3] = &unk_1E204F7F0;
  v16[4] = self;
  objc_msgSend(v11, "alertActionWithTitle:style:handler:", v13, 1, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v14);

  -[CNContactAction delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "action:presentViewController:sender:", self, v7, v4);

}

- (BOOL)rejectAllDonations
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[6];
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__29181;
  v19 = __Block_byref_object_dispose__29182;
  v20 = 0;
  -[CNContactIgnoreDonatedInformationAction donationStore](self, "donationStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meCardDonations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(v16 + 5);
  obj = (id)v16[5];
  objc_msgSend(v4, "result:", &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__CNContactIgnoreDonatedInformationAction_rejectAllDonations__block_invoke;
  v13[3] = &unk_1E204B6B8;
  v13[4] = self;
  v13[5] = &v15;
  objc_msgSend(v6, "_cn_each:", v13);

  v11 = v16[5];
  if (v11)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactIgnoreDonatedInformationAction.m", 85, 3, CFSTR("Error rejecting donated me card %@"), v7, v8, v9, v10, v16[5]);
  _Block_object_dispose(&v15, 8);

  return v11 == 0;
}

- (void)showRejectionFailureAlert
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
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IGNORE_CARD_SHEET_FAILURE_ALERT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("IGNORE_CARD_SHEET_FAILURE_ALERT_EXPLANATION"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactIgnoreDonatedInformationAction componentsFactory](self, "componentsFactory");
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

- (CNUIExternalComponentsFactory)componentsFactory
{
  return self->_componentsFactory;
}

- (CNDonationStore)donationStore
{
  return self->_donationStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationStore, 0);
  objc_storeStrong((id *)&self->_componentsFactory, 0);
}

void __61__CNContactIgnoreDonatedInformationAction_rejectAllDonations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "donationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "donationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__CNContactIgnoreDonatedInformationAction_rejectAllDonations__block_invoke_2;
  v8[3] = &unk_1E204B690;
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "rejectValueWithDonationIdentifier:completionHandler:", v7, v8);

}

void __61__CNContactIgnoreDonatedInformationAction_rejectAllDonations__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __67__CNContactIgnoreDonatedInformationAction_performActionWithSender___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "rejectAllDonations") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "showRejectionFailureAlert");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

void __67__CNContactIgnoreDonatedInformationAction_performActionWithSender___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWasCanceled:", *(_QWORD *)(a1 + 32));

}

@end
