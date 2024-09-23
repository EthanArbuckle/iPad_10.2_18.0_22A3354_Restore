@implementation STKSetupCallAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(STKCallSetupSessionAction);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (id)newTopBarForInstance
{
  return 0;
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
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;

  v3 = objc_msgSend(objc_alloc((Class)TPBottomDoubleButtonBar), "initWithDefaultSizeForOrientation:", -[STKSetupCallAlertViewController interfaceOrientation](self, "interfaceOrientation"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STKSetupCallAlertViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  objc_msgSend(v3, "bounds");
  v12 = v10 - v11;

  objc_msgSend(v3, "setFrame:", 0.0, v12, v5, v7);
  v13 = objc_alloc((Class)TPButton);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DISMISS_SIM_TOOLKIT"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v16 = objc_msgSend(v13, "initWithTitle:icon:color:frame:", v15, 0, 4, 23.0, 24.0, 136.0, 47.0);

  objc_msgSend(v16, "setBlursBackground:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.105882353, 0.533333333, 0.91372549, 1.0));
  objc_msgSend(v16, "setTitleColor:forState:", v17, 0);

  objc_msgSend(v16, "setAutoresizingMask:", 0);
  objc_msgSend(v16, "setContentMode:", 3);
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, "dismiss:", 64);
  objc_msgSend(v3, "setButton:andStyle:", v16, 1);
  objc_msgSend(v16, "setTitleVerticalOffset:", -1.0);
  v18 = objc_alloc((Class)TPButton);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DIAL"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v21 = objc_msgSend(v18, "initWithTitle:icon:color:frame:", v20, 0, 4, 161.0, 24.0, 136.0, 47.0);

  objc_msgSend(v21, "setBlursBackground:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.105882353, 0.533333333, 0.91372549, 1.0));
  objc_msgSend(v21, "setTitleColor:forState:", v22, 0);

  objc_msgSend(v21, "setAutoresizingMask:", 0);
  objc_msgSend(v21, "setContentMode:", 3);
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "dial:", 64);
  objc_msgSend(v3, "setButton2:andStyle:", v21, 1);
  objc_msgSend(v21, "setTitleVerticalOffset:", -1.0);

  return v3;
}

- (void)dismiss:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction", a3));
  objc_msgSend(v4, "sendResponse:", 3);

  -[STKTextAlertViewController dismiss](self, "dismiss");
}

- (void)dial:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionData"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "phoneNumber"));

  if (v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    objc_msgSend(v6, "sendResponse:", 0);

  }
  -[STKTextAlertViewController dismiss](self, "dismiss");

}

- (id)alertText
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)STKSetupCallAlertViewController;
  v3 = -[STKTextAlertViewController alertText](&v29, "alertText");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCalls"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionData"));
      v10 = objc_msgSend(v9, "isHighPriority");

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v12 = v11;
      if (v10)
        v13 = CFSTR("SIMTK_HIGH_PRIORITY_CALL_ALERT");
      else
        v13 = CFSTR("SIMTK_MEDIUM_PRIORITY_CALL_ALERT");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v12 = v11;
      v13 = CFSTR("SIMTK_CALL_ALERT");
    }
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sessionData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "simLabel"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sessionData"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "simLabel"));
    v20 = (void *)v19;
    v21 = &stru_100014540;
    if (v4)
      v21 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) %@"), v19, v21));

  }
  else
  {
    v23 = &stru_100014540;
    if (v4)
      v23 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v23));
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sessionData"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "phoneNumber"));

  if (v26)
  {
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingFormat:", CFSTR("\n%@"), v26));

    v22 = (void *)v27;
  }

  return v22;
}

@end
