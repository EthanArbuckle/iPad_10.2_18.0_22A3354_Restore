@implementation STKTextAlertViewController

+ (BOOL)wantsTextView
{
  return 1;
}

- (BOOL)validateAction:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(STKTextSessionAction);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (BOOL)_sendsResponseUponDisplay
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "behavior"));
  v4 = objc_msgSend(v3, "shouldSendResponseUponDisplay");

  return v4;
}

- (id)newTopBar
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (-[STKTextAlertViewController _sendsResponseUponDisplay](self, "_sendsResponseUponDisplay"))
    return 0;
  v3 = objc_alloc_init((Class)UINavigationBar);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "_setHidesShadow:", 1);
  objc_msgSend(v3, "setBarStyle:", 1);
  v4 = objc_alloc_init((Class)UIImage);
  objc_msgSend(v3, "setBackgroundImage:forBarMetrics:", v4, 0);

  v5 = objc_alloc((Class)UINavigationItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v8 = objc_msgSend(v5, "initWithTitle:", v7);

  objc_msgSend(v3, "pushNavigationItem:animated:", v8, 0);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationItem), "initWithTitle:", &stru_100014540);
  objc_msgSend(v3, "pushNavigationItem:animated:", v9, 0);

  return v3;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  -[STKTextAlertViewController leftNavigationButtonPressed](self, "leftNavigationButtonPressed", a3, a4);
  return 0;
}

- (id)newBottomBar
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double y;
  double width;
  double height;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = -[STKTextAlertViewController interfaceOrientation](self, "interfaceOrientation");
  if (-[STKTextAlertViewController _sendsResponseUponDisplay](self, "_sendsResponseUponDisplay"))
  {
    v4 = objc_msgSend(objc_alloc((Class)TPBottomSingleButtonBar), "initWithDefaultSizeForOrientation:", v3);
    v5 = objc_alloc((Class)TPButton);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DISMISS_SIM_TOOLKIT"), &stru_100014540, CFSTR("SIMToolkitUI")));
    v8 = objc_msgSend(v5, "initWithTitle:icon:color:frame:", v7, 0, 4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

    objc_msgSend(v8, "setBlursBackground:", 0);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "dismiss:", 64);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.105882353, 0.533333333, 0.91372549, 1.0));
    objc_msgSend(v8, "setTitleColor:forState:", v9, 0);

    objc_msgSend(v4, "setButton:andStyle:", v8, 1);
  }
  else
  {
    v4 = objc_msgSend(objc_alloc((Class)TPBottomDoubleButtonBar), "initWithDefaultSizeForOrientation:", v3);
    v10 = objc_alloc((Class)TPButton);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100014540, CFSTR("SIMToolkitUI")));
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v16 = objc_msgSend(v10, "initWithTitle:icon:color:frame:", v12, 0, 4, CGRectZero.origin.x, y, width, height);

    objc_msgSend(v16, "setBlursBackground:", 0);
    objc_msgSend(v16, "setAutoresizingMask:", 0);
    objc_msgSend(v16, "setContentMode:", 3);
    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, "dismiss:", 64);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.105882353, 0.533333333, 0.91372549, 1.0));
    objc_msgSend(v16, "setTitleColor:forState:", v17, 0);

    objc_msgSend(v4, "setButton:andStyle:", v16, 1);
    objc_msgSend(v16, "setTitleVerticalOffset:", -1.0);
    v18 = objc_alloc((Class)TPButton);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_100014540, CFSTR("SIMToolkitUI")));
    v8 = objc_msgSend(v18, "initWithTitle:icon:color:frame:", v20, 0, 4, CGRectZero.origin.x, y, width, height);

    objc_msgSend(v8, "setBlursBackground:", 0);
    objc_msgSend(v8, "setAutoresizingMask:", 0);
    objc_msgSend(v8, "setContentMode:", 3);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "accept:", 64);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.105882353, 0.533333333, 0.91372549, 1.0));
    objc_msgSend(v8, "setTitleColor:forState:", v21, 0);

    objc_msgSend(v4, "setButton2:andStyle:", v8, 1);
  }
  objc_msgSend(v8, "setTitleVerticalOffset:", -1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v22);

  return v4;
}

- (void)leftNavigationButtonPressed
{
  void *v3;

  if (!-[STKTextAlertViewController _sendsResponseUponDisplay](self, "_sendsResponseUponDisplay"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    objc_msgSend(v3, "sendResponse:", 4);

  }
  -[STKTextAlertViewController dismiss](self, "dismiss");
}

- (id)alertText
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sessionData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STKTextAlertViewController alertText](self, "alertText"));
  -[STKBaseAlertViewController setTextViewText:](self, "setTextViewText:", v5);

  -[STKBaseAlertViewController startTimeoutTimerIfNecessary](self, "startTimeoutTimerIfNecessary");
  v6.receiver = self;
  v6.super_class = (Class)STKTextAlertViewController;
  -[STKTextAlertViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
}

- (void)accept:(id)a3
{
  void *v4;

  if (!-[STKTextAlertViewController _sendsResponseUponDisplay](self, "_sendsResponseUponDisplay", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    objc_msgSend(v4, "sendResponse:", 0);

  }
  -[STKTextAlertViewController dismiss](self, "dismiss");
}

- (void)dismiss:(id)a3
{
  void *v4;

  if (!-[STKTextAlertViewController _sendsResponseUponDisplay](self, "_sendsResponseUponDisplay", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    objc_msgSend(v4, "sendResponse:", 1);

  }
  -[STKTextAlertViewController dismiss](self, "dismiss");
}

- (void)dismiss
{
  objc_super v3;

  -[STKBaseAlertViewController clearTimeoutTimer](self, "clearTimeoutTimer");
  v3.receiver = self;
  v3.super_class = (Class)STKTextAlertViewController;
  -[STKBaseAlertViewController dismiss](&v3, "dismiss");
}

@end
