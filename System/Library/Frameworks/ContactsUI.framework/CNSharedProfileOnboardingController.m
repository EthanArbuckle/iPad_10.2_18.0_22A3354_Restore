@implementation CNSharedProfileOnboardingController

- (void)presentOnboardingFlowIfNeededForMode:(int64_t)a3 fromViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  if (-[CNSharedProfileOnboardingController shouldShowOnboarding](self, "shouldShowOnboarding")
    && -[CNSharedProfileOnboardingController canShowOnboardingAllowingMultiplePhoneNumbers:](self, "canShowOnboardingAllowingMultiplePhoneNumbers:", 0)&& -[CNSharedProfileOnboardingController isPhotosReadyForOnboarding](self, "isPhotosReadyForOnboarding"))
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nicknameProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __95__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForMode_fromViewController___block_invoke;
    v9[3] = &unk_1E204EEB0;
    v9[4] = self;
    v11 = a3;
    v10 = v6;
    objc_msgSend(v8, "fetchPersonalNicknameAsContactWithCompletion:", v9);

  }
}

- (BOOL)shouldShowOnboarding
{
  void *v2;
  char v3;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowOnboarding");

  return v3;
}

- (CNSharedProfileOnboardingStateController)stateController
{
  return self->_stateController;
}

- (CNSharedProfileOnboardingController)initWithContactStore:(id)a3
{
  id v4;
  CNSharedProfileOnboardingStateController *v5;
  CNSharedProfileOnboardingController *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNSharedProfileOnboardingStateController);
  v6 = -[CNSharedProfileOnboardingController initWithContactStore:stateController:](self, "initWithContactStore:stateController:", v4, v5);

  return v6;
}

- (CNSharedProfileOnboardingController)initWithContactStore:(id)a3 stateController:(id)a4
{
  id v7;
  id v8;
  CNSharedProfileOnboardingController *v9;
  CNSharedProfileOnboardingController *v10;
  CNSharedProfileOnboardingController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSharedProfileOnboardingController;
  v9 = -[CNSharedProfileOnboardingController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_stateController, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseViewController, 0);
  objc_storeStrong((id *)&self->_setupFlowManager, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)isPhotosReadyForOnboarding
{
  void *v2;
  char v3;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPhotosReadyForOnboarding");

  return v3;
}

- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "canShowOnboardingAllowingMultiplePhoneNumbers:", v3);

  return v3;
}

- (BOOL)alwaysShowSNaPOnboarding
{
  void *v2;
  char v3;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alwaysShowSNaPOnboarding");

  return v3;
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  void *v2;
  char v3;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "multiplePhoneNumbersTiedToAppleID");

  return v3;
}

- (BOOL)accountCanCreateSNaP
{
  void *v2;
  char v3;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accountCanCreateSNaP");

  return v3;
}

- (BOOL)accountCanCreateSNaPWithShouldShowErrorAlert:(BOOL)a3 fromViewController:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  _BOOL4 v14;
  BOOL v15;
  __int16 v17;
  __int16 v18;

  v4 = a3;
  v6 = a4;
  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "iCloudSignedInToUseNicknames");

  if ((v8 & 1) == 0)
  {
    if (v4)
      -[CNSharedProfileOnboardingController showiCloudNotSignedInAlertForNicknamesFromViewController:](self, "showiCloudNotSignedInAlertForNicknamesFromViewController:", v6);
    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    v18 = 0;
    v12 = "Cannot create SNaP on account because iCloud is not signed in";
    v13 = (uint8_t *)&v18;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "featureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isFeatureEnabled:", 14) & 1) != 0)
  {

LABEL_15:
    v15 = 1;
    goto LABEL_16;
  }
  v14 = -[CNSharedProfileOnboardingController multiplePhoneNumbersTiedToAppleID](self, "multiplePhoneNumbersTiedToAppleID");

  if (!v14)
    goto LABEL_15;
  if (v4)
    -[CNSharedProfileOnboardingController showMultiplePhoneNumbersAlertForNicknamesFromViewController:](self, "showMultiplePhoneNumbersAlertForNicknamesFromViewController:", v6);
  objc_msgSend((id)objc_opt_class(), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v17 = 0;
    v12 = "Cannot create SNaP on account because multiple numbers are associated with Apple ID";
    v13 = (uint8_t *)&v17;
LABEL_13:
    _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
  }
