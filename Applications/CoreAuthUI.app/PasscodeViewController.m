@implementation PasscodeViewController

- (void)didReceiveAuthenticationData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSBundle *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  NSBundle *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSNumber *v32;
  NSNumber *failureLimit;
  uint64_t v34;
  NSBundle *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSBundle *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSBundle *v47;
  void *v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)PasscodeViewController;
  -[TransitionViewController didReceiveAuthenticationData](&v49, "didReceiveAuthenticationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_10007E540));

  if (v4)
  {
    -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v4);
    goto LABEL_9;
  }
  if ((+[LAUtils isApplePayPolicy:](LAUtils, "isApplePayPolicy:", -[TransitionViewController policy](self, "policy")) & 1) != 0|| (v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options")), v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", &off_10007E558)), v8 = objc_msgSend(v7, "BOOLValue"), v7, v6, v8))
  {
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    v12 = CFSTR("PAY");
LABEL_6:
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_10007CCD0, CFSTR("MobileUI")));
    -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v13);
    goto LABEL_7;
  }
  if ((id)-[TransitionViewController policy](self, "policy") == (id)1010)
  {
    v35 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v34));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v11 = v10;
    v12 = CFSTR("ENTER_PASSCODE_UPDATE");
    goto LABEL_6;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
  v37 = objc_msgSend(v36, "length");

  if (!v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerBundleId](self, "callerBundleId"));
    if (v38 || -[TransitionViewController callerNameOverride](self, "callerNameOverride"))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"));

      if (v40)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("APP_ASKING_PASSCODE")));
        v42 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v41));
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", v11, &stru_10007CCD0, CFSTR("MobileUI")));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v44, v45));
        -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v46);

        goto LABEL_8;
      }
    }
    v47 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v39));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ENTER_PASSCODE")));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_10007CCD0, CFSTR("MobileUI")));
    -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v48);

LABEL_7:
LABEL_8:

  }
LABEL_9:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController internalInfo](self, "internalInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("FallbackReason")));

  if (!+[LAErrorHelper error:hasCode:](LAErrorHelper, "error:hasCode:", v15, -4))
  {
    v24 = 0;
    goto LABEL_19;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", LAErrorSubcodeKey));

  if (v17)
  {
    v18 = objc_msgSend(v17, "integerValue");
    if (v18 == (id)14)
    {
      v25 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v22 = v21;
      v23 = CFSTR("PEARL_HW_ISSUE_LOW_TEMPERATURE");
      goto LABEL_17;
    }
    if (v18 == (id)13)
    {
      v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      v23 = CFSTR("PEARL_HW_ISSUE_HIGH_TEMPERATURE");
LABEL_17:
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_10007CCD0, CFSTR("MobileUI")));

      goto LABEL_18;
    }
  }
  v24 = 0;
LABEL_18:

LABEL_19:
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", &off_10007E570));

  if (v24)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v24, 512));
    -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v28);
LABEL_23:

    goto LABEL_24;
  }
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", &off_10007E570));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v29, 512));
    -[TransitionViewController setAuthenticationSubtitle:](self, "setAuthenticationSubtitle:", v30);

    goto LABEL_23;
  }
LABEL_24:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v32 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", &off_10007E588));
  failureLimit = self->_failureLimit;
  self->_failureLimit = v32;

  self->_failures = 0;
  self->_currentInterfaceStyle = 0x7FFFFFFFFFFFFFFFLL;

}

- (BOOL)isFullScreenController
{
  return 1;
}

