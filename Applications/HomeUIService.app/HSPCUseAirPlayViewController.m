@implementation HSPCUseAirPlayViewController

- (HSPCUseAirPlayViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  HUAirPlayIconView *v13;
  HSPCUseAirPlayViewController *v14;
  HSPCUseAirPlayViewController *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)UIView);
  v9 = objc_alloc((Class)UIImageView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage hu_airPlaySpeakerImage](UIImage, "hu_airPlaySpeakerImage"));
  v11 = objc_msgSend(v9, "initWithImage:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v12, "setMasksToBounds:", 1);

  objc_msgSend(v11, "setContentMode:", 2);
  v13 = -[HUAirPlayIconView initWithFrame:]([HUAirPlayIconView alloc], "initWithFrame:", 0.0, 0.0, 34.0, 34.0);
  objc_msgSend(v8, "addSubview:", v11);
  objc_msgSend(v8, "addSubview:", v13);
  v29.receiver = self;
  v29.super_class = (Class)HSPCUseAirPlayViewController;
  v14 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v29, "initWithCenterContentView:size:", v8, 75.0, 75.0);
  v15 = v14;
  if (v14)
  {
    -[HSPCUseAirPlayViewController setConfig:](v14, "setConfig:", v7);
    -[HSPCUseAirPlayViewController setCoordinator:](v15, "setCoordinator:", v6);
    -[HSPCUseAirPlayViewController setContainerView:](v15, "setContainerView:", v8);
    -[HSPCUseAirPlayViewController setSpeakerIconImageView:](v15, "setSpeakerIconImageView:", v11);
    -[HSPCUseAirPlayViewController setAirplayIconView:](v15, "setAirplayIconView:", v13);
    v16 = HULocalizedString(CFSTR("HUSiriEndpointSetup_AirPlay_Title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[HSPCUseAirPlayViewController setTitle:](v15, "setTitle:", v17);

    v18 = HULocalizedString(CFSTR("HUSiriEndpointSetup_AirPlay_UseAirPlayButtonTitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = -[HSPCUseAirPlayViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v15, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v19, v15, "_enableAirPlay");

    v21 = HULocalizedString(CFSTR("HUSiriEndpointSetup_AirPlay_NotNowButtonTitle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = -[HSPCUseAirPlayViewController addOptionalButtonWithLocalizedTitle:target:futureSelector:](v15, "addOptionalButtonWithLocalizedTitle:target:futureSelector:", v22, v15, "_applyOnboardingSelectionsIfNeeded");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "hf_userFriendlyLocalizedLowercaseDescription"));
    v26 = HULocalizedStringWithFormat(CFSTR("HUSiriEndpointSetup_AirPlay_Subtitle"), CFSTR("%@"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[HSPCUseAirPlayViewController setSubtitle:](v15, "setSubtitle:", v27, v25);

  }
  return v15;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B60);
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
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat MidX;
  double v22;
  double MaxY;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;
  _QWORD v57[6];
  CGRect v58;
  CGRect v59;

  v56.receiver = self;
  v56.super_class = (Class)HSPCUseAirPlayViewController;
  -[HSPCFixedSizeCenterContentViewController viewDidLoad](&v56, "viewDidLoad");
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController containerView](self, "containerView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "centerXAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController contentView](self, "contentView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "mainContentGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "centerXAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v51));
  v57[0] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController containerView](self, "containerView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "centerYAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController contentView](self, "contentView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "mainContentGuide"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "centerYAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v45));
  v57[1] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController speakerIconImageView](self, "speakerIconImageView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerXAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController contentView](self, "contentView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mainContentGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "centerXAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v39));
  v57[2] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController speakerIconImageView](self, "speakerIconImageView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mainContentGuide"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerYAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v3));
  v57[3] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController airplayIconView](self, "airplayIconView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 34.0));
  v57[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController airplayIconView](self, "airplayIconView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", 34.0));
  v57[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController speakerIconImageView](self, "speakerIconImageView"));
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v58.origin.x = v14;
  v58.origin.y = v16;
  v58.size.width = v18;
  v58.size.height = v20;
  MidX = CGRectGetMidX(v58);
  v22 = HURoundToScreenScale(MidX + v18 * 0.125);
  v59.origin.x = v14;
  v59.origin.y = v16;
  v59.size.width = v18;
  v59.size.height = v20;
  MaxY = CGRectGetMaxY(v59);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController airplayIconView](self, "airplayIconView"));
  objc_msgSend(v24, "intrinsicContentSize");
  v26 = HURoundToScreenScale(MaxY + v25 / -1.2);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController airplayIconView](self, "airplayIconView"));
  objc_msgSend(v27, "intrinsicContentSize");
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController airplayIconView](self, "airplayIconView"));
  objc_msgSend(v30, "intrinsicContentSize");
  v32 = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController airplayIconView](self, "airplayIconView"));
  objc_msgSend(v33, "setFrame:", v22, v26, v29, v32);

}

