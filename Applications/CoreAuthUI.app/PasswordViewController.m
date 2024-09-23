@implementation PasswordViewController

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PasswordViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 3);
  -[PasswordViewController setView:](self, "setView:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PasswordViewController;
  -[TransitionViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (!self->_alertController)
    -[PasswordViewController _configureAndShowAlertController](self, "_configureAndShowAlertController");
}

- (void)didReceiveAuthenticationData
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *subtitle;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PasswordViewController;
  -[TransitionViewController didReceiveAuthenticationData](&v7, "didReceiveAuthenticationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController internalInfo](self, "internalInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PasswordMode")));
  self->_mode = objc_msgSend(v4, "unsignedIntValue");

  self->_state = self->_mode == 0;
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationSubtitle](self, "authenticationSubtitle"));
  subtitle = self->_subtitle;
  self->_subtitle = v5;

}

- (void)_configureAndShowAlertController
{
  void *v2;
  UIAlertController *v4;
  UIAlertController *alertController;
  uint64_t v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  UIAlertController *v10;
  NSMutableArray *v11;
  uint64_t v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t state;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSBundle *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSBundle *v30;
  void *v31;
  int v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSBundle *v38;
  void *v39;
  int v40;
  int v41;
  NSBundle *v42;
  NSString *v43;
  NSString *subtitle;
  uint64_t v45;
  NSBundle *v46;
  void *v47;
  void *v48;
  id *v49;
  UIAlertAction *v50;
  NSBundle *v51;
  uint64_t v52;
  NSBundle *v53;
  NSBundle *v54;
  uint64_t v55;
  NSBundle *v56;
  UIAlertAction *currentConfirmAction;
  UIAlertController *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD block[5];
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id location[2];

  v4 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1));
  alertController = self->_alertController;
  self->_alertController = v4;

  objc_initWeak(location, self);
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PASSWORD_PLACEHOLDER"), &stru_10007CCD0, CFSTR("MobileUI")));

  v10 = self->_alertController;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10000DCD0;
  v72[3] = &unk_100079EA0;
  v72[4] = self;
  v62 = v9;
  v73 = v62;
  objc_copyWeak(&v74, location);
  -[UIAlertController addTextFieldWithConfigurationHandler:](v10, "addTextFieldWithConfigurationHandler:", v72);
  v11 = objc_opt_new(NSMutableArray);
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_CANCEL"), &stru_10007CCD0, CFSTR("MobileUI")));
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10000DD54;
  v70[3] = &unk_100079D08;
  objc_copyWeak(&v71, location);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, v70));
  -[NSMutableArray addObject:](v11, "addObject:", v16);

  state = self->_state;
  if (!state)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerBundleId](self, "callerBundleId"));
    if (v27
      && (v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"))) != 0)
    {
      v29 = NSString;
      v30 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v26));
      v61 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("APP_ASKING_CURRENT_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v60, v2));
      v32 = 0;
      v33 = 1;
    }
    else
    {
      v51 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v26));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v51);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ENTER_CURRENT_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
      v28 = 0;
      v33 = 0;
      v32 = 1;
    }
    -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v31);
    if (v32)
    {

      if (!v33)
        goto LABEL_26;
    }
    else if (!v33)
    {
LABEL_26:
      if (!v27)
      {
LABEL_28:

        v53 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v52));
        v47 = (void *)objc_claimAutoreleasedReturnValue(v53);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_DONE"), &stru_10007CCD0, CFSTR("MobileUI")));
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_10000DD80;
        v68[3] = &unk_100079D08;
        v49 = &v69;
        objc_copyWeak(&v69, location);
        v50 = (UIAlertAction *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v48, 0, v68));
        goto LABEL_38;
      }
LABEL_27:

      goto LABEL_28;
    }

    if (!v27)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (state == 1)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerBundleId](self, "callerBundleId"));
    if (v35
      && (v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"))) != 0)
    {
      v37 = NSString;
      v38 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v34));
      v61 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("APP_ASKING_NEW_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v60, v2));
      v40 = 0;
      v41 = 1;
    }
    else
    {
      v54 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v34));
      v37 = (void *)objc_claimAutoreleasedReturnValue(v54);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("ENTER_NEW_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
      v36 = 0;
      v41 = 0;
      v40 = 1;
    }
    -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v39);
    if (v40)
    {

      if (!v41)
        goto LABEL_35;
    }
    else if (!v41)
    {
LABEL_35:
      if (!v35)
      {
LABEL_37:

        v56 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v55));
        v47 = (void *)objc_claimAutoreleasedReturnValue(v56);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_NEXT"), &stru_10007CCD0, CFSTR("MobileUI")));
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_10000DDAC;
        v66[3] = &unk_100079D08;
        v49 = &v67;
        objc_copyWeak(&v67, location);
        v50 = (UIAlertAction *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v48, 0, v66));
        goto LABEL_38;
      }
