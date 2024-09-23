@implementation TouchIdViewController

- (void)loadView
{
  ScreenDimmingView *v3;
  ScreenDimmingView *dimmingView;
  TouchIdViewModel *v5;
  TouchIdViewModel *viewModel;

  v3 = objc_opt_new(ScreenDimmingView);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v3;

  -[TouchIdViewController setView:](self, "setView:", v3);
  self->_state = 0;
  v5 = objc_alloc_init(TouchIdViewModel);
  viewModel = self->_viewModel;
  self->_viewModel = v5;

  -[TouchIdViewController _setupUI](self, "_setupUI");
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TouchIdViewController;
  -[TransitionViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (!self->_state)
  {
    self->_state = 1;
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000E5D0;
    v4[3] = &unk_100079B80;
    objc_copyWeak(&v5, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  TouchIdViewModel *viewModel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TouchIdViewController;
  -[TouchIdViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  viewModel = self->_viewModel;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdViewModel alertTintFromOptions:](viewModel, "alertTintFromOptions:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  objc_msgSend(v9, "setTintColor:", v7);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TouchIdViewController;
  -[TouchIdViewController dismissViewControllerAnimated:completion:](&v5, "dismissViewControllerAnimated:completion:", a3, a4);
  self->_state = 5;
}

- (void)_setupUI
{
  -[TouchIdViewController _setupAlertController](self, "_setupAlertController");
  -[TouchIdViewController _configureUI](self, "_configureUI");
}

- (void)_presentUI:(id)a3
{
  -[TouchIdViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alertController, 1, a3);
}

- (void)_dismissUIWithCompletionHandler:(id)a3
{
  -[TouchIdAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", 0, a3);
}

- (void)_addFrontMostSubview:(id)a3
{
  TouchIdAlertController *alertController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  alertController = self->_alertController;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdAlertController view](alertController, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(-[TouchIdViewController view](self, "view"));
  v10 = v9;

  objc_msgSend(v10, "addSubview:", v5);
  objc_msgSend(v10, "bringSubviewToFront:", v5);

}

- (void)_setupAlertController
{
  TouchIdAlertController *v3;
  TouchIdAlertController *alertController;
  TouchIdAlertController *v5;
  void *v6;
  TouchIdAlertController *v7;
  void *v8;
  TouchIdViewModel *viewModel;
  id v10;
  void *v11;
  id v12;

  v3 = objc_alloc_init(TouchIdAlertController);
  alertController = self->_alertController;
  self->_alertController = v3;

  v5 = self->_alertController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
  -[TouchIdAlertController setTitle:](v5, "setTitle:", v6);

  v7 = self->_alertController;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationSubtitle](self, "authenticationSubtitle"));
  -[TouchIdAlertController setMessage:](v7, "setMessage:", v8);

  viewModel = self->_viewModel;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v10 = objc_msgSend(v12, "copy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdViewModel alertActionsFromOptions:event:](viewModel, "alertActionsFromOptions:event:", v10, 0));
  -[TouchIdViewController _setupAlertControllerActions:](self, "_setupAlertControllerActions:", v11);

}

- (void)_uiCancelWithUnderlyingError
{
  -[TransitionViewController uiCancelWithError:](self, "uiCancelWithError:", self->_underlyingError);
}

- (void)_setupAlertControllerActions:(id)a3
{
  id v5;
  NSMutableArray *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location[2];

  v5 = a3;
  v6 = objc_opt_new(NSMutableArray);
  objc_initWeak(location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E2B8));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E2B8));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000EC90;
    v29[3] = &unk_100079D08;
    objc_copyWeak(&v30, location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, v29));
    -[NSMutableArray addObject:](v6, "addObject:", v9);

    objc_destroyWeak(&v30);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E2D0));
  v11 = v10;
  if (v10 && objc_msgSend(v10, "count") == (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000ECE0;
    v27[3] = &unk_100079D08;
    objc_copyWeak(&v28, location);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v27));
    -[NSMutableArray addObject:](v6, "addObject:", v13);

    objc_destroyWeak(&v28);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E2E8));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E2E8));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000ED3C;
    v25[3] = &unk_100079D08;
    objc_copyWeak(&v26, location);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v25));
    -[NSMutableArray addObject:](v6, "addObject:", v16);

    objc_destroyWeak(&v26);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E300));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_10007E300));
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_10000ED6C;
    v23 = &unk_100079D08;
    objc_copyWeak(&v24, location);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, &v20));
    -[NSMutableArray addObject:](v6, "addObject:", v19, v20, v21, v22, v23);

    objc_destroyWeak(&v24);
  }
  objc_storeStrong((id *)&self->_actions, a3);
  -[TouchIdAlertController setActions:](self->_alertController, "setActions:", v6);

  objc_destroyWeak(location);
}

