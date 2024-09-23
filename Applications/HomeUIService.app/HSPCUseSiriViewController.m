@implementation HSPCUseSiriViewController

- (HSPCUseSiriViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  HSPCUseSiriViewController *v13;
  HSPCUseSiriViewController *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _BOOL8 v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  unsigned int v42;
  id v43;
  void *v44;
  unsigned int v45;
  void *v47;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  unsigned int v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  unsigned int v55;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)UIView);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = objc_alloc((Class)UIImageView);
  v10 = HUImageNamed(CFSTR("Onboarding-Siri"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v9, "initWithImage:", v11);

  objc_msgSend(v12, "setBounds:", 0.0, 0.0, 98.0, 98.0);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addSubview:", v12);
  v49.receiver = self;
  v49.super_class = (Class)HSPCUseSiriViewController;
  v13 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v49, "initWithCenterContentView:size:", v8, 98.0, 98.0);
  v14 = v13;
  if (v13)
  {
    -[HSPCUseSiriViewController setConfig:](v13, "setConfig:", v7);
    -[HSPCUseSiriViewController setCoordinator:](v14, "setCoordinator:", v6);
    -[HSPCUseSiriViewController setSiriIconImageView:](v14, "setSiriIconImageView:", v12);
    -[HSPCUseSiriViewController setSiriIconContainerView:](v14, "setSiriIconContainerView:", v8);
    v15 = HULocalizedString(CFSTR("HUSiriEndpointSetup_UseSiri_Title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[HSPCUseSiriViewController setTitle:](v14, "setTitle:", v16);

    v17 = HULocalizedString(CFSTR("HUSiriEndpointSetup_UseSiri_UseSiriButtonTitle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = -[HSPCUseSiriViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v14, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v18, v14, "_enableSiriWithUserConfirmation");

    v20 = HULocalizedString(CFSTR("HUSiriEndpointSetup_UseSiri_NotNowButtonTitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = -[HSPCUseSiriViewController addOptionalButtonWithLocalizedTitle:target:futureSelector:](v14, "addOptionalButtonWithLocalizedTitle:target:futureSelector:", v21, v14, "_disableSiri");

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "hf_userFriendlyLocalizedLowercaseDescription"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    v26 = HULocalizedSiriTriggerPhrase();
    v47 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v27 = HULocalizedStringWithFormat(CFSTR("HUSiriEndpointSetup_UseSiri_Subtitle"), CFSTR("%@%@"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[HSPCUseSiriViewController setSubtitle:](v14, "setSubtitle:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](v14, "config"));
    objc_msgSend(v29, "setIsPlaybackInfluencesForYouEnabled:", 1);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    v31 = objc_msgSend(v30, "siriDataSharingOptInStatus");

    v32 = v31 == (id)1;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](v14, "config"));
    objc_msgSend(v33, "setIsShareSiriAnalyticsEnabled:", v32);

    v34 = +[HFManagedConfigurationUtilities isExplicitContentAllowed](HFManagedConfigurationUtilities, "isExplicitContentAllowed");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](v14, "config"));
    objc_msgSend(v35, "setIsExplicitContentAllowed:", v34);

    v37 = HFLogForCategory(60, v36);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](v14, "config"));
      v40 = objc_msgSend(v39, "isPlaybackInfluencesForYouEnabled");
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](v14, "config"));
      v42 = objc_msgSend(v41, "isShareSiriAnalyticsEnabled");
      v48 = v7;
      v43 = v6;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](v14, "config"));
      v45 = objc_msgSend(v44, "isExplicitContentAllowed");
      *(_DWORD *)buf = 67109632;
      v51 = v40;
      v52 = 1024;
      v53 = v42;
      v54 = 1024;
      v55 = v45;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "isPlaybackInfluencesForYouEnabled = %{BOOL}d | isShareSiriAnalyticsEnabled = %{BOOL}d | isExplicitContentAllowed = %{BOOL}d", buf, 0x14u);

      v6 = v43;
      v7 = v48;

    }
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  id v51;
  void *v52;
  id v53;
  id v54;
  objc_super v55;
  _QWORD v56[8];
  const __CFString *v57;
  void *v58;
  NSAttributedStringKey v59;
  void *v60;

  v55.receiver = self;
  v55.super_class = (Class)HSPCUseSiriViewController;
  -[HSPCFixedSizeCenterContentViewController viewDidLoad](&v55, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 3));
  v4 = HULocalizedString(CFSTR("HUSiriEndpointSetup_FinePrint_Link_Only"));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc((Class)NSAttributedString);
  v59 = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v60 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
  v52 = (void *)v5;
  v54 = objc_msgSend(v6, "initWithString:attributes:", v5, v8);

  v9 = objc_alloc((Class)NSMutableAttributedString);
  v10 = HULocalizedString(CFSTR("HUSiriEndpointSetup_FinePrint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v53 = objc_msgSend(v9, "initWithString:", v11);

  objc_msgSend(v53, "appendAttributedString:", v54);
  v12 = objc_msgSend(v53, "copy");
  objc_msgSend(v3, "setAttributedText:", v12);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = v3;
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  v14 = objc_alloc((Class)HUStringInLabelTapGestureRecognizer);
  v57 = CFSTR("URL_KEY");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents siriPrivacyURL](HFURLComponents, "siriPrivacyURL"));
  v58 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v51 = objc_msgSend(v14, "initWithTarget:action:hitBoxString:userInfo:", self, "_handleFooterLabelTouchForOpenURL:", v5, v16);

  v17 = v13;
  objc_msgSend(v13, "addGestureRecognizer:", v51);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController contentView](self, "contentView"));
  objc_msgSend(v18, "addSubview:", v13);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mainContentGuide"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController siriIconImageView](self, "siriIconImageView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "centerXAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v56[0] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController siriIconImageView](self, "siriIconImageView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v56[1] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController siriIconImageView](self, "siriIconImageView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "widthAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToConstant:", 98.0));
  v56[2] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController siriIconImageView](self, "siriIconImageView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "heightAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToConstant:", 98.0));
  v56[3] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v56[4] = v32;
  v38 = v13;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController siriIconImageView](self, "siriIconImageView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v22, 20.0));
  v56[5] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v35 = v20;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v56[6] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "widthAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "widthAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28));
  v56[7] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _UNKNOWN **v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v6 = objc_msgSend(v4, "stateMachineConfigurationGetLaunchReason:", v5);

  if (v6 == (id)3
    && (-[HSPCUseSiriViewController _isVoiceRecognitionEnabled](self, "_isVoiceRecognitionEnabled")
     || !-[HSPCUseSiriViewController _deviceIsOnAMultiUserLanguage](self, "_deviceIsOnAMultiUserLanguage")))
  {
    v7 = &off_1000A7FD8;
  }
  else
  {
    v7 = &off_1000A7FF0;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v7));
}

