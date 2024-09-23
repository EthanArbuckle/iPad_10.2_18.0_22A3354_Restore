@implementation WBTab

- (id)displayTitle
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "url");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(v1, "title");
      v1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "automationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "automationSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[TabDocument blankTabTitleWithLibraryType:controlledByAutomation:](TabDocument, "blankTabTitleWithLibraryType:controlledByAutomation:", 0, v5 != 0);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

@end
