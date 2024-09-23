@implementation IMBalloonApp

- (NSString)identifier
{
  return self->_identifier;
}

- (NSBundle)appBundle
{
  return self->_appBundle;
}

- (BOOL)showInSendMenu
{
  return self->_showInSendMenu;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)showInBrowser
{
  return self->_showInBrowser;
}

- (void)setShowInSendMenu:(BOOL)a3
{
  self->_showInSendMenu = a3;
}

- (void)setShowInBrowser:(BOOL)a3
{
  self->_showInBrowser = a3;
}

- (void)setShouldHideAttributionInformation:(BOOL)a3
{
  self->_shouldHideAttributionInformation = a3;
}

- (void)setShouldHideAppSwitcher:(BOOL)a3
{
  self->_shouldHideAppSwitcher = a3;
}

- (void)setShouldBalloonHideAppIcon:(BOOL)a3
{
  self->_shouldBalloonHideAppIcon = a3;
}

- (void)setPresentationContexts:(unint64_t)a3
{
  self->_presentationContexts = a3;
}

- (void)setPluginLoaded:(BOOL)a3
{
  self->_pluginLoaded = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setDataSourceClass:(Class)a3
{
  objc_storeStrong((id *)&self->_dataSourceClass, a3);
}

- (void)setCanSendDataPayloads:(BOOL)a3
{
  self->_canSendDataPayloads = a3;
}

- (void)setBubbleClass:(Class)a3
{
  objc_storeStrong((id *)&self->_bubbleClass, a3);
}

- (void)setBrowserShortDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_browserShortDisplayName, a3);
}

- (void)setBrowserDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_browserDisplayName, a3);
}

- (void)setBrowserClass:(Class)a3
{
  objc_storeStrong((id *)&self->_browserClass, a3);
}

- (unint64_t)presentationContexts
{
  return self->_presentationContexts;
}

- (unint64_t)presentationContextsForInfoPlistArray:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;

  v4 = a3;
  if (-[IMBalloonApp isStickerPackOnly](self, "isStickerPackOnly"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isStickersAppEnabled");

    if (v6)
      v7 = 2;
    else
      v7 = -1;
  }
  else if ((v4 || -[IMBalloonApp isPreDawnAndAppStoreStickerGenre](self, "isPreDawnAndAppStoreStickerGenre"))
         && !-[IMBalloonApp shouldForceIntoSendMenu](self, "shouldForceIntoSendMenu"))
  {
    if (objc_msgSend(v4, "containsObject:", CFSTR("MSMessagesAppPresentationContextMessages")))
      v7 = -[IMBalloonApp isPreDawnAndAppStoreStickerGenre](self, "isPreDawnAndAppStoreStickerGenre") ^ 1;
    else
      v7 = 0;
    if ((objc_msgSend(v4, "containsObject:", CFSTR("MSMessagesAppPresentationContextMedia")) & 1) != 0
      || -[IMBalloonApp isPreDawnAndAppStoreStickerGenre](self, "isPreDawnAndAppStoreStickerGenre"))
    {
      v7 |= 2uLL;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)pluginLoaded
{
  return self->_pluginLoaded;
}

- (NSBundle)pluginBundle
{
  return self->_pluginBundle;
}

- (BOOL)isEnabledUnremovableApp
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "_unremovableDisabledApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonApp identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4) ^ 1;

  return v5;
}

- (IMBalloonApp)initWithPluginBundle:(id)a3 appBundle:(id)a4
{
  id v7;
  id v8;
  IMBalloonApp *v9;
  IMBalloonApp *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IMBalloonApp;
  v9 = -[IMBalloonApp init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pluginBundle, a3);
    objc_storeStrong((id *)&v10->_appBundle, a4);
    *(_WORD *)&v10->_showInSendMenu = 257;
    v10->_presentationContexts = 1;
    objc_msgSend(v7, "localizedInfoDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CKBrowserDisplayName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(v7, "infoDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CKBrowserDisplayName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    if (objc_msgSend(v12, "length"))
      -[IMBalloonApp setBrowserDisplayName:](v10, "setBrowserDisplayName:", v12);
    objc_msgSend(v7, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D375E0]);

    if (v15)
      -[IMBalloonApp setShouldHideAppSwitcher:](v10, "setShouldHideAppSwitcher:", 1);

  }
  return v10;
}

