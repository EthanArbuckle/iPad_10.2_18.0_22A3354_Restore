@implementation HSPCSiriSetupViewController

- (HSPCSiriSetupViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v11;
  HSPCSiriSetupViewController *v12;
  HSPCSiriSetupViewController *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  objc_super v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)UIView);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v9 = (void *)qword_1000C3540;
  v35 = qword_1000C3540;
  if (!qword_1000C3540)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10002DF9C;
    v31[3] = &unk_1000A24F8;
    v31[4] = &v32;
    sub_10002DF9C((uint64_t)v31);
    v9 = (void *)v33[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v32, 8);
  v11 = objc_msgSend([v10 alloc], "initWithFrame:", 0.0, 0.0, 198.0, 198.0);
  objc_msgSend(v11, "setMode:", 3);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addSubview:", v11);
  v30.receiver = self;
  v30.super_class = (Class)HSPCSiriSetupViewController;
  v12 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v30, "initWithCenterContentView:size:", v8, 198.0, 198.0);
  v13 = v12;
  if (v12)
  {
    -[HSPCSiriSetupViewController setConfig:](v12, "setConfig:", v7);
    -[HSPCSiriSetupViewController setCoordinator:](v13, "setCoordinator:", v6);
    -[HSPCSiriSetupViewController setSiriOrbView:](v13, "setSiriOrbView:", v11);
    -[HSPCSiriSetupViewController setSiriOrbContainerView:](v13, "setSiriOrbContainerView:", v8);
    if (-[HSPCSiriSetupViewController _siriEnabledOnCurrentDevice](v13, "_siriEnabledOnCurrentDevice"))
      v14 = CFSTR("HUSiriEndpointSetup_SiriSetup_SiriEnabled_Title");
    else
      v14 = CFSTR("HUSiriEndpointSetup_SiriSetup_SiriDisabled_Title");
    v15 = HULocalizedString(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[HSPCSiriSetupViewController setTitle:](v13, "setTitle:", v16);

    v17 = HULocalizedString(CFSTR("HUSiriEndpointSetup_SiriSetup_UseSiriButtonTitle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = -[HSPCSiriSetupViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v13, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v18, v13, "commitConfiguration");

    v20 = HULocalizedString(CFSTR("HUSiriEndpointSetup_SiriSetup_DoNotRecognizeVoiceButtonTitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = -[HSPCSiriSetupViewController addOptionalButtonWithLocalizedTitle:target:futureSelector:](v13, "addOptionalButtonWithLocalizedTitle:target:futureSelector:", v21, v13, "_disableVoiceRecognition");

    LODWORD(v21) = -[HSPCSiriSetupViewController _siriEnabledOnCurrentDevice](v13, "_siriEnabledOnCurrentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    v24 = HULocalizedSiriTriggerPhrase();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((_DWORD)v21)
      v26 = CFSTR("HUSiriEndpointSetup_SiriSetup_SiriEnabled_Subtitle");
    else
      v26 = CFSTR("HUSiriEndpointSetup_SiriSetup_SiriDisabled_Subtitle");
    v27 = HULocalizedStringWithFormat(v26, CFSTR("%@"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[HSPCSiriSetupViewController setSubtitle:](v13, "setSubtitle:", v28, v25);

  }
  return v13;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  objc_super v61;
  _QWORD v62[8];
  const __CFString *v63;
  void *v64;
  NSAttributedStringKey v65;
  void *v66;

  v61.receiver = self;
  v61.super_class = (Class)HSPCSiriSetupViewController;
  -[HSPCFixedSizeCenterContentViewController viewDidLoad](&v61, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 3));
  v4 = HULocalizedString(CFSTR("HUSiriEndpointSetup_FinePrint_Link_Only"));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc((Class)NSAttributedString);
  v65 = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v66 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
  v58 = (void *)v5;
  v60 = objc_msgSend(v6, "initWithString:attributes:", v5, v8);

  v9 = objc_alloc((Class)NSMutableAttributedString);
  v10 = HULocalizedString(CFSTR("HUSiriEndpointSetup_FinePrint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v59 = objc_msgSend(v9, "initWithString:", v11);

  objc_msgSend(v59, "appendAttributedString:", v60);
  v12 = objc_msgSend(v59, "copy");
  objc_msgSend(v3, "setAttributedText:", v12);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = v3;
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  v14 = objc_alloc((Class)HUStringInLabelTapGestureRecognizer);
  v63 = CFSTR("URL_KEY");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents siriPrivacyURL](HFURLComponents, "siriPrivacyURL"));
  v64 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
  v57 = objc_msgSend(v14, "initWithTarget:action:hitBoxString:userInfo:", self, "_handleFooterLabelTouchForOpenURL:", v5, v16);

  objc_msgSend(v13, "addGestureRecognizer:", v57);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController contentView](self, "contentView"));
  objc_msgSend(v17, "addSubview:", v13);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController siriOrbView](self, "siriOrbView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "centerXAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController contentView](self, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "mainContentGuide"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "centerXAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v52));
  v62[0] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController siriOrbView](self, "siriOrbView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController contentView](self, "contentView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "subtitleLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, -20.0));
  v62[1] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController siriOrbView](self, "siriOrbView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "widthAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToConstant:", 198.0));
  v62[2] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController siriOrbView](self, "siriOrbView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "heightAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToConstant:", 198.0));
  v62[3] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController contentView](self, "contentView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "mainContentGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v34));
  v62[4] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController siriOrbView](self, "siriOrbView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, -20.0));
  v62[5] = v29;
  v40 = v13;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mainContentGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v20));
  v62[6] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mainContentGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:", v25));
  v62[7] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

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

      -[HSPCSiriSetupViewController _launchSiriPrivacySheet](self, "_launchSiriPrivacySheet");
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

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A82A8);
}

