@implementation HSPCWalletKeyExpressModeViewController

- (HSPCWalletKeyExpressModeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  HSPCWalletKeyExpressModeViewController *v10;
  HSPCWalletKeyExpressModeViewController *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  HSPCWalletKeyExpressModeViewController *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)HUIconView), "initWithFrame:contentMode:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v28.receiver = self;
  v28.super_class = (Class)HSPCWalletKeyExpressModeViewController;
  v10 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v28, "initWithCenterContentView:size:", v9, 120.0, 132.0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a4);
    objc_storeStrong((id *)&v11->_coordinator, a3);
    objc_storeStrong((id *)&v11->_iconImageView, v9);
    v12 = sub_1000593D8(CFSTR("HSProximityCardWalletKeyExpressModeTapToUnlockTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[HSPCWalletKeyExpressModeViewController setTitle:](v11, "setTitle:", v13);

    objc_initWeak(&location, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hf_fetchWalletKeyDeviceStateForCurrentDevice"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100021C68;
    v25[3] = &unk_1000A1CB8;
    objc_copyWeak(&v26, &location);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "flatMap:", v25));
    v17 = objc_msgSend(v16, "recover:", &stru_1000A1CD8);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[HFWalletUtilities walletKeyIconDescriptorForHome:shouldUseKeyholeAsset:foriPhoneDevice:](HFWalletUtilities, "walletKeyIconDescriptorForHome:shouldUseKeyholeAsset:foriPhoneDevice:", v18, 0, 1));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002209C;
    v22[3] = &unk_1000A1D00;
    v23 = v11;
    v24 = v9;
    v20 = objc_msgSend(v19, "addCompletionBlock:", v22);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCWalletKeyExpressModeViewController;
  -[HSPCWalletKeyExpressModeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[HSPCWalletKeyExpressModeViewController _setAllowsAlertStacking:](self, "_setAllowsAlertStacking:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCWalletKeyExpressModeViewController;
  -[HSPCWalletKeyExpressModeViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[HSPCWalletKeyExpressModeViewController _setAllowsAlertStacking:](self, "_setAllowsAlertStacking:", 0);
}

- (id)commitConfiguration
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  int v12;
  HSPCWalletKeyExpressModeViewController *v13;
  __int16 v14;
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController continueAction](self, "continueAction"));

  if (v4)
  {
    v6 = HFLogForCategory(68, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v12 = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped Continue button", (uint8_t *)&v12, 0x16u);

    }
    -[HSPCWalletKeyExpressModeViewController _sendAnalytics:](self, "_sendAnalytics:", 2);
    -[HSPCWalletKeyExpressModeViewController _updateHasOnboardedForWalletKey:](self, "_updateHasOnboardedForWalletKey:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A81A0));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController _enableExpressModeButtonTapped](self, "_enableExpressModeButtonTapped"));
  }
  return v10;
}

- (id)_enableExpressModeButtonTapped
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  HSPCWalletKeyExpressModeViewController *v28;
  __int16 v29;
  void *v30;

  v4 = HFLogForCategory(68, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138412546;
    v28 = self;
    v29 = 2112;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped Enable Express Mode button", buf, 0x16u);

  }
  -[HSPCWalletKeyExpressModeViewController _sendAnalytics:](self, "_sendAnalytics:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "walletKey"));
  v10 = objc_msgSend(v9, "isExpressEnabled");

  if (v10)
    return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A81A0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "walletKey"));
  v14 = v13 == 0;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "expressEnablementConflictingPassDescription"));

  if (v14)
  {
    if (v16)
    {
      objc_initWeak((id *)buf, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10002272C;
      v24[3] = &unk_1000A1D28;
      objc_copyWeak(&v26, (id *)buf);
      v25 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v24));

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController _addWalletKeyWithExpressMode](self, "_addWalletKeyWithExpressMode"));
    }

  }
  else
  {
    objc_initWeak((id *)buf, self);
    if (v16)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000228AC;
      v21[3] = &unk_1000A1D28;
      v17 = &v23;
      objc_copyWeak(&v23, (id *)buf);
      v22 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v21));

    }
    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000229D8;
      v19[3] = &unk_1000A1D50;
      v17 = &v20;
      objc_copyWeak(&v20, (id *)buf);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v19));
    }
    objc_destroyWeak(v17);
    objc_destroyWeak((id *)buf);

  }
  return v18;
}