LABEL_14:

  v15 = 0;
LABEL_16:

  return v15;
}

- (void)showiCloudNotSignedInAlertForNicknamesFromViewController:(id)a3
{
  void *v3;
  id v4;
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
  v4 = a3;
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARING_NICKNAME_FEATURE_NOT_AVAILABLE_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARING_NICKNAME_ICLOUD_NOT_SIGNED_IN_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v12);

  objc_msgSend(v4, "presentViewController:animated:completion:", v13, 1, 0);
}

- (void)showMultiplePhoneNumbersAlertForNicknamesFromViewController:(id)a3
{
  void *v3;
  id v4;
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
  v4 = a3;
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARING_NICKNAME_FEATURE_NOT_AVAILABLE_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARING_NICKNAME_MULTIPLE_PHONE_NUMBERS_MESSAGE_LEGACY"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v12);

  objc_msgSend(v4, "presentViewController:animated:completion:", v13, 1, 0);
}

- (void)presentOnboardingFlowForNicknameContact:(id)a3 mode:(int64_t)a4 fromViewController:(id)a5
{
  id v8;
  id v9;
  CNSNaPSetupFlowManager *v10;
  void *v11;
  CNSNaPSetupFlowManager *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a3;
  -[CNSharedProfileOnboardingController meOrPrimaryAccountContact](self, "meOrPrimaryAccountContact");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileOnboardingController setBaseViewController:](self, "setBaseViewController:", v8);

  v10 = [CNSNaPSetupFlowManager alloc];
  -[CNSharedProfileOnboardingController contactStore](self, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNSNaPSetupFlowManager initWithPresenterDelegate:contactStore:mode:](v10, "initWithPresenterDelegate:contactStore:mode:", self, v11, a4);

  -[CNSharedProfileOnboardingController setSetupFlowManager:](self, "setSetupFlowManager:", v12);
  -[CNSharedProfileOnboardingController setupFlowManager](self, "setupFlowManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[CNSharedProfileOnboardingController setupFlowManager](self, "setupFlowManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startOnboardingFlowWithNicknameContact:meContact:", v9, v15);

  -[CNSharedProfileOnboardingController writeToDefaultsLastShownOnboardingVersion](self, "writeToDefaultsLastShownOnboardingVersion");
}