- (void)_setupView
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PasscodeView *v12;
  PasscodeView *passcodeView;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  void *v40;

  v4 = LALogForCategory(0, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[Passcode currentPasscode](Passcode, "currentPasscode"));
    v7 = NSStringFromLACPasscodeType(objc_msgSend(v6, "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412290;
    v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lockStyle: %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[TransitionViewController isRemoteViewController](self, "isRemoteViewController", &off_10007E5A0) ^ 1));
  v38 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Passcode currentPasscode](Passcode, "currentPasscode"));
  v12 = (PasscodeView *)objc_claimAutoreleasedReturnValue(+[PasscodeContentViewControllerFactory passcodeContentViewControllerForPasscode:options:](PasscodeContentViewControllerFactory, "passcodeContentViewControllerForPasscode:options:", v11, v10));
  passcodeView = self->_passcodeView;
  self->_passcodeView = v12;

  -[PasscodeView setDelegate:](self->_passcodeView, "setDelegate:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeView view](self->_passcodeView, "view"));
  objc_msgSend(v14, "addSubview:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeView view](self->_passcodeView, "view"));
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeView view](self->_passcodeView, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  objc_msgSend(v21, "setActive:", 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeView view](self->_passcodeView, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
  objc_msgSend(v26, "setActive:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeView view](self->_passcodeView, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  objc_msgSend(v31, "setActive:", 1);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeView view](self->_passcodeView, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
  objc_msgSend(v36, "setActive:", 1);

  -[PasscodeViewController addChildViewController:](self, "addChildViewController:", self->_passcodeView);
  -[PasscodeView didMoveToParentViewController:](self->_passcodeView, "didMoveToParentViewController:", self);

}

- (void)_setupGlyph
{
  void *v3;
  void *v4;
  unsigned int v5;
  LAUIPearlGlyphView *v6;
  LAUIPearlGlyphView *glyphView;
  int v8;
  double v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController internalInfo](self, "internalInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FaceIdAtPasscode")));
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v10 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration](LAUIPearlGlyphStaticConfiguration, "createDefaultConfiguration");
    objc_msgSend(v10, "setInitialStyle:", 3);
    v6 = (LAUIPearlGlyphView *)objc_msgSend(objc_alloc((Class)LAUIPearlGlyphView), "initWithConfiguration:", v10);
    glyphView = self->_glyphView;
    self->_glyphView = v6;

    v8 = sub_10001C8C8();
    v9 = 56.0;
    if (!v8)
      v9 = 48.0;
    -[LAUIPearlGlyphView setFrame:](self->_glyphView, "setFrame:", 0.0, v9, 32.0, 32.0);
    -[LAUIPearlGlyphView setState:animated:](self->_glyphView, "setState:animated:", 1, 0);

  }
}

- (void)_layoutGlyph
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  id v22;

  -[LAUIPearlGlyphView frame](self->_glyphView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v22 = (id)objc_claimAutoreleasedReturnValue(-[PasscodeViewController view](self, "view"));
  objc_msgSend(v22, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v20 = objc_msgSend(v19, "scale");
  UIRectCenteredXInRectScale(v20, v4, v6, v8, v10, v12, v14, v16, v18, v21);
  -[LAUIPearlGlyphView setFrame:](self->_glyphView, "setFrame:");

}

- (void)passcodeViewPasscodeDidChange:(id)a3
{
  if (!self->_startedTypingPasscode)
  {
    self->_startedTypingPasscode = 1;
    -[LAUIPearlGlyphView setHidden:](self->_glyphView, "setHidden:", 1);
    -[TransitionViewController uiEvent:options:](self, "uiEvent:options:", 7, 0);
  }
}

- (void)passcodeViewPasscodeEntered:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  int v19;
  char v20;
  uint8_t buf[4];
  int v22;

  if (!self->_passcodeEntered)
  {
    self->_passcodeEntered = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeView passcode](self->_passcodeView, "passcode", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LACSecureData secureDataWithString:](LACSecureData, "secureDataWithString:", v4));

    v6 = +[LAUtils isSharedIPad](LAUtils, "isSharedIPad");
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeView passcode](self->_passcodeView, "passcode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));

      v10 = MKBUnlockDevice(v9, 0);
      v13 = LALogForCategory(0, v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MKBUnlockDevice: %d", buf, 8u);
      }

    }
    else
    {
      v10 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController backoffCounter](self, "backoffCounter"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100018E4C;
    v17[3] = &unk_10007A290;
    v20 = v7;
    v19 = v10;
    v17[4] = self;
    v18 = v5;
    v16 = v5;
    objc_msgSend(v15, "currentBackoffErrorWithReply:", v17);

  }
}

