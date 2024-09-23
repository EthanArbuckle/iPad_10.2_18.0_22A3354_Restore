@implementation _IMBalloonBundleApp

- (BOOL)shouldForceIntoSendMenu
{
  return 0;
}

- (BOOL)isStickerPackOnly
{
  return 0;
}

- (BOOL)isPreDawnAndAppStoreStickerGenre
{
  return 0;
}

- (_IMBalloonBundleApp)initWithPluginBundle:(id)a3 appBundle:(id)a4
{
  id v6;
  id v7;
  _IMBalloonBundleApp *v8;
  _IMBalloonBundleApp *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v42;
  void *v43;
  objc_super v44;

  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)_IMBalloonBundleApp;
  v8 = -[IMBalloonApp initWithPluginBundle:appBundle:](&v44, sel_initWithPluginBundle_appBundle_, v6, v7);
  v9 = v8;
  if (!v8)
    goto LABEL_33;
  -[IMBalloonApp appBundle](v8, "appBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(":%@:%@"), CFSTR("0000000000"), v11);
  v13 = objc_claimAutoreleasedReturnValue();

  -[IMBalloonApp setIdentifier:](v9, "setIdentifier:", v13);
  -[IMBalloonApp setCanSendDataPayloads:](v9, "setCanSendDataPayloads:", 1);
  -[IMBalloonApp setShowInBrowser:](v9, "setShowInBrowser:", 1);
  -[IMBalloonApp setShowInSendMenu:](v9, "setShowInSendMenu:", 1);
  objc_msgSend(v7, "infoDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedInfoDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CKBrowserDisplayName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CKBrowserDisplayName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v19;

    }
  }
  -[IMBalloonApp setBrowserDisplayName:](v9, "setBrowserDisplayName:", v16);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CKBrowserShortDisplayName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v42 = v15;
  v43 = (void *)v13;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CKBrowserShortDisplayName"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (void *)v23;
    else
      v25 = v16;
    v22 = v25;

  }
  -[IMBalloonApp setBrowserShortDisplayName:](v9, "setBrowserShortDisplayName:", v22);
  objc_msgSend(v14, "objectForKey:", CFSTR("MSHideInAppDrawer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  if (v27)
  {
    -[IMBalloonApp setShowInBrowser:](v9, "setShowInBrowser:", 0);
    -[IMBalloonApp setShowInSendMenu:](v9, "setShowInSendMenu:", 0);
  }
  objc_msgSend(v14, "objectForKey:", CFSTR("MSCanSendDataPayloads"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");

  if (v29)
    -[IMBalloonApp setCanSendDataPayloads:](v9, "setCanSendDataPayloads:", 1);
  objc_msgSend(v14, "objectForKey:", CFSTR("MSShouldBalloonHideAppIcon"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");

  if (v31)
    -[IMBalloonApp setShouldBalloonHideAppIcon:](v9, "setShouldBalloonHideAppIcon:", 1);
  objc_msgSend(v14, "objectForKey:", CFSTR("MSShouldBreadcrumbHideAppIcon"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "BOOLValue");

  if (v33)
    -[IMBalloonApp setShouldBreadcrumbHideAppIcon:](v9, "setShouldBreadcrumbHideAppIcon:", 1);
  objc_msgSend(v14, "objectForKey:", CFSTR("MSShouldHideAppSwitcher"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "BOOLValue");

  if (v35)
    -[IMBalloonApp setShouldHideAppSwitcher:](v9, "setShouldHideAppSwitcher:", 1);
  objc_msgSend(v14, "objectForKey:", CFSTR("MSSupportedPresentationContexts"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonApp setPresentationContexts:](v9, "setPresentationContexts:", -[IMBalloonApp presentationContextsForInfoPlistArray:](v9, "presentationContextsForInfoPlistArray:", v36));
  objc_msgSend(v14, "objectForKey:", CFSTR("NSStickerSharingLevel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "length"))
  {
    if (!objc_msgSend(CFSTR("Messages"), "caseInsensitiveCompare:", v37))
    {
      v38 = 1;
      goto LABEL_29;
    }
    if (!objc_msgSend(CFSTR("OS"), "caseInsensitiveCompare:", v37))
    {
      v38 = 0;
LABEL_29:
      -[IMBalloonApp setStickerSharingLevel:](v9, "setStickerSharingLevel:", v38);
    }
  }
  objc_msgSend(v14, "objectForKey:", CFSTR("MSHideAttributionInformation"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "BOOLValue");

  if (v40)
    -[IMBalloonApp setShouldHideAttributionInformation:](v9, "setShouldHideAttributionInformation:", 1);

LABEL_33:
  return v9;
}

- (BOOL)shouldDelayViewControllerPresentation
{
  return 0;
}

- (double)presentationDelay
{
  return 1.0;
}

- (void)_loadAppBundle
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[IMBalloonApp pluginLoaded](self, "pluginLoaded"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v3, "startTimingForKey:", CFSTR("loadAppBundle"));
    -[IMBalloonApp appBundle](self, "appBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonApp setPluginLoaded:](self, "setPluginLoaded:", objc_msgSend(v4, "load"));

    objc_msgSend(v3, "stopTimingForKey:", CFSTR("loadAppBundle"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[IMBalloonApp appBundle](self, "appBundle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Loaded %@, %@", (uint8_t *)&v8, 0x16u);

      }
    }

  }
}

- (void)_loadBundle
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_IMBalloonBundleApp;
  -[IMBalloonApp _loadBundle](&v2, sel__loadBundle);
}

- (Class)bubbleClass
{
  -[_IMBalloonBundleApp _loadBundle](self, "_loadBundle");
  return self->_bubbleClass;
}

- (Class)browserClass
{
  -[_IMBalloonBundleApp _loadBundle](self, "_loadBundle");
  return self->_browserClass;
}

- (Class)dataSourceClass
{
  -[_IMBalloonBundleApp _loadBundle](self, "_loadBundle");
  return self->_dataSourceClass;
}

- (void)setBubbleClass:(Class)a3
{
  objc_storeStrong((id *)&self->_bubbleClass, a3);
}

- (void)setBrowserClass:(Class)a3
{
  objc_storeStrong((id *)&self->_browserClass, a3);
}

- (void)setDataSourceClass:(Class)a3
{
  objc_storeStrong((id *)&self->_dataSourceClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
  objc_storeStrong((id *)&self->_browserClass, 0);
  objc_storeStrong((id *)&self->_bubbleClass, 0);
}

@end
