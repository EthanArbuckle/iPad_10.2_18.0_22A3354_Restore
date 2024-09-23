@implementation PinViewController

- (void)loadView
{
  PinView *v3;
  NSNumber *pinLength;
  void *v5;
  void *v6;
  void *v7;
  PinView *v8;
  PinView *pinView;
  PinView *v10;
  void *v11;
  _UIBackdropView *v12;
  _UIBackdropView *blurView;
  void *v14;
  uint64_t v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = [PinView alloc];
  pinLength = self->_pinLength;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PinViewController pinMinLength](self, "pinMinLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PinViewController pinMaxLength](self, "pinMaxLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PinViewController pinCharset](self, "pinCharset"));
  v8 = -[PinView initWithPinLength:minLength:maxLength:charset:](v3, "initWithPinLength:minLength:maxLength:charset:", pinLength, v5, v6, v7);
  pinView = self->_pinView;
  self->_pinView = v8;

  v10 = self->_pinView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
  -[PinView setTitle:](v10, "setTitle:", v11);

  -[PinView setDelegate:](self->_pinView, "setDelegate:", self);
  -[PinView setViewController:](self->_pinView, "setViewController:", self);
  if (!-[TransitionViewController isRemoteViewController](self, "isRemoteViewController"))
  {
    v12 = (_UIBackdropView *)objc_claimAutoreleasedReturnValue(-[PinViewController _createBlurView](self, "_createBlurView"));
    blurView = self->_blurView;
    self->_blurView = v12;

    -[PinView addSubview:](self->_pinView, "addSubview:", self->_blurView);
    -[PinView sendSubviewToBack:](self->_pinView, "sendSubviewToBack:", self->_blurView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "uiCancel", 1);
    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10007CCD0, CFSTR("MobileUI")));
    objc_msgSend(v14, "setTitle:forState:", v18, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    objc_msgSend(v14, "setTitleColor:forState:", v19, 0);

    objc_msgSend(v14, "sizeToFit");
    -[PinView setCancelButton:](self->_pinView, "setCancelButton:", v14);

  }
  -[PinViewController setView:](self, "setView:", self->_pinView);
}

- (id)_createBlurView
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForPrivateStyle:graphicsQuality:", -[PinViewController _backdropStyle](self, "_backdropStyle"), 100));
  objc_msgSend(v2, "setBackdropVisible:", 1);
  v3 = objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithSettings:", v2);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "setConfiguration:", 1);
  objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(v3, "setComputesColorSettings:", 0);

  return v3;
}

- (int64_t)_backdropStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PinViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == (id)1000 || v3 == (id)2)
    return 2032;
  else
    return 2010;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PinViewController;
  -[TransitionViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PinView becomeFirstResponder](self->_pinView, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PinViewController;
  -[PinViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[PinView resignFirstResponder](self->_pinView, "resignFirstResponder");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PinViewController;
  -[PinViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[PinViewController _updateCurrentAppearanceIfNeeded](self, "_updateCurrentAppearanceIfNeeded");
}

- (void)_updateCurrentAppearanceIfNeeded
{
  void *v3;
  id v4;
  _UIBackdropView *v5;
  _UIBackdropView *blurView;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PinViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if ((id)self->_currentInterfaceStyle != v4)
  {
    self->_currentInterfaceStyle = (int64_t)v4;
    if (!-[TransitionViewController isRemoteViewController](self, "isRemoteViewController"))
    {
      -[_UIBackdropView removeFromSuperview](self->_blurView, "removeFromSuperview");
      v5 = (_UIBackdropView *)objc_claimAutoreleasedReturnValue(-[PinViewController _createBlurView](self, "_createBlurView"));
      blurView = self->_blurView;
      self->_blurView = v5;

      -[PinView addSubview:](self->_pinView, "addSubview:", self->_blurView);
      -[PinView sendSubviewToBack:](self->_pinView, "sendSubviewToBack:", self->_blurView);
    }
  }
}

- (void)didReceiveAuthenticationData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSNumber *v17;
  NSNumber *pinLength;
  void *v19;
  NSNumber *v20;
  NSNumber *pinMinLength;
  void *v22;
  NSNumber *v23;
  NSNumber *pinMaxLength;
  void *v25;
  NSNumber *v26;
  NSNumber *pinCharset;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PinViewController;
  -[TransitionViewController didReceiveAuthenticationData](&v30, "didReceiveAuthenticationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", &off_10007E498));

    if (v6)
    {
      -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v6);
    }
    else
    {
      v7 = +[LAUtils isApplePayPolicy:](LAUtils, "isApplePayPolicy:", -[TransitionViewController policy](self, "policy"));
      v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = v10;
      if ((v7 & 1) != 0)
        v12 = CFSTR("PAY_PIN");
      else
        v12 = CFSTR("ENTER_PIN");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_10007CCD0, CFSTR("MobileUI")));
      -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v13);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController internalInfo](self, "internalInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PassphrasePurpose")));
  self->_purpose = objc_msgSend(v15, "unsignedIntValue");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", &off_10007E4B0));
  pinLength = self->_pinLength;
  self->_pinLength = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v20 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", &off_10007E4C8));
  pinMinLength = self->_pinMinLength;
  self->_pinMinLength = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v23 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", &off_10007E4E0));
  pinMaxLength = self->_pinMaxLength;
  self->_pinMaxLength = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v26 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", &off_10007E4F8));
  pinCharset = self->_pinCharset;
  self->_pinCharset = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController internalInfo](self, "internalInfo"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("CTKPIN")));
  self->_ctkPin = objc_msgSend(v29, "BOOLValue");

}

