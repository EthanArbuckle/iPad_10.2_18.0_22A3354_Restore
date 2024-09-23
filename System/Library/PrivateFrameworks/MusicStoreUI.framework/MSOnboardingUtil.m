@implementation MSOnboardingUtil

+ (void)markAsShown
{
  __CFString *v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;

  CFPreferencesSetAppValue(CFSTR("MSOnboardingVersionKey"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", kMSCurrentOnboardingVersion), CFSTR("com.apple.MobileStore"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.MobileStore"));
  v6 = 0;
  v2 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1FF0], "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0)), "valueForKey:error:", CFSTR("privacyAcknowledgementUrl"), &v6);
  v3 = (void *)MEMORY[0x24BDBCF48];
  if (-[__CFString length](v2, "length"))
    v4 = v2;
  else
    v4 = CFSTR("https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/acknowledgePrivacy");
  v5 = objc_msgSend(v3, "URLWithString:", v4);
  objc_msgSend(MEMORY[0x24BEB1F60], "acknowledgePrivacyLinkWithIdentifier:URL:", *MEMORY[0x24BEB29A8], v5);
}

+ (void)presentIfNeededFromViewController:(id)a3 mediaTypes:(int64_t)a4 completion:(id)a5
{
  void *v9;
  void *v10;
  _QWORD v11[5];

  if ((objc_msgSend(a1, "shouldShowOnboarding") & 1) != 0)
  {
    objc_msgSend(a3, "presentedViewController");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = (void *)objc_msgSend(a3, "presentedViewController");
    else
      v9 = 0;
    if (!objc_msgSend((id)objc_msgSend(v9, "viewControllers"), "firstObject"))
      objc_msgSend(a3, "presentedViewController");
    getAMPOnboardingViewControllerClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    }
    else
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __76__MSOnboardingUtil_presentIfNeededFromViewController_mediaTypes_completion___block_invoke;
      v11[3] = &unk_24F1F2CC8;
      v11[4] = a5;
      v10 = (void *)objc_msgSend(a1, "viewControllerForMediaType:completion:", a4, v11);
      objc_msgSend(v10, "setModalPresentationStyle:", 2);
      objc_msgSend(a3, "presentViewController:animated:completion:", v10, 1, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

uint64_t __76__MSOnboardingUtil_presentIfNeededFromViewController_mediaTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __76__MSOnboardingUtil_presentIfNeededFromViewController_mediaTypes_completion___block_invoke_2;
  v3[3] = &unk_24F1F2CA0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __76__MSOnboardingUtil_presentIfNeededFromViewController_mediaTypes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

+ (BOOL)shouldShowOnboarding
{
  if (CFPreferencesGetAppIntegerValue(CFSTR("MSOnboardingVersionKey"), CFSTR("com.apple.MobileStore"), 0) == kMSCurrentOnboardingVersion)
    return objc_msgSend(MEMORY[0x24BEB1F60], "shouldDisplayPrivacyLinkWithIdentifier:", *MEMORY[0x24BEB29A8]);
  else
    return 1;
}

+ (id)viewControllerForMediaType:(int64_t)a3 completion:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(MEMORY[0x24BE6E430], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.itunesstore"));
  if (a3 == 2)
  {
    v20 = objc_alloc(getAMPOnboardingViewControllerClass());
    v21 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("WelcomeiTunesStore"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), 0);
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_TITLE"), &stru_24F1F2DD8, 0);
    v23 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = CFSTR("ONBOARDING_DESCRIPTION_MUSIC");
LABEL_7:
    v25 = objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_24F1F2DD8, 0);
    v19 = objc_msgSend(v20, "initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkController:", v21, v22, v25, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24F1F2DD8, 0), v6);
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v20 = objc_alloc(getAMPOnboardingViewControllerClass());
    v21 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("WelcomeiTunesStore"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), 0);
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_TITLE"), &stru_24F1F2DD8, 0);
    v23 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = CFSTR("ONBOARDING_DESCRIPTION_MUSIC_AND_MOVIES");
    goto LABEL_7;
  }
  if (a3)
  {
    v26 = 0;
    goto LABEL_10;
  }
  v7 = objc_alloc(getAMPOnboardingFeatureClass());
  v28 = v6;
  v8 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("WelcomeMusic"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), 0);
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_FEATURE_TITLE_MUSIC"), &stru_24F1F2DD8, 0);
  v30[0] = objc_msgSend(v7, "initWithImage:titleText:descriptionText:", v8, v9, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_FEATURE_DESCRIPTION_MUSIC"), &stru_24F1F2DD8, 0));
  v10 = objc_alloc(getAMPOnboardingFeatureClass());
  v11 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("WelcomeMovies"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), 0);
  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_FEATURE_TITLE_MOVIES"), &stru_24F1F2DD8, 0);
  v30[1] = objc_msgSend(v10, "initWithImage:titleText:descriptionText:", v11, v12, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_FEATURE_DESCRIPTION_MOVIES"), &stru_24F1F2DD8, 0));
  v13 = objc_alloc(getAMPOnboardingFeatureClass());
  v14 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("WelcomeTV"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), 0);
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_FEATURE_TITLE_TV"), &stru_24F1F2DD8, 0);
  v30[2] = objc_msgSend(v13, "initWithImage:titleText:descriptionText:", v14, v15, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_FEATURE_DESCRIPTION_TV"), &stru_24F1F2DD8, 0));
  v16 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v17 = objc_alloc(getAMPOnboardingViewControllerClass());
  v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_TITLE"), &stru_24F1F2DD8, 0);
  v19 = objc_msgSend(v17, "initWithTitleText:features:primaryButtonText:privacyLinkController:", v18, v16, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24F1F2DD8, 0), v6);
LABEL_8:
  v26 = (void *)v19;
LABEL_10:
  objc_msgSend((id)objc_msgSend(v26, "view"), "setTintColor:", objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor", v28));
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __58__MSOnboardingUtil_viewControllerForMediaType_completion___block_invoke;
  v29[3] = &unk_24F1F2CF0;
  v29[4] = a4;
  objc_msgSend(v26, "setPrimaryButtonCallback:", v29);
  return v26;
}

uint64_t __58__MSOnboardingUtil_viewControllerForMediaType_completion___block_invoke(uint64_t a1)
{
  +[MSOnboardingUtil markAsShown](MSOnboardingUtil, "markAsShown");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
