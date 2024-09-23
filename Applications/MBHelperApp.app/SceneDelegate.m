@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "userActivities", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v8 = v9;
  if (v9)
  {
    -[SceneDelegate continueUserActivity:](self, "continueUserActivity:", v9);
    v8 = v9;
  }

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  -[SceneDelegate continueUserActivity:](self, "continueUserActivity:", a4);
}

- (void)continueUserActivity:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  MBOpenURLWrapper *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activityType"));
  v5 = objc_msgSend(v4, "isEqualToString:", NSUserActivityTypeBrowsingWeb);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "webpageURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v6, 1));
    if (v7)
    {
      v8 = -[MBOpenURLWrapper initWithURL:]([MBOpenURLWrapper alloc], "initWithURL:", v6);
      -[MBOpenURLWrapper setDelegate:](v8, "setDelegate:", self);
      -[MBOpenURLWrapper open](v8, "open");

    }
    else
    {
      objc_msgSend(v9, "invalidate");
    }

  }
}

- (void)openURLWrapper:(id)a3 willOpenURL:(id)a4
{
  const __CFString *v4;
  id v5;

  v4 = (const __CFString *)kMBManagerPrebuddyDeepLinkURLKey;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "absoluteString", a3));
  CFPreferencesSetValue(v4, v5, CFSTR("com.apple.MBHelperApp"), CFSTR("mobile"), kCFPreferencesAnyHost);

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
