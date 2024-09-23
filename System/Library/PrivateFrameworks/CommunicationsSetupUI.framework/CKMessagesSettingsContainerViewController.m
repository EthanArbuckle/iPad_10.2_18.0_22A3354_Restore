@implementation CKMessagesSettingsContainerViewController

- (id)specifierTitle
{
  void *v2;
  void *v3;
  void *v4;

  CommunicationsSetupUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_24D077260, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)serviceType
{
  return 1;
}

- (id)settingsClassName
{
  if (_os_feature_enabled_impl())
    return CFSTR("CKModernSettingsViewController");
  else
    return CFSTR("CKSettingsMessagesController");
}

- (id)name
{
  return CFSTR("MessagesSettingsBundle");
}

@end
