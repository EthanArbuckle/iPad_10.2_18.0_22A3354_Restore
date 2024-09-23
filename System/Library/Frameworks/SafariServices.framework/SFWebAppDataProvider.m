@implementation SFWebAppDataProvider

- (void)setContentReadyForDisplay
{
  UINavigationController *wrappingNavigationController;
  _SFWebClipViewController *v4;
  _SFWebClipViewController *webClipViewController;

  if (self->_webClipViewController)
  {
    wrappingNavigationController = self->_wrappingNavigationController;
    if (wrappingNavigationController)
    {
      -[UINavigationController topViewController](wrappingNavigationController, "topViewController");
      v4 = (_SFWebClipViewController *)objc_claimAutoreleasedReturnValue();
      webClipViewController = self->_webClipViewController;

      if (v4 != webClipViewController)
        -[UINavigationController pushViewController:animated:](self->_wrappingNavigationController, "pushViewController:animated:", self->_webClipViewController, 1);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[_SFWebClipViewController setDelegate:](self->_webClipViewController, "setDelegate:", 0);
  -[UIWebClip cancelMediaUpdate](self->_webClip, "cancelMediaUpdate");
  -[UIWebClip setDelegate:](self->_webClip, "setDelegate:", 0);
  -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", 0);
  -[WKWebView stopLoading](self->_webView, "stopLoading");
  v3.receiver = self;
  v3.super_class = (Class)SFWebAppDataProvider;
  -[SFWebAppDataProvider dealloc](&v3, sel_dealloc);
}

- (UIViewController)activityViewController
{
  UINavigationController *wrappingNavigationController;
  UINavigationController *v4;
  UINavigationController *v5;

  wrappingNavigationController = self->_wrappingNavigationController;
  if (!wrappingNavigationController)
  {
    v4 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_webClipViewController);
    v5 = self->_wrappingNavigationController;
    self->_wrappingNavigationController = v4;

    wrappingNavigationController = self->_wrappingNavigationController;
  }
  return (UIViewController *)wrappingNavigationController;
}

- (void)prepareWithManifestData:(id)a3
{
  id v4;
  _SFWebClipViewController *v5;
  _SFWebClipViewController *webClipViewController;
  _WKApplicationManifest *v7;
  _WKApplicationManifest *manifest;
  UIColor *v9;
  UIColor *pageThemeColor;
  UIColor *v11;
  UIColor *underPageBackgroundColor;
  UIWebClip *v13;
  UIWebClip *webClip;
  void *v15;
  id v16;

  v4 = a3;
  v5 = -[_SFWebClipViewController initWithStyle:]([_SFWebClipViewController alloc], "initWithStyle:", 1);
  webClipViewController = self->_webClipViewController;
  self->_webClipViewController = v5;

  -[_SFWebClipViewController setDelegate:](self->_webClipViewController, "setDelegate:", self);
  -[NSDictionary safari_applicationManifestForKey:](v4, (uint64_t)CFSTR("Manifest"));
  v7 = (_WKApplicationManifest *)objc_claimAutoreleasedReturnValue();
  manifest = self->_manifest;
  self->_manifest = v7;

  -[NSDictionary safari_colorForKey:](v4, (uint64_t)CFSTR("PageThemeColor"));
  v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  pageThemeColor = self->_pageThemeColor;
  self->_pageThemeColor = v9;

  -[NSDictionary safari_colorForKey:](v4, (uint64_t)CFSTR("UnderPageBackgroundColor"));
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  underPageBackgroundColor = self->_underPageBackgroundColor;
  self->_underPageBackgroundColor = v11;

  objc_msgSend(v4, "safari_URLForKey:", CFSTR("PageURL"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (UIWebClip *)objc_alloc_init(MEMORY[0x1E0DC3F68]);
  webClip = self->_webClip;
  self->_webClip = v13;

  -[UIWebClip setDelegate:](self->_webClip, "setDelegate:", self);
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("PageTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIWebClip setTitle:](self->_webClip, "setTitle:", v15);
  -[UIWebClip setPageURL:](self->_webClip, "setPageURL:", v16);
  -[_SFWebClipViewController setWebClip:](self->_webClipViewController, "setWebClip:", self->_webClip);

}

- (void)updateWithWebClipMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];

  v4 = a3;
  -[SFWebAppDataProvider setContentReadyForDisplay](self, "setContentReadyForDisplay");
  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("MetaAndLinkTags"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SFWebAppDataProvider_updateWithWebClipMetadata___block_invoke;
  v6[3] = &unk_1E4AC2618;
  v6[4] = self;
  +[_SFWebClipMetadataFetcher parseRawMetadataDictionary:consumer:](_SFWebClipMetadataFetcher, "parseRawMetadataDictionary:consumer:", v5, v6);
  -[_SFWebClipViewController setCanEditAndSave:](self->_webClipViewController, "setCanEditAndSave:", 1);
  -[_SFWebClipViewController updateUIAnimated:](self->_webClipViewController, "updateUIAnimated:", 0);
  self->_webClipConfigured = 1;
  -[SFWebAppDataProvider _updateManifestValues](self, "_updateManifestValues");
  if (+[_SFFeatureAvailability isHSWADisabled](_SFFeatureAvailability, "isHSWADisabled"))
    -[UIWebClip setFullScreen:](self->_webClip, "setFullScreen:", 0);

}

uint64_t __50__SFWebAppDataProvider_updateWithWebClipMetadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "configureWithMetaTags:linkTags:", a2, a3);
}

- (void)updateWebClipIcon:(id)a3
{
  id v4;
  UIWebClip *webClip;
  id v6;

  v4 = a3;
  webClip = self->_webClip;
  if (webClip && !self->_touchIcon)
  {
    v6 = v4;
    -[UIWebClip setIconImage:isPrecomposed:](webClip, "setIconImage:isPrecomposed:", v4, 0);
    -[_SFWebClipViewController updateUIAnimated:](self->_webClipViewController, "updateUIAnimated:", 1);
    v4 = v6;
  }

}

- (void)updateWithStagedCookiesDirectoryURL:(id)a3 sandboxExtensionToken:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  objc_msgSend(v7, "UTF8String");
  v8 = sandbox_extension_consume();
  if (v8 == -1)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SFWebAppDataProvider updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:].cold.1((uint64_t)v7, v16);
  }
  else
  {
    v9 = v8;
    v10 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __82__SFWebAppDataProvider_updateWithStagedCookiesDirectoryURL_sandboxExtensionToken___block_invoke;
    v23[3] = &__block_descriptor_40_e5_v8__0l;
    v23[4] = v9;
    objc_msgSend(v10, "setHandler:", v23);
    -[UIWebClip _sf_stagedCookiesURL](self->_webClip, "_sf_stagedCookiesURL");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v6 && v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v13, "copyItemAtURL:toURL:error:", v6, v12, &v22);
      v14 = v22;

      if (v14)
      {
        v15 = WBS_LOG_CHANNEL_PREFIXWebApp();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[SFWebAppDataProvider updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:].cold.2(v15, v14);
      }

    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        objc_msgSend(v6, "absoluteString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "absoluteString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIWebClip identifier](self->_webClip, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v19;
        v26 = 2114;
        v27 = v20;
        v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A3B2D000, v18, OS_LOG_TYPE_ERROR, "Received invalid paths to copy cookies from: %{public}@ to: %{public}@, for web clip with identifier: %{public}@", buf, 0x20u);

      }
    }

  }
}