- (void)_processPasscodeEntryResult:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD block[5];
  _UNKNOWN **v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;

  if (a3)
  {
    self->_passcodeEntered = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController mechanism](self, "mechanism"));
    objc_msgSend(v5, "uiEvent:options:", 9, 0);

    if (a3 == 2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController backoffCounter](self, "backoffCounter"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100019530;
      v16[3] = &unk_10007A138;
      v16[4] = self;
      objc_msgSend(v13, "actionBackoffWithReply:", v16);
    }
    else
    {
      if (a3 != 1)
      {
        v7 = objc_claimAutoreleasedReturnValue(+[LAErrorHelper internalErrorWithMessage:](LAErrorHelper, "internalErrorWithMessage:", CFSTR("Unexpected error while attempting to verify the entered password.")));
        goto LABEL_10;
      }
      if (self->_failureLimit)
      {
        v6 = self->_failures + 1;
        self->_failures = v6;
        if (v6 > -[NSNumber unsignedIntegerValue](self->_failureLimit, "unsignedIntegerValue"))
        {
          v7 = objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorWithCode:message:](LAErrorHelper, "errorWithCode:message:", -1, CFSTR("Application retry limit exceeded.")));
LABEL_10:
          v15 = (id)v7;
          -[TransitionViewController uiFailureWithError:](self, "uiFailureWithError:");

          return;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController backoffCounter](self, "backoffCounter"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100019398;
      v17[3] = &unk_10007A138;
      v17[4] = self;
      objc_msgSend(v13, "actionFailureWithReply:", v17);
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController mechanism](self, "mechanism"));
    v23 = CFSTR("uptime");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    objc_msgSend(v9, "systemUptime");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v24 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    objc_msgSend(v8, "uiEvent:options:", 8, v11);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019380;
    block[3] = &unk_100079A08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController backoffCounter](self, "backoffCounter"));
    objc_msgSend(v12, "actionSuccess");

    v21 = CFSTR("Result");
    v19 = &off_10007E5B8;
    v20 = &__kCFBooleanTrue;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v22 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    -[TransitionViewController uiSuccessWithResult:](self, "uiSuccessWithResult:", v14);

  }
}

- (void)loadView
{
  UIView *v3;
  id v4;

  v3 = objc_opt_new(UIView);
  -[PasscodeViewController setView:](self, "setView:", v3);

  -[PasscodeViewController _setupView](self, "_setupView");
  -[PasscodeViewController _setupGlyph](self, "_setupGlyph");
  if (+[LAUtils isSharedIPad](LAUtils, "isSharedIPad"))
  {
    v4 = (id)objc_opt_new(LALocalBackoffCounter);
    -[TransitionViewController setBackoffCounter:](self, "setBackoffCounter:", v4);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PasscodeViewController;
  -[TransitionViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController backoffCounter](self, "backoffCounter"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001981C;
  v5[3] = &unk_100079F10;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "currentBackoffErrorWithReply:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PasscodeViewController;
  -[TransitionViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (!self->_isBlocked)
    -[PasscodeView becomeFirstResponder](self->_passcodeView, "becomeFirstResponder");
  if ((id)-[TransitionViewController policy](self, "policy") == (id)1010)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitionViewController rootController](TransitionViewController, "rootController"));
    objc_msgSend(v4, "idleTimerDisable:", 1);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PasscodeViewController;
  -[PasscodeViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  if (-[PasscodeViewController _hasBlurredBackground](self, "_hasBlurredBackground"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitionViewController rootController](TransitionViewController, "rootController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_remoteViewControllerProxy"));

    objc_msgSend(v5, "setWallpaperTunnelActive:", 0);
    objc_msgSend(v5, "setWallpaperStyle:withDuration:", 1, 0.0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PasscodeViewController;
  -[TransitionViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if ((id)-[TransitionViewController policy](self, "policy") == (id)1010)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitionViewController rootController](TransitionViewController, "rootController"));
    objc_msgSend(v4, "idleTimerDisable:", 0);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PasscodeViewController;
  -[PasscodeViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if ((id)self->_currentInterfaceStyle != v4)
  {
    self->_currentInterfaceStyle = (int64_t)v4;
    -[PasscodeViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[PasscodeViewController _updateStyle](self, "_updateStyle");
  }
  -[PasscodeViewController _layoutGlyph](self, "_layoutGlyph");
}

- (void)_updateStyle
{
  LAUIPearlGlyphView *glyphView;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  glyphView = self->_glyphView;
  if (-[PasscodeViewController _useWhitePasscodeScreen](self, "_useWhitePasscodeScreen"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[LAUIPearlGlyphView setFinishedColor:animated:](glyphView, "setFinishedColor:animated:", v4, 1);

  }
  else
  {
    -[LAUIPearlGlyphView setFinishedColor:animated:](glyphView, "setFinishedColor:animated:", 0, 1);
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PasscodeView state](self->_passcodeView, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController _style](self, "_style"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "withStyle:", v5));
  -[PasscodeView setState:](self->_passcodeView, "setState:", v6);

}

- (id)_style
{
  unsigned int v3;
  int64_t v4;
  void *v5;

  v3 = -[PasscodeViewController _useWhitePasscodeScreen](self, "_useWhitePasscodeScreen");
  v4 = -[PasscodeViewController _backgroundStyle](self, "_backgroundStyle");
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PasscodeViewStyle lightStyleWithBackgroundStyle:](PasscodeViewStyle, "lightStyleWithBackgroundStyle:", v4));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PasscodeViewStyle darkStyleWithBackgroundStyle:](PasscodeViewStyle, "darkStyleWithBackgroundStyle:", v4));
  return v5;
}

