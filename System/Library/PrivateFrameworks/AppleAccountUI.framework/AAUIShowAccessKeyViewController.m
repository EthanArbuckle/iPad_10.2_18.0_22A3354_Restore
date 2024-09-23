@implementation AAUIShowAccessKeyViewController

- (AAUIShowAccessKeyViewController)initWithAppleAccount:(id)a3 localContactInfo:(id)a4 accessKey:(id)a5 accessKeyQRCodeImage:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AAUIShowAccessKeyViewController *v15;
  AAUIShowAccessKeyViewController *v16;
  AAUIAccountContactsSpecifierCreator *v17;
  AAUIAccountContactsSpecifierCreator *specifierCreator;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AAUIShowAccessKeyViewController;
  v15 = -[AAUIShowAccessKeyViewController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appleAccount, a3);
    v17 = objc_alloc_init(AAUIAccountContactsSpecifierCreator);
    specifierCreator = v16->_specifierCreator;
    v16->_specifierCreator = v17;

    objc_storeStrong((id *)&v16->_localContact, a4);
    objc_storeStrong((id *)&v16->_accessKey, a5);
    objc_storeStrong((id *)&v16->_qrCodeImage, a6);
  }

  return v16;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUIShowAccessKeyViewController;
  -[AAUIShowAccessKeyViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AAUIShowAccessKeyViewController _setupNavigationBar](self, "_setupNavigationBar");
  -[AAUIShowAccessKeyViewController _setTableSeparatorInset](self, "_setTableSeparatorInset");
}

- (void)_setupNavigationBar
{
  void *v3;
  id v4;

  -[AAUIShowAccessKeyViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[AALocalContactInfo contactType](self->_localContact, "contactType") & 4) != 0)
    objc_msgSend(MEMORY[0x1E0CFAD50], "showAccessKeyBeneficiaryTitle");
  else
    objc_msgSend(MEMORY[0x1E0CFAD50], "showAccessKeyBenefactorTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

}

- (void)_setTableSeparatorInset
{
  id v2;

  -[AAUIShowAccessKeyViewController table](self, "table");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSeparatorInset:", 0.0, 0.0, 3.0, 0.0);

}

- (id)specifiers
{
  uint64_t v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "AAUIShowAccessKeyViewController is loading specifiers.", (uint8_t *)&v10, 2u);
    }

    -[AAUIShowAccessKeyViewController _specifiersForShowAccessKey](self, "_specifiersForShowAccessKey");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

  }
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "AAUIShowAccessKeyViewController specifiers: returning %@", (uint8_t *)&v10, 0xCu);
  }

  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (id)_specifiersForShowAccessKey
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CFAD50], "showAccessKeyCellTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AALocalContactInfo contactType](self->_localContact, "contactType");
  v6 = (void *)MEMORY[0x1E0CB3940];
  if ((v5 & 4) != 0)
    objc_msgSend(MEMORY[0x1E0CFAD50], "showAccessKeyBeneficiarySubtitle");
  else
    objc_msgSend(MEMORY[0x1E0CFAD50], "showAccessKeyBenefactorSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AALocalContactInfo firstName](self->_localContact, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIAccountContactsSpecifierCreator createTableCellWithName:title:longSubtitle:image:](self->_specifierCreator, "createTableCellWithName:title:longSubtitle:image:", v4, v4, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);
  +[AAUIInheritanceAccessKeyCell specifierForAcessKey:qrCodeImage:](AAUIInheritanceAccessKeyCell, "specifierForAcessKey:qrCodeImage:", self->_accessKey, self->_qrCodeImage);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0CFAD50], "showAccessKeyPrintTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, 0, 13, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setButtonAction:", sel__printTapped_);
  objc_msgSend(v3, "addObject:", v13);
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (void)_printTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AAUIInheritanceAccessKeyPDFGenerator *v11;

  v11 = -[AAUIInheritanceAccessKeyPDFGenerator initWithAppleAccount:localContactInfo:]([AAUIInheritanceAccessKeyPDFGenerator alloc], "initWithAppleAccount:localContactInfo:", self->_appleAccount, self->_localContact);
  -[AAUIInheritanceAccessKeyPDFGenerator createPDFDocumentData](v11, "createPDFDocumentData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D80C28], "canPrintData:", v4))
  {
    objc_msgSend(MEMORY[0x1E0D80C20], "printInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[AALocalContactInfo firstName](self->_localContact, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyDocumentTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ - %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setJobName:", v9);

    objc_msgSend(v5, "setOrientation:", 0);
    objc_msgSend(v5, "setOutputType:", 2);
    objc_msgSend(MEMORY[0x1E0D80C28], "sharedPrintController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrintInfo:", v5);
    objc_msgSend(v10, "setShowsNumberOfCopies:", 1);
    objc_msgSend(v10, "setPrintingItem:", v4);
    objc_msgSend(v10, "presentAnimated:completionHandler:", 1, &__block_literal_global_24);

  }
}

void __48__AAUIShowAccessKeyViewController__printTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if (v4)
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Error presenting printInteractionController - %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)inviteMessageFlowDidFinish:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "%@ : Resend Invite flow did finish", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(v3, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)inviteMessageWasSent:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "%@ : Sending IDS Message to Beneficiary", buf, 0xCu);

  }
  v9 = (void *)objc_opt_new();
  -[AALocalContactInfo inheritanceContactInfo](self->_localContact, "inheritanceContactInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__AAUIShowAccessKeyViewController_inviteMessageWasSent_completion___block_invoke;
  v12[3] = &unk_1EA2DC028;
  v12[4] = self;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v9, "sendInvitationToContact:completion:", v10, v12);

}

void __67__AAUIShowAccessKeyViewController_inviteMessageWasSent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AAUIShowAccessKeyViewController_inviteMessageWasSent_completion___block_invoke_2;
  block[3] = &unk_1EA2DC000;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__AAUIShowAccessKeyViewController_inviteMessageWasSent_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (!*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2_cold_1(a1, v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)inviteMessageCompleteSecondaryButtonTapped:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AAUIShowAccessKeyViewController_inviteMessageCompleteSecondaryButtonTapped___block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __78__AAUIShowAccessKeyViewController_inviteMessageCompleteSecondaryButtonTapped___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_41);

}

void __78__AAUIShowAccessKeyViewController_inviteMessageCompleteSecondaryButtonTapped___block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=accountContactDetails"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4, a5.x, a5.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__AAUIShowAccessKeyViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v9[3] = &unk_1EA2DDCD8;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __93__AAUIShowAccessKeyViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CFAD50], "showAccessKeyCopyTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__AAUIShowAccessKeyViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v10[3] = &unk_1EA2DDCB0;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC39D0];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuWithChildren:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __93__AAUIShowAccessKeyViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1400));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
  objc_storeStrong((id *)&self->_qrCodeImage, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_localContact, 0);
  objc_storeStrong((id *)&self->_specifierCreator, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end
