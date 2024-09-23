@implementation HSPCWalletKeyUWBViewController

- (HSPCWalletKeyUWBViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  void *v8;
  HSPCWalletKeyUWBViewController *v9;
  HSPCWalletKeyUWBViewController *v10;
  uint64_t v11;
  uint64_t v12;
  UIImageView *door;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  UIImageView *figureStand;
  void *v34;
  UIImageView *v35;
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
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v58;
  id v59;
  _QWORD v60[4];
  HSPCWalletKeyUWBViewController *v61;
  _QWORD v62[4];
  id v63;
  id location;
  objc_super v65;
  _QWORD v66[2];

  v59 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PRXImageView imageViewWithStyle:](PRXImageView, "imageViewWithStyle:", 0));
  objc_msgSend(v8, "setContentMode:", 1);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setSemanticContentAttribute:", 3);
  v65.receiver = self;
  v65.super_class = (Class)HSPCWalletKeyUWBViewController;
  v9 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v65, "initWithCenterContentView:size:", v8, 200.0, 132.0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v12 = objc_opt_new(UIImageView, v11);
    door = v10->_door;
    v10->_door = (UIImageView *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    v66[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    v66[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 2));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v16));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("door.right.hand.closed")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageByApplyingSymbolConfiguration:", v58));
    -[UIImageView setImage:](v10->_door, "setImage:", v18);

    -[UIImageView setContentMode:](v10->_door, "setContentMode:", 1);
    -[UIImageView setSemanticContentAttribute:](v10->_door, "setSemanticContentAttribute:", 3);
    objc_msgSend(v8, "addSubview:", v10->_door);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v10->_door, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    objc_msgSend(v21, "setActive:", 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v10->_door, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    objc_msgSend(v24, "setActive:", 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v10->_door, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    objc_msgSend(v27, "setActive:", 1);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v10->_door, "heightAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:multiplier:", v29, 0.85));
    objc_msgSend(v30, "setActive:", 1);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_door, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v32 = objc_opt_new(UIImageView, v31);
    figureStand = v10->_figureStand;
    v10->_figureStand = (UIImageView *)v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("figure.stand")));
    -[UIImageView setImage:](v10->_figureStand, "setImage:", v34);

    -[UIImageView setContentMode:](v10->_figureStand, "setContentMode:", 1);
    v35 = v10->_figureStand;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIImageView setTintColor:](v35, "setTintColor:", v36);

    objc_msgSend(v8, "addSubview:", v10->_figureStand);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v10->_figureStand, "centerXAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerXAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
    objc_msgSend(v39, "setActive:", 1);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v10->_figureStand, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
    objc_msgSend(v42, "setActive:", 1);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v10->_figureStand, "widthAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:multiplier:", v44, 0.5));
    objc_msgSend(v45, "setActive:", 1);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v10->_figureStand, "heightAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:multiplier:", v47, 0.6));
    objc_msgSend(v48, "setActive:", 1);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_figureStand, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "bringSubviewToFront:", v10->_figureStand);
    v49 = sub_1000593D8(CFSTR("HSProximityCardWalletKeyUWBLockTitle"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    -[HSPCWalletKeyUWBViewController setTitle:](v10, "setTitle:", v50);

    v51 = sub_1000593D8(CFSTR("HSProximityCardWalletKeyUWBLockSubtitle"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    -[HSPCWalletKeyUWBViewController setSubtitle:](v10, "setSubtitle:", v52);

    objc_initWeak(&location, v10);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "hf_fetchWalletKeyDeviceStateForCurrentDevice"));
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10002F65C;
    v62[3] = &unk_1000A1CB8;
    objc_copyWeak(&v63, &location);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "flatMap:", v62));
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10002F80C;
    v60[3] = &unk_1000A10D0;
    v61 = v10;
    v56 = objc_msgSend(v55, "recover:", v60);

    objc_destroyWeak(&v63);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCWalletKeyUWBViewController;
  -[HSPCWalletKeyUWBViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[HSPCWalletKeyUWBViewController _setAllowsAlertStacking:](self, "_setAllowsAlertStacking:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCWalletKeyUWBViewController;
  -[HSPCWalletKeyUWBViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[HSPCWalletKeyUWBViewController _setAllowsAlertStacking:](self, "_setAllowsAlertStacking:", 0);
}

- (id)commitConfiguration
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController continueAction](self, "continueAction"));

  if (v4)
  {
    v6 = HFLogForCategory(68, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend((id)objc_opt_class(self, v8), "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped Continue button", (uint8_t *)&v15, 0x16u);

    }
    -[HSPCWalletKeyUWBViewController _updateHasOnboardedForWalletKey:](self, "_updateHasOnboardedForWalletKey:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A82F0));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach](self, "_turnOnUnlockOnApproach"));
  }
  return v13;
}

