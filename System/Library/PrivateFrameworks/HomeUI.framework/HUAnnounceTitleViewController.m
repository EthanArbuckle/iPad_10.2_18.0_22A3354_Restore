@implementation HUAnnounceTitleViewController

- (HUAnnounceTitleViewController)initWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HUAnnounceTitleViewController *v16;
  HUAnnounceTitleViewController *v17;
  objc_super v19;

  v4 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUOnboardingAnnounce_Title"), CFSTR("HUOnboardingAnnounce_Title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedSiriTriggerPhrase(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HULocalizedStringWithFormat(CFSTR("HUOnboardingAnnounce_Detail"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HUImageNamed(CFSTR("Onboarding-Announce"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v14);
  objc_msgSend(v15, "setContentMode:", 1);
  v19.receiver = self;
  v19.super_class = (Class)HUAnnounceTitleViewController;
  v16 = -[HUCenterFillOBWelcomeController initWithTitle:detailText:icon:contentView:](&v19, sel_initWithTitle_detailText_icon_contentView_, v5, v13, 0, v15);
  v17 = v16;
  if (v16)
    -[HUAnnounceTitleViewController setContentImageView:](v16, "setContentImageView:", v15);

  return v17;
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  HUAnnounceTitleViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HUAnnounceTitleViewController;
  -[HUCenterFillOBWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  -[HUAnnounceTitleViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E70431A8);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _HULocalizedStringWithDefaultValue(CFSTR("HUOnboardingAnnounce_ContinueButton"), CFSTR("HUOnboardingAnnounce_ContinueButton"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Announce.ContinueButton"));
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_continuePressed_, 64);
  -[HUAnnounceTitleViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v6);

  -[HUAnnounceTitleViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUAnnounceTitleViewController updateViewConstraints](self, "updateViewConstraints");
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: ATVC", buf, 0x16u);

  }
}

- (void)continuePressed:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[HUAnnounceTitleViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("announceSetupStep");
  v7[0] = &unk_1E70414D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController:didFinishWithConfigurationResults:", self, v5);

}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 1;
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void)setContentImageView:(id)a3
{
  objc_storeStrong((id *)&self->_contentImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
