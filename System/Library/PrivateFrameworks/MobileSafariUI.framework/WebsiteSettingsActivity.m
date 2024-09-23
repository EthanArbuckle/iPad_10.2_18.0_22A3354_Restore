@implementation WebsiteSettingsActivity

- (id)activityType
{
  return CFSTR("SafariActivityTypeWebsiteSettings");
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("gear");
}

- (int64_t)actionType
{
  return 24;
}

- (void)performActivityWithTabDocument:(id)a3
{
  objc_msgSend(a3, "perSiteSettingsUIPresentSettings");
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