- (id)_turnOnUnlockOnApproach
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  HSPCWalletKeyUWBViewController *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;

  v3 = HFLogForCategory(68, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = self;
    v28 = 2080;
    v29 = "-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped turn on unlock on approach button", buf, 0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "walletKey"));
  v7 = objc_msgSend(v6, "isUWBUnlockEnabled");

  if (v7)
  {
    v9 = HFLogForCategory(66, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
      *(_DWORD *)buf = 138412802;
      v27 = self;
      v28 = 2080;
      v29 = "-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach]";
      v30 = 2112;
      v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key exists and UWB is enabled. Continuing to next prox card.\nDevice state = %@", buf, 0x20u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A82F0));
    return v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "walletKey"));
  v15 = v14 == 0;

  v17 = HFLogForCategory(66, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v19)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
      *(_DWORD *)buf = 138412802;
      v27 = self;
      v28 = 2080;
      v29 = "-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach]";
      v30 = 2112;
      v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key does NOT exist.\nDevice state = %@", buf, 0x20u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController _addWalletKeyWithUWB](self, "_addWalletKeyWithUWB"));
    return v12;
  }
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
    *(_DWORD *)buf = 138412802;
    v27 = self;
    v28 = 2080;
    v29 = "-[HSPCWalletKeyUWBViewController _turnOnUnlockOnApproach]";
    v30 = 2112;
    v31 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key exists, but UWB is NOT enabled. Enabling UBW of existing wallet key after auth.\nDevice state = %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002FE34;
  v24[3] = &unk_1000A1D50;
  objc_copyWeak(&v25, (id *)buf);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v24));
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
  return v21;
}

- (id)_notNowTapped
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;

  v3 = HFLogForCategory(68, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend((id)objc_opt_class(self, v5), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v14 = 138412546;
    v15 = v7;
    v16 = 2080;
    v17 = "-[HSPCWalletKeyUWBViewController _notNowTapped]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped \"not now\" button", (uint8_t *)&v14, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "walletKey"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "walletKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
    -[HSPCWalletKeyUWBViewController _updateHasOnboardedForWalletKey:](self, "_updateHasOnboardedForWalletKey:", v12);

  }
  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A82F0));
}

- (id)_shouldShowSingleContinueButton
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  HSPCWalletKeyUWBViewController *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unsigned int v37;

  if (!+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    if ((+[HFUtilities isInternalTest](HFUtilities, "isInternalTest") & 1) == 0)
    {
      v7 = objc_alloc_init((Class)LAContext);
      v27 = 0;
      v8 = objc_msgSend(v7, "canEvaluatePolicy:error:", 2, &v27);
      v10 = HFLogForCategory(66, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = CFSTR("Showing single continue button because cannot");
        if (v8)
          v12 = CFSTR("This device can");
        *(_DWORD *)buf = 136315394;
        v29 = (HSPCWalletKeyUWBViewController *)"-[HSPCWalletKeyUWBViewController _shouldShowSingleContinueButton]";
        v30 = 2112;
        v31 = (const char *)v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) %@ do local authentication.", buf, 0x16u);
      }

      if (!v8)
      {
        v25 = &__kCFBooleanTrue;
LABEL_19:
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v25));

        return v26;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "walletKey"));
    v15 = objc_msgSend(v14, "isUWBUnlockEnabled");

    v17 = HFLogForCategory(66, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v15)
        v19 = CFSTR("single continue button");
      else
        v19 = CFSTR("two buttons");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "walletKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "walletKey"));
      v24 = objc_msgSend(v23, "isUWBUnlockEnabled");
      *(_DWORD *)buf = 138413314;
      v29 = self;
      v30 = 2080;
      v31 = "-[HSPCWalletKeyUWBViewController _shouldShowSingleContinueButton]";
      v32 = 2112;
      v33 = v19;
      v34 = 2112;
      v35 = v21;
      v36 = 1024;
      v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing %@ because walletKeyDeviceState.walletKey = %@. isUWBUnlockEnabled = %{BOOL}d", buf, 0x30u);

    }
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
    v25 = v7;
    goto LABEL_19;
  }
  v4 = HFLogForCategory(66, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = self;
    v30 = 2080;
    v31 = "-[HSPCWalletKeyUWBViewController _shouldShowSingleContinueButton]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing single continue button for iPad", buf, 0x16u);
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
}