- (void)pinEntered:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t purpose;
  unsigned int v19;
  void *v20;
  id v21;
  _UNKNOWN **v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  _UNKNOWN **v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  PinViewController *v33;

  v4 = a3;
  if (qword_1000921D8 != -1)
    dispatch_once(&qword_1000921D8, &stru_10007A240);
  v5 = qword_1000921E0;
  if (os_log_type_enabled((os_log_t)qword_1000921E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[PinViewController pinEntered:]";
    v32 = 2112;
    v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }
  if (-[PinViewController ctkPin](self, "ctkPin"))
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data")));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(v6, "bytes")));

    v28[0] = CFSTR("Result");
    v26 = &off_10007E510;
    v27 = &__kCFBooleanTrue;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v28[1] = CFSTR("PIN");
    v29[0] = v8;
    v29[1] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
    -[TransitionViewController uiSuccessWithResult:](self, "uiSuccessWithResult:", v9);
  }
  else
  {
    v10 = objc_alloc((Class)LAACMHelper);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController cachedExternalizedContext](self, "cachedExternalizedContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "externalizedContext"));
    v8 = objc_msgSend(v10, "initWithExternalizedContext:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", &off_10007E528));
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    if (v16 == 0.0)
      v17 = 1;
    else
      v17 = 2;
    purpose = self->_purpose;
    v21 = 0;
    v19 = objc_msgSend(v8, "replacePassphraseCredentialWithPurpose:passphrase:scope:error:", purpose, v4, v17, &v21);
    v7 = v21;
    if (!v19)
    {
      -[TransitionViewController uiFailureWithError:](self, "uiFailureWithError:", v7);
      goto LABEL_14;
    }
    v24 = CFSTR("Result");
    v22 = &off_10007E510;
    v23 = &__kCFBooleanTrue;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v25 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    -[TransitionViewController uiSuccessWithResult:](self, "uiSuccessWithResult:", v20);

  }
LABEL_14:

  objc_msgSend(v4, "reset");
}

- (NSNumber)pinMaxLength
{
  return self->_pinMaxLength;
}

- (NSNumber)pinMinLength
{
  return self->_pinMinLength;
}

- (NSNumber)pinCharset
{
  return self->_pinCharset;
}

- (BOOL)ctkPin
{
  return self->_ctkPin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCharset, 0);
  objc_storeStrong((id *)&self->_pinMinLength, 0);
  objc_storeStrong((id *)&self->_pinMaxLength, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_pinView, 0);
  objc_storeStrong((id *)&self->_pinLength, 0);
}

@end