- (BOOL)shouldShowOnboardingForSettingsWithNicknameContact:(id)a3 meContact:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  int v28;
  int v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[CNSharedProfileOnboardingController canShowOnboardingAllowingMultiplePhoneNumbers:](self, "canShowOnboardingAllowingMultiplePhoneNumbers:", 1);
  v9 = -[CNSharedProfileOnboardingController shouldShowOnboarding](self, "shouldShowOnboarding");
  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 67109376;
    v31 = v8;
    v32 = 1024;
    v33 = v9;
    _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEFAULT, "Should show onboarding: canShowOnboarding %d, newOnboardingVersionAvailable %d", (uint8_t *)&v30, 0xEu);
  }

  if (v8 && !v9)
  {
    -[CNSharedProfileOnboardingController stateController](self, "stateController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "lastShowOnboardingVersionInSettings");
    -[CNSharedProfileOnboardingController stateController](self, "stateController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "currentOnboardingVersion");

    objc_msgSend((id)objc_opt_class(), "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 67109120;
      v31 = v12 >= v14;
      _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_DEFAULT, "Should show onboarding: hasShownOnboardingInSettings %d", (uint8_t *)&v30, 8u);
    }

    if (v12 < v14)
    {
      v16 = -[CNSharedProfileOnboardingController hasCompletedOnboarding](self, "hasCompletedOnboarding");
      v17 = -[CNSharedProfileOnboardingController didSkipPosterSetup](self, "didSkipPosterSetup");
      -[CNSharedProfileOnboardingController stateController](self, "stateController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "deviceSupportsPosters");

      v20 = *MEMORY[0x1E0D13818];
      objc_msgSend(v7, "wallpaper");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "posterArchiveData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (*(uint64_t (**)(uint64_t, void *))(v20 + 16))(v20, v22);

      objc_msgSend(v6, "wallpaper");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "posterArchiveData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (*(uint64_t (**)(uint64_t, void *))(v20 + 16))(v20, v25);

      objc_msgSend((id)objc_opt_class(), "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 67110144;
        v31 = !v16;
        v32 = 1024;
        v33 = v6 == 0;
        v34 = 1024;
        v35 = v23;
        v36 = 1024;
        v37 = v26;
        v38 = 1024;
        v39 = v17;
        _os_log_impl(&dword_18AC56000, v27, OS_LOG_TYPE_DEFAULT, "hasNeverCompletedOnboarding %d, hasNoNickname %d, hasNoMeContactPoster %d, hasNoNicknamePoster %d, userSkippedPosterSetup %d", (uint8_t *)&v30, 0x20u);
      }

      if (v6)
        v28 = 1;
      else
        v28 = v16;
      if (v19)
      {
        if (!v28 || ((v23 & v26 ^ 1 | v17) & 1) == 0)
          goto LABEL_15;
      }
      else if (!v28)
      {
LABEL_15:
        LOBYTE(v8) = 1;
        goto LABEL_18;
      }
    }
    LOBYTE(v8) = 0;
  }
LABEL_18:

  return v8;
}

- (void)presentOnboardingFlowIfNeededForSettingsMode:(int64_t)a3 fromViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  if (-[CNSharedProfileOnboardingController accountCanCreateSNaPWithShouldShowErrorAlert:fromViewController:](self, "accountCanCreateSNaPWithShouldShowErrorAlert:fromViewController:", 1, v8))
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nicknameProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __114__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForSettingsMode_fromViewController_completion___block_invoke;
    v12[3] = &unk_1E204EF00;
    v12[4] = self;
    v15 = a3;
    v13 = v8;
    v14 = v9;
    objc_msgSend(v11, "fetchPersonalNicknameAsContactWithCompletion:", v12);

  }
}

- (void)startOnboardingOrEditForMode:(int64_t)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__CNSharedProfileOnboardingController_startOnboardingOrEditForMode_fromViewController___block_invoke;
  v8[3] = &unk_1E204EF28;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[CNSharedProfileOnboardingController presentOnboardingFlowIfNeededForSettingsMode:fromViewController:completion:](self, "presentOnboardingFlowIfNeededForSettingsMode:fromViewController:completion:", a3, v7, v8);

}

- (void)presentSettingsForMode:(int64_t)a3 fromViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nicknameProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__CNSharedProfileOnboardingController_presentSettingsForMode_fromViewController___block_invoke;
  v10[3] = &unk_1E204EEB0;
  v11 = v6;
  v12 = a3;
  v10[4] = self;
  v9 = v6;
  objc_msgSend(v8, "fetchPersonalNicknameAsContactWithCompletion:", v10);

}

- (void)presentSettingsForNicknameContact:(id)a3 mode:(int64_t)a4 fromViewController:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[CNSharedProfileOnboardingController meContact](self, "meContact");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileOnboardingController presentSettingsForNicknameContact:meContact:mode:fromViewController:](self, "presentSettingsForNicknameContact:meContact:mode:fromViewController:", v9, v10, a4, v8);

}