- (void)_enableExpressModeAfterAuthWithPromise:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _BYTE location[12];
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = objc_alloc_init((Class)LAContext);
  v18 = 0;
  v6 = objc_msgSend(v5, "canEvaluatePolicy:error:", 2, &v18);
  v8 = v18;
  if (v6)
  {
    v9 = sub_1000593D8(CFSTR("HSProximityCardWalletKeyExpressModeTapToUnlock_ExpressModeAuthString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_initWeak((id *)location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100022C4C;
    v14[3] = &unk_1000A1DF0;
    objc_copyWeak(&v17, (id *)location);
    v15 = v5;
    v16 = v4;
    objc_msgSend(v15, "evaluatePolicy:localizedReason:reply:", 2, v10, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v11 = HFLogForCategory(66, v7);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = self;
      v20 = 2080;
      v21 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]";
      v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%@:%s) cannot local authenticate. error = %@", location, 0x20u);
    }

    if (v8)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
      objc_msgSend(v13, "handleError:", v8);

    }
    objc_msgSend(v5, "invalidate");
    objc_msgSend(v4, "finishWithResult:", &off_1000A81B8);
  }

}

- (id)_requireAuthenticationButtonTapped
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  HSPCWalletKeyExpressModeViewController *v16;
  __int16 v17;
  void *v18;

  v4 = HFLogForCategory(68, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v15 = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped \"Require Authentication\" button", (uint8_t *)&v15, 0x16u);

  }
  -[HSPCWalletKeyExpressModeViewController _sendAnalytics:](self, "_sendAnalytics:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "walletKey"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "walletKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
    -[HSPCWalletKeyExpressModeViewController _updateHasOnboardedForWalletKey:](self, "_updateHasOnboardedForWalletKey:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A81A0));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController _addWalletKeyWithoutExpressMode](self, "_addWalletKeyWithoutExpressMode"));
  }
  return v13;
}

- (id)_shouldShowSingleContinueButton
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  uint8_t buf[4];
  HSPCWalletKeyExpressModeViewController *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;

  if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    v4 = HFLogForCategory(66, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = self;
      v40 = 2080;
      v41 = "-[HSPCWalletKeyExpressModeViewController _shouldShowSingleContinueButton]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing single continue button for iPad", buf, 0x16u);
    }

    return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
    v10 = objc_msgSend(v8, "stateMachineConfigurationGetLaunchReason:", v9);

    if (v10)
    {
      v11 = objc_alloc_init((Class)LAContext);
      v37 = 0;
      v12 = objc_msgSend(v11, "canEvaluatePolicy:error:", 2, &v37);
      v14 = v37;
      if ((v12 & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "walletKey"));
        v17 = objc_msgSend(v16, "isExpressEnabled");

        v19 = HFLogForCategory(66, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          if ((_DWORD)v17)
            v21 = CFSTR("single continue button");
          else
            v21 = CFSTR("two buttons");
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "walletKey"));
          *(_DWORD *)buf = 138413058;
          v39 = self;
          v40 = 2080;
          v41 = "-[HSPCWalletKeyExpressModeViewController _shouldShowSingleContinueButton]";
          v42 = 2112;
          v43 = v21;
          v44 = 2112;
          v45 = v23;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing %@ because walletKeyState = %@", buf, 0x2Au);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v24));

      }
      else
      {
        v35 = HFLogForCategory(66, v13);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v39 = self;
          v40 = 2080;
          v41 = "-[HSPCWalletKeyExpressModeViewController _shouldShowSingleContinueButton]";
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing single continue button because cannot do local authentication", buf, 0x16u);
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
      }

      return v25;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController walletKeyDeviceState](self, "walletKeyDeviceState"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "walletKey"));

      v29 = HFLogForCategory(66, v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = CFSTR("NO");
        if (v27)
          v31 = CFSTR("YES");
        *(_DWORD *)buf = 138413058;
        v39 = self;
        v40 = 2080;
        v41 = "-[HSPCWalletKeyExpressModeViewController _shouldShowSingleContinueButton]";
        v42 = 2112;
        v43 = v31;
        if (v27)
          v32 = CFSTR("single continue button");
        else
          v32 = CFSTR("two buttons");
        v44 = 2112;
        v45 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "(%@:%s) hasWalletKey is %@, so showing %@", buf, 0x2Au);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v27 != 0));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v33));

      return v34;
    }
  }
}

