@implementation HUCameraRecordingSetupViewController

- (HUCameraRecordingSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 itemTableViewController:(id)a6 home:(id)a7
{
  id v13;
  HUCameraRecordingSetupViewController *v14;
  HUCameraRecordingSetupViewController *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HUCameraRecordingSetupViewController;
  v14 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v17, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, a3, a4, a5, 2, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_home, a7);

  return v15;
}

- (void)_setupCameraRecording:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  HUCameraRecordingSetupViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUCameraRecordingSetupViewController home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_allNonAdminUsers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[HUCameraRecordingSetupViewController home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hf_hasCameraRecordingResident"))
      v10 = 2;
    else
      v10 = 1;

  }
  else
  {
    v10 = 1;
  }

  -[HUCameraRecordingSetupViewController home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "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");

  -[HUCameraRecordingSetupViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10, CFSTR("HUCameraRecordingOnboardingKey_UserInput"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewController:didFinishWithConfigurationResults:", self, v14);

}

- (void)showCameraRecordingLearnMore
{
  uint64_t v3;
  void *v4;
  HUCameraRecordingSetupViewController *v5;
  HUCameraRecordingSetupViewController *v6;
  HUCameraRecordingLearnMoreViewController *v7;
  HUCameraRecordingLearnMoreViewController *v8;
  HUCameraRecordingSetupViewController *v9;
  _QWORD v10[4];
  HUCameraRecordingSetupViewController *v11;
  HUCameraRecordingLearnMoreViewController *v12;

  -[HUCameraRecordingSetupViewController navigationController](self, "navigationController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (HUCameraRecordingSetupViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  v7 = objc_alloc_init(HUCameraRecordingLearnMoreViewController);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__HUCameraRecordingSetupViewController_showCameraRecordingLearnMore__block_invoke;
  v10[3] = &unk_1E6F4C638;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __68__HUCameraRecordingSetupViewController_showCameraRecordingLearnMore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraRecordingSetupViewController;
  -[HUCameraRecordingSetupViewController preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[HUItemTableOBWelcomeController updateViewConstraints](self, "updateViewConstraints");
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
  NSObject *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  HUCameraRecordingSetupViewController *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HUCameraRecordingSetupViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v24, sel_viewDidLoad);
  -[HUCameraRecordingSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042F78);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingSetupViewController setSetupButton:](self, "setSetupButton:", v6);

  -[HUCameraRecordingSetupViewController setupButton](self, "setupButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUCameraRecordingSetupViewController setupButton](self, "setupButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingIntro_ContinueButton"), CFSTR("HUCameraRecordingIntro_ContinueButton"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUCameraRecordingSetupViewController setupButton](self, "setupButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.SetUp.ContinueButton"));

  -[HUCameraRecordingSetupViewController setupButton](self, "setupButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__setupCameraRecording_, 64);

  -[HUCameraRecordingSetupViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingSetupViewController setupButton](self, "setupButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingSetupViewController setLearnMoreButton:](self, "setLearnMoreButton:", v14);

  -[HUCameraRecordingSetupViewController learnMoreButton](self, "learnMoreButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUCameraRecordingSetupViewController learnMoreButton](self, "learnMoreButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  -[HUCameraRecordingSetupViewController setupButton](self, "setupButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.SetUp.Footer.LearnMoreButton"));

  -[HUCameraRecordingSetupViewController learnMoreButton](self, "learnMoreButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_showCameraRecordingLearnMore, 64);

  -[HUCameraRecordingSetupViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingSetupViewController learnMoreButton](self, "learnMoreButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v21);

  -[HUCameraRecordingSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: CRSVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUCameraRecordingSetupViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUCameraRecordingSetupViewController;
  -[HUCameraRecordingSetupViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUCameraRecordingSetupViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
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
    -[HUCameraRecordingSetupViewController delegate](self, "delegate");
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

- (OBTrayButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