- (void)_setAllowsAlertStacking:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  v5 = objc_opt_class(HSProximityCardHostViewController, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController coordinator](self, "coordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_remoteViewControllerProxy"));
  objc_msgSend(v10, "setAllowsAlertStacking:", v3);

}

- (id)_addWalletKeyWithUWB
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  if (-[HSPCWalletKeyUWBViewController _shouldIncludeTapToUnlock](self, "_shouldIncludeTapToUnlock"))
    v3 = 7;
  else
    v3 = 5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
  v7 = objc_msgSend(v5, "stateMachineConfigurationGetLaunchReason:", v6);

  if (v7)
    v8 = 1;
  else
    v8 = v3;
  return -[HSPCWalletKeyUWBViewController _addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:](self, "_addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:", v3, v8);
}

- (id)_addWalletKeyWithoutUWB
{
  return -[HSPCWalletKeyUWBViewController _addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:](self, "_addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:", 1, 1);
}

- (id)_addWalletKeyWithiPhoneUWBOptions:(int64_t)a3 pairedWatchesUWBOptions:(int64_t)a4
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
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
  id v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;

  v7 = HFLogForCategory(66, a2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend((id)objc_opt_class(self, v9), "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = HMHomeAddWalletKeyOptionsDescription(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = HMHomeAddWalletKeyOptionsDescription(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138413058;
    v36 = v11;
    v37 = 2080;
    v38 = "-[HSPCWalletKeyUWBViewController _addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:]";
    v39 = 2112;
    v40 = v13;
    v41 = 2112;
    v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%@:%s) iPhone Wallet Key Options = %@. Paired Apple Watches Options = %@", buf, 0x2Au);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "home"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hf_addWalletKeyWithOptions:", a3));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000306E8;
  v34[3] = &unk_1000A1E18;
  v34[4] = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "addCompletionBlock:", v34));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "home"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hf_addWalletKeyToPairedWatchesWithOptions:", a4 | 1));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recoverIgnoringError"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "flatMap:", &stru_1000A2570));

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100030708;
  v32[3] = &unk_1000A1838;
  v32[4] = self;
  v25 = v24;
  v33 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "flatMap:", v32));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100030808;
  v30[3] = &unk_1000A2598;
  v30[4] = self;
  v31 = v25;
  v27 = v25;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recover:", v30));

  return v28;
}

- (void)_enableUWBOfExistingWalletKeyAfterAuthWithPromise:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _BYTE location[12];
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "walletKey"));

  if (v6)
  {
    v8 = objc_alloc_init((Class)LAContext);
    v27 = 0;
    v9 = objc_msgSend(v8, "canEvaluatePolicy:error:", 2, &v27);
    v11 = v27;
    if ((v9 & 1) != 0)
    {
      v12 = sub_1000593D8(CFSTR("HSProximityCardWalletKeyUWB_AuthString"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      objc_initWeak((id *)location, self);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100030CDC;
      v23[3] = &unk_1000A1DF0;
      objc_copyWeak(&v26, (id *)location);
      v24 = v8;
      v25 = v4;
      objc_msgSend(v24, "evaluatePolicy:localizedReason:reply:", 2, v13, v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v18 = HFLogForCategory(66, v10);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend((id)objc_opt_class(self, v20), "description");
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)location = 138412802;
        *(_QWORD *)&location[4] = v22;
        v29 = 2080;
        v30 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]";
        v31 = 2112;
        v32 = v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "(%@:%s) Cannot local authenticate. Error = %@", location, 0x20u);

      }
      objc_msgSend(v4, "finishWithResult:", &off_1000A8308);
    }

  }
  else
  {
    v14 = HFLogForCategory(66, v7);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "home"));
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = self;
      v29 = 2080;
      v30 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]";
      v31 = 2112;
      v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(%@:%s) wallet key does not exist for home %@.", location, 0x20u);

    }
    objc_msgSend(v4, "finishWithResult:", &off_1000A82F0);
  }

}