- (id)_addWalletKeyWithExpressMode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v6 = objc_msgSend(v4, "stateMachineConfigurationGetLaunchReason:", v5);

  if (v6)
    v7 = 1;
  else
    v7 = 3;
  return -[HSPCWalletKeyExpressModeViewController _addWalletKeyWithiPhoneExpressModeOptions:pairedWatchesExpressModeOptions:](self, "_addWalletKeyWithiPhoneExpressModeOptions:pairedWatchesExpressModeOptions:", 3, v7);
}

- (id)_addWalletKeyWithoutExpressMode
{
  return -[HSPCWalletKeyExpressModeViewController _addWalletKeyWithiPhoneExpressModeOptions:pairedWatchesExpressModeOptions:](self, "_addWalletKeyWithiPhoneExpressModeOptions:pairedWatchesExpressModeOptions:", 1, 1);
}

- (id)_addWalletKeyWithiPhoneExpressModeOptions:(int64_t)a3 pairedWatchesExpressModeOptions:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hf_addWalletKeyWithOptions:", a3));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100023BEC;
  v25[3] = &unk_1000A1E18;
  v25[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addCompletionBlock:", v25));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "home"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hf_addWalletKeyToPairedWatchesWithOptions:", a4 | 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recoverIgnoringError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flatMap:", &stru_1000A1E58));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100023C0C;
  v23[3] = &unk_1000A1E80;
  v16 = v15;
  v24 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flatMap:", v23));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100023CE8;
  v21[3] = &unk_1000A10D0;
  v22 = v16;
  v18 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "recover:", v21));

  return v19;
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v6 = HFLogForCategory(66, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    v21 = 136315650;
    v22 = "-[HSPCWalletKeyExpressModeViewController _updateHasOnboardedForWalletKey:]";
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Updating hasOnboarded for Wallet Key (%@) for home %@", (uint8_t *)&v21, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "home"));
  v12 = objc_msgSend(v11, "hf_setHasOnboardedForWalletKey");

  v13 = objc_alloc((Class)HFUserItem);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "home"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "home"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentUser"));
  v19 = objc_msgSend(v13, "initWithHome:user:nameStyle:", v15, v18, 0);

  v20 = objc_msgSend(v19, "setDismissWalletKeyExpressModeOnboarding:forWalletKeyUUID:", 1, v4);
}

- (void)_sendAnalytics:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController config](self, "config"));
  v9 = (unint64_t)objc_msgSend(v7, "stateMachineConfigurationGetLaunchReason:", v8);

  if (v9 > 8)
    goto LABEL_4;
  if (((1 << v9) & 0x1CC) != 0)
  {
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    NSLog(CFSTR("Encountered unexpected launchReason while in %@: %ld"), v12, v9);

LABEL_4:
    v13 = 0;
    goto LABEL_10;
  }
  v14 = 2;
  if (v9 != 5)
    v14 = 0;
  if (v9 == 4)
    v13 = 1;
  else
    v13 = v14;
LABEL_10:
  if (a3 >= 4)
    NSLog(CFSTR("(%@:%s) express mode selection %lu is invalid"), self, "-[HSPCWalletKeyExpressModeViewController _sendAnalytics:]", a3);
  v17 = (id)objc_opt_new(NSMutableDictionary, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v17, "na_safeSetObject:forKey:", v15, HFAnalyticsWalletKeyExpressModeSelectionKey);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
  objc_msgSend(v17, "na_safeSetObject:forKey:", v16, HFAnalyticsWalletKeyExpressModeLocationKey);

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 27, v17);
}

- (id)dismissButtonBlock
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100024268;
  v3[3] = &unk_1000A10A8;
  v3[4] = self;
  return objc_retainBlock(v3);
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCWalletKeyExpressModeViewController coordinator](self, "coordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_remoteViewControllerProxy"));
  objc_msgSend(v10, "setAllowsAlertStacking:", v3);

}

+ (id)_expresssModePassConflictError:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[2];
  _QWORD v13[2];
  uint64_t v14;
  id v15;

  v14 = HFErrorHandlerOptionFailedItemNameKey;
  v15 = a3;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v5 = objc_msgSend(v4, "mutableCopy");

  v12[0] = HFErrorUserInfoOptionsKey;
  v6 = objc_msgSend(v5, "copy");
  v12[1] = HFErrorUserInfoOperationTypeKey;
  v13[0] = v6;
  v13[1] = HFOperationAddWalletKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v8 = objc_msgSend(v7, "mutableCopy");

  v9 = objc_alloc((Class)NSError);
  v10 = objc_msgSend(v9, "initWithDomain:code:userInfo:", HFErrorDomain, 81, v8);

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

- (HUIconView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_walletKeyDeviceState, 0);
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