- (id)dismissButtonBlock
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010FF0;
  v3[3] = &unk_1000A10A8;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (void)_handleFooterLabelTouchForOpenURL:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URL_KEY")));

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents siriPrivacyURL](HFURLComponents, "siriPrivacyURL"));
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (v8)
    {
      v10 = HFLogForCategory(58, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Launching Siri privacy sheet", v14, 2u);
      }

      -[HSPCUseSiriViewController _launchSiriPrivacySheet](self, "_launchSiriPrivacySheet");
    }
  }
  else
  {
    v12 = HFLogForCategory(58, v6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10005E36C(v13);

    NSLog(CFSTR("Footer link pressed w/ url intention but no url found"));
  }

}

- (void)_launchSiriPrivacySheet
{
  uint64_t v3;
  void *v4;
  HSPCUseSiriViewController *v5;
  HSPCUseSiriViewController *v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController navigationController](self, "navigationController"));
  v4 = (void *)v3;
  if (v3)
    v5 = (HSPCUseSiriViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifer:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifer:", OBPrivacySiriIdentifier));
  objc_msgSend(v7, "setPresentingViewController:", v6);

  objc_msgSend(v7, "present");
}

- (id)_disableSiri
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _UNKNOWN **v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t v28[16];
  _QWORD v29[3];

  v3 = HFLogForCategory(60, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User opted to not enable Siri, saving onboarding selection", v28, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory"));

  v7 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
  v8 = objc_msgSend(v6, "hf_isDumbSpeaker");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v10 = objc_msgSend(v9, "isPlaybackInfluencesForYouEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v12 = objc_msgSend(v7, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:", 1, 0, v8, v10, 0, objc_msgSend(v11, "isExplicitContentAllowed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  objc_msgSend(v13, "setOnboardingSelections:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v17 = objc_msgSend(v15, "stateMachineConfigurationGetLaunchReason:", v16);

  if (v17 == (id)3)
    v18 = &off_1000A7FD8;
  else
    v18 = &off_1000A7FF0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v18));
  if (-[HSPCUseSiriViewController _shouldEnableShareSiriAnalytics](self, "_shouldEnableShareSiriAnalytics"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addedAccessory"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[HUSiriEndpointUtilities presentShareSiriAndDictationAlertForSingleAccessory:accessoryName:](HUSiriEndpointUtilities, "presentShareSiriAndDictationAlertForSingleAccessory:accessoryName:", self, v22));

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController _applyOnboardingSelections](self, "_applyOnboardingSelections"));
  v29[0] = v24;
  v29[1] = v23;
  v29[2] = v19;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v25));

  return v26;
}