uint64_t __82__SFWebAppDataProvider_updateWithStagedCookiesDirectoryURL_sandboxExtensionToken___block_invoke()
{
  return sandbox_extension_release();
}

- (void)webClipViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  UINavigationController *wrappingNavigationController;
  _SFWebClipViewController *webClipViewController;
  UIWebClip *webClip;
  id v18;

  v4 = a4;
  -[SFWebAppDataProvider delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataProvider:didFinishWithResult:", self, v4);

  -[UIWebClip _sf_stagedCookiesURL](self->_webClip, "_sf_stagedCookiesURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v11, "removeItemAtURL:error:", v7, &v18);
      v12 = v18;

      if (v12)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXWebApp();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[SFWebAppDataProvider webClipViewController:didFinishWithResult:].cold.1((uint64_t)v7, v13, v14);
      }

    }
  }
  wrappingNavigationController = self->_wrappingNavigationController;
  self->_wrappingNavigationController = 0;

  -[_SFWebClipViewController setDelegate:](self->_webClipViewController, "setDelegate:", 0);
  webClipViewController = self->_webClipViewController;
  self->_webClipViewController = 0;

  -[UIWebClip setDelegate:](self->_webClip, "setDelegate:", 0);
  webClip = self->_webClip;
  self->_webClip = 0;

}

