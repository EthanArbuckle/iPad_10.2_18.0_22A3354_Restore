@implementation ReloadActivity

- (id)activityTitleWithTabDocument:(id)a3
{
  objc_msgSend(a3, "canStopLoading");
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  if (objc_msgSend(a3, "canStopLoading"))
    return CFSTR("xmark");
  else
    return CFSTR("arrow.clockwise");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0CD5830];
}

- (int64_t)actionType
{
  return 1;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "canStopLoading"))
    objc_msgSend(v4, "stopLoadingUserInitiated");
  else
    objc_msgSend(v4, "reloadUserInitiated");

  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
