@implementation HideToolbarActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)activityType
{
  return CFSTR("SafariActivityTypeHideToolbar");
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  return CFSTR("arrow.up.left.and.arrow.down.right");
}

- (int64_t)actionType
{
  return 17;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
  objc_msgSend(v4, "browserController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setKeepBarsMinimized:", 1);
}

@end
