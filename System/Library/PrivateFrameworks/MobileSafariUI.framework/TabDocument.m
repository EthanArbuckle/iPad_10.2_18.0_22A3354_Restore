@implementation TabDocument

- (BOOL)_tryRetain
{
  unint64_t *p_retainCount;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unint64_t v6;

  p_retainCount = (unint64_t *)&self->_retainCount;
  while (1)
  {
    v3 = *p_retainCount;
    v4 = (*p_retainCount & 1) != 0 || v3 == -2;
    result = !v4;
    if (v4)
      break;
    if (v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr(p_retainCount);
      if (v6 != v3)
        break;
      if (!__stlxr(v3 + 2, p_retainCount))
        return result;
    }
    __clrex();
  }
  return result;
}

- (BOOL)_isDeallocating
{
  int64_t retainCount;

  retainCount = self->_retainCount;
  if (retainCount == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (retainCount <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = retainCount & 1;
  }
  return (char)self;
}

- (BOOL)isInteractivelyInserted
{
  return self->_interactivelyInserted;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (TabDocumentView)view
{
  TabDocumentView *cachedView;
  TabDocumentView *v4;
  TabDocumentView *v5;

  cachedView = self->_cachedView;
  if (!cachedView)
  {
    -[TabDocument createTabDocumentView](self, "createTabDocumentView");
    v4 = (TabDocumentView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedView;
    self->_cachedView = v4;

    -[TabDocument updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
    -[TabDocumentView setReaderWebView:](self->_cachedView, "setReaderWebView:", self->_readerWebView);
    -[TabDocumentView setWebView:](self->_cachedView, "setWebView:", self->_webView);
    cachedView = self->_cachedView;
  }
  return cachedView;
}

- (void)release
{
  int64_t *p_retainCount;
  uint64_t v4;
  int v5;
  unint64_t v6;

  p_retainCount = &self->_retainCount;
  do
    v4 = __ldaxr((unint64_t *)p_retainCount);
  while (__stlxr(v4 - 2, (unint64_t *)p_retainCount));
  if (v4 <= 0)
  {
    if (v4 < 0)
    {
LABEL_13:
      __break(1u);
    }
    else
    {
      v5 = __30__TabDocument_NonARC__release__block_invoke();
      do
      {
        v6 = __ldaxr((unint64_t *)p_retainCount);
        if (v6 != -2)
        {
          __clrex();
          goto LABEL_13;
        }
      }
      while (__stlxr(1uLL, (unint64_t *)p_retainCount));
      if (v5 == 2)
      {
        dispatch_barrier_async_f(MEMORY[0x1E0C80D38], self, MEMORY[0x1E0DE7980]);
      }
      else
      {
        if (v5 != 1)
          goto LABEL_13;
        -[TabDocument dealloc](self, "dealloc");
      }
    }
  }
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (TabDocument)retain
{
  int64_t *p_retainCount;
  uint64_t v3;

  p_retainCount = &self->_retainCount;
  do
    v3 = __ldaxr((unint64_t *)p_retainCount);
  while (__stlxr(v3 + 2, (unint64_t *)p_retainCount));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (_SFReloadOptionsController)reloadOptionsController
{
  return self->_reloadOptionsController;
}

- (id)createTabDocumentView
{
  return objc_alloc_init(TabDocumentView);
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (WBSFluidProgressState)progressState
{
  return self->_fluidProgressState;
}

- (SFWebExtensionsController)webExtensionsController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  +[Application sharedApplication](Application, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_SFBrowserConfiguration isPrivateBrowsingEnabled](self->_configuration, "isPrivateBrowsingEnabled");
  -[TabDocument profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webExtensionsControllerForTabWithPrivateBrowsingEnabled:profile:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFWebExtensionsController *)v6;
}

- (WBProfile)profile
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "effectiveProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBProfile *)v3;
}

- (id)_titleIncludeLoading:(int)a3 allowURLStringFallback:(int)a4 allowUntitled:
{
  id *v4;
  id v5;
  void *v9;
  id *v10;
  id WeakRetained;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v4 = a1;
  if (a1)
  {
    v5 = a1[23];
    if (v5)
    {
      objc_msgSend(v5, "safari_userVisibleHost");
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    -[TabDocument _loadedTitle](v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = v9;
LABEL_11:
      v4 = v10;
LABEL_12:

      return v4;
    }
    if ((objc_msgSend(v4[126], "isLoading") & a2 & 1) != 0)
      goto LABEL_10;
    WeakRetained = objc_loadWeakRetained(v4 + 117);
    objc_msgSend(WeakRetained, "userActivityController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tabDocumentPendingUserActivityPayload");
    v13 = (id *)objc_claimAutoreleasedReturnValue();

    if (v13 == v4)
    {
LABEL_10:
      _WBSLocalizedString();
      v10 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v4[126], "_committedURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "safari_isSafariWebExtensionURL"))
    {
      objc_msgSend(v4, "webExtensionsController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "host");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "webExtensionForBaseURIHost:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "displayName");
      v4 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!a3 || (objc_msgSend(v4, "URLString"), v19 = (void *)objc_claimAutoreleasedReturnValue(), (v15 = v19) == 0))
      {
        if (a4)
        {
          -[TabDocument _blankTabTitle](v4);
          v4 = (id *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = (id *)&stru_1E9CFDBB0;
        }
        goto LABEL_21;
      }
      objc_msgSend(v19, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", URLSimplificationOptionsForTabTitle, 1, 0);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    goto LABEL_12;
  }
  return v4;
}

- (id)_loadedTitle
{
  id *v1;
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(a1[101], "length"))
    {
      v2 = v1[101];
    }
    else
    {
      objc_msgSend(v1[20], "title");
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v2;
    if (objc_msgSend(v2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("DebugOverrideTabTitleWithMatchingBookmark"));

      if ((v5 & 1) != 0)
      {
        -[TabDocument _debugOverrideTitle](v1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "length"))
          v7 = v6;
        else
          v7 = v3;
        v1 = v7;

      }
      else
      {
        v1 = v3;
      }
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (id)_blankTabTitle
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)objc_opt_class();
    objc_msgSend(a1, "libraryType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "blankTabTitleWithLibraryType:controlledByAutomation:", v3, objc_msgSend(a1, "isControlledByAutomation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)libraryType
{
  return self->_libraryType;
}

+ (id)blankTabTitleWithLibraryType:(id)a3 controlledByAutomation:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
    startPageTitleForCollectionType(v4);
  else
    _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isControlledByAutomation
{
  return -[_SFBrowserConfiguration isControlledByAutomation](self->_configuration, "isControlledByAutomation");
}

- (void)updateThemeColorAndUnderPageBackground:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIColor *themeColor;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  UIColor *v14;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[TabDocument activeWebView](self, "activeWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x1E0D4F118]))
  {

LABEL_7:
    objc_msgSend(v5, "setUnderPageBackgroundColor:", 0);
    themeColor = self->_themeColor;
    self->_themeColor = 0;
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "tabBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "displayMode");

  if (v8 == 2
    || -[TabDocument isShowingSystemStartPage](self, "isShowingSystemStartPage")
    || -[TabDocument isPDFDocument](self, "isPDFDocument")
    || -[_SFBrowserConfiguration isControlledByAutomation](self->_configuration, "isControlledByAutomation")|| -[TabDocument inElementFullscreen](self, "inElementFullscreen"))
  {
    goto LABEL_7;
  }
  objc_msgSend(WeakRetained, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "usingLoweredBar") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[_SFBrowserConfiguration traitEnvironment](self->_configuration, "traitEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "userInterfaceStyle") == 2;

  }
  objc_msgSend(MEMORY[0x1E0D8AD30], "updateThemeColorForWebView:darkModeEnabled:allowFallbackColors:updateUnderPageBackgroundColor:", v5, v11, 1, v3);
  v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
  themeColor = self->_themeColor;
  self->_themeColor = v14;
LABEL_8:

}

- (_SFWebView)activeWebView
{
  if (-[TabDocument isShowingReader](self, "isShowingReader"))
    -[TabDocument readerWebView](self, "readerWebView");
  else
    -[TabDocument webView](self, "webView");
  return (_SFWebView *)(id)objc_claimAutoreleasedReturnValue();
}

- (_SFWebView)webView
{
  return self->_webView;
}

- (BOOL)isShowingSystemStartPage
{
  if (self->_isBlank && !-[TabDocument isLoading](self, "isLoading"))
    return !-[TabDocument isShowingStartPageOverriddenByExtension](self, "isShowingStartPageOverriddenByExtension");
  else
    return 0;
}

- (BOOL)isLoading
{
  return self->_webViewIsLoading;
}

+ (id)tabDocumentForWKWebView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  webViewToTabDocumentMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)inElementFullscreen
{
  if (-[TabDocument isExitingElementFullscreen](self, "isExitingElementFullscreen"))
    return 1;
  else
    return -[_SFWebView _isInFullscreen](self->_webView, "_isInFullscreen");
}

- (BOOL)isExitingElementFullscreen
{
  return self->_exitingElementFullscreen;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (UnifiedTabBarItem)unifiedTabBarItem
{
  return self->_unifiedTabBarItem;
}

- (TabOverviewItem)tabOverviewItem
{
  return self->_tabOverviewItem;
}

- (TabBarItem)tabBarItem
{
  return self->_tabBarItem;
}

- (id)_addTitlePrefixToString:(id *)a1
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("DebugShowTabMetadata"));
    v6 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0D8AFA8]);
    if (((v5 | v6) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v8 = a1[126];
        v9 = v8;
        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("p%d"), objc_msgSend(v8, "_webProcessIdentifier"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v10);

        }
        else
        {
          objc_msgSend(v7, "addObject:", CFSTR("p?"));
        }

      }
      if (v6)
      {
        WeakRetained = objc_loadWeakRetained(a1 + 117);
        objc_msgSend(WeakRetained, "tabController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tabOrderManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "simplifiedIdentifierForDisplayInTabTitle:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "ancestorTabIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __39__TabDocument__addTitlePrefixToString___block_invoke;
        v23[3] = &unk_1E9CF9198;
        v18 = v14;
        v24 = v18;
        objc_msgSend(v17, "safari_mapObjectsUsingBlock:", v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("t%@ {%@}"), v16, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v21);

      }
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v3;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateTabTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  LinkPreviewViewController *linkPreviewViewController;
  void *v8;
  id v9;

  -[TabDocumentCollectionItem title](self->_tabCollectionItem, "title");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_displayingStandaloneImage)
  {
    v3 = 0;
  }
  else
  {
    -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((id *)&self->super.isa, 0, 1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TabDocument _addTitlePrefixToString:]((id *)&self->super.isa, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabOverviewItem setTitle:](self->_tabOverviewItem, "setTitle:", v4);
  -[TabDocumentCollectionItem setTitle:](self->_tabCollectionItem, "setTitle:", v4);
  -[TabDocument tabBarTitle]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _addTitlePrefixToString:]((id *)&self->super.isa, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabBarItem setTitle:](self->_tabBarItem, "setTitle:", v6);
  -[UnifiedTabBarItem setTitle:](self->_unifiedTabBarItem, "setTitle:", v6);
  -[TabBarItem updateEntityAnnotation](self->_tabBarItem, "updateEntityAnnotation");
  -[SFUnifiedTabBarItem updateEntityAnnotation](self->_unifiedTabBarItem, "updateEntityAnnotation");
  linkPreviewViewController = self->_linkPreviewViewController;
  -[TabDocument URLString](self, "URLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LinkPreviewViewController updatePreviewLoadingUIWithURLString:](linkPreviewViewController, "updatePreviewLoadingUIWithURLString:", v8);

  -[TabDocument _titleForWebExtensionsMayHaveChanged](self);
  -[TabDocument _URLForWebExtensionsMayHaveChanged]((id *)&self->super.isa);
  if ((WBSIsEqual() & 1) == 0)
    -[TabDocument _notifyDidUpdateTabCollectionItem]((id *)&self->super.isa);

}

- (id)tabBarTitle
{
  if (a1)
  {
    -[TabDocument _titleIncludeLoading:allowURLStringFallback:]((id *)a1, 1, *(unsigned __int8 *)(a1 + 679));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (id)_titleIncludeLoading:(int)a3 allowURLStringFallback:
{
  if (a1)
  {
    -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:](a1, a2, a3, 1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_titleForWebExtensionsMayHaveChanged
{
  uint64_t v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "tabTitle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 != (id)a1[173] && (objc_msgSend(v4, "isEqualToString:") & 1) == 0)
    {
      v2 = objc_msgSend(v4, "copy");
      v3 = (void *)a1[173];
      a1[173] = v2;

      objc_msgSend(a1, "setChangedPropertiesForOnUpdatedWebExtensionEvent:", objc_msgSend(a1, "changedPropertiesForOnUpdatedWebExtensionEvent") | 1);
    }

  }
}

- (NSString)tabTitle
{
  TabDocument *v2;

  v2 = self;
  if (-[TabDocument isHibernated](self, "isHibernated"))
    v2 = (TabDocument *)v2->_loadingController;
  -[TabDocument title](v2, "title");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)urlForExtensions
{
  if (-[TabDocument isHibernated](self, "isHibernated"))
    -[LoadingController URL](self->_loadingController, "URL");
  else
    -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isHibernated
{
  return self->_hibernated;
}

- (void)_URLForWebExtensionsMayHaveChanged
{
  id v2;
  id obj;

  if (a1)
  {
    objc_msgSend(a1, "urlForExtensions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = a1[174];
    if ((WBSIsEqual() & 1) == 0)
    {
      objc_storeStrong(a1 + 174, obj);
      objc_msgSend(a1, "setChangedPropertiesForOnUpdatedWebExtensionEvent:", objc_msgSend(a1, "changedPropertiesForOnUpdatedWebExtensionEvent") | 2);
      objc_msgSend(a1, "validateExtensionToolbarItems");
    }

  }
}

- (void)_notifyDidUpdateTabCollectionItem
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    WeakRetained = objc_loadWeakRetained(a1 + 117);
    objc_msgSend(WeakRetained, "tabCollectionViewProvider", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tabCollectionViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(a1, "itemForTabCollectionView:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "didUpdateItem:", v9);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    v10 = objc_loadWeakRetained(a1 + 149);
    objc_msgSend(v10, "tabDocumentDidUpdateTabCollectionItem:", a1);

  }
}

- (void)updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:(BOOL)a3
{
  uint64_t v4;

  v4 = -[TabDocument _usageStateIfTabDocumentIsCurrent:]((uint64_t)self, a3);
  -[TabDocument _updateUsageTrackingInformationIfNecessaryToState:]((uint64_t)self, v4);
}

- (uint64_t)_usageStateIfTabDocumentIsCurrent:(uint64_t)a1
{
  uint64_t v2;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    v5 = WeakRetained;
    if (a2 && (objc_msgSend(WeakRetained, "isSuspendedOrSuspending") & 1) == 0)
    {
      v2 = 2;
    }
    else
    {
      objc_msgSend(v5, "tabDocumentPlayingPIPVideo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = 2 * (v6 == (void *)v2);

    }
  }
  return v2;
}

- (void)_updateUsageTrackingInformationIfNecessaryToState:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;

  if (a1 && -[TabDocument _shouldUpdateUsageTrackingWhenTransitioningToState:](a1, a2))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend((id)a1, "expectedOrCurrentURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument profileIdentifier](a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 232))
    {
      if ((objc_msgSend(v4, "isEqual:") & 1) == 0)
      {
        objc_msgSend(WeakRetained, "digitalHealthManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 232);
        objc_msgSend((id)a1, "sourceApplicationBundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "updateUsageTrackingForURL:withBundleIdentifier:profileIdentifier:toState:", v7, v8, v5, 0);

      }
    }
    *(_QWORD *)(a1 + 224) = a2;
    objc_storeStrong((id *)(a1 + 232), v4);
    objc_msgSend(WeakRetained, "digitalHealthManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "sourceApplicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateUsageTrackingForURL:withBundleIdentifier:profileIdentifier:toState:", v4, v10, v5, a2);

  }
}

- (uint64_t)_shouldUpdateUsageTrackingWhenTransitioningToState:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  id WeakRetained;
  char v8;
  char v9;
  int v10;
  int v11;

  v3 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "expectedOrCurrentURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v3, "isPrivateBrowsingEnabled") & 1) != 0
      || (objc_msgSend((id)v3, "isShowingErrorPage") & 1) != 0)
    {
      v3 = 0;
LABEL_20:

      return v3;
    }
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 1192));
    v8 = objc_msgSend(WeakRetained, "tabDocumentIsBackgroundPreloading:", v3);
    if (v6)
      v9 = v8;
    else
      v9 = 1;
    if ((v9 & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      v10 = objc_msgSend(v5, "isWebFilterEnabled");
      if (v10
        && (objc_msgSend(v5, "userSettings"),
            v2 = (void *)objc_claimAutoreleasedReturnValue(),
            !objc_msgSend(v2, "contentFilterListsAllowURL:", v6)))
      {
        v3 = 0;
      }
      else
      {
        if (*(_QWORD *)(v3 + 224) == a2)
          v11 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(v3 + 232));
        else
          v11 = 0;
        v3 = v11 ^ 1u;
        if (!v10)
          goto LABEL_19;
      }

    }
LABEL_19:

    goto LABEL_20;
  }
  return v3;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return -[_SFBrowserConfiguration isPrivateBrowsingEnabled](self->_configuration, "isPrivateBrowsingEnabled");
}

- (NSURL)expectedOrCurrentURL
{
  return (NSURL *)-[_SFWebView URL](self->_webView, "URL");
}

- (id)titleForSharing
{
  void *v3;

  if (-[TabDocument isShowingErrorPage](self, "isShowingErrorPage"))
  {
    v3 = 0;
  }
  else
  {
    -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((id *)&self->super.isa, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isShowingErrorPage
{
  BOOL v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = -[TabDocument hasQuickLookContent](self, "hasQuickLookContent");
  if (!v3)
  {
    -[_SFWebView _unreachableURL](self->_webView, "_unreachableURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
LABEL_9:

      return v5;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_SFWebView _safeBrowsingWarning](self->_webView, "_safeBrowsingWarning");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

    if (v3)
      return v5;
    goto LABEL_8;
  }
  v5 = 0;
  if (!v3)
  {
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  return v5;
}

- (BOOL)hasQuickLookContent
{
  void *v2;
  BOOL v3;

  -[TabDocument quickLookDocument](self, "quickLookDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SFQuickLookDocument)quickLookDocument
{
  _BOOL4 quickLookDocumentCheckCompleted;
  SFQuickLookDocument *quickLookDocument;
  SFQuickLookDocument *v6;
  SFQuickLookDocument *v7;
  SFQuickLookDocument *v8;
  SFQuickLookDocument *v9;
  void *v10;
  id v11;
  SFQuickLookDocument *v12;
  SFQuickLookDocument *v13;
  SFQuickLookDocument *v14;
  SFQuickLookDocument *v15;
  void *v16;

  quickLookDocumentCheckCompleted = self->_quickLookDocumentCheckCompleted;
  quickLookDocument = self->_quickLookDocument;
  if (!quickLookDocumentCheckCompleted && quickLookDocument == 0)
  {
    self->_quickLookDocumentCheckCompleted = 1;
    -[SFQuickLookDocumentWriter quickLookDocument](self->_quickLookDocumentWriter, "quickLookDocument");
    v6 = (SFQuickLookDocument *)objc_claimAutoreleasedReturnValue();
    v7 = self->_quickLookDocument;
    self->_quickLookDocument = v6;

    v8 = self->_quickLookDocument;
    if (!v8
      || (-[TabDocument setQuickLookDocumentForCurrentBackForwardListItem:]((uint64_t)self, v8),
          (v9 = self->_quickLookDocument) == 0))
    {
      if (-[TabDocument isPDFDocument](self, "isPDFDocument"))
      {
        -[TabDocument suggestedFilenameForDisplayedPDF](self, "suggestedFilenameForDisplayedPDF");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc(MEMORY[0x1E0D4ED18]);
        v12 = (SFQuickLookDocument *)objc_msgSend(v11, "initWithFileName:mimeType:uti:needsQuickLookDocumentView:", v10, 0, *MEMORY[0x1E0CA5C00], 0);
        v13 = self->_quickLookDocument;
        self->_quickLookDocument = v12;

      }
      v9 = self->_quickLookDocument;
      if (!v9)
      {
        -[TabDocument quickLookDocumentForCurrentBackForwardListItem]((uint64_t)self);
        v14 = (SFQuickLookDocument *)objc_claimAutoreleasedReturnValue();
        v15 = self->_quickLookDocument;
        self->_quickLookDocument = v14;

        v9 = self->_quickLookDocument;
      }
    }
    -[TabDocument urlForSharing](self, "urlForSharing");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocument setSourceURL:](v9, "setSourceURL:", v16);

    -[SFQuickLookDocument setDocumentSource:](self->_quickLookDocument, "setDocumentSource:", self);
    quickLookDocument = self->_quickLookDocument;
  }
  return quickLookDocument;
}

- (NSURL)urlForSharing
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[TabDocument URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument customUserVisibleStringForReadingListBookmarkURL:](self, "customUserVisibleStringForReadingListBookmarkURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  -[TabDocument titleForSharing](self, "titleForSharing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "_setTitle:", v6);

  return (NSURL *)v3;
}

- (NSString)URLString
{
  uint64_t v3;
  void *v4;
  _SFDownload *activeDownload;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (self->_webView
    && (-[WBSURLSpoofingMitigator UIShouldReflectCommittedURLInsteadOfCurrentURL](self->_URLSpoofingMitigator, "UIShouldReflectCommittedURLInsteadOfCurrentURL") & 1) != 0)
  {
    -[_SFWebView _committedURL](self->_webView, "_committedURL");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LoadingController URL](self->_loadingController, "URL");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  if (!v3)
  {
    activeDownload = self->_activeDownload;
    if (activeDownload)
    {
      -[_SFDownload sourceURL](activeDownload, "sourceURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  -[TabDocument customUserVisibleStringForReadingListBookmarkURL:](self, "customUserVisibleStringForReadingListBookmarkURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "safari_userVisibleStringConsideringLongURLs");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return (NSString *)v9;
}

- (id)customUserVisibleStringForReadingListBookmarkURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isFileURL")
    && -[TabDocument readingListBookmarkID](self, "readingListBookmarkID"))
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bookmarkWithID:", -[TabDocument readingListBookmarkID](self, "readingListBookmarkID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isShowingStartPageOverriddenByExtension
{
  void *v3;
  void *v4;
  char v5;

  -[TabDocument URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  extensionOverridenStartPageURLForTab(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)URL
{
  return -[LoadingController URL](self->_loadingController, "URL");
}

- (BOOL)isPDFDocument
{
  return -[_SFWebView _isDisplayingPDF](self->_webView, "_isDisplayingPDF");
}

- (unint64_t)changedPropertiesForOnUpdatedWebExtensionEvent
{
  return self->_changedPropertiesForOnUpdatedWebExtensionEvent;
}

- (BOOL)isBlank
{
  return self->_isBlank;
}

- (SFNavigationBarItem)navigationBarItem
{
  SFNavigationBarItem *navigationBarItem;
  SFNavigationBarItem *v4;
  SFNavigationBarItem *v5;
  float v6;
  _BOOL8 v7;

  navigationBarItem = self->_navigationBarItem;
  if (!navigationBarItem)
  {
    v4 = (SFNavigationBarItem *)objc_alloc_init(MEMORY[0x1E0D4ECD8]);
    v5 = self->_navigationBarItem;
    self->_navigationBarItem = v4;

    -[TabDocument _setUpNavigationBarItem]((uint64_t)self);
    -[LoadingController estimatedProgress](self->_loadingController, "estimatedProgress");
    v7 = v6 < 1.0 && v6 > 0.0;
    -[SFNavigationBarItem setStopReloadButtonShowsStop:](self->_navigationBarItem, "setStopReloadButtonShowsStop:", v7);
    -[TabDocument _updateNavigationBarItem]((uint64_t)self);
    -[SFNavigationBarItem setShowsStopReloadButtons:](self->_navigationBarItem, "setShowsStopReloadButtons:", !self->_isBlank);
    navigationBarItem = self->_navigationBarItem;
  }
  return navigationBarItem;
}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D4EED8], "sharedManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarItem setShowsVoiceSearchButton:](self->_navigationBarItem, "setShowsVoiceSearchButton:", objc_msgSend(v4, "availability") != 0);

}

- (uint64_t)_setUpNavigationBarItem
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 272), "setFluidProgressController:", *(_QWORD *)(result + 168));
    objc_msgSend(*(id *)(v1 + 272), "setFluidProgressStateSource:", v1);
    v2 = *(void **)(v1 + 1048);
    if (v2)
      objc_msgSend(v2, "setNavigationBarItem:", *(_QWORD *)(v1 + 272));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v1, sel__voiceSearchAvailabilityDidChange_, *MEMORY[0x1E0D4F360], 0);

    return objc_msgSend((id)v1, "_voiceSearchAvailabilityDidChange:", 0);
  }
  return result;
}

- (void)updateAccessibilityIdentifier
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  id WeakRetained;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("UUID");
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("IsPrivate");
  if (-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  if (self->_didFirstLayout)
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v13[1] = v4;
  v13[2] = v5;
  v12[2] = CFSTR("IsPageLoaded");
  v12[3] = CFSTR("InReaderMode");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (objc_msgSend(WeakRetained, "isShowingReader"))
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  v13[3] = v7;
  v12[4] = CFSTR("WebViewProcessID");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), (int)-[_SFWebView _webProcessIdentifier](self->_webView, "_webProcessIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  v12[5] = CFSTR("IsLoadedUsingDesktopUserAgent");
  if (-[_SFReloadOptionsController loadedUsingDesktopUserAgent](self->_reloadOptionsController, "loadedUsingDesktopUserAgent"))v9 = CFSTR("true");
  else
    v9 = CFSTR("false");
  v13[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocumentView setAccessibilityIdentifier:](self->_cachedView, "setAccessibilityIdentifier:", v11);

}

- (NSString)title
{
  return (NSString *)-[TabDocument _titleIncludeLoading:allowURLStringFallback:]((id *)&self->super.isa, 1, 0);
}

- (BOOL)didFinishDocumentLoad
{
  return self->_didFinishDocumentLoad;
}

- (History)history
{
  History *history;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  History *v11;
  History *v12;
  History *v13;
  NSObject *v14;
  History *v15;
  History *v16;
  History *v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  history = self->_history;
  if (history)
    return history;
  -[TabDocument profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument history].cold.2(v8, (uint64_t)v6, v18, v7);
  }

  +[Application sharedApplication](Application, "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "historyController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "historyForProfileIdentifier:loadIfNeeded:", v6, 1);
  v11 = (History *)objc_claimAutoreleasedReturnValue();
  v12 = self->_history;
  self->_history = v11;

  v13 = self->_history;
  if (!v13)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[TabDocument history].cold.1();
    +[History sharedHistory](History, "sharedHistory");
    v15 = (History *)objc_claimAutoreleasedReturnValue();
    v16 = self->_history;
    self->_history = v15;

    v13 = self->_history;
  }
  v17 = v13;

  return v17;
}

- (void)displayNewTabOverridePageIfNecessary
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  id v8;

  if (!-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
    goto LABEL_3;
  -[TabDocument webExtensionsController](self, "webExtensionsController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabOverridePreferencesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "shouldNewTabPageOverriddenByAnEnabledExtensionApplyInPrivateBrowsingWithUserDefaults:", v4);

  if ((v5 & 1) != 0)
  {
LABEL_3:
    extensionOverridenStartPageURLForTab(self);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      v6 = -[TabDocument loadURL:userDriven:](self, "loadURL:userDriven:", v8, 0);

  }
}

- (void)setIsBlank:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  id WeakRetained;

  if (self->_isBlank != a3)
  {
    self->_isBlank = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if (self->_isBlank)
    {
      v4 = 0;
    }
    else
    {
      -[TabDocument _clearLibraryType]((uint64_t)self);
      objc_msgSend(WeakRetained, "updateFirstResponderOrFocus");
      v4 = !self->_isBlank;
    }
    -[SFNavigationBarItem setShowsStopReloadButtons:](self->_navigationBarItem, "setShowsStopReloadButtons:", v4);
    if (self->_hasBeenInserted)
    {
      objc_msgSend(WeakRetained, "tabController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateLocalTabGroupTitle");

    }
  }
}

- (void)setHasBeenInserted:(BOOL)a3
{
  self->_hasBeenInserted = a3;
}

void __29__TabDocument_tabUpdateBlock__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 919) && !*((_BYTE *)WeakRetained + 753))
    {
      objc_msgSend(v8, "setPinned:title:url:", *((unsigned __int8 *)WeakRetained + 895), WeakRetained[136], WeakRetained[137]);
    }
    else
    {
      *((_BYTE *)WeakRetained + 753) = 0;
      -[TabDocument _localAttributes](WeakRetained);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLocalAttributes:", v5);

      -[TabDocument _titleForStatePersistingForTabGroupTab](v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLForStatePersisting");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (*((_BYTE *)v4 + 677))
        {
          objc_msgSend(v8, "setLocalTitle:", v6);
          objc_msgSend(v8, "setLocalURL:", v7);
        }
        else if (!*((_BYTE *)v4 + 919))
        {
          objc_msgSend(v8, "setTitle:", v6);
          objc_msgSend(v8, "setUrl:", v7);
        }
      }
      objc_msgSend(v8, "setPinned:title:url:", *((unsigned __int8 *)v4 + 895), v4[136], v4[137]);

    }
  }

}

- (WBTab)wbTab
{
  return self->_tabGroupTab;
}

- (NSString)uuidString
{
  return -[NSUUID UUIDString](self->_uuid, "UUIDString");
}

- (id)tabUpdateBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__TabDocument_tabUpdateBlock__block_invoke;
  v4[3] = &unk_1E9CF8D18;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_createDocumentViewWithConfiguration:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend((id)a1, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceStyle") == 2)
    {
      objc_msgSend(v6, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceIdiom") == 6;

    }
    else
    {
      v9 = 1;
    }

    objc_msgSend(v3, "_setDrawsBackground:", v9);
    v10 = objc_alloc(MEMORY[0x1E0CD5800]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v12 = objc_msgSend(v10, "initWithFrame:configuration:", v3);
    v13 = *(void **)(a1 + 1008);
    *(_QWORD *)(a1 + 1008) = v12;

    v14 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 1008);
      v51 = 134218240;
      v52 = a1;
      v53 = 2048;
      v54 = v15;
      _os_log_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_DEFAULT, "TabDocument %p: created web view %p", (uint8_t *)&v51, 0x16u);
    }
    webViewToTabDocumentMap();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", a1, *(_QWORD *)(a1 + 1008));

    objc_msgSend(*(id *)(a1 + 216), "setReaderWebView:", *(_QWORD *)(a1 + 1360));
    objc_msgSend(*(id *)(a1 + 216), "setWebView:", *(_QWORD *)(a1 + 1008));
    objc_msgSend(*(id *)(a1 + 1008), "setAllowsLinkPreview:", 1);
    objc_msgSend(*(id *)(a1 + 1008), "_setObservedRenderingProgressEvents:", 335);
    objc_msgSend(*(id *)(a1 + 160), "setWebView:", *(_QWORD *)(a1 + 1008));
    objc_msgSend(*(id *)(a1 + 1008), "setNavigationDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1008), "setUIDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1008), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1008), "_setFullscreenDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1008), "_setInputDelegate:", a1);
    v17 = *(void **)(a1 + 1008);
    objc_msgSend((id)a1, "history");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setHistoryDelegate:", v18);

    objc_msgSend(*(id *)(a1 + 1008), "_setIconLoadingDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1008), "_setDiagnosticLoggingDelegate:", a1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 1008), "_setAppHighlightDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1008), "_setFindInteractionEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 1008), "setAccessibilityIdentifier:", CFSTR("WebView"));
    objc_msgSend(*(id *)(a1 + 1008), "setInspectable:", objc_msgSend((id)a1, "allowsRemoteInspection"));
    _SFCustomUserAgentStringIfNeeded();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(*(id *)(a1 + 1008), "setCustomUserAgent:", v19);

    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("URL"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("estimatedProgress"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("_networkRequestsInProgress"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("hasOnlySecureContent"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("_negotiatedLegacyTLS"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("title"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("canGoBack"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("canGoForward"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("_webProcessIsResponsive"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("loading"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("themeColor"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("underPageBackgroundColor"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("_sampledPageTopColor"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "addObserver:forKeyPath:options:context:", a1, CFSTR("_isPlayingAudio"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1008), "_setBackgroundExtendsBeyondPage:", 1);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD56C8]), "initWithWebView:delegate:", *(_QWORD *)(a1 + 1008), a1);
    v21 = *(void **)(a1 + 1224);
    *(_QWORD *)(a1 + 1224) = v20;

    objc_msgSend(*(id *)(a1 + 1224), "setMetadataCorrectionsEnabled:", 1);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD5770]), "initWithWebView:", *(_QWORD *)(a1 + 1008));
    v23 = *(void **)(a1 + 288);
    *(_QWORD *)(a1 + 288) = v22;

    objc_msgSend(*(id *)(a1 + 288), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 288), "setWebViewUIDelegate:", a1);
    objc_msgSend(v6, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceStyle");
    objc_msgSend(*(id *)(a1 + 288), "configurationManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDarkModeEnabled:", v25 == 2);

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1F01CD268);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v27;

    objc_msgSend(*(id *)(a1 + 1008), "_remoteObjectRegistry");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerExportedObject:interface:", a1, *(_QWORD *)(a1 + 64));

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1F01CCEC8);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v30;

    objc_msgSend(*(id *)(a1 + 1008), "_remoteObjectRegistry");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "registerExportedObject:interface:", a1, *(_QWORD *)(a1 + 72));

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD5730]), "initWithWebView:", *(_QWORD *)(a1 + 1008));
    v34 = *(void **)(a1 + 1248);
    *(_QWORD *)(a1 + 1248) = v33;

    objc_msgSend(*(id *)(a1 + 1248), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1248), "setDialogPresenter:", a1);
    v35 = objc_alloc(MEMORY[0x1E0CD5788]);
    v36 = *(_QWORD *)(a1 + 1008);
    objc_msgSend((id)a1, "activityJSController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "perSitePreferencesVendor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "requestDesktopSitePreferenceManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v35, "initWithWebView:activityJSController:perSitePreferenceManager:", v36, v37, v39);
    v41 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v40;

    objc_msgSend(*(id *)(a1 + 88), "setTryUsingMobileIfPossible:", objc_msgSend(WeakRetained, "isShowingInOneThirdMode"));
    objc_msgSend(*(id *)(a1 + 1008), "URL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "setSupportsAdvancedPrivacyProtections:", objc_msgSend((id)a1, "supportsAdvancedPrivacyProtectionsForURL:", v42));

    objc_msgSend(*(id *)(a1 + 640), "setReloadOptionsController:", *(_QWORD *)(a1 + 88));
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD5678]), "initWithWebView:", *(_QWORD *)(a1 + 1008));
    v44 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v43;

    v45 = objc_alloc_init(MEMORY[0x1E0D4EC68]);
    v46 = *(void **)(a1 + 280);
    *(_QWORD *)(a1 + 280) = v45;

    objc_msgSend(*(id *)(a1 + 280), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 280), "setDialogPresenter:", *(_QWORD *)(a1 + 1008));
    objc_msgSend(*(id *)(a1 + 280), "setViewControllerPresenter:", a1);
    v47 = objc_alloc_init(MEMORY[0x1E0CD5760]);
    v48 = *(void **)(a1 + 1328);
    *(_QWORD *)(a1 + 1328) = v47;

    objc_msgSend(*(id *)(a1 + 1328), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1328), "setWebView:", *(_QWORD *)(a1 + 1008));
    objc_msgSend(*(id *)(a1 + 1328), "setReaderController:", *(_QWORD *)(a1 + 288));
    objc_msgSend(*(id *)(a1 + 1328), "setDialogPresenter:", a1);
    objc_msgSend((id)a1, "updateAccessibilityIdentifier");
    +[Application sharedApplication](Application, "sharedApplication");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "systemNoteTakingController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "addObserver:forKeyPath:options:context:", a1, *MEMORY[0x1E0D8B188], 0, kTabDocumentObserverContext);
  }

}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  __int16 v4;
  id v6;
  LinkPreviewViewController *linkPreviewViewController;
  void *v8;
  NSURL *v9;
  NSURL *urlForDisplayedContent;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _BOOL4 didFirstMeaningfulPaint;
  NSHashTable *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id WeakRetained;
  SFPinnableBanner *appBannerPendingFirstPaint;
  SFPinnableBanner *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((v4 & 4) != 0)
    -[WBSFluidProgressController startRocketEffectWithProgressStateSource:](self->_fluidProgressController, "startRocketEffectWithProgressStateSource:", self);
  if ((v4 & 1) != 0)
  {
    self->_didFirstLayout = 1;
    -[_SFFormAutoFillController prefillFormsSoonIfNeeded](self->_autoFillController, "prefillFormsSoonIfNeeded");
  }
  if ((v4 & 2) != 0)
  {
    linkPreviewViewController = self->_linkPreviewViewController;
    -[TabDocument URLString](self, "URLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LinkPreviewViewController updatePreviewLoadingUIWithURLString:](linkPreviewViewController, "updatePreviewLoadingUIWithURLString:", v8);

    -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    urlForDisplayedContent = self->_urlForDisplayedContent;
    self->_urlForDisplayedContent = v9;

    -[TabDocument _updateNavigationBarItem]((uint64_t)self);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = self->_renderingProgressEventObservers;
    v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "webViewDidFirstVisuallyNonEmptyLayoutForTabDocument:", self);
        }
        v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v12);
    }

  }
  if ((v4 & 0x100) != 0)
  {
    didFirstMeaningfulPaint = self->_didFirstMeaningfulPaint;
    *(_WORD *)&self->_didFirstMeaningfulPaint = 257;
    if (!didFirstMeaningfulPaint)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = self->_renderingProgressEventObservers;
      v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v21, "webViewDidFirstMeaningfulPaintForTabDocument:", self, (_QWORD)v25);
          }
          v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v18);
      }

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v4 & 0x40) != 0)
  {
    -[_SFWebView setObscuringContents:](self->_webView, "setObscuringContents:", 0);
    self->_didFirstPaint = 1;
    appBannerPendingFirstPaint = self->_appBannerPendingFirstPaint;
    if (appBannerPendingFirstPaint)
    {
      if (self->_appBannerRemovalWasDeferred)
      {
        objc_msgSend(WeakRetained, "removeAppBannerFromTabDocument:animated:", self, 0);
        -[SFPinnableBanner setInitiallyBehindNavigationBar:](self->_appBannerPendingFirstPaint, "setInitiallyBehindNavigationBar:", 0);
        appBannerPendingFirstPaint = self->_appBannerPendingFirstPaint;
      }
      objc_storeStrong((id *)&self->_appBanner, appBannerPendingFirstPaint);
      v24 = self->_appBannerPendingFirstPaint;
      self->_appBannerPendingFirstPaint = 0;

      objc_msgSend(WeakRetained, "tabDocumentDidCompleteCheckForAppBanner:", self);
    }
    else if (self->_appBannerRemovalWasDeferred)
    {
      -[TabDocument _startAppBannerRemovalTimer](self);
    }
  }
  if ((v4 & 8) != 0)
    -[_SFWebView setPlaceholderImage:](self->_webView, "setPlaceholderImage:", 0);
  -[TabDocument updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier", (_QWORD)v25);

}

- (TabDocument)initWithTitle:(id)a3 URL:(id)a4 UUID:(id)a5 privateBrowsingEnabled:(BOOL)a6 hibernated:(BOOL)a7 bookmark:(id)a8 browserController:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  TabDocument *v20;

  v10 = a7;
  v11 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:](self, "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", v15, v16, v17, v11, objc_msgSend(v19, "isControlledByAutomation"), v10, v18, v19, 0);

  return v20;
}

- (TabDocument)initWithTitle:(id)a3 URL:(id)a4 UUID:(id)a5 privateBrowsingEnabled:(BOOL)a6 controlledByAutomation:(BOOL)a7 hibernated:(BOOL)a8 bookmark:(id)a9 browserController:(id)a10 relatedWebView:(id)a11
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  TabDocument *v23;
  id *v25;
  id *v26;
  id v27;
  _QWORD v28[4];
  TabDocument *v29;
  id v30;

  v12 = a7;
  v13 = a6;
  v27 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if (a8)
  {
    v22 = 0;
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __137__TabDocument_initWithTitle_URL_UUID_privateBrowsingEnabled_controlledByAutomation_hibernated_bookmark_browserController_relatedWebView___block_invoke;
    v28[3] = &unk_1E9CF3358;
    v22 = v28;
    v26 = (id *)&v29;
    v29 = self;
    v25 = &v30;
    v30 = v21;
  }
  v23 = (TabDocument *)-[TabDocument _initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:bookmark:browserController:createDocumentView:](self, v27, v17, v18, v13, v12, v19, v20, v22);
  if (!a8)
  {

  }
  return v23;
}

- (id)_initWithTitle:(void *)a3 URL:(void *)a4 UUID:(uint64_t)a5 privateBrowsingEnabled:(uint64_t)a6 controlledByAutomation:(void *)a7 bookmark:(void *)a8 browserController:(void *)a9 createDocumentView:
{
  id v16;
  id v17;
  void (**v18)(_QWORD);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  LoadingController *v33;
  void *v34;
  UnifiedTabBarItem *v35;
  void *v36;
  void *v37;
  int v38;
  TabBarItem *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;

  v16 = a2;
  v51 = a3;
  v49 = a4;
  v50 = a7;
  v17 = a8;
  v18 = a9;
  if (a1)
  {
    v19 = objc_msgSend(a1, "init");
    if (v19)
    {
      v47 = v16;
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = objc_msgSend(v49, "copy");
      }
      v21 = *(void **)(v19 + 1304);
      *(_QWORD *)(v19 + 1304) = v20;

      +[TabDocument blankTabTitleWithLibraryType:controlledByAutomation:](TabDocument, "blankTabTitleWithLibraryType:controlledByAutomation:", 0, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0DCCB58]);
      objc_msgSend(*(id *)(v19 + 1304), "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "length"))
        v24 = v16;
      else
        v24 = v48;
      objc_msgSend(v17, "tabController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "deviceIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v22, "initWithUUID:title:url:deviceIdentifier:isPrivateBrowsing:", v23, v24, v51, v26, a5);
      v28 = *(void **)(v19 + 1312);
      *(_QWORD *)(v19 + 1312) = v27;

      v16 = v47;
      objc_msgSend((id)v19, "setBrowserController:afterTabGroupReuse:", v17, 0);
      v29 = objc_alloc(MEMORY[0x1E0CD5668]);
      objc_msgSend(v17, "rootViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "initWithPrivateBrowsingEnabled:traitEnvironment:controlledByAutomation:", a5, v30, a6);
      v32 = *(void **)(v19 + 1208);
      *(_QWORD *)(v19 + 1208) = v31;

      v33 = objc_alloc_init(LoadingController);
      v34 = *(void **)(v19 + 160);
      *(_QWORD *)(v19 + 160) = v33;

      objc_msgSend(*(id *)(v19 + 160), "setDelegate:", v19);
      objc_msgSend((id)v19, "setReadingListBookmark:", v50);
      *(_BYTE *)(v19 + 919) = v18 == 0;
      if (v18)
      {
        v18[2](v18);
      }
      else
      {
        objc_msgSend(*(id *)(v19 + 160), "setTitle:", v47);
        objc_msgSend(*(id *)(v19 + 160), "setURL:", v51);
      }
      *(_QWORD *)(v19 + 1112) = 0xBFF0000000000000;
      -[TabDocument _setUp](v19);
      v35 = objc_alloc_init(UnifiedTabBarItem);
      v36 = *(void **)(v19 + 1048);
      *(_QWORD *)(v19 + 1048) = v35;

      objc_msgSend(*(id *)(v19 + 1048), "setUUID:", *(_QWORD *)(v19 + 1304));
      objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "showRectangularTabsInSeparateBar");

      if (v38)
      {
        v39 = objc_alloc_init(TabBarItem);
        v40 = *(void **)(v19 + 1040);
        *(_QWORD *)(v19 + 1040) = v39;

        objc_msgSend(*(id *)(v19 + 1040), "setUUID:", *(_QWORD *)(v19 + 1304));
      }
      objc_msgSend((id)v19, "browserController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v19 + 1048), "setMenuButtonConfigurator:", v41);

      objc_msgSend((id)v19, "resetTabViewItems");
      v42 = *(void **)(v19 + 1080);
      v43 = MEMORY[0x1E0C9AA60];
      *(_QWORD *)(v19 + 1080) = MEMORY[0x1E0C9AA60];

      objc_msgSend(MEMORY[0x1E0D8ADC8], "nextTabID");
      *(_QWORD *)(v19 + 760) = v44;
      objc_msgSend((id)v19, "setChangedPropertiesForOnUpdatedWebExtensionEvent:", 0);
      v45 = *(void **)(v19 + 1104);
      *(_QWORD *)(v19 + 1104) = v43;

      a1 = (id)v19;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)setChangedPropertiesForOnUpdatedWebExtensionEvent:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;
  NSTimer *fireOnUpdatedWebExtensionEventTimer;

  if (!self->_suppressWebExtensionEvents && self->_changedPropertiesForOnUpdatedWebExtensionEvent != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hiddenPrivateTabDocumentWhenShowingPrivateBrowsingExplanationText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TabDocument isEqual:](self, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      self->_changedPropertiesForOnUpdatedWebExtensionEvent = a3;
      if (a3)
      {
        -[TabDocument _fireOnUpdatedExtensionEventSoon]((id *)&self->super.isa);
      }
      else
      {
        -[NSTimer invalidate](self->_fireOnUpdatedWebExtensionEventTimer, "invalidate");
        fireOnUpdatedWebExtensionEventTimer = self->_fireOnUpdatedWebExtensionEventTimer;
        self->_fireOnUpdatedWebExtensionEventTimer = 0;

      }
    }
  }
}

- (void)setReadingListBookmark:(id)a3
{
  int v5;
  WebBookmark **p_readingListBookmark;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  v5 = -[WebBookmark identifier](self->_readingListBookmark, "identifier");
  p_readingListBookmark = &self->_readingListBookmark;
  if (v5 != objc_msgSend(v10, "identifier")
    || (-[WebBookmark dateLastViewed](*p_readingListBookmark, "dateLastViewed"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "dateLastViewed"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = (v7 != 0) ^ (v8 == 0),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_readingListBookmark, a3);
    -[TabDocument setShowingContinuous:](self, "setShowingContinuous:", -[WebBookmark isReadingListItem](*p_readingListBookmark, "isReadingListItem"));
  }

}

- (void)setBrowserController:(id)a3 afterTabGroupReuse:(BOOL)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v7 = WeakRetained;
  if (!a4)
  {
    objc_msgSend(WeakRetained, "tabController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willLoseOwnershipOfTab:", self);

  }
  objc_storeWeak((id *)&self->_browserController, obj);
  -[TabDocument setDelegate:](self, "setDelegate:", obj);
  objc_msgSend(obj, "loadProgressObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_loadProgressObserver, v9);

  objc_msgSend(obj, "tabController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didGainOwnershipOfTab:", self);

  objc_msgSend(v7, "tabGroupManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeTabGroupObserver:", self);

  objc_msgSend(obj, "tabGroupManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTabGroupObserver:", self);

  -[WBTab uuid](self->_tabGroupTab, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _activeParticipantsDidUpdateInTabWithUUID:]((id *)&self->super.isa, v13);

}

- (void)resetTabViewItems
{
  TabDocumentCollectionItem *v3;
  TabDocumentCollectionItem *tabCollectionItem;
  unint64_t v5;
  TabOverviewItem *v6;
  TabOverviewItem *tabOverviewItem;
  id v8;

  v3 = objc_alloc_init(TabDocumentCollectionItem);
  tabCollectionItem = self->_tabCollectionItem;
  self->_tabCollectionItem = v3;

  -[TabDocumentCollectionItem setUUID:](self->_tabCollectionItem, "setUUID:", self->_uuid);
  v5 = -[TabDocument mediaStateIcon](self, "mediaStateIcon");
  -[TabDocumentCollectionItem setMediaStateIcon:](self->_tabCollectionItem, "setMediaStateIcon:", v5);
  -[TabDocumentCollectionItem setPinned:](self->_tabCollectionItem, "setPinned:", self->_pinned);
  -[TabOverviewItem icon](self->_tabOverviewItem, "icon");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[TabOverviewItem initWithUUID:]([TabOverviewItem alloc], "initWithUUID:", self->_uuid);
  tabOverviewItem = self->_tabOverviewItem;
  self->_tabOverviewItem = v6;

  -[TabOverviewItem setMediaStateIcon:](self->_tabOverviewItem, "setMediaStateIcon:", v5);
  -[TabOverviewItem setPinned:](self->_tabOverviewItem, "setPinned:", self->_pinned);
  -[TabDocument updateTabTitle](self, "updateTabTitle");
  -[TabOverviewItem setIcon:](self->_tabOverviewItem, "setIcon:", v8);

}

- (unint64_t)mediaStateIcon
{
  return self->_cachedMediaStateIcon;
}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (void)_setUp
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;

  if (a1)
  {
    *(_BYTE *)(a1 + 679) = 1;
    objc_msgSend((id)a1, "setAllowsRemoteInspection:", 1);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableFluidProgressBar"));

    if (v3)
      objc_msgSend((id)a1, "beginSuppressingProgressAnimation");
    v4 = objc_alloc_init(MEMORY[0x1E0D8A908]);
    v5 = *(void **)(a1 + 168);
    *(_QWORD *)(a1 + 168) = v4;

    objc_msgSend(*(id *)(a1 + 168), "setWindowDelegate:", a1);
    v6 = objc_alloc_init(MEMORY[0x1E0D8AD80]);
    v7 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v6;

    objc_msgSend(*(id *)(a1 + 48), "addObserver:forKeyPath:options:context:", a1, CFSTR("UIShouldReflectCommittedURLInsteadOfCurrentURL"), 0, kTabDocumentObserverContext);
    v8 = objc_alloc_init(MEMORY[0x1E0D8ABD8]);
    v9 = *(void **)(a1 + 1256);
    *(_QWORD *)(a1 + 1256) = v8;

    v10 = objc_alloc_init(MEMORY[0x1E0CD57D0]);
    v11 = *(void **)(a1 + 384);
    *(_QWORD *)(a1 + 384) = v10;

    objc_msgSend(*(id *)(a1 + 384), "setDialogPresenter:", a1);
    v12 = objc_alloc(MEMORY[0x1E0CD5720]);
    objc_msgSend((id)a1, "perSitePreferencesVendor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithPerSitePreferencesVendor:", v13);
    v15 = *(void **)(a1 + 640);
    *(_QWORD *)(a1 + 640) = v14;

    objc_msgSend(*(id *)(a1 + 640), "setReloadOptionsController:", *(_QWORD *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 640), "setBrowserDocument:", a1);
    if (objc_msgSend((id)a1, "isPrivateBrowsing"))
      objc_msgSend((id)a1, "privateBrowsingUserDefinedContentBlockerManager");
    else
      objc_msgSend((id)a1, "normalBrowsingUserDefinedContentBlockerManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 640), "setUserDefinedContentBlockerManager:", v16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", a1, sel__translationAvailabilityDidChange_, *MEMORY[0x1E0D8B6B8], 0);

    v18 = objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari");
    *(_BYTE *)(a1 + 635) = v18;
    *(_BYTE *)(a1 + 634) = v18;
    v19 = objc_alloc_init(MEMORY[0x1E0D8AC78]);
    v20 = *(void **)(a1 + 1344);
    *(_QWORD *)(a1 + 1344) = v19;

  }
}

- (void)_activeParticipantsDidUpdateInTabWithUUID:(id *)a1
{
  id v3;
  void *v4;
  char v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1[164], "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v4);

    if ((v5 & 1) != 0)
    {
      objc_initWeak(&location, a1);
      WeakRetained = objc_loadWeakRetained(a1 + 117);
      objc_msgSend(WeakRetained, "tabGroupManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[164];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57__TabDocument__activeParticipantsDidUpdateInTabWithUUID___block_invoke;
      v9[3] = &unk_1E9CF98D0;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v7, "getActiveParticipantsInTab:completionHandler:", v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

- (_SFWebView)readerWebView
{
  return self->_readerWebView;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (WeakRetained)
    {
      -[TabDocument removeRenderingProgressObserver:](self, "removeRenderingProgressObserver:", WeakRetained);
      -[TabDocument removeNavigationObserver:](self, "removeNavigationObserver:", WeakRetained);
    }
    if (obj)
    {
      -[TabDocument addRenderingProgressObserver:](self, "addRenderingProgressObserver:", obj);
      -[TabDocument addNavigationObserver:](self, "addNavigationObserver:", obj);
    }
  }

}

- (void)addRenderingProgressObserver:(id)a3
{
  -[NSHashTable addObject:](self->_renderingProgressEventObservers, "addObject:", a3);
}

- (void)addNavigationObserver:(id)a3
{
  -[NSHashTable addObject:](self->_navigationObservers, "addObject:", a3);
}

- (BOOL)supportsAdvancedPrivacyProtectionsForURL:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "safari_isSafariWebExtensionURL") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "safari_enableAdvancedPrivacyProtections:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));

  }
  return v5;
}

- (BOOL)allowsRemoteInspection
{
  return !self->_locked && self->_allowsInspectionWhenUnlocked;
}

- (_SFInjectedJavaScriptController)activityJSController
{
  _SFInjectedJavaScriptController *activityJSController;
  _SFInjectedJavaScriptController *v4;
  _SFInjectedJavaScriptController *v5;

  activityJSController = self->_activityJSController;
  if (!activityJSController)
  {
    v4 = (_SFInjectedJavaScriptController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD56F0]), "initWithWebView:", self->_webView);
    v5 = self->_activityJSController;
    self->_activityJSController = v4;

    activityJSController = self->_activityJSController;
  }
  return activityJSController;
}

- (id)_webViewConfiguration
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  unsigned int IsPad;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 117);
    v3 = objc_alloc_init(MEMORY[0x1E0CEF638]);
    objc_msgSend(WeakRetained, "processPool");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProcessPool:", v4);

    objc_msgSend(WeakRetained, "wkPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPreferences:", v5);

    objc_msgSend(a1, "history");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visitedLinkStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setVisitedLinkStore:", v7);

    objc_msgSend(MEMORY[0x1E0CEF608], "safari_userContentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "isPrivateBrowsingEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "webExtensionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userContentController");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }

    objc_msgSend(v3, "setUserContentController:", v10);
    _SFApplicationNameForUserAgent();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setApplicationNameForUserAgent:", v12);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", *MEMORY[0x1E0D4F3B0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v13, "valueForKey:", *MEMORY[0x1E0D4F688]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
      v15 = v15 | 2;
    else
      v15 = v15;
    objc_msgSend(v3, "setMediaTypesRequiringUserActionForPlayback:", v15);
    IsPad = _SFDeviceIsPad();
    if (v15)
      v19 = IsPad;
    else
      v19 = 1;
    objc_msgSend(v3, "_setMediaDataLoadsAutomatically:", v19);
    objc_msgSend(v13, "valueForKey:", *MEMORY[0x1E0D4F558]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setMainContentUserGestureOverrideEnabled:", objc_msgSend(v20, "BOOLValue"));

    objc_msgSend(v13, "valueForKey:", *MEMORY[0x1E0D4F570]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsInlineMediaPlayback:", objc_msgSend(v21, "BOOLValue"));

    objc_msgSend(v13, "valueForKey:", *MEMORY[0x1E0D4F4F8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setInlineMediaPlaybackRequiresPlaysInlineAttribute:", objc_msgSend(v22, "BOOLValue"));

    objc_msgSend(v13, "valueForKey:", *MEMORY[0x1E0D4F510]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setInvisibleAutoplayNotPermitted:", objc_msgSend(v23, "BOOLValue"));

    objc_msgSend(v3, "_setApplePayEnabled:", 1);
    objc_msgSend(v3, "setIgnoresViewportScaleLimits:", 1);
    objc_msgSend(v3, "_setNeedsStorageAccessFromFileURLsQuirk:", 0);
    objc_msgSend(v3, "_setDragLiftDelay:", 2);
    objc_msgSend(a1, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setControlledByAutomation:", objc_msgSend(v24, "isControlledByAutomation"));

    +[Application sharedApplication](Application, "sharedApplication");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "systemNoteTakingController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "isNoteTakingSupportedWithPrivateBrowsing:", objc_msgSend(a1, "isPrivateBrowsingEnabled"))&& (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "_setAppHighlightsEnabled:", 1);
    }
    v27 = objc_msgSend(a1[151], "usesPersistentDataStore");
    v28 = (void *)MEMORY[0x1E0CEF650];
    if (v27)
    {
      -[TabDocument profileIdentifier]((uint64_t)a1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "safari_dataStoreForProfileWithIdentifier:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setWebsiteDataStore:", v30);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEF650], "safari_nonPersistentDataStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setWebsiteDataStore:", v29);
    }

    objc_msgSend(v3, "_setLegacyEncryptedMediaAPIEnabled:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D4F540]));
    objc_msgSend(v3, "websiteDataStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_setResourceLoadStatisticsEnabled:", objc_msgSend((id)v32, "webui_trackerProtectionEnabled"));

    objc_msgSend(v3, "preferences");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = objc_opt_respondsToSelector();

    if ((v32 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "_sf_warnAboutFraudulentWebsites");
      objc_msgSend(v3, "preferences");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_setSafeBrowsingEnabled:", v35);

    }
    objc_msgSend(v3, "_setSystemPreviewEnabled:", 1);
    objc_msgSend(a1, "webExtensionsController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "webKitController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setWebExtensionController:", v38);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D8B730]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setMaskedURLSchemes:", v39);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "safari_doubleForKey:defaultValue:", CFSTR("DebugSampledPageTopColorMaxDifference"), *MEMORY[0x1E0D8AFC0]);
      objc_msgSend(v3, "_setSampledPageTopColorMaxDifference:");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "safari_doubleForKey:defaultValue:", CFSTR("DebugSampledPageTopColorMinHeight"), *MEMORY[0x1E0D8AFC8]);
      objc_msgSend(v3, "_setSampledPageTopColorMinHeight:");
    }
    objc_msgSend(v3, "defaultWebpagePreferences");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _SFApplicationNameForDesktopUserAgent();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_setApplicationNameForUserAgentWithModernCompatibility:", v41);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_SFBrowserConfiguration)configuration
{
  return self->_configuration;
}

- (id)profileIdentifier
{
  id WeakRetained;
  void *v2;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend(WeakRetained, "effectiveProfileIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)updateUserActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  int v8;
  NSObject *v9;
  id v10;
  NSUserActivity *v11;
  NSUserActivity *userActivity;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[CloudTabStore cloudTabForTabDocument:]((uint64_t)CloudTabStore, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  else
    v5 = 0;
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(WeakRetained, "tabDocumentCanBecomeCurrentUserActivity:", self);

  if (self->_active && (objc_msgSend(v6, "safari_isHTTPFamilyURL") & v8 & 1) != 0)
  {
    if (self->_userActivity)
    {
      if (self->_forwardActivityToCoreSpotlight)
      {
        v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_INFO, "Stopping updates of NSUserActivity through CoreSpotlight", (uint8_t *)&v27, 2u);
        }
        -[NSUserActivity _updateForwardToCoreSpotlightIndexer:](self->_userActivity, "_updateForwardToCoreSpotlightIndexer:", 0xFFFFFFFFLL);
        self->_forwardActivityToCoreSpotlight = 0;
      }
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CA5920]);
      v11 = (NSUserActivity *)objc_msgSend(v10, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
      userActivity = self->_userActivity;
      self->_userActivity = v11;

    }
    objc_msgSend(v3, "dictionaryRepresentationForUserActivityUserInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserActivity setUserInfo:](self->_userActivity, "setUserInfo:", v13);

    objc_msgSend(v3, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserActivity setTitle:](self->_userActivity, "setTitle:", v14);

    -[NSUserActivity setWebpageURL:](self->_userActivity, "setWebpageURL:", v6);
    -[TabDocument searchableItemAttributes](self, "searchableItemAttributes");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSUserActivity setContentAttributeSet:](self->_userActivity, "setContentAttributeSet:", v15);

    -[TabDocument searchableItemAttributes](self, "searchableItemAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = v16 == 0;

    if ((v15 & 1) == 0)
    {
      -[NSUserActivity _updateForwardToCoreSpotlightIndexer:](self->_userActivity, "_updateForwardToCoreSpotlightIndexer:", 1);
      self->_forwardActivityToCoreSpotlight = 1;
      v17 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1D7CA3000, v17, OS_LOG_TYPE_INFO, "Sending NSUserActivity through CoreSpotlight since metadata was found on webpage", (uint8_t *)&v27, 2u);
      }
      v18 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[TabDocument searchableItemAttributes](self, "searchableItemAttributes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "relatedUniqueIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138478083;
        v28 = v26;
        v29 = 2113;
        v30 = v6;
        _os_log_debug_impl(&dword_1D7CA3000, v18, OS_LOG_TYPE_DEBUG, "Sending NSUserActivity through CoreSpotlight; relatedUniqueIdentifier '%{private}@' and URL '%{private}@'",
          (uint8_t *)&v27,
          0x16u);

      }
    }
    +[Application sharedApplication](Application, "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "systemNoteTakingController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "insertCanonicalURLIfAvailableForUserActivity:", self->_userActivity);
    -[NSUserActivity userInfo](self->_userActivity, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    -[NSUserActivity _uniqueIdentifier](self->_userActivity, "_uniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("uniqueIdentifier"));

    v24 = (void *)objc_msgSend(v22, "copy");
    -[NSUserActivity setUserInfo:](self->_userActivity, "setUserInfo:", v24);

    -[NSUserActivity setNeedsSave:](self->_userActivity, "setNeedsSave:", 1);
    -[NSUserActivity becomeCurrent](self->_userActivity, "becomeCurrent");

  }
  else
  {
    -[TabDocument invalidateUserActivity]((uint64_t)self);
  }

}

- (void)invalidateUserActivity
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (a1)
  {
    objc_msgSend((id)a1, "searchableItemAttributes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1400), "setContentAttributeSet:", v2);

    if (*(_BYTE *)(a1 + 674))
    {
      v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_INFO, "Stopping updates of NSUserActivity through CoreSpotlight due to invalidating NSUserActivity", v5, 2u);
      }
      objc_msgSend(*(id *)(a1 + 1400), "_updateForwardToCoreSpotlightIndexer:", 0xFFFFFFFFLL);
      *(_BYTE *)(a1 + 674) = 0;
    }
    objc_msgSend(*(id *)(a1 + 1400), "invalidate");
    v4 = *(void **)(a1 + 1400);
    *(_QWORD *)(a1 + 1400) = 0;

  }
}

- (CSSearchableItemAttributeSet)searchableItemAttributes
{
  return self->_searchableItemAttributes;
}

- (SFReaderContext)readerContext
{
  return self->_readerContext;
}

- (BOOL)canGoForward
{
  return -[LoadingController canGoForward](self->_loadingController, "canGoForward");
}

- (BOOL)canGoBack
{
  return -[LoadingController canGoBack](self->_loadingController, "canGoBack");
}

- (void)_updateActiveExtensionsIfNecessary
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  id WeakRetained;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;

  if (!a1)
    return;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DebugHideAllExtensionButtons"));

    if ((v3 & 1) != 0)
      return;
  }
  objc_msgSend((id)a1, "webExtensionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 272), "setNeedsExtensionBadge:", objc_msgSend(v4, "hasUpdatedToolbarItemBadgeTextInTab:", a1));
  objc_msgSend((id)a1, "urlForExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "safari_isSafariWebExtensionURL"))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "enabledExtensions", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __49__TabDocument__updateActiveExtensionsIfNecessary__block_invoke;
  v28[3] = &unk_1E9CF9508;
  v26 = v4;
  v29 = v26;
  v30 = a1;
  v10 = v5;
  v31 = v10;
  v11 = v8;
  v32 = v11;
  objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  objc_msgSend((id)a1, "contentBlockerManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)a1, "isPrivateBrowsingEnabled"))
  {
    objc_msgSend(v26, "enabledExtensions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count"))
    {
      objc_msgSend(v25, "enabledExtensions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 != 0;
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(v26, "extensions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "BOOLForKey:", *MEMORY[0x1E0D8B0C0]) & 1) != 0)
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(v25, "extensions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v17, "count") != 0;

      }
      goto LABEL_16;
    }
  }
  v16 = 1;
LABEL_17:

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
  objc_msgSend(WeakRetained, "tabBarManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (objc_msgSend(v19, "displayMode") == 2)
    {
      v20 = 1;
    }
    else
    {
      objc_msgSend(v19, "inlineTabBar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "usesMoreMenu") & 1) != 0 || !*(_BYTE *)(a1 + 914))
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 272), "text");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v22, "length") == 0;

      }
    }
  }
  else
  {
    v20 = 0;
  }

  if (v13 > 2)
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __49__TabDocument__updateActiveExtensionsIfNecessary__block_invoke_2;
    v27[3] = &unk_1E9CF9530;
    v27[4] = a1;
    objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EEE8]), "initWithActiveExtensionCount:alwaysShowMultipleExtensionsButton:buttons:extensionsController:", v13, v20, v23, v26);
  objc_msgSend(*(id *)(a1 + 272), "setExtensionButtonConfiguration:", v24);

  objc_msgSend(*(id *)(a1 + 272), "setExtensionsAreActive:", v13 != 0);
}

- (void)updateMenuButtonShowsBadge
{
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  UnifiedTabBarItem *unifiedTabBarItem;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v3, "hasUnviewedDownloads");

  -[TabDocument webExtensionsController](self, "webExtensionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasUpdatedToolbarItemBadgeTextInTab:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "displayMode");
  v9 = v9;

  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v8 == 2)
  {
    -[SFUnifiedTabBarItem setShowsBadgeOnExtensionsButton:](unifiedTabBarItem, "setShowsBadgeOnExtensionsButton:", v5);
  }
  else
  {
    -[SFUnifiedTabBarItem setShowsBadgeOnExtensionsButton:](unifiedTabBarItem, "setShowsBadgeOnExtensionsButton:", 0);
    if ((_DWORD)v5)
      v9 = v9 | 2;
  }
  if (self->_cachedMediaStateIcon)
    v11 = v9 | 4;
  else
    v11 = v9;
  -[SFUnifiedTabBarItem setMenuButtonBadges:](self->_unifiedTabBarItem, "setMenuButtonBadges:", v11);
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3
{
  _BOOL4 v4;

  v4 = -[TabDocument didFirstLayout](self, "didFirstLayout", a3);
  if (v4)
    LOBYTE(v4) = -[TabDocument didFinishDocumentLoad](self, "didFinishDocumentLoad");
  return v4;
}

- (BOOL)didFirstLayout
{
  return self->_didFirstLayout;
}

- (BOOL)isPreparingForNewUserActivity
{
  return self->_preparingForNewUserActivity;
}

- (SFContentBlockerManager)contentBlockerManager
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[_SFBrowserConfiguration isPrivateBrowsingEnabled](self->_configuration, "isPrivateBrowsingEnabled");
  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "contentBlockerManagerForProfileServerID:", *MEMORY[0x1E0D89E20]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TabDocument profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifierForExtensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentBlockerManagerForProfileServerID:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SFContentBlockerManager *)v6;
}

void __57__TabDocument__activeParticipantsDidUpdateInTabWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__TabDocument__activeParticipantsDidUpdateInTabWithUUID___block_invoke_2;
  v5[3] = &unk_1E9CF3D60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

- (SFPinnableBanner)appBanner
{
  return self->_appBanner;
}

- (SFDialogController)dialogController
{
  return self->_dialogController;
}

- (BOOL)shouldShowReaderOnActivate
{
  _BOOL4 v3;

  v3 = -[TabDocument isReaderAvailable](self, "isReaderAvailable");
  if (v3)
    LOBYTE(v3) = self->_showingReader || self->_wantsReaderWhenActivated;
  return v3;
}

- (SFPrivateBrowsingPrivacyProtectionsBanner)privateBrowsingPrivacyProtectionsBanner
{
  return self->_privateBrowsingPrivacyProtectionsBanner;
}

- (void)_updateNavigationBarItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  _BOOL8 v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  uint64_t v20;
  __CFString *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;

  if (!a1 || !*(_QWORD *)(a1 + 272))
    return;
  objc_msgSend((id)a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v2;
  if ((objc_msgSend(v2, "safari_isSafariWebExtensionURL") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)a1, "URLString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "defaultSearchEngineIfPopulatedForPrivateBrowsing:", objc_msgSend((id)a1, "isPrivateBrowsingEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CD5930];
    objc_msgSend(v5, "removeObserver:name:object:", a1, *MEMORY[0x1E0CD5930], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", a1, sel__searchEngineControllerDidFinishPopulating_, v6, 0);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "UIShouldReflectCommittedURLInsteadOfCurrentURL"))
    objc_msgSend(*(id *)(a1 + 1008), "_committedURL");
  else
    objc_msgSend(*(id *)(a1 + 160), "URL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userVisibleQueryFromSearchURL:", v32);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 184) || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 1008), "_safeBrowsingWarning");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  objc_msgSend(*(id *)(a1 + 272), "setOverrideBarStyleForSecurityWarning:", v10);
  v38 = 0;
  objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 5, 0, &v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, &v37);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(a1 + 918) = 0;
  if (*(_QWORD *)(a1 + 184))
  {
    _WBSLocalizedString();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_17;
  }
  else
  {
    if ((objc_msgSend(v2, "safari_isDataURL") & 1) == 0)
    {
      if (!v8)
      {
        v12 = v11;
        v17 = v36;
        v15 = 0;
        v16 = 0;
        if (v37 <= v38)
          v13 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v13 = v37 - v38;
        if (v11)
          goto LABEL_38;
        goto LABEL_37;
      }
      v18 = v8;
      *(_BYTE *)(a1 + 918) = 1;
      v12 = v18;
      v13 = 0;
      goto LABEL_20;
    }
    v12 = CFSTR("data:");
    if (v8)
    {
LABEL_17:
      if (v12 == v8)
        v13 = 0;
      else
        v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_20:
      objc_msgSend((id)a1, "expectedOrCurrentURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "safari_isEligibleToShowNotSecureWarning");

      v16 = 1;
      v17 = v8;
      if (v11)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  v17 = v36;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 == v11)
  {
    v15 = 0;
    v16 = 0;
    if (v37 > v38)
      v13 = v37 - v38;
    v12 = v11;
    if (v11)
      goto LABEL_38;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    if (v11)
      goto LABEL_38;
  }
LABEL_37:
  if (!v15)
  {
LABEL_40:
    objc_msgSend(*(id *)(a1 + 272), "setSecurityAnnotation:hasFocusedInputFieldOnCurrentPage:", 0, *(unsigned __int8 *)(a1 + 704));
    v19 = 0;
    goto LABEL_41;
  }
LABEL_38:
  if (!-[TabDocument isPageEligibileToShowNotSecureWarning]((void *)a1))
    goto LABEL_40;
  v19 = 1;
  objc_msgSend(*(id *)(a1 + 272), "setSecurityAnnotation:hasFocusedInputFieldOnCurrentPage:", 1, *(unsigned __int8 *)(a1 + 704));
LABEL_41:
  if ((objc_msgSend((id)a1, "isBlank") & 1) != 0)
  {
    v20 = 0;
  }
  else if (*(_BYTE *)(a1 + 634))
  {
    v20 = 1;
  }
  else
  {
    v20 = 2;
  }
  objc_msgSend(*(id *)(a1 + 272), "setLockdownModeAnnotation:", v20);
  if ((v15 & v19) == 1)
  {
    v21 = v11;

    v12 = v21;
    v17 = v12;
  }
  if (*(_QWORD *)(a1 + 184))
    v22 = 1;
  else
    v22 = v19;
  if (((v16 | v22) & 1) != 0)
    v23 = v22 ^ 1u;
  else
    v23 = objc_msgSend(v36, "length") == 0;
  objc_msgSend(*(id *)(a1 + 272), "setShowsSearchIndicator:", v23);
  if (*(_QWORD *)(a1 + 184))
    v24 = 0;
  else
    v24 = objc_msgSend((id)a1, "isSecure");
  objc_msgSend(*(id *)(a1 + 272), "setShowsLockIcon:", v24);
  objc_msgSend(*(id *)(a1 + 272), "setText:textWhenExpanded:startIndex:", v12, v17, v13);
  objc_msgSend((id)a1, "URL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 272), "setShowsStopReloadButtons:", v25 != 0);

  objc_msgSend(*(id *)(a1 + 272), "setShowsPageFormatButton:", objc_msgSend((id)a1, "canShowPageFormatMenu"));
  v26 = *(void **)(a1 + 272);
  if (*(_QWORD *)(a1 + 184))
    v27 = 0;
  else
    v27 = objc_msgSend((id)a1, "isReaderAvailable");
  objc_msgSend(v26, "setShowsReaderButton:showsAvailabilityText:", v27, 0);
  v28 = *(void **)(a1 + 272);
  if (*(_QWORD *)(a1 + 184))
    v29 = 0;
  else
    v29 = objc_msgSend(*(id *)(a1 + 1000), "detectionNotificationLevel") == 1;
  objc_msgSend(v28, "setShowsTranslationButton:showsAvailabilityText:", v29, 0);
  v30 = *(void **)(a1 + 272);
  objc_msgSend((id)a1, "uuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "updateEntityAnnotationWithUUID:", v31);

  objc_msgSend(*(id *)(a1 + 1216), "updatePreviewLoadingUIWithURLString:", v3);
}

- (BOOL)isReaderAvailable
{
  _SFReaderController *readerContext;

  if (self->_hasDoneReaderAvailabilityDetection && (readerContext = self->_readerContext) != 0)
    return -[_SFReaderController isReaderAvailable](readerContext, "isReaderAvailable");
  else
    return 0;
}

- (BOOL)isSecure
{
  char v3;
  void *v4;
  void *v5;

  if (!-[_SFWebView hasOnlySecureContent](self->_webView, "hasOnlySecureContent")
    || (objc_opt_respondsToSelector() & 1) != 0
    && (-[_SFWebView _negotiatedLegacyTLS](self->_webView, "_negotiatedLegacyTLS") & 1) != 0)
  {
    return 0;
  }
  -[LoadingController URL](self->_loadingController, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFWebView _committedURL](self->_webView, "_committedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "isEqual:", v5);

  return v3;
}

- (BOOL)canShowPageFormatMenu
{
  void *v3;
  _BOOL4 v4;

  -[TabDocument URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safari_isSafariWebExtensionURL") & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else if (((objc_msgSend(v3, "safari_isHTTPFamilyURL") & 1) != 0
          || objc_msgSend(v3, "sf_isOfflineReadingListURL"))
         && !-[TabDocument isPDFDocument](self, "isPDFDocument")
         && !-[TabDocument isDisplayingStandaloneImage](self, "isDisplayingStandaloneImage"))
  {
    v4 = !-[TabDocument isDisplayingStandaloneMedia](self, "isDisplayingStandaloneMedia");
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isAudible
{
  NSString *lastSiriReaderSessionIdentifier;
  void *v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;

  if ((-[_SFWebView _isPlayingAudio](self->_webView, "_isPlayingAudio") & 1) != 0)
    return 1;
  lastSiriReaderSessionIdentifier = self->_lastSiriReaderSessionIdentifier;
  objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeSiriReaderSessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(lastSiriReaderSessionIdentifier) = -[NSString isEqualToString:](lastSiriReaderSessionIdentifier, "isEqualToString:", v6);

  if (!(_DWORD)lastSiriReaderSessionIdentifier)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v8 = objc_msgSend(WeakRetained, "siriReaderPlaybackStateForActiveTab");

  return v8 == 1;
}

void __57__TabDocument__activeParticipantsDidUpdateInTabWithUUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShareParticipants:", v3);

    WeakRetained = v4;
  }

}

- (void)setShareParticipants:(id)a3
{
  NSArray *v4;
  NSArray *shareParticipants;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    -[TabBarItem setShareParticipants:](self->_tabBarItem, "setShareParticipants:", v7);
    -[SFUnifiedTabBarItem setShareParticipants:](self->_unifiedTabBarItem, "setShareParticipants:", v7);
    -[TabOverviewItem setShareParticipants:](self->_tabOverviewItem, "setShareParticipants:", v7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tabDocumentDidUpdateTabCollectionItem:", self);

  }
}

- (BOOL)shouldObscureForDigitalHealth
{
  return -[TabDocument policy](self, "policy") != 0;
}

- (int64_t)policy
{
  return self->_policy;
}

- (_SFPrintController)printController
{
  return self->_printController;
}

- (BOOL)hideFindOnPage
{
  _BOOL4 v3;
  void *v4;

  v3 = -[TabDocument isShowingFindOnPage](self, "isShowingFindOnPage");
  if (v3)
  {
    -[TabDocument findInteraction](self, "findInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissFindNavigator");

  }
  return v3;
}

- (BOOL)isShowingFindOnPage
{
  void *v2;
  char v3;

  -[TabDocument findInteraction](self, "findInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFindNavigatorVisible");

  return v3;
}

- (UIFindInteraction)findInteraction
{
  void *v2;
  void *v3;

  -[TabDocument activeWebView](self, "activeWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFindInteraction *)v3;
}

- (void)sfWebViewDidChangeSafeAreaInsets:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentDidChangeSafeAreaInsets:", self);

}

- (void)setActive:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;

  if (self->_active != a3)
  {
    self->_active = a3;
    -[TabBarItem setActive:](self->_tabBarItem, "setActive:");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[TabDocument setLastViewedTime:](self, "setLastViewedTime:");
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveTabDocumentUserActivitySoon:", self);

    if (self->_active)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reportTabUpdatedWithUpdateType:", 7);

      if (self->_closed)
      {
        v7 = WBS_LOG_CHANNEL_PREFIXPageLoading();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[TabDocument setActive:].cold.1((uint64_t)self, v7);
      }
      v8 = -[TabDocument navigationBarItem](self, "navigationBarItem");
      if (self->_hibernated)
        -[TabDocument unhibernate](self, "unhibernate");
      else
        -[TabDocument _loadDeferredURLIfNeeded]((uint64_t)self);
      -[SFDialogController owningWebViewWillBecomeActive](self->_dialogController, "owningWebViewWillBecomeActive");
      if ((*((_BYTE *)&self->_flags + 8) & 1) != 0)
      {
        *((_BYTE *)&self->_flags + 8) &= ~1u;
        self->_flags.impressionProvenance = 0;
      }
      -[TabDocument validateExtensionToolbarItems](self, "validateExtensionToolbarItems");
      -[TabDocument indexTabToCoreSpotlight](self, "indexTabToCoreSpotlight");
    }
    else
    {
      -[SFScribbleController endScribblingAndSaveChanges:](self->_sfScribbleController, "endScribblingAndSaveChanges:", 0);
    }
  }
}

- (void)validateExtensionToolbarItems
{
  -[TabDocument _updateActiveExtensionsIfNecessary]((uint64_t)self);
  -[TabDocument updateMenuButtonShowsBadge](self, "updateMenuButtonShowsBadge");
}

- (void)unhibernate
{
  id unresponsiveWebProcessBlock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _WKSessionState *v8;
  _WKSessionState *savedSessionState;
  id v10;
  _QWORD v11[4];
  id v12;
  TabDocument *v13;

  if (self->_hibernated)
  {
    -[NSTimer invalidate](self->_unresponsiveWebProcessTimer, "invalidate");
    unresponsiveWebProcessBlock = self->_unresponsiveWebProcessBlock;
    self->_unresponsiveWebProcessBlock = 0;

    self->_suppressCrashBanner = 0;
    self->_hibernated = 0;
    -[TabDocument URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _webViewConfiguration]((id *)&self->super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _createDocumentViewWithConfiguration:]((uint64_t)self, v5);
    if (self->_savedSessionState)
      goto LABEL_8;
    if (!-[TabDocument isBlank](self, "isBlank"))
    {
      -[WBTab localAttributes](self->_tabGroupTab, "localAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sessionStateData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "length"))
      {
        v8 = (_WKSessionState *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6D0]), "initWithData:", v7);
        savedSessionState = self->_savedSessionState;
        self->_savedSessionState = v8;

      }
    }
    if (self->_savedSessionState)
    {
LABEL_8:
      self->_sessionStateRestorationSource = 1;
      self->_externalAppRedirectState = 4;
      self->_userDrivenLoadWasConsumed = 1;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __26__TabDocument_unhibernate__block_invoke;
      v11[3] = &unk_1E9CF3358;
      v12 = v4;
      v13 = self;
      -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v11);

    }
    else if (v4)
    {
      v10 = -[TabDocument _loadURLInternal:userDriven:]((uint64_t)self, v4, 1);
    }

  }
}

- (void)setLastViewedTime:(double)a3
{
  self->_lastViewedTime = a3;
}

- (void)updateTabIcon
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSString *libraryType;
  NSString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id faviconToken;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  -[TabDocument URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", self->_cachedURL) & 1) != 0)
    goto LABEL_24;
  -[TabDocument _cancelFaviconUpdate]((uint64_t)self);
  objc_storeStrong((id *)&self->_cachedURL, v3);
  if (!v3)
  {
    libraryType = self->_libraryType;
    if (!libraryType)
    {
      objc_msgSend(MEMORY[0x1E0D4EF58], "favoritesFavicon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
      -[TabDocument _setIcon:isMonogram:]((uint64_t)self, v17, 0);

      goto LABEL_24;
    }
    v8 = libraryType;
    if (-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("BookmarksCollection")))
    {
      objc_msgSend(MEMORY[0x1E0D4EF58], "bookmarksFavicon");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else if (-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("CloudTabsCollection")))
    {
      objc_msgSend(MEMORY[0x1E0D4EF58], "fallbackFavicon");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else if (-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("HistoryCollection")))
    {
      objc_msgSend(MEMORY[0x1E0D4EF58], "historyFavicon");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else if (-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("ReadingListCollection")))
    {
      objc_msgSend(MEMORY[0x1E0D4EF58], "readingListFavicon");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("SharedWithYouCollection")))
      {
        v17 = 0;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0D4EF58], "sharedWithYouFavicon");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v9;
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("about:blank"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D4EF58], "fallbackFavicon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _setIcon:isMonogram:]((uint64_t)self, v6, 0);
  }
  else
  {
    if (!objc_msgSend(v3, "safari_isSafariWebExtensionURL"))
    {
      objc_initWeak(&location, self);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A8E8]), "initWithURL:iconSize:fallbackType:", v3, 2, +[TabIconAndTitleView defaultTabIconSize]());
      objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __28__TabDocument_updateTabIcon__block_invoke;
      v18[3] = &unk_1E9CF8C38;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v14, "registerRequest:priority:responseHandler:", v13, 2, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      faviconToken = self->_faviconToken;
      self->_faviconToken = v15;

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      goto LABEL_24;
    }
    -[TabDocument webExtensionsController](self, "webExtensionsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "webExtensionForBaseURIHost:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _setIcon:isMonogram:]((uint64_t)self, v12, 0);

  }
LABEL_24:

}

- (void)_setIcon:(int)a3 isMonogram:
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  if (a1)
  {
    v10 = v5;
    if (a3)
      v6 = 0;
    else
      v6 = v5;
    objc_msgSend(*(id *)(a1 + 1056), "setIcon:", v6);
    objc_msgSend(*(id *)(a1 + 1040), "setIcon:", v10);
    objc_msgSend(*(id *)(a1 + 1048), "setIcon:", v10);
    objc_msgSend(*(id *)(a1 + 1064), "setIcon:", v6);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconPool");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconDidChangeForIdentifier:", *(_QWORD *)(a1 + 1304));

    v5 = v10;
  }

}

- (void)_cancelFaviconUpdate
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 560));
    if ((objc_msgSend(WeakRetained, "isValid") & 1) != 0 || *(_QWORD *)(a1 + 544))
    {
      v2 = *(void **)(a1 + 536);
      *(_QWORD *)(a1 + 536) = 0;

    }
    objc_msgSend(WeakRetained, "invalidate");
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequestWithToken:", *(_QWORD *)(a1 + 544));

    v4 = *(void **)(a1 + 544);
    *(_QWORD *)(a1 + 544) = 0;

  }
}

- (id)quickLookDocumentForCurrentBackForwardListItem
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1008), "backForwardList");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "currentItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_sf_quickLookDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setWBTab:(id)a3
{
  objc_storeStrong((id *)&self->_tabGroupTab, a3);
}

- (void)setPinned:(BOOL)a3
{
  _BOOL8 v3;
  NSURL *v5;
  NSURL *pinnedURL;
  NSString *v7;
  NSString *pinnedTitle;
  NSURL *v9;

  if (self->_pinned != a3)
  {
    v3 = a3;
    self->_pinned = a3;
    -[TabBarItem setPinned:](self->_tabBarItem, "setPinned:");
    -[UnifiedTabBarItem setPinned:](self->_unifiedTabBarItem, "setPinned:", v3);
    -[TabOverviewItem setPinned:](self->_tabOverviewItem, "setPinned:", v3);
    -[TabDocumentCollectionItem setPinned:](self->_tabCollectionItem, "setPinned:", v3);
    if (v3)
    {
      -[TabDocument URL](self, "URL");
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      pinnedURL = self->_pinnedURL;
      self->_pinnedURL = v5;

      -[TabDocument title](self, "title");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      pinnedTitle = self->_pinnedTitle;
      self->_pinnedTitle = v7;
    }
    else
    {
      v9 = self->_pinnedURL;
      self->_pinnedURL = 0;

      pinnedTitle = self->_pinnedTitle;
      self->_pinnedTitle = 0;
    }

    -[TabDocument _notifyDidUpdateTabCollectionItem]((id *)&self->super.isa);
  }
}

void __47__TabDocument__fireOnUpdatedExtensionEventSoon__block_invoke(uint64_t a1)
{
  id v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 898))
    {
      v1 = objc_loadWeakRetained(WeakRetained + 117);

      if (v1)
        -[TabDocument _fireOnUpdatedExtensionEvent](WeakRetained);
    }
  }

}

- (void)_fireOnUpdatedExtensionEvent
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    v2 = a1[127];
    objc_msgSend(a1, "setChangedPropertiesForOnUpdatedWebExtensionEvent:", 0);
    objc_msgSend(a1, "webExtensionsController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fireOnUpdatedEventForTab:withChangedProperties:", a1, v2);

  }
}

- (int)readingListBookmarkID
{
  int result;

  result = -[WebBookmark isReadingListItem](self->_readingListBookmark, "isReadingListItem");
  if (result)
    return -[WebBookmark identifier](self->_readingListBookmark, "identifier");
  return result;
}

- (BOOL)isShowingContinuous
{
  return self->_showingContinuous;
}

- (void)_fireOnUpdatedExtensionEventSoon
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (a1)
  {
    objc_msgSend(a1[97], "invalidate");
    v2 = a1[97];
    a1[97] = 0;

    objc_initWeak(&location, a1);
    v3 = (void *)MEMORY[0x1E0C99E88];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__TabDocument__fireOnUpdatedExtensionEventSoon__block_invoke;
    v6[3] = &unk_1E9CF8C10;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 0.1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[97];
    a1[97] = (id)v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

uint64_t __30__TabDocument_NonARC__release__block_invoke()
{
  NSObject *v1;

  if (pthread_main_np())
    return 1;
  v1 = WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    __30__TabDocument_NonARC__release__block_invoke_cold_1(v1);
  return 2;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_retainCount + 2) >> 1;
}

+ (id)urlForExternalURL:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  char v24;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "safari_isXWebSearchURL"))
  {
    +[SearchQueryBuilder searchQueryBuilderWithXWebSearchURL:forPrivateBrowsing:](SearchQueryBuilder, "searchQueryBuilderWithXWebSearchURL:forPrivateBrowsing:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      +[RecentWebSearchesController sharedController](RecentWebSearchesController, "sharedController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addRecentSearch:", v8);

    }
LABEL_7:

    if (v7 != v5)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "safari_isSafariSpecificURL"))
  {
    objc_msgSend(v5, "safari_URLByNormalizingSafariSpecificURL");
    v6 = v5;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "safari_userVisibleString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_URLWithUserTypedString:", v11);
  v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v7, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com-apple-mobilesafari-tab"));

  if (v13)
  {
    objc_msgSend(v7, "resourceSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("?"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v15, "count") <= 2 && objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByRemovingPercentEncoding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "scheme");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("http")))
        {

LABEL_21:
          goto LABEL_16;
        }
        objc_msgSend(v19, "scheme");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("https"));

        if ((v24 & 1) != 0)
          goto LABEL_21;
      }
      v21 = v7;

    }
    else
    {
      v21 = v7;
    }

    goto LABEL_19;
  }
  v19 = v7;
LABEL_16:
  v21 = v19;
LABEL_19:

  return v21;
}

- (TabDocument)init
{
  TabDocument *v2;
  uint64_t v3;
  NSHashTable *renderingProgressEventObservers;
  uint64_t v5;
  NSHashTable *navigationObservers;
  TabDocument *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TabDocument;
  v2 = -[TabDocument init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    renderingProgressEventObservers = v2->_renderingProgressEventObservers;
    v2->_renderingProgressEventObservers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    navigationObservers = v2->_navigationObservers;
    v2->_navigationObservers = (NSHashTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (TabDocument)initWithBrowserController:(id)a3
{
  id v4;
  TabDocument *v5;

  v4 = a3;
  v5 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:](self, "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, objc_msgSend(v4, "isPrivateBrowsingEnabled"), objc_msgSend(v4, "isControlledByAutomation"), 0, 0, v4, 0);

  return v5;
}

- (id)initForBackgroundLoadingWithBrowserController:(id)a3 relatedWebView:(id)a4 webViewToCloneSessionStorageFrom:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  TabDocument *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "isPrivateBrowsingEnabled");
  v12 = objc_msgSend(v8, "isControlledByAutomation");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __109__TabDocument_initForBackgroundLoadingWithBrowserController_relatedWebView_webViewToCloneSessionStorageFrom___block_invoke;
  v17[3] = &unk_1E9CF3C30;
  v18 = self;
  v13 = v9;
  v19 = v13;
  v14 = v10;
  v20 = v14;
  v15 = -[TabDocument _initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:bookmark:browserController:createDocumentView:](v18, 0, 0, 0, v11, v12, 0, v8, v17);

  return v15;
}

void __109__TabDocument_initForBackgroundLoadingWithBrowserController_relatedWebView_webViewToCloneSessionStorageFrom___block_invoke(_QWORD *a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)a1[4];
  v2 = (void *)a1[5];
  v3 = (void *)a1[6];
  objc_msgSend(v2, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "websiteDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _createDocumentViewRelatedTo:webViewToCloneSessionStorageFrom:websiteDataStore:deferrableUserScriptsShouldWaitUntilNotification:](v1, v2, v3, v4);

}

- (void)_createDocumentViewRelatedTo:(id *)a1 webViewToCloneSessionStorageFrom:(void *)a2 websiteDataStore:(void *)a3 deferrableUserScriptsShouldWaitUntilNotification:(void *)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    -[TabDocument _webViewConfiguration](a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v15)
    {
      objc_msgSend(v9, "_setRelatedWebView:");
      objc_msgSend(v15, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "processPool");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setProcessPool:", v12);

      objc_msgSend(v15, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "websiteDataStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWebsiteDataStore:", v14);

    }
    else if (v8)
    {
      objc_msgSend(v9, "setWebsiteDataStore:", v8);
    }
    objc_msgSend(v10, "_setWebViewToCloneSessionStorageFrom:", v7);
    -[TabDocument _createDocumentViewWithConfiguration:]((uint64_t)a1, v10);

  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
    objc_msgSend(v6, "appendString:", CFSTR("PRIVATE; "));
  if (-[TabDocument isControlledByAutomation](self, "isControlledByAutomation"))
    objc_msgSend(v6, "appendString:", CFSTR("AUTOMATION; "));
  if (self->_pinned)
    objc_msgSend(v6, "appendString:", CFSTR("PINNED; "));
  if (-[TabDocument isHibernated](self, "isHibernated"))
    objc_msgSend(v6, "appendString:", CFSTR("HIBERNATED; "));
  -[TabDocument URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("url = %@>"), v7);

  return (NSString *)v6;
}

- (void)setInitialURLForStatePersisting:(id)a3 title:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[LoadingController setTitle:](self->_loadingController, "setTitle:", v6);
  -[LoadingController setURL:](self->_loadingController, "setURL:", v7);

}

- (void)dealloc
{
  NSTimer *fireOnUpdatedWebExtensionEventTimer;
  void *v4;
  void *v5;
  void (**pendingNavigationActionDueToExternalSchemePromptHandler)(id, _QWORD);
  objc_super v7;

  self->_beingReleased = 1;
  -[NSTimer invalidate](self->_fireOnUpdatedWebExtensionEventTimer, "invalidate");
  fireOnUpdatedWebExtensionEventTimer = self->_fireOnUpdatedWebExtensionEventTimer;
  self->_fireOnUpdatedWebExtensionEventTimer = 0;

  -[TabDocument _destroyDocumentView]((uint64_t)self);
  -[LoadingController setDelegate:](self->_loadingController, "setDelegate:", 0);
  -[WBSURLSpoofingMitigator removeObserver:forKeyPath:context:](self->_URLSpoofingMitigator, "removeObserver:forKeyPath:context:", self, CFSTR("UIShouldReflectCommittedURLInsteadOfCurrentURL"), kTabDocumentObserverContext);
  -[TabDocument willClose](self, "willClose");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[WBSFluidProgressController setWindowDelegate:](self->_fluidProgressController, "setWindowDelegate:", 0);
  -[WBSFluidProgressController setDelegate:](self->_fluidProgressController, "setDelegate:", 0);
  -[TabDocument clearReaderContext](self, "clearReaderContext");
  -[TabDocument invalidateUserActivity]((uint64_t)self);
  -[TabDocument clearPageLoadStatistics](self, "clearPageLoadStatistics");
  pendingNavigationActionDueToExternalSchemePromptHandler = (void (**)(id, _QWORD))self->_pendingNavigationActionDueToExternalSchemePromptHandler;
  if (pendingNavigationActionDueToExternalSchemePromptHandler)
    pendingNavigationActionDueToExternalSchemePromptHandler[2](pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  v7.receiver = self;
  v7.super_class = (Class)TabDocument;
  -[TabDocument dealloc](&v7, sel_dealloc);
}

- (void)_destroyDocumentView
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "-[TabDocument _destroyDocumentView] must be called on the main thread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (id)_debugOverrideTitle
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "URL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (WBSIsEqual())
    {
      v1 = (id *)v1[102];
    }
    else
    {
      objc_storeStrong(v1 + 103, v2);
      v3 = v1[102];
      v1[102] = 0;

      objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:", 0, 0, 0, 1, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "bookmarkCount"))
      {
        objc_msgSend(v6, "bookmarkAtIndex:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "title");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v1[102];
        v1[102] = (id)v8;

      }
      v1 = (id *)v1[102];

    }
  }
  return v1;
}

- (void)updateTabIconWithDelay:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[TabDocument _cancelFaviconUpdate]((uint64_t)self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__TabDocument_updateTabIconWithDelay___block_invoke;
  v7[3] = &unk_1E9CF8C10;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_updateFaviconTimer, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__TabDocument_updateTabIconWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateTabIcon");

}

- (void)updateUsesDarkTheme
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  -[TabDocument configuration](self, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  -[_SFReaderController configurationManager](self->_readerContext, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDarkModeEnabled:", v5 == 2);

  -[_SFReaderController sendConfigurationToWebProcess](self->_readerContext, "sendConfigurationToWebProcess");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabCollectionViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSnapshotForTab:", self);

}

void __28__TabDocument_updateTabIcon__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = v9;
    objc_msgSend(v4, "favicon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(WeakRetained + 117);
    objc_msgSend(v6, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v5, "sf_registerFaviconForDarkUserInterfaceStyle");
    -[TabDocument _setIcon:isMonogram:]((uint64_t)WeakRetained, v5, objc_msgSend(v4, "faviconType") == 0);

  }
}

- (void)webView:(id)a3 shouldLoadIconWithParameters:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  double v21;
  NSURL *v22;
  id v23;
  NSURL *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  NSURL *v29;
  void (**v30)(id, _QWORD);
  double v31;
  double v32;
  BOOL v33;

  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  -[TabDocument URL](self, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || objc_msgSend(v7, "iconType")
    || (objc_msgSend(v7, "attributes"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("mask")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v8[2](v8, 0);
  }
  else
  {
    objc_msgSend(v7, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "safari_isHTTPFamilyURL") & 1) != 0 || (objc_msgSend(v12, "isFileURL") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "faviconProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled");
      objc_msgSend(v7, "size");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;
      objc_msgSend(v7, "size");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;

      v22 = self->_originalURL;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke;
      v25[3] = &unk_1E9CF8CF0;
      v26 = v9;
      v27 = v12;
      v30 = v8;
      v23 = v14;
      v28 = v23;
      v29 = v22;
      v31 = v18;
      v32 = v21;
      v33 = v15;
      v24 = v22;
      objc_msgSend(v23, "shouldIconDataBeSavedForIconWithPageURL:originalPageURL:iconURL:size:isPrivate:completionHandler:", v26, v24, v27, v15, v25, v18, v21);

    }
    else
    {
      v8[2](v8, 0);
    }

  }
}

void __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  char v10;
  char v11;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke_2;
  v3[3] = &unk_1E9CF8CC8;
  v10 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 72);
  v11 = *(_BYTE *)(a1 + 88);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  char v10;

  if (*(_BYTE *)(a1 + 88))
  {
    v2 = *(_QWORD *)(a1 + 64);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke_4;
    v4[3] = &unk_1E9CF8CA0;
    v5 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 56);
    v9 = *(_OWORD *)(a1 + 72);
    v10 = *(_BYTE *)(a1 + 89);
    (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v4);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "safari_hasSameSiteAsURL:", *(_QWORD *)(a1 + 40)))
      v3 = 0;
    else
      v3 = &__block_literal_global_52;
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v3);
  }
}

uint64_t __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveFaviconImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), 0, *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)_searchEngineControllerDidFinishPopulating:(id)a3
{
  id v4;

  -[TabDocument _updateNavigationBarItem]((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CD5930], 0);

}

- (uint64_t)isPageEligibileToShowNotSecureWarning
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = (uint64_t)a1;
  if (a1)
  {
    objc_msgSend(a1, "expectedOrCurrentURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "safari_isEligibleToShowNotSecureWarning") & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(*(id *)(v1 + 1008), "_negotiatedLegacyTLS"))
    {
      objc_msgSend(*(id *)(v1 + 1008), "_committedURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "host");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safari_highLevelDomainFromHost");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v1, "expectedOrCurrentURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_highLevelDomainFromHost");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v8))
      {
        if ((objc_msgSend(*(id *)(v1 + 272), "showsSecurityAnnotation") & 1) != 0)
        {
          if (*(_BYTE *)(v1 + 927))
            v1 = 1;
          else
            v1 = *(_BYTE *)(v1 + 689) != 0;
        }
        else
        {
          v9 = *(void **)(v1 + 696);
          objc_msgSend((id)v1, "expectedOrCurrentURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
          {
            if (*(_BYTE *)(v1 + 927))
              v1 = 1;
            else
              v1 = *(_BYTE *)(v1 + 689) != 0;
          }
          else
          {
            v1 = 0;
          }

        }
      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (void)_translationAvailabilityDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TabDocument *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__TabDocument__translationAvailabilityDidChange___block_invoke;
  v6[3] = &unk_1E9CF3358;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __49__TabDocument__translationAvailabilityDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(*(_QWORD *)(a1 + 40) + 1000))
  {
    v8 = v2;
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x1E0D8B6C0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "unsignedIntegerValue"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "setShowsTranslationButton:", 1);
      v5 = *(_QWORD **)(a1 + 40);
      v6 = (void *)v5[129];
      objc_msgSend(v5, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didFindLocalContentWithOptions:forURL:", 64, v7);

    }
    v2 = v8;
  }

}

- (SFBrowserDocumentTrackerInfo)trackerInfo
{
  SFBrowserDocumentTrackerInfo *trackerInfo;
  SFBrowserDocumentTrackerInfo *v4;
  SFBrowserDocumentTrackerInfo *v5;
  void *v6;

  trackerInfo = self->_trackerInfo;
  if (!trackerInfo)
  {
    v4 = (SFBrowserDocumentTrackerInfo *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD55C0]), "initWithDocument:", self);
    v5 = self->_trackerInfo;
    self->_trackerInfo = v4;

    -[SFBrowserDocumentTrackerInfo queryParameterFilteringDataQueue](self->_trackerInfo, "queryParameterFilteringDataQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    trackerInfo = self->_trackerInfo;
  }
  return trackerInfo;
}

- (id)itemForTabCollectionView:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  UnifiedTabBarItem *unifiedTabBarItem;
  UnifiedTabBarItem *v8;
  UnifiedTabBarItem *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1056;
LABEL_9:
    unifiedTabBarItem = *(UnifiedTabBarItem **)((char *)&self->super.isa + v5);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1040;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 1064;
    goto LABEL_9;
  }
  v6 = objc_msgSend(v4, "isStandalone");
  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (!v6)
  {
LABEL_10:
    v8 = unifiedTabBarItem;
    goto LABEL_11;
  }
  -[UnifiedTabBarItem secondaryItem](unifiedTabBarItem, "secondaryItem");
  v8 = (UnifiedTabBarItem *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v9 = v8;

  return v9;
}

- (NSArray)tabCollectionItems
{
  TabOverviewItem *tabOverviewItem;
  UnifiedTabBarItem *unifiedTabBarItem;
  void *tabBarItem;
  void *v5;
  TabDocumentCollectionItem *tabCollectionItem;
  TabOverviewItem *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  tabOverviewItem = self->_tabOverviewItem;
  tabCollectionItem = self->_tabCollectionItem;
  v8 = tabOverviewItem;
  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (unifiedTabBarItem)
  {
    -[TabDocument currentUnifiedTabBarItem](self, "currentUnifiedTabBarItem", tabCollectionItem, v8);
    tabBarItem = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    tabBarItem = self->_tabBarItem;
  }
  v9 = tabBarItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &tabCollectionItem, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (unifiedTabBarItem)

  return (NSArray *)v5;
}

- (id)_localAttributes
{
  id *v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v1 = a1;
  v18[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*((_BYTE *)a1 + 792))
    {
      v17[0] = CFSTR("url");
      objc_msgSend(a1[100], "absoluteString");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v2;
      v4 = &stru_1E9CFDBB0;
      if (v2)
        v5 = (const __CFString *)v2;
      else
        v5 = &stru_1E9CFDBB0;
      v17[1] = CFSTR("title");
      v18[0] = v5;
      if (v1[101])
        v4 = (const __CFString *)v1[101];
      v18[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    v7 = objc_alloc(MEMORY[0x1E0DCCB28]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)v1 + 139));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _sessionStateWithoutParentItem](v1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "ancestorTabIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *((unsigned __int8 *)v1 + 681);
    v13 = (uint64_t)v1[142];
    v14 = objc_msgSend(v1, "readingListBookmarkID");
    LOBYTE(v16) = *((_BYTE *)v1 + 900);
    v1 = (id *)objc_msgSend(v7, "initWithLastVisitTime:sessionStateData:ancestorTabUUIDs:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:queuedNavigation:", v8, v10, v11, v12 != 0, v14, *((unsigned __int8 *)v1 + 899), (double)v13, v16, v6);

  }
  return v1;
}

- (_QWORD)_sessionStateWithoutParentItem
{
  _QWORD *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v6[6];
  _QWORD v7[3];
  char v8;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 140);

    if (WeakRetained)
    {
      v7[0] = 0;
      v7[1] = v7;
      v7[2] = 0x2020000000;
      v8 = 0;
      v3 = (void *)v1[126];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __45__TabDocument__sessionStateWithoutParentItem__block_invoke;
      v6[3] = &unk_1E9CF8DB8;
      v6[4] = v1;
      v6[5] = v7;
      objc_msgSend(v3, "_sessionStateWithFilter:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _Block_object_dispose(v7, 8);
      return v4;
    }
    objc_msgSend(v1, "sessionState");
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)_titleForStatePersistingForTabGroupTab
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a1)
  {
    -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:](a1, 0, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "length") && objc_msgSend(a1[126], "isLoading"))
    {
      WeakRetained = objc_loadWeakRetained(a1 + 117);
      objc_msgSend(WeakRetained, "tabController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "existingPersistedTitleForTabDocument:", a1);
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    if (!objc_msgSend(v2, "length"))
    {
      objc_msgSend(a1, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(a1, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
        v8 = objc_claimAutoreleasedReturnValue();

        v2 = v7;
      }
      else
      {
        -[TabDocument _blankTabTitle](a1);
        v8 = objc_claimAutoreleasedReturnValue();
      }

      v2 = (void *)v8;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)openInTabGroupMenuWithNewTabGroupName:(id)a3 URL:(id)a4 descendantCount:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__TabDocument_openInTabGroupMenuWithNewTabGroupName_URL_descendantCount_handler___block_invoke;
  v18[3] = &unk_1E9CF8D40;
  v15 = v12;
  v18[4] = self;
  v19 = v15;
  objc_msgSend(v14, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", v10, v11, a5, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __81__TabDocument_openInTabGroupMenuWithNewTabGroupName_URL_descendantCount_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
  objc_msgSend(WeakRetained, "tabController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeSingleBlankTabFromActiveTabGroup");

}

- (void)setBrowserController:(id)a3
{
  -[TabDocument setBrowserController:afterTabGroupReuse:](self, "setBrowserController:afterTabGroupReuse:", a3, 0);
}

- (void)removeRenderingProgressObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_renderingProgressEventObservers, "removeObject:", a3);
}

- (void)removeNavigationObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_navigationObservers, "removeObject:", a3);
}

- (void)setParentTabDocumentForBackClosesSpawnedTab:(id)a3
{
  id WeakRetained;
  TabDocument **p_parentTabDocumentForBackClosesSpawnedTab;
  id v6;
  void *v7;
  WKBackForwardListItem *v8;
  WKBackForwardListItem *parentTabItem;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  WKBackForwardListItem *v14;
  _QWORD v15[5];

  WeakRetained = a3;
  if ((objc_msgSend(WeakRetained, "isBlank") & 1) != 0)
  {

    p_parentTabDocumentForBackClosesSpawnedTab = &self->_parentTabDocumentForBackClosesSpawnedTab;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);

    if (!WeakRetained)
      goto LABEL_9;
    goto LABEL_7;
  }
  p_parentTabDocumentForBackClosesSpawnedTab = &self->_parentTabDocumentForBackClosesSpawnedTab;
  v6 = objc_loadWeakRetained((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);

  if (v6 != WeakRetained)
  {
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_backForwardList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentItem");
      v8 = (WKBackForwardListItem *)objc_claimAutoreleasedReturnValue();
      parentTabItem = self->_parentTabItem;
      self->_parentTabItem = v8;

      objc_msgSend(WeakRetained, "webView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_saveBackForwardSnapshotForItem:", self->_parentTabItem);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__TabDocument_setParentTabDocumentForBackClosesSpawnedTab___block_invoke;
      v15[3] = &unk_1E9CF8D68;
      v15[4] = self;
      objc_msgSend(v10, "_sessionStateWithFilter:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)-[_SFWebView _restoreSessionState:andNavigate:](self->_webView, "_restoreSessionState:andNavigate:", v11, 0);

LABEL_8:
      objc_storeWeak((id *)p_parentTabDocumentForBackClosesSpawnedTab, WeakRetained);
      goto LABEL_9;
    }
LABEL_7:
    -[TabDocument _sessionStateWithoutParentItem]((id *)&self->super.isa);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument restoreSessionState:andNavigate:](self, "restoreSessionState:andNavigate:", v13, 0);

    v14 = self->_parentTabItem;
    self->_parentTabItem = 0;

    WeakRetained = 0;
    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __59__TabDocument_setParentTabDocumentForBackClosesSpawnedTab___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192));
}

- (void)setUpBackClosesSpawnedTabWithParent:(id)a3
{
  id v4;
  void *v5;
  WKBackForwardListItem *v6;
  WKBackForwardListItem *parentTabItem;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFWebView *webView;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  v4 = a3;
  objc_msgSend(v4, "_backForwardList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (WKBackForwardListItem *)objc_claimAutoreleasedReturnValue();
  parentTabItem = self->_parentTabItem;
  self->_parentTabItem = v6;

  objc_msgSend(v4, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_saveBackForwardSnapshotForItem:", self->_parentTabItem);
  -[_SFWebView backForwardList](self->_webView, "backForwardList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFWebView URL](self->_webView, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_SFWebView backForwardList](self->_webView, "backForwardList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  webView = self->_webView;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __51__TabDocument_setUpBackClosesSpawnedTabWithParent___block_invoke;
  v22 = &unk_1E9CF8D90;
  v15 = v13;
  v23 = v15;
  v16 = v10;
  v24 = v16;
  -[_SFWebView _sessionStateWithFilter:](webView, "_sessionStateWithFilter:", &v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)-[_SFWebView _restoreSessionState:andNavigate:](self->_webView, "_restoreSessionState:andNavigate:", v17, 0, v19, v20, v21, v22);
  objc_storeWeak((id *)&self->_parentTabDocumentForBackClosesSpawnedTab, v4);

}

uint64_t __51__TabDocument_setUpBackClosesSpawnedTabWithParent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __45__TabDocument__sessionStateWithoutParentItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192))
    return 1;
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = 1;
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return 0;
  }
  return result;
}

- (id)_removeParentChildTabDocumentRelations
{
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if ((objc_msgSend(result, "canGoBackToParentTab") & 1) == 0)
      objc_msgSend(v1, "setParentTabDocumentForBackClosesSpawnedTab:", 0);
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    objc_msgSend(v1[63], "allObjects", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setParentTabDocumentForBackClosesSpawnedTab:", 0);
        }
        while (v3 != v5);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

    return (id *)objc_msgSend(v1[63], "setCount:", 0);
  }
  return result;
}

void __137__TabDocument_initWithTitle_URL_UUID_privateBrowsingEnabled_controlledByAutomation_hibernated_bookmark_browserController_relatedWebView___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "websiteDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _createDocumentViewRelatedTo:webViewToCloneSessionStorageFrom:websiteDataStore:deferrableUserScriptsShouldWaitUntilNotification:](v1, v2, 0, v3);

}

- (TabDocument)initWithTabStateData:(id)a3 hibernated:(BOOL)a4 browserController:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  TabDocument *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  TabDocument *v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bookmarkWithID:", objc_msgSend(v8, "readingListBookmarkID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v8, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_URLWithDataAsString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v8, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);
  v19 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:](self, "initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:", v15, v14, v18, objc_msgSend(v8, "privateBrowsing"), v6, v11, v9);

  if (v19)
  {
    if (v6)
    {
      objc_msgSend(v8, "lastViewedTime");
      -[TabDocument setLastViewedTime:](v19, "setLastViewedTime:");
    }
    -[TabDocument setShouldRestoreReader:](v19, "setShouldRestoreReader:", objc_msgSend(v8, "showingReader"));
    -[TabDocument setReaderViewTopScrollOffset:](v19, "setReaderViewTopScrollOffset:", objc_msgSend(v8, "readerViewTopScrollOffset"));
    -[TabDocument setWasOpenedFromLink:](v19, "setWasOpenedFromLink:", objc_msgSend(v8, "wasOpenedFromLink"));
    -[TabDocument setDisplayingStandaloneImage:](v19, "setDisplayingStandaloneImage:", objc_msgSend(v8, "displayingStandaloneImage"));
    objc_msgSend(v8, "url");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument setIsBlank:](v19, "setIsBlank:", objc_msgSend(v20, "length") == 0);

    objc_msgSend(v8, "sessionStateData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x1E0CEF6D0]);
      objc_msgSend(v8, "sessionStateData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithData:", v23);

      if (v24)
        -[TabDocument restoreSessionState:andNavigate:](v19, "restoreSessionState:andNavigate:", v24, 1);

    }
    else if (!v6)
    {
      v25 = -[TabDocument loadURL:userDriven:](v19, "loadURL:userDriven:", v14, 1);
    }
    v26 = v19;
  }

  return v19;
}

- (TabDocument)initWithTabGroupTab:(id)a3 privateBrowsingEnabled:(BOOL)a4 hibernated:(BOOL)a5 bookmark:(id)a6 browserController:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  TabDocument *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *ancestorUUIDs;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSURL *pinnedURL;
  void *v30;
  uint64_t v31;
  NSString *pinnedTitle;
  uint64_t v33;
  TabDocument *v34;
  id v36;

  v9 = a5;
  v10 = a4;
  v13 = a3;
  v36 = a6;
  v14 = a7;
  objc_msgSend(v13, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v13, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v13, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);
  v20 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:](self, "initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:", v16, v15, v19, v10, v9, v36, v14);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_tabGroupTab, a3);
    -[TabDocument setIsBlank:](v20, "setIsBlank:", v15 == 0);
    objc_msgSend(v13, "localAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ancestorTabUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_145_1);
    v23 = objc_claimAutoreleasedReturnValue();
    ancestorUUIDs = v20->_ancestorUUIDs;
    v20->_ancestorUUIDs = (NSArray *)v23;

    -[TabDocument setDisplayingStandaloneImage:](v20, "setDisplayingStandaloneImage:", objc_msgSend(v21, "isDisplayingStandaloneImage"));
    -[TabDocument setWasOpenedFromLink:](v20, "setWasOpenedFromLink:", objc_msgSend(v21, "wasOpenedFromLink"));
    objc_msgSend(v21, "readerViewTopScrollOffset");
    -[TabDocument setReaderViewTopScrollOffset:](v20, "setReaderViewTopScrollOffset:", (uint64_t)v25);
    -[TabDocument setShouldRestoreReader:](v20, "setShouldRestoreReader:", objc_msgSend(v21, "isShowingReader"));
    if (v9)
    {
      objc_msgSend(v21, "lastVisitTime");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      -[TabDocument setLastViewedTime:](v20, "setLastViewedTime:");

    }
    -[TabDocument setPinned:](v20, "setPinned:", objc_msgSend(v13, "isPinned"));
    objc_msgSend(v13, "pinnedURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    pinnedURL = v20->_pinnedURL;
    v20->_pinnedURL = (NSURL *)v28;

    objc_msgSend(v13, "pinnedTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    pinnedTitle = v20->_pinnedTitle;
    v20->_pinnedTitle = (NSString *)v31;

    if (objc_msgSend(v13, "isShared"))
      v33 = objc_msgSend(v13, "isMarkedAsRead") ^ 1;
    else
      v33 = 0;
    -[TabDocument setUnread:](v20, "setUnread:", v33);
    v20->_shouldDonatePageLoad = 1;
    -[TabDocument restoreStateFromTab:](v20, "restoreStateFromTab:", v13);
    v34 = v20;

  }
  return v20;
}

id __96__TabDocument_initWithTabGroupTab_privateBrowsingEnabled_hibernated_bookmark_browserController___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);

  return v3;
}

- (TabDocument)initWithHibernatedTab:(id)a3
{
  id v4;
  TabDocument *v5;
  uint64_t v6;
  WBTab *tabGroupTab;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUUID *uuid;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _SFBrowserConfiguration *configuration;
  LoadingController *v18;
  LoadingController *loadingController;
  uint64_t v20;
  UnifiedTabBarItem *unifiedTabBarItem;
  uint64_t v22;
  TabBarItem *tabBarItem;
  uint64_t v24;
  TabDocumentCollectionItem *tabCollectionItem;
  uint64_t v26;
  TabOverviewItem *tabOverviewItem;
  void *v28;
  uint64_t v29;
  SFNavigationBarItem *navigationBarItem;
  double v31;
  uint64_t v32;
  NSArray *ancestorUUIDs;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  uint64_t v39;
  NSURL *pinnedURL;
  void *v41;
  uint64_t v42;
  NSString *pinnedTitle;
  uint64_t v44;
  NSArray *shareParticipants;
  TabDocument *v46;

  v4 = a3;
  v5 = -[TabDocument init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "wbTab");
    v6 = objc_claimAutoreleasedReturnValue();
    tabGroupTab = v5->_tabGroupTab;
    v5->_tabGroupTab = (WBTab *)v6;

    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v4, "uuid");
    v10 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v10;

    objc_msgSend(v4, "browserController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument setBrowserController:afterTabGroupReuse:](v5, "setBrowserController:afterTabGroupReuse:", v12, 0);
    v13 = objc_alloc(MEMORY[0x1E0CD5668]);
    v14 = objc_msgSend(v4, "isPrivateBrowsingEnabled");
    objc_msgSend(v12, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithPrivateBrowsingEnabled:traitEnvironment:controlledByAutomation:", v14, v15, objc_msgSend(v12, "isControlledByAutomation"));
    configuration = v5->_configuration;
    v5->_configuration = (_SFBrowserConfiguration *)v16;

    v5->_hibernated = 1;
    v18 = objc_alloc_init(LoadingController);
    loadingController = v5->_loadingController;
    v5->_loadingController = v18;

    -[LoadingController setDelegate:](v5->_loadingController, "setDelegate:", v5);
    -[LoadingController setTitle:](v5->_loadingController, "setTitle:", v9);
    -[LoadingController setURL:](v5->_loadingController, "setURL:", v8);
    -[TabDocument _setUp]((uint64_t)v5);
    objc_msgSend(v4, "unifiedTabBarItem");
    v20 = objc_claimAutoreleasedReturnValue();
    unifiedTabBarItem = v5->_unifiedTabBarItem;
    v5->_unifiedTabBarItem = (UnifiedTabBarItem *)v20;

    objc_msgSend(v4, "tabBarItem");
    v22 = objc_claimAutoreleasedReturnValue();
    tabBarItem = v5->_tabBarItem;
    v5->_tabBarItem = (TabBarItem *)v22;

    objc_msgSend(v4, "tabCollectionItem");
    v24 = objc_claimAutoreleasedReturnValue();
    tabCollectionItem = v5->_tabCollectionItem;
    v5->_tabCollectionItem = (TabDocumentCollectionItem *)v24;

    objc_msgSend(v4, "tabOverviewItem");
    v26 = objc_claimAutoreleasedReturnValue();
    tabOverviewItem = v5->_tabOverviewItem;
    v5->_tabOverviewItem = (TabOverviewItem *)v26;

    objc_msgSend(v4, "cachedNavigationBarItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "cachedNavigationBarItem");
      v29 = objc_claimAutoreleasedReturnValue();
      navigationBarItem = v5->_navigationBarItem;
      v5->_navigationBarItem = (SFNavigationBarItem *)v29;

      -[TabDocument _setUpNavigationBarItem]((uint64_t)v5);
    }
    objc_msgSend(v4, "idForWebExtensions");
    v5->_idForWebExtensions = v31;
    -[TabDocument setChangedPropertiesForOnUpdatedWebExtensionEvent:](v5, "setChangedPropertiesForOnUpdatedWebExtensionEvent:", 0);
    -[TabDocument setIsBlank:](v5, "setIsBlank:", v8 == 0);
    objc_msgSend(v4, "ancestorUUIDs");
    v32 = objc_claimAutoreleasedReturnValue();
    ancestorUUIDs = v5->_ancestorUUIDs;
    v5->_ancestorUUIDs = (NSArray *)v32;

    -[WBTab localAttributes](v5->_tabGroupTab, "localAttributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayingStandaloneImage = objc_msgSend(v34, "isDisplayingStandaloneImage");
    v5->_wasOpenedFromLink = objc_msgSend(v34, "wasOpenedFromLink");
    objc_msgSend(v34, "readerViewTopScrollOffset");
    v5->_readerViewTopScrollOffset = (uint64_t)v35;
    v5->_shouldRestoreReader = objc_msgSend(v34, "isShowingReader");
    objc_msgSend(v34, "lastVisitTime");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timeIntervalSinceReferenceDate");
    v5->_lastViewedTime = v37;

    -[TabDocument setPinned:](v5, "setPinned:", objc_msgSend(v4, "isPinned"));
    objc_msgSend(v4, "pinnedURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "copy");
    pinnedURL = v5->_pinnedURL;
    v5->_pinnedURL = (NSURL *)v39;

    objc_msgSend(v4, "pinnedTitle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "copy");
    pinnedTitle = v5->_pinnedTitle;
    v5->_pinnedTitle = (NSString *)v42;

    objc_msgSend(v4, "shareParticipants");
    v44 = objc_claimAutoreleasedReturnValue();
    shareParticipants = v5->_shareParticipants;
    v5->_shareParticipants = (NSArray *)v44;

    v5->_unread = objc_msgSend(v4, "isUnread");
    v5->_shouldDonatePageLoad = 1;
    -[TabDocument restoreStateFromTab:](v5, "restoreStateFromTab:", v5->_tabGroupTab);
    v46 = v5;

  }
  return v5;
}

- (void)setUnifiedTabBarItem:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  if (a1)
  {
    v5 = *(id *)(a1 + 1048);
    if (v5 != v4)
    {
      v11 = v4;
      objc_msgSend(v5, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v6);
      v7 = (id *)(a1 + 1048);

      objc_msgSend(*(id *)(a1 + 1048), "icon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIcon:", v8);

      objc_msgSend(v11, "setUUID:", *(_QWORD *)(a1 + 1304));
      objc_msgSend(v11, "setNavigationBarItem:", *(_QWORD *)(a1 + 272));
      objc_msgSend(v11, "setPinned:", *(unsigned __int8 *)(a1 + 895));
      objc_msgSend(*(id *)(a1 + 1048), "navigationBarItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 272);

      if (v9 == v10)
        objc_msgSend(*v7, "setNavigationBarItem:", 0);
      objc_storeStrong(v7, a2);
      v4 = v11;
    }
  }

}

- (UnifiedTabBarItem)currentUnifiedTabBarItem
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  UnifiedTabBarItem *unifiedTabBarItem;
  UnifiedTabBarItem *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "displayMode");

  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v5 == 2)
  {
    -[UnifiedTabBarItem secondaryItem](unifiedTabBarItem, "secondaryItem");
    v7 = (UnifiedTabBarItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = unifiedTabBarItem;
  }
  return v7;
}

- (id)topBarThemeForTabOverviewShowingThemeColor:(BOOL)a3
{
  UIColor *themeColor;
  UIColor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;

  if (a3)
    themeColor = self->_themeColor;
  else
    themeColor = 0;
  v5 = themeColor;
  -[TabOverviewItem cachedTopBarTheme](self->_tabOverviewItem, "cachedTopBarTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"),
        v7 != objc_msgSend(v6, "tintStyle"))
    || (objc_msgSend(v6, "preferredBarTintColor"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = WBSIsEqual(),
        v8,
        (v9 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"), v5, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
    -[TabOverviewItem setCachedTopBarTheme:](self->_tabOverviewItem, "setCachedTopBarTheme:", v10);
  }

  return v6;
}

- (void)_clearLibraryType
{
  void *v2;
  id v3;
  id WeakRetained;

  if (a1)
  {
    v2 = *(void **)(a1 + 1264);
    if (v2)
    {
      *(_QWORD *)(a1 + 1264) = 0;
      v3 = v2;

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
      objc_msgSend(WeakRetained, "tabDocument:didClearLibraryType:", a1, v3);

    }
  }
}

- (BOOL)isPlayingAudio
{
  return -[_SFWebView _isPlayingAudio](self->_webView, "_isPlayingAudio");
}

- (void)freezeForNavigationGesture
{
  -[TabDocument setSuppressingProgressAnimationForNavigationGesture:](self, "setSuppressingProgressAnimationForNavigationGesture:", 1);
}

- (void)unfreezeAfterNavigationGesture:(BOOL)a3
{
  if (!a3)
    -[TabDocument setSuppressingProgressAnimationForNavigationGesture:](self, "setSuppressingProgressAnimationForNavigationGesture:", 0);
}

- (void)setNeedsNewTabSnapshot
{
  void *v3;
  id WeakRetained;

  if (!self->_closed && !self->_hibernated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateSnapshotForTab:", self);

  }
}

- (void)_updateSnapshotIfNeeded
{
  void *v1;
  id WeakRetained;

  if (a1 && !*(_BYTE *)(a1 + 898) && !*(_BYTE *)(a1 + 919) && !*(_BYTE *)(a1 + 933))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "updateSnapshotsForTabHoverPreviewIfNeeded");

  }
}

- (_SFWebView)frontWebView
{
  uint64_t v2;

  v2 = 1360;
  if (!self->_showingReader)
    v2 = 1008;
  return (_SFWebView *)*(id *)((char *)&self->super.isa + v2);
}

- (void)_loadDeferredURLIfNeeded
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_BYTE *)(a1 + 792))
  {
    v2 = *(id *)(a1 + 800);
    v3 = *(void **)(a1 + 800);
    *(_QWORD *)(a1 + 800) = 0;

    v4 = *(void **)(a1 + 808);
    *(_QWORD *)(a1 + 808) = 0;

    *(_BYTE *)(a1 + 792) = 0;
    v5 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 134218499;
      v8 = a1;
      v9 = 2160;
      v10 = 1752392040;
      v11 = 2117;
      v12 = v2;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Apply deferred navigation: (document: %p) %{sensitive, mask.hash}@", (uint8_t *)&v7, 0x20u);
    }
    v6 = -[TabDocument loadURL:userDriven:skipSyncableTabUpdates:]((void *)a1, v2, 0, *(_BYTE *)(a1 + 677));

  }
}

- (void)_notifyImpressionAnalyticsRecorderIfNeededTabDocumentDidBecomeActive:(uint64_t)a1
{
  char v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v3 = *(_BYTE *)(a1 + 752);
    if ((v3 & 1) != 0)
    {
      *(_BYTE *)(a1 + 752) = v3 & 0xFE;
LABEL_12:
      *(_QWORD *)(a1 + 744) = 0;
      return;
    }
    if ((*(_BYTE *)(a1 + 752) & 2) != 0 && (a2 & 1) == 0)
    {
      *(_BYTE *)(a1 + 752) = v3 & 0xFD;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
      objc_msgSend(WeakRetained, "tabController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeTabDocument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(a1 + 752) = *(_BYTE *)(a1 + 752) & 0xFB | (4 * (v6 != (void *)a1));

      if ((*(_BYTE *)(a1 + 752) & 4) != 0)
        return;
      goto LABEL_11;
    }
    if ((*(_BYTE *)(a1 + 752) & 4) != 0 && (a2 & 1) == 0)
    {
      *(_BYTE *)(a1 + 752) = v3 & 0xFB;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0D8AC30], "sharedRecorder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 1008), "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didActualizeImpressionForURL:provenance:", v8, *(_QWORD *)(a1 + 744));

      goto LABEL_12;
    }
  }
}

- (void)stopAdvertisingProactiveActivityContent
{
  -[TabDocument setSearchableItemAttributes:](self, "setSearchableItemAttributes:", 0);
  -[TabDocument updateUserActivity](self, "updateUserActivity");
}

- (void)_closeTabDocumentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  id v6;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "closeTabDocument:animated:", self, v3);

  objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTabNeedsSpotlightDeletion:", self);

}

- (void)willClose
{
  TabDocument *v3;
  void *v4;
  id v5;
  SFPinnableBanner *appBanner;
  SFPinnableBanner *appBannerPendingFirstPaint;
  WBSContentBlockerStatisticsStore *contentBlockerStatisticsStore;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabDocumentPlayingPIPVideo");
  v3 = (TabDocument *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    objc_msgSend(WeakRetained, "setTabDocumentPlayingPIPVideo:", 0);
  if (!self->_beingReleased && !self->_suppressWebExtensionEvents)
  {
    -[TabDocument webExtensionsController](self, "webExtensionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didCloseTab:windowIsClosing:", self, 0);

  }
  -[_SFCalendarEventDetector cancelCheckForConfirmationPage](self->_calendarEventDetector, "cancelCheckForConfirmationPage");
  -[_SFWebView setUIDelegate:](self->_webView, "setUIDelegate:", 0);
  -[SFDialogController owningTabWillClose](self->_dialogController, "owningTabWillClose");
  -[WBSPermissionDialogThrottler invalidate](self->_permissionDialogThrottler, "invalidate");
  -[TabDocument _removeParentChildTabDocumentRelations]((id *)&self->super.isa);
  -[_SFPageLoadErrorController clearCrashCountResetTimer](self->_pageLoadErrorController, "clearCrashCountResetTimer");
  -[TabDocument _destroyDocumentView]((uint64_t)self);
  -[TabDocument _cancelFaviconUpdate]((uint64_t)self);
  if (-[TabDocument isActive](self, "isActive"))
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "removeAppBannerFromTabDocument:animated:", self, 0);

  }
  appBanner = self->_appBanner;
  self->_appBanner = 0;

  appBannerPendingFirstPaint = self->_appBannerPendingFirstPaint;
  self->_appBannerPendingFirstPaint = 0;

  self->_appBannerRemovalWasDeferred = 0;
  contentBlockerStatisticsStore = self->_contentBlockerStatisticsStore;
  self->_contentBlockerStatisticsStore = 0;

  if ((objc_msgSend(WeakRetained, "isBackgrounded") & 1) == 0)
  {
    -[_SFReaderController readerURL](self->_readerContext, "readerURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeSiriReaderSessionURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if (v12)
      -[TabDocument dismissSiriReaderMediaSessionImmediately:](self, "dismissSiriReaderMediaSessionImmediately:", 0);
  }

}

- (void)didReplaceTabDocument:(id)a3
{
  void *v4;
  double v5;
  NSURL *v6;
  NSURL *previousURLForWebExtensionOnUpdatedEvent;
  void *v8;
  NSString *v9;
  NSString *previousTitleForWebExtensionOnUpdatedEvent;
  NSHTTPURLResponse *speculativeLoadNavigationResponse;
  NSHTTPURLResponse *v12;
  id *v13;

  v13 = (id *)a3;
  objc_msgSend(v13, "unifiedTabBarItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument setUnifiedTabBarItem:]((uint64_t)self, v4);

  -[TabDocument setUnifiedTabBarItem:]((uint64_t)v13, 0);
  -[TabDocument _updateBarItemsWithCurrentMediaState]((id *)&self->super.isa);
  -[TabDocument setPinned:](self, "setPinned:", *((unsigned __int8 *)v13 + 895));
  objc_storeStrong((id *)&self->_pinnedTitle, v13[136]);
  objc_storeStrong((id *)&self->_pinnedURL, v13[137]);
  self->_suppressWebExtensionEvents = 0;
  objc_msgSend(v13, "idForWebExtensions");
  self->_idForWebExtensions = v5;
  objc_msgSend(v13, "previousURLForWebExtensionOnUpdatedEvent");
  v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  previousURLForWebExtensionOnUpdatedEvent = self->_previousURLForWebExtensionOnUpdatedEvent;
  self->_previousURLForWebExtensionOnUpdatedEvent = v6;

  objc_msgSend(v13, "previousTitleForWebExtensionOnUpdatedEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSString *)objc_msgSend(v8, "copy");
  previousTitleForWebExtensionOnUpdatedEvent = self->_previousTitleForWebExtensionOnUpdatedEvent;
  self->_previousTitleForWebExtensionOnUpdatedEvent = v9;

  self->_previousLoadingCompleteStateForWebExtensionOnUpdatedEvent = objc_msgSend(v13, "previousLoadingCompleteStateForWebExtensionOnUpdatedEvent");
  -[TabDocument _loadingStateForWebExtensionsMayHaveChanged](self);
  speculativeLoadNavigationResponse = self->_speculativeLoadNavigationResponse;
  if (speculativeLoadNavigationResponse)
  {
    -[TabDocument _donateCurrentNavigationWithNavigationResponse:]((id *)&self->super.isa, speculativeLoadNavigationResponse);
    v12 = self->_speculativeLoadNavigationResponse;
    self->_speculativeLoadNavigationResponse = 0;

  }
}

- (id)_updateBarItemsWithCurrentMediaState
{
  id *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "updateMenuButtonShowsBadge");
    objc_msgSend(v1[130], "setMediaStateIcon:", v1[62]);
    objc_msgSend(v1[132], "setMediaStateIcon:", v1[62]);
    objc_msgSend(v1[131], "setMediaStateIcon:", v1[62]);
    return (id *)objc_msgSend(v1[133], "setMediaStateIcon:", v1[62]);
  }
  return result;
}

- (_BYTE)_loadingStateForWebExtensionsMayHaveChanged
{
  _BYTE *v1;

  if (result)
  {
    v1 = result;
    result = (_BYTE *)objc_msgSend(result, "isLoadingComplete");
    if (v1[930] != (_DWORD)result)
    {
      v1[930] = (_BYTE)result;
      return (_BYTE *)objc_msgSend(v1, "setChangedPropertiesForOnUpdatedWebExtensionEvent:", objc_msgSend(v1, "changedPropertiesForOnUpdatedWebExtensionEvent") | 8);
    }
  }
  return result;
}

- (void)_donateCurrentNavigationWithNavigationResponse:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  char v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend(a1, "isPrivateBrowsingEnabled") & 1) == 0)
    {
      objc_msgSend(v3, "URL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "isEqual:", v5);

      if ((v6 & 1) != 0)
      {
        v7 = objc_msgSend(a1[11], "loadedUsingDesktopUserAgent");
        v8 = objc_msgSend(a1[126], "_wasPrivateRelayed");
        v9 = objc_msgSend(v3, "statusCode");
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __62__TabDocument__donateCurrentNavigationWithNavigationResponse___block_invoke;
        v10[3] = &unk_1E9CF9948;
        v11 = v3;
        v12 = v7 ^ 1u;
        v14 = v8;
        v13 = v9;
        dispatch_async(MEMORY[0x1E0C80D38], v10);

      }
    }
  }

}

- (double)estimatedProgress
{
  float v2;

  -[LoadingController estimatedProgress](self->_loadingController, "estimatedProgress");
  return v2;
}

- (void)setShowingReader:(BOOL)a3
{
  _BOOL8 v3;
  SafariShared::ReaderAvailabilityController *v5;
  WKProcessPool *v6;
  id WeakRetained;

  if (self->_showingReader != a3)
  {
    v3 = a3;
    self->_showingReader = a3;
    -[SFNavigationBarItem setReaderButtonSelected:](self->_navigationBarItem, "setReaderButtonSelected:");
    -[SFDialogController owningTabWillClose](self->_dialogController, "owningTabWillClose");
    -[_SFReaderController setReaderIsActive:](self->_readerContext, "setReaderIsActive:", v3);
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "processPool");
      v5 = (SafariShared::ReaderAvailabilityController *)objc_claimAutoreleasedReturnValue();
      SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(v5, v6);

    }
  }
}

- (void)addAppHighlightCreatingLink:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v3 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemNoteTakingController");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[TabDocument webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_selectionAttributes");

  if ((v7 & 2) == 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0CA5920]);
    v9 = (void *)objc_msgSend(v8, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
    -[TabDocument urlForSharing](self, "urlForSharing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWebpageURL:", v10);

    -[TabDocument title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v11);

    LODWORD(v11) = objc_msgSend(v15, "isNotesPIPVisible");
    -[TabDocument webView](self, "webView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveHighlightsData:selectedText:selectedImage:newGroup:originatedInApp:webView:userActivity:", 0, 0, 0, v11 ^ 1, !v3, v12, v9);

LABEL_5:
    goto LABEL_6;
  }
  -[TabDocument webView](self, "webView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[TabDocument webView](self, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_addAppHighlightInNewGroup:originatedInApp:", objc_msgSend(v15, "isNotesPIPVisible") ^ 1, !v3);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)applyHighlightFromNotesIfNeeded
{
  void *v3;
  void *v4;
  NSUserActivity *userActivityFromNotes;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  if (self->_userActivityFromNotes)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemNoteTakingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isNoteTakingSupportedWithPrivateBrowsing:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled")) & 1) != 0)
    {
      userActivityFromNotes = self->_userActivityFromNotes;
      -[TabDocument webView](self, "webView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "applyHighlightInUserActivity:webView:", userActivityFromNotes, v6);

    }
    else
    {
      v7 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_INFO, "Not applying highlights from Notes because Quick Note is disabled in Private Browsing", v8, 2u);
      }
    }

  }
}

- (void)restoreAllHighlightsData
{
  void *v3;
  void *v4;
  NSUserActivity *v5;
  id v6;
  NSUserActivity *v7;
  void *v8;
  void *v9;
  void *v10;
  WKBackForwardListItem *v11;
  WKBackForwardListItem *backForwardListItemForCurrentNoteTakingCheck;
  _BOOL8 v13;
  _QWORD v14[4];
  id v15;
  id location;

  +[Application sharedApplication](Application, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemNoteTakingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isNotesPIPVisible") & 1) != 0)
  {
    v5 = self->_userActivityFromNotes;
    if (!v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CA5920]);
      v7 = (NSUserActivity *)objc_msgSend(v6, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
      -[TabDocument urlForSharing](self, "urlForSharing");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "safari_isHTTPFamilyURL"))
        -[NSUserActivity setWebpageURL:](v7, "setWebpageURL:", v8);
      -[TabDocument title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserActivity setTitle:](v7, "setTitle:", v9);

      v5 = v7;
    }
    -[_SFWebView backForwardList](self->_webView, "backForwardList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentItem");
    v11 = (WKBackForwardListItem *)objc_claimAutoreleasedReturnValue();
    backForwardListItemForCurrentNoteTakingCheck = self->_backForwardListItemForCurrentNoteTakingCheck;
    self->_backForwardListItemForCurrentNoteTakingCheck = v11;

    objc_initWeak(&location, self);
    v13 = -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__TabDocument_restoreAllHighlightsData__block_invoke;
    v14[3] = &unk_1E9CF8E00;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "fetchHighlightsForUserActivity:privateBrowsing:completion:", v5, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __39__TabDocument_restoreAllHighlightsData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained)
      goto LABEL_10;
    v8 = WeakRetained;
    v9 = WeakRetained[42];
    objc_msgSend(WeakRetained[126], "backForwardList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v11)
      objc_msgSend(v8[126], "_restoreAppHighlights:", v5);
    v12 = v8[42];
    v8[42] = 0;

  }
  if (v6)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __39__TabDocument_restoreAllHighlightsData__block_invoke_cold_1();
    }

  }
LABEL_10:

}

- (void)_loadingControllerWillLoadRequest:(uint64_t)a3 webView:(int)a4 userDriven:
{
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 680) = 0;
    *(_QWORD *)(a1 + 1184) = 0;
    objc_msgSend(*(id *)(a1 + 280), "owningWebViewWillNavigate");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend(WeakRetained, "userActivityController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabDocumentPendingUserActivityPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == (void *)a1)
      objc_msgSend(v7, "setTabDocumentPendingUserActivityPayload:", 0);
    v9 = *(void **)(a1 + 1232);
    if (v9)
      objc_msgSend(v9, "startedPageLoad");
    objc_msgSend(v12, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_webkit_scriptIfJavaScriptURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      *(_BYTE *)(a1 + 679) = 0;
      *(_BYTE *)(a1 + 675) = a4;
      *(_BYTE *)(a1 + 676) = 0;
      *(_BYTE *)(a1 + 686) = a4;
      -[TabDocument _clearLibraryType](a1);
    }
    if (*(_QWORD *)(a1 + 1296) && a4)
      objc_msgSend((id)a1, "clearTabReuseURL");
    if (*(_BYTE *)(a1 + 933) && a4)
      objc_msgSend(WeakRetained, "setWantsUnifiedFieldFocused:", 0);

  }
}

- (void)_loadingControllerDidStartLoading
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    *(_BYTE *)(a1 + 679) = 0;
    objc_msgSend(*(id *)(a1 + 1248), "clearFailedRequest");
    objc_msgSend((id)a1, "updateTabTitle");
    -[TabDocument _updateNavigationBarItem](a1);
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(a1 + 256);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v8;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "tabDocumentDidStartLoading:", a1, (_QWORD)v7);
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v3);
    }

  }
}

- (void)_loadingControllerEstimatedProgressChangedTo:(uint64_t)a1
{
  BOOL v4;
  int v5;
  id WeakRetained;
  id v7;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
    objc_msgSend(WeakRetained, "updateProgressWithResource:", a1);

    objc_msgSend(*(id *)(a1 + 168), "updateFluidProgressWithProgressStateSource:", a1);
    v4 = 0;
    v5 = *(unsigned __int8 *)(a1 + 920);
    if (a2 > 0.0 && a2 < 1.0)
      v4 = *(_QWORD *)(a1 + 944) != 0;
    *(_BYTE *)(a1 + 920) = v4;
    objc_msgSend(*(id *)(a1 + 272), "setStopReloadButtonShowsStop:");
    if (v5 != *(unsigned __int8 *)(a1 + 920))
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 1192));
      objc_msgSend(v7, "tabDocumentDidChangeCanStopLoadingState:", a1);

    }
  }
}

- (void)_didDecideNavigationPolicy:(void *)a3 forNavigationAction:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  double v16;
  double v17;
  _BOOL8 v18;
  void *v19;
  double v20;
  id v21;

  v5 = a3;
  if (a1)
  {
    v21 = v5;
    objc_msgSend(v5, "targetFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v21, "sourceFrame");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    if ((objc_msgSend(v9, "isMainFrame") & 1) != 0)
    {
      v10 = *(void **)(a1 + 1000);
      objc_msgSend(*(id *)(a1 + 1008), "backForwardList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "owningWebViewDidDecidePolicy:forNavigationAction:currentBackForwardListItem:", a2, v21, v12);

      if (!objc_msgSend(v21, "navigationType"))
        objc_msgSend((id)a1, "setNextLoadComesFromSearchPage:", objc_msgSend((id)a1, "isSearchPage"));
      -[TabDocument _updatePageLoadDonorWithNavigationPolicy:inMainFrameForNavigationAction:](a1, a2, v21);
      *(_BYTE *)(a1 + 752) &= ~4u;
      v13 = -[TabDocument _analyticsRecorderShouldIgnoreURLWithNavigationPolicy:forNavigationAction:]((void *)a1, a2, v21);
      v14 = *(_BYTE *)(a1 + 752) & 0xFC;
      if (v13)
      {
        *(_BYTE *)(a1 + 752) = v14 | 1;
        *(_QWORD *)(a1 + 744) = 0;
      }
      else
      {
        *(_BYTE *)(a1 + 752) = v14 | 2;
        *(_BYTE *)(a1 + 754) = 0;
        if (!objc_msgSend(v21, "navigationType"))
        {
          if (*(_QWORD *)(a1 + 840))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 840));
            v17 = v16;

            v18 = v17 < 10.0;
          }
          else
          {
            v18 = 0;
          }
          objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "pageZoomFactor");
          *(float *)&v20 = v20;
          objc_msgSend(v19, "didActivateLinkWithZoomScale:recentlyZoomedIn:", v18, v20);

        }
      }
    }

    v5 = v21;
  }

}

- (void)_updatePageLoadDonorWithNavigationPolicy:(void *)a3 inMainFrameForNavigationAction:
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  BOOL v10;
  id v11;

  v11 = a3;
  if (a1)
  {
    if (!a2)
      goto LABEL_7;
    objc_msgSend((id)a1, "committedURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if ((v8 & 1) != 0 || (v9 = objc_msgSend(v11, "navigationType"), v9 - 2 < 3))
    {
LABEL_7:
      v10 = 0;
    }
    else
    {
      if (v9 < 2)
        goto LABEL_6;
      if (v9 != -1)
        goto LABEL_9;
      if ((objc_msgSend(v11, "_isUserInitiated") & 1) != 0 || *(_BYTE *)(a1 + 873))
LABEL_6:
        v10 = 1;
      else
        v10 = objc_msgSend(*(id *)(a1 + 48), "navigationSource") == 0;
    }
    *(_BYTE *)(a1 + 872) = v10;
  }
LABEL_9:

}

- (uint64_t)_analyticsRecorderShouldIgnoreURLWithNavigationPolicy:(void *)a3 forNavigationAction:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    if (a2 && (objc_msgSend(v5, "navigationType") & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      objc_msgSend(a1, "committedURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", v10);

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)webPageID
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[TabDocument webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_webPageID");

  return v4;
}

- (BOOL)isContentReady
{
  return 1;
}

- (void)animateProgressForCompletedDocument
{
  if (!self->_fluidProgressState)
  {
    -[WBSFluidProgressController startFluidProgressWithProgressStateSource:](self->_fluidProgressController, "startFluidProgressWithProgressStateSource:", self);
    -[WBSFluidProgressState setHasCompletedLoad:](self->_fluidProgressState, "setHasCompletedLoad:", 1);
  }
}

- (BOOL)createFluidProgressState
{
  WBSFluidProgressState *v3;
  WBSFluidProgressState *fluidProgressState;
  WBSFluidProgressState *v5;
  void *v6;
  void *v7;

  if (!self->_fluidProgressState)
  {
    v3 = (WBSFluidProgressState *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A910]), "initWithType:", 0);
    fluidProgressState = self->_fluidProgressState;
    self->_fluidProgressState = v3;

    v5 = self->_fluidProgressState;
    -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_originalDataAsString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFluidProgressState setLoadURL:](v5, "setLoadURL:", v7);

  }
  return 1;
}

- (void)clearFluidProgressState
{
  WBSFluidProgressState *fluidProgressState;

  fluidProgressState = self->_fluidProgressState;
  self->_fluidProgressState = 0;

}

- (void)setSuppressingProgressAnimationForNavigationGesture:(BOOL)a3
{
  if (self->_suppressingProgressAnimationForNavigationGesture != a3)
  {
    self->_suppressingProgressAnimationForNavigationGesture = a3;
    if (a3)
      -[TabDocument beginSuppressingProgressAnimation](self, "beginSuppressingProgressAnimation");
    else
      -[TabDocument endSuppressingProgressAnimation](self, "endSuppressingProgressAnimation");
  }
}

- (void)beginSuppressingProgressAnimation
{
  unint64_t progressAnimationSuppressedCount;

  progressAnimationSuppressedCount = self->_progressAnimationSuppressedCount;
  if (!progressAnimationSuppressedCount)
  {
    -[WBSFluidProgressController setProgressAnimationSuppressed:forProgressStateSource:animated:](self->_fluidProgressController, "setProgressAnimationSuppressed:forProgressStateSource:animated:", 1, self, 1);
    progressAnimationSuppressedCount = self->_progressAnimationSuppressedCount;
  }
  self->_progressAnimationSuppressedCount = progressAnimationSuppressedCount + 1;
}

- (void)endSuppressingProgressAnimation
{
  -[TabDocument endSuppressingProgressAnimationAnimated:](self, "endSuppressingProgressAnimationAnimated:", 1);
}

- (void)endSuppressingProgressAnimationAnimated:(BOOL)a3
{
  unint64_t progressAnimationSuppressedCount;
  unint64_t v4;

  progressAnimationSuppressedCount = self->_progressAnimationSuppressedCount;
  if (progressAnimationSuppressedCount)
  {
    v4 = progressAnimationSuppressedCount - 1;
    self->_progressAnimationSuppressedCount = v4;
    if (!v4)
      -[WBSFluidProgressController setProgressAnimationSuppressed:forProgressStateSource:animated:](self->_fluidProgressController, "setProgressAnimationSuppressed:forProgressStateSource:animated:", 0, self, a3);
  }
}

- (void)fluidProgressRocketAnimationDidComplete
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentFluidProgressRocketAnimationDidComplete:", self);

  if (self->_shouldReflectTranslationAsFluidProgress)
    -[WBSTranslationContext clearFluidProgressState](self->_translationContext, "clearFluidProgressState");
}

- (id)currentFluidProgressStateSource
{
  void *downloadReflectedInFluidProgress;

  downloadReflectedInFluidProgress = self->_downloadReflectedInFluidProgress;
  if (!downloadReflectedInFluidProgress)
  {
    if (self->_shouldReflectTranslationAsFluidProgress)
      downloadReflectedInFluidProgress = self->_translationContext;
    else
      downloadReflectedInFluidProgress = self;
  }
  return downloadReflectedInFluidProgress;
}

- (void)fetchCanonicalURLWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  _BOOL4 v5;
  NSURL *cachedCanonicalURL;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, void *);
  id v11;
  id location;

  v4 = (void (**)(id, void *))a3;
  v5 = -[TabDocument isShowingStartPageOverriddenByExtension](self, "isShowingStartPageOverriddenByExtension");
  if (-[TabDocument isBlank](self, "isBlank") || v5)
  {
    cachedCanonicalURL = self->_cachedCanonicalURL;
    self->_cachedCanonicalURL = 0;

    -[TabDocument cachedCanonicalURLOrURLForSharing](self, "cachedCanonicalURLOrURLForSharing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

  }
  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD57B8]), "initWithWebView:", self->_webView);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__TabDocument_fetchCanonicalURLWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E9CF8E28;
    objc_copyWeak(&v11, &location);
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "fetchSharingLinkWithCompletionHandler:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __54__TabDocument_fetchCanonicalURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_storeStrong(WeakRetained + 64, a2);
  -[TabDocument _loadActivityItemProviderIfNeeded]((uint64_t)WeakRetained);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cachedCanonicalURLOrURLForSharing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

- (void)_loadActivityItemProviderIfNeeded
{
  ActionPanelActivityItemProvider *v2;
  void *v3;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 520))
    {
      v2 = -[ActionPanelActivityItemProvider initWithTabDocument:]([ActionPanelActivityItemProvider alloc], "initWithTabDocument:", a1);
      v3 = *(void **)(a1 + 520);
      *(_QWORD *)(a1 + 520) = v2;

    }
  }
}

- (void)_clearCachedCanonicalURL
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 512);
    *(_QWORD *)(a1 + 512) = 0;

    v3 = *(void **)(a1 + 520);
    *(_QWORD *)(a1 + 520) = 0;

  }
}

- (NSURL)cachedCanonicalURLOrURLForSharing
{
  NSURL *cachedCanonicalURL;

  cachedCanonicalURL = self->_cachedCanonicalURL;
  if (cachedCanonicalURL)
    return cachedCanonicalURL;
  -[TabDocument urlForSharing](self, "urlForSharing");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (ActionPanelActivityItemProvider)activityItemProvider
{
  -[TabDocument _loadActivityItemProviderIfNeeded]((uint64_t)self);
  return self->_cachedActivityItemProvider;
}

- (id)URLForStatePersisting
{
  NSURL *deferredNavigationURL;

  deferredNavigationURL = self->_deferredNavigationURL;
  if (deferredNavigationURL)
    return deferredNavigationURL;
  -[LoadingController URLForStatePersisting](self->_loadingController, "URLForStatePersisting");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)clearTabReuseURL
{
  NSURL *tabReuseURL;

  tabReuseURL = self->_tabReuseURL;
  self->_tabReuseURL = 0;

}

- (void)clearBrowserController
{
  BrowserController **p_browserController;
  id WeakRetained;
  void *v5;

  p_browserController = &self->_browserController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willLoseOwnershipOfTab:", self);

  objc_storeWeak((id *)p_browserController, 0);
}

- (void)setUuid:(id)a3
{
  void *v4;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *uuid;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTabNeedsSpotlightDeletion:", self);

  v5 = self->_uuid;
  v6 = (NSUUID *)objc_msgSend(v11, "copy");
  uuid = self->_uuid;
  self->_uuid = v6;

  -[TabOverviewItem setUUID:](self->_tabOverviewItem, "setUUID:", self->_uuid);
  -[TabBarItem setUUID:](self->_tabBarItem, "setUUID:", self->_uuid);
  -[UnifiedTabBarItem setUUID:](self->_unifiedTabBarItem, "setUUID:", self->_uuid);
  -[TabDocumentCollectionItem setUUID:](self->_tabCollectionItem, "setUUID:", self->_uuid);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabDocumentDidUpdateUUID:previousUUID:", self, v5);

  -[WBTab uuid](self->_tabGroupTab, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _activeParticipantsDidUpdateInTabWithUUID:]((id *)&self->super.isa, v10);

  -[TabDocument indexTabToCoreSpotlight](self, "indexTabToCoreSpotlight");
  if ((WBSIsEqual() & 1) == 0)
    -[TabDocument _notifyDidUpdateTabCollectionItem]((id *)&self->super.isa);

}

- (void)setQuickLookDocumentForCurrentBackForwardListItem:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1008), "backForwardList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sf_setQuickLookDocument:", v5);

  }
}

- (NSString)titleForNewBookmark
{
  return (NSString *)-[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((id *)&self->super.isa, 0, 0, 0);
}

- (NSString)titleForCloudTab
{
  return (NSString *)-[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((id *)&self->super.isa, 1, 1, 1);
}

- (id)_titleForStatePersistingForTabStateData
{
  id *v1;
  id v2;
  void *v3;
  void *v4;
  id *v5;

  v1 = a1;
  if (a1)
  {
    v2 = a1[101];
    if (v2)
    {
      v1 = (id *)v2;
    }
    else
    {
      objc_msgSend(a1[20], "titleForStatePersisting");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        v5 = v3;
      }
      else
      {
        -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:](v1, 0, 1, 0);
        v5 = (id *)objc_claimAutoreleasedReturnValue();
      }
      v1 = v5;

    }
  }
  return v1;
}

- (NSString)suggestedTitleForCurrentURL
{
  id v3;
  void *v4;
  void *v5;

  if (-[TabDocument isShowingErrorPage](self, "isShowingErrorPage"))
  {
    v3 = 0;
  }
  else
  {
    -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((id *)&self->super.isa, 0, 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v5 = v4;
    else
      v5 = 0;
    v3 = v5;

  }
  return (NSString *)v3;
}

- (id)loadRequest:(id)a3 userDriven:(BOOL)a4
{
  -[TabDocument _loadRequest:userDriven:shouldOpenExternalURLs:]((uint64_t)self, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_loadRequest:(uint64_t)a1 userDriven:(void *)a2 shouldOpenExternalURLs:(uint64_t)a3
{
  id v5;
  void *v6;

  v5 = a2;
  if (a1)
  {
    -[TabDocument _loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:skipSyncableTabUpdates:](a1, v5, a3, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_loadRequest:(uint64_t)a3 userDriven:(uint64_t)a4 shouldOpenExternalURLs:(void *)a5 eventAttribution:(char)a6 skipSyncableTabUpdates:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  id v33;
  char v34;
  char v35;

  v11 = a2;
  v12 = a5;
  if (a1)
  {
    *(_BYTE *)(a1 + 677) = a6;
    objc_msgSend(v11, "safari_requestBySettingIsUserInitiated:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TabDocument _requestBySettingAdvancedPrivacyProtectionsFlag:]((void *)a1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)a1, "webExtensionsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "canonicalURLForWebExtensionURL:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v18, "setURL:", v17);
      v11 = (id)objc_msgSend(v18, "copy");

    }
    else
    {
      v11 = v14;
    }

    objc_msgSend(v11, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _createNewDocumentViewIfNecessaryForURL:]((void *)a1, v19);

    v20 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;

    if ((_DWORD)a3)
    {
      objc_msgSend(*(id *)(a1 + 280), "presentedDialog");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "completionHandlerBlocksWebProcess");

    }
    else
    {
      v22 = 0;
    }
    objc_msgSend((id)a1, "webExtensionsController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "webExtensionForURL:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25
      || (objc_msgSend(v25, "extensionsController"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v25, "extension"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v26, "extensionIsEnabled:", v27),
          v27,
          v26,
          (v28 & 1) != 0))
    {
      v29 = *(void **)(a1 + 1008);
      if (!v29 || ((objc_msgSend(v29, "_webProcessIsResponsive") ^ 1 | v22) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 160), "loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:", v11, a3, a4, v12);
        a1 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __102__TabDocument__loadRequest_userDriven_shouldOpenExternalURLs_eventAttribution_skipSyncableTabUpdates___block_invoke;
      v31[3] = &unk_1E9CF8E50;
      v31[4] = a1;
      v32 = v11;
      v34 = a3;
      v35 = a4;
      v33 = v12;
      -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:](a1, 0, v31);

    }
    a1 = 0;
LABEL_15:

  }
  return (id)a1;
}

- (id)_requestBySettingAdvancedPrivacyProtectionsFlag:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "supportsAdvancedPrivacyProtectionsForURL:", v5);

    objc_msgSend(v4, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    v4 = v8;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)_createNewDocumentViewIfNecessaryForURL:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1 && (-[TabDocument _isNewDocumentViewNecessaryForURL:](a1, v3) & 1) != 0)
  {
    objc_msgSend(a1, "webExtensionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webExtensionForURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v5, "extensionWebViewConfiguration");
    else
      -[TabDocument _webViewConfiguration]((id *)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sessionState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TabDocument _destroyDocumentView]((uint64_t)a1);
    -[TabDocument _createDocumentViewWithConfiguration:]((uint64_t)a1, v7);
    objc_msgSend(a1, "webView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "_restoreSessionState:andNavigate:", v9, 0);

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __102__TabDocument__loadRequest_userDriven_shouldOpenExternalURLs_eventAttribution_skipSyncableTabUpdates___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
}

- (void)_terminateWebProcessIfNeededAndShowCrashBanner:(void *)a3 thenDo:
{
  void (**v5)(_QWORD);
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 432))
    {
      v6 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:].cold.2();
    }
    objc_msgSend(*(id *)(a1 + 280), "presentedDialog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "completionHandlerBlocksWebProcess");

    if (v8)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:].cold.1();
      v10 = _Block_copy(v5);
      v11 = *(void **)(a1 + 432);
      *(_QWORD *)(a1 + 432) = v10;

      *(_BYTE *)(a1 + 705) = a2 ^ 1;
      -[TabDocument _terminateWebProcessThenDoUnresponsiveWebProcessBlock](a1);
    }
    else
    {
      v12 = *(void **)(a1 + 1008);
      if (v12 && !objc_msgSend(v12, "_webProcessIsResponsive"))
      {
        v13 = _Block_copy(v5);
        v14 = *(void **)(a1 + 432);
        *(_QWORD *)(a1 + 432) = v13;

        *(_BYTE *)(a1 + 705) = a2 ^ 1;
        objc_msgSend(*(id *)(a1 + 424), "invalidate");
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__unresponsiveWebProcessTimerFired_, 0, 0, 0.3);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 424);
        *(_QWORD *)(a1 + 424) = v15;

      }
      else
      {
        v5[2](v5);
      }
    }
  }

}

- (void)_updateSnapshotForWebClip:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "iconIsScreenShotBased") & 1) != 0)
    {
      objc_msgSend(v4, "iconImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scale");
      v7 = v6;

      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scale");
      v10 = v9;

      if (v7 != v10 || (objc_msgSend(v4, "iconIsPrerendered") & 1) == 0)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __41__TabDocument__updateSnapshotForWebClip___block_invoke;
        v11[3] = &unk_1E9CF8E78;
        v12 = v4;
        objc_msgSend(a1, "snapshotForWebClipIcon:", v11);

      }
    }
  }

}

void __41__TabDocument__updateSnapshotForWebClip___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIconImageFromScreenshot:", v3);
    objc_msgSend(*(id *)(a1 + 32), "updateOnDisk");
    objc_msgSend(*(id *)(a1 + 32), "requestIconUpdateInSpringBoard");
  }

}

- (void)snapshotForWebClipIcon:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CA5860], "_applicationIconCanvasSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  -[TabDocument snapshotWithSize:options:completion:](self, "snapshotWithSize:options:completion:", 0, v11, v5 / v10, v7 / v10);
}

- (void)snapshotWithSize:(CGSize)a3 options:(unint64_t)a4 completion:(id)a5
{
  double height;
  double width;
  BrowserController **p_browserController;
  id v10;
  id WeakRetained;

  height = a3.height;
  width = a3.width;
  p_browserController = &self->_browserController;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "snapshotTabDocument:size:topBackdropHeight:options:completion:", self, a4, v10, width, height, 0.0);

}

- (void)snapshotWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  double height;
  double width;
  BrowserController **p_browserController;
  id v12;
  id WeakRetained;

  height = a3.height;
  width = a3.width;
  p_browserController = &self->_browserController;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "snapshotTabDocument:size:topBackdropHeight:options:completion:", self, a5, v12, width, height, a4);

}

- (void)dispatchNavigationIntent:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[TabDocument uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceTabUUID:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceWindowUUID:", v6);

  +[Application sharedApplication](Application, "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleNavigationIntent:completion:", v8, 0);

}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id WeakRetained;
  void *v9;
  TabDocument *v10;
  NSObject *v11;
  void *v12;
  _SFWebView *webView;
  _BOOL4 supportsReuseForSpotlightSearch;
  SLHighlight *v15;
  SLHighlight *highlightFromNavigation;
  int v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  unsigned int v21;
  BOOL v22;
  uint64_t v23;
  int v24;
  id v25;
  _BOOL8 v26;
  int v27;
  TabDocument *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  _SFWebView *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeTabDocument");
  v10 = (TabDocument *)objc_claimAutoreleasedReturnValue();

  if (v10 == self)
    -[TabDocument setActive:](self, "setActive:", 1);
  else
    -[TabDocument unhibernate](self, "unhibernate");
  v11 = (id)WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "privacyPreservingDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    webView = self->_webView;
    v27 = 134218498;
    v28 = self;
    v29 = 2114;
    v30 = v12;
    v31 = 2048;
    v32 = webView;
    _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "TabDocument %p: loading intent %{public}@, web view: %p", (uint8_t *)&v27, 0x20u);

  }
  if (!objc_msgSend(v6, "policy") && -[TabDocument isActive](self, "isActive"))
    objc_msgSend(WeakRetained, "setFavoritesState:animated:", 0, 1);
  self->_flags.impressionProvenance = objc_msgSend(v6, "provenance");
  self->_flags.shouldDisallowRedirectToExternalAppsForCurrentLoad = objc_msgSend(v6, "type") == 8;
  supportsReuseForSpotlightSearch = self->_supportsReuseForSpotlightSearch;
  self->_supportsReuseForSpotlightSearch = 0;
  objc_msgSend(v6, "highlight");
  v15 = (SLHighlight *)objc_claimAutoreleasedReturnValue();
  highlightFromNavigation = self->_highlightFromNavigation;
  self->_highlightFromNavigation = v15;

  if (objc_msgSend(v6, "policy"))
    LOBYTE(v17) = 0;
  else
    v17 = objc_msgSend(v6, "isChildIntent") ^ 1;
  self->_allowsSwitchingToPinnedTabOnNavigation = v17;
  self->_didSpawnNewTabOnNavigationFromPinnedTab = 0;
  v18 = 0;
  switch(objc_msgSend(v6, "type"))
  {
    case 0:
      objc_msgSend(v6, "bookmark");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[TabDocument _loadBookmark:]((uint64_t)self, v19);
      goto LABEL_24;
    case 1:
      objc_msgSend(v6, "cloudTab");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument loadCloudTab:](self, "loadCloudTab:", v19);
      goto LABEL_19;
    case 2:
      objc_msgSend(v6, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
      v25 = -[TabDocument loadURL:userDriven:](self, "loadURL:userDriven:", v19, 1);
      goto LABEL_25;
    case 4:
      objc_msgSend(v6, "text");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[TabDocument _loadUserTypedAddress:]((uint64_t)self, v19);
      goto LABEL_24;
    case 5:
      objc_msgSend(v6, "text");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[TabDocument _loadSearchResultForQuery:]((id *)&self->super.isa, v19);
LABEL_24:
      v18 = v24;
      goto LABEL_25;
    case 6:
    case 8:
      objc_msgSend(v6, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument loadURL:userDriven:](self, "loadURL:userDriven:", v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20 != 0;

      goto LABEL_25;
    case 7:
      v21 = objc_msgSend(v6, "externalURLSourceApplicationIsSpotlight");
      v22 = v21;
      if (supportsReuseForSpotlightSearch)
        v23 = v21;
      else
        v23 = 0;
      -[_SFWebView setObscuringContents:](self->_webView, "setObscuringContents:", v23);
      self->_supportsReuseForSpotlightSearch = v22;
      objc_msgSend(v6, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument _loadExternalURL:withIntent:]((uint64_t)self, v19, v6);
LABEL_19:
      v18 = 1;
LABEL_25:

      break;
    default:
      break;
  }
  if (v7)
  {
    v26 = !self->_didSpawnNewTabOnNavigationFromPinnedTab && v18;
    v7[2](v7, v26);
  }

}

- (uint64_t)_loadBookmark:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[WebBookmark safari_bestCurrentURL](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isReadingListItem"))
    {
      objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isNetworkReachable");

      if (v5)
        v8 = 1;
      else
        v8 = v7;
      if ((v8 & 1) == 0)
      {
        v10 = *(void **)(a1 + 1248);
        _WBSLocalizedString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _WBSLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAlertWithTitle:bodyText:", v11, v12);

        goto LABEL_12;
      }
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didOpenReadingListItemWithReachableNetwork:isContinuousTransition:", v7, 0);

      }
    }
    if ((-[TabDocument _trySwitchingToPinnedTabOnNavigationToURL:](a1, v5) & 1) == 0)
    {
      -[TabDocument _loadURL:fromBookmark:]((id *)a1, v5, v4);
      a1 = 1;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    a1 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return a1;
}

- (uint64_t)_loadUserTypedAddress:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = a2;
  if (a1)
  {
    if (gTestFileURLs
      || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isFileURL"),
          v4,
          !v5))
    {
      if (!objc_msgSend(v3, "safari_isJavaScriptURLString"))
      {
        objc_msgSend((id)a1, "setReadingListBookmark:", 0);
        *(_BYTE *)(a1 + 899) = 0;
        *(_BYTE *)(a1 + 677) = 0;
        v6 = WBSUnifiedFieldInputTypeForString();
        if ((unint64_t)(v6 - 1) < 2)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "safari_isSafariWebExtensionURL");

          objc_msgSend((id)a1, "webView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_committedURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "safari_isSafariWebExtensionURL");

          if (((v12 ^ 1 | v9) & 1) == 0)
          {
            -[TabDocument _destroyDocumentView](a1);
            -[TabDocument _webViewConfiguration]((id *)a1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[TabDocument _createDocumentViewWithConfiguration:](a1, v13);

          }
          -[TabDocument _updateFallbackURLsForUserTypedAddress:](a1, v3);
          v7 = -[TabDocument _loadNextFallbackURLWithWebClip:navigation:](a1, 0, 0);
        }
        else
        {
          if (v6 && v6 != 3)
            goto LABEL_7;
          v7 = -[TabDocument _loadSearchResultForQuery:]((id *)a1, v3);
        }
        a1 = v7;
        goto LABEL_16;
      }
      objc_msgSend(*(id *)(a1 + 1248), "addDisallowedUseOfJavaScriptAlert");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 1248), "addDisallowedFileURLAlert");
    }
LABEL_7:
    a1 = 0;
  }
LABEL_16:

  return a1;
}

- (uint64_t)_loadSearchResultForQuery:(id *)a1
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 117);
    objc_msgSend(WeakRetained, "updateSearchEngineIfNeeded");
    objc_msgSend(v3, "_web_stringByTrimmingWhitespace");
    v5 = objc_claimAutoreleasedReturnValue();

    +[SearchQueryBuilder searchQueryBuilderWithQuery:forPrivateBrowsing:](SearchQueryBuilder, "searchQueryBuilderWithQuery:forPrivateBrowsing:", v5, objc_msgSend(a1, "isPrivateBrowsingEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (+[RecentWebSearchesController sharedController](RecentWebSearchesController, "sharedController"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "addRecentSearch:", v5),
          v8,
          (-[TabDocument _trySwitchingToPinnedTabOnNavigationToURL:]((uint64_t)a1, v7) & 1) == 0))
    {
      v9 = 1;
      v10 = (id)objc_msgSend(a1, "loadURL:userDriven:", v7, 1);
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(WeakRetained, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tipsCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateWebSearchTip");

    v3 = (id)v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_loadExternalURL:(void *)a3 withIntent:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "externalOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TabDocument urlForExternalURL:forPrivateBrowsing:](TabDocument, "urlForExternalURL:forPrivateBrowsing:", v17, objc_msgSend((id)a1, "isPrivateBrowsingEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(a1 + 1240), v8);
    objc_msgSend(v6, "eventAttribution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TabDocument _loadURL:userDriven:eventAttribution:skipSyncableTabUpdates:]((void *)a1, v8, 1, v9, 0);

    objc_storeStrong((id *)(a1 + 1296), v8);
    objc_msgSend(v7, "safari_stringForKey:", *MEMORY[0x1E0DC47C8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.SafariViewService")))
    {
      *(_BYTE *)(a1 + 901) = objc_msgSend(v7, "safari_BOOLForKey:", *MEMORY[0x1E0D4F218]);
      objc_msgSend(v7, "safari_stringForKey:", *MEMORY[0x1E0D4F228]);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 1352);
      *(_QWORD *)(a1 + 1352) = v12;

      objc_msgSend(v7, "safari_dataForKey:", *MEMORY[0x1E0D4F220]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6D0]), "initWithData:", v14);
        if (v15)
          objc_msgSend((id)a1, "restoreSessionState:andNavigate:fromSafariViewService:", v15, 1, 1);

      }
    }
    else
    {
      if (objc_msgSend(v7, "safari_BOOLForKey:", *MEMORY[0x1E0DC4788]))
        *(_BYTE *)(a1 + 902) = 1;
      objc_storeStrong((id *)(a1 + 1352), v11);
      v16 = v11;
      v14 = *(void **)(a1 + 1160);
      *(_QWORD *)(a1 + 1160) = v16;
    }

  }
}

- (id)loadURL:(id)a3 userDriven:(BOOL)a4
{
  -[TabDocument loadURL:userDriven:skipSyncableTabUpdates:](self, a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)loadURL:(uint64_t)a3 userDriven:(char)a4 skipSyncableTabUpdates:
{
  id v7;
  void *v8;

  v7 = a2;
  if (a1)
  {
    -[TabDocument _loadURL:userDriven:eventAttribution:skipSyncableTabUpdates:](a1, v7, a3, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_loadURL:(uint64_t)a3 userDriven:(void *)a4 eventAttribution:(char)a5 skipSyncableTabUpdates:
{
  id v9;
  id v10;
  void *v11;

  v9 = a2;
  v10 = a4;
  if (a1)
  {
    objc_msgSend(a1, "setReadingListBookmark:", 0);
    -[TabDocument _loadURLInternal:userDriven:eventAttribution:skipSyncableTabUpdates:]((uint64_t)a1, v9, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)loadURL:(id)a3 title:(id)a4 skipSyncableTabUpdates:(BOOL)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (self->_active && !self->_hibernated)
  {
    v9 = -[TabDocument loadURL:userDriven:skipSyncableTabUpdates:](self, v10, 0, a5);
  }
  else
  {
    self->_skipSyncableTabUpdates = a5;
    -[TabDocument _setDeferredNavigationURL:title:]((uint64_t)self, v10, v8);
  }

}

- (void)_setDeferredNavigationURL:(void *)a3 title:
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    v9 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 134218499;
      v16 = a1;
      v17 = 2160;
      v18 = 1752392040;
      v19 = 2117;
      v20 = v6;
      _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_INFO, "Store deferred navigation: (document: %p) %{sensitive, mask.hash}@", (uint8_t *)&v15, 0x20u);
    }
    *(_BYTE *)(a1 + 792) = 1;
    objc_storeStrong((id *)(a1 + 800), a2);
    v10 = objc_msgSend(v7, "copy");
    v11 = *(void **)(a1 + 808);
    *(_QWORD *)(a1 + 808) = v10;

    *(_BYTE *)(a1 + 927) = 0;
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeSnapshotForTabWithUUID:", v13);

    objc_msgSend(*(id *)(a1 + 160), "setTitle:", v7);
    objc_msgSend(*(id *)(a1 + 160), "setURL:", v6);
    objc_msgSend((id)a1, "updateTabTitle");
    objc_msgSend((id)a1, "updateTabIcon");
    objc_msgSend(WeakRetained, "tabController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateWBTabWithTab:notify:persist:", a1, 0, 0);

    objc_msgSend((id)a1, "hibernate");
  }

}

- (id)_loadURLInternal:(uint64_t)a3 userDriven:(void *)a4 eventAttribution:(char)a5 skipSyncableTabUpdates:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v9 = a2;
  v10 = a4;
  if (a1)
  {
    *(_BYTE *)(a1 + 792) = 0;
    v11 = *(void **)(a1 + 800);
    *(_QWORD *)(a1 + 800) = 0;

    objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 1232))
      objc_msgSend((id)a1, "clearPageLoadStatistics");
    objc_msgSend((id)a1, "setSuppressingProgressAnimationForNavigationGesture:", 0);
    v13 = *(void **)(a1 + 304);
    *(_QWORD *)(a1 + 304) = 0;

    objc_msgSend(MEMORY[0x1E0DC3F68], "webClipWithURL:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[TabDocument loadWebClip:userDriven:]((_BYTE *)a1, v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend((id)a1, "shouldSpawnNewTabOnNavigationFromPinnedTabWithDestinationURL:", v9))
      {
        objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPrefersOpenInNewTabReusingExistingBlankTabIfPossible:", 1);
        objc_msgSend(v16, "navigationIntentWithURL:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "dispatchNavigationIntent:", v17);

        *(_BYTE *)(a1 + 713) = 1;
        a1 = 0;
LABEL_10:

        goto LABEL_11;
      }
      -[TabDocument _loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:skipSyncableTabUpdates:](a1, v12, a3, *(_QWORD *)(a1 + 1240) != 0, v10, a5);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v15;
    goto LABEL_10;
  }
LABEL_11:

  return (id)a1;
}

- (id)_loadURLInternal:(uint64_t)a3 userDriven:
{
  id v5;
  void *v6;

  v5 = a2;
  if (a1)
  {
    -[TabDocument _loadURLInternal:userDriven:eventAttribution:skipSyncableTabUpdates:](a1, v5, a3, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_BYTE)loadWebClip:(_BYTE *)a1 userDriven:(void *)a2
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (id)WBS_LOG_CHANNEL_PREFIXWebClips();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v5;
        v15 = 2048;
        v16 = objc_msgSend(v3, "bundleVersion");
        _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_INFO, "Loading UIWebClip with identifier %{public}@'; version: %lu",
          buf,
          0x16u);

      }
    }
    a1[677] = 0;
    a1[711] = 1;
    objc_msgSend(v3, "pageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[TabDocument _updateFallbackURLsForUserTypedAddress:]((uint64_t)a1, v7);
    v12 = 0;
    v8 = -[TabDocument _loadNextFallbackURLWithWebClip:navigation:]((uint64_t)a1, v3, &v12);
    v9 = v12;
    v10 = v9;
    if (v8)
      a1 = v9;
    else
      a1 = 0;

  }
  return a1;
}

- (void)clearPageLoadStatistics
{
  PageLoadTestStatistics *pageLoadStatistics;

  pageLoadStatistics = self->_pageLoadStatistics;
  self->_pageLoadStatistics = 0;

}

- (void)setNeedsSendTelemetryForProvisionalLoad
{
  self->_needsSendTelemetryForProvisionalLoad = 1;
}

- (uint64_t)_loadURL:(void *)a3 fromBookmark:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_scriptIfJavaScriptURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1[126], "evaluateJavaScript:completionHandler:", v9, 0);
  }
  else
  {
    if (!v5)
    {
      v10 = 0;
      goto LABEL_5;
    }
    v12 = -[TabDocument _loadURLInternal:userDriven:]((uint64_t)a1, v5, 1);
    if (objc_msgSend(v7, "isReadingListItem"))
    {
      objc_msgSend(a1, "setReadingListBookmark:", v7);
    }
    else
    {
      objc_msgSend(a1, "setReadingListBookmark:", 0);
      objc_storeStrong(a1 + 38, a3);
    }
  }
  v10 = 1;
LABEL_5:

LABEL_6:
  return v10;
}

- (void)loadURLForContinuousReadingList:(id)a3 fromBookmark:(id)a4
{
  -[TabDocument _loadURL:fromBookmark:]((id *)&self->super.isa, a3, a4);
}

- (uint64_t)_trySwitchingToPinnedTabOnNavigationToURL:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 712))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend(WeakRetained, "tabController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "trySwitchingToPinnedTabOnNavigationToURL:", v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)loadCloudTab:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TabDocument loadURL:userDriven:](self, "loadURL:userDriven:", v4, 1);

  -[TabDocument restoreScrollPositionWithCloudTab:](self, "restoreScrollPositionWithCloudTab:", v6);
}

- (void)restoreScrollPositionWithCloudTab:(id)a3
{
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *initialArticleScrollDictionaryForCloudTab;
  id v8;

  v8 = a3;
  -[TabDocument clearReaderScrollInformation](self, "clearReaderScrollInformation");
  if (objc_msgSend(v8, "isShowingReader"))
  {
    self->_shouldRestoreReader = 1;
    v4 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v8, "readerScrollPositionDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v5);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    initialArticleScrollDictionaryForCloudTab = self->_initialArticleScrollDictionaryForCloudTab;
    self->_initialArticleScrollDictionaryForCloudTab = v6;

  }
}

- (void)goBack
{
  -[TabDocument goBackAllowingNewTabToSpawnIfNeeded:](self, "goBackAllowingNewTabToSpawnIfNeeded:", 0);
}

- (void)goBackAllowingNewTabToSpawnIfNeeded:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  self->_wasOpenedFromHistory = 1;
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__TabDocument_goBackAllowingNewTabToSpawnIfNeeded___block_invoke;
  v3[3] = &unk_1E9CF3818;
  v3[4] = self;
  v4 = a3;
  -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v3);
}

void __51__TabDocument_goBackAllowingNewTabToSpawnIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "backForwardList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationIntentWithHistoryURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "safari_highlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlight:", v6);

    if (objc_msgSend(v5, "policy"))
    {
      objc_msgSend(*(id *)(a1 + 32), "dispatchNavigationIntent:", v5);
LABEL_9:

      goto LABEL_10;
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "goBack");
  v7 = objc_msgSend(*(id *)(a1 + 32), "canGoBackToParentTab");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "goBackToParentTab");
  }
  else if (objc_msgSend(v8, "canGoBack"))
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bookmarkWithID:", -[WKBackForwardListItem safari_bookmarkID](v9));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setReadingListBookmark:", v5);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)goBackToParentTab
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentShouldCloseAndSwitchToParentTab:", self);

}

- (void)goForward
{
  -[TabDocument goForwardAllowingNewTabToSpawnIfNeeded:](self, "goForwardAllowingNewTabToSpawnIfNeeded:", 0);
}

- (void)goForwardAllowingNewTabToSpawnIfNeeded:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  self->_wasOpenedFromHistory = 1;
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__TabDocument_goForwardAllowingNewTabToSpawnIfNeeded___block_invoke;
  v3[3] = &unk_1E9CF3818;
  v3[4] = self;
  v4 = a3;
  -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v3);
}

void __54__TabDocument_goForwardAllowingNewTabToSpawnIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "backForwardList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forwardItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationIntentWithHistoryURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "safari_highlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlight:", v6);

    if (objc_msgSend(v5, "policy"))
    {
      objc_msgSend(*(id *)(a1 + 32), "dispatchNavigationIntent:", v5);
LABEL_7:

      goto LABEL_8;
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "goForward");
  if (objc_msgSend(*(id *)(a1 + 32), "canGoForward"))
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bookmarkWithID:", -[WKBackForwardListItem safari_bookmarkID](v7));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setReadingListBookmark:", v5);
    goto LABEL_7;
  }
LABEL_8:

}

- (uint64_t)_suppressReloadToPreventLoadingJavaScriptIfNecessary
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;

  if (result)
  {
    v1 = result;
    objc_msgSend((id)result, "expectedOrCurrentURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safari_isJavaScriptURLString");

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(v1 + 1248), "addDisallowedUseOfJavaScriptAlert");
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)reload
{
  -[TabDocument _reloadFromOrigin:]((uint64_t)self, 0);
}

- (void)_reloadFromOrigin:(uint64_t)a1
{
  _QWORD v4[5];
  char v5;

  if (a1 && (-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary](a1) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 296), "isScribbling"))
      objc_msgSend(*(id *)(a1 + 296), "endScribblingAndSaveChanges:", 0);
    *(_QWORD *)(a1 + 1168) = 4;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __33__TabDocument__reloadFromOrigin___block_invoke;
    v4[3] = &unk_1E9CF3818;
    v4[4] = a1;
    v5 = a2;
    -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:](a1, 1, v4);
  }
}

- (void)reloadFromOrigin
{
  -[TabDocument _reloadFromOrigin:]((uint64_t)self, 1);
}

- (void)reloadUserInitiated
{
  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    -[TabDocument reload](self, "reload");
    -[TabDocument _didUserInitiatedReload]((id *)&self->super.isa);
    self->_isNavigatingViaNormalReload = 1;
  }
}

- (void)_didUserInitiatedReload
{
  void *v2;
  void *v3;
  char v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[131], "setLastReloadDate:", v2);

    objc_msgSend(a1, "expectedOrCurrentURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safari_isSafariWebExtensionURL");

    if ((v4 & 1) == 0)
    {
      -[TabDocument _hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary]((uint64_t)a1);
      -[TabDocument _showPrivateBrowsingPrivacyProtectionsBannerForReload]((uint64_t)a1);
    }
  }
}

- (void)reloadFromOriginUserInitiated
{
  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    -[TabDocument reloadFromOrigin](self, "reloadFromOrigin");
    -[TabDocument _didUserInitiatedReload]((id *)&self->super.isa);
    self->_isNavigatingViaReloadFromOrigin = 1;
  }
}

- (void)_hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary
{
  id WeakRetained;
  void *v3;

  if (a1 && *(_QWORD *)(a1 + 1152))
  {
    *(_BYTE *)(a1 + 368) = 0;
    if (objc_msgSend((id)a1, "isActive"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
      objc_msgSend(WeakRetained, "showPrivateBrowsingPrivacyProtectionsBanner:", 0);

    }
    v3 = *(void **)(a1 + 1152);
    *(_QWORD *)(a1 + 1152) = 0;

  }
}

- (void)_showPrivateBrowsingPrivacyProtectionsBannerForReload
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  int v6;
  BOOL v7;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 376));
    v4 = v3;

    if (v4 > 60.0)
    {
      *(_BYTE *)(a1 + 368) = 0;
      return;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_enableAdvancedPrivacyProtections:", objc_msgSend((id)a1, "isPrivateBrowsingEnabled"));

    if (*(_BYTE *)(a1 + 368))
    {
      v7 = *(_BYTE *)(a1 + 369) != 0;
      if (!v6)
        return;
    }
    else
    {
      v7 = 1;
      if (!v6)
        return;
    }
    if (!*(_BYTE *)(a1 + 893))
      v7 = 1;
    if (!v7)
    {
      objc_initWeak(&location, (id)a1);
      v8 = objc_alloc_init(MEMORY[0x1E0D4ED08]);
      v9 = *(void **)(a1 + 1152);
      *(_QWORD *)(a1 + 1152) = v8;

      v10 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __68__TabDocument__showPrivateBrowsingPrivacyProtectionsBannerForReload__block_invoke;
      v14[3] = &unk_1E9CF3950;
      objc_copyWeak(&v15, &location);
      objc_msgSend(*(id *)(a1 + 1152), "setReducePrivacyProtectionsActionHandler:", v14);
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __68__TabDocument__showPrivateBrowsingPrivacyProtectionsBannerForReload__block_invoke_2;
      v12[3] = &unk_1E9CF3950;
      objc_copyWeak(&v13, &location);
      objc_msgSend(*(id *)(a1 + 1152), "setDismissButtonHandler:", v12);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
      objc_msgSend(WeakRetained, "showPrivateBrowsingPrivacyProtectionsBanner:", *(_QWORD *)(a1 + 1152));

      *(_BYTE *)(a1 + 369) = 1;
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __33__TabDocument__reloadFromOrigin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "reloadFromOrigin:", *(unsigned __int8 *)(a1 + 40));
}

- (void)close
{
  -[TabDocument _closeTabDocumentAnimated:](self, "_closeTabDocumentAnimated:", 1);
}

- (void)setPageZoomFactor:(double)a3
{
  double v5;
  double v6;
  id v7;
  id v8;

  if ((-[SFScribbleController isScribbling](self->_sfScribbleController, "isScribbling") & 1) == 0)
  {
    -[TabDocument webView](self, "webView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_viewScale");
    v6 = v5;

    if (v6 < a3)
      -[TabDocument webViewDidIncreaseZoom](self, "webViewDidIncreaseZoom");
    -[TabDocument webView](self, "webView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setViewScale:", a3);

  }
}

- (double)pageZoomFactor
{
  void *v2;
  double v3;
  double v4;

  -[TabDocument webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_viewScale");
  v4 = v3;

  return v4;
}

- (void)_updatePageZoomWithPreference
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    WeakRetained = objc_loadWeakRetained(val + 149);
    objc_msgSend(WeakRetained, "pageZoomPreferenceManagerForTabDocument:", val);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "URLForPerSitePreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__TabDocument__updatePageZoomWithPreference__block_invoke;
    v5[3] = &unk_1E9CF8EC8;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v3, "getPageZoomFactorForURL:usingBlock:", v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __44__TabDocument__updatePageZoomWithPreference__block_invoke(uint64_t a1, double a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__TabDocument__updatePageZoomWithPreference__block_invoke_2;
  v3[3] = &unk_1E9CF8EA0;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __44__TabDocument__updatePageZoomWithPreference__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(double *)(a1 + 40);
  v5 = WeakRetained;
  objc_msgSend(WeakRetained, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setViewScale:", v3);

}

- (void)increasePageZoomSetting
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pageZoomPreferenceManagerForTabDocument:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument URLForPerSitePreferences](self, "URLForPerSitePreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__TabDocument_increasePageZoomSetting__block_invoke;
  v6[3] = &unk_1E9CF8EF0;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "zoomInOnURL:completionHandler:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__TabDocument_increasePageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  void *v5;
  _QWORD v6[4];
  id v7[2];

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 0, 3);

    objc_msgSend(*(id *)(a1 + 32), "webViewDidIncreaseZoom");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__TabDocument_increasePageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E9CF8EA0;
    objc_copyWeak(v7, (id *)(a1 + 40));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(v7);
  }
}

void __38__TabDocument_increasePageZoomSetting__block_invoke_2(uint64_t a1)
{
  double v1;
  void *v2;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setViewScale:", v1);

}

- (void)decreasePageZoomSetting
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pageZoomPreferenceManagerForTabDocument:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument URLForPerSitePreferences](self, "URLForPerSitePreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__TabDocument_decreasePageZoomSetting__block_invoke;
  v6[3] = &unk_1E9CF8F18;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "zoomOutOnURL:completionHandler:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__TabDocument_decreasePageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  void *v5;
  _QWORD v6[4];
  id v7[2];

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 0, 3);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__TabDocument_decreasePageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E9CF8EA0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(v7);
  }
}

void __38__TabDocument_decreasePageZoomSetting__block_invoke_2(uint64_t a1)
{
  double v1;
  void *v2;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setViewScale:", v1);

}

- (void)resetPageZoomSetting
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pageZoomPreferenceManagerForTabDocument:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument URLForPerSitePreferences](self, "URLForPerSitePreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__TabDocument_resetPageZoomSetting__block_invoke;
  v6[3] = &unk_1E9CF8F18;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "resetZoomLevelOnURL:completionHandler:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __35__TabDocument_resetPageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  void *v5;
  _QWORD v6[4];
  id v7[2];

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 1, 3);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__TabDocument_resetPageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E9CF8EA0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(v7);
  }
}

void __35__TabDocument_resetPageZoomSetting__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setViewScale:", *(double *)(a1 + 40));
    objc_msgSend(v11, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_minimumEffectiveDeviceWidth");
    if (v5 == 0.0)
    {
      v9 = 1.0;
    }
    else
    {
      objc_msgSend(v4, "bounds");
      v7 = v6;
      objc_msgSend(v3, "_minimumEffectiveDeviceWidth");
      v9 = v7 / v8;
    }
    objc_msgSend(v3, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setZoomScale:", v9);

    WeakRetained = v11;
  }

}

- (void)reloadEnablingDowngradedPrivateRelay:(BOOL)a3
{
  void *v5;
  void *v6;

  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0D8AB28], "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clearPrivateRelayFailClosedExceptionIfNecessaryForURL:", v6);

    }
    -[TabDocument _disablePrivateRelaySetting:]((uint64_t)self, a3);
    -[TabDocument _reloadFromOrigin:]((uint64_t)self, 0);
  }
}

- (void)_disablePrivateRelaySetting:(uint64_t)a1
{
  uint64_t v4;
  void *v5;

  if (a1)
  {
    objc_msgSend((id)a1, "URL");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 584);
    *(_QWORD *)(a1 + 584) = v4;

    *(_BYTE *)(a1 + 592) = a2;
    *(_BYTE *)(a1 + 892) = a2;
  }
}

- (void)reloadDisablingContentBlockers:(BOOL)a3
{
  NSURL *v5;
  NSURL *urlToReloadForcingContentBlockers;

  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    -[SFScribbleController reloadWithoutScribbleElements](self->_sfScribbleController, "reloadWithoutScribbleElements");
    -[TabDocument URL](self, "URL");
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    urlToReloadForcingContentBlockers = self->_urlToReloadForcingContentBlockers;
    self->_urlToReloadForcingContentBlockers = v5;

    self->_disableContentBlockersWhenReloading = a3;
    -[TabDocument _reloadFromOrigin:]((uint64_t)self, 0);
  }
}

- (void)reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:(BOOL)a3
{
  NSURL *v5;
  NSURL *urlToReloadForAdvancedPrivateBrowsingPrivacyProtections;

  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    -[TabDocument URL](self, "URL");
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    urlToReloadForAdvancedPrivateBrowsingPrivacyProtections = self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections;
    self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections = v5;

    self->_disableAdvancedPrivateBrowsingPrivacyProtectionsWhenReloading = a3;
    -[TabDocument _reloadFromOrigin:]((uint64_t)self, 0);
  }
}

void __68__TabDocument__showPrivateBrowsingPrivacyProtectionsBannerForReload__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:", 1);
    -[TabDocument _hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary]((uint64_t)WeakRetained);
  }

}

void __68__TabDocument__showPrivateBrowsingPrivacyProtectionsBannerForReload__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    -[TabDocument _hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary]((uint64_t)WeakRetained);

}

- (void)_showPerSitePreferencesPopoverViewControllerIfPossible
{
  void *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    objc_msgSend(a1, "URLForPerSitePreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_userVisibleHostWithoutWWWSubdomain");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      WeakRetained = objc_loadWeakRetained(a1 + 117);
      v4 = objc_alloc(MEMORY[0x1E0CD5740]);
      objc_msgSend(a1, "perSitePreferencesVendor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v4, "initWithBrowserDocument:perSitePreferencesVendor:", a1, v5);

      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("PerSitePreferencesPopoverView"));

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
      objc_msgSend(v8, "setModalPresentationStyle:", 2);
      objc_msgSend(WeakRetained, "_presentModalViewController:fromBarItem:completion:", v8, *MEMORY[0x1E0D4F3D8], 0);

    }
  }
}

- (_SFPerSitePreferencesVendor)perSitePreferencesVendor
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "perSitePreferencesVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_SFPerSitePreferencesVendor *)v3;
}

- (BOOL)privacyReportShouldSeparateBlockedTrackers
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "safari_enableAdvancedPrivacyProtections:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));

  return (char)self;
}

- (BOOL)browserHasMultipleProfiles
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v3 = objc_msgSend(WeakRetained, "hasMultipleProfiles");

  return v3;
}

- (NSSet)allBrowserProfileIdentifiers
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabGroupManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allProfileIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)allBrowserHistories
{
  void *v2;
  void *v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "historiesForProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)isBlockedByScreenTime
{
  return -[TabDocument policy](self, "policy") != 0;
}

- (BOOL)canHideToolbar
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tabDocumentCanHideToolbar");

  return v3;
}

- (NSURL)URLForPerSitePreferences
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[TabDocument committedURL](self, "committedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument customUserVisibleStringForReadingListBookmarkURL:](self, "customUserVisibleStringForReadingListBookmarkURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  if (!v3
    || (objc_msgSend(v3, "safari_isHTTPFamilyURL") & 1) == 0
    && -[TabDocument isShowingErrorPage](self, "isShowingErrorPage"))
  {
    -[TabDocument URL](self, "URL");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return (NSURL *)v3;
}

- (SFScribbleController)sfScribbleController
{
  SFScribbleController *sfScribbleController;
  SFScribbleController *v4;
  SFScribbleController *v5;

  sfScribbleController = self->_sfScribbleController;
  if (!sfScribbleController)
  {
    v4 = (SFScribbleController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4ED38]), "initWithWebView:delegate:", self->_webView, self);
    v5 = self->_sfScribbleController;
    self->_sfScribbleController = v4;

    sfScribbleController = self->_sfScribbleController;
  }
  return sfScribbleController;
}

- (SFScribbleController)sfScribbleControllerIfLoaded
{
  return self->_sfScribbleController;
}

- (BOOL)currentPageLoadedFromReadingList
{
  return -[TabDocument readingListBookmarkID](self, "readingListBookmarkID") != 0;
}

- (void)setShowingContinuous:(BOOL)a3
{
  id WeakRetained;

  if (self->_showingContinuous != a3)
  {
    self->_showingContinuous = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tabDocumentDidUpdateShowingContinuous:", self);

  }
}

- (id)backListMenuWithLimit:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[TabDocument _backListWithLimit:]((uint64_t)self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TabDocument canGoBackToParentTab](self, "canGoBackToParentTab") && objc_msgSend(v4, "count") == 1)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3428];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __37__TabDocument_backListMenuWithLimit___block_invoke;
    v17[3] = &unk_1E9CF3330;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKBackForwardListItem safari_urlForDisplay](v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_stringForListDisplay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDiscoverabilityTitle:", v13);

    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __37__TabDocument_backListMenuWithLimit___block_invoke_2;
    v16[3] = &unk_1E9CF8F40;
    v16[4] = self;
    objc_msgSend(v4, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 2, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_backListWithLimit:(uint64_t)a1
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1008), "backForwardList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "count");
    if (v5 <= a2)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(v4, "subarrayWithRange:", v5 - a2, a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __37__TabDocument_backListMenuWithLimit___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "goBackAllowingNewTabToSpawnIfNeeded:", 1);

}

id __37__TabDocument_backListMenuWithLimit___block_invoke_2(uint64_t a1, void *a2)
{
  -[TabDocument _menuElementForBackForwardListItem:](*(void **)(a1 + 32), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_menuElementForBackForwardListItem:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v4 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__TabDocument__menuElementForBackForwardListItem___block_invoke;
    v19[3] = &unk_1E9CF8F90;
    objc_copyWeak(&v21, &location);
    v6 = v3;
    v20 = v6;
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, 0, 0, v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[WKBackForwardListItem safari_urlForDisplay](v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringForListDisplay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscoverabilityTitle:", v9);

    objc_msgSend(v6, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "safari_isSafariWebExtensionURL");

    if ((_DWORD)v9)
    {
      objc_msgSend(a1, "webExtensionsController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "host");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "webExtensionForBaseURIHost:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "displayName");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", v15))
        v17 = &stru_1E9CFDBB0;
      else
        v17 = v15;
      objc_msgSend(v7, "setDiscoverabilityTitle:", v17);

    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)forwardListMenuWithLimit:(int)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[TabDocument _forwardListWithLimit:]((uint64_t)self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__TabDocument_forwardListMenuWithLimit___block_invoke;
  v7[3] = &unk_1E9CF8F68;
  v7[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_forwardListWithLimit:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1008), "backForwardList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "count") <= a2)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(v4, "subarrayWithRange:", 0, a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id __40__TabDocument_forwardListMenuWithLimit___block_invoke(uint64_t a1, void *a2)
{
  -[TabDocument _menuElementForBackForwardListItem:](*(void **)(a1 + 32), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__TabDocument__menuElementForBackForwardListItem___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationIntentWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "safari_highlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlight:", v6);

    if (objc_msgSend(v5, "policy"))
      objc_msgSend(v7, "dispatchNavigationIntent:", v5);
    else
      objc_msgSend(v7, "goToBackForwardListItem:", *(_QWORD *)(a1 + 32));

    WeakRetained = v7;
  }

}

- (BOOL)canGoBackToParentTab
{
  id WeakRetained;
  void *v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);
  if (WeakRetained
    && (-[TabDocument _backForwardList](self, "_backForwardList"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "backList"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6 <= 1))
  {
    -[TabDocument _backForwardList](self, "_backForwardList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_backForwardList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "isEqual:", v13);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_clearAppBannerIfNotCurrentStoreBannerDeferringRemoval:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  id v11;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 360), "invalidate");
    v4 = *(void **)(a1 + 360);
    *(_QWORD *)(a1 + 360) = 0;

    v5 = *(void **)(a1 + 352);
    if (v5 != *(void **)(a1 + 344))
    {
      *(_QWORD *)(a1 + 352) = 0;

    }
    v6 = *(_QWORD *)(a1 + 1144);
    if (v6 && v6 != *(_QWORD *)(a1 + 344))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
      v8 = WeakRetained;
      v11 = WeakRetained;
      if (!*(_BYTE *)(a1 + 903)
        && ((a2 & 1) != 0
         || (v10 = objc_msgSend(WeakRetained, "tabDocumentShouldDeferAppBannerRemoval:", a1), v8 = v11, v10)))
      {
        *(_BYTE *)(a1 + 903) = 1;
      }
      else
      {
        objc_msgSend(v8, "removeAppBannerFromTabDocument:animated:", a1, 0);
        v9 = *(void **)(a1 + 1144);
        *(_QWORD *)(a1 + 1144) = 0;

        v8 = v11;
      }

    }
  }
}

- (void)_setAppBannerWhenPainted:(uint64_t)a1
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 684))
    {
      v7 = v8;
      v6 = *(void **)(a1 + 352);
      *(_QWORD *)(a1 + 352) = v7;
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 360), "invalidate");
    v4 = *(void **)(a1 + 360);
    *(_QWORD *)(a1 + 360) = 0;

    if (*(id *)(a1 + 1144) != v8)
    {
      if (*(_BYTE *)(a1 + 903))
        objc_msgSend(v8, "setInitiallyBehindNavigationBar:", 0);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
      v6 = WeakRetained;
      if (*(_QWORD *)(a1 + 1144))
        objc_msgSend(WeakRetained, "removeAppBannerFromTabDocument:animated:", a1, 0);
      objc_storeStrong((id *)(a1 + 1144), a2);
      objc_msgSend(v6, "tabDocumentDidCompleteCheckForAppBanner:", a1);
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)_startAppBannerRemovalTimer
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v2 = (void *)MEMORY[0x1E0C99E88];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __42__TabDocument__startAppBannerRemovalTimer__block_invoke;
    v9 = &unk_1E9CF8C10;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v2, "timerWithTimeInterval:repeats:block:", 0, &v6, 2.5 + 0.3);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)val + 45);
    *((_QWORD *)val + 45) = v3;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v6, v7, v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", *((_QWORD *)val + 45), *MEMORY[0x1E0C99860]);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __42__TabDocument__startAppBannerRemovalTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[45], "invalidate");
    v2 = v4[45];
    v4[45] = 0;

    v3 = objc_loadWeakRetained(v4 + 149);
    objc_msgSend(v3, "removeAppBannerFromTabDocument:animated:", v4, 0);

    WeakRetained = v4;
  }

}

- (id)_startedLoadingResources
{
  id *v1;
  id WeakRetained;

  if (result)
  {
    v1 = result;
    WeakRetained = objc_loadWeakRetained(result + 150);
    objc_msgSend(WeakRetained, "didStartLoadingResource");

    result = (id *)v1[154];
    if (result)
      return (id *)objc_msgSend(result, "startedLoadingResources");
  }
  return result;
}

- (id)_stoppedLoadingResources
{
  id *v1;
  id WeakRetained;

  if (result)
  {
    v1 = result;
    WeakRetained = objc_loadWeakRetained(result + 150);
    objc_msgSend(WeakRetained, "didStopLoadingResource");

    result = (id *)v1[154];
    if (result)
      return (id *)objc_msgSend(result, "finishedLoadingResources");
  }
  return result;
}

- (uint64_t)_shouldCleanUpAfterRedirectToExternalApp
{
  uint64_t v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1008), "_committedURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v1 = 0;
    else
      v1 = objc_msgSend(*(id *)(v1 + 1008), "_webProcessIdentifier") != 0;

  }
  return v1;
}

- (void)_completeRedirectToExternalNavigationResult:(uint64_t)a3 fromOriginalRequest:(uint64_t)a4 dialogResult:
{
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  if (a1)
  {
    v6 = -[TabDocument _shouldCleanUpAfterRedirectToExternalApp]((uint64_t)a1) ^ 1;
    if (a4 == 2)
      LOBYTE(v6) = 1;
    if ((v6 & 1) != 0)
    {
      if ((objc_msgSend(v12, "appliesOneTimeUserInitiatedActionPolicy") & 1) == 0)
      {
        v7 = a1[146];
        a1[146] = v7 | 2;
        if (a4)
          a1[146] = v7 | 6;
      }
    }
    else if (objc_msgSend(a1, "canGoBack"))
    {
      objc_msgSend(a1, "goBack");
    }
    else if (!a4)
    {
      objc_msgSend(a1, "_closeTabDocumentAnimated:", 0);
    }
    objc_msgSend(v12, "appLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4 == 1 && v8)
    {
      objc_msgSend(v8, "disable");
      objc_msgSend(v9, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[TabDocument _loadURLInternal:userDriven:]((uint64_t)a1, v10, objc_msgSend(v12, "loadWasUserDriven"));

    }
  }

}

- (void)_addNoFeedAppSupportAlert
{
  void *v1;
  void *v2;
  _QWORD v3[5];

  if (a1)
  {
    v1 = *(void **)(a1 + 1248);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __40__TabDocument__addNoFeedAppSupportAlert__block_invoke;
    v3[3] = &unk_1E9CF3578;
    v3[4] = a1;
    objc_msgSend(MEMORY[0x1E0D4EC60], "noFeedAppDialogWithCompletionHandler:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addDialog:", v2);

  }
}

void __40__TabDocument__addNoFeedAppSupportAlert__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("itms-apps://?action=search"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
    objc_msgSend(WeakRetained, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openURL:options:completionHandler:", v7, 0, 0);

  }
}

- (void)_queueAlertForRedirectToExternalNavigationResult:(void *)a3 fromOriginalRequest:(void *)a4 navigationAction:(char)a5 isMainFrame:(uint64_t)a6 promptPolicy:(void *)a7 userAction:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  id location;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  if (a1)
  {
    objc_initWeak(&location, a1);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__TabDocument__queueAlertForRedirectToExternalNavigationResult_fromOriginalRequest_navigationAction_isMainFrame_promptPolicy_userAction___block_invoke;
    aBlock[3] = &unk_1E9CF8FB8;
    objc_copyWeak(&v27, &location);
    v17 = v13;
    v23 = v17;
    v24 = v14;
    v25 = v15;
    v28 = a5;
    v26 = v16;
    v18 = _Block_copy(aBlock);
    if ((objc_msgSend(v17, "externalApplicationCategory") | 2) == 2)
    {
      a1[146] |= 8uLL;
      v19 = a6;
      v20 = (void *)a1[156];
      objc_msgSend(MEMORY[0x1E0D4EC60], "redirectDialogWithNavigationResult:promptPolicy:completionHandler:", v17, v19, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addDialog:", v21);

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

void __137__TabDocument__queueAlertForRedirectToExternalNavigationResult_fromOriginalRequest_navigationAction_isMainFrame_promptPolicy_userAction___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (a2)
    {
      if (!objc_msgSend(v4, "appliesOneTimeUserInitiatedActionPolicy")
        || objc_msgSend(*(id *)(a1 + 32), "externalApplicationCategory") != 2)
      {
        WeakRetained[146] &= ~8uLL;
      }
      -[TabDocument _completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:](WeakRetained, *(void **)(a1 + 32), v5, a2);
    }
    else
    {
      if (!objc_msgSend(v4, "appliesOneTimeUserInitiatedActionPolicy")
        || objc_msgSend(*(id *)(a1 + 32), "externalApplicationCategory") == 2)
      {
        WeakRetained[146] = 0;
      }
      -[TabDocument _redirectToExternalNavigationResult:fromOriginalRequest:navigationAction:promptPolicy:isMainFrame:userAction:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 0, *(unsigned __int8 *)(a1 + 72), *(void **)(a1 + 56));
    }
    v6 = _Block_copy((const void *)WeakRetained[66]);
    v7 = v6;
    if (v6)
      (*((void (**)(void *, uint64_t))v6 + 2))(v6, 1);

  }
}

- (void)_redirectToExternalNavigationResult:(void *)a3 fromOriginalRequest:(void *)a4 navigationAction:(uint64_t)a5 promptPolicy:(uint64_t)a6 isMainFrame:(void *)a7 userAction:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
    if ((objc_msgSend(WeakRetained, "tabDocumentCanRedirectToExternalApplication:", a1) & 1) != 0)
    {
      if (*(_QWORD *)(a1 + 1168) != 8)
      {
        v35 = objc_loadWeakRetained((id *)(a1 + 936));
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isSuspended") & 1) != 0
          || !objc_msgSend((id)a1, "isActive")
          || (objc_msgSend(v35, "isPrivateBrowsingEnabled") & 1) != 0)
        {
          v19 = 1;
        }
        else
        {
          objc_msgSend(v35, "tabCollectionViewProvider");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v33, "isShowingTabView");

        }
        if (objc_msgSend(v13, "shouldPromptWithPolicy:telephonyNavigationPolicy:userAction:inBackgroundOrPrivateBrowsing:inLockdownMode:", a5, *(_QWORD *)(a1 + 384), v16, v19, *(unsigned __int8 *)(a1 + 634)))
        {
          -[TabDocument _queueAlertForRedirectToExternalNavigationResult:fromOriginalRequest:navigationAction:isMainFrame:promptPolicy:userAction:](a1, v13, v14, v15, a6, a5, v16);
          objc_msgSend(WeakRetained, "tabDocumentDidCancelRedirectToExternalApplication:", a1);
        }
        else
        {
          objc_msgSend(v13, "URL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "appliesOneTimeUserInitiatedActionPolicy"))
            objc_msgSend(v16, "consume");
          v21 = objc_msgSend(v13, "externalApplicationCategory");
          if (!v21 || v21 == 2)
          {
            objc_msgSend(v13, "appLink");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "canOpenURL:", v20);
            if (v23)
              v25 = 1;
            else
              v25 = v24;
            if ((v25 & 1) != 0)
            {
              v26 = *(void **)(a1 + 1240);
              if (v26)
                objc_msgSend(v26, "absoluteString");
              else
                objc_msgSend(v14, "valueForHTTPHeaderField:", CFSTR("Referer"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = *(void **)(a1 + 1240);
              *(_QWORD *)(a1 + 1240) = 0;

              *(_BYTE *)(a1 + 902) = 0;
              v29 = *(void **)(a1 + 1160);
              *(_QWORD *)(a1 + 1160) = 0;

              *(_BYTE *)(a1 + 685) = 0;
              if (v23)
              {
                v50 = *MEMORY[0x1E0DAB538];
                v51[0] = MEMORY[0x1E0C9AAB0];
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v41[0] = MEMORY[0x1E0C809B0];
                v41[1] = 3221225472;
                v41[2] = __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_3;
                v41[3] = &unk_1E9CF4740;
                v41[4] = a1;
                v42 = v13;
                v43 = v14;
                -[TabDocument _openAppLinkInApp:fromOriginalRequest:updateAppLinkStrategy:webBrowserState:completionHandler:](a1, v23, v43, 0, v30, v41);

              }
              else
              {
                if (v27)
                {
                  v48 = *MEMORY[0x1E0CA5810];
                  v49 = v27;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v34 = 0;
                }
                objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "externalApplication");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v36[0] = MEMORY[0x1E0C809B0];
                v36[1] = 3221225472;
                v36[2] = __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_4;
                v36[3] = &unk_1E9CF8FE0;
                v37 = v15;
                v38 = a1;
                v39 = v13;
                v40 = v14;
                objc_msgSend(v32, "_sf_openURL:inApplication:withOptions:completionHandler:", v20, v31, v34, v36);

              }
            }
            else
            {
              if ((_DWORD)a6)
                objc_msgSend(*(id *)(a1 + 1248), "addInvalidURLAlert");
              objc_msgSend(WeakRetained, "tabDocumentDidCancelRedirectToExternalApplication:", a1);
            }

          }
          else if (v21 == 1 && !*(_BYTE *)(a1 + 688))
          {
            *(_BYTE *)(a1 + 688) = 1;
            v22 = *(void **)(a1 + 384);
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke;
            v44[3] = &unk_1E9CF8FE0;
            v44[4] = a1;
            v45 = v20;
            v46 = v13;
            v47 = v14;
            objc_msgSend(v22, "handleNavigationToURL:completionHandler:", v45, v44);

          }
        }

      }
    }
    else
    {
      objc_msgSend(WeakRetained, "tabDocumentDidCancelRedirectToExternalApplication:", a1);
    }

  }
}

- (void)loadWindowDotOpenExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4
{
  -[TabDocument _queueAlertForRedirectToExternalNavigationResult:fromOriginalRequest:navigationAction:isMainFrame:promptPolicy:userAction:](self, a3, a4, 0, 1, 3, 0);
}

void __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 936));
    objc_msgSend(WeakRetained, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_2;
    v8[3] = &unk_1E9CF3928;
    v6 = *(_QWORD *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v5, "_sf_openTelURL:completionHandler:", v6, v8);

  }
  else
  {
    *(_BYTE *)(v3 + 688) = 0;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
  }
}

uint64_t __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 688) = 0;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
  if (a2)
  {
    objc_msgSend(v3, "userAcceptedCallPrompt");
    -[TabDocument _completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40), v4, 0);
  }
  else
  {
    objc_msgSend(v3, "userDeclinedCallPrompt");
  }
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_clearNavigationSource
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 1240);
    *(_QWORD *)(a1 + 1240) = 0;

    *(_BYTE *)(a1 + 902) = 0;
    v3 = *(void **)(a1 + 1160);
    *(_QWORD *)(a1 + 1160) = 0;

    *(_BYTE *)(a1 + 685) = 0;
  }
}

void __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[TabDocument _completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40), a3, a2 != 0);
}

- (void)_openAppLinkInApp:(void *)a3 fromOriginalRequest:(uint64_t)a4 updateAppLinkStrategy:(void *)a5 webBrowserState:(void *)a6 completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;

  v10 = a2;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a1)
  {
    objc_msgSend(v11, "valueForHTTPHeaderField:", CFSTR("Referer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(id *)(a1 + 1240);
    }
    v16 = v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 1008), "_willOpenAppLink");
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__11;
    v18[4] = __Block_byref_object_dispose__11;
    v19 = _Block_copy(v13);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __109__TabDocument__openAppLinkInApp_fromOriginalRequest_updateAppLinkStrategy_webBrowserState_completionHandler___block_invoke;
    v17[3] = &unk_1E9CF9210;
    v17[4] = v18;
    objc_msgSend(v10, "openExternallyWithWebBrowserState:referrerURL:completionHandler:", v12, v16, v17);
    _Block_object_dispose(v18, 8);

  }
}

void __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v3;

  if (a2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_storeSKAdNetworkAttribution");
    -[TabDocument _completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:](*(_QWORD **)(a1 + 40), *(void **)(a1 + 48), v3, 0);
  }
}

- (id)_readingListArchiveNextPageLinkForRequest:(void *)a3 targetFrame:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(a1, "currentPageLoadedFromReadingList"))
    {
      objc_msgSend(v6, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isFileURL"))
      {
        objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isNetworkReachable");

        if ((v10 & 1) != 0)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bookmarkWithID:", objc_msgSend(a1, "readingListBookmarkID"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "webarchivePathForNextPageURL:", v8);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }

      goto LABEL_9;
    }
LABEL_5:
    a1 = 0;
  }
LABEL_9:

  return a1;
}

- (id)_fileURLNavigationResultForURL:(void *)a1
{
  id v3;
  int v4;
  BOOL v5;

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(a1, "readingListBookmarkID");
    if (gTestFileURLs)
      v5 = 0;
    else
      v5 = v4 == 0;
    if (v5 && objc_msgSend(v3, "isFileURL"))
    {
      objc_msgSend(MEMORY[0x1E0CD5718], "resultOfType:withURL:", 4, v3);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (uint64_t)_shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:(uint64_t)result
{
  unsigned __int8 v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  char v8;

  if (result)
  {
    if ((v2 & 1) == 0)
    {
      v3 = result;
      v4 = a2;
      a2 = v4;
      v6 = v5;
      result = v3;
      if (v6)
      {
        if (objc_msgSend(MEMORY[0x1E0D89BE8], "hasInternalContent"))
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("RedirectToExternalAppsDisallowed"));

        }
        else
        {
          v8 = 0;
        }
        -[TabDocument _shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:]::redirectToExternalAppsDisallowedByUserDefault = v8;
        a2 = v4;
        result = v3;
      }
    }
    if (-[TabDocument _shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:]::redirectToExternalAppsDisallowedByUserDefault)
      return 1;
    else
      return (a2 ^ 1) & (*(unsigned __int8 *)(result + 1168) >> 2);
  }
  return result;
}

- (id)_resultOfLoadingRequest:(uint64_t)a3 inMainFrame:(int)a4 userInitiated:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;

  v7 = a2;
  v8 = v7;
  if (a1)
  {
    objc_msgSend(v7, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _fileURLNavigationResultForURL:](a1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v10;
    }
    else
    {
      v12 = -[TabDocument _shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:]((uint64_t)a1, a4);
      v13 = (void *)MEMORY[0x1E0CD5718];
      v14 = a1[169];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__TabDocument__resultOfLoadingRequest_inMainFrame_userInitiated___block_invoke;
      v16[3] = &unk_1E9CF9008;
      v17 = v8;
      v18 = a1;
      objc_msgSend(v13, "resultOfLoadingRequest:isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:", v17, a3, v12, v14, v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __65__TabDocument__resultOfLoadingRequest_inMainFrame_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "committedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "_sf_shouldOverrideiCloudSharingURL:withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:", v5, v3, v6, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "loadedUsingDesktopUserAgent"));

  return v7;
}

- (void)_determineResultOfLoadingRequest:(uint64_t)a3 inMainFrame:(int)a4 userInitiated:(void *)a5 completionHandler:
{
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  char v23;

  v9 = a2;
  v10 = a5;
  if (a1)
  {
    objc_msgSend(v9, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _fileURLNavigationResultForURL:]((void *)a1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v10[2](v10, v12);
    }
    else
    {
      v13 = -[TabDocument _shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:](a1, a4);
      if (*(_BYTE *)(a1 + 754))
        v14 = 1;
      else
        v14 = v13;
      objc_msgSend((id)a1, "committedURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(a1 + 88), "loadedUsingDesktopUserAgent");
      v16 = (void *)MEMORY[0x1E0CD5718];
      v17 = *(_QWORD *)(a1 + 1352);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __92__TabDocument__determineResultOfLoadingRequest_inMainFrame_userInitiated_completionHandler___block_invoke;
      v20[3] = &unk_1E9CF9030;
      v21 = v9;
      v18 = v19;
      v22 = v18;
      v23 = v15;
      objc_msgSend(v16, "determineResultOfLoadingRequest:isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:completionHandler:", v21, a3, v14, v17, v20, v10);

    }
  }

}

uint64_t __92__TabDocument__determineResultOfLoadingRequest_inMainFrame_userInitiated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_sf_shouldOverrideiCloudSharingURL:withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:", v5, v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  return v6;
}

- (id)resultOfLoadingURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _resultOfLoadingRequest:inMainFrame:userInitiated:](self, v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_showFinanceKitOrderPreviewControllerWithURL:(void *)a3 dismissalHandler:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v7 = (void *)getFKSaveOrderClass(void)::softClass;
    v18 = getFKSaveOrderClass(void)::softClass;
    v8 = MEMORY[0x1E0C809B0];
    if (!getFKSaveOrderClass(void)::softClass)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = ___ZL19getFKSaveOrderClassv_block_invoke;
      v14[3] = &unk_1E9CF31D8;
      v14[4] = &v15;
      ___ZL19getFKSaveOrderClassv_block_invoke((uint64_t)v14);
      v7 = (void *)v16[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v15, 8);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke;
    v10[3] = &unk_1E9CF9058;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    objc_msgSend(v9, "saveOrderAtURL:completion:", v5, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[4];
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_219;
    block[3] = &unk_1E9CF39C8;
    objc_copyWeak(v8, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(v8);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_219(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pageLoadErrorController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addAlertWithTitle:bodyText:", v2, v3);

}

- (void)_showPassBookControllerForPasses:(uint64_t)a1
{
  void *v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  if (a1)
  {
    v3 = (void *)objc_msgSend(objc_alloc((Class)getPKAddPassesViewControllerClass()), "initWithPasses:fromPresentationSource:", v5, 0);
    objc_msgSend(v3, "setDelegate:", a1);
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
      objc_msgSend(WeakRetained, "tabDocument:presentViewControllerAnimated:", a1, v3);

    }
  }

}

- (BOOL)_showICSControllerForPath:(void *)a3 sourceURL:(void *)a4 beforeDismissHandler:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id WeakRetained;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD56E8]), "initWithFilePath:sourceURL:", v7, v8);
    v11 = v10;
    v12 = v10 != 0;
    if (v10)
    {
      objc_msgSend(v10, "setModalPresentationStyle:", 2);
      objc_msgSend(v11, "setBeforeDismissHandler:", v9);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
      objc_msgSend(WeakRetained, "tabDocument:presentViewControllerAnimated:", a1, v11);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)showDownload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "completedFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__TabDocument_showDownload___block_invoke;
    v7[3] = &unk_1E9CF3C30;
    v7[4] = self;
    v8 = v4;
    v9 = v5;
    objc_msgSend(v9, "safari_accessingSecurityScopedResource:", v7);

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[TabDocument showDownload:].cold.1();
    -[TabDocument _showDownload:path:]((uint64_t)self, v4, 0);
  }

}

void __28__TabDocument_showDownload___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "path");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TabDocument _showDownload:path:](v1, v2, v3);

}

- (void)_showDownload:(void *)a3 path:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  int v27;
  id WeakRetained;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD aBlock[4];
  id v45;
  id location;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[8];
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(v5, "fileType");
    objc_msgSend(v5, "sourceURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInitiatedAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isConsumed");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v5, "userInitiatedAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "consume");

    }
    *(_BYTE *)(a1 + 676) = 1;
    if (v7 == 2)
      goto LABEL_55;
    if (v7 == 6)
    {
      v48 = 0;
      v49 = &v48;
      v50 = 0x2050000000;
      v12 = (void *)getCLKWatchFaceLibraryClass(void)::softClass;
      v51 = getCLKWatchFaceLibraryClass(void)::softClass;
      if (!getCLKWatchFaceLibraryClass(void)::softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v53 = 3221225472;
        v54 = ___ZL27getCLKWatchFaceLibraryClassv_block_invoke;
        v55 = &unk_1E9CF31D8;
        v56 = &v48;
        ___ZL27getCLKWatchFaceLibraryClassv_block_invoke((uint64_t)buf);
        v12 = (void *)v49[3];
      }
      v13 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v48, 8);
      v14 = objc_alloc_init(v13);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __34__TabDocument__showDownload_path___block_invoke;
      v47[3] = &unk_1E9CF9080;
      v47[4] = a1;
      objc_msgSend(v14, "_addWatchFaceAtURL:shouldValidate:completionHandler:", v15, 0, v47);

LABEL_55:
      goto LABEL_56;
    }
    objc_initWeak(&location, (id)a1);
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__TabDocument__showDownload_path___block_invoke_226;
    aBlock[3] = &unk_1E9CF39C8;
    objc_copyWeak(&v45, &location);
    v17 = (void (**)(_QWORD))_Block_copy(aBlock);
    switch(v7)
    {
      case 3:
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v6, 0);
        objc_msgSend(v5, "uti");
        v19 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v19;
        if (v19
          && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v19),
              (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v38 = v20;
          if ((objc_msgSend(v20, "conformsToType:", *MEMORY[0x1E0CEC6B0]) & 1) != 0)
          {
            v48 = 0;
            v49 = &v48;
            v50 = 0x2050000000;
            v21 = (void *)getPKPassesXPCContainerClass(void)::softClass;
            v51 = getPKPassesXPCContainerClass(void)::softClass;
            if (!getPKPassesXPCContainerClass(void)::softClass)
            {
              *(_QWORD *)buf = v16;
              v53 = 3221225472;
              v54 = ___ZL28getPKPassesXPCContainerClassv_block_invoke;
              v55 = &unk_1E9CF31D8;
              v56 = &v48;
              ___ZL28getPKPassesXPCContainerClassv_block_invoke((uint64_t)buf);
              v21 = (void *)v49[3];
            }
            v22 = objc_retainAutorelease(v21);
            _Block_object_dispose(&v48, 8);
            v23 = (void *)objc_msgSend([v22 alloc], "initWithFileURL:", v39);
            v41[0] = v16;
            v41[1] = 3221225472;
            v41[2] = __34__TabDocument__showDownload_path___block_invoke_2;
            v41[3] = &unk_1E9CF90A8;
            v42 = v18;
            objc_msgSend(v23, "unarchivePassesWithBlock:", v41);
            v24 = 0;
            v25 = v42;
LABEL_39:

            if (!objc_msgSend(v18, "count") || v24)
            {
              v35 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v24, "safari_privacyPreservingDescription");
                objc_claimAutoreleasedReturnValue();
                -[TabDocument _showDownload:path:].cold.2();
              }

              objc_msgSend(*(id *)(a1 + 1248), "addDownloadFailedAlertWithDescription:", 0);
              v17[2](v17);
            }
            else
            {
              v34 = WBS_LOG_CHANNEL_PREFIXDownloads();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D7CA3000, v34, OS_LOG_TYPE_INFO, "PassBook passes download succeeded, showing passbook adding passes view controller.", buf, 2u);
              }
              -[TabDocument _showPassBookControllerForPasses:](a1, v18);
            }
            if ((objc_msgSend(v5, "explicitlySaved") & 1) == 0)
              objc_msgSend(v5, "removeFromDisk");

            goto LABEL_53;
          }
        }
        else
        {
          v38 = 0;
        }
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v39);
        v48 = 0;
        v49 = &v48;
        v50 = 0x2050000000;
        v32 = (void *)getPKPassClass(void)::softClass;
        v51 = getPKPassClass(void)::softClass;
        if (!getPKPassClass(void)::softClass)
        {
          *(_QWORD *)buf = v16;
          v53 = 3221225472;
          v54 = ___ZL14getPKPassClassv_block_invoke;
          v55 = &unk_1E9CF31D8;
          v56 = &v48;
          ___ZL14getPKPassClassv_block_invoke((uint64_t)buf);
          v32 = (void *)v49[3];
        }
        v33 = objc_retainAutorelease(v32);
        _Block_object_dispose(&v48, 8);
        v43 = 0;
        v25 = (void *)objc_msgSend(v33, "createWithData:warnings:error:", v23, 0, &v43);
        v24 = v43;
        if (v25)
          objc_msgSend(v18, "addObject:", v25);
        goto LABEL_39;
      case 4:
        if (v6 && -[TabDocument _showICSControllerForPath:sourceURL:beforeDismissHandler:](a1, v6, v8, v17))
          goto LABEL_54;
        v26 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[TabDocument _showDownload:path:].cold.3();
        goto LABEL_20;
      case 5:
        v27 = objc_msgSend(v5, "explicitlySaved");
        if (v6
          && (v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5680]), "initWithFilePath:sourceURL:deleteFileWhenDone:beforeDismissHandler:", v6, v8, v27 ^ 1u, v17)) != 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
          objc_msgSend(WeakRetained, "tabDocument:presentViewControllerAnimated:", a1, v24);

LABEL_53:
        }
        else
        {
          if ((v27 & 1) == 0)
            objc_msgSend(v5, "removeFromDisk");
LABEL_20:
          objc_msgSend(*(id *)(a1 + 1248), "addDownloadFailedAlertWithDescription:", 0);
        }
LABEL_54:

        objc_destroyWeak(&v45);
        objc_destroyWeak(&location);
        goto LABEL_55;
      case 7:
        v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v6, 0);
        -[TabDocument _showFinanceKitOrderPreviewControllerWithURL:dismissalHandler:]((void *)a1, v24, v17);
        if ((objc_msgSend(v5, "explicitlySaved") & 1) == 0)
          objc_msgSend(v5, "removeFromDisk");
        goto LABEL_53;
      default:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "explicitlySaved") & 1) == 0)
          objc_msgSend(v5, "removeFromDisk");
        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "lastPathComponent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = v16;
          v40[1] = 3221225472;
          v40[2] = __34__TabDocument__showDownload_path___block_invoke_233;
          v40[3] = &unk_1E9CF90D0;
          v40[4] = a1;
          objc_msgSend(v29, "queueFileDataForAcceptance:originalFileName:forBundleID:completion:", v24, v30, 0, v40);

          objc_msgSend((id)a1, "URL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v29) = v31 == 0;

          if ((_DWORD)v29)
            objc_msgSend((id)a1, "_closeTabDocumentAnimated:", 0);
        }
        else
        {
          v36 = WBS_LOG_CHANNEL_PREFIXDownloads();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[TabDocument _showDownload:path:].cold.1();
          objc_msgSend(*(id *)(a1 + 1248), "addInvalidProfileAlert");
        }
        goto LABEL_53;
    }
  }
LABEL_56:

}

void __34__TabDocument__showDownload_path___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __34__TabDocument__showDownload_path___block_invoke_cold_1();
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      objc_msgSend(*(id *)(v5 + 1248), "addDownloadFailedAlertWithDescription:", 0);
  }

}

void __34__TabDocument__showDownload_path___block_invoke_226(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {

  }
  else if ((objc_msgSend(WeakRetained, "isClosed") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "_closeTabDocumentAnimated:", 0);
  }

}

void __34__TabDocument__showDownload_path___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __34__TabDocument__showDownload_path___block_invoke_233(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __34__TabDocument__showDownload_path___block_invoke_233_cold_1();
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__TabDocument__showDownload_path___block_invoke_234;
    block[3] = &unk_1E9CF31B0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __34__TabDocument__showDownload_path___block_invoke_234(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "addInvalidProfileAlert");
}

- (uint64_t)_canShowDownloadWithoutPrompting:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "fileType") == 1
      || objc_msgSend(v4, "fileType") == 6
      || (WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192)),
          v6 = objc_msgSend(WeakRetained, "tabDocument:canShowDownload:", a1, v4),
          WeakRetained,
          (v6 & 1) == 0))
    {
      a1 = 0;
    }
    else
    {
      objc_msgSend(v4, "userInitiatedAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        if (v7 == *(void **)(a1 + 392))
          a1 = objc_msgSend(v7, "isConsumed") ^ 1;
        else
          a1 = 0;
      }
      else
      {
        a1 = *(_BYTE *)(a1 + 676) == 0;
      }

    }
  }

  return a1;
}

- (void)downloadDidStart:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  if (self->_elementInfoToAnimateForNextDownload)
  {
    v5 = (void *)*MEMORY[0x1E0DC4730];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__TabDocument_downloadDidStart___block_invoke;
    v6[3] = &unk_1E9CF31B0;
    v6[4] = self;
    objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v6);
  }
  if (self->_closeWhenNextDownloadStarts)
  {
    -[TabDocument _closeTabDocumentAnimated:](self, "_closeTabDocumentAnimated:", 0);
    self->_closeWhenNextDownloadStarts = 0;
  }

}

void __32__TabDocument_downloadDidStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "animateElement:toBarItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656), 11);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 656);
  *(_QWORD *)(v2 + 656) = 0;

}

- (void)animateElementToDownloadsBarItemSoon:(id)a3
{
  objc_storeStrong((id *)&self->_elementInfoToAnimateForNextDownload, a3);
}

- (void)downloadDidFail:(id)a3
{
  _SFDownload *v4;
  _SFDownload *downloadReflectedInFluidProgress;
  BOOL v6;
  _SFDownload *activeDownload;
  _SFDownload *v8;

  v4 = (_SFDownload *)a3;
  downloadReflectedInFluidProgress = self->_downloadReflectedInFluidProgress;
  if (self->_activeDownload == v4
    || (v6 = downloadReflectedInFluidProgress == v4, downloadReflectedInFluidProgress = v4, v6))
  {
    self->_downloadReflectedInFluidProgress = 0;
    v8 = v4;

    activeDownload = self->_activeDownload;
    self->_activeDownload = 0;

    v4 = v8;
  }

}

- (void)downloadDidFinish:(id)a3
{
  _SFDownload *v4;
  _SFDownload *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _SFDownload *v13;
  id v14;
  id location;

  v4 = (_SFDownload *)a3;
  v5 = v4;
  if (self->_activeDownload == v4)
  {
    self->_activeDownload = 0;

    objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldExcludeDownloadFromList:", v5);

    if ((v7 & 1) != 0)
    {
      if (-[TabDocument _canShowDownloadWithoutPrompting:]((uint64_t)self, v5))
      {
        -[TabDocument showDownload:](self, "showDownload:", v5);
      }
      else if (-[_SFDownload fileType](v5, "fileType") != 2)
      {
        objc_initWeak(&location, self);
        v8 = (void *)MEMORY[0x1E0D4EC60];
        v9 = -[_SFDownload fileType](v5, "fileType");
        -[_SFWebView URL](self->_webView, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __33__TabDocument_downloadDidFinish___block_invoke;
        v12[3] = &unk_1E9CF90F8;
        objc_copyWeak(&v14, &location);
        v13 = v5;
        objc_msgSend(v8, "downloadBlockedDialogWithFileType:initiatingURL:completionHandler:", v9, v10, v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SFDialogController presentDialog:](self->_dialogController, "presentDialog:", v11);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }

}

void __33__TabDocument_downloadDidFinish___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
    objc_msgSend(WeakRetained, "showDownload:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(*(id *)(a1 + 32), "removeFromDisk");

}

- (void)_presentDialogToAllowDownload:(uint64_t)a3 allowViewAction:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = (void *)MEMORY[0x1E0D4EC60];
    objc_msgSend(*(id *)(a1 + 1008), "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __79__TabDocument__presentDialogToAllowDownload_allowViewAction_completionHandler___block_invoke;
    v15 = &unk_1E9CF9120;
    v16 = v7;
    v17 = v8;
    objc_msgSend(v9, "allowDownloadDialogWithDownload:initiatingURL:allowViewAction:completionHandler:", v16, v10, a3, &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 280), "presentDialog:", v11, v12, v13, v14, v15);
  }

}

uint64_t __79__TabDocument__presentDialogToAllowDownload_allowViewAction_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a2 != 2)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mimeType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uti");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = 2;
    else
      v7 = 1;
    objc_msgSend(v4, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v5, v6, 0, v7, 0);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  _QWORD v13[5];
  void (**v14)(id, uint64_t);

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "suppressesPrompt") & 1) != 0
    || (objc_msgSend(v9, "downloads"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", v7),
        v10,
        (v11 & 1) != 0))
  {
    v12 = 1;
LABEL_4:
    v8[2](v8, v12);
    goto LABEL_5;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState") == 2)
  {
    v12 = 0;
    goto LABEL_4;
  }
  if (objc_msgSend(v9, "shouldExcludeDownloadFromList:", v7))
  {
    v8[2](v8, 1);
    objc_storeStrong((id *)&self->_downloadReflectedInFluidProgress, a3);
    objc_msgSend(v7, "setFluidProgressController:", self->_fluidProgressController);
    -[WBSFluidProgressController startFluidProgressWithProgressStateSource:](self->_fluidProgressController, "startFluidProgressWithProgressStateSource:", v7);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__TabDocument_downloadShouldContinueAfterReceivingResponse_decisionHandler___block_invoke;
    v13[3] = &unk_1E9CF9148;
    v13[4] = self;
    v14 = v8;
    -[TabDocument _presentDialogToAllowDownload:allowViewAction:completionHandler:]((uint64_t)self, v7, 0, v13);

  }
LABEL_5:

}

void __76__TabDocument_downloadShouldContinueAfterReceivingResponse_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD *v5;

  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2 == 0);
  if (a2 != 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "committedURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      v5 = *(_QWORD **)(a1 + 32);
      if (!v5[152])
        objc_msgSend(v5, "_closeTabDocumentAnimated:", 0);
    }
  }
}

- (void)userDidManipulateVisibleRegion
{
  -[TabDocument setSuppressingProgressAnimationForNavigationGesture:](self, "setSuppressingProgressAnimationForNavigationGesture:", 0);
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
  if (a3)
    -[_SFDownload cancel](self->_downloadReflectedInFluidProgress, "cancel");
  -[TabDocument setSearchableItemAttributes:](self, "setSearchableItemAttributes:", 0);
  -[TabDocument setMediaStateIcon:]((uint64_t)self, 0);
  -[TabDocument invalidateUserActivity]((uint64_t)self);
}

- (void)setMediaStateIcon:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id WeakRetained;

  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 496);
    if (v4 != a2 || *(_BYTE *)(a1 + 488))
    {
      if ((unint64_t)(a2 - 1) > 1)
      {
        if ((unint64_t)(v4 - 3) >= 0xFFFFFFFFFFFFFFFELL)
        {
          +[MediaCaptureStatusBarManager sharedManager](MediaCaptureStatusBarManager, "sharedManager");
          v7 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "recordingDocumentDidEndMediaCapture:", a1);

        }
      }
      else if ((unint64_t)(v4 - 1) >= 2)
      {
        +[MediaCaptureStatusBarManager sharedManager](MediaCaptureStatusBarManager, "sharedManager");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recordingDocumentDidBeginMediaCapture:audioOnly:", a1, a2 == 1);

      }
      *(_QWORD *)(a1 + 496) = a2;
      -[TabDocument _updateBarItemsWithCurrentMediaState]((id *)a1);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "tabDocumentDidChangeMediaState:needsUpdateGlobalAudioState:", a1, *(unsigned __int8 *)(a1 + 488));
        objc_msgSend((id)a1, "navigationBarItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setMediaStateIcon:", a2);

      }
      -[TabDocument _notifyDidUpdateTabCollectionItem]((id *)a1);

    }
  }
}

- (void)dismissAppSuggestionBanner:(id)a3
{
  id WeakRetained;
  SFAppSuggestionBanner *storeBanner;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "removeAppBannerFromTabDocument:animated:", self, 1);

  storeBanner = self->_storeBanner;
  self->_storeBanner = 0;

}

- (void)setAppSuggestionBanner:(id)a3 isPinned:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setAppBannerPinnedToTop:forTabDocument:", v4, self);

}

- (BOOL)shouldBlockAppSuggestionBanner:(id)a3
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled") ^ 1;

  return v4;
}

- (void)prepareToContinueUserActivity
{
  SFNavigationBarItem *navigationBarItem;
  id v4;

  -[WBSFluidProgressController startFluidProgressWithProgressStateSource:](self->_fluidProgressController, "startFluidProgressWithProgressStateSource:", self);
  navigationBarItem = self->_navigationBarItem;
  _WBSLocalizedString();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarItem setCustomPlaceholderText:](navigationBarItem, "setCustomPlaceholderText:");

}

- (void)didFailToContinueUserActivity
{
  -[WBSFluidProgressController cancelFluidProgressWithProgressStateSource:](self->_fluidProgressController, "cancelFluidProgressWithProgressStateSource:", self);
}

- (void)doneWaitingToContinueUserActivity
{
  -[SFNavigationBarItem setCustomPlaceholderText:](self->_navigationBarItem, "setCustomPlaceholderText:", 0);
}

- (id)_initWithBrowserController:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  TabDocument *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isPrivateBrowsingEnabled");
  v9 = objc_msgSend(v6, "isControlledByAutomation");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__TabDocument__initWithBrowserController_configuration___block_invoke;
  v13[3] = &unk_1E9CF3358;
  v14 = self;
  v10 = v7;
  v15 = v10;
  v11 = -[TabDocument _initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:bookmark:browserController:createDocumentView:](v14, 0, 0, 0, v8, v9, 0, v6, v13);

  return v11;
}

void __56__TabDocument__initWithBrowserController_configuration___block_invoke(uint64_t a1)
{
  -[TabDocument _createDocumentViewWithConfiguration:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  WBSURLSpoofingMitigator *v10;
  id WeakRetained;
  id v12;
  void *v13;
  WBSURLSpoofingMitigator *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  id autoFillAuthenticationCompletionBlock;
  _SFDownload *downloadReflectedInFluidProgress;
  _SFDownload *activeDownload;
  double v23;
  double v24;
  id unresponsiveWebProcessBlock;
  void *v26;
  int v27;
  TabDocument *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (WBSURLSpoofingMitigator *)a4;
  if ((void *)kTabDocumentObserverContext == a6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if (self->_webView == v10 || self->_readerWebView == v10)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("loading")))
      {
        if (-[_SFWebView isLoading](self->_webView, "isLoading"))
        {
          self->_webViewIsLoading = 1;
          self->_shouldSuppressDialogsThatBlockWebProcessForProvisionalNavigation = 1;
          autoFillAuthenticationCompletionBlock = self->_autoFillAuthenticationCompletionBlock;
          self->_autoFillAuthenticationCompletionBlock = 0;

          -[_SFDownload cancel](self->_downloadReflectedInFluidProgress, "cancel");
          -[_SFDownload setFluidProgressController:](self->_downloadReflectedInFluidProgress, "setFluidProgressController:", 0);
          downloadReflectedInFluidProgress = self->_downloadReflectedInFluidProgress;
          self->_downloadReflectedInFluidProgress = 0;

          activeDownload = self->_activeDownload;
          self->_activeDownload = 0;

          -[WBSFluidProgressController startFluidProgressWithProgressStateSource:](self->_fluidProgressController, "startFluidProgressWithProgressStateSource:", self);
          -[_SFWebView estimatedProgress](self->_webView, "estimatedProgress");
          -[TabDocument _loadingControllerEstimatedProgressChangedTo:]((uint64_t)self, v23);
          -[TabDocument _loadingControllerDidStartLoading]((uint64_t)self);
        }
        else
        {
          self->_webViewIsLoading = 0;
          objc_msgSend(WeakRetained, "updateInterface");
          if (self->_didQuickStopWhileBlank)
          {
            objc_msgSend(WeakRetained, "updateFavoritesForNewDocument");
            self->_didQuickStopWhileBlank = 0;
          }
        }
        -[TabDocument updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
        -[TabDocument _loadingStateForWebExtensionsMayHaveChanged](self);
        goto LABEL_37;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("URL")))
      {
        -[TabDocument _updateNavigationBarItem]((uint64_t)self);
        -[TabDocument updateTabIconWithDelay:](self, "updateTabIconWithDelay:", 0.1);
        objc_msgSend(v12, "tabDocumentDidUpdateURL:", self);
        goto LABEL_37;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("estimatedProgress")))
      {
        -[_SFWebView estimatedProgress](self->_webView, "estimatedProgress");
        -[TabDocument _loadingControllerEstimatedProgressChangedTo:]((uint64_t)self, v24);
        goto LABEL_37;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("_networkRequestsInProgress")))
      {
        if (-[_SFWebView _networkRequestsInProgress](self->_webView, "_networkRequestsInProgress"))
          -[TabDocument _startedLoadingResources]((id *)&self->super.isa);
        else
          -[TabDocument _stoppedLoadingResources]((id *)&self->super.isa);
        goto LABEL_37;
      }
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("hasOnlySecureContent")) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("_negotiatedLegacyTLS")) & 1) == 0)
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("title")))
        {
          objc_msgSend(v12, "tabDocumentDidUpdateTitle:", self);
          -[TabDocument updateTabTitle](self, "updateTabTitle");
          goto LABEL_37;
        }
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("canGoBack")) & 1) == 0
          && !objc_msgSend(v9, "isEqualToString:", CFSTR("canGoForward")))
        {
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("_webProcessIsResponsive")))
          {
            if (-[_SFWebView _webProcessIsResponsive](self->_webView, "_webProcessIsResponsive")
              && -[NSTimer isValid](self->_unresponsiveWebProcessTimer, "isValid"))
            {
              -[NSTimer invalidate](self->_unresponsiveWebProcessTimer, "invalidate");
              (*((void (**)(void))self->_unresponsiveWebProcessBlock + 2))();
              unresponsiveWebProcessBlock = self->_unresponsiveWebProcessBlock;
              self->_unresponsiveWebProcessBlock = 0;

              self->_suppressCrashBanner = 0;
            }
          }
          else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("themeColor")) & 1) != 0
                 || (objc_msgSend(v9, "isEqualToString:", CFSTR("underPageBackgroundColor")) & 1) != 0
                 || objc_msgSend(v9, "isEqualToString:", CFSTR("_sampledPageTopColor")))
          {
            objc_msgSend(v12, "tabDocumentDidUpdateThemeColor:", self);
          }
          else if (objc_msgSend(v9, "isEqualToString:", CFSTR("_isPlayingAudio")))
          {
            +[Application sharedApplication](Application, "sharedApplication");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "updateShouldLockPrivateBrowsingWithTimerIfNecessary");

          }
          goto LABEL_37;
        }
        objc_msgSend(v12, "tabDocumentDidUpdateBackForward:", self);
      }
    }
    else
    {
      if (self->_URLSpoofingMitigator != v10)
      {
        +[Application sharedApplication](Application, "sharedApplication");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "systemNoteTakingController");
        v14 = (WBSURLSpoofingMitigator *)objc_claimAutoreleasedReturnValue();

        if (v14 == v10 && objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D8B188]))
        {
          +[Application sharedApplication](Application, "sharedApplication");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "systemNoteTakingController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isNotesPIPVisible");

          v18 = WBS_LOG_CHANNEL_PREFIXContinuity();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = CFSTR("not visible");
            if (v17)
              v19 = CFSTR("visible");
            v27 = 134218242;
            v28 = self;
            v29 = 2112;
            v30 = v19;
            _os_log_impl(&dword_1D7CA3000, v18, OS_LOG_TYPE_INFO, "TabDocument: %p Notes PIP becomes %@", (uint8_t *)&v27, 0x16u);
          }
          if (v17)
            -[TabDocument restoreAllHighlightsData](self, "restoreAllHighlightsData");
        }
        goto LABEL_37;
      }
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("UIShouldReflectCommittedURLInsteadOfCurrentURL")))
      {
LABEL_37:

        goto LABEL_38;
      }
    }
    -[TabDocument _updateNavigationBarItem]((uint64_t)self);
    goto LABEL_37;
  }
LABEL_38:

}

- (void)_didFinishLoading
{
  void *v2;

  if (a1)
  {
    -[TabDocument _loadingControllerEstimatedProgressChangedTo:](a1, 0.0);
    -[TabDocument _loadingControllerDidStopLoadingWithError:](a1, *(void **)(a1 + 32));
    v2 = *(void **)(a1 + 1416);
    *(_QWORD *)(a1 + 1416) = 0;

    *(_BYTE *)(a1 + 677) = 0;
  }
}

- (void)_loadingControllerDidStopLoadingWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v13 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 1008), "isLoading");
    if ((v5 & 1) == 0)
    {
      *(_BYTE *)(a1 + 675) = 0;
      *(_BYTE *)(a1 + 922) = 0;
    }
    *(_BYTE *)(a1 + 679) = 1;
    objc_msgSend((id)a1, "updateTabTitle");
    -[TabDocument _updateNavigationBarItem](a1);
    if ((objc_msgSend((id)a1, "isShowingErrorPage") & 1) == 0)
    {
      v6 = -[TabDocument pageLoadStatusForNavigationError:](a1, v13);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didFinishPageLoadWithPageLoadStatus:", v6);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
    objc_msgSend(WeakRetained, "tabDocument:didFinishLoadingWithError:", a1, v13 != 0);

    v4 = v13;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 1248), "handleFrameLoadError:", v13);
      objc_msgSend(*(id *)(a1 + 168), "cancelFluidProgressWithProgressStateSource:", a1);
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 168), "startFluidProgressWithProgressStateSource:", a1);
        objc_msgSend(*(id *)(a1 + 1008), "estimatedProgress");
        -[TabDocument _loadingControllerEstimatedProgressChangedTo:](a1, v9);
      }
      v10 = objc_loadWeakRetained((id *)(a1 + 1200));
      objc_msgSend(v10, "didFailLoadingResource:", a1);

      objc_msgSend(*(id *)(a1 + 1224), "testController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "autoFillController:didFailFormMetadataForTesting:", *(_QWORD *)(a1 + 1224), v13);

      v4 = v13;
    }
  }

}

- (uint64_t)pageLoadStatusForNavigationError:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x1E0CB32E8])
      && (objc_msgSend(v4, "code") == -999 || objc_msgSend(v4, "code") == -1012))
    {
      v5 = 1;
    }
    else
    {
      v5 = 2;
    }
  }

  return v5;
}

- (id)pdfView
{
  _SFWebView *v3;

  if (-[TabDocument isPDFDocument](self, "isPDFDocument"))
    v3 = self->_webView;
  else
    v3 = 0;
  return v3;
}

- (void)setOverlaidAccessoryViewsInset:(CGSize)a3
{
  -[_SFWebView _setOverlaidAccessoryViewsInset:](self->_webView, "_setOverlaidAccessoryViewsInset:", a3.width, a3.height);
}

- (void)_updateFallbackURLsForUserTypedAddress:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = v3;

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__TabDocument__updateFallbackURLsForUserTypedAddress___block_invoke;
    v8[3] = &unk_1E9CF9170;
    v8[4] = a1;
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_enumeratePossibleURLsForUserTypedString:withBlock:", v7, v8);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 128), "count") >= 2)
    {
      v5 = *(void **)(a1 + 128);
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
  }

}

- (uint64_t)_loadNextFallbackURLWithWebClip:(_QWORD *)a3 navigation:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 128), "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (-[TabDocument _trySwitchingToPinnedTabOnNavigationToURL:](a1, v6) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 128), "removeObjectAtIndex:", 0);
      objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument _requestBySettingAdvancedPrivacyProtectionsFlag:]((void *)a1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setAssociatedObject(v9, (const void *)kWebClipToNSURLRequestAssociationKey, v5, (void *)1);
      v10 = *(void **)(a1 + 1008);
      if (v10
        && (!objc_msgSend(v10, "_webProcessIsResponsive")
         || (objc_msgSend(*(id *)(a1 + 280), "presentedDialog"),
             v11 = (void *)objc_claimAutoreleasedReturnValue(),
             v12 = objc_msgSend(v11, "completionHandlerBlocksWebProcess"),
             v11,
             (v12 & 1) != 0)))
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __58__TabDocument__loadNextFallbackURLWithWebClip_navigation___block_invoke;
        v16[3] = &unk_1E9CF3358;
        v16[4] = a1;
        v17 = v9;
        -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:](a1, 0, v16);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 160), "loadRequest:userDriven:", v9, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (a3)
          *a3 = objc_retainAutorelease(v13);

      }
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __54__TabDocument__updateFallbackURLsForUserTypedAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", a2);
}

id __58__TabDocument__loadNextFallbackURLWithWebClip_navigation___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "loadRequest:userDriven:", *(_QWORD *)(a1 + 40), 1);
}

- (void)stopLoadingUserInitiated
{
  BOOL isBlank;

  isBlank = self->_isBlank;
  if (isBlank)
    isBlank = !self->_didCommitCurrentNavigation;
  self->_didQuickStopWhileBlank = isBlank;
  -[TabDocument stopLoading](self, "stopLoading");
}

- (void)stopLoading
{
  -[LoadingController stopLoading](self->_loadingController, "stopLoading");
  -[WBSFluidProgressController cancelFluidProgressWithProgressStateSource:](self->_fluidProgressController, "cancelFluidProgressWithProgressStateSource:", self);
}

- (void)goToBackForwardListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    self->_wasOpenedFromHistory = 1;
    self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
    +[Application sharedApplication](Application, "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkExtendedLaunchPageLoad:forTabDocument:", v6, self);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__TabDocument_goToBackForwardListItem___block_invoke;
    v7[3] = &unk_1E9CF3358;
    v7[4] = self;
    v8 = v4;
    -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v7);

  }
}

id __39__TabDocument_goToBackForwardListItem___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "goToBackForwardListItem:", *(_QWORD *)(a1 + 40));
}

- (void)clearBackForwardListKeepingCurrentItem
{
  id v2;

  -[_SFWebView backForwardList](self->_webView, "backForwardList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_clear");

}

- (void)clearBackForwardList
{
  id v2;

  -[_SFWebView backForwardList](self->_webView, "backForwardList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeAllItems");

}

- (void)hibernate
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_2(&dword_1D7CA3000, a2, a3, "TabDocument %p is hibernating even though it has queued work to perform after terminating an unresponsive web process.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_10();
}

void __26__TabDocument_unhibernate__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "safari_isSafariWebExtensionURL");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend((id)v3, "loadURL:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v4 = (id)objc_msgSend(*(id *)(v3 + 1008), "_restoreSessionState:andNavigate:", *(_QWORD *)(v3 + 56), 1);
    -[TabDocument _loadDeferredURLIfNeeded](*(_QWORD *)(a1 + 40));
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 936));
  objc_msgSend(WeakRetained, "tabCollectionViewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedContentImageForTabWithUUID:allowScaledImage:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1304), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "setPlaceholderImage:", v7);
    objc_msgSend(*(id *)(a1 + 40), "setSuppressingProgressAnimationForNavigationGesture:", 1);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = 0;

}

- (BOOL)isAlive
{
  return -[_SFWebView _webProcessIdentifier](self->_webView, "_webProcessIdentifier") != 0;
}

- (_WKSessionState)sessionState
{
  if (self->_hibernated)
    return self->_savedSessionState;
  -[_SFWebView _sessionState](self->_webView, "_sessionState");
  return (_WKSessionState *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)restoreSessionState:(id)a3 andNavigate:(BOOL)a4
{
  -[TabDocument restoreSessionState:andNavigate:fromSafariViewService:](self, "restoreSessionState:andNavigate:fromSafariViewService:", a3, a4, 0);
}

- (void)restoreSessionState:(id)a3 andNavigate:(BOOL)a4 fromSafariViewService:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  void *v10;
  unint64_t v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v10 = v9;
  if (self->_hibernated)
  {
    objc_storeStrong((id *)&self->_savedSessionState, a3);
  }
  else
  {
    v11 = 1;
    if (v5)
      v11 = 2;
    self->_sessionStateRestorationSource = v11;
    if (v6)
      self->_externalAppRedirectState = 4;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__TabDocument_restoreSessionState_andNavigate_fromSafariViewService___block_invoke;
    v12[3] = &unk_1E9CF3550;
    v12[4] = self;
    v13 = v9;
    v14 = v6;
    -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v12);

  }
}

id __69__TabDocument_restoreSessionState_andNavigate_fromSafariViewService___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "_restoreSessionState:andNavigate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_loadQueuedNavigation:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    v12 = v3;
    objc_msgSend(v3, "localAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queuedNavigation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "localAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queuedNavigation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "loadURL:title:skipSyncableTabUpdates:", v8, v11, 0);
    v3 = v12;
  }

}

- (void)restoreStateFromTab:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *pinnedTitle;
  void *v17;
  NSURL *v18;
  NSURL *pinnedURL;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "localAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6D0]), "initWithData:", v6);
    if (v7)
    {
      objc_msgSend(v22, "localAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "queuedNavigation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument restoreSessionState:andNavigate:](self, "restoreSessionState:andNavigate:", v7, v9 == 0);

    }
    objc_msgSend(v22, "localAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queuedNavigation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[TabDocument _loadQueuedNavigation:](self, v22);
  }
  else
  {
    if (self->_hibernated)
      goto LABEL_10;
    objc_msgSend(v22, "localAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queuedNavigation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[TabDocument _loadQueuedNavigation:](self, v22);
      goto LABEL_10;
    }
    objc_msgSend(v22, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument loadURL:title:skipSyncableTabUpdates:](self, "loadURL:title:skipSyncableTabUpdates:", v7, v21, 0);

  }
LABEL_10:
  -[TabDocument setPinned:](self, "setPinned:", objc_msgSend(v22, "isPinned"));
  objc_msgSend(v22, "pinnedTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSString *)objc_msgSend(v14, "copy");
  pinnedTitle = self->_pinnedTitle;
  self->_pinnedTitle = v15;

  objc_msgSend(v22, "pinnedURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (NSURL *)objc_msgSend(v17, "copy");
  pinnedURL = self->_pinnedURL;
  self->_pinnedURL = v18;

  objc_storeStrong((id *)&self->_tabGroupTab, a3);
  -[WBTab uuid](self->_tabGroupTab, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _activeParticipantsDidUpdateInTabWithUUID:]((id *)&self->super.isa, v20);

}

- (BOOL)mustShowBarsForBackForwardListItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (self->_parentTabItem)
    v6 = 1;
  else
    v6 = -[WKBackForwardListItem safari_navigationSnapshotRequiresBars](v4);

  return v6;
}

- (NSURL)committedURL
{
  return (NSURL *)-[_SFWebView _committedURL](self->_webView, "_committedURL");
}

- (BOOL)hasFailedURL
{
  void *v2;
  BOOL v3;

  -[_SFWebView _unreachableURL](self->_webView, "_unreachableURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  _BOOL8 v4;

  if (self->_allowsInspectionWhenUnlocked != a3)
  {
    self->_allowsInspectionWhenUnlocked = a3;
    v4 = -[TabDocument allowsRemoteInspection](self, "allowsRemoteInspection");
    -[_SFWebView setInspectable:](self->_webView, "setInspectable:", v4);
    -[_SFWebView setInspectable:](self->_readerWebView, "setInspectable:", v4);
  }
}

- (void)presentNextDialogIfNeeded
{
  -[TabDocument _authenticateForAutoFillIfNeeded]((uint64_t)self);
  -[SFDialogController presentNextDialogIfNeeded](self->_dialogController, "presentNextDialogIfNeeded");
}

- (void)_authenticateForAutoFillIfNeeded
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (a1 && *(_QWORD *)(a1 + 152))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_INFO, "Retrying AutoFill authentication", v4, 2u);
    }
    -[TabDocument _getAuthenticationForAutoFillController:withCompletion:](a1, *(void **)(a1 + 1224), *(void **)(a1 + 152));
    v3 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = 0;

  }
}

- (void)_getAuthenticationForAutoFillController:(void *)a3 withCompletion:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "authenticationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__TabDocument__getAuthenticationForAutoFillController_withCompletion___block_invoke;
    v8[3] = &unk_1E9CF9778;
    v10 = v6;
    v9 = v5;
    objc_msgSend(v7, "authenticateForClient:userInitiated:completion:", v9, 1, v8);

  }
}

- (void)performAutoFillAction
{
  -[_SFFormAutoFillController autoFill](self->_autoFillController, "autoFill");
}

- (void)performPageLevelAutoFill
{
  -[_SFFormAutoFillController performPageLevelAutoFill](self->_autoFillController, "performPageLevelAutoFill");
}

- (void)sendEventsForAutoFillTelemetry
{
  -[_SFFormAutoFillController sendEventsForAutoFillTelemetry](self->_autoFillController, "sendEventsForAutoFillTelemetry");
}

- (void)loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5
{
  -[_SFWebView _loadAlternateHTMLString:baseURL:forUnreachableURL:](self->_webView, "_loadAlternateHTMLString:baseURL:forUnreachableURL:", a3, a4, a5);
}

- (id)_backForwardList
{
  return (id)-[_SFWebView backForwardList](self->_webView, "backForwardList");
}

id __39__TabDocument__addTitlePrefixToString___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "simplifiedIdentifierForDisplayInTabTitle:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)customUserAgent
{
  return (NSString *)-[_SFWebView _customUserAgent](self->_webView, "_customUserAgent");
}

- (void)setCustomUserAgent:(id)a3
{
  -[_SFWebView _setCustomUserAgent:](self->_webView, "_setCustomUserAgent:", a3);
}

- (id)dataForDisplayedPDF
{
  return -[TabDocument dataForQuickLookDocument:](self, "dataForQuickLookDocument:", self->_quickLookDocument);
}

- (id)suggestedFilenameForDisplayedPDF
{
  return -[TabDocument suggestedFileNameForQuickLookDocument:](self, "suggestedFileNameForQuickLookDocument:", self->_quickLookDocument);
}

- (id)dataForQuickLookDocument:(id)a3
{
  -[_SFWebView _dataForDisplayedPDF](self->_webView, "_dataForDisplayedPDF", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)suggestedFileNameForQuickLookDocument:(id)a3
{
  -[_SFWebView _sf_suggestedFilename](self->_webView, "_sf_suggestedFilename", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)suggestedFileExtensionForQuickLookDocument:(id)a3
{
  return CFSTR("pdf");
}

- (void)loadTestURL:(id)a3 withCallback:(id)a4
{
  -[TabDocument loadTestURL:withCallback:pagesNeedingMemoryWarningSent:](self, "loadTestURL:withCallback:pagesNeedingMemoryWarningSent:", a3, a4, 0);
}

- (void)loadTestURL:(id)a3 withCallback:(id)a4 pagesNeedingMemoryWarningSent:(id)a5
{
  id v8;
  void *v9;
  PageLoadTestStatistics *v10;
  PageLoadTestStatistics *pageLoadStatistics;
  PageLoadTest *v12;
  PageLoadTest *pageLoadTest;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument clearPageLoadStatistics](self, "clearPageLoadStatistics");
  v10 = -[PageLoadTestStatistics initWithCallback:]([PageLoadTestStatistics alloc], "initWithCallback:", v15);
  pageLoadStatistics = self->_pageLoadStatistics;
  self->_pageLoadStatistics = v10;

  if (!self->_pageLoadTest)
  {
    v12 = -[PageLoadTest initWithTabDocument:pagesNeedingMemoryWarningSent:]([PageLoadTest alloc], "initWithTabDocument:pagesNeedingMemoryWarningSent:", self, v8);
    pageLoadTest = self->_pageLoadTest;
    self->_pageLoadTest = v12;

  }
  -[TabDocument loadRequest:userDriven:](self, "loadRequest:userDriven:", v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PageLoadTestStatistics setNavigation:](self->_pageLoadStatistics, "setNavigation:", v14);

}

- (_SFSafariSharingExtensionController)sharingExtensionController
{
  _SFSafariSharingExtensionController *sharingExtensionController;
  id v4;
  void *v5;
  _SFSafariSharingExtensionController *v6;
  _SFSafariSharingExtensionController *v7;

  sharingExtensionController = self->_sharingExtensionController;
  if (!sharingExtensionController)
  {
    v4 = objc_alloc(MEMORY[0x1E0CD5790]);
    -[TabDocument webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_SFSafariSharingExtensionController *)objc_msgSend(v4, "initWithWebView:", v5);
    v7 = self->_sharingExtensionController;
    self->_sharingExtensionController = v6;

    sharingExtensionController = self->_sharingExtensionController;
  }
  return sharingExtensionController;
}

- (void)saveWebArchiveToPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _SFWebView *webView;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  webView = self->_webView;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__TabDocument_saveWebArchiveToPath_completion___block_invoke;
  v11[3] = &unk_1E9CF91C0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[_SFWebView _getWebArchiveDataWithCompletionHandler:](webView, "_getWebArchiveDataWithCompletionHandler:", v11);

}

void __47__TabDocument_saveWebArchiveToPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "length"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(id *)(a1 + 32);
    if ((objc_msgSend(v7, "hasSuffix:", CFSTR(".webarchive")) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR(".webarchive"));
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v8;
    }
    v9 = 0;
    objc_msgSend(v5, "writeToFile:options:error:", v7, 0x40000000, &v9);
    v6 = v9;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)setSourceApplicationBundleIdentifierForNextCommit:(id)a3
{
  NSString *v4;
  NSString *sourceApplicationBundleIdentifierForNextCommit;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  sourceApplicationBundleIdentifierForNextCommit = self->_sourceApplicationBundleIdentifierForNextCommit;
  self->_sourceApplicationBundleIdentifierForNextCommit = v4;

  if (v6)
    self->_sourceApplicationIsValid = 1;

}

- (void)invalidateSourceApplication
{
  self->_sourceApplicationIsValid = 0;
}

- (NSUUID)ownerUUID
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (SFTabStateData)tabStateData
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  int v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = objc_alloc_init(MEMORY[0x1E0D4EDC8]);
  -[TabDocument URLForStatePersisting](self, "URLForStatePersisting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_originalDataAsString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E9CFDBB0;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  -[TabDocument uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUUIDString:", v10);

  -[TabDocument _titleForStatePersistingForTabStateData]((id *)&self->super.isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v11);

  objc_msgSend(v3, "setUrl:", v8);
  if (self->_hasDeferredNavigation)
  {
    objc_msgSend(v3, "setUserVisibleURL:", v8);
    objc_msgSend(v3, "setLastViewedTime:", -1.0);
    objc_msgSend(v3, "setReadingListBookmarkID:", 0);
    objc_msgSend(v3, "setShowingReader:", 0);
    objc_msgSend(v3, "setReaderViewTopScrollOffset:", 0);
    objc_msgSend(v3, "setDisplayingStandaloneImage:", 0);
    v12 = 0;
  }
  else
  {
    v13 = objc_msgSend(v4, "isFileURL");
    v14 = v8;
    if (v13)
    {
      -[TabDocument URLString](self, "URLString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setUserVisibleURL:", v14);
    if (v13)

    -[TabDocument lastViewedTime](self, "lastViewedTime");
    objc_msgSend(v3, "setLastViewedTime:");
    objc_msgSend(v3, "setReadingListBookmarkID:", -[TabDocument readingListBookmarkID](self, "readingListBookmarkID"));
    if (self->_hibernated)
      v15 = -[TabDocument shouldRestoreReader](self, "shouldRestoreReader");
    else
      v15 = -[TabDocument isShowingReader](self, "isShowingReader");
    objc_msgSend(v3, "setShowingReader:", v15);
    objc_msgSend(v3, "setReaderViewTopScrollOffset:", -[TabDocument readerViewTopScrollOffset](self, "readerViewTopScrollOffset"));
    objc_msgSend(v3, "setDisplayingStandaloneImage:", -[TabDocument isDisplayingStandaloneImage](self, "isDisplayingStandaloneImage"));
    v12 = -[TabDocument wasOpenedFromLink](self, "wasOpenedFromLink");
  }
  objc_msgSend(v3, "setWasOpenedFromLink:", v12);
  objc_msgSend(v3, "setPrivateBrowsing:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
  -[TabDocument _sessionStateWithoutParentItem]((id *)&self->super.isa);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionStateData:", v17);

  -[TabDocument ownerUUID](self, "ownerUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOwningBrowserWindowUUIDString:", v19);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v3, "setOrderIndex:", objc_msgSend(WeakRetained, "orderIndexForTab:", self));

  if (-[TabDocument isHibernated](self, "isHibernated"))
    v21 = -[TabDocument persistWhenHibernated](self, "persistWhenHibernated") ^ 1;
  else
    v21 = 0;
  objc_msgSend(v3, "setSkipUpdate:", v21);
  objc_msgSend(v3, "sessionStateData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUncompressedSessionStateDataSize:", objc_msgSend(v22, "length"));

  -[TabDocument tabGroupTab](self, "tabGroupTab");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "tabGroupUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTabGroupUUID:", v24);

  -[TabDocument profileIdentifier]((uint64_t)self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProfileIdentifier:", v25);

  -[TabDocument setPersistWhenHibernated:](self, "setPersistWhenHibernated:", 0);
  return (SFTabStateData *)v3;
}

- (int64_t)pageStatus
{
  if (-[TabDocument isShowingErrorPage](self, "isShowingErrorPage"))
    return 2;
  else
    return 1;
}

void __109__TabDocument__openAppLinkInApp_fromOriginalRequest_updateAppLinkStrategy_webBrowserState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__TabDocument__openAppLinkInApp_fromOriginalRequest_updateAppLinkStrategy_webBrowserState_completionHandler___block_invoke_2;
  v6[3] = &unk_1E9CF91E8;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __109__TabDocument__openAppLinkInApp_fromOriginalRequest_updateAppLinkStrategy_webBrowserState_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void (***)(_QWORD, _QWORD))(v2 + 40);
  if (v3)
  {
    v3[2](v3, *(_QWORD *)(a1 + 32));
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void (***)(_QWORD, _QWORD))(v2 + 40);
  }
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)_checkForAppLinkWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1008), "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "safari_isHTTPFamilyURL")
      && !objc_msgSend((id)a1, "isShowingErrorPage"))
    {
      objc_msgSend(*(id *)(a1 + 1008), "backForwardList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentItem");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 312);
      *(_QWORD *)(a1 + 312) = v7;

      v9 = *(_BYTE *)(a1 + 902);
      v10 = *(id *)(a1 + 1160);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", v4);
      objc_initWeak(&location, (id)a1);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__TabDocument__checkForAppLinkWithCompletion___block_invoke;
      v14[3] = &unk_1E9CF9288;
      v12 = v11;
      v15 = v12;
      objc_copyWeak(&v18, &location);
      v17 = v3;
      v13 = v10;
      v16 = v13;
      v19 = v9;
      objc_msgSend(v12, "decideOpenStrategyWithCompletionHandler:", v14);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
    else
    {
      v5 = *(void **)(a1 + 312);
      *(_QWORD *)(a1 + 312) = 0;

      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    }

  }
}

void __46__TabDocument__checkForAppLinkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  char v13;

  objc_msgSend(*(id *)(a1 + 32), "synchronousTargetApplicationProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TabDocument__checkForAppLinkWithCompletion___block_invoke_2;
  block[3] = &unk_1E9CF9260;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v5 = *(id *)(a1 + 48);
  v12[1] = a2;
  v11 = v5;
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v13 = *(_BYTE *)(a1 + 64);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v12);
}

void __46__TabDocument__checkForAppLinkWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v4 = (uint64_t)WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained[126], "backForwardList"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "currentItem"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = *(void **)(v4 + 312),
        v6,
        v5,
        v6 == v7))
  {
    v8 = *(_QWORD *)(a1 + 72);
    v9 = atomic_load((unsigned __int8 *)&_ZGVZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers);
    if ((v9 & 1) == 0
      && __cxa_guard_acquire(&_ZGVZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers))
    {
      v18 = *MEMORY[0x1E0D89D98];
      v26[0] = *MEMORY[0x1E0D89DC0];
      v26[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      _ZZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers = objc_claimAutoreleasedReturnValue();
      __cxa_guard_release(&_ZGVZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers);
    }
    if ((unint64_t)(v8 - 1) > 2
      || (v10 = _ZZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers,
          objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v10) = objc_msgSend((id)v10, "containsObject:", v11),
          v11,
          (v10 & 1) != 0))
    {
      v12 = *(id *)(v4 + 344);
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0D4EBB0]);
      v14 = *(_QWORD *)(a1 + 40);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __46__TabDocument__checkForAppLinkWithCompletion___block_invoke_3;
      v22 = &unk_1E9CF9238;
      objc_copyWeak(&v25, v2);
      v24 = *(id *)(a1 + 56);
      v23 = *(id *)(a1 + 48);
      v12 = (id)objc_msgSend(v13, "initWithAppLink:openActionHandler:", v14, &v19);
      objc_msgSend(v12, "setInitiallyBehindNavigationBar:", *(_BYTE *)(a1 + 80) == 0, v19, v20, v21, v22);

      objc_destroyWeak(&v25);
    }
    v15 = *(void **)(v4 + 312);
    *(_QWORD *)(v4 + 312) = 0;

    v16 = objc_loadWeakRetained((id *)(v4 + 1192));
    v17 = v16;
    if (v12)
    {
      -[TabDocument _setAppBannerWhenPainted:](v4, v12);
    }
    else if (*(_BYTE *)(v4 + 903) && (objc_msgSend(v16, "tabDocumentShouldDeferAppBannerRemoval:", v4) & 1) == 0)
    {
      objc_msgSend(v17, "removeAppBannerFromTabDocument:animated:", v4, 0);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __46__TabDocument__checkForAppLinkWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DAB530]);
    if (*(_QWORD *)(a1 + 32) && WeakRetained[687])
      objc_msgSend(v4, "setObject:forKeyedSubscript:");
    objc_msgSend(v6, "appLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openExternallyWithWebBrowserState:referrerURL:completionHandler:", v4, 0, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_contentBlockerStatisticsStore
{
  uint64_t v1;
  char v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a1)
  {
    v1 = (uint64_t)a1;
    v2 = objc_msgSend(a1, "isPrivateBrowsingEnabled");
    v3 = *(void **)(v1 + 624);
    if ((v2 & 1) != 0)
    {
      if (!v3)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0D8A878]);
        v5 = *(void **)(v1 + 624);
        *(_QWORD *)(v1 + 624) = v4;
LABEL_7:

        v3 = *(void **)(v1 + 624);
      }
    }
    else if (!v3)
    {
      v6 = (void *)MEMORY[0x1E0D8A880];
      -[TabDocument profileIdentifier](v1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "storeForProfileWithIdentifier:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(v1 + 624);
      *(_QWORD *)(v1 + 624) = v7;

      goto LABEL_7;
    }
    a1 = v3;
  }
  return a1;
}

- (BOOL)queryParameterFilteringDataQueueShouldMergePendingData:(id)a3
{
  return self->_didCommitCurrentNavigation;
}

- (void)_displayAttributionBannerForHighlight:(unsigned __int8 *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC98]), "initWithHighlight:", v3);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__TabDocument__displayAttributionBannerForHighlight___block_invoke;
    v9[3] = &unk_1E9CF92B0;
    objc_copyWeak(&v11, &location);
    v6 = v5;
    v10 = v6;
    objc_msgSend(v4, "setCloseActionHandler:", v9);
    objc_msgSend(v4, "setInitiallyBehindNavigationBar:", a1[902]);
    -[TabDocument _setAppBannerWhenPainted:]((uint64_t)a1, v4);
    +[Application sharedApplication](Application, "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "highlightManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPresenter:forHighlightIdentifier:", a1, v6);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __53__TabDocument__displayAttributionBannerForHighlight___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "hideBannerForHighlightIdentifier:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0D4ECA0], "sharedTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "blockBannerForHighlight:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)_checkForHighlight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (a1 && (objc_msgSend((id)a1, "isPrivateBrowsingEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 1008), "URL");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[Application sharedApplication](Application, "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "highlightManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "safari_isHTTPFamilyURL")
      || (objc_msgSend((id)a1, "isShowingErrorPage") & 1) != 0)
    {
      goto LABEL_6;
    }
    objc_msgSend(v3, "highlights");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {

    }
    else
    {
      v6 = objc_msgSend(v3, "isFetchingHighlights");

      if ((v6 & 1) == 0)
      {
LABEL_6:
        v4 = *(void **)(a1 + 320);
        *(_QWORD *)(a1 + 320) = 0;
LABEL_7:

        return;
      }
    }
    objc_msgSend(*(id *)(a1 + 1008), "backForwardList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_highlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TabDocument _displayAttributionBannerForHighlight:]((unsigned __int8 *)a1, v4);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 1008), "backForwardList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentItem");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 320);
      *(_QWORD *)(a1 + 320) = v10;

      objc_msgSend(v3, "updateHighlightForAttributionPresenter:", a1);
    }
    goto LABEL_7;
  }
}

- (NSURL)attributionPresenterURL
{
  return (NSURL *)-[_SFWebView URL](self->_webView, "URL");
}

- (void)displayAttributionBannerForHighlightIfNeeded:(id)a3
{
  id v4;
  void *v5;
  WKBackForwardListItem *v6;
  WKBackForwardListItem *backForwardListItemForCurrentHighlightBannerCheck;
  void *v8;
  void *v9;
  id v10;
  WKBackForwardListItem *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  if (!-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
  {
    -[_SFWebView backForwardList](self->_webView, "backForwardList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentItem");
    v6 = (WKBackForwardListItem *)objc_claimAutoreleasedReturnValue();
    backForwardListItemForCurrentHighlightBannerCheck = self->_backForwardListItemForCurrentHighlightBannerCheck;

    if (v6 == backForwardListItemForCurrentHighlightBannerCheck)
    {
      if (!v4 || (self->_appBanner || self->_appBannerPendingFirstPaint) && !self->_appBannerRemovalWasDeferred)
      {
        v11 = self->_backForwardListItemForCurrentHighlightBannerCheck;
        self->_backForwardListItemForCurrentHighlightBannerCheck = 0;

      }
      else
      {
        objc_initWeak(&location, self);
        objc_msgSend(v4, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D4ECA0], "sharedTracker");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __60__TabDocument_displayAttributionBannerForHighlightIfNeeded___block_invoke;
        v12[3] = &unk_1E9CF92D8;
        objc_copyWeak(&v15, &location);
        v10 = v8;
        v13 = v10;
        v14 = v4;
        objc_msgSend(v9, "isBannerBlockedForHighlight:completion:", v10, v12);

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
  }

}

void __60__TabDocument_displayAttributionBannerForHighlightIfNeeded___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[126], "backForwardList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v5[40];

    if (v7 == v8)
    {
      v9 = v5[40];
      v5[40] = 0;

      if (a2)
      {
        v10 = WBS_LOG_CHANNEL_PREFIXInterstellar();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v15 = 138543362;
          v16 = v11;
          _os_log_impl(&dword_1D7CA3000, v10, OS_LOG_TYPE_INFO, "Highlight <%{public}@> is in banner block list.", (uint8_t *)&v15, 0xCu);
        }
      }
      else
      {
        v12 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5[126], "backForwardList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "safari_setHighlight:", v12);

        -[TabDocument _displayAttributionBannerForHighlight:]((unsigned __int8 *)v5, *(void **)(a1 + 40));
      }
    }
  }

}

- (WKBackForwardListItem)currentBackForwardListItem
{
  void *v2;
  void *v3;

  -[_SFWebView backForwardList](self->_webView, "backForwardList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WKBackForwardListItem *)v3;
}

- (void)hideBannerForHighlightIdentifier:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id WeakRetained;
  SFPinnableBanner *appBanner;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFPinnableBanner highlight](self->_appBanner, "highlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v11, "isEqualToString:", v5);

    if ((v6 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "removeAppBannerFromTabDocument:animated:", self, 1);

      appBanner = self->_appBanner;
      self->_appBanner = 0;

      -[_SFWebView backForwardList](self->_webView, "backForwardList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_setHighlight:", 0);

    }
  }

}

- (void)_webView:(id)a3 mouseDidMoveOverElement:(id)a4 withFlags:(int64_t)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a6;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "rootViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "statusBarView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "safari_URLForKey:", *MEMORY[0x1E0CD58D0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CD58C0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CD58C8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0D4ECB8]);
      -[TabDocument URL](self, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithHoveredLinkURL:forCurrentURL:modifierFlags:frame:targetFrame:", v15, v19, a5, v16, v17);
      objc_msgSend(v14, "setStatusMessage:", v20);

    }
  }

}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  TabDocumentDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "tabDocument:dismissViewControllerAnimated:", self, v5);

  -[TabDocument URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (!-[TabDocument isClosed](self, "isClosed"))
  {
    -[TabDocument _closeTabDocumentAnimated:](self, "_closeTabDocumentAnimated:", 0);
  }
}

- (void)_webView:(id)a3 storeAppHighlight:(id)a4 inNewGroup:(BOOL)a5 requestOriginatedInApp:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a6;
  v7 = a5;
  v20 = a3;
  v10 = a4;
  +[Application sharedApplication](Application, "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemNoteTakingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CA5920]);
  v14 = (void *)objc_msgSend(v13, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
  -[NSUserActivity title](self->_userActivity, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v15);

  -[NSUserActivity webpageURL](self->_userActivity, "webpageURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWebpageURL:", v16);

  objc_msgSend(v10, "highlight");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "saveHighlightsData:selectedText:selectedImage:newGroup:originatedInApp:webView:userActivity:", v17, v18, v19, v7, v6, v20, v14);

}

- (void)sfWebViewDidBecomeFirstResponder:(id)a3
{
  -[_SFFormAutoFillController updateSuggestions](self->_autoFillController, "updateSuggestions", a3);
}

- (void)sfWebViewDidStartFormControlInteraction:(id)a3
{
  self->_hasFormControlInteraction = 1;
}

- (void)sfWebViewDidEndFormControlInteraction:(id)a3
{
  self->_hasFormControlInteraction = 0;
}

- (void)sfWebViewDidDismissFindOnPage:(id)a3
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  if (-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled", a3))
  {
    v4 = persistedFindInteractionSearchText;
    -[_SFWebView findInteraction](self->_webView, "findInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v6 = (const __CFString *)v4;
    else
      v6 = &stru_1E9CFDBB0;
    v10 = v5;
    objc_msgSend(v5, "setSearchText:", v6);

    objc_msgSend(MEMORY[0x1E0DC37B8], "_setGlobalFindBuffer:", persistedFindInteractionSearchText);
    if (persistedFindInteractionSearchText)
      v7 = (const __CFString *)persistedFindInteractionSearchText;
    else
      v7 = &stru_1E9CFDBB0;
    objc_msgSend(MEMORY[0x1E0CEF630], "_setStringForFind:", v7);
  }
  else
  {
    -[_SFWebView findInteraction](self->_webView, "findInteraction");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchText");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)persistedFindInteractionSearchText;
    persistedFindInteractionSearchText = v8;

  }
}

- (id)sfWebView:(id)a3 didStartDownload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CD56A0], "sharedDownloadDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadFromWKDownload:userInitiatedAction:", v5, self->_lastUserInitiatedAction);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v8);
  objc_msgSend(v8, "deferAddingDownloadWhenStarted:", v7);
  objc_storeStrong((id *)&self->_activeDownload, v7);

  return v7;
}

- (id)overrideUndoManagerForSFWebView:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (objc_msgSend(WeakRetained, "overridesUndoManagerForClosedTabs"))
  {
    objc_msgSend(WeakRetained, "tabController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)sfWebViewShouldFillStringForFind:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "tabDocumentShouldFillStringForFind:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)sfWebViewCanFindNextOrPrevious:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "tabDocumentCanFindNextOrPrevious:", self);
  else
    v5 = 1;

  return v5;
}

- (void)statusBarIndicatorTappedWithCompletionHandler:(id)a3
{
  id WeakRetained;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabDocumentShouldBecomeActive:", self);

  v5[2]();
}

- (BOOL)canOverrideStatusBar
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  BOOL v8;

  v2 = self;
  -[TabDocument browserController](self, "browserController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabCollectionViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabThumbnailCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v2, "isActive");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "applicationState") != 2)
    {
      v8 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  v7 = v5;
  v8 = objc_msgSend(v7, "presentationState") != 1 && objc_msgSend(v7, "presentationState") != 2;

  if (v6)
    goto LABEL_9;
LABEL_10:

  return v8;
}

- (BOOL)audioOnly
{
  return self->_cachedMediaStateIcon == 1;
}

- (void)muteMediaCapture
{
  -[TabDocument mediaStateIcon](self, "mediaStateIcon");
  if ((_SFMediaStateIconIsMuted() & 1) == 0)
    -[_SFWebView _setPageMuted:](self->_webView, "_setPageMuted:", 2);
}

- (void)toggleMediaStateMuted
{
  _SFWebView *webView;
  uint64_t v3;

  webView = self->_webView;
  -[TabDocument mediaStateIcon](self, "mediaStateIcon");
  if (_SFMediaStateIconIsMuted())
    v3 = 0;
  else
    v3 = 2;
  -[_SFWebView _setPageMuted:](webView, "_setPageMuted:", v3);
}

- (void)mediaStateDidChangeNeedsDelay:(uint64_t)a1
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 472);
    v2 = 1;
    v3 = 4;
    if ((v1 & 8) == 0)
      v3 = (v1 << 61 >> 63) & 3;
    if ((v1 & 1) == 0)
      v2 = v3;
    if ((v1 & 2) != 0)
      v4 = 2;
    else
      v4 = v2;
    -[TabDocument setMediaStateIcon:](a1, v4);
  }
}

- (void)addMediaSuspensionReason:(unint64_t)a3
{
  unint64_t mediaSuspensionReasons;
  void *v6;

  if (a3)
  {
    mediaSuspensionReasons = self->_mediaSuspensionReasons;
    if (!mediaSuspensionReasons)
    {
      -[TabDocument webView](self, "webView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_suspendAllMediaPlayback");

      -[TabDocument dismissSiriReaderMediaSessionImmediately:](self, "dismissSiriReaderMediaSessionImmediately:", 0);
      mediaSuspensionReasons = self->_mediaSuspensionReasons;
    }
    self->_mediaSuspensionReasons = mediaSuspensionReasons | a3;
  }
}

- (void)removeMediaSuspensionReason:(unint64_t)a3
{
  BOOL v3;
  id v4;

  if (a3)
  {
    v3 = (self->_mediaSuspensionReasons & ~a3) == 0;
    self->_mediaSuspensionReasons &= ~a3;
    if (v3)
    {
      -[TabDocument webView](self, "webView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_resumeAllMediaPlayback");

    }
  }
}

- (BOOL)_handleTwoFingerTapOnLinkWithContext:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[5];

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend(v3, "navigationAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", *MEMORY[0x1E0D4F5A8]);

    v10 = (id)objc_msgSend(WeakRetained, "loadURLInNewTab:inBackground:", v7, v9);
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 5, objc_msgSend(v12, "visibleTabCollectionViewType"));

    if ((_DWORD)v9)
    {
      objc_msgSend(v3, "webView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "navigationAction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "tabCollectionViewProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasTabBar");

      if ((v16 & 1) == 0)
      {
        objc_msgSend(v14, "_clickLocationInRootViewCoordinates");
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __52__TabDocument__handleTwoFingerTapOnLinkWithContext___block_invoke;
        v18[3] = &unk_1E9CF9300;
        v18[4] = a1;
        objc_msgSend(v13, "_requestActivatedElementAtPosition:completionBlock:", v18);
      }

    }
  }

  return a1 != 0;
}

uint64_t __52__TabDocument__handleTwoFingerTapOnLinkWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateElement:toBarItem:", a2, 8);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  int64_t concurrentNavigationActionPolicyDecisions;
  NSObject *v19;
  uint64_t v20;
  char v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  char v28;
  id location;
  uint8_t buf[4];
  TabDocument *v31;
  __int16 v32;
  int64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  objc_msgSend(v11, "targetFrame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (objc_msgSend(v11, "targetFrame"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isMainFrame"),
        v15,
        v14,
        !v16))
  {
    v21 = 0;
  }
  else
  {
    ++self->_concurrentNavigationActionPolicyDecisions;
    v17 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      concurrentNavigationActionPolicyDecisions = self->_concurrentNavigationActionPolicyDecisions;
      *(_DWORD *)buf = 134218240;
      v31 = self;
      v32 = 2048;
      v33 = concurrentNavigationActionPolicyDecisions;
      _os_log_impl(&dword_1D7CA3000, v17, OS_LOG_TYPE_INFO, "(%p) Concurrent navigation action policy decisions: %zd", buf, 0x16u);
    }
    if (self->_concurrentNavigationActionPolicyDecisions >= 21)
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[TabDocument webView:decidePolicyForNavigationAction:preferences:decisionHandler:].cold.1(&self->_concurrentNavigationActionPolicyDecisions, v19, v20);
      objc_msgSend(v10, "_killWebContentProcessAndResetState");
    }
    v21 = 1;
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__TabDocument_webView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke;
  v24[3] = &unk_1E9CF9328;
  objc_copyWeak(&v27, &location);
  v22 = v11;
  v25 = v22;
  v23 = v13;
  v26 = v23;
  v28 = v21;
  -[TabDocument _internalWebView:decidePolicyForNavigationAction:preferences:decisionHandler:]((uint64_t)self, v10, v22, v12, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __83__TabDocument_webView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  void *v7;
  void *v8;
  int v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  _BYTE *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[TabDocument _didDecideNavigationPolicy:forNavigationAction:]((uint64_t)WeakRetained, a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "targetFrame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(*(id *)(a1 + 32), "targetFrame"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isMainFrame"),
          v8,
          v7,
          !v9))
    {
      v10 = 0;
    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "safari_shouldDonateWithPolicy:", a2);
    }
    WeakRetained[848] = v10;
    if (*(_BYTE *)(a1 + 56))
    {
      --*((_QWORD *)WeakRetained + 30);
      v11 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *((_QWORD *)WeakRetained + 30);
        v13 = 134218240;
        v14 = WeakRetained;
        v15 = 2048;
        v16 = v12;
        _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_INFO, "(%p) Concurrent navigation action policy decisions: %zd", (uint8_t *)&v13, 0x16u);
      }
    }
  }

}

- (void)_internalWebView:(void *)a3 decidePolicyForNavigationAction:(void *)a4 preferences:(void *)a5 decisionHandler:
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  int v23;
  void *v24;
  id WeakRetained;
  char v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  int v52;
  void *v53;
  uint64_t v54;
  int v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  id v73;
  char v74;
  int v75;
  void *v76;
  void *v77;
  int v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void (**v83)(void *, _QWORD);
  void *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id v93;
  void (**v94)(void *, _QWORD);
  id v95;
  char v96;
  _QWORD v97[4];
  id v98;
  uint64_t v99;
  _QWORD v100[4];
  id v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  void (**v106)(void *, _QWORD);
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  id v111;
  id v112[2];
  char v113;
  _QWORD aBlock[4];
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id location[2];

  v88 = a2;
  v9 = a3;
  v85 = a4;
  v87 = a5;
  if (a1)
  {
    objc_msgSend(v9, "request");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "URL");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "navigationType");
    objc_initWeak(location, (id)a1);
    if ((*(_BYTE *)(a1 + 1168) & 8) != 0 || *(_BYTE *)(a1 + 688))
    {
      objc_msgSend(v9, "targetFrame");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isMainFrame");

      if (v12)
      {
        v13 = *(_QWORD *)(a1 + 528);
        if (v13)
          (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke;
        aBlock[3] = &unk_1E9CF9350;
        objc_copyWeak(&v119, location);
        v118 = v87;
        v115 = v88;
        v116 = v9;
        v117 = v85;
        v14 = _Block_copy(aBlock);
        v15 = *(void **)(a1 + 528);
        *(_QWORD *)(a1 + 528) = v14;

        objc_destroyWeak(&v119);
        goto LABEL_77;
      }
    }
    objc_msgSend(v9, "targetFrame");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v16;
    if (v16)
      v17 = objc_msgSend(v16, "isMainFrame");
    else
      v17 = 1;
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_2;
    v107[3] = &unk_1E9CF93A0;
    objc_copyWeak(v112, location);
    v79 = v87;
    v111 = v79;
    v18 = v9;
    v108 = v18;
    v19 = v86;
    v113 = v17;
    v109 = v19;
    v112[1] = v10;
    v80 = v88;
    v110 = v80;
    v83 = (void (**)(void *, _QWORD))_Block_copy(v107);
    objc_msgSend(v18, "_userInitiatedAction");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 392);
    *(_QWORD *)(a1 + 392) = v20;

    v22 = *(_BYTE *)(a1 + 675) || *(_BYTE *)(a1 + 899) || *(_QWORD *)(a1 + 1184) != 0;
    objc_msgSend(*(id *)(a1 + 48), "setNavigationSource:", !v22);
    if (objc_msgSend(v18, "_syntheticClickType") == 2)
    {
      v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD57C8]), "initWithWebView:navigationAction:", v80, v18);
      if (-[TabDocument _handleTwoFingerTapOnLinkWithContext:](a1, v82))
      {
LABEL_16:
        v83[2](v83, 0);
LABEL_76:

        objc_destroyWeak(v112);
LABEL_77:
        objc_destroyWeak(location);

        goto LABEL_78;
      }

    }
    if ((unint64_t)v10 < 2)
      v23 = v17;
    else
      v23 = 0;
    if (v23 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setNavigationType:", v10);
      objc_msgSend(v82, "navigationIntentWithURL:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "policy") == 6)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
        v26 = objc_msgSend(WeakRetained, "tabDocumentCanDownloadFile:", a1);

        if ((v26 & 1) != 0)
        {
          objc_msgSend(v18, "_clickLocationInRootViewCoordinates");
          v28 = v27;
          v30 = v29;
          v100[0] = MEMORY[0x1E0C809B0];
          v100[1] = 3221225472;
          v100[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_4;
          v100[3] = &unk_1E9CF93C8;
          v101 = v24;
          v102 = a1;
          v103 = v80;
          v104 = v84;
          v105 = v18;
          v106 = v83;
          objc_msgSend(v103, "_requestActivatedElementAtPosition:completionBlock:", v100, v28, v30);

        }
        else
        {
          v83[2](v83, 0);
        }
        goto LABEL_75;
      }
      if (objc_msgSend(v24, "policy"))
      {
        if (objc_msgSend(v24, "opensInNewTab"))
          v31 = objc_msgSend(v24, "shouldOrderToForeground") ^ 1;
        else
          v31 = 0;
        if (objc_msgSend(v24, "policy") == 5)
          v32 = 1;
        else
          v32 = v31;
        if (v32 == 1)
        {
          objc_msgSend(v18, "_clickLocationInRootViewCoordinates");
          v34 = v33;
          v36 = v35;
          v97[0] = MEMORY[0x1E0C809B0];
          v97[1] = 3221225472;
          v97[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_5;
          v97[3] = &unk_1E9CF93F0;
          v98 = v24;
          v99 = a1;
          objc_msgSend(v80, "_requestActivatedElementAtPosition:completionBlock:", v97, v34, v36);

        }
        else
        {
          objc_msgSend((id)a1, "dispatchNavigationIntent:", v24);
        }
        v83[2](v83, 0);
        goto LABEL_75;
      }

    }
    if ((_DWORD)v17
      && objc_msgSend(v18, "safari_isEligibleToSpawnNewTabFromPinnedTab")
      && objc_msgSend((id)a1, "shouldSpawnNewTabOnNavigationFromPinnedTabWithDestinationURL:", v19))
    {
      objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setNavigationType:", v10);
      objc_msgSend(v82, "setPrefersOpenInNewTabReusingExistingBlankTabIfPossible:", 1);
      objc_msgSend(v82, "navigationIntentWithURL:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "policy"))
      {
        objc_msgSend((id)a1, "dispatchNavigationIntent:", v24);
        v83[2](v83, 0);
LABEL_75:

        goto LABEL_76;
      }

    }
    if (objc_msgSend(v18, "_isUserInitiated"))
    {
      *(_QWORD *)(a1 + 1184) = 0;
      *(_BYTE *)(a1 + 921) = 0;
    }
    v82 = objc_loadWeakRetained((id *)(a1 + 936));
    if (objc_msgSend(*(id *)(a1 + 1248), "crashesSinceLastSuccessfulLoad"))
    {
      objc_msgSend(v18, "targetFrame");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v37, "isMainFrame") & 1) != 0)
      {
        objc_msgSend(v18, "targetFrame");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "request");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "URL");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
          objc_msgSend(v82, "setShowingCrashBanner:animated:", 0, 1);
      }
      else
      {

      }
    }
    if (!v84)
      goto LABEL_16;
    v41 = *(unsigned __int8 *)(a1 + 675);
    *(_BYTE *)(a1 + 873) = v41;
    if (v41)
    {
      if ((_DWORD)v17)
        goto LABEL_55;
    }
    else
    {
      *(_BYTE *)(a1 + 675) = v10 != (void *)-1;
      if ((_DWORD)v17)
      {
LABEL_55:
        if (((objc_msgSend(v19, "safari_isHTTPFamilyURL") & 1) != 0
           || objc_msgSend(v19, "safari_hasScheme:", CFSTR("ftp")))
          && objc_msgSend(v19, "safari_hasUserOrPassword"))
        {
          v83[2](v83, 0);
          objc_msgSend(v19, "safari_URLByDeletingUserAndPassword");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            v43 = (id)objc_msgSend((id)a1, "loadURL:userDriven:", v42, *(unsigned __int8 *)(a1 + 675));
          goto LABEL_73;
        }
LABEL_63:
        if (objc_msgSend(v19, "sf_isOfflineReadingListURL"))
        {
          objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "bookmarkWithID:", objc_msgSend((id)a1, "readingListBookmarkID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v24, "isFullArchiveAvailable") & 1) == 0)
          {
            v83[2](v83, 0);
            v48 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v24, "address");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "safari_URLWithDataAsString:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (id)objc_msgSend((id)a1, "loadURL:userDriven:", v50, *(unsigned __int8 *)(a1 + 675));

            goto LABEL_75;
          }

        }
        if (*(_QWORD *)(a1 + 1296) && v10 != (void *)-1)
          objc_msgSend((id)a1, "clearTabReuseURL");
        if (objc_msgSend(v18, "_sf_shouldAskAboutInsecureFormSubmission"))
        {
          v46 = *(void **)(a1 + 1248);
          _WBSLocalizedString();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addFormAlertWithTitle:decisionHandler:", v42, v83);
        }
        else
        {
          if (v10 != (void *)4)
          {
            v78 = objc_msgSend(v18, "_isUserInitiated");
            if (v10)
              v52 = 0;
            else
              v52 = v17;
            if (v52 == 1)
            {
              +[WBSParsecDSession sharedPARSession](UniversalSearchSession, "sharedPARSession");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)a1, "browserController");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "activeSearchEngine");
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              v54 = objc_msgSend(v82, "idOfParsecQueryOriginatingFromSearchSuggestion");
              if (v54)
                v55 = v78;
              else
                v55 = 0;
              if (v55 == 1)
              {
                objc_msgSend((id)a1, "committedURL");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v77, "urlIsValidSearch:", v56) & 1) != 0)
                {
                  v57 = objc_msgSend(v77, "urlIsValidSearch:", v19);

                  if ((v57 & 1) == 0)
                    objc_msgSend(v76, "sendCBAEngagementFeedback:query:", v19, v54);
                }
                else
                {

                }
              }
              objc_msgSend(v82, "clearParsecQueryOriginatingFromSearchSuggestion");
              objc_msgSend(v18, "targetFrame");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[TabDocument _readingListArchiveNextPageLinkForRequest:targetFrame:]((void *)a1, v84, v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v59)
              {
                v83[2](v83, 0);
                objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v59, 0);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "bookmarkWithID:", objc_msgSend((id)a1, "readingListBookmarkID"));
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                -[TabDocument _loadURL:fromBookmark:]((id *)a1, v60, v62);

                goto LABEL_76;
              }

            }
            if ((_DWORD)v17)
            {
              objc_msgSend(v18, "_originalURL");
              v63 = objc_claimAutoreleasedReturnValue();
              v64 = *(void **)(a1 + 552);
              *(_QWORD *)(a1 + 552) = v63;

              objc_msgSend(*(id *)(a1 + 552), "absoluteString");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v78)
              {
                -[WebBookmark safari_bestCurrentURL](*(id *)(a1 + 304));
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "absoluteString");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = objc_msgSend(v66, "isEqualToString:", v24);

                if ((v67 & 1) == 0)
                {
                  v68 = *(void **)(a1 + 304);
                  *(_QWORD *)(a1 + 304) = 0;

                }
                -[WebBookmark safari_bestCurrentURL](*(id *)(a1 + 1176));
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "absoluteString");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = objc_msgSend(v70, "isEqualToString:", v24);

                if ((v71 & 1) == 0)
                  objc_msgSend((id)a1, "setReadingListBookmark:", 0);
              }
              else if (v10 == (void *)2)
              {
                v72 = *(void **)(a1 + 304);
                *(_QWORD *)(a1 + 304) = 0;

              }
              if (-[TabDocument _isNewDocumentViewNecessaryForURL:]((void *)a1, v19))
              {
                (*((void (**)(id, _QWORD, _QWORD))v79 + 2))(v79, 0, 0);
                v73 = (id)objc_msgSend((id)a1, "loadRequest:userDriven:", v84, *(unsigned __int8 *)(a1 + 675));
                goto LABEL_75;
              }

            }
            if (!*(_BYTE *)(a1 + 594)
              && !*(_BYTE *)(a1 + 595)
              && ((v78 ^ 1) & 1) == 0
              && ((v17 ^ 1) & 1) == 0)
            {
              -[TabDocument _hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary](a1);
            }
            v74 = *(_BYTE *)(a1 + 675);
            if (v74)
              v75 = 1;
            else
              v75 = v78;
            v89[0] = MEMORY[0x1E0C809B0];
            v89[1] = 3221225472;
            v89[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_6;
            v89[3] = &unk_1E9CF9418;
            objc_copyWeak(&v95, location);
            v93 = v79;
            v96 = v74;
            v90 = v80;
            v91 = v18;
            v92 = v85;
            v94 = v83;
            -[TabDocument _determineResultOfLoadingRequest:inMainFrame:userInitiated:completionHandler:](a1, v84, v17, v75, v89);

            objc_destroyWeak(&v95);
            goto LABEL_76;
          }
          v47 = *(void **)(a1 + 1248);
          WBSLocalizedStringWithValue((NSString *)CFSTR("Are you sure you want to submit this form again?"), v45);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addFormAlertWithTitle:decisionHandler:", v42, v83);
        }
LABEL_73:

        goto LABEL_76;
      }
    }
    if (objc_msgSend(v19, "safari_isSafariSpecificURL"))
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_78:

}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke(uint64_t a1, int a2)
{
  const void **WeakRetained;
  void *v5;
  const void **v6;

  WeakRetained = (const void **)objc_loadWeakRetained((id *)(a1 + 64));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    _Block_copy(WeakRetained[66]);
    v5 = (void *)v6[66];
    v6[66] = 0;

    WeakRetained = v6;
  }
  if (a2 && !objc_msgSend(WeakRetained, "isLoading"))
    -[TabDocument _internalWebView:decidePolicyForNavigationAction:preferences:decisionHandler:](v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v4;
  id *WeakRetained;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21[2];
  char v22;

  v4 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (a2 && objc_msgSend(*(id *)(a1 + 32), "_sf_shouldPerformDownload"))
    {
      v6 = objc_loadWeakRetained(WeakRetained + 149);
      objc_msgSend(v6, "tabDocumentCanDownloadFile:", WeakRetained);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v7 = WeakRetained[80];
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(unsigned __int8 *)(a1 + 80);
      v10 = *(_QWORD *)(a1 + 72);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_3;
      v17 = &unk_1E9CF9378;
      objc_copyWeak(v21, v4);
      v20 = *(id *)(a1 + 56);
      v18 = *(id *)(a1 + 40);
      v22 = *(_BYTE *)(a1 + 80);
      v19 = *(id *)(a1 + 48);
      v21[1] = a2;
      objc_msgSend(v7, "websitePoliciesForURL:isForMainFrameNavigation:navigationType:completionHandler:", v8, v9, v10, &v14);
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CD57E8], "sharedController", v14, v15, v16, v17, v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sourceFrame");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_handle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "didCommitLoadForFrameWithIdentifier:", objc_msgSend(v13, "hash"));

      }
      else
      {
        objc_msgSend(WeakRetained[21], "cancelFluidProgressWithProgressStateSource:", WeakRetained, v14, v15, v16, v17, v18);
        -[TabDocument _didFinishLoading]((uint64_t)WeakRetained);
      }

      objc_destroyWeak(v21);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  char v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  void *v23;
  void **v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v46 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (uint64_t)WeakRetained;
  if (!WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_71;
  }
  if (WeakRetained[576])
    objc_msgSend(v46, "_setVisibilityAdjustmentSelectorsIncludingShadowHosts:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(MEMORY[0x1E0D8AB28], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_BYTE *)(v4 + 594))
    objc_msgSend(v5, "clearPrivateRelayFailClosedExceptionIfNecessaryForURL:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v6, "shouldPrivateRelayFailClosedExceptionApplyForURL:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v46, "_setAllowPrivacyProxy:", 0);
    -[TabDocument _disablePrivateRelaySetting:](v4, 1);
  }
  else if (objc_msgSend(v6, "wasExceptionClearedForCurrentBrowsingSession:", *(_QWORD *)(a1 + 32)))
  {
    v7 = *(void **)(v4 + 584);
    *(_QWORD *)(v4 + 584) = 0;

  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "safari_hasSameSiteAsURL:", *(_QWORD *)(v4 + 584));
  if (*(_BYTE *)(a1 + 72))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "safari_isSafariWebExtensionURL");
    v10 = v9;
    if (*(_BYTE *)(a1 + 72))
    {
      if (v9)
      {
        v11 = 0;
LABEL_17:
        objc_msgSend(v46, "_setAllowPrivacyProxy:", 0);
        v13 = 1;
        goto LABEL_30;
      }
      goto LABEL_20;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_mainFrameURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v12, "safari_isSafariWebExtensionURL");

  if ((v10 & 1) != 0)
    goto LABEL_17;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_setAllowPrivacyProxy:", objc_msgSend(v14, "isPrivacyProxySetToTrackersAndWebsites"));

    v13 = 0;
    v11 = 1;
    goto LABEL_30;
  }
LABEL_20:
  if ((!v8 || *(_BYTE *)(v4 + 594)) && *(_BYTE *)(a1 + 72) && (objc_msgSend((id)v4, "isShowingErrorPage") & 1) == 0)
  {
    v15 = *(void **)(v4 + 584);
    *(_QWORD *)(v4 + 584) = 0;

    v13 = 0;
    v11 = 0;
    *(_BYTE *)(v4 + 892) = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(v4 + 584)))
  {
    objc_msgSend(v46, "_setAllowPrivacyProxy:", *(_BYTE *)(v4 + 592) == 0);
    v13 = 0;
    v11 = 0;
    *(_BYTE *)(v4 + 593) = *(_BYTE *)(v4 + 592) ^ 1;
  }
  else
  {
    if (v8)
      objc_msgSend(v46, "_setAllowPrivacyProxy:", *(unsigned __int8 *)(v4 + 593));
    v13 = 0;
    v11 = 0;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "safari_enableAdvancedPrivacyProtections:", objc_msgSend((id)v4, "isPrivateBrowsingEnabled"));

  if (v13)
  {
    v18 = objc_msgSend((id)v4, "isPrivateBrowsingEnabled");
    v19 = 0;
LABEL_34:
    objc_msgSend(v46, "safari_setAdvancedPrivacyProtectionsEnabled:privateBrowsing:", v19, v18);
    goto LABEL_46;
  }
  if (v11)
  {
    v18 = objc_msgSend((id)v4, "isPrivateBrowsingEnabled");
    v19 = v17;
    goto LABEL_34;
  }
  v20 = objc_msgSend((id)v4, "isPrivateBrowsingEnabled");
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(v4 + 608)))
  {
    v21 = *(unsigned __int8 *)(v4 + 616);
    *(_BYTE *)(v4 + 617) = v21 ^ 1;
    v22 = v21 == 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "host");
    v42 = v20;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v6;
    objc_msgSend(v43, "safari_highLevelDomainFromHost");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void **)(v4 + 608);
    objc_msgSend(*(id *)(v4 + 608), "host");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safari_highLevelDomainFromHost");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v23, "isEqualToString:", v26);

    if (v27)
    {
      objc_storeStrong((id *)(v4 + 608), *(id *)(a1 + 32));
      v22 = *(_BYTE *)(v4 + 617) != 0;
      v6 = v45;
      v20 = v42;
    }
    else
    {
      v22 = *(unsigned __int8 *)(a1 + 72);
      v20 = v42;
      if (*(_BYTE *)(a1 + 72))
      {
        v28 = *v24;
        *v24 = 0;

        v22 = v17;
      }
      v6 = v45;
    }
  }
  if (*(unsigned __int8 *)(v4 + 618) == (_DWORD)v17)
    v29 = v22;
  else
    v29 = v17;
  *(_BYTE *)(v4 + 618) = v17;
  objc_msgSend(v46, "safari_setAdvancedPrivacyProtectionsEnabled:privateBrowsing:", v29, v20);
LABEL_46:
  objc_msgSend((id)v4, "browserController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activeSearchEngine");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v31, "urlIsValidSearch:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || !*(_BYTE *)(a1 + 72)
    && (objc_msgSend(*(id *)(v4 + 1008), "_mainFrameURL"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(v31, "urlIsValidSearch:", v32),
        v32,
        v33))
  {
    objc_msgSend(v46, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v46, "_networkConnectionIntegrityPolicy") | 0x20);
  }
  if ((v13 & 1) != 0)
  {
    v34 = 0;
  }
  else if (v11)
  {
    v34 = objc_msgSend(*(id *)(v4 + 640), "isContentBlockersPerSiteSettingEnabled");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(v4 + 568)))
  {
    v35 = *(unsigned __int8 *)(v4 + 576);
    *(_BYTE *)(v4 + 577) = v35 ^ 1;
    v34 = v35 == 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "host");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "safari_highLevelDomainFromHost");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v4 + 568), "host");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "safari_highLevelDomainFromHost");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v36, "isEqualToString:", v38);

    if (!v39)
    {
      if (*(_BYTE *)(a1 + 72))
      {
        v41 = *(void **)(v4 + 568);
        *(_QWORD *)(v4 + 568) = 0;

        *(_BYTE *)(v4 + 890) = objc_msgSend(*(id *)(v4 + 640), "isContentBlockersPerSiteSettingEnabled");
      }
      goto LABEL_59;
    }
    objc_storeStrong((id *)(v4 + 568), *(id *)(a1 + 32));
    v34 = *(_BYTE *)(v4 + 577) != 0;
  }
  objc_msgSend(v46, "_setContentBlockersEnabled:", v34);
LABEL_59:
  if ((objc_msgSend(v6, "shouldPrivateRelayFailClosedExceptionApplyForURL:", *(_QWORD *)(a1 + 32)) & 1) == 0
    && !*(_BYTE *)(v4 + 892)
    && *(_BYTE *)(a1 + 72)
    && ((v17 ^ 1) & 1) == 0)
  {
    objc_msgSend(v46, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v46, "_networkConnectionIntegrityPolicy") | 0x10);
  }
  if (v11)
    objc_msgSend(MEMORY[0x1E0D8A888], "determineContentRuleListStateForWebpagePreferences:wasLoadedWithContentBlockersEnabled:wasLoadedWithAdvancedPrivacyProtectionsEnabled:", v46, objc_msgSend(v46, "_contentBlockersEnabled"), objc_msgSend(v46, "safari_areAdvancedPrivacyProtectionsEnabled"));
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(v4 + 216), "setWebViewGeometryNeedsUpdate");
    *(_BYTE *)(v4 + 890) = objc_msgSend(v46, "_contentBlockersEnabled");
    *(_BYTE *)(v4 + 891) = objc_msgSend(v46, "_allowPrivacyProxy");
    v40 = objc_msgSend(v46, "safari_areAdvancedPrivacyProtectionsEnabled");
    *(_BYTE *)(v4 + 893) = v40;
    objc_msgSend(MEMORY[0x1E0D8A888], "determineContentRuleListStateForWebpagePreferences:wasLoadedWithContentBlockersEnabled:wasLoadedWithAdvancedPrivacyProtectionsEnabled:", v46, *(unsigned __int8 *)(v4 + 890), v40);
    if (objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        *(_BYTE *)(v4 + 635) = objc_msgSend(v46, "_captivePortalModeEnabled");
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_71:
}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSourceElementInfo:");
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sourceElementInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animateElementToDownloadsBarItemSoon:", v4);

  objc_msgSend(MEMORY[0x1E0CD56A0], "sharedDownloadDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "_userInitiatedAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForDownloadFromWebView:request:MIMEType:uti:userInitiatedAction:", v6, v7, 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v10);

  objc_msgSend(v9, "setExplicitlySaved:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSourceElementInfo:");
  objc_msgSend(*(id *)(a1 + 40), "dispatchNavigationIntent:", *(_QWORD *)(a1 + 32));

}

- (uint64_t)_isNewDocumentViewNecessaryForURL:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "webExtensionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalURLForWebExtensionURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_requiredWebExtensionBaseURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "safari_isSafariWebExtensionURL");
    v9 = objc_msgSend(v5, "safari_isSafariWebExtensionURL");
    if ((v8 & v9) == 1)
    {
      objc_msgSend(v7, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      v13 = v12 ^ 1u;
    }
    else
    {
      v13 = v8 | v9;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(v5, "setLoadWasUserDriven:", *(unsigned __int8 *)(a1 + 80));
    -[TabDocument _internalWebView:decidePolicyForNavigationAction:withResult:preferences:decisionHandler:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), v5, v4, *(void **)(a1 + 64));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)_internalWebView:(void *)a3 decidePolicyForNavigationAction:(void *)a4 withResult:(uint64_t)a5 preferences:(void *)a6 decisionHandler:
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  char v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id *v37;
  id *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void (**v44)(id, uint64_t);
  void *v45;
  uint64_t v46;
  void *v47;
  void (**v48)(id, uint64_t);
  void (**v49)(id, uint64_t);
  void *v50;
  id v51;
  id WeakRetained;
  _QWORD v53[4];
  id v54;
  id v55;
  void (**v56)(id, uint64_t);
  _QWORD v57[4];
  void *v58;
  id v59;
  _QWORD aBlock[5];
  id v61;
  id v62;
  id v63;
  void (**v64)(id, uint64_t);
  char v65;
  char v66;

  v51 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a1)
  {
    objc_msgSend(v10, "targetFrame");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = objc_msgSend(v13, "isMainFrame");
    else
      v15 = 1;
    v16 = objc_msgSend(v10, "_isUserInitiated");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1192));
    if (((v15 | v16) & 1) == 0 && objc_msgSend(v11, "isRedirectToAppleServices"))
    {
      v12[2](v12, 0);
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend(v10, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URL");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v11, "type"))
    {
      case 0:
        objc_msgSend(v11, "URL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "safari_hasFeedScheme");

        if (v19)
        {
          -[TabDocument _addNoFeedAppSupportAlert](a1);
        }
        else
        {
          objc_msgSend(v11, "URL");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "_webkit_isJavaScriptURL");

          if (v31)
          {
            objc_msgSend(*(id *)(a1 + 1248), "addDisallowedUseOfJavaScriptAlert");
          }
          else if (v15)
          {
            objc_msgSend(*(id *)(a1 + 1248), "addInvalidURLAlert");
          }
        }
        goto LABEL_29;
      case 1:
        if (!v15)
          goto LABEL_46;
        if (objc_msgSend(WeakRetained, "tabDocumentIsBackgroundPreloading:", a1)
          && (objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(MEMORY[0x1E0C99E98], "_web_willPerformSOKerberosAuthorizationWithURL:", v50))
        {
          if ((objc_msgSend(WeakRetained, "tabDocumentShouldHandleAuthentication:", a1) & 1) != 0)
            goto LABEL_31;
LABEL_29:
          v29 = 0;
          goto LABEL_30;
        }
        v32 = v16 ^ 1;
        if (!v14)
          v32 = 1;
        if ((v32 & 1) == 0)
          objc_msgSend(WeakRetained, "willStartLoadFromUserTap:", a1);
        if (!objc_msgSend(v10, "_shouldOpenAppLinks"))
        {
LABEL_46:
          v29 = 3;
LABEL_30:
          v12[2](v12, v29);
          goto LABEL_31;
        }
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke;
        aBlock[3] = &unk_1E9CF9468;
        aBlock[4] = a1;
        v49 = v12;
        v64 = v49;
        v61 = v10;
        v33 = v50;
        v62 = v33;
        v65 = v16;
        v63 = v17;
        v66 = v15;
        v34 = _Block_copy(aBlock);
        if (*(_QWORD *)(a1 + 1240))
        {
          if ((objc_msgSend(v33, "isEqual:") & 1) != 0
            || (v35 = *(void **)(a1 + 1160)) != 0
            && (objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) == 0)
          {
            v49[2](v49, 3);
LABEL_59:

            v44 = v64;
LABEL_69:

LABEL_31:
            goto LABEL_32;
          }
          v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", *(_QWORD *)(a1 + 1240));
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_4;
          v53[3] = &unk_1E9CF9490;
          v54 = v33;
          v55 = v34;
          v56 = v49;
          objc_msgSend(v36, "_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:", v53);
          v37 = &v54;
          v38 = &v55;

        }
        else
        {
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", v33);
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_3;
          v57[3] = &unk_1E9CF9148;
          v58 = v43;
          v59 = v34;
          v36 = v43;
          objc_msgSend(v36, "_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:", v57);
          v37 = &v59;
          v38 = &v58;
        }

        goto LABEL_59;
      case 2:
        v12[2](v12, 0);
        objc_msgSend(v11, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[TabDocument _loadURLInternal:userDriven:](a1, v20, 1);

        goto LABEL_31;
      case 3:
        v22 = *(_BYTE *)(a1 + 922);
        v12[2](v12, 0);
        if (!v15 || !objc_msgSend(v10, "_shouldOpenExternalSchemes"))
          goto LABEL_31;
        *(_BYTE *)(a1 + 923) = v22;
        objc_msgSend(v10, "sourceFrame");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v51;
        objc_msgSend(v23, "webView");
        v25 = objc_claimAutoreleasedReturnValue();

        v48 = (void (**)(id, uint64_t))v25;
        if (v25)
          v26 = v25 == (_QWORD)v51;
        else
          v26 = 1;
        v27 = !v26;
        objc_msgSend(v51, "URL");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        HIDWORD(v46) = v27;
        if (v47)
        {
          objc_msgSend(v51, "URL");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v46) = objc_msgSend(v50, "isEqual:", v28) ^ 1;

          v24 = v51;
        }
        else
        {
          LODWORD(v46) = 0;
        }

        objc_msgSend(v24, "_committedURL");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = v46;
        if (v39)
          v40 = 1;
        if ((HIDWORD(v46) & v40) == 1)
        {
          +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", v48);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "loadWindowDotOpenExternalNavigationResult:fromOriginalRequest:", v11, v17);

          objc_msgSend(WeakRetained, "tabDocumentDidCancelRedirectToExternalApplication:", a1);
        }
        else
        {
          if ((v16 & 1) != 0)
          {
            v42 = 2;
          }
          else if (*(_QWORD *)(a1 + 1240))
          {
            v42 = 2;
          }
          else
          {
            v42 = 3;
          }
          if (*(_BYTE *)(a1 + 711))
          {
            if (!*(_BYTE *)(a1 + 634))
              v42 = 0;
            *(_BYTE *)(a1 + 711) = 0;
          }
          objc_msgSend(v10, "_userInitiatedAction", v46);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabDocument _redirectToExternalNavigationResult:fromOriginalRequest:navigationAction:promptPolicy:isMainFrame:userAction:](a1, v11, v17, v10, v42, 1, v45);

        }
        *(_BYTE *)(a1 + 923) = 0;
        v44 = v48;
        goto LABEL_69;
      case 4:
        objc_msgSend(*(id *)(a1 + 1248), "addDisallowedFileURLAlert");
        goto LABEL_29;
      default:
        goto LABEL_29;
    }
  }
LABEL_33:

}

void __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  char v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 898) && (unint64_t)(a3 + 1) > 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_userInitiatedAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "isPrivateBrowsingEnabled") & 1) != 0)
      goto LABEL_14;
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v7 + 676))
    {
      if (!v6 || (objc_msgSend(v6, "isConsumed") & 1) != 0)
        goto LABEL_14;
      v7 = *(_QWORD *)(a1 + 32);
    }
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 936));
    if (!objc_msgSend(WeakRetained, "isSuspendedOrSuspending"))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 634))
      {
        v9 = objc_msgSend(*(id *)(a1 + 48), "hasTelephonyScheme");

        if ((v9 & 1) == 0)
          goto LABEL_14;
      }
      else
      {

      }
      objc_initWeak(&location, *(id *)(a1 + 32));
      if (v6 && (objc_msgSend(v6, "isConsumed") & 1) == 0)
        objc_msgSend(v6, "consume");
      else
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 676) = 1;
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 56);
      v20 = *MEMORY[0x1E0DAB538];
      v21[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_2;
      v16[3] = &unk_1E9CF9440;
      v17 = *(id *)(a1 + 64);
      objc_copyWeak(&v18, &location);
      -[TabDocument _openAppLinkInApp:fromOriginalRequest:updateAppLinkStrategy:webBrowserState:completionHandler:](v13, v5, v14, 0, v15, v16);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
      goto LABEL_20;
    }

LABEL_14:
    objc_msgSend(MEMORY[0x1E0CD5718], "resultWithAppLink:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLoadWasUserDriven:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 675));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v11 = *(_QWORD **)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
    {
      v12 = 2;
    }
    else if (v11[155])
    {
      v12 = 2;
    }
    else
    {
      v12 = 3;
    }
    -[TabDocument _queueAlertForRedirectToExternalNavigationResult:fromOriginalRequest:navigationAction:isMainFrame:promptPolicy:userAction:](v11, v10, *(void **)(a1 + 56), *(void **)(a1 + 40), *(_BYTE *)(a1 + 73), v12, v6);

LABEL_20:
    goto LABEL_4;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_4:

}

void __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
    v5 = 3;
  else
    v5 = 0;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  if (!a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      if (-[TabDocument _shouldCleanUpAfterRedirectToExternalApp]((uint64_t)WeakRetained))
      {
        if (objc_msgSend(v7, "canGoBack"))
          objc_msgSend(v7, "goBack");
        else
          objc_msgSend(v7, "_closeTabDocumentAnimated:", 0);
      }

    }
  }
}

uint64_t __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if ((unint64_t)(a2 - 1) >= 3)
  {
    if ((unint64_t)(a2 + 1) <= 1)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", *(_QWORD *)(a1 + 32));
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_5;
      v6[3] = &unk_1E9CF9148;
      v4 = *(id *)(a1 + 40);
      v7 = v3;
      v8 = v4;
      v5 = v3;
      objc_msgSend(v5, "_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:", v6);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)_didDecideNavigationPolicy:(void *)a3 forNavigationResponse:
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    if (a2 == 1)
    {
      v18 = v5;
      v7 = objc_msgSend(v5, "isForMainFrame");
      v6 = v18;
      if (v7)
      {
        objc_msgSend(v18, "_frame");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "webView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)a1[126];

        v6 = v18;
        if (v9 == v10)
        {
          objc_msgSend(v18, "_sf_explicitSuggestedFilename");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)a1[91];
          a1[91] = v11;

          v13 = objc_msgSend(a1, "isPrivate");
          v6 = v18;
          if ((v13 & 1) == 0)
          {
            objc_msgSend(v18, "response");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_9:

              v6 = v18;
              goto LABEL_10;
            }
            objc_msgSend(v18, "response");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "URL");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "safari_isHTTPFamilyURL");

            v6 = v18;
            if (v17)
            {
              objc_msgSend(v18, "response");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "donateCurrentNavigationWithNavigationResponse:", v14);
              goto LABEL_9;
            }
          }
        }
      }
    }
  }
LABEL_10:

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(void *, uint64_t);
  uint64_t v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  id v18;
  id WeakRetained;
  char v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char v35;
  BOOL v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id obja;
  id objb;
  id obj;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  TabDocument *v55;
  id v56;
  id v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  TabDocument *v61;
  void (**v62)(void *, uint64_t);
  id v63;
  uint64_t v64;
  _QWORD aBlock[5];
  id v66;
  id v67;

  v50 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke;
  aBlock[3] = &unk_1E9CF94B8;
  aBlock[4] = self;
  v11 = v8;
  v66 = v11;
  v12 = v9;
  v67 = v12;
  v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v63 = 0;
  v64 = 0;
  v14 = objc_msgSend(v11, "_sf_responsePolicy:uti:", &v64, &v63);
  v15 = v63;
  if (v14)
    v16 = !self->_wasLoadedWithLockdownModeEnabled;
  else
    v16 = 1;
  if (v16)
    v17 = v14;
  else
    v17 = 2;
  if (!v17)
  {
    v13[2](v13, 1);
    goto LABEL_30;
  }
  if (!self->_loadNextNavigationInline || !objc_msgSend(v11, "isForMainFrame"))
  {
    if (objc_msgSend(v11, "isForMainFrame"))
      self->_isDecidingNavigationResponsePolicyForMainFrameDownload = 1;
    objc_msgSend(v11, "response");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v10;
    v59[1] = 3221225472;
    v59[2] = __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke_2;
    v59[3] = &unk_1E9CF94B8;
    v18 = v11;
    v60 = v18;
    v61 = self;
    v62 = v13;
    v48 = _Block_copy(v59);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = objc_msgSend(WeakRetained, "tabDocumentCanDownloadFile:", self);

    if ((v20 & 1) == 0)
    {
      v22 = v48;
      (*((void (**)(void *, _QWORD))v48 + 2))(v48, 0);
LABEL_29:

      goto LABEL_30;
    }
    v21 = objc_msgSend(v18, "isForMainFrame");
    objc_msgSend(v49, "MIMEType");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v47, "isEqualToString:", CFSTR("application/rdf+xml")) & 1) != 0
      || (objc_msgSend(v47, "isEqualToString:", CFSTR("application/rss+xml")) & 1) != 0
      || (objc_msgSend(v47, "isEqualToString:", CFSTR("application/atom+xml")) & 1) != 0)
    {

    }
    else
    {
      v31 = objc_msgSend(v47, "isEqualToString:", CFSTR("application/syndication+xml"));

      if (!v31)
      {
        objc_msgSend(v49, "suggestedFilename");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "safari_filenameByFixingIllegalCharacters");
        obja = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obja, "safari_lastPathComponentWithoutZipExtension");
        v32 = objc_claimAutoreleasedReturnValue();

        v45 = (void *)v32;
        v33 = (void *)v32;
        v22 = v48;
        objc_msgSend(v33, "pathExtension");
        objb = (id)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(objb, "caseInsensitiveCompare:", CFSTR("swf"));

        v34 = objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("application/x-shockwave-flash"));
        if ((v21 & 1) != 0)
        {
          v35 = 0;
        }
        else
        {
          if (v39)
            v36 = v34 == 0;
          else
            v36 = 1;
          v35 = v36;
        }
        if (!v64
          || (v35 & 1) != 0
          || v64 == 3 && !objc_msgSend(getPKAddPassesViewControllerClass(), "canAddPasses"))
        {
          if (v21)
            -[_SFPageLoadErrorController addDownloadFailedAlertWithDescription:](self->_pageLoadErrorController, "addDownloadFailedAlertWithDescription:", 0);
          (*((void (**)(void *, _QWORD))v48 + 2))(v48, 0);
          goto LABEL_27;
        }
        v37 = (void *)MEMORY[0x1E0CD5688];
        objc_msgSend(v18, "_request");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_sf_suggestedFilename");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:", v47, v40, v49, v38, v15, self->_lastUserInitiatedAction);
        obj = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD56A0], "sharedDownloadDispatcher");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_activeDownload, obj);
        if (obj)
        {
          objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "setDelegate:", v41);
          objc_msgSend(v41, "deferAddingDownloadWhenStarted:", obj);
          if ((unint64_t)(v17 - 2) > 2)
          {
            objc_msgSend(v29, "setPendingDownload:forWebView:", obj, v50);
            (*((void (**)(void *, uint64_t))v48 + 2))(v48, 2);
          }
          else
          {
            objc_msgSend(obj, "setSuppressesPrompt:", 1);
            v51[0] = v10;
            v51[1] = 3221225472;
            v51[2] = __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke_3;
            v51[3] = &unk_1E9CF94E0;
            v52 = v29;
            v53 = obj;
            v54 = v50;
            v57 = v48;
            v58 = v17;
            v55 = self;
            v56 = v18;
            -[TabDocument _presentDialogToAllowDownload:allowViewAction:completionHandler:]((uint64_t)self, v53, v17 != 2, v51);

            v22 = v48;
          }

        }
        else
        {
          (*((void (**)(void *, _QWORD))v48 + 2))(v48, 0);
        }
        v24 = obj;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
    }
    if ((v21 & 1) == 0)
    {
      v22 = v48;
      (*((void (**)(void *, _QWORD))v48 + 2))(v48, 0);
LABEL_28:

      goto LABEL_29;
    }
    v22 = v48;
    objc_msgSend(v18, "_request");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "scheme");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "compare:options:", CFSTR("http"), 1);

    objc_msgSend(v24, "absoluteString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(CFSTR("feed:"), "stringByAppendingString:", v27);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v27, "substringFromIndex:", 5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("feed:"), "stringByAppendingString:", v28);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v45);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD))v48 + 2))(v48, 0);
    v30 = -[TabDocument _loadURLInternal:userDriven:]((uint64_t)self, v29, 1);
    goto LABEL_26;
  }
  v13[2](v13, 1);
  self->_loadNextNavigationInline = 0;
LABEL_30:

}

uint64_t __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  -[TabDocument _didDecideNavigationPolicy:forNavigationResponse:](*(_QWORD **)(a1 + 32), a2, *(void **)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isForMainFrame"))
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 689) = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      objc_msgSend(*(id *)(v4 + 168), "cancelFluidProgressWithProgressStateSource:", v4);
      -[TabDocument _didFinishLoading](v4);
    }
  }
}

void __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BYTE *v4;
  void *v5;
  void (*v6)(void);
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  switch(a2)
  {
    case 2:
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
      if (*(_QWORD *)(a1 + 80) != 4)
      {
        v6();
        return;
      }
      v6();
      *(_BYTE *)(*(_QWORD *)(a1 + 56) + 673) = 1;
      v7 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "_request");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v8 = -[TabDocument _loadRequest:userDriven:shouldOpenExternalURLs:](v7, v16, 1);
      goto LABEL_15;
    case 1:
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1008), "backForwardList");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(a1 + 56);
      if (!v9)
      {
        objc_msgSend(v10, "_closeTabDocumentAnimated:", 0);
        return;
      }
      objc_msgSend(v10, "committedURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_14;
      break;
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "setPendingDownload:forWebView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1008), "backForwardList");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(a1 + 56) + 672) = v3 == 0;

      v4 = *(_BYTE **)(a1 + 56);
      if (!v4[672])
      {
        objc_msgSend(v4, "committedURL");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5)
        {
LABEL_14:
          v12 = *(void **)(*(_QWORD *)(a1 + 56) + 1008);
          objc_msgSend(v12, "backForwardList");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "currentItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (id)objc_msgSend(v12, "goToBackForwardListItem:", v13);

LABEL_15:
        }
      }
      break;
  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6;
  id v7;
  NSUUID *v8;
  NSUUID *biomeWebpageIdentifier;
  NSError *lastLoadError;
  void *v11;
  NSError *lastLoadErrorForFormatMenu;
  SFPinnableBanner *appBannerPendingFirstPaint;
  SFQuickLookDocumentWriter *quickLookDocumentWriter;
  SFQuickLookDocument *quickLookDocument;
  id WeakRetained;
  void *v17;
  NSObject *v18;
  WBSTranslationContext *v19;
  WBSTranslationContext *translationContext;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  _QWORD block[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  biomeWebpageIdentifier = self->_biomeWebpageIdentifier;
  self->_biomeWebpageIdentifier = v8;

  lastLoadError = self->_lastLoadError;
  self->_lastLoadError = 0;

  objc_msgSend(v6, "_unreachableURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    lastLoadErrorForFormatMenu = self->_lastLoadErrorForFormatMenu;
    self->_lastLoadErrorForFormatMenu = 0;

  }
  self->_didCommitCurrentNavigation = 0;
  self->_didFirstPaint = 0;
  *(_DWORD *)&self->_didFinishDocumentLoad = 0;
  appBannerPendingFirstPaint = self->_appBannerPendingFirstPaint;
  self->_appBannerPendingFirstPaint = 0;

  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  self->_quickLookDocumentWriter = 0;

  quickLookDocument = self->_quickLookDocument;
  self->_quickLookDocument = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "saveTabDocumentUserActivitySoon:", self);

  -[WBSURLSpoofingMitigator didStartProvisionalNavigationWithUserInitiatedAction:](self->_URLSpoofingMitigator, "didStartProvisionalNavigationWithUserInitiatedAction:", self->_lastUserInitiatedAction);
  if (self->_pageLoadStatistics)
  {
    objc_msgSend(v7, "_request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("about:blank"));

    if ((v25 & 1) == 0)
      -[PageLoadTestStatistics startedNavigation:](self->_pageLoadStatistics, "startedNavigation:", v7);
  }
  -[_SFCalendarEventDetector cancelCheckForConfirmationPage](self->_calendarEventDetector, "cancelCheckForConfirmationPage");
  if (self->_needsSendTelemetryForProvisionalLoad)
  {
    self->_needsSendTelemetryForProvisionalLoad = 0;
    v18 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LaunchToFirstLoad", "beganLoad=YES enableTelemetry=YES ", buf, 2u);
    }
  }
  if (!self->_translationContext)
  {
    objc_msgSend(MEMORY[0x1E0D8AD58], "translationContextWithWebView:delegate:", self->_webView, self);
    v19 = (WBSTranslationContext *)objc_claimAutoreleasedReturnValue();
    translationContext = self->_translationContext;
    self->_translationContext = v19;

    -[WBSTranslationContext setFluidProgressController:](self->_translationContext, "setFluidProgressController:", self->_fluidProgressController);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__translationContextStateDidChange_, *MEMORY[0x1E0D8B6D0], self->_translationContext);

  }
  -[TabDocument updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
  -[_SFFormAutoFillController offerToSaveUnsubmittedFormDataIfNeeded](self->_autoFillController, "offerToSaveUnsubmittedFormDataIfNeeded");
  -[TabDocument _updateActiveExtensionsIfNecessary]((uint64_t)self);
  if (self->_loadWasUserDriven && (objc_msgSend(v7, "_isUserInitiated") & 1) != 0 || self->_lastUserInitiatedAction)
    -[WBSPermissionDialogThrottler willPerformUserInitiatedNavigation](self->_permissionDialogThrottler, "willPerformUserInitiatedNavigation");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__TabDocument_webView_didStartProvisionalNavigation___block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __53__TabDocument_webView_didStartProvisionalNavigation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setBrowsingAssistantDetectionResult:", 0);
}

id __49__TabDocument__updateActiveExtensionsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "webExtensionForExtension:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isTab:visibleToExtension:", *(_QWORD *)(a1 + 40), v3) & 1) != 0)
  {
    v4 = objc_msgSend(v3, "hasPermissionToAccessURL:inTab:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "baseURIHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 56));

    if (v6)
      v7 = 0;
    else
      v7 = v3;
    if (!v4)
      v7 = 0;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __49__TabDocument__updateActiveExtensionsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "toolbarItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconForTab:size:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D4F368], *(double *)(MEMORY[0x1E0D4F368] + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "badgeTextForTab:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    objc_msgSend(v4, "didViewBadgeInTab:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EEE0]), "initWithExtension:image:badged:", v3, v5, v7 != 0);

  return v8;
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *suggestedFilenameForNextCommit;
  id WeakRetained;
  void *v15;
  void *v16;
  PageLoadTestStatistics *pageLoadStatistics;
  id v18;

  v18 = a4;
  v7 = a5;
  -[WBSURLSpoofingMitigator didFailProvisionalNavigationWithError:](self->_URLSpoofingMitigator, "didFailProvisionalNavigationWithError:", v7);
  -[SFBrowserDocumentTrackerInfo queryParameterFilteringDataQueue](self->_trackerInfo, "queryParameterFilteringDataQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearPendingData");

  v9 = objc_msgSend(v7, "code");
  if (-[NSMutableArray count](self->_fallbackURLs, "count")
    && ((v10 = objc_msgSend(v7, "_web_errorIsInDomain:", *MEMORY[0x1E0CB32E8]),
         (v9 & 0xFFFFFFFFFFFFFFFELL) == 0xFFFFFFFFFFFFFC14)
      ? (v11 = v10)
      : (v11 = 0),
        v11 == 1))
  {
    objc_msgSend(v18, "_request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(v12, (const void *)kWebClipToNSURLRequestAssociationKey);
    suggestedFilenameForNextCommit = (void *)objc_claimAutoreleasedReturnValue();

    -[TabDocument _loadNextFallbackURLWithWebClip:navigation:]((uint64_t)self, suggestedFilenameForNextCommit, 0);
  }
  else
  {
    -[TabDocument _clearNavigationSource]((uint64_t)self);
    -[_SFWebView setObscuringContents:](self->_webView, "setObscuringContents:", 0);
    self->_contentIsReadyForSnapshot = 1;
    -[TabDocument updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
    objc_storeStrong((id *)&self->_lastLoadError, a5);
    objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, a5);
    -[TabDocument _didFinishLoading]((uint64_t)self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveTabDocumentUserActivitySoon:", self);

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reportTabUpdatedWithUpdateType:", 0);

    pageLoadStatistics = self->_pageLoadStatistics;
    if (pageLoadStatistics)
      -[PageLoadTestStatistics failedNavigation:withError:](pageLoadStatistics, "failedNavigation:withError:", v18, v7);
    self->_shouldResetPrintSuppressionOnNextCommit = 0;
    self->_loadNextNavigationInline = 0;
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;
  }

}

- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a5;
  v10 = a6;
  if ((objc_msgSend(v9, "blockedLoad") & 1) != 0 || objc_msgSend(v9, "blockedCookies"))
  {
    -[TabDocument _contentBlockerStatisticsStore](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordThirdPartyResourceBlocked:onFirstParty:completionHandler:", v10, v12, 0);

  }
}

- (void)_webView:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6
{
  id WeakRetained;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  LODWORD(self) = objc_msgSend(WeakRetained, "tabDocumentShouldHandleAuthentication:", self);

  v8[2](v8, self ^ 1);
}

- (void)_donateTextSoon
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (a1)
  {
    if (-[TabDocument _canDonateToCoreSpotlight](a1))
    {
      objc_initWeak(&location, a1);
      objc_msgSend(a1[52], "invalidate");
      v2 = (void *)MEMORY[0x1E0C99E88];
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __30__TabDocument__donateTextSoon__block_invoke;
      v5[3] = &unk_1E9CF8C10;
      objc_copyWeak(&v6, &location);
      objc_msgSend(v2, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 5.0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = a1[52];
      a1[52] = (id)v3;

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_canDonateToCoreSpotlight
{
  id *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend(result, "isShowingErrorPage") & 1) != 0)
      return 0;
    objc_msgSend(v1[126], "_safeBrowsingWarning");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      return 0;
    }
    else
    {
      result = (id *)objc_msgSend(v1[151], "allowsUserActivityFeedback");
      if ((_DWORD)result)
        return (id *)(objc_msgSend(v1, "isShowingSystemStartPage") ^ 1);
    }
  }
  return result;
}

void __30__TabDocument__donateTextSoon__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[TabDocument _donateTextAllowingDonationWithoutReaderText:](WeakRetained, 0);

}

- (void)_donateTextAllowingDonationWithoutReaderText:(id *)a1
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  if (a1 && a1[52])
  {
    if ((-[TabDocument _canDonateToCoreSpotlight](a1) & 1) != 0)
    {
      objc_msgSend(a1[36], "unfilteredArticleText");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if ((a2 & 1) != 0 || v4 || !objc_msgSend(a1[36], "isReaderAvailable"))
      {
        objc_msgSend(a1[52], "invalidate");
        v8 = a1[52];
        a1[52] = 0;

        if (objc_msgSend(a1, "isSecure"))
          v9 = objc_msgSend(a1[36], "doesPageUseSearchEngineOptimizationMetadata");
        else
          v9 = 1;
        objc_msgSend(a1, "personalizationData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(a1, "personalizationData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clearData");

        objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = a1[126];
        -[TabDocument profileIdentifier]((uint64_t)a1);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = v15;
        else
          v17 = *MEMORY[0x1E0D89E20];
        objc_msgSend(v13, "donateTextInWebView:extractedReaderText:canDonateFullPageText:profileIdentifier:personalizationData:extractInnerText:", v14, v5, v9, v17, v11, &__block_literal_global_432);

      }
      else
      {
        v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[TabDocument _donateTextAllowingDonationWithoutReaderText:].cold.1();
      }
    }
    else
    {
      v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[TabDocument _donateTextAllowingDonationWithoutReaderText:].cold.3(a2, v7);
      v5 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1[126], "URL");
        objc_claimAutoreleasedReturnValue();
        -[TabDocument _donateTextAllowingDonationWithoutReaderText:].cold.2();
      }
    }

  }
}

- (void)indexTabToCoreSpotlight
{
  id v3;

  if (-[TabDocument _canDonateToCoreSpotlight]((id *)&self->super.isa))
  {
    objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTabNeedsSpotlightDonation:", self);

  }
}

- (WBSSiriIntelligenceDonorTabData)tabDataForSpotlightDonation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((-[TabDocument _canDonateToCoreSpotlight]((id *)&self->super.isa) & 1) != 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D8AC80]);
    -[NSUUID UUIDString](self->_uuid, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUuidString:", v4);

    -[TabDocument url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUrl:", v5);

    -[TabDocument title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v6);

    -[TabDocument profileIdentifier]((uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProfileIdentifier:", v7);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_lastViewedTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLastVisitedDate:", v8);

    -[WBTab tabGroupUUID](self->_tabGroupTab, "tabGroupUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTabGroupUUID:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTabNeedsSpotlightDeletion:", self);
    v3 = 0;
  }

  return (WBSSiriIntelligenceDonorTabData *)v3;
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSMutableArray *fallbackURLs;
  _SFWebClipMetadataFetcher *webClipMetadataFetcher;
  WBSApplicationManifestFetcher *applicationManifestFetcher;
  TouchIconFetcher *touchIconFetcher;
  NSTimer *donateTextTimer;
  uint64_t v15;
  id v16;
  _BOOL8 v17;
  TabDocument *v18;
  int v19;
  uint64_t v20;
  SLHighlight *highlightFromNavigation;
  int v22;
  SFQuickLookDocument *quickLookDocument;
  NSString *suggestedFilenameForNextCommit;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  SFAppSuggestionBanner *storeBanner;
  void *v30;
  NSString *domainWhereUserDeclinedAutomaticStrongPassword;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  _QWORD block[4];
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v44 = a4;
  self->_didCommitCurrentNavigation = 1;
  -[TabDocument trackerInfo](self, "trackerInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentDidCommitNavigation");

  objc_msgSend(v46, "setOpaque:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v46, "URL", WeakRetained);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_disableContentBlockersWhenReloading)
  {
    -[TabDocument sfScribbleController](self, "sfScribbleController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateUserDefinedContentBlockerWithHost:", v9);

  }
  -[TabDocument setIsBlank:](self, "setIsBlank:", -[TabDocument isShowingStartPageOverriddenByExtension](self, "isShowingStartPageOverriddenByExtension"));
  -[TabDocument setNeedsNewTabSnapshot](self, "setNeedsNewTabSnapshot");
  fallbackURLs = self->_fallbackURLs;
  self->_fallbackURLs = 0;

  webClipMetadataFetcher = self->_webClipMetadataFetcher;
  self->_webClipMetadataFetcher = 0;

  applicationManifestFetcher = self->_applicationManifestFetcher;
  self->_applicationManifestFetcher = 0;

  -[TouchIconFetcher invalidate](self->_touchIconFetcher, "invalidate");
  touchIconFetcher = self->_touchIconFetcher;
  self->_touchIconFetcher = 0;

  -[_SFReloadOptionsController setEffectiveContentMode:](self->_reloadOptionsController, "setEffectiveContentMode:", objc_msgSend(v44, "effectiveContentMode"));
  -[NSTimer invalidate](self->_donateTextTimer, "invalidate");
  donateTextTimer = self->_donateTextTimer;
  self->_donateTextTimer = 0;

  -[TabDocument setSearchableItemAttributes:](self, "setSearchableItemAttributes:", 0);
  if (!self->_gestureRequiresGoBackToParentTab)
    -[TabDocument _removeParentChildTabDocumentRelations]((id *)&self->super.isa);
  v15 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TabDocument_webView_didCommitNavigation___block_invoke;
  block[3] = &unk_1E9CF31B0;
  v16 = WeakRetained;
  v54 = v16;
  if (-[TabDocument webView:didCommitNavigation:]::__once_crash_checkpoint != -1)
    dispatch_once(&-[TabDocument webView:didCommitNavigation:]::__once_crash_checkpoint, block);
  self->_externalAppRedirectState = 0;
  self->_hasFocusedInputFieldOnCurrentPage = 0;
  self->_hasFormControlInteraction = 0;
  if (self->_active)
  {
    -[TabDocument hideFindOnPage](self, "hideFindOnPage");
    if ((objc_msgSend(v16, "wantsUnifiedFieldFocused") & 1) == 0)
      objc_msgSend(v16, "setFavoritesState:animated:", 0, 1);
  }
  v17 = -[TabDocument shouldActivateReaderWhenAvailable](self, "shouldActivateReaderWhenAvailable");
  if (!v17)
  {
    if (!objc_msgSend(v16, "isShowingReader") || !self->_active)
      goto LABEL_20;
LABEL_19:
    objc_msgSend(v16, "hideReaderForTabDocument:animated:deactivationMode:", self, v17, 0);
    goto LABEL_20;
  }
  objc_msgSend(v16, "nextContinuousItemDocument");
  v18 = (TabDocument *)objc_claimAutoreleasedReturnValue();

  if (v18 == self)
    goto LABEL_20;
  if (objc_msgSend(v16, "readerShouldBeShownIfPossible"))
  {
    v19 = -[_SFWebView _webProcessIdentifier](self->_readerWebView, "_webProcessIdentifier");
    if (v19 == -[_SFWebView _webProcessIdentifier](self->_webView, "_webProcessIdentifier"))
    {
      objc_msgSend(v16, "setReaderViewStale:", objc_msgSend(v16, "isShowingReader"));
      goto LABEL_20;
    }
  }
  if ((objc_msgSend(v16, "isShowingReader") & 1) != 0)
    goto LABEL_19;
LABEL_20:
  -[_SFReaderController owningWebViewDidCommitNavigation](self->_readerContext, "owningWebViewDidCommitNavigation");
  if (-[TabDocument isShowingReader](self, "isShowingReader"))
    -[_SFReaderController clearAvailability](self->_readerContext, "clearAvailability");
  else
    -[TabDocument clearReaderContext](self, "clearReaderContext");
  self->_displayingStandaloneImage = -[_SFWebView _isDisplayingStandaloneImageDocument](self->_webView, "_isDisplayingStandaloneImageDocument");
  self->_displayingStandaloneMedia = -[_SFWebView _isDisplayingStandaloneMediaDocument](self->_webView, "_isDisplayingStandaloneMediaDocument");
  self->_hasDoneReaderAvailabilityDetection = 0;
  -[WBSTranslationContext owningWebViewDidCommitNavigationWithURL:completionHandler:](self->_translationContext, "owningWebViewDidCommitNavigationWithURL:completionHandler:", v47, 0);
  v20 = -[TabDocument readingListBookmarkID](self, "readingListBookmarkID");
  -[_SFWebView backForwardList](self->_webView, "backForwardList");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "currentItem");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v20 && !-[WKBackForwardListItem safari_bookmarkID](v45))
    -[WKBackForwardListItem safari_setBookmarkID:](v45, v20);
  if (self->_highlightFromNavigation)
  {
    objc_msgSend(v45, "safari_setHighlight:");
    highlightFromNavigation = self->_highlightFromNavigation;
    self->_highlightFromNavigation = 0;

  }
  self->_wasLoadedWithLockdownModeEnabled = self->_pendingNavigationWillLoadWithLockdownModeEnabled;
  v22 = -[TabDocument readingListBookmarkID](self, "readingListBookmarkID");
  if (self->_active && v22)
    objc_msgSend(v16, "markReadingListBookmark:asRead:postNotification:", self->_readingListBookmark, 1, 1);
  -[SFDialogController owningWebViewDidCommitNavigationWithURL:](self->_dialogController, "owningWebViewDidCommitNavigationWithURL:", v47);
  -[_SFPageLoadErrorController clearFailedRequest](self->_pageLoadErrorController, "clearFailedRequest");
  quickLookDocument = self->_quickLookDocument;
  self->_quickLookDocument = 0;

  self->_quickLookDocumentCheckCompleted = 0;
  if (self->_suggestedFilenameForNextCommit)
  {
    -[_SFWebView setSuggestedFilenameForCurrentBackForwardListItem:](self->_webView, "setSuggestedFilenameForCurrentBackForwardListItem:");
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;

  }
  -[TabDocument _updatePageZoomWithPreference]((id *)&self->super.isa);
  v25 = self->_displayingStandaloneImage || -[TabDocument isPDFDocument](self, "isPDFDocument");
  -[WBSFluidProgressController progressStateSourceDidCommitLoad:loadingSingleResource:](self->_fluidProgressController, "progressStateSourceDidCommitLoad:loadingSingleResource:", self, v25);
  if (self->_active)
  {
    -[SFNavigationBarItem setShowsReaderButton:](self->_navigationBarItem, "setShowsReaderButton:", -[TabDocument isReaderAvailable](self, "isReaderAvailable"));
    objc_msgSend(v16, "updateInterface");
  }
  if (-[TabDocument isPDFDocument](self, "isPDFDocument"))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "didLoadTabContent:", 0);
  }
  else if (-[TabDocument hasQuickLookContent](self, "hasQuickLookContent"))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "didLoadTabContent:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "didLoadTabContent:", 2);
  }

  if ((objc_msgSend(v16, "isReaderViewStale") & 1) == 0)
    objc_msgSend(v16, "document:willMakeReaderVisible:", self, 0);
  -[WBSURLSpoofingMitigator didCommitNavigation](self->_URLSpoofingMitigator, "didCommitNavigation");
  -[TabDocument _updateNavigationBarItem]((uint64_t)self);
  objc_msgSend(v16, "tabController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "saveTabDocumentUserActivitySoon:", self);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reportTabUpdatedWithUpdateType:", 0);

  storeBanner = self->_storeBanner;
  self->_storeBanner = 0;

  -[TabDocument _clearAppBannerIfNotCurrentStoreBannerDeferringRemoval:]((uint64_t)self, 0);
  v52[0] = v15;
  v52[1] = 3221225472;
  v52[2] = __43__TabDocument_webView_didCommitNavigation___block_invoke_2;
  v52[3] = &unk_1E9CF3578;
  v52[4] = self;
  -[TabDocument _checkForAppLinkWithCompletion:]((uint64_t)self, v52);
  -[TabDocument applyHighlightFromNotesIfNeeded](self, "applyHighlightFromNotesIfNeeded");
  -[TabDocument _clearNavigationSource]((uint64_t)self);
  -[_SFPrintController clearQueue](self->_printController, "clearQueue");
  if (self->_shouldResetPrintSuppressionOnNextCommit)
  {
    -[_SFPrintController resetPrintUISuppression](self->_printController, "resetPrintUISuppression");
    self->_shouldResetPrintSuppressionOnNextCommit = 0;
  }
  -[TabDocument _clearCachedCanonicalURL]((uint64_t)self);
  objc_msgSend(v47, "safari_userVisibleHostWithoutWWWSubdomain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "isEqualToString:", self->_domainWhereUserDeclinedAutomaticStrongPassword) & 1) == 0)
  {
    domainWhereUserDeclinedAutomaticStrongPassword = self->_domainWhereUserDeclinedAutomaticStrongPassword;
    self->_domainWhereUserDeclinedAutomaticStrongPassword = 0;

  }
  -[_SFFormAutoFillController removeAutomaticPasswordButtonInitiatedByUser:](self->_autoFillController, "removeAutomaticPasswordButtonInitiatedByUser:", 0);
  -[TabDocument _donateCurrentPageLoad]((uint64_t)self);
  -[TabDocument _notifyImpressionAnalyticsRecorderIfNeededTabDocumentDidBecomeActive:]((uint64_t)self, 0);
  -[TabDocument validateExtensionToolbarItems](self, "validateExtensionToolbarItems");
  if (!self->_isNavigatingViaNormalReload
    && !self->_isNavigatingViaReloadFromOrigin
    && -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
  {
    self->_canShowPrivateBrowsingPrivacyProtectionsBanner = 1;
  }
  objc_msgSend(v46, "URL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "safari_hasSameSiteAsURL:", self->_previousWebPageURLBeforeNavigation);

  if ((v33 & 1) == 0)
  {
    self->_didAlreadyShowPrivateBrowsingPrivacyProtectionsBannerForDomain = 0;
    self->_hasEnteredScribbleMode = 0;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = (void *)-[NSHashTable copy](self->_navigationObservers, "copy");
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v49 != v36)
          objc_enumerationMutation(v34);
        v38 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v38, "tabDocumentDidCommitNavigation:", self);
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v35);
  }

  objc_msgSend(v47, "safari_URLByReplacingSchemeWithString:", *MEMORY[0x1E0CD58F8]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activeSiriReaderSessionURL");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "isEqual:", v41))
  {
    v42 = objc_msgSend(v47, "safari_isEqualToURL:", self->_previousWebPageURLBeforeNavigation);

    if ((v42 & 1) == 0)
      goto LABEL_69;
  }
  else
  {

  }
  -[TabDocument dismissSiriReaderMediaSessionImmediately:](self, "dismissSiriReaderMediaSessionImmediately:", 0);
LABEL_69:
  -[TabDocument updateShowsSiriReaderPlayingIcon](self, "updateShowsSiriReaderPlayingIcon");
  -[WBSPageContextDataFetcher clearExtractedSchemaData](self->_pageContextDataFetcher, "clearExtractedSchemaData");
  -[WBSBrowsingAssistantController clearAssistantResult](self->_assistantController, "clearAssistantResult");

}

void __43__TabDocument_webView_didCommitNavigation___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tabController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "saveStateInBackground:needsValidate:", 1, 1);

}

void __43__TabDocument_webView_didCommitNavigation___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    -[TabDocument _checkForHighlight](*(_QWORD *)(a1 + 32));
}

- (void)_donateCurrentPageLoad
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  id v5;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 872))
    {
      v2 = objc_msgSend((id)a1, "isSearchPage");
      v3 = objc_msgSend(*(id *)(a1 + 88), "loadedUsingDesktopUserAgent");
      v4 = *(_QWORD *)(a1 + 744);
      objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "donatePageLoadWithUserAgent:wasSearch:wasPrivateBrowsing:wasActualized:provenance:", v3 ^ 1u, v2, objc_msgSend((id)a1, "isPrivateBrowsingEnabled"), objc_msgSend((id)a1, "nextLoadComesFromSearchPage"), v4);

    }
  }
}

- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6
{
  -[_SFPageLoadErrorController handleSubframeCertificateError:](self->_pageLoadErrorController, "handleSubframeCertificateError:", a6, a4, a5);
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  self->_didFinishDocumentLoad = 1;
  -[_SFFormAutoFillController prefillFormsSoonIfNeeded](self->_autoFillController, "prefillFormsSoonIfNeeded", a3, a4);
}

- (void)removeAutomaticPasswordButton
{
  -[_SFFormAutoFillController removeAutomaticPasswordButtonInitiatedByUser:](self->_autoFillController, "removeAutomaticPasswordButtonInitiatedByUser:", 1);
}

- (void)automaticPasswordSheetDismissed
{
  -[_SFFormAutoFillController automaticPasswordSheetDismissed](self->_autoFillController, "automaticPasswordSheetDismissed");
}

- (void)userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  -[TabDocument committedURL](self, "committedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabDocument uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isEqual:", v6);

  if (v7)
    objc_storeStrong((id *)&self->_domainWhereUserDeclinedAutomaticStrongPassword, v5);

}

- (NSString)currentStrongPassword
{
  return (NSString *)-[_SFFormAutoFillController currentStrongPassword](self->_autoFillController, "currentStrongPassword");
}

- (NSString)defaultStrongPassword
{
  return (NSString *)-[_SFFormAutoFillController defaultStrongPassword](self->_autoFillController, "defaultStrongPassword");
}

- (NSString)alphanumericStrongPassword
{
  return (NSString *)-[_SFFormAutoFillController alphanumericStrongPassword](self->_autoFillController, "alphanumericStrongPassword");
}

- (void)replaceCurrentPasswordWithPassword:(id)a3
{
  -[_SFFormAutoFillController replaceCurrentPasswordWithPassword:](self->_autoFillController, "replaceCurrentPasswordWithPassword:", a3);
}

- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3
{
  -[_SFFormAutoFillController makeStrongPasswordFieldViewableAndEditable:](self->_autoFillController, "makeStrongPasswordFieldViewableAndEditable:", a3);
}

- (void)copyCurrentStrongPassword
{
  -[_SFFormAutoFillController copyCurrentStrongPassword](self->_autoFillController, "copyCurrentStrongPassword");
}

- (void)_willCommitPreviewViewController:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    v11 = v3;
    objc_msgSend(v3, "willCommitPreviewedWebView");
    objc_msgSend(v11, "previewTabDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_setAddsVisitedLinks:", 1);
    objc_msgSend(v5, "_unreachableURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1[156], "webViewDidCommitErrorPagePreview:", v5);
    }
    else
    {
      objc_msgSend(v5, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(a1, "history");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "visitedLinkStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addVisitedLinkWithURL:", v10);

      }
    }

    v3 = v11;
  }

}

- (void)_didCommitPreviewViewController:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    objc_msgSend(v3, "previewTabDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_setAllowsMediaDocumentInlinePlayback:", 0);
    v3 = v6;
  }

}

- (id)tabDocumentForPreviewURL:(void *)a3 relatedToWebView:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (a1)
  {
    -[TabDocument _webViewConfiguration](a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setRelatedWebView:", v4);
    objc_msgSend(v4, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "websiteDataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWebsiteDataStore:", v7);

    v8 = objc_alloc((Class)objc_opt_class());
    WeakRetained = objc_loadWeakRetained(a1 + 117);
    v10 = (void *)objc_msgSend(v8, "_initWithBrowserController:configuration:", WeakRetained, v5);

    objc_msgSend(v10, "setNextLoadComesFromSearchPage:", objc_msgSend(a1, "isSearchPage"));
    objc_msgSend(v10, "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v11, "_setAddsVisitedLinks:", 0);
    objc_msgSend(v11, "_setAllowsMediaDocumentInlinePlayback:", 1);
    objc_msgSend(a1, "sessionState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restoreSessionState:andNavigate:", v12, 0);
    v13 = objc_loadWeakRetained(a1 + 149);
    objc_msgSend(v13, "tabDocument:didCreatePreviewDocument:", a1, v10);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_webView:(id)a3 gestureRecognizerCouldPinch:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  BOOL v11;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabCollectionViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabSwitcherViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pinchGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(WeakRetained, "tabViewPinchRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10 == v5;

  }
  return v11;
}

- (BOOL)_webView:(id)a3 gestureRecognizerCanBePreventedByTouchEvents:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)keyboardWillHide:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isPasswordManagerAppEnabledAndInstalled", a3))
    -[_SFFormAutoFillController makeStrongPasswordFieldViewableAndEditable:](self->_autoFillController, "makeStrongPasswordFieldViewableAndEditable:", 0);
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0CD5700], "contextMenuConfigurationForWebView:elementInfo:handler:", a3, a4, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v8);

}

- (id)_webView:(id)a3 contextMenuContentPreviewForElement:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CD5700], "contextMenuContentPreviewForWebView:elementInfo:handler:", a3, a4, self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a5;
  objc_msgSend(v7, "previewViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v7, "setPreferredCommitStyle:", objc_opt_isKindOfClass() & 1);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__TabDocument__webView_contextMenuForElement_willCommitWithAnimator___block_invoke;
  v10[3] = &unk_1E9CF31B0;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v7, "addAnimations:", v10);

}

void __69__TabDocument__webView_contextMenuForElement_willCommitWithAnimator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD5700], "linkPreviewHelperForWebView:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commitPreviewViewController");

}

- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentDidDimissPreviewedDocument:", self);

}

- (void)willDismissLinkPreviewViewController
{
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CD5700], "invalidateLinkPreviewHelperForWebView:", self->_webView);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentDidDimissPreviewedDocument:", self);

}

- (id)linkPreviewHelper:(id)a3 previewViewControllerForURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  LinkPreviewViewController *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument tabDocumentForPreviewURL:relatedToWebView:]((id *)&self->super.isa, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LinkPreviewViewController initWithTabDocument:]([LinkPreviewViewController alloc], "initWithTabDocument:", v10);
  -[TabDocument view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "geometryProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "obscuredScrollViewInsetsForTabDocumentView:unobscuredSafeAreaInsets:", v12, 0);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[LinkPreviewViewController browserView](v11, "browserView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObscuredInsets:", v15, v17, v19, v21);

  v23 = -[TabDocument supportsAdvancedPrivacyProtectionsForURL:](self, "supportsAdvancedPrivacyProtectionsForURL:", v7);
  objc_msgSend(v10, "reloadOptionsController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSupportsAdvancedPrivacyProtections:", v23);

  if (-[_SFReloadOptionsController loadedUsingDesktopUserAgent](self->_reloadOptionsController, "loadedUsingDesktopUserAgent"))
  {
    objc_msgSend(v10, "reloadOptionsController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "requestDesktopSiteWithURL:", v7);

  }
  else
  {
    v26 = (id)objc_msgSend(v10, "loadURL:userDriven:", v7, 1);
  }
  -[LinkPreviewViewController previewHeader](v11, "previewHeader");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveLinkPreviewHeader:", v27);

  return v11;
}

- (void)linkPreviewHelper:(id)a3 commitPreviewViewControllerForAction:(int64_t)a4 withTabOrder:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  _BOOL8 v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "previewContentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4 == 2)
  {
    -[TabDocument _commitPreviewedViewControllerInSafari:]((id *)&self->super.isa, v8);
  }
  else if (a4 == 3)
  {
    if (a5 != 1)
    {
      objc_msgSend(v8, "previewTabDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUpBackClosesSpawnedTabWithParent:", self);

    }
    -[TabDocument _willCommitPreviewViewController:]((id *)&self->super.isa, v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (a5 == 2)
    {
      v12 = 1;
    }
    else if (a5)
    {
      v12 = 0;
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0D4EF68], "defaultTabOrder") == 2;
    }
    objc_msgSend(WeakRetained, "tabDocumentCommitPreviewedDocumentAsNewTab:inBackground:", self, v12);

    if (objc_msgSend(MEMORY[0x1E0D4EF68], "defaultTabOrder") == 2)
    {
      v13 = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(v13, "tabCollectionViewProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasTabBar");

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v17, "elementInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabDocument animateElement:toBarItem:](self, "animateElement:toBarItem:", v16, 8);

      }
    }
  }

}

- (void)_commitPreviewedViewControllerInSafari:(id *)a1
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (a1)
  {
    -[TabDocument _willCommitPreviewViewController:](a1, v4);
    WeakRetained = objc_loadWeakRetained(a1 + 149);
    objc_msgSend(WeakRetained, "tabDocumentCommitPreviewedDocument:", a1);

    -[TabDocument _didCommitPreviewViewController:]((uint64_t)a1, v4);
  }

}

- (BOOL)linkPreviewHelper:(id)a3 supportsAction:(int64_t)a4 forURL:(id)a5
{
  id v6;
  char v7;
  void *v8;

  v6 = a5;
  if (a4)
  {
    v7 = 1;
  }
  else
  {
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isReadingListAvailable"))
      v7 = objc_msgSend(MEMORY[0x1E0DCCB50], "supportsURL:", v6);
    else
      v7 = 0;

  }
  return v7;
}

- (id)linkPreviewHelper:(id)a3 resultOfLoadingURL:(id)a4
{
  -[TabDocument resultOfLoadingURL:](self, "resultOfLoadingURL:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)linkPreviewHelper:(id)a3 redirectToExternalNavigationResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C92C80];
  v9 = v5;
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_nonAppInitiatedRequestWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _redirectToExternalNavigationResult:fromOriginalRequest:navigationAction:promptPolicy:isMainFrame:userAction:]((uint64_t)self, v9, v8, 0, 0, 1, 0);

}

- (void)linkPreviewHelper:(id)a3 didProduceNavigationIntent:(id)a4 forAction:(int64_t)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  -[TabDocument dispatchNavigationIntent:](self, "dispatchNavigationIntent:", v8);
  if (a5 == 3 && objc_msgSend(MEMORY[0x1E0D4EF68], "defaultTabOrder") == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabCollectionViewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasTabBar");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v13, "elementInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument animateElement:toBarItem:](self, "animateElement:toBarItem:", v12, 8);

    }
  }

}

- (void)linkPreviewHelperWillBeginDownload:(id)a3
{
  id v4;

  objc_msgSend(a3, "elementInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TabDocument animateElementToDownloadsBarItemSoon:](self, "animateElementToDownloadsBarItemSoon:");

}

- (void)linkPreviewHelper:(id)a3 addURLToReadingList:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  TabDocument *v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__TabDocument_linkPreviewHelper_addURLToReadingList___block_invoke;
  v11[3] = &unk_1E9CF3C30;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(WeakRetained, "showReadingListAutomaticArchiveAlertIfNeededWithCompletion:", v11);

}

void __53__TabDocument_linkPreviewHelper_addURLToReadingList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "elementInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_userVisibleString");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (-[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:](v8, v3, *(void **)(a1 + 40)))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didAddReadingListItemWithMethod:", 0);

    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "elementInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animateElement:toBarItem:", v7, 3);

  }
}

- (void)linkPreviewHelperWillOpenUniversalLinkLocally:(id)a3
{
  self->_shouldRevealAppLinkBannerForNextCommit = 1;
}

- (void)linkPreviewHelperWillDisableLinkPreview
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentWillDisableLinkPreview");

}

- (id)previewViewControllerForURL:(id)a3
{
  id v4;
  void *v5;
  _SFWebView *webView;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CD5700];
  webView = self->_webView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v5, "previewViewControllerWebView:windowBounds:url:handler:", webView, v4, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)commitPreviewViewController:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__TabDocument_commitPreviewViewController___block_invoke;
  v3[3] = &unk_1E9CF31B0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

void __43__TabDocument_commitPreviewViewController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD5700], "linkPreviewHelperForWebView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commitPreviewViewController");

}

- (_SFWebClipMetadataFetcher)webClipMetadataFetcher
{
  _SFWebClipMetadataFetcher *webClipMetadataFetcher;
  id v4;
  void *v5;
  _SFWebClipMetadataFetcher *v6;
  _SFWebClipMetadataFetcher *v7;

  webClipMetadataFetcher = self->_webClipMetadataFetcher;
  if (!webClipMetadataFetcher)
  {
    v4 = objc_alloc(MEMORY[0x1E0CD57F0]);
    -[TabDocument activityJSController](self, "activityJSController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_SFWebClipMetadataFetcher *)objc_msgSend(v4, "initWithInjectedJavascriptController:", v5);
    v7 = self->_webClipMetadataFetcher;
    self->_webClipMetadataFetcher = v6;

    webClipMetadataFetcher = self->_webClipMetadataFetcher;
  }
  return webClipMetadataFetcher;
}

- (_QWORD)touchIconFetcher
{
  _QWORD *v1;
  void *v2;
  TouchIconFetcher *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[15];
    if (!v2)
    {
      v3 = -[TouchIconFetcher initWithWebView:]([TouchIconFetcher alloc], "initWithWebView:", a1[126]);
      v4 = (void *)v1[15];
      v1[15] = v3;

      v2 = (void *)v1[15];
    }
    a1 = v2;
  }
  return a1;
}

- (void)getApplicationManifestWithCompletionHandler:(id)a3
{
  id v4;
  WBSApplicationManifestFetcher *applicationManifestFetcher;
  WBSApplicationManifestFetcher *v6;
  WBSApplicationManifestFetcher *v7;
  id v8;

  v4 = a3;
  applicationManifestFetcher = self->_applicationManifestFetcher;
  v8 = v4;
  if (!applicationManifestFetcher)
  {
    v6 = (WBSApplicationManifestFetcher *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A770]), "initWithWebView:", self->_webView);
    v7 = self->_applicationManifestFetcher;
    self->_applicationManifestFetcher = v6;

    applicationManifestFetcher = self->_applicationManifestFetcher;
    v4 = v8;
  }
  -[WBSApplicationManifestFetcher getApplicationManifestWithCompletionHandler:](applicationManifestFetcher, "getApplicationManifestWithCompletionHandler:", v4);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id WeakRetained;
  NSURL *v8;
  NSURL *urlForDisplayedContent;
  void *v10;
  void *v11;
  uint64_t v12;
  PageLoadTestStatistics *pageLoadStatistics;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  WebBookmark *bookmarkForIconFetching;
  void *v30;
  WBSPageContextDataFetcher *v31;
  WBSPageContextDataFetcher *pageContextDataFetcher;
  WBSPageContextDataFetcher *v33;
  void *v34;
  _SFReloadOptionsController *reloadOptionsController;
  void *v36;
  SFQuickLookDocument *quickLookDocument;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSDate *v44;
  NSDate *dateOfLastFinishedNavigation;
  NSURL *v46;
  NSURL *previousWebPageURLBeforeNavigation;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id location[2];

  v56 = a3;
  v6 = a4;
  objc_initWeak(location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  *(_WORD *)&self->_isNavigatingViaNormalReload = 0;
  v53 = v6;
  v55 = WeakRetained;
  -[_SFWebView setObscuringContents:](self->_webView, "setObscuringContents:", 0);
  self->_contentIsReadyForSnapshot = 1;
  -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL");
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  urlForDisplayedContent = self->_urlForDisplayedContent;
  self->_urlForDisplayedContent = v8;

  -[_SFPageLoadErrorController scheduleResetCrashCount](self->_pageLoadErrorController, "scheduleResetCrashCount");
  -[TabDocument _didFinishLoading]((uint64_t)self);
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 0;
  -[WBSFluidProgressController finishFluidProgressWithProgressStateSource:](self->_fluidProgressController, "finishFluidProgressWithProgressStateSource:", self);
  objc_msgSend(WeakRetained, "tabController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveTabDocumentUserActivitySoon:", self);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportTabUpdatedWithUpdateType:", 0);

  v12 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __43__TabDocument_webView_didFinishNavigation___block_invoke;
  v63[3] = &unk_1E9CF39C8;
  objc_copyWeak(&v64, location);
  objc_msgSend(v56, "_doAfterNextPresentationUpdate:", v63);
  -[TabDocument updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
  kdebug_trace();
  pageLoadStatistics = self->_pageLoadStatistics;
  if (pageLoadStatistics)
    -[PageLoadTestStatistics finishedNavigation:](pageLoadStatistics, "finishedNavigation:", v6);
  objc_msgSend(v6, "_request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v14, (const void *)kWebClipToNSURLRequestAssociationKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabDocument urlForSharing](self, "urlForSharing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v16;
  if (v15)
  {
    if (!objc_msgSend(v15, "configurationIsManaged")
      || (objc_msgSend(v15, "iconImagePath"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, !v17))
    {
      -[TabDocument _updateSnapshotForWebClip:](self, v15);
      -[TabDocument webClipMetadataFetcher](self, "webClipMetadataFetcher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v12;
      v60[1] = 3221225472;
      v60[2] = __43__TabDocument_webView_didFinishNavigation___block_invoke_2;
      v60[3] = &unk_1E9CF9598;
      v61 = v15;
      v62 = v16;
      objc_msgSend(v18, "fetchMetadataWithConsumer:", v60);

    }
  }
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "touchIconCache");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[WebBookmark address](self->_bookmarkForIconFetching, "address");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
      goto LABEL_15;
    objc_msgSend(v21, "host");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safari_domainFromHost");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebView _committedURL](self->_webView, "_committedURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "host");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safari_domainFromHost");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", v27))
    {
      v28 = objc_msgSend(v54, "shouldRequestTouchIconForWebPageNavigationFromBookmarkInteractionForURL:", v22);

      if (!v28)
        goto LABEL_15;
      bookmarkForIconFetching = self->_bookmarkForIconFetching;
      self->_bookmarkForIconFetching = 0;

      -[TabDocument touchIconFetcher](self);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __43__TabDocument_webView_didFinishNavigation___block_invoke_3;
      v57[3] = &unk_1E9CF3760;
      v58 = v54;
      v59 = v22;
      objc_msgSend(v30, "fetchTouchIconURLsWithCompletion:", v57);

      v23 = v58;
    }
    else
    {

    }
  }
  else
  {
    v22 = 0;
  }
LABEL_15:
  if (-[_SFBrowserConfiguration allowsUserActivityFeedback](self->_configuration, "allowsUserActivityFeedback"))
  {
    v31 = (WBSPageContextDataFetcher *)objc_alloc_init(MEMORY[0x1E0D8AA58]);
    pageContextDataFetcher = self->_pageContextDataFetcher;
    self->_pageContextDataFetcher = v31;

    -[WBSPageContextDataFetcher setDelegate:](self->_pageContextDataFetcher, "setDelegate:", self);
    v33 = self->_pageContextDataFetcher;
    -[TabDocument webView](self, "webView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSPageContextDataFetcher fetchSchemaDataForWebView:](v33, "fetchSchemaDataForWebView:", v34);

  }
  if (!-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
  {
    reloadOptionsController = self->_reloadOptionsController;
    objc_msgSend(v56, "URL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReloadOptionsController logCompletedPageloadToDifferentialPrivacy:](reloadOptionsController, "logCompletedPageloadToDifferentialPrivacy:", v36);

  }
  if (-[TabDocument isPDFDocument](self, "isPDFDocument"))
  {
    quickLookDocument = self->_quickLookDocument;
    -[TabDocument suggestedFilenameForDisplayedPDF](self, "suggestedFilenameForDisplayedPDF");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocument setFileNameForPDFDocument:](quickLookDocument, "setFileNameForPDFDocument:", v38);

  }
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "sidebarUIProxy");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "didRequestPageShowingSideBar:", objc_msgSend(v40, "isShowingSidebar"));

  -[TabDocument _donateTextSoon]((id *)&self->super.isa);
  objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "URL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "host");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "clearCertificateBypassesForHostIfNecessary:withTrust:", v43, objc_msgSend(v56, "serverTrust"));

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v44 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateOfLastFinishedNavigation = self->_dateOfLastFinishedNavigation;
  self->_dateOfLastFinishedNavigation = v44;

  -[TabDocument URL](self, "URL");
  v46 = (NSURL *)objc_claimAutoreleasedReturnValue();
  previousWebPageURLBeforeNavigation = self->_previousWebPageURLBeforeNavigation;
  self->_previousWebPageURLBeforeNavigation = v46;

  if (!self->_shouldKeepIgnoredSiriSuggestedSitesOnLoad
    && !-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D8A9B8], "sharedController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument URL](self, "URL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "host");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument profileIdentifier]((uint64_t)self);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "removeIgnoredSiriSuggestedSitesWithURLHost:inProfile:", v50, v51);

  }
  self->_shouldKeepIgnoredSiriSuggestedSitesOnLoad = 0;

  objc_destroyWeak(&v64);
  objc_destroyWeak(location);

}

void __43__TabDocument_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setNeedsNewTabSnapshot");
    -[TabDocument _updateSnapshotIfNeeded]((uint64_t)WeakRetained);
  }

}

uint64_t __43__TabDocument_webView_didFinishNavigation___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCustomMediaLocationsWithWebClipLinkTags:baseURL:", a3, *(_QWORD *)(a1 + 40));
}

uint64_t __43__TabDocument_webView_didFinishNavigation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacheFirstAvailableTouchIcon:forURL:", a2, *(_QWORD *)(a1 + 40));
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v7;
  NSURL *v8;
  NSURL *urlForDisplayedContent;
  void *v10;
  char v11;
  id WeakRetained;
  void *v13;
  void *v14;
  PageLoadTestStatistics *pageLoadStatistics;
  NSString *suggestedFilenameForNextCommit;
  id v17;

  v17 = a4;
  v7 = a5;
  -[_SFWebView setObscuringContents:](self->_webView, "setObscuringContents:", 0);
  self->_contentIsReadyForSnapshot = 1;
  -[TabDocument updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
  -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL");
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  urlForDisplayedContent = self->_urlForDisplayedContent;
  self->_urlForDisplayedContent = v8;

  if (objc_msgSend(v7, "code") != 204
    || (objc_msgSend(v7, "domain"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CEF800]),
        v10,
        (v11 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_lastLoadError, a5);
    objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, a5);
    -[TabDocument _didFinishLoading]((uint64_t)self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveTabDocumentUserActivitySoon:", self);

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reportTabUpdatedWithUpdateType:", 0);

    pageLoadStatistics = self->_pageLoadStatistics;
    if (pageLoadStatistics)
      -[PageLoadTestStatistics failedNavigation:withError:](pageLoadStatistics, "failedNavigation:withError:", v17, v7);
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;

  }
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id WeakRetained;
  char v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  SFDialogController *dialogController;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  void (**v38)(id, _QWORD, void *);

  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v7, "protectionSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authenticationMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C92B70]);

  if (v11)
  {
    if (-[TabDocument isControlledByAutomation](self, "isControlledByAutomation"))
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "automationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "automationSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "acceptInsecureCertificates");

      if (v16)
        goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protectionSpace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:inPrivateBrowsing:", v23, -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));

    if (v24)
    {
LABEL_10:
      v25 = (void *)MEMORY[0x1E0C92C60];
      objc_msgSend(v7, "protectionSpace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "credentialForTrust:", objc_msgSend(v19, "serverTrust"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v26);

LABEL_16:
      goto LABEL_17;
    }
    objc_msgSend(v7, "protectionSpace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageLoadErrorController setProtectionSpaceForInvalidCertificateBypass:](self->_pageLoadErrorController, "setProtectionSpaceForInvalidCertificateBypass:", v28);

    v27 = 3;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = objc_msgSend(WeakRetained, "tabDocumentShouldHandleAuthentication:", self);

    if ((v18 & 1) != 0)
    {
      objc_msgSend(v7, "protectionSpace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "_sf_canAuthenticate") & 1) != 0)
      {
        objc_msgSend(v19, "authenticationMethod");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0C92B30]);

        if (v21)
        {
          -[_SFPageLoadErrorController handleClientCertificateAuthenticationChallenge:completionHandler:](self->_pageLoadErrorController, "handleClientCertificateAuthenticationChallenge:completionHandler:", v7, v8);
        }
        else
        {
          dialogController = self->_dialogController;
          v30 = (void *)MEMORY[0x1E0D4EC60];
          -[_SFWebView _committedURL](self->_webView, "_committedURL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = MEMORY[0x1E0C809B0];
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke;
          v37[3] = &unk_1E9CF95C0;
          v38 = v8;
          objc_msgSend(v30, "authenticationDialogWithAuthenticationChallenge:committedURL:completionHandler:", v7, v31, v37);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = v32;
          v35[1] = 3221225472;
          v35[2] = __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2;
          v35[3] = &unk_1E9CF3358;
          v35[4] = self;
          v36 = v7;
          v34[0] = v32;
          v34[1] = 3221225472;
          v34[2] = __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_3;
          v34[3] = &unk_1E9CF31B0;
          v34[4] = self;
          -[SFDialogController presentDialog:animateAlongsidePresentation:dismissal:](dialogController, "presentDialog:animateAlongsidePresentation:dismissal:", v33, v35, v34);

        }
      }
      else
      {
        v8[2](v8, 3, 0);
      }
      goto LABEL_16;
    }
    v27 = 2;
  }
  v8[2](v8, v27, 0);
LABEL_17:

}

uint64_t __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 40), "failureResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 184);
  *(_QWORD *)(v4 + 184) = v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isShowingReader"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
    objc_msgSend(WeakRetained, "hideReaderForTabDocument:animated:deactivationMode:", *(_QWORD *)(a1 + 32), 0, 0);

  }
  -[TabDocument _updateNavigationBarItem](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "updateTabTitle");
}

uint64_t __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 184);
  *(_QWORD *)(v2 + 184) = 0;

  -[TabDocument _updateNavigationBarItem](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "updateTabTitle");
}

- (void)_webView:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  _SFPageLoadErrorController *pageLoadErrorController;
  void *v22;
  void *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  +[Application sharedApplication](Application, "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "legacyTLSHostManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isLegacyTLSAllowedForHost:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v8, "protectionSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_unreachableURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if ((v20 & 1) == 0)
    {
      pageLoadErrorController = self->_pageLoadErrorController;
      objc_msgSend(v8, "protectionSpace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safari_URL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "tabController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activeTabDocument");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPageLoadErrorController handleLegacyTLSWithFailingURL:clickThroughURL:authenticationChallenge:](pageLoadErrorController, "handleLegacyTLSWithFailingURL:clickThroughURL:authenticationChallenge:", v23, v27, v8);

    }
  }
  v9[2](v9, v14);

}

- (void)_webView:(id)a3 didNegotiateModernTLSForURL:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacyTLSHostManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearLegacyTLSForHostIfPresent:", v6);

}

- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5
{
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  WBSSameDocumentNavigationToHistoryVisitCorrelator *sameDocumentNavigationToHistoryVisitCorrelator;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];

  v28 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (a5)
    -[_SFFormAutoFillController offerToSaveUnsubmittedFormDataIfNeeded](self->_autoFillController, "offerToSaveUnsubmittedFormDataIfNeeded");
  if ((-[_SFWebView isLoading](self->_webView, "isLoading") & 1) == 0)
  {
    -[WBSFluidProgressController cancelFluidProgressWithProgressStateSource:](self->_fluidProgressController, "cancelFluidProgressWithProgressStateSource:", self);
    -[TabDocument _didFinishLoading]((uint64_t)self);
  }
  -[TabDocument browserController](self, "browserController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeSearchEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabDocument committedURL](self, "committedURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "urlIsValidSearch:", v27);
  if (a5 == 1)
  {
    v11 = v10;
    +[WBSParsecDSession sharedPARSession](UniversalSearchSession, "sharedPARSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(WeakRetained, "idOfParsecQueryOriginatingFromSearchSuggestion");
    if (v13)
    {
      -[_SFWebView backForwardList](self->_webView, "backForwardList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v9;
      objc_msgSend(v14, "backItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v9, "urlIsValidSearch:", v16);

      v18 = v17 ^ 1 | v11;
      v9 = v26;
      if ((v18 & 1) == 0)
        objc_msgSend(v12, "sendCBAEngagementFeedback:query:", v27, v13);
    }
    objc_msgSend(WeakRetained, "clearParsecQueryOriginatingFromSearchSuggestion");

  }
  sameDocumentNavigationToHistoryVisitCorrelator = self->_sameDocumentNavigationToHistoryVisitCorrelator;
  objc_msgSend(v28, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSameDocumentNavigationToHistoryVisitCorrelator visitForSameDocumentNavigationToURL:](sameDocumentNavigationToHistoryVisitCorrelator, "visitForSameDocumentNavigationToURL:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    +[History sharedHistory](History, "sharedHistory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttributes:toVisit:", 1, v21);

  }
  if (objc_msgSend(WeakRetained, "isShowingReader")
    && a5
    && self->_active
    && self->_shouldDismissReaderInReponseToSameDocumentNavigation)
  {
    objc_msgSend(WeakRetained, "hideReaderForTabDocument:animated:deactivationMode:", self, 0, 0);
    -[TabDocument clearReaderContext](self, "clearReaderContext");
  }
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 0;
  -[TabDocument _clearAppBannerIfNotCurrentStoreBannerDeferringRemoval:]((uint64_t)self, 1);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __61__TabDocument__webView_navigation_didSameDocumentNavigation___block_invoke;
  v29[3] = &unk_1E9CF3578;
  v29[4] = self;
  -[TabDocument _checkForAppLinkWithCompletion:]((uint64_t)self, v29);
  -[TabDocument applyHighlightFromNotesIfNeeded](self, "applyHighlightFromNotesIfNeeded");
  -[TabDocument _clearCachedCanonicalURL]((uint64_t)self);
  -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 2)
  {
    if ((-[NSURL isEqual:](self->_originalURL, "isEqual:", v23) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "faviconProvider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "linkIconFromPageURL:toCurrentPageURL:isPrivate:completionHandler:", self->_originalURL, v23, -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"), 0);

    }
  }
  else if ((unint64_t)(a5 - 1) > 1)
  {
    goto LABEL_23;
  }
  if ((-[NSURL isEqual:](self->_originalURL, "isEqual:", v23) & 1) == 0)
    -[TabDocument donateSameDocumentNavigationIfNecessary](self, "donateSameDocumentNavigationIfNecessary");
LABEL_23:

}

void __61__TabDocument__webView_navigation_didSameDocumentNavigation___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    -[TabDocument _checkForHighlight](*(_QWORD *)(a1 + 32));
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  id v4;
  PageLoadTest *pageLoadTest;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  _SFPageLoadErrorController *pageLoadErrorController;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_closed)
    goto LABEL_25;
  -[SFDialogController owningWebViewDidChangeProcessID](self->_dialogController, "owningWebViewDidChangeProcessID");
  -[_SFPageLoadErrorController clearCrashCountResetTimer](self->_pageLoadErrorController, "clearCrashCountResetTimer");
  -[TabDocument setMediaStateIcon:]((uint64_t)self, 0);
  pageLoadTest = self->_pageLoadTest;
  if (pageLoadTest)
    -[PageLoadTest resetAfterWebProcessCrash](pageLoadTest, "resetAfterWebProcessCrash");
  if (!self->_active)
  {
    -[TabDocument hibernate](self, "hibernate");
    -[TabDocument setHibernatedDueToMemoryWarning:](self, "setHibernatedDueToMemoryWarning:", 1);
    +[Application postTestNotificationName:object:](Application, "postTestNotificationName:object:", CFSTR("WebProcessDidCrashNotification"), self);
    goto LABEL_25;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[TabDocument URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
  }
  else
  {
    -[_SFWebView backForwardList](self->_webView, "backForwardList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB35C8];
    if (!v7)
    {
      v11 = 0;
      v12 = 1;
      goto LABEL_10;
    }
  }
  v22 = *MEMORY[0x1E0CB32F0];
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
LABEL_10:
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobilesafari"), 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 & 1) == 0)

  pageLoadErrorController = self->_pageLoadErrorController;
  -[TabDocument URLString](self, "URLString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(pageLoadErrorController) = -[_SFPageLoadErrorController updateCrashesAndShowCrashError:URLString:](pageLoadErrorController, "updateCrashesAndShowCrashError:URLString:", v13, v15);

  if ((_DWORD)pageLoadErrorController)
  {
    objc_msgSend(WeakRetained, "setShowingCrashBanner:animated:", 0, 1);
  }
  else
  {
    if ((v12 & 1) == 0)
    {
      if ((objc_msgSend(WeakRetained, "isSuspendedOrSuspending") & 1) == 0 && !self->_suppressCrashBanner)
        objc_msgSend(WeakRetained, "setShowingCrashBanner:animated:", 1, 1);
      if (!self->_unresponsiveWebProcessBlock)
      {
        objc_msgSend(v4, "_committedURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v7);

        if (v17)
        {
          v18 = (id)objc_msgSend(v4, "reload");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabDocument _requestBySettingAdvancedPrivacyProtectionsFlag:](self, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = -[LoadingController loadRequest:userDriven:shouldOpenExternalURLs:](self->_loadingController, "loadRequest:userDriven:shouldOpenExternalURLs:", v20, 0, 0);
        }
      }
    }
    -[TabDocument updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
  }

LABEL_25:
}

- (void)_webCryptoMasterKeyForWebView:(id)a3 completionHandler:(id)a4
{
  webCryptoMasterKey(a4);
}

- (void)_webView:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5
{
  id v7;
  id v8;
  NSString *suggestedFilenameForNextCommit;
  SFQuickLookDocumentWriter *v10;
  SFQuickLookDocumentWriter *quickLookDocumentWriter;
  NSString *v12;

  v12 = (NSString *)a4;
  v7 = a5;
  v8 = objc_alloc(MEMORY[0x1E0D4ED28]);
  if (self->_suggestedFilenameForNextCommit)
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
  else
    suggestedFilenameForNextCommit = v12;
  v10 = (SFQuickLookDocumentWriter *)objc_msgSend(v8, "initWithFileName:uti:", suggestedFilenameForNextCommit, v7);
  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  self->_quickLookDocumentWriter = v10;

}

- (void)_webView:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4
{
  SFQuickLookDocumentWriter *quickLookDocumentWriter;
  _QWORD v5[5];

  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__TabDocument__webView_didFinishLoadForQuickLookDocumentInMainFrame___block_invoke;
  v5[3] = &unk_1E9CF4400;
  v5[4] = self;
  -[SFQuickLookDocumentWriter writeDataAndClose:completionHandler:](quickLookDocumentWriter, "writeDataAndClose:completionHandler:", a4, v5);
}

void __69__TabDocument__webView_didFinishLoadForQuickLookDocumentInMainFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
  objc_msgSend(WeakRetained, "updateInterface");

}

- (void)_webViewDidBeginNavigationGesture:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_navigationObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "tabDocumentDidBeginNavigationGesture:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_webViewWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  id v6;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  if (v7 && -[TabDocument canGoBackToParentTab](self, "canGoBackToParentTab"))
    self->_gestureRequiresGoBackToParentTab = 1;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_navigationObservers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "tabDocumentWillEndNavigationGesture:withNavigationToBackForwardListItem:", self, v7, (_QWORD)v13);
      }
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_webViewDidEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_navigationObservers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "tabDocumentDidEndNavigationGesture:withNavigationToBackForwardListItem:", self, v5, (_QWORD)v13);
      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (v5)
  {
    if (self->_gestureRequiresGoBackToParentTab)
    {
      -[TabDocument goBackToParentTab](self, "goBackToParentTab");
      self->_gestureRequiresGoBackToParentTab = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bookmarkWithID:", -[WKBackForwardListItem safari_bookmarkID](v5));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument setReadingListBookmark:](self, "setReadingListBookmark:", v12);

    }
  }

}

- (void)_webView:(id)a3 willSnapshotBackForwardListItem:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[WKBackForwardListItem safari_setNavigationSnapshotRequiresBars:](v6, objc_msgSend(WeakRetained, "canHideBars") ^ 1);

}

- (void)_webView:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5
{
  -[WBSTranslationContext owningWebViewWillNavigateToBackForwardListItem:inPageCache:](self->_translationContext, "owningWebViewWillNavigateToBackForwardListItem:inPageCache:", a4, a5);
}

- (void)_webView:(id)a3 didCommitLoadWithRequest:(id)a4 inFrame:(id)a5
{
  id v5;

  if (!self->_disableContentBlockersWhenReloading)
  {
    -[TabDocument sfScribbleController](self, "sfScribbleController", a3, a4, a5);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleValidationForHiddenElementsIfNeeded");

  }
}

- (void)_webView:(id)a3 didFailLoadDueToNetworkConnectionIntegrityWithURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[TabDocument _contentBlockerStatisticsStore](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordThirdPartyResourceBlocked:onFirstParty:completionHandler:", v6, v8, 0);

}

- (void)_webView:(id)a3 didChangeLookalikeCharactersFromURL:(id)a4 toURL:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[TabDocument trackerInfo](self, "trackerInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryParameterFilteringDataQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addPendingDataWithAdjustedURL:originalURL:", v7, v10);

}

- (void)_webView:(id)a3 requestUserMediaAuthorizationForDevices:(unint64_t)a4 url:(id)a5 mainFrameURL:(id)a6 decisionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a5;
  v11 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0CD57E8], "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestUserMediaAuthorizationForDevices:url:mainFrameURL:decisionHandler:dialogPresenter:", a4, v14, v11, v12, self);

}

- (void)_webView:(id)a3 checkUserMediaPermissionForURL:(id)a4 mainFrameURL:(id)a5 frameIdentifier:(unint64_t)a6 decisionHandler:(id)a7
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v10 = a5;
  v11 = a7;
  objc_msgSend(MEMORY[0x1E0CD57E8], "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "checkUserMediaPermissionForURL:mainFrameURL:frameIdentifier:decisionHandler:", v13, v10, a6, v11);

}

- (void)_webView:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (self && self->_mediaCaptureState != a4)
  {
    self->_mediaCaptureState = a4;
    -[TabDocument mediaStateDidChangeNeedsDelay:]((uint64_t)self);
  }
  +[Application sharedApplication](Application, "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateShouldLockPrivateBrowsingWithTimerIfNecessary");

}

- (void)_webView:(id)a3 queryPermission:(id)a4 forOrigin:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a4;
  v9 = a6;
  -[WKSecurityOrigin safari_userVisibleName](a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("geolocation")))
  {
    objc_msgSend(MEMORY[0x1E0CD56E0], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__TabDocument__webView_queryPermission_forOrigin_completionHandler___block_invoke;
    v17[3] = &unk_1E9CF95E8;
    v18 = v9;
    objc_msgSend(v11, "getGeolocationSettingForDomain:completionHandler:", v10, v17);
    v12 = &v18;
  }
  else
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("camera")) & 1) == 0
      && (objc_msgSend(v8, "isEqualToString:", CFSTR("microphone")) & 1) == 0)
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CD57E8], "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__TabDocument__webView_queryPermission_forOrigin_completionHandler___block_invoke_2;
    v14[3] = &unk_1E9CF9610;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v13, "getPermissionForOrigin:topLevelOrigin:completionHandler:", v10, v10, v14);
    v12 = &v15;

    v11 = v16;
  }

LABEL_7:
}

uint64_t __68__TabDocument__webView_queryPermission_forOrigin_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = WBSUserMediaPermissionToWKPermissionDecision();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);
}

uint64_t __68__TabDocument__webView_queryPermission_forOrigin_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("camera"));
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    v4 = WBSUserMediaPermissionToWKPermissionDecisionCamera();
  else
    v4 = WBSUserMediaPermissionToWKPermissionDecisionMicrophone();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  void (**v8)(_QWORD);
  id WeakRetained;
  char v10;
  void *v11;
  void *v12;
  SFDialogController *dialogController;
  id v14;

  v14 = a4;
  v8 = (void (**)(_QWORD))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_msgSend(WeakRetained, "tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:", self);

  if ((v10 & 1) != 0)
  {
    if (-[TabDocument isControlledByAutomation](self, "isControlledByAutomation"))
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "automationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tabDocument:runJavaScriptAlertPanelWithMessage:completionHandler:", self, v14, v8);

    }
    else
    {
      dialogController = self->_dialogController;
      objc_msgSend(MEMORY[0x1E0D4EC60], "javaScriptAlertDialogWithMessage:completionHandler:", v14, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDialogController presentDialog:](dialogController, "presentDialog:", v11);
    }

  }
  else
  {
    v8[2](v8);
  }

}

- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, _QWORD);
  id WeakRetained;
  char v10;
  void *v11;
  void *v12;
  SFDialogController *dialogController;
  id v14;

  v14 = a4;
  v8 = (void (**)(id, _QWORD))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_msgSend(WeakRetained, "tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:", self);

  if ((v10 & 1) != 0)
  {
    if (-[TabDocument isControlledByAutomation](self, "isControlledByAutomation"))
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "automationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tabDocument:runJavaScriptConfirmPanelWithMessage:completionHandler:", self, v14, v8);

    }
    else
    {
      dialogController = self->_dialogController;
      objc_msgSend(MEMORY[0x1E0D4EC60], "javaScriptConfirmDialogWithMessage:completionHandler:", v14, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDialogController presentDialog:](dialogController, "presentDialog:", v11);
    }

  }
  else
  {
    v8[2](v8, 0);
  }

}

- (void)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6 completionHandler:(id)a7
{
  id v10;
  void (**v11)(id, _QWORD);
  id WeakRetained;
  char v13;
  void *v14;
  void *v15;
  SFDialogController *dialogController;
  id v17;

  v17 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_msgSend(WeakRetained, "tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:", self);

  if ((v13 & 1) != 0)
  {
    if (-[TabDocument isControlledByAutomation](self, "isControlledByAutomation"))
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "automationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tabDocument:runJavaScriptTextInputPanelWithPrompt:defaultText:completionHandler:", self, v17, v10, v11);

    }
    else
    {
      dialogController = self->_dialogController;
      objc_msgSend(MEMORY[0x1E0D4EC60], "javaScriptPromptDialogWithMessage:defaultText:completionHandler:", v17, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDialogController presentDialog:](dialogController, "presentDialog:", v14);
    }

  }
  else
  {
    v11[2](v11, 0);
  }

}

- (void)_webView:(id)a3 requestStorageAccessPanelForDomain:(id)a4 underCurrentDomain:(id)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  id WeakRetained;
  char v12;
  SFDialogController *dialogController;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v9 = a5;
  v10 = (void (**)(id, _QWORD))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_msgSend(WeakRetained, "tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:", self);

  if ((v12 & 1) != 0)
  {
    dialogController = self->_dialogController;
    v14 = (void *)MEMORY[0x1E0D4EC60];
    -[TabDocument webExtensionsController](self, "webExtensionsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestStorageAccessDialogForDomain:underCurrentDomain:extensionsController:completionHandler:", v17, v9, v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogController presentDialog:](dialogController, "presentDialog:", v16);

  }
  else
  {
    v10[2](v10, 0);
  }

}

- (void)_webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  char v19;
  void *v20;
  id v21;
  uint64_t v22;
  void (**v23)(id, _QWORD);
  void (**v24)(_QWORD);
  void *v25;
  SFDialogController *dialogController;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, int);
  void *v32;
  void (**v33)(_QWORD);
  void (**v34)(id, _QWORD);
  _QWORD aBlock[5];
  id v36;
  id v37;
  id v38;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a7;
  if (objc_msgSend(v11, "_shouldOpenAppLinks"))
  {
    objc_msgSend(v11, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "safari_isHTTPFamilyURL"))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", v14);
      if (objc_msgSend(v15, "synchronouslyDecideOpenStrategy") == 3 && !self->_wasLoadedWithLockdownModeEnabled)
      {
        objc_msgSend(v15, "openExternally");
        v12[2](v12, 0);

        goto LABEL_21;
      }

    }
  }
  if ((objc_msgSend(v11, "_isUserInitiated") & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = objc_msgSend(WeakRetained, "popUpPolicyForTabDocument:", self);

  }
  objc_msgSend(v11, "_userInitiatedAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isConsumed");

  if ((v19 & 1) != 0)
  {
    v16 = 2;
  }
  else if (v16 == 1)
  {
    objc_msgSend(v11, "_userInitiatedAction");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "consume");

    v16 = 1;
  }
  v21 = objc_loadWeakRetained((id *)&self->_browserController);
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__TabDocument__webView_createWebViewWithConfiguration_forNavigationAction_windowFeatures_completionHandler___block_invoke;
  aBlock[3] = &unk_1E9CF9638;
  aBlock[4] = self;
  v14 = v21;
  v36 = v14;
  v37 = v10;
  v23 = v12;
  v38 = v23;
  v24 = (void (**)(_QWORD))_Block_copy(aBlock);
  v25 = v24;
  if (v16)
  {
    if (v16 == 2)
    {
      v23[2](v23, 0);
    }
    else if (v16 == 1)
    {
      v24[2](v24);
    }
  }
  else
  {
    dialogController = self->_dialogController;
    v27 = (void *)MEMORY[0x1E0D4EC60];
    v29 = v22;
    v30 = 3221225472;
    v31 = __108__TabDocument__webView_createWebViewWithConfiguration_forNavigationAction_windowFeatures_completionHandler___block_invoke_2;
    v32 = &unk_1E9CF3D88;
    v33 = v24;
    v34 = v23;
    objc_msgSend(v27, "blockedPopupWindowDialogWithCompletionHandler:", &v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogController presentDialog:](dialogController, "presentDialog:", v28, v29, v30, v31, v32);

  }
LABEL_21:

}

void __108__TabDocument__webView_createWebViewWithConfiguration_forNavigationAction_windowFeatures_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 504))
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 504);
    *(_QWORD *)(v3 + 504) = v2;

  }
  v10 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithBrowserController:configuration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v10, "setIsBlank:", 0);
  objc_msgSend(v10, "setParentTabDocumentForBackClosesSpawnedTab:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v10, "setWasOpenedFromLink:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "addPointer:", v10);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1192));
  objc_msgSend(WeakRetained, "tabDocument:didCreateNewTabDocument:", *(_QWORD *)(a1 + 32), v10);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "tabCollectionViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 3, objc_msgSend(v7, "visibleTabCollectionViewType"));

  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v10, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

uint64_t __108__TabDocument__webView_createWebViewWithConfiguration_forNavigationAction_windowFeatures_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_webView:(id)a3 takeFocus:(int64_t)a4
{
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "usingUnifiedBar");

  if (v8)
  {
    objc_msgSend(v10, "resignFirstResponder");
    objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (a4)
      {
        if (a4 == 1)
          objc_msgSend(v9, "_safari_moveFocusToNextGroup");
      }
      else
      {
        objc_msgSend(v9, "_safari_moveFocusToPreviousGroup");
      }
    }

  }
  else
  {
    objc_msgSend(WeakRetained, "setFavoritesFieldFocused:animated:", 1, 1);
  }

}

- (BOOL)_webViewCanBecomeFocused:(id)a3
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = objc_msgSend(WeakRetained, "favoritesAreEmbedded") ^ 1;

  return v4;
}

- (void)webViewDidClose:(id)a3
{
  void *v4;
  id WeakRetained;
  char v6;
  id v7;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (!-[TabDocument isShowingFindOnPage](self, "isShowingFindOnPage"))
    {
      -[SFDialogController presentedDialog](self->_dialogController, "presentedDialog");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4 && !self->_isDisplayingTelephonyPrompt)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v6 = objc_msgSend(WeakRetained, "tabDocumentCanCloseWindow:", self);

        if ((v6 & 1) != 0)
          -[TabDocument _closeTabDocumentAnimated:](self, "_closeTabDocumentAnimated:", 1);
      }
    }
  }

}

- (void)_webViewFullscreenMayReturnToInline:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "prepareForTabDocumentWebViewFullscreenMayReturnToInline:", self);

}

- (void)_webViewDidEnterFullscreen:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  const __CFString *v15;
  const __CFString *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_navigationObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "tabDocumentDidEnterFullscreen:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  self->_webViewIsFullscreen = 1;
  v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "Web view did enter full screen", v10, 2u);
  }
  if (_PLShouldLogRegisteredEvent())
  {
    v15 = CFSTR("subevent");
    v16 = CFSTR("Enter");
    _PLLogRegisteredEvent(objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  }
}

- (void)_webViewDidExitFullscreen:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  const __CFString *v15;
  const __CFString *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_navigationObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "tabDocumentDidExitFullscreen:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  self->_webViewIsFullscreen = 0;
  v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "Web view did exit full screen", v10, 2u);
  }
  if (_PLShouldLogRegisteredEvent())
  {
    v15 = CFSTR("subevent");
    v16 = CFSTR("Exit");
    _PLLogRegisteredEvent(objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  }
}

- (double)_convertRectFromDocumentToWebView:(double)a3
{
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 1008), "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoomScale");
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 1008), "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toView:", *(_QWORD *)(a1 + 1008), a2 * v12, a3 * v12, a4 * v12, a5 * v12);
  v15 = v14;

  return v15;
}

- (void)animateElement:(id)a3 toBarItem:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id WeakRetained;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v19, "boundingRect");
    v11 = -[TabDocument _convertRectFromDocumentToWebView:]((uint64_t)self, v7, v8, v9, v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "animateLinkImage:fromRect:inView:toBarItem:", objc_msgSend(objc_retainAutorelease(v6), "CGImage"), self->_webView, a4, v11, v13, v15, v17);

  }
}

- (id)_webView:(id)a3 alternateURLFromImage:(id)a4 userInfo:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CD5768], "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getActionForImageSynchronously:userInfo:", v6, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "urlThatCanBeOpened");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)presentingViewControllerForAction:(id)a3
{
  void *v3;
  void *v4;

  -[TabDocument browserController](self, "browserController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerToPresentFrom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)sourceRectForPopoverActionPicker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD5768], "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "elementForAction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRect");
  v11 = -[TabDocument _convertRectFromDocumentToWebView:]((uint64_t)self, v7, v8, v9, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  return 0;
}

- (id)_presentingViewControllerForWebView:(id)a3
{
  id WeakRetained;
  void *v5;
  TabDocument *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTabDocument");
  v6 = (TabDocument *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_webView:(id)a3 decideDatabaseQuotaForSecurityOrigin:(id)a4 currentQuota:(unint64_t)a5 currentOriginUsage:(unint64_t)a6 currentDatabaseUsage:(unint64_t)a7 expectedUsage:(unint64_t)a8 decisionHandler:(id)a9
{
  id v14;
  id v15;
  id WeakRetained;
  char v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  unint64_t v21;

  v14 = a4;
  v15 = a9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_msgSend(WeakRetained, "tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:", self);

  if ((v17 & 1) != 0)
  {
    -[WKSecurityOrigin safari_userVisibleName](v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __144__TabDocument__webView_decideDatabaseQuotaForSecurityOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_decisionHandler___block_invoke;
    v19[3] = &unk_1E9CF9660;
    v20 = v15;
    v21 = a5;
    +[WebsiteDataUtilities getDatabaseQuotaForOrigin:currentQuota:currentOriginUsage:currentDatabaseUsage:expectedUsage:dialogPresenter:completionHandler:](WebsiteDataUtilities, "getDatabaseQuotaForOrigin:currentQuota:currentOriginUsage:currentDatabaseUsage:expectedUsage:dialogPresenter:completionHandler:", v18, a5, a6, a7, a8, self, v19);

  }
  else
  {
    (*((void (**)(id, unint64_t))v15 + 2))(v15, a5);
  }

}

uint64_t __144__TabDocument__webView_decideDatabaseQuotaForSecurityOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (!a2)
    a2 = *(_QWORD *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)_webView:(id)a3 printFrame:(id)a4
{
  BrowserController **p_browserController;
  id v6;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "presentPrintControllerForTabDocument:frame:initiatedByWebContent:", self, v6, 1);

}

- (void)_webView:(id)a3 imageOrMediaDocumentSizeChanged:(CGSize)a4
{
  -[LinkPreviewViewController setPreferredContentSize:](self->_linkPreviewViewController, "setPreferredContentSize:", a3, a4.width, a4.height);
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5
{
  objc_storeWeak((id *)&self->_webKitDragSession, a5);
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6
{
  objc_storeWeak((id *)&self->_webKitDragSession, 0);
}

- (unint64_t)_webView:(id)a3 willUpdateDataInteractionOperationToOperation:(unint64_t)a4 forSession:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  BOOL v10;

  v7 = a5;
  objc_msgSend(v7, "localDragSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webKitDragSession);
    v10 = v8 != WeakRetained;

  }
  else
  {
    v10 = 1;
  }
  if (a4 <= 1 && v10 && objc_msgSend(MEMORY[0x1E0D4EF70], "canCreateNavigationIntentForDropSession:", v7))
    a4 = 2;

  return a4;
}

- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4
{
  _SFWebView *v6;
  id v7;
  unint64_t v8;
  void *v9;
  _SFWebView *readerWebView;
  NSNumber *deferredDropWasHandledByWebKit;
  _QWORD v13[6];

  v6 = (_SFWebView *)a3;
  v7 = a4;
  v8 = self->_deferredDropNavigationIntentGeneration + 1;
  self->_deferredDropNavigationIntentGeneration = v8;
  objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__TabDocument__webView_performDataInteractionOperationWithItemProviders___block_invoke;
  v13[3] = &unk_1E9CF9688;
  v13[4] = self;
  v13[5] = v8;
  objc_msgSend(v9, "buildNavigationIntentForItemProviders:completionHandler:", v7, v13);

  readerWebView = self->_readerWebView;
  if (readerWebView == v6)
  {
    deferredDropWasHandledByWebKit = self->_deferredDropWasHandledByWebKit;
    self->_deferredDropWasHandledByWebKit = (NSNumber *)MEMORY[0x1E0C9AAA0];

    -[TabDocument _attemptDeferredDropNavigation]((uint64_t)self);
  }

  return readerWebView == v6;
}

void __73__TabDocument__webView_performDataInteractionOperationWithItemProviders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v4 + 448))
  {
    objc_storeStrong((id *)(v4 + 440), a2);
    -[TabDocument _attemptDeferredDropNavigation](*(_QWORD *)(a1 + 32));
  }

}

- (void)_attemptDeferredDropNavigation
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;

  if (a1)
  {
    v2 = *(void **)(a1 + 456);
    if (v2)
    {
      if (*(_QWORD *)(a1 + 440))
      {
        if ((objc_msgSend(v2, "BOOLValue") & 1) == 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
          objc_msgSend(WeakRetained, "dispatchNavigationIntent:", *(_QWORD *)(a1 + 440));

        }
        v4 = *(void **)(a1 + 440);
        *(_QWORD *)(a1 + 440) = 0;

        v5 = *(void **)(a1 + 456);
        *(_QWORD *)(a1 + 456) = 0;

      }
    }
  }
}

- (void)_webView:(id)a3 dataInteractionOperationWasHandled:(BOOL)a4 forSession:(id)a5 itemProviders:(id)a6
{
  NSNumber *v7;
  NSNumber *deferredDropWasHandledByWebKit;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  deferredDropWasHandledByWebKit = self->_deferredDropWasHandledByWebKit;
  self->_deferredDropWasHandledByWebKit = v7;

  -[TabDocument _attemptDeferredDropNavigation]((uint64_t)self);
}

- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6
{
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  id v33;
  _QWORD v34[4];
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v31 = a4;
  v27 = a5;
  v28 = a6;
  objc_msgSend(v27, "safari_firstObjectPassingTest:", &__block_literal_global_496);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builderWithModifierFlags:", 0, v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationIntentWithURL:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[TabDocument uuid](self, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSourceTabUUID:", v11);

    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSourceWindowUUID:", v13);

    v33 = v31;
    objc_msgSend(MEMORY[0x1E0CA5920], "_sf_windowCreationActivityWithNavigationIntent:", v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v33, "registeredContentTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v16;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v38;
      v19 = *MEMORY[0x1E0CEC618];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (v14 && objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "conformsToType:", v19))
          {
            objc_msgSend(v15, "registerObject:visibility:", v14, 0);

            v14 = 0;
          }
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __111__TabDocument__webView_adjustedDataInteractionItemProvidersForItemProvider_representingObjects_additionalData___block_invoke_2;
          v34[3] = &unk_1E9CF96D0;
          v35 = v33;
          v36 = v21;
          objc_msgSend(v15, "registerItemForTypeIdentifier:loadHandler:", v22, v34);

        }
        v16 = obj;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v17);
    }

    v42 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

uint64_t __111__TabDocument__webView_adjustedDataInteractionItemProvidersForItemProvider_representingObjects_additionalData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __111__TabDocument__webView_adjustedDataInteractionItemProvidersForItemProvider_representingObjects_additionalData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a4;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadItemForTypeIdentifier:options:completionHandler:", v8, v6, v9);

}

- (void)_webView:(id)a3 requestGeolocationAuthorizationForURL:(id)a4 frame:(id)a5 decisionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0CD56E0], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestPermissionForURL:frame:dialogPresenter:completionHandler:", v12, v9, self, v10);

}

- (BOOL)_webView:(id)a3 fileUploadPanelContentIsManagedWithInitiatingFrame:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isURLManaged:", v7);

  return v8;
}

- (void)_webView:(id)a3 didChangeSafeAreaShouldAffectObscuredInsets:(BOOL)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentDidChangeSafeAreaShouldAffectObscuredInsets:", self);

}

- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4
{
  return SFDataOwnerForWebViewInteraction();
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  return SFDataOwnerForWebViewInteraction();
}

- (void)_webView:(id)a3 requestWebAuthenticationConditionalMediationRegistrationForUser:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CD56D8], "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument tabIDForAutoFill](self, "tabIDForAutoFill");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument committedURL](self, "committedURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__TabDocument__webView_requestWebAuthenticationConditionalMediationRegistrationForUser_completionHandler___block_invoke;
  v13[3] = &unk_1E9CF3500;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v9, "canAutomaticallyRegisterPasskeyForUsername:inTabWithID:currentURL:completionHandler:", v7, v10, v11, v13);

}

uint64_t __106__TabDocument__webView_requestWebAuthenticationConditionalMediationRegistrationForUser_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_webView:(id)a3 hasVideoInPictureInPictureDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabDocument:didChangePIPState:", self, v4);

  -[TabDocument updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:](self, "updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:", -[TabDocument isActive](self, "isActive"));
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportPictureInPictureEvent:", v4 ^ 1);

}

- (void)_webView:(id)a3 willStartInputSession:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD56D0]), "initWithFormInputSession:", v6);
  if (!objc_msgSend(v6, "requiresStrongPasswordAssistance")
    || (-[_SFFormAutoFillController prepareForShowingAutomaticStrongPasswordWithInputSession:](self->_autoFillController, "prepareForShowingAutomaticStrongPasswordWithInputSession:", v5), (objc_msgSend(MEMORY[0x1E0D89BE8], "isPasswordManagerAppEnabledAndInstalled") & 1) != 0))
  {
    -[_SFFormAutoFillController fieldWillFocusWithInputSession:](self->_autoFillController, "fieldWillFocusWithInputSession:", v5);
  }

}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  _SFFormAutoFillController *autoFillController;
  void *v6;
  id v7;

  v7 = a4;
  if (!objc_msgSend(v7, "requiresStrongPasswordAssistance")
    || (objc_msgSend(MEMORY[0x1E0D89BE8], "isPasswordManagerAppEnabledAndInstalled") & 1) != 0)
  {
    autoFillController = self->_autoFillController;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD56D0]), "initWithFormInputSession:", v7);
    -[_SFFormAutoFillController fieldDidFocusWithInputSession:](autoFillController, "fieldDidFocusWithInputSession:", v6);

  }
}

- (BOOL)_webView:(id)a3 focusRequiresStrongPasswordAssistance:(id)a4
{
  id v5;
  void *v6;
  int v7;
  _SFFormAutoFillController *autoFillController;
  id v9;
  BOOL v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD56D0]), "initWithFocusedElement:", v5);
  v7 = -[_SFFormAutoFillController shouldShowPasswordManagementAppOnboardingViews](self->_autoFillController, "shouldShowPasswordManagementAppOnboardingViews");
  autoFillController = self->_autoFillController;
  if (v7)
  {
    v9 = (id)-[_SFFormAutoFillController beginAutomaticPasswordInteractionWithInputSession:](autoFillController, "beginAutomaticPasswordInteractionWithInputSession:", v6);
    v10 = 1;
  }
  else
  {
    -[_SFFormAutoFillController beginAutomaticPasswordInteractionWithInputSession:](autoFillController, "beginAutomaticPasswordInteractionWithInputSession:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 != 0;

  }
  return v10;
}

- (void)_webView:(id)a3 didResignInputElementStrongPasswordAppearanceWithUserInfo:(id)a4
{
  -[_SFFormAutoFillController removeAutomaticPasswordVisualTreatment](self->_autoFillController, "removeAutomaticPasswordVisualTreatment", a3, a4);
}

- (id)_webViewAdditionalContextForStrongPasswordAssistance:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CD5850];
  -[TabDocument uuid](self, "uuid", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  _SFFormAutoFillController *autoFillController;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD v20[5];
  std::__shared_weak_count *v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  autoFillController = self->_autoFillController;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3321888768;
  v20[2] = __74__TabDocument__webView_willSubmitFormValues_userObject_submissionHandler___block_invoke;
  v20[3] = &__block_descriptor_48_ea8_32c87_ZTSKZ74__TabDocument__webView_willSubmitFormValues_userObject_submissionHandler__E3__1_e5_v8__0l;
  v13 = (std::__shared_weak_count *)operator new(0x28uLL);
  v13->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E9CF9A78;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)_Block_copy(v11);
  LOBYTE(v13[1].__shared_owners_) = 0;
  v20[4] = v13 + 1;
  v21 = v13;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  -[_SFFormAutoFillController willSubmitFormValues:userObject:submissionHandler:](autoFillController, "willSubmitFormValues:userObject:submissionHandler:", v9, v10, v20, &v13[1], v13);
  do
    v16 = __ldaxr(p_shared_owners);
  while (__stlxr(v16 - 1, p_shared_owners));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  v17 = v21;
  if (v21)
  {
    v18 = (unint64_t *)&v21->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

}

_QWORD *__74__TabDocument__webView_willSubmitFormValues_userObject_submissionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(a1 + 32);
  v1[8] = 1;
  return (*(_QWORD *(**)(_BYTE *__return_ptr))(*(_QWORD *)v1 + 16))(v1);
}

- (uint64_t)_webView:(uint64_t)a1 willSubmitFormValues:userObject:submissionHandler:
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5
{
  -[_SFFormAutoFillController insertTextSuggestion:](self->_autoFillController, "insertTextSuggestion:", a4);
}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *WeakRetained;
  void *v10;

  v6 = a3;
  v7 = a4;
  +[Application postTestNotificationName:object:](Application, "postTestNotificationName:object:", CFSTR("WebFormElementDidFocusNotification"), self);
  if (self->_locked)
    goto LABEL_2;
  if (self->_allowsProgrammaticFocusToBeginInputSession)
  {
    v8 = 1;
    goto LABEL_15;
  }
  if (-[TabDocument isControlledByAutomation](self, "isControlledByAutomation"))
  {
LABEL_2:
    v8 = 2;
  }
  else
  {
    if (-[_SFFormAutoFillController elementIsBeingFocusedForStreamlinedLogin:](self->_autoFillController, "elementIsBeingFocusedForStreamlinedLogin:", v7))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_msgSend(WeakRetained, "tabDocumentCanBeginInputSessionForStreamlinedLogin:", self))
        v8 = 1;
      else
        v8 = 2;
    }
    else
    {
      -[LoadingController URL](self->_loadingController, "URL");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_committedURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(WeakRetained, "isEqual:", v10))
        v8 = 0;
      else
        v8 = 2;

    }
  }
LABEL_15:

  return v8;
}

- (void)_webViewDidEnableInspectorBrowserDomain:(id)a3
{
  WBSSafariExtensionStateObserver *webExtensionsStateObserver;
  id v5;
  _SFWebView *webView;
  void *v7;
  WBSSafariExtensionStateObserver *v8;
  WBSSafariExtensionStateObserver *v9;
  id v10;

  v10 = a3;
  webExtensionsStateObserver = self->_webExtensionsStateObserver;
  if (!webExtensionsStateObserver)
  {
    v5 = objc_alloc(MEMORY[0x1E0D8ABC8]);
    webView = self->_webView;
    -[TabDocument webExtensionsController](self, "webExtensionsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (WBSSafariExtensionStateObserver *)objc_msgSend(v5, "initWithWebView:extensionsController:", webView, v7);
    v9 = self->_webExtensionsStateObserver;
    self->_webExtensionsStateObserver = v8;

    webExtensionsStateObserver = self->_webExtensionsStateObserver;
  }
  -[WBSSafariExtensionStateObserver startObservingExtensionStateChanges](webExtensionsStateObserver, "startObservingExtensionStateChanges");

}

- (void)_webViewDidDisableInspectorBrowserDomain:(id)a3
{
  WBSSafariExtensionStateObserver *webExtensionsStateObserver;

  webExtensionsStateObserver = self->_webExtensionsStateObserver;
  if (webExtensionsStateObserver)
    -[WBSSafariExtensionStateObserver stopObservingExtensionStateChanges](webExtensionsStateObserver, "stopObservingExtensionStateChanges", a3);
}

- (BOOL)allowsBrowsingAssistant
{
  return !-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled")
      && objc_msgSend(MEMORY[0x1E0D8A7F8], "userConsentState") == 1;
}

- (void)browsingAssistantControllerDidReset:(id)a3
{
  -[SFNavigationBarItem resetContentOptions](self->_navigationBarItem, "resetContentOptions", a3);
}

- (void)browsingAssistantController:(id)a3 didUpdateContentOptionsForURL:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  id v12;

  v12 = a3;
  v6 = a4;
  -[TabDocument committedURL](self, "committedURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBSIsEqual();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v12, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "contentOptions");

    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabDocument:didReceiveAssistantContentOptions:", self, v10);

    -[SFNavigationBarItem updateContentOptions:](self->_navigationBarItem, "updateContentOptions:", v10);
  }

}

- (void)browsingAssistantControllerDidUpdateUserConsentState:(id)a3
{
  WBSBrowsingAssistantController *assistantController;
  void *v5;
  id v6;

  if (-[TabDocument allowsBrowsingAssistant](self, "allowsBrowsingAssistant", a3))
  {
    assistantController = self->_assistantController;
    -[TabDocument url](self, "url");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[WBSTranslationContext webpageLocale](self->_translationContext, "webpageLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSBrowsingAssistantController checkForAssistantContentFromPegasusForURL:locale:](assistantController, "checkForAssistantContentFromPegasusForURL:locale:", v6, v5);

  }
}

- (void)loadingController:(id)a3 willLoadRequest:(id)a4 webView:(id)a5 userDriven:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  uint64_t v10;
  id v11;

  v6 = a6;
  v11 = a4;
  v9 = a5;
  -[TabDocument _loadingControllerWillLoadRequest:webView:userDriven:]((uint64_t)self, v11, v10, v6);
  -[WBSURLSpoofingMitigator willStartNewBrowserChromeInitiatedNavigation](self->_URLSpoofingMitigator, "willStartNewBrowserChromeInitiatedNavigation");

}

- (void)loadingControllerWillStartUserDrivenLoad:(id)a3
{
  *(_WORD *)&self->_loadWasUserDriven = 1;
  self->_shouldResetPrintSuppressionOnNextCommit = 1;
  self->_sessionStateRestorationSource = 0;
  -[WBSURLSpoofingMitigator willStartNewBrowserChromeInitiatedNavigation](self->_URLSpoofingMitigator, "willStartNewBrowserChromeInitiatedNavigation", a3);
}

- (void)_webView:(id)a3 logDiagnosticMessage:(id)a4 description:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logDiagnosticMessageWithKey:diagnosticMessage:", v8, v6);

}

- (void)_webView:(id)a3 logDiagnosticMessageWithResult:(id)a4 description:(id)a5 result:(int64_t)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logDiagnosticMessageWithKey:diagnosticMessage:result:", v10, v8, a6);

}

- (void)_webView:(id)a3 logDiagnosticMessageWithValue:(id)a4 description:(id)a5 value:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  v9 = a6;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logDiagnosticMessageWithKey:diagnosticMessage:value:", v11, v8, v9);

}

- (void)_webView:(id)a3 logDiagnosticMessageWithEnhancedPrivacy:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled")
    || (objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "donateForDiagnosticLoggingKey:value:webPageLoadedOverPrivateRelay:", v8, v9, objc_msgSend(v12, "_wasPrivateRelayed")), v10, (v11 & 1) == 0))
  {
    WBSLogWithDifferentialPrivacy();
  }

}

- (void)_webView:(id)a3 logDiagnosticMessage:(id)a4 description:(id)a5 valueDictionary:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  v9 = a6;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didReceiveAnalyticsEventFromWebKitWithName:description:payload:", v11, v8, v9);

}

- (void)_webView:(id)a3 logDiagnosticMessageWithDomain:(id)a4 domain:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!a5)
  {
    ct_green_tea_logger_create_static();
    getCTGreenTeaOsLogHandle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 136315138;
        v11 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
      }

    }
  }

}

- (void)didAutoDetectSiteSpecificSearchProviderWithOriginatingURL:(id)a3 searchURLTemplate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[TabDocument browserController](self, "browserController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeSearchEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "urlIsValidSearch:", v7);

    if (v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "rootViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tipsCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "donatePerformSearchFromDefaultSearchEngineWebPageEvent");

    }
  }
  if (-[_SFBrowserConfiguration allowsSiteSpecificSearch](self->_configuration, "allowsSiteSpecificSearch"))
  {
    objc_msgSend(MEMORY[0x1E0D8AB58], "sharedController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AA50]), "initWithString:", v6);
    objc_msgSend(v17, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSearchURLTemplateFromForm:forSourcePageURLString:completionHandler:", v15, v16, 0);

  }
}

- (void)didFindAppBannerWithContent:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  if (!self->_storeBannersAreDisabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    v6 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");

    if ((v6 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v7, "removeAppBannerFromTabDocument:animated:", self, 1);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[TabDocument _setAppBannerWhenPainted:]((uint64_t)self, 0);
      -[TabDocument URL](self, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SFCreateAppSuggestionBannerFromMetaTagContent();

    }
  }

}

void __43__TabDocument_didFindAppBannerWithContent___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a2;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 1144) && !*(_QWORD *)(v6 + 352) || *(_BYTE *)(v6 + 903))
  {
    objc_msgSend(v4, "setDelegate:");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 344), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "backForwardList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(void **)(*(_QWORD *)(a1 + 32) + 312) != v8)
    {
      objc_msgSend(v5, "overlayProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v5, "overlayProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "perSitePreferencesVendor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __43__TabDocument_didFindAppBannerWithContent___block_invoke_2;
        v12[3] = &unk_1E9CF3358;
        v12[4] = *(_QWORD *)(a1 + 32);
        v13 = v5;
        objc_msgSend(v10, "requestOverlayWithPreferencesVendor:completion:", v11, v12);

      }
      else
      {
        -[TabDocument _setAppBannerWhenPainted:](*(_QWORD *)(a1 + 32), v5);
      }
    }

  }
}

void __43__TabDocument_didFindAppBannerWithContent___block_invoke_2(uint64_t a1)
{
  -[TabDocument _setAppBannerWhenPainted:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)findOnPageCompletionProvider:(id)a3 setStringToComplete:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  FindOnPageCompletionItem *v12;
  void *v13;
  id v14;
  id v15;
  SFTextSearchMatchesCounter *v16;
  SFTextSearchMatchesCounter *findMatchesCounter;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SFTextSearchMatchesCounter queryString](self->_findMatchesCounter, "queryString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if ((v9 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_findCompletionProvider, v6);
    -[TabDocument findInteraction](self, "findInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_configuredSearchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SFTextSearchMatchesCounter canSkipCountingMatchesForQueryString:wordMatchMethod:](self->_findMatchesCounter, "canSkipCountingMatchesForQueryString:wordMatchMethod:", v7, objc_msgSend(v11, "wordMatchMethod")))
    {
      v12 = -[FindOnPageCompletionItem initWithString:numberOfMatches:forQueryID:]([FindOnPageCompletionItem alloc], "initWithString:numberOfMatches:forQueryID:", v7, 0, objc_msgSend(v6, "parsecQueryID"));
      v23[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCompletions:forString:", v13, v7);

    }
    else
    {
      -[SFTextSearchMatchesCounter invalidate](self->_findMatchesCounter, "invalidate");
      objc_initWeak(&location, self);
      v14 = objc_alloc(MEMORY[0x1E0D4EE48]);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __64__TabDocument_findOnPageCompletionProvider_setStringToComplete___block_invoke;
      v19[3] = &unk_1E9CF9750;
      objc_copyWeak(&v21, &location);
      v15 = v7;
      v20 = v15;
      v16 = (SFTextSearchMatchesCounter *)objc_msgSend(v14, "initWithQueryString:completionHandler:", v15, v19);
      findMatchesCounter = self->_findMatchesCounter;
      self->_findMatchesCounter = v16;

      -[TabDocument activeWebView](self, "activeWebView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "performTextSearchWithQueryString:usingOptions:resultAggregator:", v15, v11, self->_findMatchesCounter);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

  }
}

void __64__TabDocument_findOnPageCompletionProvider_setStringToComplete___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[TabDocument _updateFindCompletionProviderWithNumberOfMatches:forString:]((uint64_t)WeakRetained, a2, *(void **)(a1 + 32));

}

- (void)_updateFindCompletionProviderWithNumberOfMatches:(void *)a3 forString:
{
  id v5;
  id WeakRetained;
  FindOnPageCompletionItem *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
    if (WeakRetained)
    {
      v7 = -[FindOnPageCompletionItem initWithString:numberOfMatches:forQueryID:]([FindOnPageCompletionItem alloc], "initWithString:numberOfMatches:forQueryID:", v5, a2, objc_msgSend(WeakRetained, "parsecQueryID"));
      v9[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setCompletions:forString:", v8, v5);

    }
  }

}

- (void)showFindOnPage
{
  id v2;

  -[TabDocument activeWebView](self, "activeWebView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "find:", 0);

}

- (UIEdgeInsets)_webView:(id)a3 finalObscuredInsetsForScrollView:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y;
  double x;
  BrowserController **p_browserController;
  id v10;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  y = a5.y;
  x = a5.x;
  p_browserController = &self->_browserController;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "finalObscuredInsetsForScrollView:withVelocity:targetContentOffset:", v10, a6, x, y);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (id)formAutoFillControllerURLForFormAutoFill:(id)a3
{
  -[TabDocument URL](self, "URL", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3
{
  return -[_SFBrowserConfiguration allowsStreamlinedLogin](self->_configuration, "allowsStreamlinedLogin", a3) ^ 1;
}

- (id)currentSavedAccountContextForFormAutoFillController:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[TabDocument profileIdentifier]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D89CE8], "defaultContext");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D89CE8]), "initWithSafariProfileIdentifier:", v3);
  }
  v5 = (void *)v4;

  return v5;
}

- (NSUUID)tabIDForAutoFill
{
  return self->_uuid;
}

- (BOOL)formAutoFillControllerDidUserDeclineAutomaticStrongPasswordForCurrentDomain:(id)a3
{
  void *v4;
  void *v5;

  -[TabDocument committedURL](self, "committedURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", self->_domainWhereUserDeclinedAutomaticStrongPassword);
  return (char)v4;
}

- (void)formAutoFillControllerUserChoseToUseGeneratedPassword:(id)a3
{
  NSString *domainWhereUserDeclinedAutomaticStrongPassword;

  domainWhereUserDeclinedAutomaticStrongPassword = self->_domainWhereUserDeclinedAutomaticStrongPassword;
  self->_domainWhereUserDeclinedAutomaticStrongPassword = 0;

}

- (void)formAutoFillControllerDidFocusSensitiveFormField:(id)a3
{
  _BOOL4 hasFocusedInputFieldOnCurrentPage;

  hasFocusedInputFieldOnCurrentPage = self->_hasFocusedInputFieldOnCurrentPage;
  self->_hasFocusedInputFieldOnCurrentPage = 1;
  if (!hasFocusedInputFieldOnCurrentPage)
    -[TabDocument _updateNavigationBarItem]((uint64_t)self);
}

- (void)formAutoFillControllerGetAuthenticationForAutoFill:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  id autoFillAuthenticationCompletionBlock;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(WeakRetained, "tabDocumentCanDisplayModalUI:", self);

  if (v9)
  {
    -[TabDocument _getAuthenticationForAutoFillController:withCompletion:]((uint64_t)self, v6, v7);
  }
  else
  {
    v10 = _Block_copy(v7);
    autoFillAuthenticationCompletionBlock = self->_autoFillAuthenticationCompletionBlock;
    self->_autoFillAuthenticationCompletionBlock = v10;

    v12 = WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D7CA3000, v12, OS_LOG_TYPE_INFO, "Deferring AutoFill Authentication since the TabDocument can't show modal UI", v13, 2u);
    }
  }

}

void __70__TabDocument__getAuthenticationForAutoFillController_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "authenticationContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticatedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, a2, v4);

}

- (void)presentAutoFillInternalFeedbackToastForFormAutoFillController:(id)a3 diagnosticsDataWithoutPageContents:(id)a4
{
  BrowserController **p_browserController;
  id v5;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "presentAutoFillInternalFeedbackToastWithDiagnosticsDataWithoutPageContents:", v5);

}

- (void)dismissAutoFillInternalFeedbackActivityForFormAutoFillController:(id)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "dismissAutoFillInternalFeedbackToastImmediately:", v4);

}

- (void)resetPendingAutoFillInternalFeedbackToastDismissalTimer
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "resetPendingAutoFillInternalFeedbackToastDismissalTimer");

}

- (BOOL)printControllerShouldPrintReader:(id)a3
{
  BOOL showingReader;
  id WeakRetained;
  void *v6;
  void *v7;

  if (self->_showingReader)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "presentedActivityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "customizationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    showingReader = objc_msgSend(v7, "selectedContentType") == 2;

  }
  else
  {
    showingReader = self->_showingReader;
  }

  return showingReader;
}

- (void)printController:(id)a3 didCreatePrintInfo:(id)a4
{
  -[SFQuickLookDocument addQuickLookPrintSettingsToPrintInfo:](self->_quickLookDocument, "addQuickLookPrintSettingsToPrintInfo:", a4);
}

- (BOOL)printControllerCanPresentPrintUI:(id)a3
{
  char v4;
  id WeakRetained;

  if (self->_shouldSuppressDialogsThatBlockWebProcessForProvisionalNavigation
    || -[TabDocument shouldObscureForDigitalHealth](self, "shouldObscureForDigitalHealth", a3))
  {
    return 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "tabDocumentCanDisplayModalUI:", self);

  return v4;
}

- (id)presentingViewControllerForPrintController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)URLStringForPrintController:(id)a3
{
  -[TabDocument URLString](self, "URLString", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pageTitleForPrintController:(id)a3
{
  -[TabDocument titleForSharing](self, "titleForSharing", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)loadingDialogPageTitleForPrintController:(id)a3
{
  -[TabDocument titleForNewBookmark](self, "titleForNewBookmark", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)dialogController:(id)a3 presentationPolicyForDialog:(id)a4
{
  id v5;
  int v6;
  id WeakRetained;
  int64_t v8;
  int v9;

  v5 = a4;
  v6 = objc_msgSend(v5, "completionHandlerBlocksWebProcess") ^ 1;
  if (!self)
    LOBYTE(v6) = 1;
  if ((v6 & 1) == 0
    && (self->_shouldSuppressDialogsThatBlockWebProcessForProvisionalNavigation || self->_showingReader))
  {
    v8 = 1;
    goto LABEL_14;
  }
  if (objc_msgSend(v5, "presentationStyle") != 1)
    goto LABEL_7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "tabDocumentCanDisplayModalUI:", self))
  {

LABEL_7:
    v8 = 0;
    goto LABEL_14;
  }
  v9 = objc_msgSend(v5, "shouldIgnoreGlobalModalUIDisplayPolicy");

  if (v9)
    v8 = 0;
  else
    v8 = 2;
LABEL_14:

  return v8;
}

- (void)dialogController:(id)a3 willPresentDialog:(id)a4
{
  id WeakRetained;

  self->_showingInlineDialog = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentWillShowInlineDialog:", self);

}

- (void)dialogController:(id)a3 didDismissDialog:(id)a4
{
  id WeakRetained;

  self->_showingInlineDialog = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentWillDismissInlineDialog:", self);

}

- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocument:presentViewControllerAnimated:", self, v9);

  objc_msgSend(v9, "_sf_animateAlongsideTransitionOrPerform:", v7);
}

- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocument:dismissViewControllerAnimated:", self, v9);

  objc_msgSend(v9, "_sf_animateAlongsideTransitionOrPerform:", v7);
}

- (void)pageLoadErrorControllerDidAddAlert:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentDidAddAlert:", self);

}

- (BOOL)pageLoadErrorControllerShouldHandleCertificateError:(id)a3
{
  TabDocument *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "tabDocumentShouldHandleCertificateError:", v3);

  return (char)v3;
}

- (void)pageLoadErrorController:(id)a3 loadFailedRequestAfterError:(id)a4
{
  id v5;
  id v6;

  objc_msgSend(a3, "failedRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[TabDocument loadRequest:userDriven:](self, "loadRequest:userDriven:");

}

- (id)pageLoadErrorControllerGetSecIdentityPreferencesController:(id)a3
{
  _SFSecIdentityPreferencesController *v4;
  _SFSecIdentityPreferencesController *secIdentityPreferencesController;

  if (!self->_secIdentityPreferencesController)
  {
    if (-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled", a3))
      objc_msgSend(MEMORY[0x1E0CD57A8], "ephemeralSecIdentityPreferencesController");
    else
      objc_msgSend(MEMORY[0x1E0CD57A8], "sharedPersistentSecIdentityPreferencesController");
    v4 = (_SFSecIdentityPreferencesController *)objc_claimAutoreleasedReturnValue();
    secIdentityPreferencesController = self->_secIdentityPreferencesController;
    self->_secIdentityPreferencesController = v4;

  }
  return self->_secIdentityPreferencesController;
}

- (void)pageLoadErrorControllerClosePage:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeTab:animated:", self, 1);

}

- (void)pageLoadErrorControllerReloadWithoutPrivateRelay:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D8AB28], "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rememberPrivateRelayFailClosedExceptionForURL:", v5);

  -[TabDocument reloadEnablingDowngradedPrivateRelay:](self, "reloadEnablingDowngradedPrivateRelay:", 1);
}

- (void)pageLoadErrorController:(id)a3 presentViewController:(id)a4
{
  TabDocumentDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "tabDocument:presentViewControllerAnimated:", self, v6);

}

- (BOOL)pageLoadErrorControllerShouldPermanentlyAcceptCertificate:(id)a3
{
  return !-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled", a3);
}

- (BOOL)pageLoadErrorControllerShouldReloadAfterError:(id)a3
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = objc_msgSend(WeakRetained, "isSuspendedOrSuspending") ^ 1;

  return v4;
}

- (BOOL)pageLoadErrorControllerIsInPreviewMode:(id)a3
{
  return self->_linkPreviewViewController != 0;
}

- (void)pageLoadErrorController:(id)a3 allowLegacyTLSConnectionForURL:(id)a4 navigateToURL:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a4;
  v7 = a5;
  +[Application sharedApplication](Application, "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legacyTLSHostManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allowLegacyTLSForHost:", v10);

  v11 = -[TabDocument loadURL:userDriven:](self, "loadURL:userDriven:", v7, 1);
}

- (void)clearReaderScrollInformation
{
  NSDictionary *initialArticleScrollDictionaryForCloudTab;

  initialArticleScrollDictionaryForCloudTab = self->_initialArticleScrollDictionaryForCloudTab;
  self->_initialArticleScrollDictionaryForCloudTab = 0;

  self->_readerViewTopScrollOffset = 0;
}

- (void)updateReadingListItemPreviewText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[TabDocument readingListBookmarkID](self, "readingListBookmarkID");
  -[TabDocument titleForNewBookmark](self, "titleForNewBookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection updateReadingListBookmarkWithID:setTitle:address:previewText:thumbnailURL:siteName:](v8, v4, v5, v7, v9, 0, 0);

}

- (void)didActivateReader
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (-[TabDocument shouldActivateReaderWhenAvailable](self, "shouldActivateReaderWhenAvailable")
    && (objc_msgSend(WeakRetained, "readerShouldBeShownIfPossible") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "setReaderShouldBeShownIfPossible:", 1);
  }
  objc_msgSend(WeakRetained, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveTabDocumentUserActivitySoon:", self);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportTabUpdatedWithUpdateType:", 9);

}

- (void)_detectWebpageLocaleWithTextSamples:(void *)a3 url:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v7 = (void *)a1[125];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__TabDocument__detectWebpageLocaleWithTextSamples_url___block_invoke;
    v8[3] = &unk_1E9CF3E48;
    objc_copyWeak(&v10, &location);
    v9 = v6;
    objc_msgSend(v7, "setWebpageLocaleWithExtractedTextSamples:url:completionHandler:", v5, v9, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __55__TabDocument__detectWebpageLocaleWithTextSamples_url___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TabDocument__detectWebpageLocaleWithTextSamples_url___block_invoke_2;
  block[3] = &unk_1E9CF41C8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __55__TabDocument__detectWebpageLocaleWithTextSamples_url___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(_QWORD *)(a1 + 32) && objc_msgSend(WeakRetained, "allowsBrowsingAssistant"))
    objc_msgSend(WeakRetained[129], "checkForAssistantContentFromPegasusForURL:locale:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)readerController:(id)a3 didDetermineAdditionalTextSamples:(id)a4 dueTo:(int64_t)a5
{
  WBSTranslationContext *translationContext;
  void *v7;
  id v8;

  translationContext = self->_translationContext;
  objc_msgSend(a4, "textSamples", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TabDocument URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTranslationContext setWebpageLocaleWithExtractedTextSamples:url:completionHandler:](translationContext, "setWebpageLocaleWithExtractedTextSamples:url:completionHandler:", v8, v7, 0);

}

- (void)readerController:(id)a3 didDetermineReaderAvailability:(id)a4 dueTo:(int64_t)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  TabDocument *v11;
  void *v12;
  int v13;
  _BOOL4 shouldRestoreReader;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WBSBrowsingAssistantController *v20;
  WBSBrowsingAssistantController *assistantController;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD aBlock[4];
  id v32;
  char v33;
  id location;

  v7 = a4;
  v8 = objc_msgSend(v7, "isReaderAvailable");
  self->_hasDoneReaderAvailabilityDetection = 1;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didDetermineReaderAvailability:", v8);

  if (a5 == 2)
    goto LABEL_43;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (objc_msgSend(WeakRetained, "isReaderViewStale"))
  {
    objc_msgSend(WeakRetained, "nextContinuousItemDocument");
    v11 = (TabDocument *)objc_claimAutoreleasedReturnValue();

    if (v11 != self)
    {
      if ((_DWORD)v8)
        -[_SFReaderController loadNewArticle](self->_readerContext, "loadNewArticle");
      else
        objc_msgSend(WeakRetained, "hideReaderForTabDocument:animated:deactivationMode:", self, 1, 0);
      objc_msgSend(WeakRetained, "setReaderViewStale:", 0);
    }
  }
  -[TabDocument URL](self, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TabDocument readingListBookmarkID](self, "readingListBookmarkID")
    && !self->_wasOpenedFromHistory
    && (objc_msgSend(v12, "isFileURL") & 1) == 0)
  {
    -[TabDocument collectReadingListItemInfo](self, "collectReadingListItemInfo");
  }
  if (-[TabDocument shouldActivateReaderWhenAvailable](self, "shouldActivateReaderWhenAvailable")
    && objc_msgSend(WeakRetained, "readerShouldBeShownIfPossible"))
  {
    v13 = objc_msgSend(WeakRetained, "isShowingReader") ^ 1;
  }
  else
  {
    v13 = 0;
  }
  if (!self->_active)
  {
    shouldRestoreReader = 0;
    if ((v8 & 1) != 0)
      goto LABEL_18;
LABEL_24:
    if (a5 == 1 && -[TabDocument isShowingReader](self, "isShowingReader"))
      goto LABEL_29;
    -[TabDocument clearReaderScrollInformation](self, "clearReaderScrollInformation");
    -[TabDocument clearReaderContext](self, "clearReaderContext");
    goto LABEL_27;
  }
  shouldRestoreReader = self->_shouldRestoreReader;
  if ((v8 & 1) == 0)
    goto LABEL_24;
LABEL_18:
  if ((v13 | shouldRestoreReader) != 1)
  {
    -[TabDocument clearReaderScrollInformation](self, "clearReaderScrollInformation");
    -[_SFReaderController clearUnusedReaderResourcesSoon](self->_readerContext, "clearUnusedReaderResourcesSoon");
    goto LABEL_29;
  }
  if (self->_active)
  {
    objc_msgSend(WeakRetained, "setShowingReader:animated:", 1, 1);
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didActivateReaderWithTrigger:", 2);

  }
  if (!shouldRestoreReader)
    goto LABEL_29;
LABEL_27:
  self->_shouldRestoreReader = 0;
LABEL_29:
  objc_msgSend(v7, "textSamples");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument _detectWebpageLocaleWithTextSamples:url:](self, v16, v12);

  +[Application sharedApplication](Application, "sharedApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "systemNoteTakingController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "canonicalURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cacheCanonicalURL:forWebPageURL:", v19, v12);

  -[TabDocument restoreAllHighlightsData](self, "restoreAllHighlightsData");
  if (!self->_assistantController)
  {
    v20 = (WBSBrowsingAssistantController *)objc_alloc_init(MEMORY[0x1E0D8A7F8]);
    assistantController = self->_assistantController;
    self->_assistantController = v20;

    -[WBSBrowsingAssistantController setDelegate:](self->_assistantController, "setDelegate:", self);
  }
  if (!-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
  {
    -[NSUUID UUIDString](self->_biomeWebpageIdentifier, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSBrowsingAssistantController setWebpageIdentifier:](self->_assistantController, "setWebpageIdentifier:", v22);

    -[NSUUID UUIDString](self->_biomeWebpageIdentifier, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarItem setWebpageIdentifier:](self->_navigationBarItem, "setWebpageIdentifier:", v23);

  }
  if ((_DWORD)v8)
    -[WBSBrowsingAssistantController didFindLocalContentWithOptions:forURL:](self->_assistantController, "didFindLocalContentWithOptions:forURL:", 32, v12);
  -[WBSBrowsingAssistantController setCachedReaderArticleTitle:](self->_assistantController, "setCachedReaderArticleTitle:", 0);
  if (self->_active)
  {
    -[TabDocument URLForPerSitePreferences](self, "URLForPerSitePreferences");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safari_userVisibleHostWithoutWWWSubdomain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v25, "length") || a5 == 1 && self->_lastReaderDeactivationMode == 1)
    {
      -[TabDocument navigationBarItem](self, "navigationBarItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setShowsReaderButton:showsAvailabilityText:", v8, v8);

      v27 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v27, "tabDocument:didDetectReaderAvailability:", self, v8);

    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__TabDocument_readerController_didDetermineReaderAvailability_dueTo___block_invoke;
      aBlock[3] = &unk_1E9CF97C8;
      objc_copyWeak(&v32, &location);
      v33 = v8;
      v28 = _Block_copy(aBlock);
      -[TabDocument perSitePreferencesVendor](self, "perSitePreferencesVendor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "automaticReaderActivationManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "getAutomaticReaderEnabledForDomain:usingBlock:", v25, v28);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }

  }
LABEL_43:

}

void __69__TabDocument_readerController_didDetermineReaderAvailability_dueTo___block_invoke(uint64_t a1, char a2)
{
  _QWORD v4[4];
  id v5;
  char v6;
  char v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__TabDocument_readerController_didDetermineReaderAvailability_dueTo___block_invoke_2;
  v4[3] = &unk_1E9CF97A0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v6 = *(_BYTE *)(a1 + 40);
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
}

void __69__TabDocument_readerController_didDetermineReaderAvailability_dueTo___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  int v6;
  char v7;
  int v8;
  id v9;
  void *v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationBarItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsReaderButton:showsAvailabilityText:");

    v5 = objc_loadWeakRetained(v11 + 149);
    objc_msgSend(v5, "tabDocument:didDetectReaderAvailability:", v11, *(unsigned __int8 *)(a1 + 40));

    v3 = v11;
    if (*(_BYTE *)(a1 + 41))
    {
      v6 = objc_msgSend(v11, "isReaderAvailable");
      v3 = v11;
      if (v6)
      {
        v7 = objc_msgSend(v11, "isShowingReader");
        v3 = v11;
        if ((v7 & 1) == 0)
        {
          v8 = objc_msgSend(v11, "isActive");
          v3 = v11;
          if (v8)
          {
            v9 = objc_loadWeakRetained(v11 + 117);
            objc_msgSend(v9, "setShowingReader:animated:", 1, 1);

            objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "didActivateReaderWithTrigger:", 1);

            v3 = v11;
          }
        }
      }
    }
  }

}

- (void)readerController:(id)a3 didDeactivateReaderWithMode:(unint64_t)a4
{
  int v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v6 = !-[TabDocument shouldActivateReaderWhenAvailable](self, "shouldActivateReaderWhenAvailable");
  if (a4 != 1)
    LOBYTE(v6) = 1;
  if ((v6 & 1) == 0)
    objc_msgSend(WeakRetained, "setReaderShouldBeShownIfPossible:", 0);
  objc_msgSend(WeakRetained, "setReaderViewStale:", 0);
  objc_msgSend(WeakRetained, "tabController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveTabDocumentUserActivitySoon:", self);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportTabUpdatedWithUpdateType:", 10);

  self->_lastReaderDeactivationMode = a4;
}

- (void)readerController:(id)a3 didClickLinkInReaderWithRequest:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationIntentWithURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "policy"))
  {
    -[TabDocument dispatchNavigationIntent:](self, "dispatchNavigationIntent:", v7);
  }
  else
  {
    -[TabDocument resultOfLoadingURL:](self, "resultOfLoadingURL:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "type") != 3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "hideReaderForTabDocument:animated:deactivationMode:", self, 1, 0);

    }
    objc_msgSend(v12, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TabDocument loadURL:userDriven:](self, "loadURL:userDriven:", v10, 1);

  }
}

- (void)readerController:(id)a3 didClickLinkRequestingNewWindowInReaderWithRequest:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument resultOfLoadingURL:](self, "resultOfLoadingURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") == 3)
  {
    v7 = -[TabDocument loadRequest:userDriven:](self, "loadRequest:userDriven:", v10, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrefersOpenInNewTab:", 1);
    objc_msgSend(v8, "setPreferredTabOrder:", 1);
    objc_msgSend(v8, "navigationIntentWithURL:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument dispatchNavigationIntent:](self, "dispatchNavigationIntent:", v9);

  }
}

- (void)readerController:(id)a3 didTwoFingerTapLinkInReaderWithContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[TabDocument _handleTwoFingerTapOnLinkWithContext:]((uint64_t)self, v6))
  {
    objc_msgSend(v6, "navigationAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument readerController:didClickLinkInReaderWithRequest:](self, "readerController:didClickLinkInReaderWithRequest:", v9, v8);

  }
}

- (void)readerController:(id)a3 didExtractArticleText:(id)a4 withMetadata:(id)a5
{
  TabDocumentDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "tabDocument:didExtractArticleText:withMetadata:", self, v9, v8);

  if (self->_donateTextTimer)
    -[TabDocument _donateTextAllowingDonationWithoutReaderText:]((id *)&self->super.isa, 1);
}

- (void)filteredArticleTextDidBecomeReadyForReaderController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "filteredArticleTextDidBecomeReadyInTabDocument:", self);

}

- (void)didFindSummarizationRestrictionsForReaderController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v9);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "rootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)readerController:(id)a3 didFinishOnDemandSummarization:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  if (objc_msgSend(v5, "isSafe"))
  {
    objc_msgSend(v5, "summary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument _setReaderArticleSummary:]((uint64_t)self, v6);

  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke;
    v7[3] = &unk_1E9CF3358;
    v7[4] = self;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

- (void)_setReaderArticleSummary:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[16];

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 288);
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1032), "tableOfContentsTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1032), "tableOfContentsPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1032), "tableOfContentsTrailingTexts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArticleSummary:withSummaryHeader:tableOfContentsHeader:readerURLString:titles:paths:trailingText:", v3, v5, v6, &stru_1E9CFDBB0, v7, v8, v9);

    v10 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v10, OS_LOG_TYPE_INFO, "Safari did display summary", buf, 2u);
    }
  }

}

void __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];

  v2 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke_2;
  v18[3] = &unk_1E9CF3290;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke_3;
  v16[3] = &unk_1E9CF97F0;
  v12 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v12;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v13);
  objc_msgSend(v5, "setPreferredAction:", v13);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
  objc_msgSend(WeakRetained, "rootViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", v5, 1, 0);

}

void __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1192));
  objc_msgSend(WeakRetained, "tabDocumentDidCancelSummarization:", *(_QWORD *)(a1 + 32));

}

void __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "summary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[TabDocument _setReaderArticleSummary:](v1, v2);

}

- (WBSHistoryContextController)contextController
{
  WBSHistoryContextController *v3;
  WBSHistoryContextController *contextController;
  id v5;
  void *v6;
  void *v7;
  WBSHistoryContextController *v8;
  WBSHistoryContextController *v9;

  if (+[Application systemMemorySize](Application, "systemMemorySize") >= 0x40000001)
  {
    contextController = self->_contextController;
    if (!contextController)
    {
      v5 = objc_alloc(MEMORY[0x1E0D8A9A0]);
      +[History sharedHistory](History, "sharedHistory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[Application contextClient](Application, "contextClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (WBSHistoryContextController *)objc_msgSend(v5, "initWithHistory:contextClient:", v6, v7);
      v9 = self->_contextController;
      self->_contextController = v8;

      contextController = self->_contextController;
    }
    v3 = contextController;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isShowingReadingListArchive
{
  void *v3;
  char v4;

  if (!-[TabDocument readingListBookmarkID](self, "readingListBookmarkID"))
    return 0;
  -[TabDocument URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFileURL");

  return v4;
}

- (id)readerPageArchiveURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v8;

  if (!-[TabDocument readingListBookmarkID](self, "readingListBookmarkID"))
    return 0;
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkWithID:", -[TabDocument readingListBookmarkID](self, "readingListBookmarkID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  objc_msgSend(v4, "webarchivePathInReaderForm:fileExists:", 1, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)prepareToUseReader
{
  if (-[TabDocument isReaderAvailable](self, "isReaderAvailable"))
  {
    if (-[_SFReaderController shouldCreateArticleFinder](self->_readerContext, "shouldCreateArticleFinder"))-[_SFReaderController createArticleFinder](self->_readerContext, "createArticleFinder");
  }
}

- (void)createBrowserReaderViewIfNeeded
{
  -[TabDocument _createBrowserReaderViewIfNeeded]((uint64_t)self);
  -[TabDocument didActivateReader](self, "didActivateReader");
}

- (void)_createBrowserReaderViewIfNeeded
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;

  if (a1 && !*(_QWORD *)(a1 + 1360))
  {
    v26 = objc_alloc_init(MEMORY[0x1E0CEF638]);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 936));
    objc_msgSend(WeakRetained, "processPool");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setProcessPool:", v3);

    objc_msgSend(v26, "_setRelatedWebView:", *(_QWORD *)(a1 + 1008));
    objc_msgSend(v26, "_setAlternateWebViewForNavigationGestures:", *(_QWORD *)(a1 + 1008));
    objc_msgSend(v26, "_setGroupIdentifier:", *MEMORY[0x1E0CD58F0]);
    objc_msgSend(*(id *)(a1 + 1008), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "websiteDataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWebsiteDataStore:", v5);

    _SFApplicationNameForUserAgent();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setApplicationNameForUserAgent:", v6);

    objc_msgSend(v26, "_setNeedsStorageAccessFromFileURLsQuirk:", 0);
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_readerUserContentController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUserContentController:", v7);

    v8 = objc_alloc(MEMORY[0x1E0CD5800]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = objc_msgSend(v8, "initWithFrame:configuration:", v26);
    v11 = *(void **)(a1 + 1360);
    *(_QWORD *)(a1 + 1360) = v10;

    webViewToTabDocumentMap();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", a1, *(_QWORD *)(a1 + 1360));

    objc_msgSend(*(id *)(a1 + 216), "setReaderWebView:", *(_QWORD *)(a1 + 1360));
    objc_msgSend(*(id *)(a1 + 216), "setWebView:", *(_QWORD *)(a1 + 1008));
    _SFCustomUserAgentStringIfNeeded();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(*(id *)(a1 + 1360), "_setCustomUserAgent:", v13);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 1360), "_grantAccessToAssetServices");
    objc_msgSend(*(id *)(a1 + 1360), "_setBackgroundExtendsBeyondPage:", 1);
    objc_msgSend(*(id *)(a1 + 1360), "setNavigationDelegate:", *(_QWORD *)(a1 + 288));
    objc_msgSend(*(id *)(a1 + 1360), "setUIDelegate:", *(_QWORD *)(a1 + 288));
    objc_msgSend(*(id *)(a1 + 1360), "setAllowsLinkPreview:", 1);
    objc_msgSend(*(id *)(a1 + 1360), "_setFindInteractionEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 1360), "setAccessibilityIdentifier:", CFSTR("ReaderView"));
    objc_msgSend(*(id *)(a1 + 1360), "setInspectable:", objc_msgSend((id)a1, "allowsRemoteInspection"));
    objc_msgSend(*(id *)(a1 + 1360), "addObserver:forKeyPath:options:context:", a1, CFSTR("_isPlayingAudio"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 1360), "addObserver:forKeyPath:options:context:", a1, CFSTR("underPageBackgroundColor"), 0, kTabDocumentObserverContext);
    objc_msgSend(*(id *)(a1 + 288), "didCreateReaderWebView:", *(_QWORD *)(a1 + 1360));
    v14 = *(void **)(a1 + 288);
    v15 = *(_QWORD *)(a1 + 1136);
    objc_msgSend(v14, "configurationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationToSendToWebPage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setReaderInitialTopScrollOffset:configuration:isViewingArchive:scrollOffsetDictionary:", v15, v17, objc_msgSend((id)a1, "isShowingReadingListArchive"), *(_QWORD *)(a1 + 176));

    objc_msgSend((id)a1, "clearReaderScrollInformation");
    objc_msgSend(*(id *)(a1 + 288), "readerURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "sf_isOfflineReadingListURL"))
    {
      v19 = *(void **)(a1 + 1360);
      v20 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0DCCBA0], "readingListArchivesDirectoryPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fileURLWithPath:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v19, "loadFileURL:allowingReadAccessToURL:", v18, v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument _requestBySettingAdvancedPrivacyProtectionsFlag:]((void *)a1, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (id)objc_msgSend(*(id *)(a1 + 1360), "loadRequest:", v21);
    }

  }
}

- (void)clearReaderView
{
  _SFWebView *readerWebView;

  -[_SFWebView removeObserver:forKeyPath:context:](self->_readerWebView, "removeObserver:forKeyPath:context:", self, CFSTR("underPageBackgroundColor"), kTabDocumentObserverContext);
  -[_SFWebView removeObserver:forKeyPath:context:](self->_readerWebView, "removeObserver:forKeyPath:context:", self, CFSTR("_isPlayingAudio"), kTabDocumentObserverContext);
  -[_SFWebView _close](self->_readerWebView, "_close");
  readerWebView = self->_readerWebView;
  self->_readerWebView = 0;

}

- (void)collectReadingListItemInfo
{
  uint64_t v3;

  LODWORD(v3) = -[TabDocument readingListBookmarkID](self, "readingListBookmarkID");
  -[_SFReaderController collectReadingListInfoWithBookmarkID:completionHandler:](self->_readerContext, "collectReadingListInfoWithBookmarkID:completionHandler:", MEMORY[0x1E0C809B0], 3221225472, __41__TabDocument_collectReadingListItemInfo__block_invoke, &unk_1E9CF9818, self, v3);
}

void __41__TabDocument_collectReadingListItemInfo__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  if (*(_DWORD *)(a1 + 40) == a3)
  {
    v7 = v5;
    objc_msgSend(v5, "objectForKey:", CFSTR("previewText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updateReadingListItemPreviewText:", v6);

    v5 = v7;
  }

}

- (id)readerURLForReaderController:(id)a3
{
  void *v4;
  void *v5;

  if (-[TabDocument isShowingReadingListArchive](self, "isShowingReadingListArchive", a3))
  {
    -[TabDocument readerPageArchiveURL](self, "readerPageArchiveURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TabDocument urlForSharing](self, "urlForSharing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_URLByReplacingSchemeWithString:", *MEMORY[0x1E0CD58F8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)createReaderWebViewForReaderController:(id)a3
{
  -[TabDocument prepareToUseReader](self, "prepareToUseReader", a3);
  -[TabDocument _createBrowserReaderViewIfNeeded]((uint64_t)self);
}

- (void)presentDialog:(id)a3 sender:(id)a4
{
  -[SFDialogController presentDialog:](self->_dialogController, "presentDialog:", a3, a4);
}

- (id)permissionDialogThrottler
{
  WBSPermissionDialogThrottler *permissionDialogThrottler;
  WBSPermissionDialogThrottler *v4;
  WBSPermissionDialogThrottler *v5;

  permissionDialogThrottler = self->_permissionDialogThrottler;
  if (!permissionDialogThrottler)
  {
    v4 = (WBSPermissionDialogThrottler *)objc_alloc_init(MEMORY[0x1E0D8AAE8]);
    v5 = self->_permissionDialogThrottler;
    self->_permissionDialogThrottler = v4;

    permissionDialogThrottler = self->_permissionDialogThrottler;
  }
  return permissionDialogThrottler;
}

- (void)fetchMetadataForBookmark:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__TabDocument_fetchMetadataForBookmark_completion___block_invoke;
  block[3] = &unk_1E9CF9868;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__TabDocument_fetchMetadataForBookmark_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  int v10;

  objc_msgSend(a1[4], "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = objc_msgSend(a1[5], "identifier");
    v7 = (void *)*((_QWORD *)a1[4] + 36);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__TabDocument_fetchMetadataForBookmark_completion___block_invoke_2;
    v8[3] = &unk_1E9CF9840;
    v10 = v6;
    v9 = a1[6];
    objc_msgSend(v7, "collectReadingListInfoWithBookmarkID:completionHandler:", v6, v8);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __51__TabDocument_fetchMetadataForBookmark_completion___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  if (*(_DWORD *)(a1 + 40) == a3)
  {
    objc_msgSend(v5, "safari_stringForKey:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_stringForKey:", CFSTR("previewText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_stringForKey:", CFSTR("mainImageURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, void *, void *, _QWORD))(v6 + 16))(v6, 1, v7, v8, v9, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0, 0, 0, 0);
  }

}

- (void)_terminateWebProcessThenDoUnresponsiveWebProcessBlock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Killed an unresponsive web process", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_unresponsiveWebProcessTimerFired:(id)a3
{
  NSObject *v4;
  _SFWebView *webView;
  _SFWebView *v6;
  int v7;
  TabDocument *v8;
  __int16 v9;
  _SFWebView *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (id)WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    webView = self->_webView;
    v7 = 134218496;
    v8 = self;
    v9 = 2048;
    v10 = webView;
    v11 = 1024;
    v12 = -[_SFWebView _webProcessIsResponsive](webView, "_webProcessIsResponsive");
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "TabDocument %p: unresponsive web process timer fired. webview=%p, responsive=%d", (uint8_t *)&v7, 0x1Cu);
  }

  -[NSTimer invalidate](self->_unresponsiveWebProcessTimer, "invalidate");
  v6 = self->_webView;
  if (v6)
  {
    if ((-[_SFWebView _webProcessIsResponsive](v6, "_webProcessIsResponsive") & 1) == 0)
      -[TabDocument _terminateWebProcessThenDoUnresponsiveWebProcessBlock]((uint64_t)self);
  }
}

- (id)_tabDocumentsSharingWebProcess
{
  void *v1;
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  id v14;
  _QWORD v15[4];
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = *(void **)(a1 + 1008);
    if (v1)
    {
      v2 = objc_msgSend(v1, "_webProcessIdentifier");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      +[Application sharedApplication](Application, "sharedApplication");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "browserControllers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v4;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v18;
        v7 = MEMORY[0x1E0C809B0];
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v18 != v6)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "tabController");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "allTabDocuments");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v15[0] = v7;
            v15[1] = 3221225472;
            v15[2] = __45__TabDocument__tabDocumentsSharingWebProcess__block_invoke;
            v15[3] = &__block_descriptor_36_e21_B16__0__TabDocument_8l;
            v16 = v2;
            objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v15);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObjectsFromArray:", v11);

            ++v8;
          }
          while (v5 != v8);
          v4 = obj;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v5);
      }

    }
    else
    {
      v14 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (uint64_t)_terminateWebProcessAndReloadIfActive:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 1008), "_killWebContentProcessAndResetState");
    result = objc_msgSend(*(id *)(v3 + 280), "owningWebViewDidChangeProcessID");
    if (*(_BYTE *)(v3 + 933))
    {
      if (a2)
        return objc_msgSend((id)v3, "reload");
    }
    else
    {
      return objc_msgSend((id)v3, "hibernate");
    }
  }
  return result;
}

BOOL __45__TabDocument__tabDocumentsSharingWebProcess__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_webProcessIdentifier") == *(_DWORD *)(a1 + 32);

  return v4;
}

- (void)updateUsageTrackingInformationAfterLinkPreviewDismissal
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  -[TabDocument browserController](self, "browserController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self);

  v7 = -[TabDocument _usageStateIfTabDocumentIsCurrent:]((uint64_t)self, v6);
  -[TabDocument _updateUsageTrackingInformationIfNecessaryToState:]((uint64_t)self, v7);
}

- (void)_webViewWillEnterElementFullscreen:(id)a3
{
  id WeakRetained;

  -[SFPinnableBanner setHidden:](self->_appBanner, "setHidden:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabDocumentDidUpdateThemeColor:", self);

}

- (void)_webViewDidEnterElementFullscreen:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "updatePullToRefreshIsEnabled");

}

- (void)_webViewWillExitElementFullscreen:(id)a3
{
  -[SFPinnableBanner setHidden:](self->_appBanner, "setHidden:", 0);
  self->_exitingElementFullscreen = 1;
  -[TabDocumentView setWebViewGeometryNeedsUpdate](self->_cachedView, "setWebViewGeometryNeedsUpdate");
}

- (void)_webViewDidExitElementFullscreen:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  self->_exitingElementFullscreen = 0;
  -[TabDocumentView setWebViewGeometryNeedsUpdate](self->_cachedView, "setWebViewGeometryNeedsUpdate", a3);
  -[TabDocument browserController](self, "browserController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restoreInterfaceAfterElementFullscreen");

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "updatePullToRefreshIsEnabled");

  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "tabDocumentDidUpdateThemeColor:", self);

}

- (void)updateAncestryWithParentTab:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *ancestorUUIDs;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v11, "ancestorUUIDs");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v7 = (void *)v5;
    v8 = v7;

    objc_msgSend(v8, "arrayByAddingObject:", v4);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    ancestorUUIDs = self->_ancestorUUIDs;
    self->_ancestorUUIDs = v9;

  }
}

- (void)updateAncestryToChildOfTopLevelAncestorRelatedTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSArray *v11;
  NSArray *ancestorUUIDs;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ancestorUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v5, "uuid");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    ancestorUUIDs = self->_ancestorUUIDs;
    self->_ancestorUUIDs = v11;

  }
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[TabDocument uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)ancestorTabIdentifiers
{
  return (NSArray *)-[NSArray safari_mapObjectsUsingBlock:](self->_ancestorUUIDs, "safari_mapObjectsUsingBlock:", &__block_literal_global_548);
}

id __37__TabDocument_ancestorTabIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "UUIDString");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)windowIdentifier
{
  void *v2;
  void *v3;

  -[TabDocument ownerUUID](self, "ownerUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)canSetPinned
{
  return 1;
}

- (BOOL)shouldSpawnNewTabOnNavigationFromPinnedTabWithDestinationURL:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[TabDocument isPinned](self, "isPinned"))
  {
    if (self->_isBlank)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      -[TabDocument committedURL](self, "committedURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "host");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_highLevelDomainFromHost");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "host");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safari_highLevelDomainFromHost");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = WBSIsEqual() ^ 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)setUnread:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  id v6;

  if (self->_unread != a3)
  {
    v3 = a3;
    self->_unread = a3;
    -[TabBarItem setUnread:](self->_tabBarItem, "setUnread:");
    -[SFUnifiedTabBarItem setUnread:](self->_unifiedTabBarItem, "setUnread:", v3);
    -[TabOverviewItem setUnread:](self->_tabOverviewItem, "setUnread:", v3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "updateTabOverviewButton");

    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "tabDocumentDidUpdateTabCollectionItem:", self);

  }
}

- (void)tabGroupManager:(id)a3 didUpadateActiveParticipants:(id)a4 inTabWithUUID:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[WBTab uuid](self->_tabGroupTab, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v11, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument setShareParticipants:](self, "setShareParticipants:", v10);

  }
}

- (BOOL)shouldSelectOriginatingTabWhenClosed
{
  return -[NSPointerArray count](self->_spawnedTabDocuments, "count") != 0;
}

- (double)lastActivationTime
{
  return self->_lastViewedTime;
}

- (void)translationContextReloadPageInOriginalLanguage:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__TabDocument_translationContextReloadPageInOriginalLanguage___block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__TabDocument_translationContextReloadPageInOriginalLanguage___block_invoke(uint64_t a1)
{
  -[TabDocument _reloadFromOrigin:](*(_QWORD *)(a1 + 32), 0);
}

- (void)translationContext:(id)a3 urlForCurrentPageWithCompletionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__TabDocument_translationContext_urlForCurrentPageWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9CF8D40;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __73__TabDocument_translationContext_urlForCurrentPageWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)translationContext:(id)a3 showFirstTimeConsentAlertWithCompletionHandler:(id)a4
{
  -[TabDocument _presentTranslationConsentAlertWithType:completionHandler:]((uint64_t)self, 0, a4);
}

- (void)_presentTranslationConsentAlertWithType:(void *)a3 completionHandler:
{
  id v5;
  void *v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__TabDocument__presentTranslationConsentAlertWithType_completionHandler___block_invoke;
    block[3] = &unk_1E9CF3CC8;
    block[4] = a1;
    v9 = a2;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)translationContext:(id)a3 showFeedbackConsentAlertWithCompletionHandler:(id)a4
{
  -[TabDocument _presentTranslationConsentAlertWithType:completionHandler:]((uint64_t)self, 1, a4);
}

- (id)safariApplicationVersionForTranslationContext:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_normalizedVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)translationContext:(id)a3 showTranslationErrorAlertWithTitle:(id)a4 message:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__TabDocument_translationContext_showTranslationErrorAlertWithTitle_message___block_invoke;
  v8[3] = &unk_1E9CF3358;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __77__TabDocument_translationContext_showTranslationErrorAlertWithTitle_message___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D4EC48]);
    objc_msgSend(v3, "setMessageType:", 1);
    objc_msgSend(v3, "setBannerText:manuallyWrappedBannerText:", *(_QWORD *)(a1 + 40), 0);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
    objc_msgSend(WeakRetained, "showCrashBanner:animated:", v3, 1);

  }
}

- (void)translationContext:(id)a3 shouldReportProgressInUnifiedField:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__TabDocument_translationContext_shouldReportProgressInUnifiedField___block_invoke;
  v4[3] = &unk_1E9CF3818;
  v4[4] = self;
  v5 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __69__TabDocument_translationContext_shouldReportProgressInUnifiedField___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 736) = *(_BYTE *)(result + 40);
  return result;
}

- (void)translationContextNeedsScrollHeightVisibilityUpdate:(id)a3
{
  -[TabDocument _updateMaxVisibleHeightPercentageUserDriven:]((id *)&self->super.isa, 0);
}

- (void)_updateMaxVisibleHeightPercentageUserDriven:(id *)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double Height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id WeakRetained;
  CGRect v19;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 117);
    objc_msgSend(WeakRetained, "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "activationState");

    if (!v5)
    {
      objc_msgSend(a1[126], "scrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentSize");
      v8 = v7;
      objc_msgSend(WeakRetained, "rootViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "toolbarPlacement") == 1)
      {
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bounds");
        Height = CGRectGetHeight(v19);
        objc_msgSend(v10, "bounds");
        objc_msgSend(v9, "obscuredInsetsForRect:inCoordinateSpace:", v10);
        objc_msgSend(v10, "convertPoint:toView:", v6, 0.0, Height - v12);
        v14 = v13;

      }
      else
      {
        objc_msgSend(v6, "contentOffset");
        v16 = v15;
        objc_msgSend(a1[126], "frame");
        v14 = v16 + v17;
      }
      objc_msgSend(a1[125], "updateMaxVisibleHeightPercentageIfNeeded:userDriven:", a2, v14 / v8);

    }
  }
}

- (void)translationContextWillRequestTranslatingWebpage:(id)a3
{
  SafariShared::ReaderAvailabilityController *v3;
  WKProcessPool *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "processPool");
  v3 = (SafariShared::ReaderAvailabilityController *)objc_claimAutoreleasedReturnValue();
  SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(v3, v4);

}

- (void)_translationContextStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__TabDocument__translationContextStateDidChange___block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __49__TabDocument__translationContextStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setShowsTranslationIcon:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "hasStartedTranslating"));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1224);
  objc_msgSend(*(id *)(v2 + 1000), "webpageLocale");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpFormTelemetryDataMonitorWithWebpageLocale:");

}

void __73__TabDocument__presentTranslationConsentAlertWithType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__552;
  v17 = __Block_byref_object_dispose__553;
  v18 = objc_alloc_init(MEMORY[0x1E0D8AD50]);
  objc_msgSend((id)v14[5], "setDelegate:", *(_QWORD *)(a1 + 32));
  v2 = (void *)v14[5];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __73__TabDocument__presentTranslationConsentAlertWithType_completionHandler___block_invoke_555;
  v10 = &unk_1E9CF98F8;
  v3 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v12 = &v13;
  objc_msgSend(v2, "consentAlertForType:withCompletionHandler:", v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
  objc_msgSend(WeakRetained, "viewControllerToPresentFrom", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v4, 1, 0);

  _Block_object_dispose(&v13, 8);
}

void __73__TabDocument__presentTranslationConsentAlertWithType_completionHandler___block_invoke_555(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (id)translationConsentAlertHelperViewControllerToPresentDetailsFrom:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)webViewDidScroll
{
  -[TabDocument _updateMaxVisibleHeightPercentageUserDriven:]((id *)&self->super.isa, 1);
}

- (void)webViewDidChangeSize
{
  -[TabDocument _updateMaxVisibleHeightPercentageUserDriven:]((id *)&self->super.isa, 1);
}

- (void)webViewDidIncreaseZoom
{
  NSDate *v3;
  NSDate *lastWebViewIncreaseZoomDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastWebViewIncreaseZoomDate = self->_lastWebViewIncreaseZoomDate;
  self->_lastWebViewIncreaseZoomDate = v3;

}

- (void)setSuppressWebExtensionEvents:(BOOL)a3
{
  NSTimer *fireOnUpdatedWebExtensionEventTimer;

  if (self->_suppressWebExtensionEvents != a3)
  {
    self->_suppressWebExtensionEvents = a3;
    if (a3)
    {
      -[NSTimer invalidate](self->_fireOnUpdatedWebExtensionEventTimer, "invalidate");
      fireOnUpdatedWebExtensionEventTimer = self->_fireOnUpdatedWebExtensionEventTimer;
      self->_fireOnUpdatedWebExtensionEventTimer = 0;

    }
  }
}

- (id)windowForWebExtensionContext:(id)a3
{
  -[TabDocument webExtensionWindow](self, "webExtensionWindow", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)indexInWindowForWebExtensionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[TabDocument webExtensionWindow](self, "webExtensionWindow", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "webExtensionTabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", self);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)parentTabForWebExtensionContext:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originatingTabForTab:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mainWebViewForWebExtensionContext:(id)a3
{
  -[TabDocument webViewForExtensions](self, "webViewForExtensions", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tabTitleForWebExtensionContext:(id)a3
{
  -[TabDocument tabTitle](self, "tabTitle", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)pinForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument setPinned:](self, "setPinned:", 1);
  v5[2](v5, 0);

}

- (void)unpinForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument setPinned:](self, "setPinned:", 0);
  v5[2](v5, 0);

}

- (void)toggleReaderModeForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument toggleReader](self, "toggleReader");
  v5[2](v5, 0);

}

- (void)muteForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument mute](self, "mute");
  v5[2](v5, 0);

}

- (void)unmuteForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument unmute](self, "unmute");
  v5[2](v5, 0);

}

- (id)urlForWebExtensionContext:(id)a3
{
  -[TabDocument urlForExtensions](self, "urlForExtensions", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pendingURLForWebExtensionContext:(id)a3
{
  -[TabDocument pendingURLForWebExtensions](self, "pendingURLForWebExtensions", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)detectWebpageLocaleForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;

  v5 = a4;
  -[TabDocument translationContext](self, "translationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__TabDocument_detectWebpageLocaleForWebExtensionContext_completionHandler___block_invoke;
  aBlock[3] = &unk_1E9CF40E8;
  v8 = v6;
  v27 = v8;
  v9 = v5;
  v28 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = objc_msgSend(v8, "state");
  if (v11 != 5 && v11)
  {
    v10[2](v10);
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__552;
    v24 = __Block_byref_object_dispose__553;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D8B6D0];
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __75__TabDocument_detectWebpageLocaleForWebExtensionContext_completionHandler___block_invoke_2;
    v17[3] = &unk_1E9CF9920;
    v19 = &v20;
    v18 = v10;
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v14, v8, v13, v17);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v21[5];
    v21[5] = v15;

    _Block_object_dispose(&v20, 8);
  }

}

void __75__TabDocument_detectWebpageLocaleForWebExtensionContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "webpageLocale");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v6 = (id)v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);
  v5 = v6;
  if (v6)
  {

    v5 = v6;
  }

}

uint64_t __75__TabDocument_detectWebpageLocaleForWebExtensionContext_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadURL:(id)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  id v8;

  v8 = a3;
  v7 = (void (**)(id, _QWORD))a5;
  -[TabDocument loadURL:](self, "loadURL:", v8);
  v7[2](v7, 0);

}

- (void)reloadForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument reload](self, "reload");
  v5[2](v5, 0);

}

- (void)reloadFromOriginForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument reloadFromOrigin](self, "reloadFromOrigin");
  v5[2](v5, 0);

}

- (void)goBackForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument goBack](self, "goBack");
  v5[2](v5, 0);

}

- (void)goForwardForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument goForward](self, "goForward");
  v5[2](v5, 0);

}

- (void)activateForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument select](self, "select");
  v5[2](v5, 0);

}

- (void)selectForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument select](self, "select");
  v5[2](v5, 0);

}

- (void)closeForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[TabDocument close](self, "close");
  v5[2](v5, 0);

}

- (BOOL)shouldGrantTabPermissionsOnUserGestureForWebExtensionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument urlForExtensions](self, "urlForExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8ADA0], "webExtensionForWebKitExtensionContext:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "domainIsDenied:forComposedIdentifier:", v7, v9) ^ 1;

  return v10;
}

- (double)idForWebExtensions
{
  return self->_idForWebExtensions;
}

- (WKWebView)webViewForExtensions
{
  return (WKWebView *)self->_webView;
}

- (NSURL)pendingURLForWebExtensions
{
  void *v3;

  if (-[TabDocument isLoading](self, "isLoading"))
  {
    -[TabDocument urlForExtensions](self, "urlForExtensions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSURL *)v3;
}

- (BOOL)isLoadingComplete
{
  return !-[TabDocument isLoading](self, "isLoading");
}

- (BOOL)isMuted
{
  return -[_SFWebView _mediaMutedState](self->_webView, "_mediaMutedState") & 1;
}

- (BOOL)isFrontmost
{
  void *v3;
  char v4;

  +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTabSuspended:", self);

  return (v4 & 1) == 0 && -[TabDocument isActive](self, "isActive");
}

- (CGSize)tabViewSize
{
  TabDocumentView *cachedView;
  double v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  cachedView = self->_cachedView;
  if (cachedView)
  {
    -[TabDocumentView bounds](cachedView, "bounds");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "webExtensionTabSize");
    v5 = v9;
    v7 = v10;

  }
  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (WBSWebExtensionWindow)webExtensionWindow
{
  void *v3;
  char v4;
  void *v5;
  id WeakRetained;

  +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTabSuspended:", self);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "webExtensionWindowForTab:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (WBSWebExtensionWindow *)v5;
}

- (void)loadURL:(id)a3
{
  id v3;

  v3 = -[TabDocument loadURL:userDriven:](self, "loadURL:userDriven:", a3, 1);
}

- (void)select
{
  char v3;
  void *v4;
  id v5;
  id WeakRetained;

  +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "isTabSuspended:", self);

  if ((v3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveTabDocument:", self);

  }
}

- (void)mute
{
  if (!-[TabDocument isMuted](self, "isMuted"))
  {
    -[_SFWebView _setPageMuted:](self->_webView, "_setPageMuted:", 1);
    if (self->_audioState != 2)
    {
      self->_audioState = 2;
      -[TabDocument mediaStateDidChangeNeedsDelay:]((uint64_t)self);
    }
  }
}

- (void)unmute
{
  if (-[TabDocument isMuted](self, "isMuted"))
  {
    -[_SFWebView _setPageMuted:](self->_webView, "_setPageMuted:", 0);
    if (self->_audioState != 1)
    {
      self->_audioState = 1;
      -[TabDocument mediaStateDidChangeNeedsDelay:]((uint64_t)self);
    }
  }
}

- (BOOL)isInReaderMode
{
  return self->_showingReader;
}

- (void)toggleReader
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "setShowingReader:animated:forTabDocument:", !self->_showingReader, 1, self);

}

- (void)evictFromTabReuse
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__TabDocument_evictFromTabReuse__block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __32__TabDocument_evictFromTabReuse__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
  objc_msgSend(WeakRetained, "tabController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evictTabDocument:", *(_QWORD *)(a1 + 32));

}

- (void)donateCurrentNavigationWithNavigationResponse:(id)a3
{
  id WeakRetained;
  TabDocument *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "speculativeLoadDocument");
  v6 = (TabDocument *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    objc_storeStrong((id *)&self->_speculativeLoadNavigationResponse, a3);
  }
  else if (self->_shouldDonateResponseForCurrentNavigation)
  {
    -[TabDocument _donateCurrentNavigationWithNavigationResponse:]((id *)&self->super.isa, v7);
  }

}

void __62__TabDocument__donateCurrentNavigationWithNavigationResponse___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "donateNavigationWithURL:userAgent:wasPrivateRelayed:statusCode:", v2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)donateSameDocumentNavigationIfNecessary
{
  self->_shouldDonatePageLoad = 1;
  -[TabDocument _donateCurrentPageLoad]((uint64_t)self);
  self->_shouldDonatePageLoad = 0;
}

- (BOOL)isSearchPage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D8AC30], "sharedRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchProviderForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)dismissSiriReaderMediaSessionImmediately:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[TabDocument _dismissSiriReaderMediaSession]((uint64_t)self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeSiriReaderSessionIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if ((WBSIsEqual() & 1) != 0)
        -[TabDocument _dismissSiriReaderMediaSession]((uint64_t)self);
    }

  }
}

- (void)_dismissSiriReaderMediaSession
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id location[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activeSiriReaderSessionIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v4 = (void *)getSiriReaderConnectionClass(void)::softClass;
    v20 = getSiriReaderConnectionClass(void)::softClass;
    v5 = MEMORY[0x1E0C809B0];
    if (!getSiriReaderConnectionClass(void)::softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = ___ZL28getSiriReaderConnectionClassv_block_invoke_0;
      location[3] = &unk_1E9CF31D8;
      location[4] = &v17;
      ___ZL28getSiriReaderConnectionClassv_block_invoke_0((uint64_t)location);
      v4 = (void *)v18[3];
    }
    v6 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v17, 8);
    v7 = objc_alloc_init(v6);
    objc_initWeak(location, *(id *)(a1 + 272));
    dispatch_get_global_queue(9, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __45__TabDocument__dismissSiriReaderMediaSession__block_invoke;
    block[3] = &unk_1E9CF9998;
    v12 = v7;
    v13 = v3;
    v9 = v3;
    v10 = v7;
    objc_copyWeak(&v15, location);
    v14 = a1;
    dispatch_async(v8, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
}

void __45__TabDocument__dismissSiriReaderMediaSession__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5;
  id v6;
  uint64_t v7;
  id v8[2];

  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "currentPlaybackState");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__TabDocument__dismissSiriReaderMediaSession__block_invoke_2;
  block[3] = &unk_1E9CF9970;
  v8[1] = v3;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_copyWeak(v8, (id *)(a1 + 56));
  v7 = *(_QWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v8);

}

void __45__TabDocument__dismissSiriReaderMediaSession__block_invoke_2(uint64_t a1)
{
  NSObject *This;
  void *v3;
  id WeakRetained;
  uint8_t v5[16];

  if ((unint64_t)(*(_QWORD *)(a1 + 64) - 1) <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "endMediaSessionForIdentifier:", *(_QWORD *)(a1 + 40));
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D7CA3000, This, OS_LOG_TYPE_DEFAULT, "Safari requested dismissing playback", v5, 2u);
    }
    objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCurrentPlaybackState:", 3);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 272), "setShowsSiriReaderPlayingIcon:", 0);

  }
}

- (void)updateShowsSiriReaderPlayingIcon
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__TabDocument_updateShowsSiriReaderPlayingIcon__block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __47__TabDocument_updateShowsSiriReaderPlayingIcon__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 936));
  v3 = objc_msgSend(WeakRetained, "siriReaderPlaybackStateForActiveTab");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setShowsSiriReaderPlayingIcon:", (unint64_t)(v3 - 1) < 2);
}

- (void)updateLockedBrowsingState
{
  void *v3;
  int v4;
  _BOOL8 v5;

  if (-[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPrivateBrowsingLocked");

  }
  else
  {
    v4 = 0;
  }
  if (self->_locked != v4)
  {
    self->_locked = v4;
    v5 = -[TabDocument allowsRemoteInspection](self, "allowsRemoteInspection");
    -[_SFWebView setInspectable:](self->_webView, "setInspectable:", v5);
    -[_SFWebView setInspectable:](self->_readerWebView, "setInspectable:", v5);
    if (v4)
    {
      -[_SFWebView closeAllMediaPresentationsWithCompletionHandler:](self->_webView, "closeAllMediaPresentationsWithCompletionHandler:", &__block_literal_global_563);
      -[_SFWebView pauseAllMediaPlaybackWithCompletionHandler:](self->_webView, "pauseAllMediaPlaybackWithCompletionHandler:", 0);
      -[TabDocument addMediaSuspensionReason:](self, "addMediaSuspensionReason:", 2);
      -[_SFWebView _stopMediaCapture](self->_webView, "_stopMediaCapture");
    }
    else
    {
      -[TabDocument removeMediaSuspensionReason:](self, "removeMediaSuspensionReason:", 2);
      if (self->_active)
        -[SFDialogController owningWebViewWillBecomeActive](self->_dialogController, "owningWebViewWillBecomeActive");
    }
  }
}

- (void)pageContextDataFetcherDidFinishFetching:(id)a3 forURL:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  _SFCalendarEventDetector *calendarEventDetector;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[TabDocument pageContextDataFetcherDidFinishFetching:forURL:withError:].cold.1();
    }

  }
  else
  {
    -[TabDocument webView](self, "webView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "safari_isEqualToURL:", v13);

    if ((v14 & 1) != 0)
    {
      -[TabDocument _backForwardList](self, "_backForwardList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (self)
        v17 = +[Application systemMemorySize](Application, "systemMemorySize") < 0x40000001;
      else
        v17 = 0;
      objc_msgSend(v8, "filteredSchemaData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v17)
      {
        calendarEventDetector = self->_calendarEventDetector;
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("containsSchemaOrg"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFCalendarEventDetector containsCalendarEventForPageWithSchemaOrgMarkup:](calendarEventDetector, "containsCalendarEventForPageWithSchemaOrgMarkup:", v21 != 0);

      }
      -[TabDocument _backForwardList](self, "_backForwardList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 == v16)
      {
        v24 = (void *)MEMORY[0x1E0CD57E0];
        -[TabDocument profileIdentifier]((uint64_t)self);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v25)
          v27 = v25;
        else
          v27 = *MEMORY[0x1E0D89E20];
        objc_msgSend(v24, "searchableItemAttributesForDictionary:profileIdentifier:", v19, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabDocument setSearchableItemAttributes:](self, "setSearchableItemAttributes:", v28);

        -[TabDocument updateUserActivity](self, "updateUserActivity");
      }

    }
  }

}

- (BOOL)canHibernate
{
  BOOL result;
  id WeakRetained;
  TabDocument *v5;

  result = !self->_active
        && !-[TabDocument isLoading](self, "isLoading")
        && !self->_activeDownload
        && (WeakRetained = objc_loadWeakRetained((id *)&self->_browserController),
            objc_msgSend(WeakRetained, "tabDocumentPlayingPIPVideo"),
            v5 = (TabDocument *)objc_claimAutoreleasedReturnValue(),
            v5,
            WeakRetained,
            v5 != self)
        && (-[_SFWebView _isPlayingAudio](self->_webView, "_isPlayingAudio") & 1) == 0
        && !-[_SFWebView cameraCaptureState](self->_webView, "cameraCaptureState")
        && -[_SFWebView microphoneCaptureState](self->_webView, "microphoneCaptureState") == 0;
  return result;
}

- (LPLinkMetadata)linkMetadataForSharing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D8A9E8];
  -[TabDocument urlForSharing](self, "urlForSharing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "linkPresentationIconCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkMetadataForURL:webView:iconCache:", v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v8;
}

- (NSString)addressForNewBookmark
{
  void *v2;
  void *v3;

  -[TabDocument cachedCanonicalURLOrURLForSharing](self, "cachedCanonicalURLOrURLForSharing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_originalDataAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (WBSCloudTab)cloudTab
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;

  -[TabDocument URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFileURL"))
  {
    -[TabDocument URLString](self, "URLString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_bestURLForUserTypedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TabDocument URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A850]), "initWithURL:", v5);
  objc_msgSend(v6, "setUuid:", self->_uuid);
  -[TabDocument titleForCloudTab](self, "titleForCloudTab");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(v6, "setShowingReader:", self->_showingReader);
  -[_SFReaderController scrollPositionInformation](self->_readerContext, "scrollPositionInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReaderScrollPosition:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "windowState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSceneID:", v11);

  objc_msgSend(v6, "setLastViewedTime:", self->_lastViewedTime);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A838]), "initWithParameters:", v6);

  return (WBSCloudTab *)v12;
}

- (BOOL)isReusableForURL:(id)a3 webClipURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  -[TabDocument URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[TabDocument _backForwardList](self, "_backForwardList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "_webkit_URLByRemovingFragment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL _webkit_URLByRemovingFragment](self->_tabReuseURL, "_webkit_URLByRemovingFragment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", v6) & 1) != 0 || (objc_msgSend(v14, "isEqual:", v6) & 1) != 0)
  {
    v15 = 1;
  }
  else if (v7)
  {
    v15 = objc_msgSend(v13, "isEqual:", v7);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)currentHostForScribbleController:(id)a3
{
  void *v3;
  void *v4;

  -[TabDocument expectedOrCurrentURL](self, "expectedOrCurrentURL", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sfScribbleControllerDidEndScribbling:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id WeakRetained;
  id v8;

  -[TabDocument navigationBarItem](self, "navigationBarItem", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayConfiguration:", 0);

  -[TabDocument navigationBarItem](self, "navigationBarItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverlayNarrowConfiguration:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "pageFormatMenuController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissMenu");

  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "tabDocumentDidUpdateIsScribbling:", self);

}

- (void)sfScribbleControllerDidStartScribbling:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  self->_hasEnteredScribbleMode = 1;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didToggleScribbleSBA");

  objc_msgSend(v12, "urlFieldOverlayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument navigationBarItem](self, "navigationBarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverlayConfiguration:", v5);

  objc_msgSend(v12, "urlFieldOverlayNarrowConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument navigationBarItem](self, "navigationBarItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverlayNarrowConfiguration:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "pageFormatMenuController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissMenu");

  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v11, "tabDocumentDidUpdateIsScribbling:", self);

}

- (void)sfScribbleControllerDidUpdateHiddenElementCount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  -[TabDocument navigationBarItem](self, "navigationBarItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasHiddenElements:", objc_msgSend(v11, "hiddenElementCount") != 0);
  if (objc_msgSend(v11, "isScribbling"))
  {
    objc_msgSend(v11, "urlFieldOverlayConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument navigationBarItem](self, "navigationBarItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverlayConfiguration:", v5);

    objc_msgSend(v11, "urlFieldOverlayNarrowConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument navigationBarItem](self, "navigationBarItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOverlayNarrowConfiguration:", v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "pageFormatMenuController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadBrowsingAssistantIfNeeded");

}

- (void)sfScribbleController:(id)a3 presentAlert:(id)a4
{
  TabDocumentDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "tabDocument:presentViewControllerAnimated:", self, v6);

}

- (id)overlayContainerViewForScribbleController:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentAndTopBarsContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)normalBrowsingUserContentControllers
{
  void *v2;
  void *v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedUserContentControllersForAllProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (WBSScribbleQuirksManager)scribbleQuirksManager
{
  void *v2;
  void *v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scribbleQuirksManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSScribbleQuirksManager *)v3;
}

- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager
{
  void *v2;
  void *v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDefinedContentBlockerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSUserDefinedContentBlockerManager *)v3;
}

- (WBSPrivateBrowsingUserDefinedContentBlockerManager)privateBrowsingUserDefinedContentBlockerManager
{
  void *v2;
  void *v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDefinedContentBlockerManagerForPrivateBrowsing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSPrivateBrowsingUserDefinedContentBlockerManager *)v3;
}

- (void)_webView:(id)a3 didAdjustVisibilityWithSelectors:(id)a4
{
  id v4;

  -[TabDocument sfScribbleController](self, "sfScribbleController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCountForElementsHiddenByPaintingAvoidance");

}

- (unint64_t)autoFillFormType
{
  return -[_SFFormAutoFillController autoFillFormType](self->_autoFillController, "autoFillFormType");
}

- (BOOL)hasDoneReaderDetection
{
  return self->_hasDoneReaderAvailabilityDetection;
}

- (NSArray)titleWords
{
  return self->_titleWords;
}

- (void)setTitleWords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 952);
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 960);
}

- (NSString)titleForLastSearch
{
  return self->_titleForLastSearch;
}

- (void)setTitleForLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (NSString)URLStringForLastSearch
{
  return self->_URLStringForLastSearch;
}

- (void)setURLStringForLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (NSArray)URLStringComponents
{
  return self->_URLStringComponents;
}

- (void)setURLStringComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)matchedLastSearch
{
  return self->_matchedLastSearch;
}

- (void)setMatchedLastSearch:(BOOL)a3
{
  self->_matchedLastSearch = a3;
}

- (WBSTranslationContext)translationContext
{
  return self->_translationContext;
}

- (BOOL)wasLoadedWithContentBlockersEnabled
{
  return self->_wasLoadedWithContentBlockersEnabled;
}

- (BOOL)wasLoadedWithPrivateRelay
{
  return self->_wasLoadedWithPrivateRelay;
}

- (BOOL)isNavigatingViaReloadWithoutPrivateRelay
{
  return self->_isNavigatingViaReloadWithoutPrivateRelay;
}

- (void)setIsNavigatingViaReloadWithoutPrivateRelay:(BOOL)a3
{
  self->_isNavigatingViaReloadWithoutPrivateRelay = a3;
}

- (BOOL)wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections
{
  return self->_wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections;
}

- (WBSWebExtensionTabPosition)previousWebExtensionTabPosition
{
  return self->_previousWebExtensionTabPosition;
}

- (void)setPreviousWebExtensionTabPosition:(id)a3
{
  objc_storeStrong((id *)&self->_previousWebExtensionTabPosition, a3);
}

- (WBSBrowsingAssistantController)assistantController
{
  return self->_assistantController;
}

- (TabDocumentCollectionItem)tabCollectionItem
{
  return self->_tabCollectionItem;
}

- (BOOL)hasEnteredScribbleMode
{
  return self->_hasEnteredScribbleMode;
}

- (NSArray)ancestorUUIDs
{
  return self->_ancestorUUIDs;
}

- (NSString)pinnedTitle
{
  return self->_pinnedTitle;
}

- (void)setPinnedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSURL)pinnedURL
{
  return self->_pinnedURL;
}

- (void)setPinnedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (BOOL)suppressWebExtensionEvents
{
  return self->_suppressWebExtensionEvents;
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (TabDocument)parentTabDocumentForBackClosesSpawnedTab
{
  return (TabDocument *)objc_loadWeakRetained((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);
}

- (void)setQuickLookDocument:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookDocument, a3);
}

- (BOOL)wasOpenedFromLink
{
  return self->_wasOpenedFromLink;
}

- (void)setWasOpenedFromLink:(BOOL)a3
{
  self->_wasOpenedFromLink = a3;
}

- (BOOL)shouldRestoreReader
{
  return self->_shouldRestoreReader;
}

- (void)setShouldRestoreReader:(BOOL)a3
{
  self->_shouldRestoreReader = a3;
}

- (int64_t)readerViewTopScrollOffset
{
  return self->_readerViewTopScrollOffset;
}

- (void)setReaderViewTopScrollOffset:(int64_t)a3
{
  self->_readerViewTopScrollOffset = a3;
}

- (void)setAppBanner:(id)a3
{
  objc_storeStrong((id *)&self->_appBanner, a3);
}

- (BOOL)shouldRevealAppLinkBannerForNextCommit
{
  return self->_shouldRevealAppLinkBannerForNextCommit;
}

- (void)setShouldRevealAppLinkBannerForNextCommit:(BOOL)a3
{
  self->_shouldRevealAppLinkBannerForNextCommit = a3;
}

- (BOOL)appBannerRemovalWasDeferred
{
  return self->_appBannerRemovalWasDeferred;
}

- (void)setAppBannerRemovalWasDeferred:(BOOL)a3
{
  self->_appBannerRemovalWasDeferred = a3;
}

- (NSString)sourceApplicationBundleIdentifierForNextCommit
{
  return self->_sourceApplicationBundleIdentifierForNextCommit;
}

- (BOOL)storeBannersAreDisabled
{
  return self->_storeBannersAreDisabled;
}

- (void)setStoreBannersAreDisabled:(BOOL)a3
{
  self->_storeBannersAreDisabled = a3;
}

- (int64_t)externalAppRedirectState
{
  return self->_externalAppRedirectState;
}

- (void)setExternalAppRedirectState:(int64_t)a3
{
  self->_externalAppRedirectState = a3;
}

- (WebBookmark)readingListBookmark
{
  return self->_readingListBookmark;
}

- (BOOL)suppressingProgressAnimationForNavigationGesture
{
  return self->_suppressingProgressAnimationForNavigationGesture;
}

- (BOOL)wantsReaderWhenActivated
{
  return self->_wantsReaderWhenActivated;
}

- (void)setWantsReaderWhenActivated:(BOOL)a3
{
  self->_wantsReaderWhenActivated = a3;
}

- (BOOL)isDisplayingStandaloneImage
{
  return self->_displayingStandaloneImage;
}

- (void)setDisplayingStandaloneImage:(BOOL)a3
{
  self->_displayingStandaloneImage = a3;
}

- (BOOL)isDisplayingStandaloneMedia
{
  return self->_displayingStandaloneMedia;
}

- (void)setDisplayingStandaloneMedia:(BOOL)a3
{
  self->_displayingStandaloneMedia = a3;
}

- (BOOL)wasHibernatedDueToMemoryWarning
{
  return self->_hibernatedDueToMemoryWarning;
}

- (void)setHibernatedDueToMemoryWarning:(BOOL)a3
{
  self->_hibernatedDueToMemoryWarning = a3;
}

- (unint64_t)sessionStateRestorationSource
{
  return self->_sessionStateRestorationSource;
}

- (void)setSessionStateRestorationSource:(unint64_t)a3
{
  self->_sessionStateRestorationSource = a3;
}

- (TabDocumentDelegate)delegate
{
  return (TabDocumentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (LoadProgressObserver)loadProgressObserver
{
  return (LoadProgressObserver *)objc_loadWeakRetained((id *)&self->_loadProgressObserver);
}

- (void)setLoadProgressObserver:(id)a3
{
  objc_storeWeak((id *)&self->_loadProgressObserver, a3);
}

- (BOOL)webViewIsFullscreen
{
  return self->_webViewIsFullscreen;
}

- (LinkPreviewViewController)linkPreviewViewController
{
  return self->_linkPreviewViewController;
}

- (void)setLinkPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_linkPreviewViewController, a3);
}

- (_SFFormAutoFillController)autoFillController
{
  return self->_autoFillController;
}

- (PageLoadTestStatistics)pageLoadStatistics
{
  return self->_pageLoadStatistics;
}

- (void)setPageLoadStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_pageLoadStatistics, a3);
}

- (BOOL)allowsProgrammaticFocusToBeginInputSession
{
  return self->_allowsProgrammaticFocusToBeginInputSession;
}

- (void)setAllowsProgrammaticFocusToBeginInputSession:(BOOL)a3
{
  self->_allowsProgrammaticFocusToBeginInputSession = a3;
}

- (NSURL)URLFromExternalApplication
{
  return self->_URLFromExternalApplication;
}

- (void)setURLFromExternalApplication:(id)a3
{
  objc_storeStrong((id *)&self->_URLFromExternalApplication, a3);
}

- (_SFPageLoadErrorController)pageLoadErrorController
{
  return self->_pageLoadErrorController;
}

- (BOOL)isShowingInlineDialog
{
  return self->_showingInlineDialog;
}

- (WBSSameDocumentNavigationToHistoryVisitCorrelator)sameDocumentNavigationToHistoryVisitCorrelator
{
  return self->_sameDocumentNavigationToHistoryVisitCorrelator;
}

- (BOOL)persistWhenHibernated
{
  return self->_persistWhenHibernated;
}

- (void)setPersistWhenHibernated:(BOOL)a3
{
  self->_persistWhenHibernated = a3;
}

- (void)setInteractivelyInserted:(BOOL)a3
{
  self->_interactivelyInserted = a3;
}

- (BOOL)hasBeenInserted
{
  return self->_hasBeenInserted;
}

- (void)setLibraryType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1264);
}

- (void)setPreparingForNewUserActivity:(BOOL)a3
{
  self->_preparingForNewUserActivity = a3;
}

- (BOOL)isShowingSearchQueryInNavigationBar
{
  return self->_isShowingSearchQueryInNavigationBar;
}

- (_SFSafeBrowsingController)safeBrowsingController
{
  return self->_safeBrowsingController;
}

- (NSString)lastSiriReaderSessionIdentifier
{
  return self->_lastSiriReaderSessionIdentifier;
}

- (void)setLastSiriReaderSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (BOOL)canStopLoading
{
  return self->_canStopLoading;
}

- (CGPoint)scrollPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollPoint.x;
  y = self->_scrollPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScrollPoint:(CGPoint)a3
{
  self->_scrollPoint = a3;
}

- (BOOL)supportsReuseForSpotlightSearch
{
  return self->_supportsReuseForSpotlightSearch;
}

- (void)setSupportsReuseForSpotlightSearch:(BOOL)a3
{
  self->_supportsReuseForSpotlightSearch = a3;
}

- (NSURL)tabReuseURL
{
  return self->_tabReuseURL;
}

- (void)setTabReuseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (WBTab)tabGroupTab
{
  return self->_tabGroupTab;
}

- (void)setTabGroupTab:(id)a3
{
  objc_storeStrong((id *)&self->_tabGroupTab, a3);
}

- (WBSHistoryVisit)lastVisit
{
  return self->_lastVisit;
}

- (void)setLastVisit:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisit, a3);
}

- (BOOL)isPerformingFirstLoadAfterOpenInBackground
{
  return self->_performingFirstLoadAfterOpenInBackground;
}

- (void)setPerformingFirstLoadAfterOpenInBackground:(BOOL)a3
{
  self->_performingFirstLoadAfterOpenInBackground = a3;
}

- (BOOL)isPerformingRedirectAfterOpenInBackground
{
  return self->_performingRedirectAfterOpenInBackground;
}

- (void)setPerformingRedirectAfterOpenInBackground:(BOOL)a3
{
  self->_performingRedirectAfterOpenInBackground = a3;
}

- (BOOL)didFirstMeaningfulPaint
{
  return self->_didFirstMeaningfulPaint;
}

- (BOOL)contentIsReadyForSnapshot
{
  return self->_contentIsReadyForSnapshot;
}

- (void)setSearchableItemAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_searchableItemAttributes, a3);
}

- (WBSSiriIntelligenceDonorPersonalizationData)personalizationData
{
  return self->_personalizationData;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1352);
}

- (BOOL)mediaCaptureEnabled
{
  return self->_mediaCaptureEnabled;
}

- (void)setMediaCaptureEnabled:(BOOL)a3
{
  self->_mediaCaptureEnabled = a3;
}

- (STBlockingViewController)associatedBlockingViewController
{
  return (STBlockingViewController *)objc_loadWeakRetained((id *)&self->_associatedBlockingViewController);
}

- (void)setAssociatedBlockingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_associatedBlockingViewController, a3);
}

- (unint64_t)mediaSuspensionReasons
{
  return self->_mediaSuspensionReasons;
}

- (void)setMediaSuspensionReasons:(unint64_t)a3
{
  self->_mediaSuspensionReasons = a3;
}

- (BOOL)hasFormControlInteraction
{
  return self->_hasFormControlInteraction;
}

- (BOOL)previousLoadingCompleteStateForWebExtensionOnUpdatedEvent
{
  return self->_previousLoadingCompleteStateForWebExtensionOnUpdatedEvent;
}

- (NSString)previousTitleForWebExtensionOnUpdatedEvent
{
  return self->_previousTitleForWebExtensionOnUpdatedEvent;
}

- (NSURL)previousURLForWebExtensionOnUpdatedEvent
{
  return self->_previousURLForWebExtensionOnUpdatedEvent;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (id)linkAddedToUserActivityCallback
{
  return self->_linkAddedToUserActivityCallback;
}

- (void)setLinkAddedToUserActivityCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (NSUserActivity)userActivityFromNotes
{
  return self->_userActivityFromNotes;
}

- (void)setUserActivityFromNotes:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityFromNotes, a3);
}

- (BOOL)nextLoadComesFromSearchPage
{
  return self->_nextLoadComesFromSearchPage;
}

- (void)setNextLoadComesFromSearchPage:(BOOL)a3
{
  self->_nextLoadComesFromSearchPage = a3;
}

- (BOOL)shouldKeepIgnoredSiriSuggestedSitesOnLoad
{
  return self->_shouldKeepIgnoredSiriSuggestedSitesOnLoad;
}

- (void)setShouldKeepIgnoredSiriSuggestedSitesOnLoad:(BOOL)a3
{
  self->_shouldKeepIgnoredSiriSuggestedSitesOnLoad = a3;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityFromNotes, 0);
  objc_storeStrong(&self->_linkAddedToUserActivityCallback, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_previousURLForWebExtensionOnUpdatedEvent, 0);
  objc_storeStrong((id *)&self->_previousTitleForWebExtensionOnUpdatedEvent, 0);
  objc_destroyWeak((id *)&self->_associatedBlockingViewController);
  objc_storeStrong((id *)&self->_readerWebView, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_personalizationData, 0);
  objc_storeStrong((id *)&self->_searchableItemAttributes, 0);
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_lastVisit, 0);
  objc_storeStrong((id *)&self->_tabGroupTab, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_tabReuseURL, 0);
  objc_storeStrong((id *)&self->_lastSiriReaderSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_safeBrowsingController, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_libraryType, 0);
  objc_storeStrong((id *)&self->_sameDocumentNavigationToHistoryVisitCorrelator, 0);
  objc_storeStrong((id *)&self->_pageLoadErrorController, 0);
  objc_storeStrong((id *)&self->_URLFromExternalApplication, 0);
  objc_storeStrong((id *)&self->_pageLoadStatistics, 0);
  objc_storeStrong((id *)&self->_autoFillController, 0);
  objc_storeStrong((id *)&self->_linkPreviewViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_loadProgressObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_readingListBookmark, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifierForNextCommit, 0);
  objc_storeStrong((id *)&self->_privateBrowsingPrivacyProtectionsBanner, 0);
  objc_storeStrong((id *)&self->_appBanner, 0);
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_destroyWeak((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_pinnedURL, 0);
  objc_storeStrong((id *)&self->_pinnedTitle, 0);
  objc_storeStrong((id *)&self->_ancestorUUIDs, 0);
  objc_storeStrong((id *)&self->_trackerInfo, 0);
  objc_storeStrong((id *)&self->_tabCollectionItem, 0);
  objc_storeStrong((id *)&self->_tabOverviewItem, 0);
  objc_storeStrong((id *)&self->_unifiedTabBarItem, 0);
  objc_storeStrong((id *)&self->_tabBarItem, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_storeStrong((id *)&self->_previousWebExtensionTabPosition, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_translationContext, 0);
  objc_storeStrong((id *)&self->_contextController, 0);
  objc_storeStrong((id *)&self->_URLStringComponents, 0);
  objc_storeStrong((id *)&self->_URLStringForLastSearch, 0);
  objc_storeStrong((id *)&self->_titleForLastSearch, 0);
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_storeStrong((id *)&self->_titleWords, 0);
  objc_storeStrong((id *)&self->_fluidProgressState, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_biomeWebpageIdentifier, 0);
  objc_storeStrong((id *)&self->_pageContextDataFetcher, 0);
  objc_storeStrong((id *)&self->_speculativeLoadNavigationResponse, 0);
  objc_storeStrong((id *)&self->_lastWebViewIncreaseZoomDate, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_cachedURLForDebugTitle, 0);
  objc_storeStrong((id *)&self->_cachedDebugTitle, 0);
  objc_storeStrong((id *)&self->_deferredNavigationTitle, 0);
  objc_storeStrong((id *)&self->_deferredNavigationURL, 0);
  objc_storeStrong((id *)&self->_permissionDialogThrottler, 0);
  objc_storeStrong((id *)&self->_fireOnUpdatedWebExtensionEventTimer, 0);
  objc_storeStrong((id *)&self->_webExtensionsStateObserver, 0);
  objc_storeStrong((id *)&self->_suggestedFilenameForNextCommit, 0);
  objc_storeStrong((id *)&self->_quickLookDocumentWriter, 0);
  objc_storeStrong((id *)&self->_urlForDisplayedContent, 0);
  objc_storeStrong((id *)&self->_downloadReflectedInFluidProgress, 0);
  objc_storeStrong((id *)&self->_elementInfoToAnimateForNextDownload, 0);
  objc_storeStrong((id *)&self->_domainWhereUserDeclinedAutomaticStrongPassword, 0);
  objc_storeStrong((id *)&self->_navigationUtilitiesManager, 0);
  objc_storeStrong((id *)&self->_contentBlockerStatisticsStore, 0);
  objc_storeStrong((id *)&self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections, 0);
  objc_storeStrong((id *)&self->_previousWebPageURLBeforeNavigation, 0);
  objc_storeStrong((id *)&self->_urlToReloadEnablingPrivateRelay, 0);
  objc_storeStrong((id *)&self->_urlToReloadForcingContentBlockers, 0);
  objc_destroyWeak((id *)&self->_updateFaviconTimer);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong(&self->_faviconToken, 0);
  objc_storeStrong((id *)&self->_cachedURL, 0);
  objc_storeStrong(&self->_pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  objc_storeStrong((id *)&self->_cachedActivityItemProvider, 0);
  objc_storeStrong((id *)&self->_cachedCanonicalURL, 0);
  objc_storeStrong((id *)&self->_spawnedTabDocuments, 0);
  objc_destroyWeak((id *)&self->_webKitDragSession);
  objc_storeStrong((id *)&self->_deferredDropWasHandledByWebKit, 0);
  objc_storeStrong((id *)&self->_deferredDropNavigationIntent, 0);
  objc_storeStrong(&self->_unresponsiveWebProcessBlock, 0);
  objc_storeStrong((id *)&self->_unresponsiveWebProcessTimer, 0);
  objc_storeStrong((id *)&self->_donateTextTimer, 0);
  objc_storeStrong((id *)&self->_pageLoadTest, 0);
  objc_storeStrong((id *)&self->_secIdentityPreferencesController, 0);
  objc_storeStrong((id *)&self->_lastUserInitiatedAction, 0);
  objc_storeStrong((id *)&self->_telephonyNavigationPolicy, 0);
  objc_storeStrong((id *)&self->_dateOfLastFinishedNavigation, 0);
  objc_storeStrong((id *)&self->_appBannerRemovalTimer, 0);
  objc_storeStrong((id *)&self->_appBannerPendingFirstPaint, 0);
  objc_storeStrong((id *)&self->_storeBanner, 0);
  objc_storeStrong((id *)&self->_backForwardListItemForCurrentNoteTakingCheck, 0);
  objc_storeStrong((id *)&self->_highlightFromNavigation, 0);
  objc_storeStrong((id *)&self->_backForwardListItemForCurrentHighlightBannerCheck, 0);
  objc_storeStrong((id *)&self->_backForwardListItemForCurrentAppLinkBannerCheck, 0);
  objc_storeStrong((id *)&self->_bookmarkForIconFetching, 0);
  objc_storeStrong((id *)&self->_sfScribbleController, 0);
  objc_storeStrong((id *)&self->_readerContext, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_navigationBarItem, 0);
  objc_storeStrong((id *)&self->_findMatchesCounter, 0);
  objc_storeStrong((id *)&self->_navigationObservers, 0);
  objc_storeStrong((id *)&self->_renderingProgressEventObservers, 0);
  objc_storeStrong((id *)&self->_lastURLForWhichUsageStateWasSet, 0);
  objc_storeStrong((id *)&self->_cachedView, 0);
  objc_storeStrong((id *)&self->_activeDownload, 0);
  objc_storeStrong((id *)&self->_applicationManifestFetcher, 0);
  objc_storeStrong((id *)&self->_parentTabItem, 0);
  objc_storeStrong((id *)&self->_overrideURLForHTTPAuthenticationDialog, 0);
  objc_storeStrong((id *)&self->_initialArticleScrollDictionaryForCloudTab, 0);
  objc_storeStrong((id *)&self->_fluidProgressController, 0);
  objc_storeStrong((id *)&self->_loadingController, 0);
  objc_storeStrong(&self->_autoFillAuthenticationCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_findCompletionProvider);
  objc_storeStrong((id *)&self->_fallbackURLs, 0);
  objc_storeStrong((id *)&self->_touchIconFetcher, 0);
  objc_storeStrong((id *)&self->_webClipMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_activityJSController, 0);
  objc_storeStrong((id *)&self->_calendarEventDetector, 0);
  objc_storeStrong((id *)&self->_reloadOptionsController, 0);
  objc_storeStrong((id *)&self->_sharingExtensionController, 0);
  objc_storeStrong((id *)&self->_appBannerMetaTagContentObserverInterface, 0);
  objc_storeStrong((id *)&self->_siteSpecificSearchEventListenerInterface, 0);
  objc_storeStrong((id *)&self->_savedSessionState, 0);
  objc_storeStrong((id *)&self->_URLSpoofingMitigator, 0);
  objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, 0);
  objc_storeStrong((id *)&self->_lastLoadError, 0);
}

- (void)_webView:(std::__shared_weak_count *)this willSubmitFormValues:userObject:submissionHandler:
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E9CF9A78;
  std::__shared_weak_count::~__shared_weak_count(this);
}

- (void)_webView:(std::__shared_weak_count *)a1 willSubmitFormValues:userObject:submissionHandler:
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E9CF9A78;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D82A1704);
}

- (void)_webView:(uint64_t)a1 willSubmitFormValues:userObject:submissionHandler:
{
  if (!*(_BYTE *)(a1 + 32) && (objc_msgSend(MEMORY[0x1E0D89BE8], "hasInternalContent") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 24) + 16))();

}

void __30__TabDocument_NonARC__release__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_FAULT, "-[TabDocument dealloc] should be called on the main thread", v1, 2u);
}

- (void)setActive:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1D7CA3000, a2, OS_LOG_TYPE_FAULT, "TabDocument %p is being activated despite being closed.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_10();
}

void __39__TabDocument_restoreAllHighlightsData__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, v3, v4, "Fetching highlight data failed: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_terminateWebProcessIfNeededAndShowCrashBanner:thenDo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Killed a web process immediately, even though it may have been responsive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_terminateWebProcessIfNeededAndShowCrashBanner:thenDo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Terminating an unresponsive web process, even though there's still pending work from a previous termination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, v3, v4, "Failed to save Wallet Order: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)showDownload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Attempted to open a download with a nil URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_showDownload:path:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Failed to download Profile; data is nil on disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_showDownload:path:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, v3, v4, "PassBook Pass download failed: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_showDownload:path:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Calendar file download failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __34__TabDocument__showDownload_path___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, v3, v4, "Greenfield download failed: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __34__TabDocument__showDownload_path___block_invoke_233_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, v3, v4, "Profile failed to install: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)history
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_DEBUG, "Tab created with profile '%@' (%{public}@)", buf, 0x16u);

  OUTLINED_FUNCTION_3_0();
}

- (void)webView:(uint64_t)a3 decidePolicyForNavigationAction:preferences:decisionHandler:.cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_2(&dword_1D7CA3000, a2, a3, "Killing web process as a mitigation after it has rapidly attempted %zd navigations concurrently", (uint8_t *)&v4);
  OUTLINED_FUNCTION_10();
}

- (void)_donateTextAllowingDonationWithoutReaderText:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1D7CA3000, v0, OS_LOG_TYPE_DEBUG, "Deferring Siri Intelligence donation until Reader text becomes available", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_donateTextAllowingDonationWithoutReaderText:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.808e-34);
  _os_log_debug_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEBUG, "Page URL: %{private}@", v4, 0xCu);

  OUTLINED_FUNCTION_3_0();
}

- (void)_donateTextAllowingDonationWithoutReaderText:(char)a1 .cold.3(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  OUTLINED_FUNCTION_4();
}

- (void)pageContextDataFetcherDidFinishFetching:forURL:withError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, v3, v4, "Failed to extract schema data from webpage: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

@end