- (void)_updateHasOnboardedForWalletKey:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v6 = HFLogForCategory(66, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    *(_DWORD *)buf = 136315650;
    v18 = "-[HSPCWalletKeyUWBViewController _updateHasOnboardedForWalletKey:]";
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Updating hasOnboarded for Wallet Key (%@) for home %@", buf, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "home"));
  v12 = objc_msgSend(v11, "hf_setHasOnboardedForWalletKey");

  objc_initWeak((id *)buf, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "home"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100031628;
  v15[3] = &unk_1000A13D8;
  objc_copyWeak(&v16, (id *)buf);
  objc_msgSend(v14, "setDismissedWalletKeyUWBUnlockOnboardingWithCompletion:", v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (BOOL)_shouldIncludeTapToUnlock
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  HSPCWalletKeyUWBViewController *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "walletKey"));

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "walletKey"));
    v8 = objc_msgSend(v7, "isExpressEnabled");

    v10 = HFLogForCategory(66, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "walletKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "home"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
      v17 = (void *)v16;
      v26 = 138413570;
      v18 = CFSTR("NOT");
      v27 = self;
      v28 = 2080;
      v29 = "-[HSPCWalletKeyUWBViewController _shouldIncludeTapToUnlock]";
      if (v8)
        v18 = &stru_1000A3BA0;
      v19 = CFSTR("YES");
      v30 = 2112;
      v31 = v13;
      v32 = 2112;
      if (v8)
        v19 = CFSTR("NO");
      v33 = v16;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key exists (%@) for home %@. Express is %@ enabled. Returning %@.", (uint8_t *)&v26, 0x3Eu);

    }
    return v8 ^ 1;
  }
  else
  {
    v21 = HFLogForCategory(68, v5);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController config](self, "config"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "home"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
      v26 = 138412802;
      v27 = self;
      v28 = 2080;
      v29 = "-[HSPCWalletKeyUWBViewController _shouldIncludeTapToUnlock]";
      v30 = 2112;
      v31 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "(%@:%s) Wallet key does NOT exist for home %@. Including both UWB and NFC for this prox card.", (uint8_t *)&v26, 0x20u);

    }
    return 1;
  }
}

- (id)dismissButtonBlock
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  HSPCWalletKeyUWBViewController *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v3 = HFLogForCategory(68, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyUWBViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "walletKey"));
    *(_DWORD *)buf = 138412802;
    v10 = self;
    v11 = 2080;
    v12 = "-[HSPCWalletKeyUWBViewController dismissButtonBlock]";
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) User tapped dismiss button. walletKey = %@", buf, 0x20u);

  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031A44;
  v8[3] = &unk_1000A10A8;
  v8[4] = self;
  return objc_retainBlock(v8);
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

- (PRXAction)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
  objc_storeStrong((id *)&self->_continueAction, a3);
}

- (HMHomeWalletKeyDeviceState)walletKeyDeviceState
{
  return self->_walletKeyDeviceState;
}

- (void)setWalletKeyDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_walletKeyDeviceState, a3);
}

- (UIImageView)figureStand
{
  return self->_figureStand;
}

- (void)setFigureStand:(id)a3
{
  objc_storeStrong((id *)&self->_figureStand, a3);
}

- (UIImageView)door
{
  return self->_door;
}

- (void)setDoor:(id)a3
{
  objc_storeStrong((id *)&self->_door, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_door, 0);
  objc_storeStrong((id *)&self->_figureStand, 0);
  objc_storeStrong((id *)&self->_walletKeyDeviceState, 0);
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