- (void)presentSettingsForNicknameContact:(id)a3 meContact:(id)a4 mode:(int64_t)a5 fromViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __107__CNSharedProfileOnboardingController_presentSettingsForNicknameContact_meContact_mode_fromViewController___block_invoke;
  v17[3] = &unk_1E204EF50;
  v17[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v13, "performBlock:", v17);

}

- (void)dismissOnboardingIfNeeded
{
  id v2;

  -[CNSharedProfileOnboardingController setupFlowManager](self, "setupFlowManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissOnboardingIfNeeded");

}

- (void)dismiss:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[CNSharedProfileOnboardingController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__CNSharedProfileOnboardingController_dismiss___block_invoke;
  v5[3] = &unk_1E204F648;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

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
  -[CNSharedProfileOnboardingController contactStore](self, "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
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
    objc_msgSend((id)objc_opt_class(), "log");
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

- (id)meOrPrimaryAccountContact
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CNSharedProfileOnboardingController meContact](self, "meContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_primaryAppleAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v6, "_cn_firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGivenName:", v8);

    objc_msgSend(v6, "_cn_lastName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFamilyName:", v9);

    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_INFO, "Failed to fetch current me contact, falling back to contact created from primary account %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v7, "freeze");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)writeToDefaultsLastShownOnboardingVersion
{
  id v2;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeToDefaultsLastShownOnboardingVersion");

}

- (int64_t)lastShownOnboardingVersion
{
  void *v2;
  int64_t v3;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastShownOnboardingVersion");

  return v3;
}

- (BOOL)hasCompletedOnboarding
{
  void *v2;
  char v3;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCompletedOnboarding");

  return v3;
}

- (void)writeToDefaultsCompletedOnboarding:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToDefaultsCompletedOnboarding:", v3);

}

- (BOOL)didSkipPosterSetup
{
  void *v2;
  char v3;

  -[CNSharedProfileOnboardingController stateController](self, "stateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "didSkipPosterSetup");

  return v3;
}

- (void)updateNicknameWithSharingResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0D13A38];
  v5 = a3;
  objc_msgSend(v4, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nicknameProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonalNicknameWithSharingResult:", v5);

  -[CNSharedProfileOnboardingController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNSharedProfileOnboardingController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "onboardingControllerDidFinishSetup:", self);

  }
}

- (void)updateNicknameWithSharingState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nicknameProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharingEnabled:", v3);

}

- (void)updateNicknameWithAudience:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nicknameProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharingAudience:", a3);

}

- (void)onboardingFromFlowManager:(id)a3 didUpdateWithSharingResult:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEFAULT, "Onboarding controller did finish with sharing result", v7, 2u);
  }

  -[CNSharedProfileOnboardingController updateNicknameWithSharingResult:](self, "updateNicknameWithSharingResult:", v5);
  -[CNSharedProfileOnboardingController writeToDefaultsCompletedOnboarding:](self, "writeToDefaultsCompletedOnboarding:", 1);
  -[CNSharedProfileOnboardingController setSetupFlowManager:](self, "setSetupFlowManager:", 0);
}

- (void)onboardingFromFlowManager:(id)a3 didUpdateSharingState:(BOOL)a4
{
  -[CNSharedProfileOnboardingController updateNicknameWithSharingState:](self, "updateNicknameWithSharingState:", a4);
  -[CNSharedProfileOnboardingController writeToDefaultsCompletedOnboarding:](self, "writeToDefaultsCompletedOnboarding:", 1);
}