- (void)webClip:(id)a3 iconRequestDidFinishWithImage:(id)a4 precomposed:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  UIWebClip *v9;

  v5 = a5;
  v9 = (UIWebClip *)a3;
  v8 = a4;
  if (v8 && self->_webClip == v9)
  {
    -[UIWebClip setIconImage:isPrecomposed:](v9, "setIconImage:isPrecomposed:", v8, v5);
    -[_SFWebClipViewController updateUIAnimated:](self->_webClipViewController, "updateUIAnimated:", 1);
    objc_storeStrong((id *)&self->_touchIcon, a4);
    self->_touchIconPrecomposed = v5;
  }

}

- (void)webClip:(id)a3 startupImageRequestDidFinishWithImage:(id)a4
{
  id v6;
  UIWebClip *v7;

  v7 = (UIWebClip *)a3;
  v6 = a4;
  if (v6
    && self->_webClip == v7
    && objc_msgSend(v6, "sf_isLaunchImageSizedForOrientation:includesStatusBar:", 1, 0))
  {
    -[UIWebClip setStartupImage:](v7, "setStartupImage:", v6);
  }

}

- (void)webClip:(id)a3 startupLandscapeImageRequestDidFinishWithImage:(id)a4
{
  id v6;
  UIWebClip *v7;

  v7 = (UIWebClip *)a3;
  v6 = a4;
  if (v6
    && self->_webClip == v7
    && objc_msgSend(v6, "sf_isLaunchImageSizedForOrientation:includesStatusBar:", 4, 0))
  {
    -[UIWebClip setStartupLandscapeImage:](v7, "setStartupLandscapeImage:", v6);
  }

}

- (void)_updateManifestValues
{
  SFWebAppDataProvider *v2;
  _WKApplicationManifest *manifest;
  void *v4;
  UIWebClip *webClip;
  void *v6;
  void *v7;
  UIWebClip *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSArray *v30;
  NSArray *manifestIcons;
  NSArray *v32;
  void *v33;
  UIImage *touchIcon;
  void *v35;
  SFWebAppDataProvider *v36;
  void *v37;
  id obj;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v2 = self;
  v45 = *MEMORY[0x1E0C80C00];
  manifest = self->_manifest;
  if (manifest)
  {
    -[_WKApplicationManifest safari_name](manifest, "safari_name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    webClip = v2->_webClip;
    if (v4)
    {
      -[UIWebClip setTitle:](webClip, "setTitle:", v4);
    }
    else
    {
      -[UIWebClip title](webClip, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWebClip setTitle:](v2->_webClip, "setTitle:", v6);

    }
    -[_WKApplicationManifest startURL](v2->_manifest, "startURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v2->_webClip;
    if (v7)
    {
      -[UIWebClip setPageURL:](v8, "setPageURL:", v7);
    }
    else
    {
      -[UIWebClip pageURL](v8, "pageURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWebClip setPageURL:](v2->_webClip, "setPageURL:", v9);

    }
    v10 = -[_WKApplicationManifest displayMode](v2->_manifest, "displayMode") == 3
       || -[_WKApplicationManifest displayMode](v2->_manifest, "displayMode") == 2;
    -[UIWebClip setFullScreen:](v2->_webClip, "setFullScreen:", v10);
    -[_WKApplicationManifest icons](v2->_manifest, "icons");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      v35 = (void *)v11;
      v36 = v2;
      -[_WKApplicationManifest icons](v2->_manifest, "icons");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v41 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v18, "purposes");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "containsObject:", &unk_1E4B25B70);

            if (v20)
            {
              v21 = objc_alloc_init(MEMORY[0x1E0DC3F70]);
              objc_msgSend(v18, "src");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setUrl:", v22);

              objc_msgSend(v21, "setSiteWide:", 1);
              objc_msgSend(v21, "setPrecomposed:", 0);
              objc_msgSend(v18, "sizes");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                objc_msgSend(v18, "sizes");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "firstObject");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "componentsSeparatedByString:", CFSTR("x"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "firstObject");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "integerValue");

                if (v28)
                  objc_msgSend(v21, "setBestSize:", (double)v28, (double)v28);
              }
              objc_msgSend(v37, "addObject:", v21);

            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v15);
      }

      if (objc_msgSend(v37, "count"))
        v29 = v37;
      else
        v29 = 0;
      v30 = v29;

      v2 = v36;
      manifestIcons = v36->_manifestIcons;
      v36->_manifestIcons = v30;

      v12 = v35;
    }
    else
    {
      v32 = v2->_manifestIcons;
      v2->_manifestIcons = 0;

    }
    -[_WKApplicationManifest manifestId](v2->_manifest, "manifestId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebClip setManifestId:](v2->_webClip, "setManifestId:", v33);

    -[UIWebClip _sf_setApplicationManifest:](v2->_webClip, "_sf_setApplicationManifest:", v2->_manifest);
  }
  -[_SFWebClipViewController setCanEditAndSave:](v2->_webClipViewController, "setCanEditAndSave:", 1);
  -[_SFWebClipViewController updateUIAnimated:](v2->_webClipViewController, "updateUIAnimated:", 0);
  v2->_webClipConfigured = 1;
  touchIcon = v2->_touchIcon;
  if (touchIcon)
  {
    -[UIWebClip setIconImage:isPrecomposed:](v2->_webClip, "setIconImage:isPrecomposed:", touchIcon, v2->_touchIconPrecomposed);
  }
  else
  {
    -[SFWebAppDataProvider _updateMonogramIconForWebClip](v2, "_updateMonogramIconForWebClip");
    if (v2->_manifestIcons)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __45__SFWebAppDataProvider__updateManifestValues__block_invoke;
      v39[3] = &unk_1E4AC2640;
      v39[4] = v2;
      -[SFWebAppDataProvider _downloadManifestIconWithCompletionHandler:](v2, "_downloadManifestIconWithCompletionHandler:", v39);
    }
  }
}