- (id)_enableSiriWithUserConfirmation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  void *v36;

  v3 = objc_alloc_init((Class)NAFuture);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hf_siriEndpointProfile"));
  if ((objc_msgSend(v6, "supportsOnboarding") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentAssistant"));
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "isSiriAssistant") & 1) == 0)
    {
      v14 = HFLogForCategory(60, v10);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Accessory has a different assistant = %@", buf, 0xCu);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v16 = HULocalizedStringWithFormat(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertTitle"), CFSTR("%@"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(v16);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name", v27));
      v17 = HULocalizedStringWithFormat(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertMessage"), CFSTR("%@"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v30, v29, 1, v28));
      v19 = HULocalizedString(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000117CC;
      v33[3] = &unk_1000A1478;
      v33[4] = self;
      v21 = v3;
      v34 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, v33));
      objc_msgSend(v18, "addAction:", v22);

      v23 = HULocalizedString(CFSTR("HUAlertCancel"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000117D8;
      v31[3] = &unk_1000A14A0;
      v32 = v21;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, v31));
      objc_msgSend(v18, "addAction:", v25);

      -[HSPCUseSiriViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
    }
    else
    {
      -[HSPCUseSiriViewController _enableSiriWithFuture:](self, "_enableSiriWithFuture:", v3);
    }
    v13 = v3;

  }
  else
  {
    v11 = HFLogForCategory(60, v7);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Siri onboarding is not supported, will skip remainder of Siri flow", buf, 2u);
    }

    v13 = (id)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController commitConfiguration](self, "commitConfiguration"));
  }

  return v13;
}

- (void)_enableSiriWithFuture:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
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
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;

  v4 = a3;
  v6 = HFLogForCategory(60, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding Enable Siri selection", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedAccessory"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessorySettingsDataSource"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "languageCode"));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bestSupportedLanguageCodeForLanguageCode:", 0));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "outputVoice"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  objc_msgSend(v17, "setRecognitionLanguage:", v13);

  v19 = HFLogForCategory(60, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v13;
    v36 = 2112;
    v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "iOSSiriRecognitionLanguage = [%@], iOSSiriOutputVoice = [%@]", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
  v33 = HFSiriAvailableLanguagesSettingKeyPath;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100011B2C;
  v28[3] = &unk_1000A15A8;
  objc_copyWeak(&v32, (id *)buf);
  v25 = v16;
  v29 = v25;
  v26 = v13;
  v30 = v26;
  v27 = v4;
  v31 = v27;
  objc_msgSend(v11, "hf_fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:", v22, v23, v24, v28);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

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
  HSPCUseSiriViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;

  v4 = objc_alloc((Class)HFUserItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
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

- (BOOL)_deviceIsOnAMultiUserLanguage
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages"));
  if (v4)
  {
    v5 = +[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:](HUHomeFeatureOnboardingUtilities, "isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:", v4, 1);
  }
  else
  {
    v6 = HFLogForCategory(60, v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005E410(a2, v7);

    v5 = 0;
  }

  return v5;
}

- (id)_applyOnboardingSelections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;
  HSPCUseSiriViewController *v19;
  uint8_t buf[4];
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addedAccessory"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_siriEndpointProfile"));
  v7 = HFLogForCategory(60, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "onboardingSelections"));
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections: %@", buf, 0xCu);

  }
  v18 = v5;
  v19 = self;
  v11 = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler globalAsyncScheduler](NAScheduler, "globalAsyncScheduler", _NSConcreteStackBlock, 3221225472, sub_100012804, &unk_1000A15F8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:scheduler:](NAFuture, "futureWithBlock:scheduler:", &v17, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reschedule:", v14));

  return v15;
}

