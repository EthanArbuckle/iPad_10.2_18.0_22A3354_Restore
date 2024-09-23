@implementation AddToQuickNoteActivity

- (id)_systemImageName
{
  return CFSTR("quicknote");
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)activityType
{
  return CFSTR("SafariActivityTypeAddToQuickNote");
}

- (void)performActivityWithTabDocument:(id)a3
{
  objc_msgSend(a3, "addAppHighlightCreatingLink:", 1);
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemNoteTakingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isPrivateBrowsingEnabled");

  LOBYTE(v3) = objc_msgSend(v5, "isNoteTakingSupportedWithPrivateBrowsing:", v6);
  return (char)v3;
}

@end
