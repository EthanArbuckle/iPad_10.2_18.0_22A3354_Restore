@implementation HSPCPINCodeTextFieldViewController

- (HSPCPINCodeTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  HSPCPINCodeTextFieldViewController *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HFPinCodeManager *pinCodeManager;
  HFPinCodeManager *v19;
  id v20;
  void *v21;
  void *v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HSPCPINCodeTextFieldViewController;
  v8 = -[HSPCTextFieldViewController initWithCoordinator:config:withTextFieldMinimumHeight:](&v30, "initWithCoordinator:config:withTextFieldMinimumHeight:", v6, v7, 100.0);
  if (v8)
  {
    v9 = sub_1000593D8(CFSTR("HSProximityCardPINCodeTextFieldTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[HSPCPINCodeTextFieldViewController setTitle:](v8, "setTitle:", v10);

    v11 = sub_1000593D8(CFSTR("HSProximityCardPINCodeTextFieldSubtitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCPINCodeTextFieldViewController setSubtitle:](v8, "setSubtitle:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController continueAction](v8, "continueAction"));
    objc_msgSend(v13, "setEnabled:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 1));
    -[HSPCTextFieldViewController setFootnoteLabel:](v8, "setFootnoteLabel:", v14);

    v8->_PINCodeLengthMin = 4;
    v8->_PINCodeLengthMax = 8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pinCodeManagerForHome:", v16));
    pinCodeManager = v8->_pinCodeManager;
    v8->_pinCodeManager = (HFPinCodeManager *)v17;

    objc_initWeak(&location, v8);
    v19 = v8->_pinCodeManager;
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_1000076E0;
    v27 = &unk_1000A0F40;
    objc_copyWeak(&v28, &location);
    -[HFPinCodeManager fetchPinCodeConstraints:](v19, "fetchPinCodeConstraints:", &v24);
    if (!qword_1000C3538)
    {
      v20 = objc_alloc_init((Class)NSNumberFormatter);
      v21 = (void *)qword_1000C3538;
      qword_1000C3538 = (uint64_t)v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale", v24, v25, v26, v27));
      objc_msgSend((id)qword_1000C3538, "setLocale:", v22);

      objc_msgSend((id)qword_1000C3538, "setNumberStyle:", 0);
    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v8;
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
  objc_super v15;
  NSAttributedStringKey v16;
  _UNKNOWN **v17;

  v15.receiver = self;
  v15.super_class = (Class)HSPCPINCodeTextFieldViewController;
  -[HSPCTextFieldViewController viewDidLoad](&v15, "viewDidLoad");
  v16 = NSKernAttributeName;
  v17 = &off_1000A8C08;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v4, "setDefaultTextAttributes:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleLargeTitle));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v9, "setClearButtonMode:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v10, "setTextAlignment:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v11, "setKeyboardType:", 4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "textFieldDidChange:", 0x20000);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  objc_msgSend(v14, "setDisableUpdateMask:", 16);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HSPCPINCodeTextFieldViewController;
  -[HSPCTextFieldViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPINCodeTextFieldViewController pinCodeManager](self, "pinCodeManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchFromAccessoryCache"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007AAC;
  v10[3] = &unk_1000A0F68;
  objc_copyWeak(&v11, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v10));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007AFC;
  v8[3] = &unk_1000A0F90;
  objc_copyWeak(&v9, &location);
  v7 = objc_msgSend(v6, "addCompletionBlock:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)commitConfiguration
{
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id buf[2];

  v3 = HFLogForCategory(68, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User tapped \"Continue\" from the PIN code text field prox card", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100007F04;
  v22[3] = &unk_1000A0FB8;
  objc_copyWeak(&v23, buf);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100007FBC;
  v20[3] = &unk_1000A1008;
  v20[4] = self;
  v5 = objc_retainBlock(v22);
  v21 = v5;
  v6 = objc_retainBlock(v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPINCodeTextFieldViewController pinCodeManager](self, "pinCodeManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fetchFromAccessoryCache"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000824C;
  v18[3] = &unk_1000A0F68;
  objc_copyWeak(&v19, buf);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v18));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000829C;
  v14[3] = &unk_1000A11C0;
  objc_copyWeak(&v17, buf);
  v10 = v5;
  v15 = v10;
  v11 = v6;
  v16 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", v14));

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak(buf);
  return v12;
}

- (id)_skipPINCodeButtonTapped
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];
  uint8_t buf[4];
  HSPCPINCodeTextFieldViewController *v13;
  __int16 v14;
  const char *v15;

  v3 = HFLogForCategory(68, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2080;
    v15 = "-[HSPCPINCodeTextFieldViewController _skipPINCodeButtonTapped]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) User tapped \"Skip\" from HSPCPINCodeTextFieldViewController", buf, 0x16u);
  }

  -[HSPCPINCodeTextFieldViewController _updateOnboardingFlags](self, "_updateOnboardingFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config", HFAnalyticsDataHomeKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v11[0] = v6;
  v11[1] = &off_1000A7F90;
  v10[1] = HFAnalyticsAccessCodeOperationTypeKey;
  v10[2] = HFAnalyticsAccessCodeDuringOnboardingKey;
  v11[2] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 26, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7F60));

  return v8;
}

- (void)_updateSubtitle
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
  {
    v5 = -[HSPCPINCodeTextFieldViewController PINCodeLengthMin](self, "PINCodeLengthMin");
    -[HSPCPINCodeTextFieldViewController PINCodeLengthMax](self, "PINCodeLengthMax");
    v12 = sub_1000594F0(CFSTR("HSProximityCardPINCodeTextFieldSubtitle_Edit"), CFSTR("%lu%lu"), v6, v7, v8, v9, v10, v11, v5);
  }
  else
  {
    v12 = sub_1000593D8(CFSTR("HSProximityCardPINCodeTextFieldSubtitle"));
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  -[HSPCPINCodeTextFieldViewController setSubtitle:](self, "setSubtitle:", v13);

}

- (id)_updatePINCodesForAllUsers
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));
  v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if ((v5 & 1) == 0)
    return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPINCodeTextFieldViewController pinCodeManager](self, "pinCodeManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enablePinCodesForAllUsersOnNewAccessory:", v8));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000095AC;
  v12[3] = &unk_1000A11E8;
  objc_copyWeak(&v13, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addCompletionBlock:", v12));
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v10;
}