- (BOOL)_isSensorActive
{
  return (unint64_t)(self->_state - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)_configureUI
{
  int64_t state;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  state = self->_state;
  switch(state)
  {
    case 4:
      -[TouchIdViewController _handleBiometryRequiredEnterPasscode](self, "_handleBiometryRequiredEnterPasscode");
      break;
    case 3:
      -[TouchIdViewController _handleBiometryRequiredFailure](self, "_handleBiometryRequiredFailure");
      break;
    case 2:
      -[TouchIdViewController _handleBiometryNoMatch](self, "_handleBiometryNoMatch");
      break;
  }
  if (-[TouchIdViewController _isSensorActive](self, "_isSensorActive"))
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor systemPinkColor](UIColor, "systemPinkColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v7 = (id)v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdAlertController _headerContentViewController](self->_alertController, "_headerContentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "setTintColor:", v7);

}

- (void)_handleBiometryNoMatch
{
  TouchIdViewModel *viewModel;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  id v17;

  viewModel = self->_viewModel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v5 = objc_msgSend(v4, "copy");
  v17 = (id)objc_claimAutoreleasedReturnValue(-[TouchIdViewModel alertActionsFromOptions:event:](viewModel, "alertActionsFromOptions:event:", v5, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", &off_10007E318));
  if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {

  }
  else
  {
    v9 = +[LAUtils isLocationBasedPolicy:](LAUtils, "isLocationBasedPolicy:", -[TransitionViewController policy](self, "policy"));

    if ((v9 & 1) != 0)
    {
      v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = v11;
      v13 = CFSTR("TOUCH_ID_REQUIRED");
      goto LABEL_6;
    }
  }
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v12 = v11;
  v13 = CFSTR("TRY_AGAIN");
LABEL_6:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_10007CCD0, CFSTR("MobileUI")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
  if (v16 != v15)
  {
    -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v15);
    -[TouchIdAlertController setTitle:](self->_alertController, "setTitle:", v15);
  }
  if (!-[NSDictionary isEqualToDictionary:](self->_actions, "isEqualToDictionary:", v17))
    -[TouchIdViewController _setupAlertControllerActions:](self, "_setupAlertControllerActions:", v17);
  -[TouchIdAlertController shake](self->_alertController, "shake");
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v15);

}

- (void)_handleBiometryRequiredFailure
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  TouchIdAlertController *alertController;
  uint64_t v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  TouchIdAlertController *v18;
  uint64_t v19;
  NSBundle *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSBundle *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];

  v30[0] = &off_10007E2D0;
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_10007CCD0, CFSTR("MobileUI")));
  v29[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LACUIDTOUtilities dtoLearnMoreLinkURL](LACUIDTOUtilities, "dtoLearnMoreLinkURL"));
  v29[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
  v30[1] = &off_10007E300;
  v31[0] = v7;
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10007CCD0, CFSTR("MobileUI")));
  v31[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));

  if (!-[NSDictionary isEqualToDictionary:](self->_actions, "isEqualToDictionary:", v12))
  {
    -[TouchIdViewController _setupAlertControllerActions:](self, "_setupAlertControllerActions:", v12);
    alertController = self->_alertController;
    v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_REQUIRED"), &stru_10007CCD0, CFSTR("MobileUI")));
    -[TouchIdAlertController setTitle:](alertController, "setTitle:", v17);

    v18 = self->_alertController;
    v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DTO_IS_ACTIVE"), &stru_10007CCD0, CFSTR("MobileUI-Ratchet")));
    -[TouchIdAlertController setMessage:](v18, "setMessage:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdAlertController actions](self->_alertController, "actions"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 0));
  -[TouchIdAlertController setPreferredAction:](self->_alertController, "setPreferredAction:", v24);

  -[TouchIdAlertController shake](self->_alertController, "shake");
  LODWORD(v23) = UIAccessibilityAnnouncementNotification;
  v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v25));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_REQUIRED"), &stru_10007CCD0, CFSTR("MobileUI-Ratchet")));
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v23, v28);

}

- (void)_handleBiometryRequiredEnterPasscode
{
  TouchIdViewModel *viewModel;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSBundle *v10;
  void *v11;
  uint64_t v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  void *v16;
  TouchIdAlertController *alertController;
  uint64_t v18;
  NSBundle *v19;
  void *v20;
  void *v21;
  TouchIdAlertController *v22;
  uint64_t v23;
  NSBundle *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSBundle *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];

  viewModel = self->_viewModel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdViewModel fallbackActionFromOptions:](viewModel, "fallbackActionFromOptions:", v5));
  v8 = v6;
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));

  }
  v33[0] = &off_10007E2B8;
  v33[1] = &off_10007E2E8;
  v34[0] = v9;
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10007CCD0, CFSTR("MobileUI")));
  v34[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));

  if (!-[NSDictionary isEqualToDictionary:](self->_actions, "isEqualToDictionary:", v16))
  {
    -[TouchIdViewController _setupAlertControllerActions:](self, "_setupAlertControllerActions:", v16);
    alertController = self->_alertController;
    v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PASSCODE_TO_RETRY_TOUCH_ID"), &stru_10007CCD0, CFSTR("MobileUI")));
    -[TouchIdAlertController setTitle:](alertController, "setTitle:", v21);

    v22 = self->_alertController;
    v24 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DTO_IS_ACTIVE"), &stru_10007CCD0, CFSTR("MobileUI-Ratchet")));
    -[TouchIdAlertController setMessage:](v22, "setMessage:", v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdAlertController actions](self->_alertController, "actions"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 0));
  -[TouchIdAlertController setPreferredAction:](self->_alertController, "setPreferredAction:", v28);

  -[TouchIdAlertController shake](self->_alertController, "shake");
  LODWORD(v27) = UIAccessibilityAnnouncementNotification;
  v30 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v29));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("PASSCODE_TO_RETRY_TOUCH_ID"), &stru_10007CCD0, CFSTR("MobileUI-Ratchet")));
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v27, v32);

}

