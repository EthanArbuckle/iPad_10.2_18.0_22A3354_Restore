@implementation IMBalloonPlugin(ImageLoading)

- (void)__ck_prefetchBrowserImageForInterfaceStyle:()ImageLoading
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Icon already in cache, not prefetching browser icon key - %@", buf, 0xCu);
      }
LABEL_5:

    }
  }
  else
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prefetchIconKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v5);

    v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (!v13)
        goto LABEL_18;
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Icon already prefetching, not prefetching browser icon key - %@", buf, 0xCu);
      }
      goto LABEL_5;
    }
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Prefetching browser icon for key - %@", buf, 0xCu);
      }

    }
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prefetchIconKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v5);

    if (iconPrefetchQueue_once != -1)
      dispatch_once(&iconPrefetchQueue_once, &__block_literal_global_175_0);
    v17 = iconPrefetchQueue_sQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__IMBalloonPlugin_ImageLoading____ck_prefetchBrowserImageForInterfaceStyle___block_invoke;
    block[3] = &unk_1E274A420;
    block[4] = a1;
    v20 = a3;
    v19 = v5;
    dispatch_async(v17, block);

  }
LABEL_18:

}

- (id)__ck_generateIconForInterfaceStyle:()ImageLoading notify:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "__ck_preferIconServices"))
  {
    objc_msgSend(a1, "__ck_iconServicesIconForInterfaceStyle:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "__ck_iconServicesDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepareImagesForImageDescriptors:", v9);

    objc_msgSend(a1, "__ck_iconServicesDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageForDescriptor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_msgSend(v11, "placeholder") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", objc_msgSend(v11, "CGImage"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "__ck_generateAssetCatalogImageForInterfaceStyle:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a4 && v12)
  {
    objc_msgSend(a1, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = 138412546;
        v17 = v13;
        v18 = 2048;
        v19 = a3;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Update icon with new image for app with identifier %@ interface style %ld", (uint8_t *)&v16, 0x16u);
      }

    }
    objc_msgSend(a1, "__ck_postImageUpdateNotificationWithImage:", v12);

  }
  return v12;
}

- (id)__ck_cacheKeyForInterfaceStyle:()ImageLoading
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPluginImageCacheKey keyWithStringIdentifier:integerIdentifier:](CKPluginImageCacheKey, "keyWithStringIdentifier:integerIdentifier:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

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
  void *v11;
  char v13;

  v13 = 0;
  objc_msgSend(a1, "__ck_browserImageName:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    CKFrameworkBundle();
  else
    objc_msgSend(a1, "pluginBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconForInterfaceStyle:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v8, v9);

  }
  return v8;
}

- (id)__ck_browserImageName:()ImageLoading
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37568]);

  if (v6)
  {
    *a3 = 1;
    v7 = (void *)MEMORY[0x1E0CB3940];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appIconSize");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("AppStoreIcon-%f"), v9);
LABEL_9:
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(a1, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin"));

  if (v11)
  {
    *a3 = 1;
    v12 = (void *)MEMORY[0x1E0CB3940];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appIconSize");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("MoreIcon-%f"), v13);
    goto LABEL_9;
  }
  objc_msgSend(a1, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin"));
  v16 = __CurrentTestName;

  if ((v15 & 1) != 0 || v16)
  {
    *a3 = 1;
    v21 = (void *)MEMORY[0x1E0CB3940];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appIconSize");
    objc_msgSend(v21, "stringWithFormat:", CFSTR("RecentsIcon-%f"), v22);
    goto LABEL_9;
  }
  *a3 = 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appIconSize");
  v19 = v18;

  objc_msgSend(a1, "browserImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("_%d"), v19);
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v23 = (void *)v20;

  return v23;
}

- (void)__ck_postImageUpdateNotificationWithImage:()ImageLoading
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("IMBalloonPluginIdentifierKey");
  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = CFSTR("IMBalloonPluginExtensionIdentifierKey");
  objc_msgSend(a1, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("UpdatedIMBalloonPluginIconKey");
  v10[1] = v6;
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D352C0], 0, v7);
}

- (id)__ck_iconServicesBundleIdentifier
{
  id v2;
  void *v3;
  void *v4;
  char v6;

  v6 = 0;
  v2 = (id)objc_msgSend(a1, "__ck_browserImageName:", &v6);
  if (v6)
    CKFrameworkBundle();
  else
    objc_msgSend(a1, "pluginBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)__ck_iconServicesDescriptor
{
  void *v0;
  double v1;
  double v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A878]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIconSize");
  objc_msgSend(v3, "setSize:");

  objc_msgSend(v3, "setScale:", v2);
  objc_msgSend(v3, "setShape:", 4);
  return v3;
}

+ (id)__ck_placeholderImageForInterfaceStyle:()ImageLoading
{
  if (__ck_placeholderImageForInterfaceStyle__once != -1)
    dispatch_once(&__ck_placeholderImageForInterfaceStyle__once, &__block_literal_global_92);
  return (id)__ck_placeholderImageForInterfaceStyle__placeholderImage;
}

- (id)__ck_cachedAssetCatalogImageForInterfaceStyle:()ImageLoading
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (id)__ck_iconServicesIconForInterfaceStyle:()ImageLoading
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v15;
  id v16;
  id location;

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(a1, "__ck_iconServicesBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v10);
    location = 0;
    objc_initWeak(&location, a1);
    iconGenerationForDisplayQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__IMBalloonPlugin_ImageLoading____ck_iconServicesIconForInterfaceStyle___block_invoke;
    block[3] = &unk_1E274D5D0;
    objc_copyWeak(&v16, &location);
    v9 = v11;
    v15 = v9;
    dispatch_async(v12, block);

    objc_msgSend(v6, "setObject:forKey:", v9, v7);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v9;
}

- (id)__ckImageForInterfaceStyle:()ImageLoading generateSynchronously:allowPlaceholder:
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25[2];
  _BYTE location[12];
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "__ck_preferIconServices"))
  {
    objc_msgSend(a1, "__ck_iconServicesDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "__ck_iconServicesIconForInterfaceStyle:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageForDescriptor:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v14 = 0;
      goto LABEL_15;
    }
    if ((objc_msgSend(v11, "placeholder") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", objc_msgSend(v11, "CGImage"));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (a4)
    {
      objc_msgSend(a1, "__ck_generateIconForInterfaceStyle:notify:", a3, 0);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v14 = (void *)v12;
LABEL_15:

      if (v14)
        return v14;
      goto LABEL_19;
    }

  }
  else
  {
    objc_msgSend(a1, "__ck_cachedAssetCatalogImageForInterfaceStyle:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (!v13 && a4)
    {
      objc_msgSend(a1, "__ck_generateIconForInterfaceStyle:notify:", a3, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        return v14;
      goto LABEL_19;
    }
    if (v13)
      return v14;
  }
  *(_QWORD *)location = 0;
  objc_initWeak((id *)location, a1);
  iconGenerationForDisplayQueue();
  v15 = objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __99__IMBalloonPlugin_ImageLoading____ckImageForInterfaceStyle_generateSynchronously_allowPlaceholder___block_invoke;
  v24 = &unk_1E2750A18;
  objc_copyWeak(v25, (id *)location);
  v25[1] = a3;
  dispatch_async(v15, &v21);

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)location);
  v14 = 0;
LABEL_19:
  if (a5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "identifier");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        v19 = CFSTR("NO");
        if (a4)
          v19 = CFSTR("YES");
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v17;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Didn't get an icon for identifier %@ synchronous:%@", location, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0D35760], "__ck_placeholderImageForInterfaceStyle:", a3, v21, v22, v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (uint64_t)__ck_browserImageForInterfaceStyle:()ImageLoading
{
  return objc_msgSend(a1, "__ck_browserImageGenerateSynchronously:interfaceStyle:allowPlaceholder:", 1, a3, 1);
}

- (uint64_t)__ck_browserImageGenerateSynchronously:()ImageLoading interfaceStyle:allowPlaceholder:
{
  return objc_msgSend(a1, "__ckImageForInterfaceStyle:generateSynchronously:allowPlaceholder:", a4, a3);
}

- (id)__ck_badgeImage
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D37568]);

  if (v3)
  {
    objc_msgSend(a1, "appStoreBadgeIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin"));

  if (v6)
  {
    objc_msgSend(a1, "recentsBadgeIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  objc_msgSend(a1, "browserImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("_%d"), 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKPluginImageCacheKey keyWithStringIdentifier:integerIdentifier:](CKPluginImageCacheKey, "keyWithStringIdentifier:integerIdentifier:", v9, 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(a1, "pluginBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "badgeIconForImageNamed:inBundle:", v9, v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v12, "setObject:forKey:", v14, v10);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(a1, "pluginBundle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v20 = v9;
          v21 = 2112;
          v22 = v18;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "IMBalloonPlugin __ck_badgeImage: failed to find an image named: %@ in bundle: %@", buf, 0x16u);

        }
      }
      v14 = 0;
    }
  }

  return v14;
}