uint64_t __45__SFWebAppDataProvider__updateManifestValues__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "setIconImage:isPrecomposed:", a2, 0);
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 16), "updateUIAnimated:", 1);
  }
  return result;
}

- (BOOL)_isWhiteColor:(id)a3
{
  BOOL v3;
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  if (!objc_msgSend(a3, "getRed:green:blue:alpha:", &v7, &v6, &v5, 0))
    return 1;
  v3 = v7 == 1.0;
  if (v6 != 1.0)
    v3 = 0;
  return v5 == 1.0 && v3;
}

- (void)_updateMonogramIconForWebClip
{
  WKWebView *webView;
  UIColor *v4;
  UIColor *pageThemeColor;
  UIColor *v6;
  UIColor *underPageBackgroundColor;
  _WKApplicationManifest *manifest;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  UIColor *v13;
  UIColor *v14;
  UIColor *v15;
  UIColor *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIColor *v25;
  id v26;

  if (self->_touchIcon || self->_bestManifestIcon)
    return;
  webView = self->_webView;
  if (webView)
  {
    -[WKWebView themeColor](webView, "themeColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    pageThemeColor = self->_pageThemeColor;
    self->_pageThemeColor = v4;

    -[WKWebView underPageBackgroundColor](self->_webView, "underPageBackgroundColor");
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    underPageBackgroundColor = self->_underPageBackgroundColor;
    self->_underPageBackgroundColor = v6;

  }
  objc_msgSend(MEMORY[0x1E0D4EF78], "defaultIconKeyColor");
  v25 = (UIColor *)objc_claimAutoreleasedReturnValue();
  manifest = self->_manifest;
  if (manifest)
  {
    -[_WKApplicationManifest themeColor](manifest, "themeColor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[_WKApplicationManifest themeColor](self->_manifest, "themeColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SFWebAppDataProvider _isWhiteColor:](self, "_isWhiteColor:", v11);

      if (!v12)
      {
        -[_WKApplicationManifest themeColor](self->_manifest, "themeColor");
        v15 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        v16 = v15;

        v13 = v16;
        goto LABEL_19;
      }
    }
  }
  if (self->_pageThemeColor && !-[SFWebAppDataProvider _isWhiteColor:](self, "_isWhiteColor:"))
  {
    v14 = self->_pageThemeColor;
LABEL_17:
    v15 = v14;
    goto LABEL_18;
  }
  if (self->_underPageBackgroundColor && !-[SFWebAppDataProvider _isWhiteColor:](self, "_isWhiteColor:"))
  {
    v14 = self->_underPageBackgroundColor;
    goto LABEL_17;
  }
  v13 = v25;
LABEL_19:
  v26 = v13;
  if ((-[UIColor sf_isDarkColor](v13, "sf_isDarkColor") & 1) == 0)
  {
    objc_msgSend(v26, "sf_darkenedColor");
    v17 = objc_claimAutoreleasedReturnValue();

    v26 = (id)v17;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0D8AD20]);
  objc_msgSend(MEMORY[0x1E0D4EF78], "defaultSize");
  objc_msgSend(v18, "setIconSize:");
  v19 = (void *)MEMORY[0x1E0D4EF78];
  if (_SFDeviceIsPad())
    v20 = 2;
  else
    v20 = 1;
  objc_msgSend(v19, "fontPointSizeForIconSize:", v20);
  objc_msgSend(v18, "setFontSize:");
  objc_msgSend(v18, "setFontWeight:", 1);
  objc_msgSend(v18, "setBackgroundColor:", v26);
  objc_msgSend(MEMORY[0x1E0D4EF78], "cornerRadius");
  objc_msgSend(v18, "setCornerRadius:");
  v21 = (void *)MEMORY[0x1E0D8AD28];
  -[UIWebClip title](self->_webClip, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClip pageURL](self->_webClip, "pageURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "monogramWithTitle:url:monogramConfiguration:shouldRemoveGrammaticalArticles:", v22, v23, v18, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIWebClip setIconImage:isPrecomposed:](self->_webClip, "setIconImage:isPrecomposed:", v24, 1);
  -[_SFWebClipViewController updateUIAnimated:](self->_webClipViewController, "updateUIAnimated:", 1);

}