- (int64_t)_backgroundStyle
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
    return 3;
  if (-[PasscodeViewController _hasBlurredBackground](self, "_hasBlurredBackground"))
    return 1;
  if (-[PasscodeViewController _hasTranslucentBackground](self, "_hasTranslucentBackground"))
    return 2;
  return 0;
}

- (BOOL)_hasBlurredBackground
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_10007E5D0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E5E8));

  if (v4 | v6)
  {
    if (!v4 || (objc_msgSend((id)v4, "BOOLValue") & 1) == 0)
    {
LABEL_8:
      LOBYTE(v7) = 0;
      goto LABEL_9;
    }
  }
  else if (!-[PasscodeViewController _useWhitePasscodeScreen](self, "_useWhitePasscodeScreen")
         || !+[LAUtils isApplePayPolicy:inApp:](LAUtils, "isApplePayPolicy:inApp:", -[TransitionViewController policy](self, "policy"), 1))
  {
    goto LABEL_8;
  }
  v7 = !UIAccessibilityIsReduceTransparencyEnabled();
LABEL_9:

  return v7;
}

- (BOOL)_hasTranslucentBackground
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_10007E5D0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E5E8));

  if (v4 | v6
    || -[PasscodeViewController _useWhitePasscodeScreen](self, "_useWhitePasscodeScreen")
    || (id)-[TransitionViewController policy](self, "policy") != (id)1004)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = !UIAccessibilityIsReduceTransparencyEnabled();
  }

  return v7;
}

- (BOOL)_useWhitePasscodeScreen
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle") == (id)2;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](LAPasscodeHelper, "sharedInstance"));
  v6 = -[TransitionViewController policy](self, "policy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v8 = objc_msgSend(v5, "passcodeScreenStyleWithPolicy:options:darkInterface:", v6, v7, v4);

  return v8 == 0;
}

- (void)_showPasscodeScreen
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019F68;
  v5[3] = &unk_10007A328;
  v5[4] = self;
  v3 = sub_100019F68((uint64_t)v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[PasscodeView setState:](self->_passcodeView, "setState:", v4);

}

- (void)_showBackoffScreenWithMinsUntilUnblocked:(int)a3
{
  NSBundle *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  int v15;

  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DEVICE_BLOCKED"), &stru_10007CCD0, CFSTR("MobileUI")));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A150;
  v14[3] = &unk_10007A350;
  v14[4] = self;
  v15 = a3;
  v9 = sub_10001A150((uint64_t)v14, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PasscodeViewState backOffStateWithTitle:subtitle:](PasscodeViewState, "backOffStateWithTitle:subtitle:", v7, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeViewController _style](self, "_style"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "withStyle:", v12));
  -[PasscodeView setState:](self->_passcodeView, "setState:", v13);

}

