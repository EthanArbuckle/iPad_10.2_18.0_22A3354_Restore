@implementation FBKSLaunchConfiguration

- (FBKSLaunchConfiguration)init
{
  FBKSLaunchConfiguration *v2;
  FBKSLaunchConfiguration_FrameworkPrivateName *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBKSLaunchConfiguration;
  v2 = -[FBKSLaunchConfiguration init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FBKSLaunchConfiguration_FrameworkPrivateName);
    -[FBKSLaunchConfiguration setSwiftObject:](v2, "setSwiftObject:", v3);

  }
  return v2;
}

- (void)setPromptStyle:(int64_t)a3
{
  id v4;

  self->_promptStyle = a3;
  -[FBKSLaunchConfiguration swiftObject](self, "swiftObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPromptStyle:", a3);

}

- (void)setLocalizedPromptTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_localizedPromptTitle, a3);
  v5 = a3;
  -[FBKSLaunchConfiguration swiftObject](self, "swiftObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedPromptTitle:", v5);

}

- (void)setLocalizedPromptMessage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_localizedPromptMessage, a3);
  v5 = a3;
  -[FBKSLaunchConfiguration swiftObject](self, "swiftObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedPromptMessage:", v5);

}

- (void)setLocalizedAlertViewProceedButtonTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_localizedAlertViewProceedButtonTitle, a3);
  v5 = a3;
  -[FBKSLaunchConfiguration swiftObject](self, "swiftObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedAlertViewProceedButtonTitle:", v5);

}

- (void)setLocalizedAlertViewDeclineButtonTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_localizedAlertViewDeclineButtonTitle, a3);
  v5 = a3;
  -[FBKSLaunchConfiguration swiftObject](self, "swiftObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedAlertViewDeclineButtonTitle:", v5);

}

- (void)setSkipsPrompt:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_skipsPrompt = a3;
  -[FBKSLaunchConfiguration swiftObject](self, "swiftObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToSkipPrompt:", v3);

}

- (void)setAlwaysUseRemoteAlertController:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_alwaysUseRemoteAlertController = a3;
  -[FBKSLaunchConfiguration swiftObject](self, "swiftObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlwaysLaunchInRemoteAlert:", v3);

}

- (void)setNotifyImmediately:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_notifyImmediately = a3;
  -[FBKSLaunchConfiguration swiftObject](self, "swiftObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotifyImmediately:", v3);

}

- (int64_t)promptStyle
{
  return self->_promptStyle;
}

- (NSString)localizedPromptTitle
{
  return self->_localizedPromptTitle;
}

- (NSString)localizedPromptMessage
{
  return self->_localizedPromptMessage;
}

- (NSString)localizedAlertViewProceedButtonTitle
{
  return self->_localizedAlertViewProceedButtonTitle;
}

- (NSString)localizedAlertViewDeclineButtonTitle
{
  return self->_localizedAlertViewDeclineButtonTitle;
}

- (FBKSLaunchConfiguration_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
  objc_storeStrong((id *)&self->_swiftObject, a3);
}

- (BOOL)skipsPrompt
{
  return self->_skipsPrompt;
}

- (BOOL)alwaysUseRemoteAlertController
{
  return self->_alwaysUseRemoteAlertController;
}

- (BOOL)notifyImmediately
{
  return self->_notifyImmediately;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftObject, 0);
  objc_storeStrong((id *)&self->_localizedAlertViewDeclineButtonTitle, 0);
  objc_storeStrong((id *)&self->_localizedAlertViewProceedButtonTitle, 0);
  objc_storeStrong((id *)&self->_localizedPromptMessage, 0);
  objc_storeStrong((id *)&self->_localizedPromptTitle, 0);
}

@end
