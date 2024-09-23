@implementation SafariViewServiceApplication

+ (void)initialize
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = objc_opt_self(SafariViewServiceApplication, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "addSuiteNamed:", CFSTR("com.apple.mobilesafari"));

    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _sf_safariDefaults](NSUserDefaults, "_sf_safariDefaults"));
    objc_msgSend(v6, "_sf_registerSafariDefaults");

  }
}

- (void)applicationDidFinishLaunching:(id)a3
{
  +[_SFSiteMetadataManager setSharedSiteMetadataManagerProvider:](_SFSiteMetadataManager, "setSharedSiteMetadataManagerProvider:", self);
  +[_SFReaderCustomProtocols registerReaderCustomProtocols](_SFReaderCustomProtocols, "registerReaderCustomProtocols");
  +[_SFBrowserContentViewController createDefaultWebsiteDataStore](_SFBrowserContentViewController, "createDefaultWebsiteDataStore");
  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:andApp:](STDynamicActivityAttributionPublisher, "setCurrentAttributionKey:andApp:", CFSTR("_SFGenericWebsiteName"), 0);
}

- (id)newSharedSiteMetadataManager
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = objc_alloc((Class)_SFSiteMetadataManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle safari_safariInjectedBundleURL](NSBundle, "safari_safariInjectedBundleURL"));
  v4 = _SFSafariIconImageCacheDirectoryPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
  v7 = objc_msgSend(v2, "initWithInjectedBundleURL:imageCacheDirectoryURL:cacheIsReadOnly:metadataType:", v3, v6, 1, 38);

  return v7;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  self->_currentKeyboardModifierFlags = (int64_t)objc_msgSend(v6, "modifierFlags");
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  -[SafariViewServiceApplication pressesBegan:withEvent:](&v8, "pressesBegan:withEvent:", v7, v6);

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  self->_currentKeyboardModifierFlags = (int64_t)objc_msgSend(v6, "modifierFlags");
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  -[SafariViewServiceApplication pressesChanged:withEvent:](&v8, "pressesChanged:withEvent:", v7, v6);

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  self->_currentKeyboardModifierFlags = (int64_t)objc_msgSend(v6, "modifierFlags");
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  -[SafariViewServiceApplication pressesEnded:withEvent:](&v8, "pressesEnded:withEvent:", v7, v6);

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  self->_currentKeyboardModifierFlags = (int64_t)objc_msgSend(v6, "modifierFlags");
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  -[SafariViewServiceApplication pressesCancelled:withEvent:](&v8, "pressesCancelled:withEvent:", v7, v6);

}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  -[SafariViewServiceApplication buildMenuWithBuilder:](&v8, "buildMenuWithBuilder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "system"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));

  if (v5 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFBrowserMenuProvider sharedProvider](SFBrowserMenuProvider, "sharedProvider"));
    objc_msgSend(v7, "setMenusIfNecessaryForSafariViewServiceWithBuilder:", v4);

  }
}

- (int64_t)currentKeyboardModifierFlags
{
  return self->_currentKeyboardModifierFlags;
}

@end
