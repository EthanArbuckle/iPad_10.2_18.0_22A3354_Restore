@implementation HUCameraRecordingIntroViewController

- (HUCameraRecordingIntroViewController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithIntroVariant_home_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraRecordingIntroViewController.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraRecordingIntroViewController init]",
    v5);

  return 0;
}

- (HUCameraRecordingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithIntroVariant_home_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraRecordingIntroViewController.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraRecordingIntroViewController initWithTitle:detailText:icon:contentImage:]",
    v9);

  return 0;
}

- (HUCameraRecordingIntroViewController)initWithIntroVariant:(unint64_t)a3 home:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *continueButtonText;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  NSString *notNowButtonText;
  NSString *v18;
  NSString *v19;
  __CFString *v20;
  NSString *v21;
  NSString *v22;
  objc_class *v23;
  uint64_t v24;
  NSString *v25;
  NSString *v26;
  uint64_t v27;
  NSString *v28;
  NSString *v29;
  objc_class *v30;
  uint64_t v31;
  void *v32;
  HUCameraRecordingIntroViewController *v33;
  HUCameraRecordingIntroViewController *v34;
  objc_super v36;

  v7 = a4;
  HUImageNamed(CFSTR("Onboarding-Camera"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0uLL:
      v9 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_Title"), CFSTR("HUCameraRecordingIntro_Title"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_Detail"), CFSTR("HUCameraRecordingIntro_Detail"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_ContinueButton"), CFSTR("HUCameraRecordingIntro_ContinueButton"), 1);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      continueButtonText = self->_continueButtonText;
      self->_continueButtonText = v12;

      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_Footer"), CFSTR("HUCameraRecordingIntro_Footer"), 1);
      v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v15 = 1400;
      goto LABEL_5;
    case 1uLL:
      v9 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingUnsupportedIntro_Title"), CFSTR("HUCameraRecordingUnsupportedIntro_Title"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingUnsupportedIntro_Detail"), CFSTR("HUCameraRecordingUnsupportedIntro_Detail"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_ContinueButton"), CFSTR("HUCameraRecordingIntro_ContinueButton"), 1);
      v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v15 = 1384;
LABEL_5:
      v16 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v15);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v15) = v14;

      notNowButtonText = self->_notNowButtonText;
      self->_notNowButtonText = 0;
      goto LABEL_14;
    case 2uLL:
      v9 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_Title"), CFSTR("HUCameraRecordingIntro_Title"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_Detail"), CFSTR("HUCameraRecordingIntro_Detail"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_ContinueButton"), CFSTR("HUCameraRecordingIntro_ContinueButton"), 1);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_continueButtonText;
      self->_continueButtonText = v18;

      v20 = CFSTR("HUCameraRecordingIntro_NotNowButton");
      goto LABEL_8;
    case 3uLL:
      v9 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_NeedsHub_Title"), CFSTR("HUCameraRecordingIntro_NeedsHub_Title"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_NeedsHub_Detail"), CFSTR("HUCameraRecordingIntro_NeedsHub_Detail"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_ContinueButton"), CFSTR("HUCameraRecordingIntro_ContinueButton"), 1);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      v22 = self->_continueButtonText;
      self->_continueButtonText = v21;

      v20 = CFSTR("HUCameraRecordingIntro_NeedsHub_LearnMoreButton");
LABEL_8:
      _HULocalizedStringWithDefaultValue(v20, v20, 1);
      v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v24 = 1392;
      goto LABEL_13;
    case 4uLL:
      _HULocalizedStringWithDefaultValue(CFSTR("HUUpgradeMultiUserDevices_Title"), CFSTR("HUUpgradeMultiUserDevices_Title"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUUpgradeMultiUserDevices_Generic_Detail"), CFSTR("HUUpgradeMultiUserDevices_Generic_Detail"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_ContinueButton"), CFSTR("HUCameraRecordingIntro_ContinueButton"), 1);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = self->_continueButtonText;
      self->_continueButtonText = v25;

      HUImageNamed(CFSTR("Onboarding-UpdateSoftware"));
      v27 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
      notNowButtonText = self->_notNowButtonText;
      self->_notNowButtonText = 0;
      v8 = (void *)v27;
      goto LABEL_14;
    case 5uLL:
      v9 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_AlreadySetup_Title"), CFSTR("HUCameraRecordingIntro_AlreadySetup_Title"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_AlreadySetup_Detail"), CFSTR("HUCameraRecordingIntro_AlreadySetup_Detail"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_ContinueButton"), CFSTR("HUCameraRecordingIntro_ContinueButton"), 1);
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      v29 = self->_continueButtonText;
      self->_continueButtonText = v28;

      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_AlreadySetup_ReviewButton"), CFSTR("HUCameraRecordingIntro_AlreadySetup_ReviewButton"), 1);
      v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v31 = 1392;
      goto LABEL_12;
    case 6uLL:
      v9 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_AlreadySetup_Title"), CFSTR("HUCameraRecordingIntro_AlreadySetup_Title"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_AlreadySetup_Detail"), CFSTR("HUCameraRecordingIntro_AlreadySetup_Detail"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_ContinueButton"), CFSTR("HUCameraRecordingIntro_ContinueButton"), 1);
      v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v31 = 1384;
LABEL_12:
      v32 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v31);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v31) = v30;

      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_Footer"), CFSTR("HUCameraRecordingIntro_Footer"), 1);
      v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v24 = 1400;
