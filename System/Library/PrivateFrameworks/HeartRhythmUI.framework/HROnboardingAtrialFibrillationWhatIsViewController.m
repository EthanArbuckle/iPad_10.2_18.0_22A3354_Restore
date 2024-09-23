@implementation HROnboardingAtrialFibrillationWhatIsViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingAtrialFibrillationWhatIsViewController;
  v5 = -[HROnboardingAtrialFibrillationWhatIsViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v9, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, a4);
  v6 = v5;
  if (v5)
    v7 = !v4;
  else
    v7 = 1;
  if (!v7)
    objc_msgSend(v5, "configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation");
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HROnboardingAtrialFibrillationWhatIsViewController;
  -[HROnboardingAtrialFibrillationWhatIsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategory:error:", *MEMORY[0x24BDB1598], 0);

  -[HROnboardingAtrialFibrillationWhatIsViewController videoPlayerView](self, "videoPlayerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "play");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HROnboardingAtrialFibrillationWhatIsViewController;
  -[HROnboardingAtrialFibrillationWhatIsViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[HROnboardingAtrialFibrillationWhatIsViewController videoPlayerView](self, "videoPlayerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

}

- (void)setUpUI
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingAtrialFibrillationWhatIsViewController;
  -[HROnboardingHeroExplanationViewController setUpUI](&v3, sel_setUpUI);
  -[HROnboardingHeroExplanationViewController setTextAlignment:](self, "setTextAlignment:", 1);
}

- (id)createHeroView
{
  HRVideoPlayerView *videoPlayerView;
  void *v4;
  void *v5;
  HRVideoPlayerView *v6;
  HRVideoPlayerView *v7;

  videoPlayerView = self->_videoPlayerView;
  if (!videoPlayerView)
  {
    HRHeartRhythmUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("Atrial_Fibrillation_Detection_HowitWorks_h264"), CFSTR("mov"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[HRVideoPlayerView playerViewWithURL:looping:](HRVideoPlayerView, "playerViewWithURL:looping:", v5, 1);
    v6 = (HRVideoPlayerView *)objc_claimAutoreleasedReturnValue();
    -[UIView hrui_maskAllCornersWithRadius:](v6, "hrui_maskAllCornersWithRadius:", *MEMORY[0x24BE4A250]);
    v7 = self->_videoPlayerView;
    self->_videoPlayerView = v6;

    videoPlayerView = self->_videoPlayerView;
  }
  return videoPlayerView;
}

- (id)titleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_HOW_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_HOW_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buttonTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)stackedButtonViewLastButtonMode
{
  return 0;
}

- (int64_t)accessibilityGroupID
{
  return 2;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __90__HROnboardingAtrialFibrillationWhatIsViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D34A7B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HROnboardingAtrialFibrillationWhatIsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __90__HROnboardingAtrialFibrillationWhatIsViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HROnboardingAtrialFibrillationWhatIsViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (HRVideoPlayerView)videoPlayerView
{
  return self->_videoPlayerView;
}

- (void)setVideoPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
}

@end
