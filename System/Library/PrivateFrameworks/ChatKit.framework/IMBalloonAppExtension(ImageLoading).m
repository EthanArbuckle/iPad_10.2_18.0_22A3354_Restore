@implementation IMBalloonAppExtension(ImageLoading)

- (uint64_t)__ck_preferIconServices
{
  return 0;
}

- (id)__ck_generateAssetCatalogImageForInterfaceStyle:()ImageLoading
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(a1, "_validProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appIconSize");
    v14 = v13;

    objc_msgSend(a1, "browserImageName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("_%d"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(a1, "appBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageNamed:inBundle:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "iconForInterfaceStyle:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v5, "iconForInterfaceStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
LABEL_3:
    objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v7, v8);

  }
LABEL_4:

  return v7;
}

- (id)_validProxy
{
  void *v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "proxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "containingBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0CA58F0];
    objc_msgSend(v1, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pluginKitProxyForIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v7;
  }

  return v1;
}

- (id)__ck_iconServicesBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_validProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "appBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_generatePlaceholderImageForInterfaceStyle:()ImageLoading
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  uint64_t v8;
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "Generate placeholder image", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  v3 = v2;

  v8 = v3;
  objc_msgSend(MEMORY[0x1E0CEA638], "_iconVariantForUIApplicationIconFormat:scale:", 14, &v8);
  v4 = LICreateDefaultIcon();
  if (v4)
  {
    v5 = (const void *)v4;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)__ck_browserImageForInterfaceStyle:()ImageLoading
{
  return objc_msgSend(a1, "__ck_browserImageGenerateSynchronously:interfaceStyle:allowPlaceholder:", 1, a3, 1);
}

- (uint64_t)__ck_browserImageGenerateSynchronously:()ImageLoading interfaceStyle:allowPlaceholder:
{
  return objc_msgSend(a1, "__ckImageForInterfaceStyle:generateSynchronously:allowPlaceholder:", a4, a3);
}

- (id)__ck_statusImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_validProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v2, 15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "browserImageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("_%d"), 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(a1, "appBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "badgeIconForImageNamed:inBundle:", v5, v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)__ck_generateStatusImage:()ImageLoading
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  double v17;

  v4 = a3;
  objc_msgSend(a1, "_validProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v17 = 0.0;
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconVariantForUIApplicationIconFormat:scale:", 15, &v17);
    LIIconOutputSizeForVariant();
    v7 = v6;
    v9 = v8;
    v10 = objc_alloc(MEMORY[0x1E0D3A830]);
    v11 = (void *)objc_msgSend(v10, "initWithSize:scale:", v7, v9, v17);
    objc_msgSend(v11, "setDrawBorder:", 1);
    v12 = objc_alloc(MEMORY[0x1E0D3A820]);
    objc_msgSend(v5, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:", v13);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__IMBalloonAppExtension_ImageLoading____ck_generateStatusImage___block_invoke;
    v15[3] = &unk_1E27509F0;
    v16 = v4;
    objc_msgSend(v14, "getCGImageForImageDescriptor:completion:", v11, v15);

  }
  else
  {
    objc_msgSend(a1, "__ck_statusImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v11);
  }

}

- (id)__ck_breadcrumbImage
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_validProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v2, 16);
  else
    objc_msgSend(a1, "__ck_statusImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)__ck_tapToRadarBalloonPluginImage
{
  return 0;
}

@end