- (void)_downloadManifestIconWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (self->_bestManifestIcon)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    -[NSArray safari_maximumUsingComparator:](self->_manifestIcons, "safari_maximumUsingComparator:", &__block_literal_global_17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8A9C0], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__SFWebAppDataProvider__downloadManifestIconWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E4AC26A8;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v7, "downloadImageWithURL:options:completionHandler:", v8, 1, v9);

  }
}

uint64_t __67__SFWebAppDataProvider__downloadManifestIconWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:preferringDeviceIconSizes:", a3, 1);
}

void __67__SFWebAppDataProvider__downloadManifestIconWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void (*v6)(void);
  id v7;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  if (!*(_QWORD *)(v5 + 80))
  {
    if (v4)
    {
      objc_storeStrong((id *)(v5 + 48), a2);
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_5;
    }
    objc_msgSend((id)v5, "_updateMonogramIconForWebClip");
  }
  v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_5:
  v6();

}

- (SFWebAppDataProviderDelegate)delegate
{
  return (SFWebAppDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_underPageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pageThemeColor, 0);
  objc_storeStrong((id *)&self->_webClipMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_activityJSController, 0);
  objc_storeStrong((id *)&self->_touchIcon, 0);
  objc_storeStrong((id *)&self->_applicationManifestFetcher, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_manifestIcons, 0);
  objc_storeStrong((id *)&self->_bestManifestIcon, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_webClipViewController, 0);
  objc_storeStrong((id *)&self->_wrappingNavigationController, 0);
}

- (void)updateWithStagedCookiesDirectoryURL:(uint64_t)a1 sandboxExtensionToken:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *__error();
  v5 = 138412546;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to consume sandbox extension, Sandbox Extension %@, errno = %d", (uint8_t *)&v5, 0x12u);

  OUTLINED_FUNCTION_6();
}

- (void)updateWithStagedCookiesDirectoryURL:(void *)a1 sandboxExtensionToken:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v3, v5, "Failed to copy staged cookies into webClip's directory %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_6();
}

- (void)webClipViewController:(uint64_t)a3 didFinishWithResult:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, a2, a3, "Failed to remove stageCookies at URL %@", (uint8_t *)&v3);
}

@end
