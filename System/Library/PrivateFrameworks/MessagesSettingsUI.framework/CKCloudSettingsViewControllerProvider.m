@implementation CKCloudSettingsViewControllerProvider

+ (id)messagesCloudSettingsViewControllerWithAccountManager:(id)a3
{
  id v3;
  CKCloudSettingsViewController *v4;

  v3 = a3;
  v4 = objc_alloc_init(CKCloudSettingsViewController);
  -[CKCloudSettingsViewController setAccountManager:](v4, "setAccountManager:", v3);

  return v4;
}

@end