- (id)_languageValueMatchingRecognitionLanguage:(id)a3 outputVoice:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "availableSiriLanguageValues"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "availableSiriLanguageValues"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100012AB8;
      v14[3] = &unk_1000A0E78;
      v14[4] = self;
      v15 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "na_firstObjectPassingTest:", v14));

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)_setupOnBoardSelectionsWithLanguageValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory"));

  v6 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
  v7 = objc_msgSend(v5, "hf_isDumbSpeaker");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v9 = objc_msgSend(v8, "isPlaybackInfluencesForYouEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v11 = objc_msgSend(v10, "isShareSiriAnalyticsEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v13 = objc_msgSend(v12, "isExplicitContentAllowed");
  if (v17)
    v14 = objc_msgSend(v6, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:", 1, 1, v7, v9, v11, v13, v17);
  else
    v14 = objc_msgSend(v6, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:", 1, 1, v7, v9, v11, v13);
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  objc_msgSend(v16, "setOnboardingSelections:", v15);

}

- (void)_applyOnBoardingSelectionsWithFuture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _UNKNOWN **v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  HSPCUseSiriViewController *v36;
  uint8_t buf[4];
  void *v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_siriEndpointProfile"));
  v9 = (void *)objc_opt_new(NSMutableArray, v8);
  v11 = HFLogForCategory(60, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "onboardingSelections"));
    *(_DWORD *)buf = 138412290;
    v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections: %@", buf, 0xCu);

  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000130F4;
  v34[3] = &unk_1000A15F8;
  v15 = v7;
  v35 = v15;
  v36 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler globalAsyncScheduler](NAScheduler, "globalAsyncScheduler"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:scheduler:](NAFuture, "futureWithBlock:scheduler:", v34, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reschedule:", v18));

  objc_msgSend(v9, "addObject:", v19);
  if (-[HSPCUseSiriViewController _shouldEnableShareSiriAnalytics](self, "_shouldEnableShareSiriAnalytics"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addedAccessory"));
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[HUSiriEndpointUtilities presentShareSiriAndDictationAlertForSingleAccessory:accessoryName:](HUSiriEndpointUtilities, "presentShareSiriAndDictationAlertForSingleAccessory:accessoryName:", self, v23));

    v6 = v22;
    v25 = &AMSLookupKeyProfileLockup_ptr;
  }
  else
  {
    v25 = &AMSLookupKeyProfileLockup_ptr;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  objc_msgSend(v9, "addObject:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController commitConfiguration](self, "commitConfiguration"));
  objc_msgSend(v9, "addObject:", v26);

  v27 = v25[247];
  v28 = objc_msgSend(v9, "copy");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "chainFutures:", v28));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000132AC;
  v32[3] = &unk_1000A0D90;
  v33 = v4;
  v30 = v4;
  v31 = objc_msgSend(v29, "addCompletionBlock:", v32);

}

- (BOOL)_shouldEnableShareSiriAnalytics
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  int v14;
  const char *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;

  v3 = HFLogForCategory(58, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
    v6 = objc_msgSend(v5, "isShareSiriAnalyticsEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "onboardingSelections"));
    v14 = 136315650;
    v15 = "-[HSPCUseSiriViewController _shouldEnableShareSiriAnalytics]";
    v16 = 1024;
    v17 = v6;
    v18 = 1024;
    v19 = objc_msgSend(v8, "allowHeySiri");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s *** Value for  self.config.isShareSiriAnalyticsEnabled *** = %{BOOL}d, allowHeySiri = %{BOOL}d", (uint8_t *)&v14, 0x18u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
  if (objc_msgSend(v9, "isShareSiriAnalyticsEnabled"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriViewController config](self, "config"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "onboardingSelections"));
    v12 = objc_msgSend(v11, "allowHeySiri");

  }
  else
  {
    v12 = 0;
  }

  return v12;
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

- (AFEnablementFlowConfigurationProvider)enablementFlowConfigurationProvider
{
  return self->_enablementFlowConfigurationProvider;
}

- (void)setEnablementFlowConfigurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_enablementFlowConfigurationProvider, a3);
}

- (AFEnablementConfiguration)enablementConfiguration
{
  return self->_enablementConfiguration;
}

- (void)setEnablementConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_enablementConfiguration, a3);
}

- (UIImageView)siriIconImageView
{
  return self->_siriIconImageView;
}

- (void)setSiriIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_siriIconImageView, a3);
}

- (UIView)siriIconContainerView
{
  return self->_siriIconContainerView;
}

- (void)setSiriIconContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_siriIconContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIconContainerView, 0);
  objc_storeStrong((id *)&self->_siriIconImageView, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_enablementFlowConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
