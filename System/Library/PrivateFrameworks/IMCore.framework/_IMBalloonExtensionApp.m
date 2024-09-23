@implementation _IMBalloonExtensionApp

- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 extension:(id)a4 pluginKitProxyClass:(Class)a5 proxy:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _IMBalloonExtensionApp *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void (*v43)(void *);
  NSObject *v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  __CFString *v61;
  _QWORD v62[4];
  id v63;
  objc_super v64;
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v11 && !v12)
  {
    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class pluginKitProxyForIdentifier:](a5, "pluginKitProxyForIdentifier:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "containingBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64.receiver = self;
  v64.super_class = (Class)_IMBalloonExtensionApp;
  v16 = -[IMBalloonApp initWithPluginBundle:appBundle:](&v64, sel_initWithPluginBundle_appBundle_, v10, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_extension, a4);
    objc_storeStrong((id *)&v16->_proxy, v13);
    objc_msgSend(v13, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "infoDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("NSExtension"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("MSMessagePayloadProviderIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "length"))
    {
      v21 = v20;

      v17 = v21;
    }
    objc_msgSend(v13, "teamID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v61 = v22;
    }
    else
    {
      objc_msgSend(v13, "containingBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "teamID");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = CFSTR("0000000000");
      if (v25)
        v27 = (__CFString *)v25;
      v61 = v27;

    }
    objc_msgSend(v10, "bundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(":%@:%@"), v61, v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMBalloonApp setIdentifier:](v16, "setIdentifier:", v29);
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = sub_1A20E7634;
    v62[3] = &unk_1E4721E38;
    v30 = v29;
    v63 = v30;
    objc_msgSend(v11, "setRequestInterruptionBlock:", v62);
    objc_msgSend(v13, "localizedName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length") == 0;

    if (v32)
    {
      objc_msgSend(v13, "localizedShortName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "length") == 0;

      if (v35)
        goto LABEL_17;
      objc_msgSend(v13, "localizedShortName");
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "localizedName");
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v36 = (void *)v33;
    -[IMBalloonApp setBrowserDisplayName:](v16, "setBrowserDisplayName:", v33);

LABEL_17:
    -[IMBalloonApp browserDisplayName](v16, "browserDisplayName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "length") == 0;

    if (v38)
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = IMFileLocationTrimFileName();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4725068);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("[self.browserDisplayName length] > 0"), "-[_IMBalloonExtensionApp initWithPluginBundle:extension:pluginKitProxyClass:proxy:]", v40, 146, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void (*)(void *))IMGetAssertionFailureHandler();
      if (v43)
      {
        v43(v42);
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v66 = v42;
          _os_log_impl(&dword_1A1FF4000, v44, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v13, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("MSHideInAppDrawer"), objc_opt_class(), 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "BOOLValue");

    if (v46)
    {
      -[IMBalloonApp setShowInBrowser:](v16, "setShowInBrowser:", 0);
      -[IMBalloonApp setShowInSendMenu:](v16, "setShowInSendMenu:", 0);
    }
    objc_msgSend(v13, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("MSCanSendDataPayloads"), objc_opt_class(), 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "BOOLValue");

    if (v48)
      -[IMBalloonApp setCanSendDataPayloads:](v16, "setCanSendDataPayloads:", 1);
    objc_msgSend(v13, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("MSShouldBalloonHideAppIcon"), objc_opt_class(), 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "BOOLValue");

    if (v50)
      -[IMBalloonApp setShouldBalloonHideAppIcon:](v16, "setShouldBalloonHideAppIcon:", 1);
    objc_msgSend(v13, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("MSShouldBreadcrumbHideAppIcon"), objc_opt_class(), 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLValue");

    if (v52)
      -[IMBalloonApp setShouldBreadcrumbHideAppIcon:](v16, "setShouldBreadcrumbHideAppIcon:", 1);
    objc_msgSend(v13, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("MSShouldHideAppSwitcher"), objc_opt_class(), 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "BOOLValue");

    if (v54)
      -[IMBalloonApp setShouldHideAppSwitcher:](v16, "setShouldHideAppSwitcher:", 1);
    objc_msgSend(v13, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("MSSupportedPresentationContexts"), objc_opt_class(), 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonApp setPresentationContexts:](v16, "setPresentationContexts:", -[IMBalloonApp presentationContextsForInfoPlistArray:](v16, "presentationContextsForInfoPlistArray:", v55));
    objc_msgSend(v13, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("NSStickerSharingLevel"), objc_opt_class(), 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v56, "length"))
      goto LABEL_41;
    if (objc_msgSend(CFSTR("Messages"), "caseInsensitiveCompare:", v56))
    {
      if (objc_msgSend(CFSTR("OS"), "caseInsensitiveCompare:", v56))
      {
LABEL_41:
        objc_msgSend(v13, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("MSHideAttributionInformation"), objc_opt_class(), 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "BOOLValue");

        if (v59)
          -[IMBalloonApp setShouldHideAttributionInformation:](v16, "setShouldHideAttributionInformation:", 1);

        goto LABEL_44;
      }
      v57 = 0;
    }
    else
    {
      v57 = 1;
    }
    -[IMBalloonApp setStickerSharingLevel:](v16, "setStickerSharingLevel:", v57);
    goto LABEL_41;
  }
LABEL_44:

  return v16;
}

- (BOOL)showInSendMenu
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_IMBalloonExtensionApp;
  return -[IMBalloonApp showInSendMenu](&v3, sel_showInSendMenu);
}