LABEL_36:

      goto LABEL_37;
    }

    if (!v35)
      goto LABEL_37;
    goto LABEL_36;
  }
  if (state != 2)
    goto LABEL_39;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerBundleId](self, "callerBundleId"));
  if (v19
    && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"))) != 0)
  {
    v21 = NSString;
    v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v18));
    v61 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("APP_ASKING_CONFIRM_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v60, v2));
    v24 = 0;
    v25 = 1;
  }
  else
  {
    v42 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CONFIRM_NEW_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
    v20 = 0;
    v25 = 0;
    v24 = 1;
  }
  -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v23);
  if (v24)
  {

    if (!v25)
      goto LABEL_17;
LABEL_21:

    if (!v19)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (v25)
    goto LABEL_21;
LABEL_17:
  if (v19)
LABEL_18:

LABEL_19:
  v43 = (NSString *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationSubtitle](self, "authenticationSubtitle"));
  subtitle = self->_subtitle;
  self->_subtitle = v43;

  v46 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v45));
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ALERT_DONE"), &stru_10007CCD0, CFSTR("MobileUI")));
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10000DDD8;
  v64[3] = &unk_100079D08;
  v49 = &v65;
  objc_copyWeak(&v65, location);
  v50 = (UIAlertAction *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v48, 0, v64));
LABEL_38:
  currentConfirmAction = self->_currentConfirmAction;
  self->_currentConfirmAction = v50;

  objc_destroyWeak(v49);
LABEL_39:
  -[UIAlertAction setEnabled:](self->_currentConfirmAction, "setEnabled:", 0);
  -[NSMutableArray addObject:](v11, "addObject:", self->_currentConfirmAction);
  v58 = self->_alertController;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
  -[UIAlertController setTitle:](v58, "setTitle:", v59);

  -[UIAlertController setMessage:](self->_alertController, "setMessage:", self->_subtitle);
  -[UIAlertController _setActions:](self->_alertController, "_setActions:", v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DE04;
  block[3] = &unk_100079A08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v71);

  objc_destroyWeak(&v74);
  objc_destroyWeak(location);
}

- (void)_passwordEntered
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_passwordField, "text"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[LACSecureData secureDataWithString:](LACSecureData, "secureDataWithString:", v3));

  -[PasswordViewController _setCredential:](self, "_setCredential:", v4);
  objc_msgSend(v4, "reset");

}

- (void)_passwordNext
{
  void *v3;
  id v4;
  void *v5;
  LACSecureData *v6;
  LACSecureData *newPassword;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_passwordField, "text"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_passwordField, "text"));
    v6 = (LACSecureData *)objc_claimAutoreleasedReturnValue(+[LACSecureData secureDataWithString:](LACSecureData, "secureDataWithString:", v5));
    newPassword = self->_newPassword;
    self->_newPassword = v6;

    self->_state = 2;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DF80;
  block[3] = &unk_100079A08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_passwordConfirm
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSBundle *v6;
  void *v7;
  NSString *v8;
  NSString *subtitle;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_passwordField, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LACSecureData secureDataWithString:](LACSecureData, "secureDataWithString:", v3));

  if (-[LACSecureData isEqual:](self->_newPassword, "isEqual:", v4))
  {
    -[PasswordViewController _setCredential:](self, "_setCredential:", v4);
  }
  else
  {
    self->_state = 1;
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONFIRM_NEW_PASSWORD_MISMATCH"), &stru_10007CCD0, CFSTR("MobileUI")));
    subtitle = self->_subtitle;
    self->_subtitle = v8;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E0D4;
    block[3] = &unk_100079A08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_msgSend(v4, "reset");
  -[LACSecureData reset](self->_newPassword, "reset");

}

- (void)_setCredential:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _UNKNOWN **v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  v4 = a3;
  v5 = objc_alloc((Class)LAACMHelper);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController cachedExternalizedContext](self, "cachedExternalizedContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "externalizedContext"));
  v8 = objc_msgSend(v5, "initWithExternalizedContext:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", &off_10007E288));
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v12 == 0.0)
    v13 = 1;
  else
    v13 = 2;
  v18 = 0;
  v14 = objc_msgSend(v8, "replacePassphraseCredentialWithPurpose:passphrase:scope:error:", 0, v4, v13, &v18);

  v15 = v18;
  if (v14)
  {
    v21 = CFSTR("Result");
    v19 = &off_10007E2A0;
    v20 = &__kCFBooleanTrue;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v22 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    -[TransitionViewController uiSuccessWithResult:](self, "uiSuccessWithResult:", v17);

  }
  else
  {
    -[TransitionViewController uiFailureWithError:](self, "uiFailureWithError:", v15);
  }

}

- (void)_cancel
{
  -[LACSecureData reset](self->_newPassword, "reset");
  -[TransitionViewController uiCancel](self, "uiCancel");
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  char *v12;
  char *v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v12 = (char *)objc_msgSend(v11, "length");

  if (location + length <= (unint64_t)v12)
  {
    v13 = &v12[(_QWORD)objc_msgSend(v10, "length")];
    if ((unint64_t)&v13[-length] <= 0x80)
    {
      v14 = objc_msgSend(v10, "length");
      if (v14 && (char *)location == v12 && !length)
      {
        objc_msgSend(v9, "insertText:", v10);
      }
      else if (!v14 && (char *)location == v12 - 1 && length == 1)
      {
        objc_msgSend(v9, "deleteBackward");
      }
      -[UIAlertAction setEnabled:](self->_currentConfirmAction, "setEnabled:", v13 != (char *)length);
    }
  }

  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfirmAction, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_newPassword, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
