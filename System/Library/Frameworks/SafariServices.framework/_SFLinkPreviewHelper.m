@implementation _SFLinkPreviewHelper

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)ownerToPreviewMap;
    ownerToPreviewMap = v2;

  }
}

+ (id)contextMenuConfigurationForWebView:(id)a3 elementInfo:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _WKActivatedElementInfo *v10;
  uint64_t v11;
  _SFLinkPreviewHelper *v12;
  void *v13;
  _SFLinkPreviewHelper *v14;
  void *v15;
  void *v16;
  char v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "_activatedElementInfo");
  v10 = (_WKActivatedElementInfo *)objc_claimAutoreleasedReturnValue();
  v11 = previewContentForElementInfo(v10);

  if (v11 != 2)
  {
    objc_msgSend(v8, "linkURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "safari_isHTTPFamilyURL");

    if ((v17 & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  if ((shouldProvideActionsForQRCodes() & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v12 = [_SFLinkPreviewHelper alloc];
  objc_msgSend(v7, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v14 = -[_SFLinkPreviewHelper initWithWebView:windowBounds:elementInfo:orURL:handler:](v12, "initWithWebView:windowBounds:elementInfo:orURL:handler:", v7, v8, 0, v9);

  objc_msgSend((id)ownerToPreviewMap, "setObject:forKey:", v14, v7);
  -[_SFLinkPreviewHelper makeContextMenuConfiguration](v14, "makeContextMenuConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v15;
}

+ (id)contextMenuContentPreviewForWebView:(id)a3 elementInfo:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _WKActivatedElementInfo *v10;
  uint64_t v11;
  _SFLinkPreviewHelper *v12;
  void *v13;
  _SFLinkPreviewHelper *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((shouldProvideActionsForQRCodes() & 1) != 0
    || (objc_msgSend(v8, "_activatedElementInfo"),
        v10 = (_WKActivatedElementInfo *)objc_claimAutoreleasedReturnValue(),
        v11 = previewContentForElementInfo(v10),
        v10,
        v11 != 2))
  {
    v15 = 0;
  }
  else
  {
    v12 = [_SFLinkPreviewHelper alloc];
    objc_msgSend(v7, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v14 = -[_SFLinkPreviewHelper initWithWebView:windowBounds:elementInfo:orURL:handler:](v12, "initWithWebView:windowBounds:elementInfo:orURL:handler:", v7, v8, 0, v9);

    objc_msgSend((id)ownerToPreviewMap, "setObject:forKey:", v14, v7);
    -[_SFLinkPreviewHelper previewViewController](v14, "previewViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

+ (id)linkPreviewHelperForWebView:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)ownerToPreviewMap, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)invalidateLinkPreviewHelperForWebView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend((id)ownerToPreviewMap, "objectForKey:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend((id)ownerToPreviewMap, "removeObjectForKey:", v5);
  }

}

+ (id)previewViewControllerWebView:(id)a3 windowBounds:(CGRect)a4 url:(id)a5 handler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  id v14;
  _SFLinkPreviewHelper *v15;
  void *v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = -[_SFLinkPreviewHelper initWithWebView:windowBounds:elementInfo:orURL:handler:]([_SFLinkPreviewHelper alloc], "initWithWebView:windowBounds:elementInfo:orURL:handler:", v12, 0, v13, v14, x, y, width, height);
  objc_msgSend((id)ownerToPreviewMap, "setObject:forKey:", v15, v12);
  -[_SFLinkPreviewHelper previewViewController](v15, "previewViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (void)commitPreviewViewController:(id)a3
{
  id v3;

  objc_msgSend((id)ownerToPreviewMap, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitPreviewViewController");
  objc_msgSend(v3, "invalidate");

}

- (_SFLinkPreviewHelper)initWithWebView:(id)a3 windowBounds:(CGRect)a4 elementInfo:(id)a5 orURL:(id)a6 handler:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  id v19;
  _SFLinkPreviewHelper *v20;
  uint64_t v21;
  _WKActivatedElementInfo *elementInfo;
  _SFLinkPreviewHelper *v23;
  objc_super v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_SFLinkPreviewHelper;
  v20 = -[_SFLinkPreviewHelper init](&v25, sel_init);
  if (v20)
  {
    objc_msgSend(v17, "_activatedElementInfo");
    v21 = objc_claimAutoreleasedReturnValue();
    elementInfo = v20->_elementInfo;
    v20->_elementInfo = (_WKActivatedElementInfo *)v21;

    objc_storeStrong((id *)&v20->_fallbackURL, a6);
    objc_storeWeak((id *)&v20->_handler, v19);
    objc_storeStrong((id *)&v20->_webView, a3);
    v20->_windowBounds.origin.x = x;
    v20->_windowBounds.origin.y = y;
    v20->_windowBounds.size.width = width;
    v20->_windowBounds.size.height = height;
    v23 = v20;
  }

  return v20;
}

- (NSURL)url
{
  void *fallbackURL;
  void *v4;
  NSURL *v5;

  -[_WKActivatedElementInfo URL](self->_elementInfo, "URL");
  fallbackURL = (void *)objc_claimAutoreleasedReturnValue();
  v4 = fallbackURL;
  if (!fallbackURL)
    fallbackURL = self->_fallbackURL;
  v5 = fallbackURL;

  return v5;
}

- (void)commitPreviewViewController
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___ZZ51___SFLinkPreviewHelper_commitPreviewViewController_ENK3__0clEP5NSURL_block_invoke;
  v8[3] = &unk_1E4AC3008;
  v5 = *a1;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  v11 = v6;
  v7 = v4;
  objc_msgSend(v7, "decideOpenStrategyWithCompletionHandler:", v8);

}

- (void)openURL:(id)a3 forAction:(int64_t)a4 withTabOrder:(int64_t)a5
{
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0D4EF70], "builderWithModifierFlags:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredTabOrder:", a5);
  if (a4 == 3)
  {
    objc_msgSend(v8, "setPrefersOpenInNewTab:", 1);
  }
  else if (a4 == 4)
  {
    objc_msgSend(v8, "setPrefersOpenInNewWindow:", 1);
  }
  objc_msgSend(v8, "navigationIntentWithURL:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  objc_msgSend(WeakRetained, "linkPreviewHelper:didProduceNavigationIntent:forAction:", self, v9, a4);

}

- (void)invalidate
{
  _QWORD *p_cachedPreviewViewController;
  _SFLinkPreviewHelper *v4;
  _SFLinkPreviewHelper *v5;

  p_cachedPreviewViewController = &self->_cachedPreviewViewController;
  if (self->_cachedPreviewViewController
    && (objc_msgSend((id)ownerToPreviewMap, "objectForKey:"),
        v4 = (_SFLinkPreviewHelper *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 == self)
    || (p_cachedPreviewViewController = &self->_webView,
        objc_msgSend((id)ownerToPreviewMap, "objectForKey:", self->_webView),
        v5 = (_SFLinkPreviewHelper *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5 == self))
  {
    objc_msgSend((id)ownerToPreviewMap, "removeObjectForKey:", *p_cachedPreviewViewController);
  }
  -[_SFLinkPreviewHelper invalidateElementInfo](self, "invalidateElementInfo");
}

- (void)invalidateElementInfo
{
  id v3;

  if (self->_elementInfo)
  {
    +[_SFQRCodeDetectionController sharedController](_SFQRCodeDetectionController, "sharedController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearCachedElement:", self->_elementInfo);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_SFLinkPreviewHelper invalidateElementInfo](self, "invalidateElementInfo");
  v3.receiver = self;
  v3.super_class = (Class)_SFLinkPreviewHelper;
  -[_SFLinkPreviewHelper dealloc](&v3, sel_dealloc);
}

- (id)makeContextMenuConfiguration
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52___SFLinkPreviewHelper_makeContextMenuConfiguration__block_invoke;
  v4[3] = &unk_1E4AC2E38;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52___SFLinkPreviewHelper_makeContextMenuConfiguration__block_invoke_2;
  v3[3] = &unk_1E4AC2E60;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, v4, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIViewController)previewContentViewController
{
  void *v2;
  id v3;
  void *v4;

  -[_SFLinkPreviewHelper previewViewController](self, "previewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "contentViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return (UIViewController *)v4;
}

- (id)previewViewController
{
  UIViewController *cachedPreviewViewController;
  UIViewController *v4;
  UIViewController *v5;

  cachedPreviewViewController = self->_cachedPreviewViewController;
  if (!cachedPreviewViewController)
  {
    -[_SFLinkPreviewHelper makePreviewViewController](self, "makePreviewViewController");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedPreviewViewController;
    self->_cachedPreviewViewController = v4;

    cachedPreviewViewController = self->_cachedPreviewViewController;
  }
  return cachedPreviewViewController;
}

- (id)makePreviewViewController
{
  _SFQRImagePreviewViewController *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = previewContentForElementInfo(self->_elementInfo);
  switch(v4)
  {
    case 2:
      v2 = -[_SFQRImagePreviewViewController initWithElementInfo:]([_SFQRImagePreviewViewController alloc], "initWithElementInfo:", self->_elementInfo);
      break;
    case 1:
      -[_WKActivatedElementInfo imageURL](self->_elementInfo, "imageURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFLinkPreviewHelper previewViewControllerForURL:](self, "previewViewControllerForURL:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      -[_SFLinkPreviewHelper url](self, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFLinkPreviewHelper previewViewControllerForURL:](self, "previewViewControllerForURL:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v2 = (_SFQRImagePreviewViewController *)v6;

      break;
  }
  return v2;
}

- (id)menuWithSuggestedActions:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  __CFString *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "isAutomationEnabledForLinkPreviewHelper:", self) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[_SFLinkPreviewHelper menuElementsForSuggestedActions:](self, "menuElementsForSuggestedActions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(previewContentForElementInfo(self->_elementInfo) - 1) > 1)
    {
      v8 = &stru_1E4AC8470;
    }
    else
    {
      -[_WKActivatedElementInfo title](self->_elementInfo, "title");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", v8, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)adaptivePreviewViewController:(id)a3 requestLinkPreviewViewControllerWithURL:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  objc_msgSend(WeakRetained, "linkPreviewHelper:previewViewControllerForURL:", self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFLinkPreviewHelper activeLinkPreviewHeader](self, "activeLinkPreviewHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v6);

  return v9;
}

- (double)headerViewHeightForAdaptivePreviewViewController:(id)a3
{
  void *v3;
  double Height;
  double v5;
  CGRect v7;

  -[_SFLinkPreviewHelper activeLinkPreviewHeader](self, "activeLinkPreviewHeader", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v7);
  if (Height == 0.0)
  {
    objc_msgSend(v3, "defaultHeight");
    Height = v5;
  }

  return Height;
}

- (void)adaptivePreviewViewControllerWillDisableLinkPreview:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "linkPreviewHelperWillDisableLinkPreview");

}

- (BOOL)_previewViewControllerIsLinkPreview
{
  void *v2;
  char v3;

  -[_SFLinkPreviewHelper previewViewController](self, "previewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "showingLinkPreview");
  else
    v3 = 0;

  return v3;
}

- (id)previewViewControllerForURL:(id)a3
{
  id v4;
  _SFAdaptivePreviewViewController *v5;
  NSObject *v7;
  void *v8;
  CGFloat Width;
  uint8_t v10[16];

  v4 = a3;
  if ((objc_msgSend(v4, "isTelephonyURL") & 1) != 0
    || (objc_msgSend(v4, "sf_isFacetimeURL") & 1) != 0
    || (objc_msgSend(v4, "safari_isMailtoURL") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "Showing link preview for link on webpage", v10, 2u);
    }
    v5 = -[_SFAdaptivePreviewViewController initWithURL:]([_SFAdaptivePreviewViewController alloc], "initWithURL:", v4);
    -[_SFAdaptivePreviewViewController setDelegate:](v5, "setDelegate:", self);
    if (-[_WKActivatedElementInfo type](self->_elementInfo, "type") == 1)
    {
      -[_WKActivatedElementInfo image](self->_elementInfo, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      -[_SFAdaptivePreviewViewController setPreferredDocumentContentSize:](v5, "setPreferredDocumentContentSize:");

    }
    else
    {
      Width = CGRectGetWidth(self->_windowBounds);
      -[_SFAdaptivePreviewViewController setPreferredDocumentContentSize:](v5, "setPreferredDocumentContentSize:", Width, Width * 1.33333333);
    }
  }

  return v5;
}

- (id)menuElementsForSuggestedActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  WBSAppLink *appLink;
  uint64_t v30;
  WBSAppLink *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id WeakRetained;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id obj;
  _SFLinkPreviewHelper *v70;
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  id v74;
  id v75;
  _QWORD v76[6];
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFLinkPreviewHelper url](self, "url");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  +[_SFQRCodeDetectionController sharedController](_SFQRCodeDetectionController, "sharedController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_elementInfo)
  {
    objc_msgSend(v62, "menuElementsForElementInfo:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    objc_msgSend(v62, "actionForElement:", self->_elementInfo);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", WeakRetained);
    objc_msgSend(v62, "cacheElement:", self->_elementInfo);
    objc_msgSend(v7, "urlThatCanBeOpened");
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v59 = (void *)v8;
  objc_msgSend(WeakRetained, "linkPreviewHelper:resultOfLoadingURL:", self, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v9)
  {
    v70 = self;
    v66 = 0;
    v67 = 0;
    v57 = 0;
    v58 = 0;
    v68 = 0;
    v60 = 0;
    v61 = 0;
    v63 = 0;
    v10 = *(_QWORD *)v90;
    v56 = *MEMORY[0x1E0D8AEE0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v90 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          v14 = (void *)MEMORY[0x1E0CEF6B0];
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "elementActionTypeForUIActionIdentifier:", v15);

          switch(v16)
          {
            case 1:
              v22 = objc_msgSend(v65, "type");
              if (v22 != 3
                || (objc_msgSend(v65, "externalApplication"),
                    v23 = (void *)objc_claimAutoreleasedReturnValue(),
                    v24 = v23 == 0,
                    v23,
                    v24))
              {
                v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", v64);
                appLink = v70->_appLink;
                v70->_appLink = (WBSAppLink *)v28;

                v30 = -[WBSAppLink synchronouslyDecideOpenStrategy](v70->_appLink, "synchronouslyDecideOpenStrategy");
                if ((unint64_t)(v30 - 1) >= 3)
                {
                  if ((unint64_t)(v30 + 1) < 2)
                  {
                    if (v59)
                    {
                      -[_SFLinkPreviewHelper openActionForAlternateURL:](v70, "openActionForAlternateURL:");
                      v43 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v43 = v13;
                    }
                    v48 = v43;

                    if ((unint64_t)(v22 - 1) <= 1)
                    {
                      -[_SFLinkPreviewHelper openInNewTabActionForURL:withTabOrder:preActionHandler:](v70, "openInNewTabActionForURL:withTabOrder:preActionHandler:", v64, 0, 0);
                      v49 = objc_claimAutoreleasedReturnValue();

                      v58 = (void *)v49;
                    }
                    -[_SFLinkPreviewHelper openInTabGroupActionForURL:shouldPerformActionHandler:](v70, "openInTabGroupActionForURL:shouldPerformActionHandler:", v64, 0);
                    v50 = objc_claimAutoreleasedReturnValue();

                    v61 = (void *)v50;
                    -[_SFLinkPreviewHelper openInNewWindowActionForURL:](v70, "openInNewWindowActionForURL:", v64);
                    v51 = objc_claimAutoreleasedReturnValue();

                    v60 = (void *)v51;
                    if ((unint64_t)(v22 - 1) < 2)
                    {
                      -[_SFLinkPreviewHelper downloadActionForURL:](v70, "downloadActionForURL:", v64);
                      v52 = objc_claimAutoreleasedReturnValue();

                      v57 = (void *)v52;
                    }
                    objc_msgSend(v5, "addObject:", v48);
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v58);
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v61);
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v60);
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v57);
                    v63 = v48;
                  }
                }
                else
                {
                  v83 = 0;
                  v84 = &v83;
                  v85 = 0x3032000000;
                  v86 = __Block_byref_object_copy__3;
                  v87 = __Block_byref_object_dispose__3;
                  v88 = 0;
                  v77 = 0;
                  v78 = &v77;
                  v79 = 0x3032000000;
                  v80 = __Block_byref_object_copy__3;
                  v81 = __Block_byref_object_dispose__3;
                  v82 = 0;
                  v31 = v70->_appLink;
                  v76[0] = MEMORY[0x1E0C809B0];
                  v76[1] = 3221225472;
                  v76[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke;
                  v76[3] = &unk_1E4AC2E88;
                  v76[4] = &v83;
                  v76[5] = &v77;
                  -[WBSAppLink getAppLinkAttributesWithCompletionHandler:](v31, "getAppLinkAttributesWithCompletionHandler:", v76);
                  v32 = (void *)MEMORY[0x1E0DC3428];
                  _WBSLocalizedString();
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("safari"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v73[0] = MEMORY[0x1E0C809B0];
                  v73[1] = 3221225472;
                  v73[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_2;
                  v73[3] = &unk_1E4AC2ED8;
                  v73[4] = v70;
                  v74 = v59;
                  v35 = v64;
                  v75 = v35;
                  objc_msgSend(v32, "actionWithTitle:image:identifier:handler:", v33, v34, 0, v73);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v36);

                  if ((unint64_t)(v22 - 1) <= 1)
                  {
                    v72[0] = MEMORY[0x1E0C809B0];
                    v72[1] = 3221225472;
                    v72[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_62;
                    v72[3] = &unk_1E4AC2F00;
                    v72[4] = v70;
                    v37 = (void *)MEMORY[0x1A8598C40](v72);
                    -[_SFLinkPreviewHelper openInNewTabActionForURL:withTabOrder:preActionHandler:](v70, "openInNewTabActionForURL:withTabOrder:preActionHandler:", v35, 0, v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v38);

                    -[_SFLinkPreviewHelper openInTabGroupActionForURL:shouldPerformActionHandler:](v70, "openInTabGroupActionForURL:shouldPerformActionHandler:", v35, v37);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v39);

                    -[_SFLinkPreviewHelper openInNewWindowActionForURL:](v70, "openInNewWindowActionForURL:", v35);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v40);

                  }
                  if (v84[5])
                  {
                    if (objc_msgSend((id)v78[5], "isEqualToString:", v56))
                    {
                      _WBSLocalizedString();
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("arrow.up.forward.appclip"));
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v44 = (void *)MEMORY[0x1E0CB3940];
                      _WBSLocalizedString();
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "stringWithFormat:", v45, v84[5]);
                      v46 = objc_claimAutoreleasedReturnValue();

                      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = (void *)v46;
                    }
                    v71[0] = MEMORY[0x1E0C809B0];
                    v71[1] = 3221225472;
                    v71[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_2_73;
                    v71[3] = &unk_1E4AC2F28;
                    v71[4] = v70;
                    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v41, v42, 0, v71);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "addObject:", v47);

                  }
                  _Block_object_dispose(&v77, 8);

                  _Block_object_dispose(&v83, 8);
                }
              }
              else
              {
                if (objc_msgSend(v64, "safari_isOTPAuthURL"))
                  -[_SFLinkPreviewHelper openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult:](v70, "openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult:", v65);
                else
                  -[_SFLinkPreviewHelper openActionForRedirectToExternalNavigationResult:](v70, "openActionForRedirectToExternalNavigationResult:", v65);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v25);

              }
              break;
            case 2:
              objc_msgSend(v62, "adjustedCopyActionForAction:elementInfo:", v13, v70->_elementInfo);
              v26 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "safari_addObjectUnlessNil:", v26);
              v67 = (void *)v26;
              break;
            case 4:
              objc_msgSend(v65, "URL");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[_SFLinkPreviewHelper addToReadingListActionForURL:](v70, "addToReadingListActionForURL:", v17);
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = (void *)v18;
              if (v18)
                v20 = (void *)v18;
              else
                v20 = v13;
              v21 = v20;

              objc_msgSend(v5, "addObject:", v21);
              v66 = v21;
              break;
            default:
              v27 = v13;

              objc_msgSend(v5, "addObject:", v27);
              v68 = v27;
              break;
          }

        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    }
    while (v9);
  }
  else
  {
    v66 = 0;
    v67 = 0;
    v57 = 0;
    v58 = 0;
    v68 = 0;
    v60 = 0;
    v61 = 0;
    v63 = 0;
  }

  v53 = (void *)objc_msgSend(v5, "copy");
  return v53;
}