- (void)_updateOnboardingFlags
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v3 = objc_alloc((Class)HFUserItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentUser"));
  v15 = objc_msgSend(v3, "initWithHome:user:nameStyle:", v5, v8, 0);

  v9 = objc_msgSend(v15, "setDismissAccessCodeOnboarding:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "home"));
  LODWORD(v5) = objc_msgSend(v11, "hf_currentUserIsAdministrator");

  if ((_DWORD)v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "home"));
    v14 = objc_msgSend(v13, "hf_setHasOnboardedForAccessCode");

  }
}

- (void)_updateContinueActionEnabledFor:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v5 = objc_msgSend(v4, "isUserInteractionEnabled");

  if ((v5 & 1) != 0)
  {
    v6 = objc_msgSend(v11, "length");
    v7 = (uint64_t)v6 >= -[HSPCPINCodeTextFieldViewController PINCodeLengthMin](self, "PINCodeLengthMin")
      && (uint64_t)v6 <= -[HSPCPINCodeTextFieldViewController PINCodeLengthMax](self, "PINCodeLengthMax");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController continueAction](self, "continueAction"));
    v9 = v8;
    v10 = v7;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController continueAction](self, "continueAction"));
    v9 = v8;
    v10 = 1;
  }
  objc_msgSend(v8, "setEnabled:", v10);

}

- (void)textFieldDidChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  -[HSPCPINCodeTextFieldViewController _updateContinueActionEnabledFor:](self, "_updateContinueActionEnabledFor:", v4);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  id v15;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textField](self, "textField"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v11 = (void *)v10;
  v12 = &stru_1000A3BA0;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByReplacingCharactersInRange:withString:](v13, "stringByReplacingCharactersInRange:withString:", location, length, v8));
  v15 = objc_msgSend(v14, "length");
  LOBYTE(v15) = (uint64_t)v15 <= -[HSPCPINCodeTextFieldViewController PINCodeLengthMax](self, "PINCodeLengthMax");

  return (char)v15;
}

- (PRXAction)optionalAction
{
  return self->_optionalAction;
}

- (void)setOptionalAction:(id)a3
{
  objc_storeStrong((id *)&self->_optionalAction, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (int64_t)PINCodeLengthMin
{
  return self->_PINCodeLengthMin;
}

- (void)setPINCodeLengthMin:(int64_t)a3
{
  self->_PINCodeLengthMin = a3;
}

- (int64_t)PINCodeLengthMax
{
  return self->_PINCodeLengthMax;
}

- (void)setPINCodeLengthMax:(int64_t)a3
{
  self->_PINCodeLengthMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_optionalAction, 0);
}

@end
