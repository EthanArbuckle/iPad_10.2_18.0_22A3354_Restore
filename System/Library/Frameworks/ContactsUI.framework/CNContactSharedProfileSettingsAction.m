@implementation CNContactSharedProfileSettingsAction

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1)
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_1272);
  return (id)os_log_cn_once_object_1;
}

void __46__CNContactSharedProfileSettingsAction_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNContactSharedProfileSettingsAction");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;

}

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CNSharedProfileOnboardingController *v8;
  void *v9;
  CNSharedProfileOnboardingController *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  void *v20;
  _QWORD v21[4];
  void *v22;
  _QWORD aBlock[5];
  id v24;
  uint8_t buf[16];

  v4 = a3;
  -[CNContactSharedProfileSettingsAction contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke;
    aBlock[3] = &unk_1E20482C0;
    aBlock[4] = self;
    v24 = v4;
    v7 = _Block_copy(aBlock);
    v8 = [CNSharedProfileOnboardingController alloc];
    -[CNContactSharedProfileSettingsAction contactStore](self, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNSharedProfileOnboardingController initWithContactStore:](v8, "initWithContactStore:", v9);

    -[CNContactAction delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CNContactSharedProfileSettingsAction setOnboardingController:](self, "setOnboardingController:", v10);
      -[CNContactAction delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actionPresentingViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v6;
      v21[1] = 3221225472;
      v21[2] = __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_2;
      v21[3] = &unk_1E2047EA8;
      v15 = &v22;
      v22 = v7;
      v16 = v7;
      -[CNSharedProfileOnboardingController presentOnboardingFlowIfNeededForSettingsMode:fromViewController:completion:](v10, "presentOnboardingFlowIfNeededForSettingsMode:fromViewController:completion:", 1, v14, v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nicknameProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_3;
      v19[3] = &unk_1E2047ED0;
      v15 = &v20;
      v20 = v7;
      v18 = v7;
      objc_msgSend(v14, "fetchPersonalNicknameAsContactWithCompletion:", v19);
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, "me card sharing settings requires a contact store", buf, 2u);
    }

  }
}

- (void)onboardingControllerDidFinishSetup:(id)a3
{
  -[CNContactSharedProfileSettingsAction setOnboardingController:](self, "setOnboardingController:", 0);
}

- (void)presentSharingSettingsWithNicknameContact:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[CNContactSharedProfileSettingsAction meContact](self, "meContact");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactSharedProfileSettingsAction contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSharedProfileOnboardingController sharingSettingsViewControllerForNicknameContact:meContact:mode:contactStore:](CNSharedProfileOnboardingController, "sharingSettingsViewControllerForNicknameContact:meContact:mode:contactStore:", v7, v11, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", self);
  -[CNContactAction delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "action:pushViewController:sender:", self, v9, v6);

}

- (id)meContact
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CNContactSharedProfileSettingsAction contactStore](self, "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNMeCardSharingSettingsViewController descriptorForRequiredKeys](CNMeCardSharingSettingsViewController, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_INFO, "No me contact found, error: %@", buf, 0xCu);
    }

  }
  return v5;
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nicknameProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharingEnabled:", v4);

  -[CNContactSharedProfileSettingsAction sharedProfileSettingsActionDelegate](self, "sharedProfileSettingsActionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharedProfileSettingsDidUpdate");

}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nicknameProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharingAudience:", a4);

  -[CNContactSharedProfileSettingsAction sharedProfileSettingsActionDelegate](self, "sharedProfileSettingsActionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharedProfileSettingsDidUpdate");

}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0D13A38];
  v6 = a4;
  objc_msgSend(v5, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nicknameProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPersonalNicknameWithSharingResult:", v6);

  -[CNContactSharedProfileSettingsAction sharedProfileSettingsActionDelegate](self, "sharedProfileSettingsActionDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sharedProfileSettingsDidUpdate");

}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNContactSharedProfileSettingsActionDelegate)sharedProfileSettingsActionDelegate
{
  return (CNContactSharedProfileSettingsActionDelegate *)objc_loadWeakRetained((id *)&self->_sharedProfileSettingsActionDelegate);
}

- (void)setSharedProfileSettingsActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sharedProfileSettingsActionDelegate, a3);
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return (CNSharedProfileOnboardingController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOnboardingController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_destroyWeak((id *)&self->_sharedProfileSettingsActionDelegate);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  uint8_t buf[16];

  v3 = a2;
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "No personal nickname contact found", buf, 2u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_3;
  block[3] = &unk_1E204FAA0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

{
  return objc_msgSend(*(id *)(a1 + 32), "presentSharingSettingsWithNicknameContact:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
