@implementation HSPCSiriVoiceSelectionController

- (HSPCSiriVoiceSelectionController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  HSPCSiriVoiceSelectionController *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  VTUIVoiceSelectionViewController *v18;
  VTUIVoiceSelectionViewController *voiceSelectionViewController;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)PRXCardContentView), "initWithCardStyle:", 0);
  v21.receiver = self;
  v21.super_class = (Class)HSPCSiriVoiceSelectionController;
  v10 = -[HSPCSiriVoiceSelectionController initWithContentView:](&v21, "initWithContentView:", v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = objc_alloc((Class)HUVoiceSelectionDataManager);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recognitionLanguage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "listOfVoices"));
    v14 = objc_msgSend(v11, "initWithInputLanguageCode:listOfVoices:", v12, v13);

    v15 = v14;
    v16 = objc_alloc((Class)VTUIVoiceSelectionViewController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recognitionLanguage"));
    v18 = (VTUIVoiceSelectionViewController *)objc_msgSend(v16, "initCompactWithRecognitionLanguage:allowsRandomSelection:dataManager:customVoicePreviewer:forSelectionStyle:delegate:", v17, objc_msgSend(v8, "allowsRandomVoiceSelection"), v15, 0, 1, v10);

    voiceSelectionViewController = v10->_voiceSelectionViewController;
    v10->_voiceSelectionViewController = v18;

    -[VTUIVoiceSelectionViewController setShouldHideCompactBackgroundCardView:](v10->_voiceSelectionViewController, "setShouldHideCompactBackgroundCardView:", 1);
  }

  return v10;
}

- (void)viewDidLoad
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
  void *v26;
  objc_super v27;
  _QWORD v28[4];

  v27.receiver = self;
  v27.super_class = (Class)HSPCSiriVoiceSelectionController;
  -[HSPCSiriVoiceSelectionController viewDidLoad](&v27, "viewDidLoad");
  -[VTUIVoiceSelectionViewController willMoveToParentViewController:](self->_voiceSelectionViewController, "willMoveToParentViewController:", self);
  -[HSPCSiriVoiceSelectionController addChildViewController:](self, "addChildViewController:", self->_voiceSelectionViewController);
  -[VTUIVoiceSelectionViewController didMoveToParentViewController:](self->_voiceSelectionViewController, "didMoveToParentViewController:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v28[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leftAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leftAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v28[1] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  v28[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  v28[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSPCSiriVoiceSelectionController;
  -[HSPCSiriVoiceSelectionController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIVoiceSelectionViewController view](self->_voiceSelectionViewController, "view"));
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController contentView](self, "contentView"));
  objc_msgSend(v4, "setNeedsUpdateConstraints");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController view](self, "view"));
  objc_msgSend(v5, "bounds");
  -[HSPCSiriVoiceSelectionController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", v6);

}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7EE8);
}

- (void)_applyOnboardingSelectionsIfNeededForSelectedLanguageValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_siriEndpointProfile"));
  if (v4)
  {
    v24 = v8;
    v9 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
    v10 = objc_msgSend(v6, "hf_isDumbSpeaker");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
    v12 = objc_msgSend(v11, "isPlaybackInfluencesForYouEnabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
    v14 = objc_msgSend(v13, "isShareSiriAnalyticsEnabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
    v16 = objc_msgSend(v9, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:", 1, 1, v10, v12, v14, objc_msgSend(v15, "isExplicitContentAllowed"), v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
    objc_msgSend(v17, "setOnboardingSelections:", v16);

    v8 = v24;
  }
  v18 = HFLogForCategory(60, v7);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "onboardingSelections"));
    *(_DWORD *)buf = 138412546;
    v26 = v21;
    v27 = 2112;
    v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections: %@. selectedLanguageValue = %@", buf, 0x16u);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "onboardingSelections"));
  objc_msgSend(v8, "applyOnboardingSelections:completionHandler:", v23, &stru_1000A0E50);

}

- (BOOL)_isVoiceRecognitionEnabled
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  int v18;
  HSPCSiriVoiceSelectionController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;

  v4 = objc_alloc((Class)HFUserItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
  v10 = objc_msgSend(v4, "initWithHome:user:nameStyle:", v6, v9, 0);

  v11 = objc_msgSend(v10, "isIdentifyVoiceEnabled");
  v13 = HFLogForCategory(60, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v18 = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v16;
    v22 = 1024;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Is voice recognition enabled? %{BOOL}d", (uint8_t *)&v18, 0x1Cu);

  }
  return v11;
}

- (BOOL)_shouldEnableShareSiriAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
  if (objc_msgSend(v3, "isShareSiriAnalyticsEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "onboardingSelections"));
    v6 = objc_msgSend(v5, "allowHeySiri");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  _QWORD v31[2];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "availableSiriLanguageValues"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100005C2C;
  v29[3] = &unk_1000A0E78;
  v29[4] = self;
  v8 = v5;
  v30 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_firstObjectPassingTest:", v29));

  v11 = HFLogForCategory(60, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "VTUIVoiceSelectionViewControllerDelegate: didSelectVoice %@ with selectedLanguageValue %@", buf, 0x16u);
  }

  -[HSPCSiriVoiceSelectionController _applyOnboardingSelectionsIfNeededForSelectedLanguageValue:](self, "_applyOnboardingSelectionsIfNeededForSelectedLanguageValue:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
  v16 = objc_msgSend(v14, "stateMachineConfigurationGetLaunchReason:", v15);

  if (-[HSPCSiriVoiceSelectionController _shouldEnableShareSiriAnalytics](self, "_shouldEnableShareSiriAnalytics"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController config](self, "config"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "addedAccessory"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[HUSiriEndpointUtilities presentShareSiriAndDictationAlertForSingleAccessory:accessoryName:](HUSiriEndpointUtilities, "presentShareSiriAndDictationAlertForSingleAccessory:accessoryName:", self, v19));

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  if (v16 == (id)3
    && -[HSPCSiriVoiceSelectionController _isVoiceRecognitionEnabled](self, "_isVoiceRecognitionEnabled"))
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100005DF0;
    v28[3] = &unk_1000A0EA0;
    v28[4] = self;
    v21 = objc_msgSend(v20, "addSuccessBlock:", v28);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceSelectionController coordinator](self, "coordinator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nextViewController"));

    v31[0] = v20;
    v31[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v24));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100005E00;
    v27[3] = &unk_1000A0EA0;
    v27[4] = self;
    v26 = objc_msgSend(v25, "addSuccessBlock:", v27);

  }
}

- (void)voiceSelectionControllerRequestsDismissal:(id)a3
{
  -[HSPCSiriVoiceSelectionController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (VTUIVoiceSelectionViewController)voiceSelectionViewController
{
  return self->_voiceSelectionViewController;
}

- (void)setVoiceSelectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSelectionViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSelectionViewController, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
