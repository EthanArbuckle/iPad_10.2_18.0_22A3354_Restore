@implementation DDOpenURLAction

- (id)iconName
{
  const __CFString *v3;
  void *v5;
  void *v6;
  int v7;

  if (self->super._hasCompanion)
  {
    if (-[NSURL dd_isAppleStore](self->super._url, "dd_isAppleStore"))
    {
      if (-[NSURL dd_isAppleApps](self->super._url, "dd_isAppleApps"))
      {
        return CFSTR("appstore");
      }
      else if (-[NSURL dd_isAppleBooks](self->super._url, "dd_isAppleBooks"))
      {
        return CFSTR("book");
      }
      else if (-[NSURL dd_isAppleMusic](self->super._url, "dd_isAppleMusic"))
      {
        return CFSTR("music");
      }
      else if (-[NSURL dd_isApplePodcasts](self->super._url, "dd_isApplePodcasts"))
      {
        return CFSTR("podcasts");
      }
      else if (-[NSURL dd_isAppleTV](self->super._url, "dd_isAppleTV"))
      {
        return CFSTR("tv");
      }
      else
      {
        return CFSTR("star");
      }
    }
    else
    {
      return CFSTR("arrow.up.forward.app");
    }
  }
  else
  {
    v3 = CFSTR("safari");
    if (!self->super._isCompanion)
    {
      if (-[NSURL dd_isMaps:](self->super._url, "dd_isMaps:", 1))
      {
        return CFSTR("map");
      }
      else
      {
        -[NSURL scheme](self->super._url, "scheme");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lowercaseString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("rdar"));

        if (v7)
          return CFSTR("ant");
      }
    }
  }
  return (id)v3;
}

- (id)appLink
{
  NSURL *url;
  void *v5;
  LSAppLink *v6;
  LSAppLink *appLink;

  if (!self->_appLinkInitDone)
  {
    self->_appLinkInitDone = 1;
    if (appLink_onceToken != -1)
      dispatch_once(&appLink_onceToken, &__block_literal_global_7);
    if (appLink_entitled)
    {
      url = self->super._url;
      if (url)
      {
        objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:error:", url, 1, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v6 = (LSAppLink *)objc_claimAutoreleasedReturnValue();
        appLink = self->_appLink;
        self->_appLink = v6;

      }
    }
  }
  return self->_appLink;
}

uint64_t __26__DDOpenURLAction_appLink__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CA5838], "currentProcessHasReadAccess");
  appLink_entitled = result;
  return result;
}

- (id)companionAction
{
  DDOpenURLAction *v3;
  void *v5;

  if (self->super._isCompanion
    || self->super._hasCompanion
    || (-[DDOpenURLAction appLink](self, "appLink"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v3 = 0;
  }
  else
  {
    v3 = -[DDAction initWithURL:result:context:]([DDOpenURLAction alloc], "initWithURL:result:context:", self->super._url, self->super._result, self->super._context);
    if (v3)
    {
      v3->super._isCompanion = 1;
      self->super._hasCompanion = 1;
    }
  }
  return v3;
}

- (id)localizedName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;

  if (self->super._hasCompanion)
  {
    -[DDOpenURLAction appLink](self, "appLink");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "targetApplicationRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0CB3940];
    DDLocalizedString(CFSTR("Open in “%@”"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (self->super._isCompanion)
  {
    v8 = objc_alloc(MEMORY[0x1E0CA58A8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithURL:error:", v9, 0);
    objc_msgSend(v10, "bundleRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      DDLocalizedString(CFSTR("Open in %@"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v14, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      DDLocalizedString(CFSTR("Open in Web Browser"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[NSURL scheme](self->super._url, "scheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("rdar"));

    if (v17)
      v18 = CFSTR("Open in Radar");
    else
      v18 = CFSTR("Open Link");
    DDLocalizedString(v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)compactTitle
{
  __DDResult *v3;
  void *v4;
  NSURL *url;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v3 = self->super._result;
  if (v3)
  {
    actionSheetTitleForResult((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    url = self->super._url;
    if (!url)
    {
      v6 = 0;
LABEL_9:
      v10.receiver = self;
      v10.super_class = (Class)DDOpenURLAction;
      -[DDAction compactTitle](&v10, sel_compactTitle);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    actionSheetTitleForURL(url);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  if (!v4 || (unint64_t)objc_msgSend(v4, "length") > 0x3B)
    goto LABEL_9;
  v7 = v6;
  v6 = v7;
LABEL_10:
  v8 = v7;

  return v8;
}

- (id)quickActionTitle
{
  NSURL *url;
  void *v4;
  objc_super v6;

  url = self->super._url;
  if (!url)
    goto LABEL_4;
  -[NSURL _lp_highLevelDomain](url, "_lp_highLevelDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {

LABEL_4:
    v6.receiver = self;
    v6.super_class = (Class)DDOpenURLAction;
    -[DDAction quickActionTitle](&v6, sel_quickActionTitle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)performFromView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[DDOpenURLAction shouldOpenInApp](self, "shouldOpenInApp")
    && (-[DDOpenURLAction appLink](self, "appLink"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[DDOpenURLAction appLink](self, "appLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);

    -[DDOpenURLAction appLink](self, "appLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openWithCompletionHandler:", 0);

  }
  else
  {
    if (-[DDOpenURLAction shouldOpenInBrowser](self, "shouldOpenInBrowser"))
    {
      -[DDOpenURLAction appLink](self, "appLink");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[DDOpenURLAction appLink](self, "appLink");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setEnabled:", 0);

      }
    }
    -[DDAction _performFromView:byOpeningURL:disableAppLink:](self, "_performFromView:byOpeningURL:disableAppLink:", v9, self->super._url, -[DDOpenURLAction shouldOpenInBrowser](self, "shouldOpenInBrowser"));
  }

}

- (BOOL)canBePerformedWhenDeviceIsLocked
{
  void *v3;
  BOOL v4;

  if (!-[DDOpenURLAction shouldOpenInApp](self, "shouldOpenInApp"))
    return 1;
  -[DDOpenURLAction appLink](self, "appLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (id)notificationIconBundleIdentifier
{
  void *v2;
  void *v3;
  int v4;

  -[NSURL scheme](self->super._url, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("http"));

  if (v4)
    return CFSTR("com.apple.mobilesafari");
  else
    return 0;
}

- (id)notificationURL
{
  return self->super._url;
}

- (BOOL)shouldOpenInBrowser
{
  return self->super._isCompanion;
}

- (BOOL)shouldOpenInApp
{
  return self->super._hasCompanion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLink, 0);
}

@end