- (void)_launchSiriPrivacySheet
{
  uint64_t v3;
  void *v4;
  HSPCSiriSetupViewController *v5;
  HSPCSiriSetupViewController *v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController navigationController](self, "navigationController"));
  v4 = (void *)v3;
  if (v3)
    v5 = (HSPCSiriSetupViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifer:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifer:", OBPrivacySiriIdentifier));
  objc_msgSend(v7, "setPresentingViewController:", v6);

  objc_msgSend(v7, "present");
}

- (id)_disableVoiceRecognition
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  int v28;
  void *v29;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));

  v6 = objc_alloc((Class)HFUserItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentUser"));
  v8 = objc_msgSend(v6, "initWithHome:user:nameStyle:", v5, v7, 0);

  v9 = objc_msgSend(v8, "setEnableIdentifyVoice:", 0);
  v11 = HFLogForCategory(60, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v28 = 138412290;
    v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Disabling voice recognition", (uint8_t *)&v28, 0xCu);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController config](self, "config"));
  objc_msgSend(v15, "setShouldSkipVoiceProfileSetup:", 1);

  v17 = HFLogForCategory(60, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v28 = 138412290;
    v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ User has opted to not enable voice recognition. Setting flag to skip voice profile setup flow.", (uint8_t *)&v28, 0xCu);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController config](self, "config"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController config](self, "config"));
  v24 = objc_msgSend(v22, "stateMachineConfigurationGetLaunchReason:", v23);

  if (v24 == (id)3)
    v25 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A82C0));
  else
    v25 = objc_claimAutoreleasedReturnValue(-[HSPCSiriSetupViewController commitConfiguration](self, "commitConfiguration"));
  v26 = (void *)v25;

  return v26;
}

- (BOOL)_siriEnabledOnCurrentDevice
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  int v12;
  HSPCSiriSetupViewController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  unsigned int v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v5 = objc_msgSend(v4, "assistantIsEnabled");

  v7 = HFLogForCategory(60, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    v16 = 1024;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Is Siri enabled on this device? %{BOOL}d", (uint8_t *)&v12, 0x1Cu);

  }
  return v5;
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

- (SUICOrbView)siriOrbView
{
  return self->_siriOrbView;
}

- (void)setSiriOrbView:(id)a3
{
  objc_storeStrong((id *)&self->_siriOrbView, a3);
}

- (UIView)siriOrbContainerView
{
  return self->_siriOrbContainerView;
}

- (void)setSiriOrbContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_siriOrbContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriOrbContainerView, 0);
  objc_storeStrong((id *)&self->_siriOrbView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
