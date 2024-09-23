@implementation HSPCWalletKeyViewController

- (HSPCWalletKeyViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  void *v7;
  HSPCWalletKeyViewController *v8;
  HSPCWalletKeyViewController *v9;
  UIImageView *v10;
  UIImageView *walletAppIconImageView;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  _QWORD *v39;
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  _QWORD *v46;
  id v47;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  HSPCWalletKeyViewController *v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id location;
  _QWORD v71[4];
  id v72[2];
  objc_super v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  void *v77;

  v50 = a3;
  v53 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRXImageView imageViewWithStyle:](PRXImageView, "imageViewWithStyle:", 0));
  objc_msgSend(v7, "setContentMode:", 1);
  v73.receiver = self;
  v73.super_class = (Class)HSPCWalletKeyViewController;
  v8 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v73, "initWithCenterContentView:size:", v7, 185.0, 107.0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a4);
    objc_storeStrong((id *)&v9->_coordinator, a3);
    objc_storeStrong((id *)&v9->_cardImageView, v7);
    v10 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    walletAppIconImageView = v9->_walletAppIconImageView;
    v9->_walletAppIconImageView = v10;

    v13 = objc_msgSend((id)objc_opt_class(v9, v12), "_getBundleIDForWalletAppIcon");
    v51 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v14 = HFLogForCategory(66);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v75 = "-[HSPCWalletKeyViewController initWithCoordinator:config:]";
      v76 = 2112;
      v77 = v51;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(%s) wallet app icon's bundleID = %@", buf, 0x16u);
    }

    v49 = objc_msgSend(objc_alloc((Class)ISIcon), "initWithBundleIdentifier:", v51);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v16, "scale");
    v18 = v17;

    v52 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", 64.0, 64.0, *(double *)&v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
    objc_msgSend(v52, "setAppearance:", objc_msgSend(v19, "userInterfaceStyle") != (id)1);

    objc_initWeak((id *)buf, v9);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_100055708;
    v71[3] = &unk_1000A3558;
    objc_copyWeak(v72, (id *)buf);
    v72[1] = v18;
    objc_msgSend(v49, "getImageForImageDescriptor:completion:", v52, v71);
    objc_msgSend(v7, "addSubview:", v9->_walletAppIconImageView);
    v20 = sub_1000593D8(CFSTR("HSProximityCardWalletKeyTitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[HSPCWalletKeyViewController setTitle:](v9, "setTitle:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "home"));
    v23 = objc_msgSend(v22, "hf_currentUserIsRestrictedGuest");

    if (v23)
    {
      objc_initWeak(&location, v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "home"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "hf_hasWalletKey"));
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100055830;
      v67[3] = &unk_1000A1780;
      objc_copyWeak(&v69, &location);
      v68 = v53;
      v26 = objc_msgSend(v25, "flatMap:", v67);

      objc_destroyWeak(&v69);
      objc_destroyWeak(&location);
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "home"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
      v35 = sub_1000594F0(CFSTR("HSProximityCardWalletKeySubitle"), CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      -[HSPCWalletKeyViewController setSubtitle:](v9, "setSubtitle:", v36);

    }
    v37 = -[HSPCWalletKeyViewController addProminentButtonWithTitleKey:target:futureSelector:](v9, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v9, "commitConfiguration");
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100055A24;
    v64[3] = &unk_1000A30A0;
    objc_copyWeak(&v66, (id *)buf);
    v38 = v7;
    v65 = v38;
    v39 = objc_retainBlock(v64);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100055B28;
    v59[3] = &unk_1000A35D0;
    v40 = v53;
    v60 = v40;
    objc_copyWeak(&v63, (id *)buf);
    v41 = v39;
    v62 = v41;
    v61 = v38;
    v42 = objc_retainBlock(v59);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "home"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "hf_hasWalletKey"));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100055F64;
    v54[3] = &unk_1000A3620;
    v55 = v40;
    v56 = v9;
    v45 = v41;
    v57 = v45;
    v46 = v42;
    v58 = v46;
    v47 = objc_msgSend(v44, "flatMap:", v54);

    objc_destroyWeak(&v63);
    objc_destroyWeak(&v66);
    objc_destroyWeak(v72);
    objc_destroyWeak((id *)buf);

  }
  return v9;
}

- (void)_setupWalletAppIconImageView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyViewController cardImageView](self, "cardImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyViewController cardImageView](self, "cardImageView"));
    objc_msgSend(v5, "frame");
    v7 = v6 * 0.5 + 84.5 + -64.0 + 16.0;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyViewController cardImageView](self, "cardImageView"));
    objc_msgSend(v8, "frame");
    v10 = v9 * 0.5 + 53.5 + -64.0;

    v13 = (id)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyViewController walletAppIconImageView](self, "walletAppIconImageView"));
    objc_msgSend(v13, "setFrame:", v7, v10, 64.0, 64.0);

  }
  else
  {
    v11 = HFLogForCategory(66);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100061050();

  }
}

+ (id)_getBundleIDForWalletAppIcon
{
  if (+[HFUtilities isAnIPhone](HFUtilities, "isAnIPhone"))
    return CFSTR("com.apple.Passbook");
  else
    return CFSTR("com.apple.PassbookStub");
}

- (id)commitConfiguration
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;

  v3 = HFLogForCategory(68);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[HSPCWalletKeyViewController commitConfiguration]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Continue button for HSPCWalletKeyViewController", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyViewController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000565D4;
  v16[3] = &unk_1000A0F68;
  objc_copyWeak(&v17, (id *)buf);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v16));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100056AD4;
  v14[3] = &unk_1000A1328;
  objc_copyWeak(&v15, (id *)buf);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recover:", v14));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100056B68;
  v12[3] = &unk_1000A11E8;
  objc_copyWeak(&v13, (id *)buf);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addCompletionBlock:", v12));
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
  return v10;
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

- (UIImageView)cardImageView
{
  return self->_cardImageView;
}

- (void)setCardImageView:(id)a3
{
  objc_storeStrong((id *)&self->_cardImageView, a3);
}

- (UIImageView)walletAppIconImageView
{
  return self->_walletAppIconImageView;
}

- (void)setWalletAppIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_walletAppIconImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletAppIconImageView, 0);
  objc_storeStrong((id *)&self->_cardImageView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