- (id)__ck_statusImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "browserImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("_%d"), 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(a1, "pluginBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)__ck_generateStatusImage:()ImageLoading
{
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v5 = a3;
  objc_msgSend(a1, "__ck_statusImage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a3)[2](v5, v6);

}

- (id)__ck_statusImageForTransport
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "__ck_statusImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_scaledImage:xscale:yscale:", v2, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__ck_statusJPEGImageDataForTransportWithCompressionFactor:()ImageLoading
{
  UIImage *v3;
  UIImage *v4;
  void *v5;

  objc_msgSend(a1, "__ck_statusImage");
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    UIImageJPEGRepresentation(v3, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_scaledImage:()ImageLoading xscale:yscale:
{
  id v3;
  double v4;
  CGFloat v5;
  CGFloat height;
  double v7;
  CGContext *CurrentContext;
  void *v9;
  CGSize v11;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "size");
    v5 = v4 / 3.0;
    objc_msgSend(v3, "size");
    v11.width = v5;
    v11.height = v7 / 3.0;
    height = v11.height;
    UIGraphicsBeginImageContextWithOptions(v11, 1, 1.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, 0.333333333, 0.333333333);
    objc_msgSend(v3, "drawInRect:", *MEMORY[0x1E0C9D538] - v5 * 0.5, *(double *)(MEMORY[0x1E0C9D538] + 8) - height * 0.5, v5, height);

    UIGraphicsGetImageFromCurrentImageContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (uint64_t)__ck_appIconFromPayloadDictionary:()ImageLoading withCompletionBlock:
{
  return objc_msgSend(a1, "__ck_appIconFromPayloadDictionary:pluginBundleID:withCompletionBlock:", a3, 0, a4);
}

+ (id)__ck_appIconFromPayloadDictionary:()ImageLoading pluginBundleID:withCompletionBlock:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  IMSanitizedAppIconDataForIMExtensionPayloadAppIconKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    IMBalloonExtensionIDWithSuffix();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v12) & 1) == 0)
    {
      IMBalloonExtensionIDWithSuffix();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", v13))
      {
        IMBalloonExtensionIDWithSuffix();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v8, "isEqualToString:", v18);

        if ((v19 & 1) == 0)
        {
          v14 = 15;
          goto LABEL_7;
        }
LABEL_6:
        v14 = 0;
LABEL_7:
        objc_msgSend(v11, "_applicationIconImageForFormat:precomposed:", v14, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }

    }
    goto LABEL_6;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v20 = 134217984;
      v21 = objc_msgSend(v10, "length");
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Failed to generate icon from payloadDictionary, length: %tu", (uint8_t *)&v20, 0xCu);
    }

  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (id)description
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@<%p> : %@"), v3, a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appStoreBadgeIcon
{
  if (appStoreBadgeIcon_once != -1)
    dispatch_once(&appStoreBadgeIcon_once, &__block_literal_global_138_0);
  return (id)appStoreBadgeIcon_sBehavior;
}

- (id)recentsBadgeIcon
{
  if (recentsBadgeIcon_once != -1)
    dispatch_once(&recentsBadgeIcon_once, &__block_literal_global_139_0);
  return (id)recentsBadgeIcon_sBehavior;
}

@end