- (int64_t)preferredStatusBarStyle
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  int64_t v9;

  if (-[PasscodeViewController _useWhitePasscodeScreen](self, "_useWhitePasscodeScreen"))
    v4 = 3;
  else
    v4 = 1;
  v5 = LALogForCategory(0, v2, v3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "statusBarStyle = %ld", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (void)_switchToBackoffScreen:(id)a3
{
  -[PasscodeViewController _switchToBackoffScreen:animated:](self, "_switchToBackoffScreen:animated:", a3, 1);
}

- (void)_switchToBackoffScreen:(id)a3 animated:(BOOL)a4
{
  void *v5;
  NSDate *v6;
  NSDate *blockedUntilDate;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", LAPasswordRetryTime));
  blockedUntilDate = self->_blockedUntilDate;
  self->_blockedUntilDate = v6;

  -[NSDate timeIntervalSinceNow](self->_blockedUntilDate, "timeIntervalSinceNow");
  self->_isBlocked = v8 > 0.0;
  if (v8 > 0.0)
  {
    -[PasscodeView resignFirstResponder](self->_passcodeView, "resignFirstResponder");
    -[PasscodeViewController _scheduleTimerIfNecessaryAndUpdateSubtitle](self, "_scheduleTimerIfNecessaryAndUpdateSubtitle");
  }
}

- (void)_clearTimer
{
  NSTimer *updateTimer;

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

- (void)_scheduleTimerIfNecessaryAndUpdateSubtitle
{
  uint64_t v2;
  NSObject *v4;
  NSDate *blockedUntilDate;
  double v6;
  double v7;
  _BOOL4 v8;
  uint64_t v9;
  _BOOL4 isBlocked;
  _BOOL4 isLockoutActive;
  double v12;
  float v13;
  float v14;
  NSTimer *v15;
  NSTimer *updateTimer;
  int v17;
  PasscodeViewController *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  double v24;

  HIDWORD(v4) = 0;
  blockedUntilDate = self->_blockedUntilDate;
  if (blockedUntilDate)
  {
    -[NSDate timeIntervalSinceNow](blockedUntilDate, "timeIntervalSinceNow");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }
  v8 = v7 > 0.0;
  self->_isBlocked = v8;
  if (self->_blockedUntilDate)
  {
    v9 = LALogForCategory(0, a2, v2);
    v4 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      isBlocked = self->_isBlocked;
      isLockoutActive = self->_isLockoutActive;
      v17 = 138544130;
      v18 = self;
      v19 = 1024;
      v20 = isBlocked;
      v21 = 1024;
      v22 = isLockoutActive;
      v23 = 2048;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is blocked:%d lockoutActive:%d unblockTimeout:%f", (uint8_t *)&v17, 0x22u);
    }

    v8 = self->_isBlocked;
  }
  if (v8)
  {
    self->_isLockoutActive = 1;
    v12 = v7 / 60.0;
    v13 = v12;
    LODWORD(v4) = vcvtps_s32_f32(v13);
    -[PasscodeViewController _showBackoffScreenWithMinsUntilUnblocked:](self, "_showBackoffScreenWithMinsUntilUnblocked:", v4);
    -[PasscodeViewController _clearTimer](self, "_clearTimer");
    v14 = (v12 - (double)((int)v4 - 1)) * 60.0;
    if (v14 > 0.0)
    {
      v15 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_scheduleTimerIfNecessaryAndUpdateSubtitle", 0, 1, v14));
      updateTimer = self->_updateTimer;
      self->_updateTimer = v15;

    }
  }
  else if (self->_isLockoutActive)
  {
    self->_isLockoutActive = 0;
    -[PasscodeViewController _showPasscodeScreen](self, "_showPasscodeScreen");
    -[PasscodeViewController _clearTimer](self, "_clearTimer");
  }
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  __CFString *v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  id (*v16)(uint64_t);
  void ***v17;
  void **v18;
  void **v19;
  _QWORD block[5];
  void (**v21)(_QWORD);
  uint8_t buf[4];
  PasscodeViewController *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;

  v8 = (__CFString *)a4;
  v9 = (void (**)(_QWORD))a5;
  v12 = LALogForCategory(0, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR(", value:");
    *(_DWORD *)buf = 138544130;
    v23 = self;
    v15 = &stru_10007CCD0;
    v24 = 1024;
    if (!v8)
      v14 = &stru_10007CCD0;
    v25 = a3;
    if (v8)
      v15 = v8;
    v26 = 2112;
    v27 = v14;
    v28 = 2114;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ has received mechanism event %d%@%{public}@", buf, 0x26u);
  }

  switch(a3)
  {
    case 1:
    case 4:
      goto LABEL_10;
    case 2:
      +[LAUIPearlGlyphView invokeSuccessFeedback](LAUIPearlGlyphView, "invokeSuccessFeedback");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001A76C;
      block[3] = &unk_10007A070;
      block[4] = self;
      v21 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_15;
    case 3:
      v18 = _NSConcreteStackBlock;
      v16 = sub_10001A8A0;
      v17 = &v18;
      goto LABEL_12;
    default:
      if (a3 != 13)
        goto LABEL_13;
LABEL_10:
      v19 = _NSConcreteStackBlock;
      v16 = sub_10001A884;
      v17 = &v19;
LABEL_12:
      v17[1] = (void **)3221225472;
      v17[2] = (void **)v16;
      v17[3] = (void **)&unk_100079A08;
      v17[4] = (void **)self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
LABEL_13:
      if (v9)
        v9[2](v9);
LABEL_15:

      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_blockedUntilDate, 0);
  objc_storeStrong((id *)&self->_failureLimit, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
}

@end
