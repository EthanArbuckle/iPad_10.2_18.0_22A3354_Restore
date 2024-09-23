@implementation ToggleDesktopWebsiteActivity

- (id)activityType
{
  return CFSTR("SafariActivityTypeToggleDesktop");
}

- (id)activityTitleWithTabDocument:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "reloadOptionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadedUsingDesktopUserAgent");
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v3 = a3;
  objc_msgSend(v3, "reloadOptionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "loadedUsingDesktopUserAgent");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v3, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_currentDeviceImageNameForOrientation:", objc_msgSend(v9, "interfaceOrientation"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("desktopcomputer");
  }

  return v10;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isShowingReader") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    objc_msgSend(v3, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "sf_isOfflineReadingListURL") ^ 1;

  }
  return v4;
}

- (int64_t)actionType
{
  return 18;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "reloadOptionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loadedUsingDesktopUserAgent");

  objc_msgSend(v4, "reloadOptionsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "requestStandardSite");
  else
    objc_msgSend(v7, "requestDesktopSite");

  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
