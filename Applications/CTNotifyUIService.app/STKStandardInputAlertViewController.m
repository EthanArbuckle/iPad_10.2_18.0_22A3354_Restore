@implementation STKStandardInputAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(STKTextInputSessionAction);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (void)leftNavigationButtonPressed
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  objc_msgSend(v3, "sendResponse:", 4);

  -[STKBaseAlertViewController dismiss](self, "dismiss");
}

- (void)rightNavigationButtonPressed
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  objc_msgSend(v3, "sendResponse:", 1);

  -[STKBaseAlertViewController dismiss](self, "dismiss");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionData"));

  if (v6)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "simLabel"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionData"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "simLabel"));
      v14 = (void *)v13;
      v15 = &stru_100014540;
      if (v7)
        v15 = v7;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) %@"), v13, v15));

    }
    else
    {
      v17 = &stru_100014540;
      if (v7)
        v17 = v7;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v17));
    }
    -[STKBaseInputAlertViewController setText:](self, "setText:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseInputAlertViewController inputTextField](self, "inputTextField"));
    objc_msgSend(v18, "setSecureTextEntry:", objc_msgSend(v6, "isSecure"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseInputAlertViewController inputTextField](self, "inputTextField"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultText"));
    objc_msgSend(v19, "setText:", v20);

    -[STKBaseInputAlertViewController setDigitsOnly:](self, "setDigitsOnly:", objc_msgSend(v6, "isDigitsOnly"));
    -[STKBaseInputAlertViewController setMinLength:](self, "setMinLength:", objc_msgSend(v6, "minimumInputLength"));
    -[STKBaseInputAlertViewController setMaxLength:](self, "setMaxLength:", objc_msgSend(v6, "maximumInputLength"));

  }
  -[STKBaseAlertViewController startTimeoutTimerIfNecessary](self, "startTimeoutTimerIfNecessary");
  v21.receiver = self;
  v21.super_class = (Class)STKStandardInputAlertViewController;
  -[STKStandardInputAlertViewController viewWillAppear:](&v21, "viewWillAppear:", v3);

}

- (void)sendButtonPressed
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseInputAlertViewController inputTextField](self, "inputTextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  objc_msgSend(v3, "sendSuccessWithResponse:", v5);

  -[STKBaseAlertViewController dismiss](self, "dismiss");
}

@end