- (Class)dataSourceClass
{
  -[IMBalloonApp _loadBundle](self, "_loadBundle");
  return self->_dataSourceClass;
}

- (Class)bubbleClass
{
  -[IMBalloonApp _loadBundle](self, "_loadBundle");
  return self->_bubbleClass;
}

- (NSString)browserDisplayName
{
  return self->_browserDisplayName;
}

- (void)_loadBundle
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[IMBalloonApp pluginLoaded](self, "pluginLoaded"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v3, "startTimingForKey:", CFSTR("loadPlugin"));
    -[IMBalloonApp pluginBundle](self, "pluginBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonApp setPluginLoaded:](self, "setPluginLoaded:", objc_msgSend(v4, "load"));

    -[IMBalloonApp pluginBundle](self, "pluginBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "principalClass");

    -[IMBalloonApp setBubbleClass:](self, "setBubbleClass:", v6);
    -[IMBalloonApp pluginBundle](self, "pluginBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "infoDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("CKBrowserClass"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v9, "length"))
      -[IMBalloonApp setBrowserClass:](self, "setBrowserClass:", NSClassFromString(v9));
    objc_msgSend(v8, "objectForKey:", CFSTR("CKDatasourceClass"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v10, "length"))
      -[IMBalloonApp setDataSourceClass:](self, "setDataSourceClass:", NSClassFromString(v10));
    objc_msgSend(v8, "objectForKey:", CFSTR("IMCustomTypingIndicatorClass"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v11, "length"))
      -[IMBalloonApp setCustomTypingIndicatorLayerClass:](self, "setCustomTypingIndicatorLayerClass:", NSClassFromString(v11));
    objc_msgSend(v8, "objectForKey:", CFSTR("CKEntryClass"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v12, "length"))
      -[IMBalloonApp setEntryClass:](self, "setEntryClass:", NSClassFromString(v12));
    objc_msgSend(v3, "stopTimingForKey:", CFSTR("loadPlugin"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[IMBalloonApp pluginBundle](self, "pluginBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v15;
        v18 = 2112;
        v19 = v3;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Loaded %@, %@", (uint8_t *)&v16, 0x16u);

      }
    }

  }
}

+ (IMBalloonApp)appWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5
{
  id v7;
  id v8;
  id v9;
  _IMBalloonExtensionApp *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_IMBalloonExtensionApp initWithPluginBundle:pluginKitProxy:extension:]([_IMBalloonExtensionApp alloc], "initWithPluginBundle:pluginKitProxy:extension:", v9, v8, v7);

  return (IMBalloonApp *)v10;
}

+ (IMBalloonApp)appWithPluginBundle:(id)a3 appBundle:(id)a4
{
  id v5;
  id v6;
  _IMBalloonBundleApp *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_IMBalloonBundleApp initWithPluginBundle:appBundle:]([_IMBalloonBundleApp alloc], "initWithPluginBundle:appBundle:", v6, v5);

  return (IMBalloonApp *)v7;
}

+ (IMBalloonApp)appWithPluginBundle:(id)a3
{
  id v3;
  IMBalloonApp *v4;

  v3 = a3;
  v4 = -[IMBalloonApp initWithPluginBundle:appBundle:]([IMBalloonApp alloc], "initWithPluginBundle:appBundle:", v3, 0);

  return v4;
}

+ (id)_unremovableDisabledApps
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)qword_1ECF12310;
  if (!qword_1ECF12310)
  {
    IMGetCachedDomainValueForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_storeStrong((id *)&qword_1ECF12310, v3);
    }
    else
    {
      v7[0] = *MEMORY[0x1E0D375F0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)qword_1ECF12310;
      qword_1ECF12310 = v4;

    }
    v2 = (void *)qword_1ECF12310;
  }
  return v2;
}

+ (IMBalloonApp)appWithPluginBundle:(id)a3 extension:(id)a4
{
  id v5;
  id v6;
  _IMBalloonExtensionApp *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_IMBalloonExtensionApp initWithPluginBundle:extension:]([_IMBalloonExtensionApp alloc], "initWithPluginBundle:extension:", v6, v5);

  return (IMBalloonApp *)v7;
}

- (Class)browserClass
{
  -[IMBalloonApp _loadBundle](self, "_loadBundle");
  return self->_browserClass;
}

- (Class)customTypingIndicatorLayerClass
{
  -[IMBalloonApp _loadBundle](self, "_loadBundle");
  return self->_customTypingIndicatorLayerClass;
}