LABEL_13:
      notNowButtonText = *(NSString **)((char *)&self->super.super.super.super.super.super.super.super.isa + v24);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v24) = v23;
LABEL_14:

      break;
    default:
      v10 = 0;
      v11 = 0;
      v9 = 1;
      break;
  }
  v36.receiver = self;
  v36.super_class = (Class)HUCameraRecordingIntroViewController;
  v33 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v36, sel_initWithTitle_detailText_icon_contentImage_, v10, v11, 0, v8);
  v34 = v33;
  if (v33)
  {
    v33->_variant = a3;
    objc_storeStrong((id *)&v33->_home, a4);
    -[HUCenterFillOBWelcomeController setContentMode:](v34, "setContentMode:", v9);
  }

  return v34;
}

- (void)_buttonOne:(id)a3
{
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  const __CFString **v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint8_t buf[4];
  HUCameraRecordingIntroViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    v22 = 2048;
    v23 = -[HUCameraRecordingIntroViewController variant](self, "variant");
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button: variant %lu", buf, 0x20u);

  }
  v7 = -[HUCameraRecordingIntroViewController variant](self, "variant");
  if (v7 <= 6)
  {
    if (v7 == 2)
    {
      -[HUCameraRecordingIntroViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("HUCameraRecordingOnboardingKey_UserInput");
      v15 = &unk_1E7041F20;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v15;
      v12 = &v14;
    }
    else
    {
      -[HUCameraRecordingIntroViewController home](self, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "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");

      -[HUCameraRecordingIntroViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("HUCameraRecordingOnboardingKey_UserInput");
      v17 = &unk_1E7041F08;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v17;
      v12 = &v16;
    }
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1, v14, v15, v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewController:didFinishWithConfigurationResults:", self, v13);

  }
}

- (void)_buttonTwo:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  const __CFString **v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint8_t buf[4];
  HUCameraRecordingIntroViewController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = -[HUCameraRecordingIntroViewController variant](self, "variant");
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button: variant %lu", buf, 0x20u);

  }
  switch(-[HUCameraRecordingIntroViewController variant](self, "variant"))
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
    case 6uLL:
      NSLog(CFSTR("These views should not have a second button"));
      break;
    case 2uLL:
      -[HUCameraRecordingIntroViewController home](self, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "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");

      -[HUCameraRecordingIntroViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("HUCameraRecordingOnboardingKey_UserInput");
      v16 = &unk_1E7041F08;
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = &v16;
      v11 = &v15;
      goto LABEL_8;
    case 3uLL:
      -[HUCameraRecordingIntroViewController showCameraRecordingLearnMore](self, "showCameraRecordingLearnMore");
      break;
    case 5uLL:
      -[HUCameraRecordingIntroViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("HUCameraRecordingOnboardingKey_UserInput");
      v14 = &unk_1E7041F20;
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = &v14;
      v11 = &v13;
LABEL_8:
      objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1, v13, v14, v15, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", self, v12);

      break;
    default:
      return;
  }
}

