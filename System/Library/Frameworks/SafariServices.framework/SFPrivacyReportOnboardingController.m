@implementation SFPrivacyReportOnboardingController

+ (id)onboardingViewControllerWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isPrivacyProxyActive") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPrivacyProxyOnForEitherTier");

  if (v7)
  {
LABEL_5:
    objc_msgSend(a1, "_createEnableTrackerProtectionControllerWithCompletionHandler:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(a1, "_createEnableRecommendedProtectionControllerWithCompletionHandler:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)v8;

  return v9;
}

+ (id)_createEnableTrackerProtectionControllerWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "sf_imageNamed:", CFSTR("Shield"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)getOBWelcomeControllerClass());
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:detailText:icon:", v6, v7, v4);

  objc_msgSend(getOBBoldTrayButtonClass(), "boldButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v10, 0);

  v11 = (void *)MEMORY[0x1E0DC3428];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__SFPrivacyReportOnboardingController__createEnableTrackerProtectionControllerWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E4AC0C18;
  v19 = v3;
  v12 = v3;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", &stru_1E4AC8470, 0, 0, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:forControlEvents:", v13, 0x2000);

  objc_msgSend(v8, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v9);

  objc_msgSend(v8, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  createPromptCancelButtonWithCompletionHandler(v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", v16);

  return v8;
}

uint64_t __101__SFPrivacyReportOnboardingController__createEnableTrackerProtectionControllerWithCompletionHandler___block_invoke(uint64_t a1)
{
  enableTrackerProtection();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_createEnableRecommendedProtectionControllerWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isPrivacyProxyOnInICloudSettings");
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "sf_imageNamed:", CFSTR("Shield"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)getOBWelcomeControllerClass());
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:detailText:icon:", v8, v5, v6);

  objc_msgSend(v9, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1036831949;
  objc_msgSend(v10, "setTitleHyphenationFactor:", v11);

  objc_msgSend(getOBBoldTrayButtonClass(), "boldButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v13, 0);

  v14 = (void *)MEMORY[0x1E0DC3428];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __105__SFPrivacyReportOnboardingController__createEnableRecommendedProtectionControllerWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E4AC0C18;
  v22 = v3;
  v15 = v3;
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", &stru_1E4AC8470, 0, 0, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:forControlEvents:", v16, 0x2000);

  objc_msgSend(v9, "buttonTray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addButton:", v12);

  objc_msgSend(v9, "buttonTray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  createPromptCancelButtonWithCompletionHandler(v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addButton:", v19);

  return v9;
}

uint64_t __105__SFPrivacyReportOnboardingController__createEnableRecommendedProtectionControllerWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  enableTrackerProtection();
  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrivacyProxyEnabled:completionHandler:", 1, &__block_literal_global_16);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