- (Class)entryClass
{
  -[IMBalloonApp _loadBundle](self, "_loadBundle");
  return self->_entryClass;
}

- (void)setIsEnabledUnremovableApp:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a3;
  -[IMBalloonApp identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend((id)objc_opt_class(), "_unremovableDisabledApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v8);
    if (v3)
    {
      if (v6)
      {
        v7 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v7, "removeObject:", v8);
LABEL_7:
        objc_msgSend((id)objc_opt_class(), "_setUnremovableDisabledApps:", v7);

      }
    }
    else if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v7, "addObject:", v8);
      goto LABEL_7;
    }

    v4 = v8;
  }

}

+ (void)_setUnremovableDisabledApps:(id)a3
{
  id v4;

  objc_storeStrong((id *)&qword_1ECF12310, a3);
  v4 = a3;
  IMSetDomainValueForKey();

}

- (BOOL)showableInBrowser
{
  return MEMORY[0x1E0DE7D20](self, sel_showInBrowser);
}

- (BOOL)linkedBeforeSDKVersion:(id)a3
{
  return 0;
}

- (void)setCustomTypingIndicatorLayerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_customTypingIndicatorLayerClass, a3);
}

- (void)setEntryClass:(Class)a3
{
  objc_storeStrong((id *)&self->_entryClass, a3);
}

- (BOOL)isBetaPlugin
{
  return self->_isBetaPlugin;
}

- (BOOL)isLaunchProhibited
{
  return self->_isLaunchProhibited;
}

- (void)setIsLaunchProhibited:(BOOL)a3
{
  self->_isLaunchProhibited = a3;
}

- (BOOL)isStickerPackOnly
{
  return self->_isStickerPackOnly;
}

- (BOOL)shouldForceIntoSendMenu
{
  return self->_shouldForceIntoSendMenu;
}

- (BOOL)shouldDelayViewControllerPresentation
{
  return self->_shouldDelayViewControllerPresentation;
}

- (double)presentationDelay
{
  return self->_presentationDelay;
}

- (BOOL)isPreDawnAndAppStoreStickerGenre
{
  return self->_isPreDawnAndAppStoreStickerGenre;
}

- (NSString)appStoreGenre
{
  return self->_appStoreGenre;
}

- (NSArray)appStoreSubgenres
{
  return self->_appStoreSubgenres;
}

- (BOOL)shouldBalloonHideAppIcon
{
  return self->_shouldBalloonHideAppIcon;
}

- (BOOL)shouldBreadcrumbHideAppIcon
{
  return self->_shouldBreadcrumbHideAppIcon;
}

- (void)setShouldBreadcrumbHideAppIcon:(BOOL)a3
{
  self->_shouldBreadcrumbHideAppIcon = a3;
}

- (BOOL)shouldHideAppSwitcher
{
  return self->_shouldHideAppSwitcher;
}

- (BOOL)shouldHideAttributionInformation
{
  return self->_shouldHideAttributionInformation;
}

- (BOOL)canSendDataPayloads
{
  return self->_canSendDataPayloads;
}

- (void)setAppBundle:(id)a3
{
  objc_storeStrong((id *)&self->_appBundle, a3);
}

- (void)setPluginBundle:(id)a3
{
  objc_storeStrong((id *)&self->_pluginBundle, a3);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (NSString)browserShortDisplayName
{
  return self->_browserShortDisplayName;
}

- (PKPlugIn)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_plugin, a3);
}

- (unint64_t)stickerSharingLevel
{
  return self->_stickerSharingLevel;
}

- (void)setStickerSharingLevel:(unint64_t)a3
{
  self->_stickerSharingLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_browserShortDisplayName, 0);
  objc_storeStrong((id *)&self->_browserDisplayName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_pluginBundle, 0);
  objc_storeStrong((id *)&self->_appBundle, 0);
  objc_storeStrong((id *)&self->_appStoreSubgenres, 0);
  objc_storeStrong((id *)&self->_appStoreGenre, 0);
  objc_storeStrong((id *)&self->_entryClass, 0);
  objc_storeStrong((id *)&self->_bubbleClass, 0);
  objc_storeStrong((id *)&self->_customTypingIndicatorLayerClass, 0);
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
  objc_storeStrong((id *)&self->_browserClass, 0);
}

@end