- (void)onboardingFromFlowManager:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  -[CNSharedProfileOnboardingController updateNicknameWithAudience:](self, "updateNicknameWithAudience:", a4);
  -[CNSharedProfileOnboardingController writeToDefaultsCompletedOnboarding:](self, "writeToDefaultsCompletedOnboarding:", 1);
}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  -[CNSharedProfileOnboardingController updateNicknameWithSharingResult:](self, "updateNicknameWithSharingResult:", a4);
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  -[CNSharedProfileOnboardingController updateNicknameWithSharingState:](self, "updateNicknameWithSharingState:", a4);
}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  -[CNSharedProfileOnboardingController updateNicknameWithAudience:](self, "updateNicknameWithAudience:", a4);
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  -[CNSharedProfileOnboardingController baseViewController](self, "baseViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNSharedProfileOnboardingController baseViewController](self, "baseViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__CNSharedProfileOnboardingController_sender_presentViewController___block_invoke;
    v11[3] = &unk_1E2050400;
    v11[4] = self;
    v12 = v5;
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 0, v11);

  }
  else
  {
    objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  void *v5;
  _QWORD v6[5];

  -[CNSharedProfileOnboardingController baseViewController](self, "baseViewController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CNSharedProfileOnboardingController_sender_dismissViewController___block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  -[CNSharedProfileOnboardingController baseViewController](self, "baseViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__CNSharedProfileOnboardingController_sender_dismissViewController_completionHandler___block_invoke;
  v9[3] = &unk_1E204F9B0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v9);

}

- (BOOL)isPresentingModalViewController
{
  return self->isPresentingModalViewController;
}

- (CNSharedProfileOnboardingControllerDelegate)delegate
{
  return (CNSharedProfileOnboardingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setStateController:(id)a3
{
  objc_storeStrong((id *)&self->_stateController, a3);
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewController, a3);
}

- (CNSNaPSetupFlowManager)setupFlowManager
{
  return self->_setupFlowManager;
}

- (void)setSetupFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_setupFlowManager, a3);
}

- (UIViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setBaseViewController:(id)a3
{
  objc_storeStrong((id *)&self->_baseViewController, a3);
}

uint64_t __86__CNSharedProfileOnboardingController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBaseViewController:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __68__CNSharedProfileOnboardingController_sender_dismissViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBaseViewController:", 0);
}

void __68__CNSharedProfileOnboardingController_sender_presentViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "baseViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

void __47__CNSharedProfileOnboardingController_dismiss___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setPresentedViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onboardingControllerDidDismissSettings:", *(_QWORD *)(a1 + 32));

  }
}

void __107__CNSharedProfileOnboardingController_presentSettingsForNicknameContact_meContact_mode_fromViewController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v2 = (void *)objc_opt_class();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharingSettingsViewControllerForNicknameContact:meContact:mode:contactStore:", v4, v3, v5, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDelegate:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v12);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, *(_QWORD *)(a1 + 32), sel_dismiss_);
  objc_msgSend(v12, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  objc_msgSend(v7, "setModalPresentationStyle:", 2 * ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  objc_msgSend(*(id *)(a1 + 32), "setPresentedViewController:", v12);
  objc_msgSend(*(id *)(a1 + 56), "presentViewController:animated:completion:", v7, 1, 0);

}

void __81__CNSharedProfileOnboardingController_presentSettingsForMode_fromViewController___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__CNSharedProfileOnboardingController_presentSettingsForMode_fromViewController___block_invoke_2;
  v7[3] = &unk_1E204EE88;
  v5 = (void *)a1[5];
  v7[4] = a1[4];
  v8 = v3;
  v10 = a1[6];
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __81__CNSharedProfileOnboardingController_presentSettingsForMode_fromViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentSettingsForNicknameContact:mode:fromViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __87__CNSharedProfileOnboardingController_startOnboardingOrEditForMode_fromViewController___block_invoke(uint64_t result, char a2, uint64_t a3, uint64_t a4)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "presentSettingsForNicknameContact:meContact:mode:fromViewController:", a3, a4, *(_QWORD *)(result + 48), *(_QWORD *)(result + 40));
  return result;
}

void __114__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForSettingsMode_fromViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __114__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForSettingsMode_fromViewController_completion___block_invoke_2;
  v7[3] = &unk_1E204EED8;
  v11 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

