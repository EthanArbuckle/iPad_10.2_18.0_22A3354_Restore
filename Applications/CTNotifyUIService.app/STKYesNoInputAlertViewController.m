@implementation STKYesNoInputAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(STKYesNoSessionAction);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (id)newBottomBar
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double y;
  double width;
  double height;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;

  v3 = objc_msgSend(objc_alloc((Class)TPBottomDoubleButtonBar), "initWithDefaultSizeForOrientation:", -[STKYesNoInputAlertViewController interfaceOrientation](self, "interfaceOrientation"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STKYesNoInputAlertViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  objc_msgSend(v3, "bounds");
  v12 = v10 - v11;

  objc_msgSend(v3, "setFrame:", 0.0, v12, v5, v7);
  v13 = objc_alloc((Class)TPButton);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NO"), &stru_100014540, CFSTR("SIMToolkitUI")));
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v19 = objc_msgSend(v13, "initWithTitle:icon:color:frame:", v15, 0, 4, CGRectZero.origin.x, y, width, height);

  objc_msgSend(v19, "setBlursBackground:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.105882353, 0.533333333, 0.91372549, 1.0));
  objc_msgSend(v19, "setTitleColor:forState:", v20, 0);

  objc_msgSend(v19, "setAutoresizingMask:", 0);
  objc_msgSend(v19, "setContentMode:", 3);
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, "noPressed:", 64);
  objc_msgSend(v3, "setButton:andStyle:", v19, 1);
  objc_msgSend(v19, "setTitleVerticalOffset:", -1.0);
  v21 = objc_alloc((Class)TPButton);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("YES"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v24 = objc_msgSend(v21, "initWithTitle:icon:color:frame:", v23, 0, 4, CGRectZero.origin.x, y, width, height);

  objc_msgSend(v24, "setBlursBackground:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.105882353, 0.533333333, 0.91372549, 1.0));
  objc_msgSend(v24, "setTitleColor:forState:", v25, 0);

  objc_msgSend(v24, "setAutoresizingMask:", 0);
  objc_msgSend(v24, "setContentMode:", 3);
  objc_msgSend(v24, "addTarget:action:forControlEvents:", self, "yesPressed:", 64);
  objc_msgSend(v3, "setButton2:andStyle:", v24, 1);
  objc_msgSend(v24, "setTitleVerticalOffset:", -1.0);

  return v3;
}

- (void)yesPressed:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction", a3));
  objc_msgSend(v4, "sendSuccessWithSelectedResponse:", 1);

  -[STKTextAlertViewController dismiss](self, "dismiss");
}

- (void)noPressed:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction", a3));
  objc_msgSend(v4, "sendSuccessWithSelectedResponse:", 0);

  -[STKTextAlertViewController dismiss](self, "dismiss");
}

@end