- (id)openActionForAlternateURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("safari"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50___SFLinkPreviewHelper_openActionForAlternateURL___block_invoke;
  v11[3] = &unk_1E4AC2F50;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)openActionForRedirectToExternalNavigationResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  objc_msgSend(v4, "externalApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.InCallService")))
  {
    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sf_isFacetimeURL");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.facetime"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;

        v5 = v11;
      }

    }
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D8AEE0]))
  {
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("arrow.up.forward.appclip"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)v17;
  }
  v18 = (void *)MEMORY[0x1E0DC3428];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72___SFLinkPreviewHelper_openActionForRedirectToExternalNavigationResult___block_invoke;
  v22[3] = &unk_1E4AC2F50;
  v22[4] = self;
  v19 = v4;
  v23 = v19;
  objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  objc_msgSend(v4, "externalApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Preferences"));

  v8 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v8, "stringWithFormat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "externalApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_initWeak(&location, self);
  v13 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95___SFLinkPreviewHelper_openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult___block_invoke;
  v18[3] = &unk_1E4AC2F78;
  objc_copyWeak(&v20, &location);
  v15 = v4;
  v19 = v15;
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v10, v14, 0, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v16;
}

- (id)openInNewTabActionForURL:(id)a3 withTabOrder:(int64_t)a4 preActionHandler:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;

  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  v11 = objc_msgSend(WeakRetained, "linkPreviewHelper:supportsAction:forURL:", self, 3, v8);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D4EF68], "effectiveTabOrderWithPreferredTabOrder:", a4);
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3428];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79___SFLinkPreviewHelper_openInNewTabActionForURL_withTabOrder_preActionHandler___block_invoke;
    v17[3] = &unk_1E4AC2FA0;
    v19 = v9;
    v20 = a4;
    v17[4] = self;
    v18 = v8;
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)openInTabGroupActionForURL:(id)a3 shouldPerformActionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if ((objc_msgSend(WeakRetained, "linkPreviewHelper:supportsAction:forURL:", self, 3, v6) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78___SFLinkPreviewHelper_openInTabGroupActionForURL_shouldPerformActionHandler___block_invoke;
    v11[3] = &unk_1E4AC2FC8;
    v14 = v7;
    v11[4] = self;
    v12 = WeakRetained;
    v13 = v6;
    objc_msgSend(v12, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", 0, v13, 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)openInNewWindowActionForURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id WeakRetained;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _SFLinkPreviewHelper *v17;
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsMultipleScenes");

  if ((v6 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(WeakRetained, "isPrivateBrowsingEnabledForPreviewHelper:", self))
    {
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("plus.square.fill");
    }
    else
    {
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("plus.square");
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3428];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52___SFLinkPreviewHelper_openInNewWindowActionForURL___block_invoke;
    v15[3] = &unk_1E4AC2ED8;
    v13 = WeakRetained;
    v16 = v13;
    v17 = self;
    v18 = v4;
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v8, v11, 0, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)addToReadingListActionForURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _SFLinkPreviewHelper *v13;
  id v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if ((objc_msgSend(WeakRetained, "linkPreviewHelper:supportsAction:forURL:", self, 0, v4) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eyeglasses"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53___SFLinkPreviewHelper_addToReadingListActionForURL___block_invoke;
    v11[3] = &unk_1E4AC2ED8;
    v12 = WeakRetained;
    v13 = self;
    v14 = v4;
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v6, v8, 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)downloadActionForURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _SFLinkPreviewHelper *v13;
  id v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if ((objc_msgSend(WeakRetained, "linkPreviewHelper:supportsAction:forURL:", self, 1, v4) & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.down.circle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45___SFLinkPreviewHelper_downloadActionForURL___block_invoke;
    v11[3] = &unk_1E4AC2ED8;
    v12 = WeakRetained;
    v13 = self;
    v14 = v4;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_WKActivatedElementInfo)elementInfo
{
  return self->_elementInfo;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (_SFLinkPreviewHeader)activeLinkPreviewHeader
{
  return (_SFLinkPreviewHeader *)objc_loadWeakRetained((id *)&self->_activeLinkPreviewHeader);
}

- (void)setActiveLinkPreviewHeader:(id)a3
{
  objc_storeWeak((id *)&self->_activeLinkPreviewHeader, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeLinkPreviewHeader);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_elementInfo, 0);
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_fallbackURL, 0);
  objc_storeStrong((id *)&self->_cachedPreviewViewController, 0);
  objc_storeStrong((id *)&self->_appLink, 0);
}

@end