void __114__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForSettingsMode_fromViewController_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "meContact");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowOnboardingForSettingsWithNicknameContact:meContact:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentOnboardingFlowForNicknameContact:mode:fromViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "stateController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToDefaultsLastShownSettingsOnboardingVersion");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __95__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForMode_fromViewController___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForMode_fromViewController___block_invoke_2;
  v7[3] = &unk_1E204EE88;
  v5 = (void *)a1[5];
  v7[4] = a1[4];
  v8 = v3;
  v10 = a1[6];
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __95__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForMode_fromViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentOnboardingFlowForNicknameContact:mode:fromViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

+ (id)log
{
  if (log_cn_once_token_3_56530 != -1)
    dispatch_once(&log_cn_once_token_3_56530, &__block_literal_global_56531);
  return (id)log_cn_once_object_3_56532;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_4_56524 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_4_56524, &__block_literal_global_26_56525);
  return (id)descriptorForRequiredKeys_cn_once_object_4_56526;
}

+ (id)sharingSettingsViewControllerForNicknameContact:(id)a3 meContact:(id)a4 mode:(int64_t)a5 contactStore:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  CNMeCardSharingContactNameProvider *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  CNMeCardSharingContactAvatarProvider *v20;
  int64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CNMeCardSharingSettingsViewController *v28;
  uint64_t v30;
  void *v31;
  void *v32;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = v10;
  v13 = v12;
  v14 = a6;
  v15 = -[CNMeCardSharingContactNameProvider initWithContact:]([CNMeCardSharingContactNameProvider alloc], "initWithContact:", v13);
  v16 = v9;
  v17 = v16;
  if (!v9)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C97360]);
    if ((objc_msgSend(v11, "isKeyAvailable:", *MEMORY[0x1E0C966D0]) & 1) != 0)
    {
      objc_msgSend(v11, "givenName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setGivenName:", v18);

    }
    else
    {
      objc_msgSend(v17, "setGivenName:", &stru_1E20507A8);
    }
    if ((objc_msgSend(v11, "isKeyAvailable:", *MEMORY[0x1E0C966C0]) & 1) != 0)
    {
      objc_msgSend(v11, "familyName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFamilyName:", v19);

    }
    else
    {
      objc_msgSend(v17, "setFamilyName:", &stru_1E20507A8);
    }
  }
  v31 = v17;
  v32 = v13;
  v20 = -[CNMeCardSharingContactAvatarProvider initWithContact:]([CNMeCardSharingContactAvatarProvider alloc], "initWithContact:", v17);
  v21 = a5;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "nicknameProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isNicknameSharingEnabled");

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "nicknameProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "sharingAudience");

  LOBYTE(v30) = 1;
  v28 = -[CNMeCardSharingSettingsViewController initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:]([CNMeCardSharingSettingsViewController alloc], "initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:", v14, v11, v20, v15, v24, v27, v30, v21);

  return v28;
}

+ (void)writeToDefaultsDidSkipPosterSetup:(BOOL)a3
{
  +[CNSharedProfileOnboardingStateController writeToDefaultsDidSkipPosterSetup:](CNSharedProfileOnboardingStateController, "writeToDefaultsDidSkipPosterSetup:", a3);
}

void __64__CNSharedProfileOnboardingController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  +[CNMeCardSharingSettingsViewController descriptorForRequiredKeys](CNMeCardSharingSettingsViewController, "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForNameOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSharedProfileOnboardingController descriptorForRequiredKeys]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorWithKeyDescriptors:description:", v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)descriptorForRequiredKeys_cn_once_object_4_56526;
  descriptorForRequiredKeys_cn_once_object_4_56526 = v6;

}

void __42__CNSharedProfileOnboardingController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNSharedProfileOnboardingController");
  v1 = (void *)log_cn_once_object_3_56532;
  log_cn_once_object_3_56532 = (uint64_t)v0;

}

@end