- (BOOL)isStickerPackOnly
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[_IMBalloonExtensionApp proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v6 = 0;
  if (v2)
  {
    objc_msgSend(v2, "objectForInfoDictionaryKey:ofClass:", CFSTR("LSApplicationIsStickerProvider"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) != 0)
      v6 = 1;
  }

  return v6;
}

- (LSPlugInKitProxy)proxy
{
  return self->_proxy;
}

- (id)version
{
  void *v2;
  void *v3;

  -[_IMBalloonExtensionApp extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)showInBrowser
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_IMBalloonExtensionApp;
  v3 = -[IMBalloonApp showInBrowser](&v11, sel_showInBrowser);
  if (v3)
  {
    -[_IMBalloonExtensionApp applicationType](self, "applicationType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = sub_1A219B2C4(v5);
    v9 = objc_msgSend(v8, "isEqualToString:", **(_QWORD **)(v7 + 2080), v6);

    if (v9)
      LOBYTE(v3) = -[IMBalloonApp isEnabledUnremovableApp](self, "isEnabledUnremovableApp");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)shouldForceIntoSendMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[_IMBalloonExtensionApp extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[_IMBalloonExtensionApp linkedBeforeDawn](self, "linkedBeforeDawn"))
  {
    -[_IMBalloonExtensionApp _bundleIDsForDawnSendMenuTemporaryDisplayOverride](self, "_bundleIDsForDawnSendMenuTemporaryDisplayOverride");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)plugin
{
  void *v2;
  void *v3;

  -[_IMBalloonExtensionApp extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)linkedBeforeSDKVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[_IMBalloonExtensionApp extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LSExecutableSDKVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    sub_1A219B1B0(0.0);
    sub_1A219B1B0(0.0);
    v9 = sub_1A219B1D8(0.0) == -1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)linkedBeforeDawn
{
  return -[_IMBalloonExtensionApp linkedBeforeSDKVersion:](self, "linkedBeforeSDKVersion:", CFSTR("17.0"));
}

- (BOOL)isPreDawnAndAppStoreStickerGenre
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v3 = -[_IMBalloonExtensionApp linkedBeforeDawn](self, "linkedBeforeDawn");
  -[_IMBalloonExtensionApp appStoreGenreID](self, "appStoreGenreID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_1E475ED00);

  -[_IMBalloonExtensionApp appStoreGenre](self, "appStoreGenre");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Stickers"));

  -[_IMBalloonExtensionApp appStoreSubgenres](self, "appStoreSubgenres");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("Stickers"));

  if (!v3 | v5)
    return v3;
  else
    return v7 | v9;
}

- (BOOL)isEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;

  -[_IMBalloonExtensionApp plugin](self, "plugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userElection") & 0xFE;

  if (!v4)
    return 1;
  -[_IMBalloonExtensionApp applicationType](self, "applicationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = sub_1A219B2C4(v6);
  v10 = objc_msgSend(v9, "isEqualToString:", **(_QWORD **)(v8 + 2080), v7);

  if (v10)
  {
    -[_IMBalloonExtensionApp plugin](self, "plugin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserElection:", 0);

    -[IMBalloonApp setIsEnabledUnremovableApp:](self, "setIsEnabledUnremovableApp:", 0);
    return 1;
  }
  return 0;
}

- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5
{
  return -[_IMBalloonExtensionApp initWithPluginBundle:extension:pluginKitProxyClass:proxy:](self, "initWithPluginBundle:extension:pluginKitProxyClass:proxy:", a3, a5, 0, a4);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (id)applicationType
{
  void *v2;
  void *v3;
  void *v4;

  -[_IMBalloonExtensionApp proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appStoreSubgenres
{
  void *v2;
  void *v3;
  void *v4;

  -[_IMBalloonExtensionApp proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "subgenres");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appStoreGenre
{
  void *v2;
  void *v3;
  void *v4;

  -[_IMBalloonExtensionApp proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "genre");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appStoreGenreID
{
  void *v2;
  void *v3;
  void *v4;

  -[_IMBalloonExtensionApp proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "genreID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 extension:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _IMBalloonExtensionApp *v9;

  v6 = qword_1ECF122F8;
  v7 = a4;
  v8 = a3;
  if (v6 != -1)
    dispatch_once(&qword_1ECF122F8, &unk_1E4721EA0);
  v9 = -[_IMBalloonExtensionApp initWithPluginBundle:extension:pluginKitProxyClass:proxy:](self, "initWithPluginBundle:extension:pluginKitProxyClass:proxy:", v8, v7, objc_retainAutorelease((id)qword_1ECF122F0), 0);

  return v9;
}

- (id)itemID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[IMBalloonApp appBundle](self, "appBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v4 = &unk_1E475ECD0;
LABEL_5:
    if (!objc_msgSend(v4, "isEqual:", &unk_1E475ECD0))
      goto LABEL_10;
    goto LABEL_6;
  }
  objc_msgSend(v3, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_5;
LABEL_6:
  -[IMBalloonApp identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (qword_1EE65F5E8 != -1)
      dispatch_once(&qword_1EE65F5E8, &unk_1E471D8F8);
    v6 = (void *)qword_1EE65F5E0;
    -[IMBalloonApp identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
LABEL_10:

  return v4;
}

- (BOOL)shouldDelayViewControllerPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;

  -[_IMBalloonExtensionApp extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_IMBalloonExtensionApp _bundleIDsForDelayedPresentationOptIn](self, "_bundleIDsForDelayedPresentationOptIn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
      v8 = objc_msgSend(v4, "BOOLValueForKey:withDefault:", CFSTR("MSOptInToDelayedPresentation"), 0);
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)presentationDelay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  float v11;

  -[_IMBalloonExtensionApp extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MSPresentationDelay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v8 = v7;
  }
  else
  {
    -[_IMBalloonExtensionApp _bundleIDToPresentationDelayMapping](self, "_bundleIDToPresentationDelayMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v8 = v11;
    }
    else
    {
      v8 = 1.0;
    }

  }
  return v8;
}

- (id)_bundleIDToPresentationDelayMapping
{
  if (qword_1EE65F5F8 != -1)
    dispatch_once(&qword_1EE65F5F8, &unk_1E4721E80);
  return (id)qword_1EE65F5F0;
}

- (id)_bundleIDsForDawnSendMenuTemporaryDisplayOverride
{
  if (qword_1EE65F608 != -1)
    dispatch_once(&qword_1EE65F608, &unk_1E471C5B0);
  return (id)qword_1EE65F600;
}

- (id)_bundleIDsForDelayedPresentationOptIn
{
  if (qword_1EE65F618 != -1)
    dispatch_once(&qword_1EE65F618, &unk_1E471BC40);
  return (id)qword_1EE65F610;
}

- (BOOL)isBetaPlugin
{
  void *v2;
  char v3;

  -[LSPlugInKitProxy containingBundle](self->_proxy, "containingBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBetaApp");

  return v3;
}

- (BOOL)showableInBrowser
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_IMBalloonExtensionApp;
  v3 = -[IMBalloonApp showInBrowser](&v11, sel_showInBrowser);
  if (v3)
  {
    -[_IMBalloonExtensionApp applicationType](self, "applicationType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = sub_1A219B2C4(v5);
    v9 = objc_msgSend(v8, "isEqualToString:", **(_QWORD **)(v7 + 2080), v6);

    if (v9)
      LOBYTE(v3) = !-[IMBalloonApp isEnabledUnremovableApp](self, "isEnabledUnremovableApp");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)setIsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a3;
  -[_IMBalloonExtensionApp applicationType](self, "applicationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = sub_1A219B2C4(v6);
  v10 = objc_msgSend(v9, "isEqualToString:", **(_QWORD **)(v8 + 2080), v7);

  if (v10)
  {
    -[IMBalloonApp setIsEnabledUnremovableApp:](self, "setIsEnabledUnremovableApp:", v3);
  }
  else
  {
    if (v3)
      v11 = 1;
    else
      v11 = 2;
    -[_IMBalloonExtensionApp plugin](self, "plugin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userElection");

    -[_IMBalloonExtensionApp plugin](self, "plugin");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserElection:", v13 & 0xFFFFFFFFFFFFFF00 | v11);

  }
}

- (BOOL)isLaunchProhibited
{
  void *v2;
  void *v3;
  char v4;

  -[_IMBalloonExtensionApp proxy](self, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLaunchProhibited");

  return v4;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