- (void)showCameraRecordingLearnMore
{
  uint64_t v3;
  void *v4;
  HUCameraRecordingIntroViewController *v5;
  HUCameraRecordingIntroViewController *v6;
  HUCameraRecordingLearnMoreViewController *v7;

  -[HUCameraRecordingIntroViewController navigationController](self, "navigationController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (HUCameraRecordingIntroViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  v7 = objc_alloc_init(HUCameraRecordingLearnMoreViewController);
  -[HUCameraRecordingIntroViewController presentViewController:animated:completion:](v6, "presentViewController:animated:completion:", v7, 1, 0);

}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)viewDidLoad
{
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
  void *v25;
  NSObject *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  HUCameraRecordingIntroViewController *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)HUCameraRecordingIntroViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v28, sel_viewDidLoad);
  -[HUCameraRecordingIntroViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043388);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingIntroViewController setSetupButton:](self, "setSetupButton:", v6);

  -[HUCameraRecordingIntroViewController setupButton](self, "setupButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUCameraRecordingIntroViewController setupButton](self, "setupButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingIntroViewController continueButtonText](self, "continueButtonText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUCameraRecordingIntroViewController setupButton](self, "setupButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.CameraRecording.Intro.ContinueButton"));

  -[HUCameraRecordingIntroViewController setupButton](self, "setupButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__buttonOne_, 64);

  -[HUCameraRecordingIntroViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingIntroViewController setupButton](self, "setupButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  -[HUCameraRecordingIntroViewController notNowButtonText](self, "notNowButtonText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingIntroViewController setNotNowButton:](self, "setNotNowButton:", v15);

    -[HUCameraRecordingIntroViewController notNowButton](self, "notNowButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUCameraRecordingIntroViewController notNowButton](self, "notNowButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingIntroViewController notNowButtonText](self, "notNowButtonText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:forState:", v18, 0);

    -[HUCameraRecordingIntroViewController notNowButton](self, "notNowButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.CameraRecording.Intro.NotNowButton"));

    -[HUCameraRecordingIntroViewController notNowButton](self, "notNowButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__buttonTwo_, 64);

    -[HUCameraRecordingIntroViewController buttonTray](self, "buttonTray");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingIntroViewController notNowButton](self, "notNowButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addButton:", v22);

  }
  -[HUCameraRecordingIntroViewController captionText](self, "captionText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[HUCameraRecordingIntroViewController buttonTray](self, "buttonTray");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingIntroViewController captionText](self, "captionText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCaptionText:", v25);

  }
  -[HUCameraRecordingIntroViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = self;
    v31 = 2112;
    v32 = v27;
    _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: CRIVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUCameraRecordingIntroViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUCameraRecordingIntroViewController;
  -[HUCameraRecordingIntroViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUCameraRecordingIntroViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);

    }
    -[HUCameraRecordingIntroViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerDidGoBack:", self);

  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (OBTrayButton)setupButton
{
  return self->_setupButton;
}

- (void)setSetupButton:(id)a3
{
  objc_storeStrong((id *)&self->_setupButton, a3);
}

- (OBLinkTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
  objc_storeStrong((id *)&self->_notNowButton, a3);
}

- (NSString)continueButtonText
{
  return self->_continueButtonText;
}

- (void)setContinueButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonText, a3);
}

- (NSString)notNowButtonText
{
  return self->_notNowButtonText;
}

- (void)setNotNowButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_notNowButtonText, a3);
}

- (NSString)captionText
{
  return self->_captionText;
}

- (void)setCaptionText:(id)a3
{
  objc_storeStrong((id *)&self->_captionText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionText, 0);
  objc_storeStrong((id *)&self->_notNowButtonText, 0);
  objc_storeStrong((id *)&self->_continueButtonText, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