- (id)_applyOnboardingSelections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  HSPCUseAirPlayViewController *v18;
  uint8_t buf[4];
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addedAccessory"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_siriEndpointProfile"));
  v6 = HFLogForCategory(60);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "onboardingSelections"));
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections: %@", buf, 0xCu);

  }
  v17 = v5;
  v18 = self;
  v10 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler globalAsyncScheduler](NAScheduler, "globalAsyncScheduler", _NSConcreteStackBlock, 3221225472, sub_100051C74, &unk_1000A15F8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:scheduler:](NAFuture, "futureWithBlock:scheduler:", &v16, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reschedule:", v13));

  return v14;
}

- (id)_applyOnboardingSelectionsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  uint8_t buf[4];
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "onboardingSelections"));

  v5 = HFLogForCategory(60);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "onboardingSelections"));
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will not enable AirPlay selection but will apply existing selections: %@", buf, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController _applyOnboardingSelections](self, "_applyOnboardingSelections"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController commitConfiguration](self, "commitConfiguration", v10));
    v15[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v12));

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No onboarding selections to apply", buf, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController commitConfiguration](self, "commitConfiguration"));
  }

  return v13;
}

- (id)_enableAirPlay
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _QWORD v44[2];
  uint8_t buf[4];
  void *v46;

  v3 = HFLogForCategory(60);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Adding Enable AirPlay selection", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "onboardingSelections"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "languageValue"));

    v38 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
    v43 = objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject onboardingSelections](v43, "onboardingSelections"));
    v8 = objc_msgSend(v42, "isSiriEnabled");
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "onboardingSelections"));
    v9 = objc_msgSend(v40, "allowHeySiri");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v11 = objc_msgSend(v10, "isPlaybackInfluencesForYouEnabled");
    v39 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v13 = objc_msgSend(v12, "isShareSiriAnalyticsEnabled");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v15 = objc_msgSend(v14, "isExplicitContentAllowed");
    if (v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "languageValue"));
      v17 = objc_msgSend(v38, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:", v8, v9, 1, v11, v13, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
      objc_msgSend(v18, "setOnboardingSelections:", v17);

    }
    else
    {
      v31 = objc_msgSend(v38, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:", v8, v9, 1, v11, v13, v15);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
      objc_msgSend(v32, "setOnboardingSelections:", v31);

    }
    v6 = v39;
    v28 = v43;
  }
  else
  {
    v19 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v21 = objc_msgSend(v20, "isPlaybackInfluencesForYouEnabled");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v23 = objc_msgSend(v22, "isShareSiriAnalyticsEnabled");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    v25 = objc_msgSend(v19, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:", 1, 0, 1, v21, v23, objc_msgSend(v24, "isExplicitContentAllowed"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
    objc_msgSend(v26, "setOnboardingSelections:", v25);

    v27 = HFLogForCategory(60);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController config](self, "config"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "onboardingSelections"));
      *(_DWORD *)buf = 138412290;
      v46 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No existing onboarding selections found. This is unexpected. Will assume Siri should be disabled. Onboarding selections: %@", buf, 0xCu);

    }
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController _applyOnboardingSelections](self, "_applyOnboardingSelections"));
  v44[0] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseAirPlayViewController commitConfiguration](self, "commitConfiguration"));
  v44[1] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v35));

  return v36;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIImageView)speakerIconImageView
{
  return self->_speakerIconImageView;
}

- (void)setSpeakerIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_speakerIconImageView, a3);
}

- (UIView)airplayIconView
{
  return self->_airplayIconView;
}

- (void)setAirplayIconView:(id)a3
{
  objc_storeStrong((id *)&self->_airplayIconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplayIconView, 0);
  objc_storeStrong((id *)&self->_speakerIconImageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