- (void)didReceiveAuthenticationData
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSBundle *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TouchIdViewController;
  -[TransitionViewController didReceiveAuthenticationData](&v14, "didReceiveAuthenticationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController authenticationTitle](self, "authenticationTitle"));
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerBundleId](self, "callerBundleId"));
    if ((v5 || -[TransitionViewController callerNameOverride](self, "callerNameOverride"))
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName")),
          v7,
          v5,
          v7))
    {
      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("APP_ASKING_TOUCH"), &stru_10007CCD0, CFSTR("MobileUI")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController callerName](self, "callerName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11));
      -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v12);

    }
    else
    {
      v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID"), &stru_10007CCD0, CFSTR("MobileUI")));
      -[TransitionViewController setAuthenticationTitle:](self, "setAuthenticationTitle:", v10);
    }

  }
}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (self->_state == 5)
  {
    v8.receiver = self;
    v8.super_class = (Class)TouchIdViewController;
    -[TransitionViewController dismissChildWithCompletionHandler:](&v8, "dismissChildWithCompletionHandler:", v4);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000F8E8;
    v6[3] = &unk_100079DC8;
    v6[4] = self;
    v7 = v4;
    -[TouchIdViewController _dismissUIWithCompletionHandler:](self, "_dismissUIWithCompletionHandler:", v6);

  }
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  __CFString *v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  int64_t state;
  __CFString *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  NSError *underlyingError;
  NSError *v22;
  NSError *v23;
  int64_t v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;
  void *v28;
  int64_t v29;
  NSError *v30;
  NSError *v31;
  unsigned int v32;
  _QWORD block[5];
  uint8_t buf[4];
  TouchIdViewController *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;

  v8 = (__CFString *)a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = LACLogTouchIDUI();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR(", value:");
    *(_DWORD *)buf = 138544130;
    v13 = &stru_10007CCD0;
    v35 = self;
    v36 = 1024;
    if (v8)
      v13 = v8;
    else
      v12 = &stru_10007CCD0;
    v37 = a3;
    v38 = 2112;
    v39 = v12;
    v40 = 2114;
    v41 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ has received mechanism event %d%@%{public}@", buf, 0x26u);
  }

  state = self->_state;
  if (state != 5 && state != 0)
  {
    v16 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", &off_10007E330));
    v18 = objc_msgSend(v17, "BOOLValue");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", &off_10007E348));
    v20 = objc_msgSend(v19, "BOOLValue");

    underlyingError = self->_underlyingError;
    self->_underlyingError = 0;

    if (a3 != 7)
    {
      if (a3 != 1)
      {
        v24 = 1;
        goto LABEL_25;
      }
      if (((+[LAUtils isLocationBasedPolicy:](LAUtils, "isLocationBasedPolicy:", -[TransitionViewController policy](self, "policy")) & v18 ^ 1 | v20) & 1) == 0)
      {
        v22 = (NSError *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", &off_10007E360));
        v23 = self->_underlyingError;
        self->_underlyingError = v22;

        v24 = 3;
LABEL_25:
        self->_state = v24;
LABEL_28:
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000FC4C;
        block[3] = &unk_100079A08;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        if (v9)
          v9[2](v9);

        goto LABEL_31;
      }
LABEL_24:
      v24 = 2;
      goto LABEL_25;
    }
    v25 = +[LAUtils isLocationBasedPolicy:](LAUtils, "isLocationBasedPolicy:", -[TransitionViewController policy](self, "policy"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](self, "options"));
    v27 = v20;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", &off_10007E318));
    v32 = objc_msgSend(v28, "BOOLValue");

    if (((v25 ^ 1 | v27) & 1) != 0)
    {
      if ((v25 & v27 & 1) == 0)
        goto LABEL_24;
      v29 = 4;
      if (v32)
        v29 = 2;
      self->_state = v29;
      if ((v32 & 1) != 0)
        goto LABEL_28;
    }
    else
    {
      self->_state = 3;
    }
    v30 = (NSError *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", &off_10007E360));
    v31 = self->_underlyingError;
    self->_underlyingError = v30;

    goto LABEL_28;
  }
  if (v9)
    v9[2](v9);
LABEL_31:

}

- (ScreenDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
