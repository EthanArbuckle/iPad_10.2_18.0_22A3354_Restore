@implementation WebExtensionWindow

- (BOOL)isPopupWindow
{
  return 0;
}

- (BOOL)isPrivate
{
  return self->_isPrivateWindow;
}

- (WebExtensionWindow)initWithBrowserController:(id)a3 isPrivateWindow:(BOOL)a4
{
  id v6;
  WebExtensionWindow *v7;
  WebExtensionWindow *v8;
  double v9;
  WebExtensionWindow *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WebExtensionWindow;
  v7 = -[WebExtensionWindow init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_browserController, v6);
    v8->_isPrivateWindow = a4;
    objc_msgSend(MEMORY[0x1E0D8ADC8], "nextWindowID");
    v8->_idForWebExtensions = v9;
    v10 = v8;
  }

  return v8;
}

- (double)idForWebExtensions
{
  return self->_idForWebExtensions;
}

- (void)createNewTabAtIndex:(id)a3 url:(id)a4 makeActive:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  id WeakRetained;
  void *v17;
  TabDocument *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  TabDocument *v25;
  _QWORD v26[2];

  v7 = a5;
  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[WebExtensionWindow _webExtensionTabsWithoutCopying](self, "_webExtensionTabsWithoutCopying");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  if (v10)
  {
    v15 = objc_msgSend(v10, "integerValue") < 1 ? 0 : objc_msgSend(v10, "integerValue");
    if (v15 < v14)
      v14 = v15;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14
    && -[WebExtensionWindow _isPrivateWithSingleTabShowingExplanationText](self, "_isPrivateWithSingleTabShowingExplanationText"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__WebExtensionWindow_createNewTabAtIndex_url_makeActive_completionHandler___block_invoke;
    v22[3] = &unk_1E9CF2668;
    v25 = (TabDocument *)v12;
    v23 = v17;
    v24 = v11;
    objc_msgSend(v23, "openNewTabWithOptions:completionHandler:", 2, v22);

    v18 = v25;
    goto LABEL_20;
  }
  v18 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:]([TabDocument alloc], "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, self->_isPrivateWindow, objc_msgSend(WeakRetained, "isControlledByAutomation"), 0, 0, WeakRetained, 0);
  -[TabDocument setIsBlank:](v18, "setIsBlank:", 1);
  -[TabDocument setScrollPoint:](v18, "setScrollPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  if (v11)
  {
    if (!v7)
      goto LABEL_12;
LABEL_15:
    objc_msgSend(WeakRetained, "dismissTransientUIAnimated:", 1);
    if (v14)
      goto LABEL_13;
LABEL_16:
    v26[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertTabs:beforeTab:inBackground:animated:", v19, v20, !v7, 1);

    goto LABEL_17;
  }
  -[TabDocument displayNewTabOverridePageIfNecessary](v18, "displayNewTabOverridePageIfNecessary");
  if (v7)
    goto LABEL_15;
LABEL_12:
  if (!v14)
    goto LABEL_16;
LABEL_13:
  objc_msgSend(v13, "objectAtIndexedSubscript:", v14 - 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "insertTab:afterTab:inBackground:animated:", v18, v19, !v7, 1);
LABEL_17:

  if (v11)
    v21 = -[TabDocument loadURL:userDriven:](v18, "loadURL:userDriven:", v11, 1);
  (*((void (**)(id, TabDocument *))v12 + 2))(v12, v18);
LABEL_20:

}

void __75__WebExtensionWindow_createNewTabAtIndex_url_makeActive_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeTabDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = v3;
    if (v4)
      v5 = (id)objc_msgSend(v3, "loadURL:userDriven:", v4, 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)_webExtensionTabsWithoutCopying
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = WeakRetained;
  if (!self->_isPrivateWindow)
  {
    objc_msgSend(WeakRetained, "tabController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "normalTabs");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v7;

    goto LABEL_7;
  }
  if (!-[WebExtensionWindow _isPrivateWithSingleTabShowingExplanationText](self, "_isPrivateWithSingleTabShowingExplanationText"))
  {
    objc_msgSend(v4, "tabController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "privateTabs");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v5 = (void *)MEMORY[0x1E0C9AA60];
LABEL_7:

  return v5;
}

- (BOOL)_isPrivateWithSingleTabShowingExplanationText
{
  id WeakRetained;
  void *v3;
  void *v4;
  BOOL v5;

  if (!self->_isPrivateWindow)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hiddenPrivateTabDocumentWhenShowingPrivateBrowsingExplanationText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isFocused
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (self->_isPrivateWindow == objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"))
    v4 = objc_msgSend(WeakRetained, "activeWebExtensionWindowIsFocused");
  else
    v4 = 0;

  return v4;
}

- (CGRect)webExtensionWindowGeometry
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "webExtensionWindowGeometry");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)webExtensionWindowType
{
  return (NSString *)(id)*MEMORY[0x1E0D8B758];
}

- (NSString)webExtensionWindowState
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  id *v6;
  NSString *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "webViewIsFullscreen");
  v6 = (id *)MEMORY[0x1E0D8B748];
  if (!v5)
    v6 = (id *)MEMORY[0x1E0D8B750];
  v7 = (NSString *)*v6;

  return v7;
}

- (NSArray)webExtensionTabs
{
  void *v2;
  void *v3;

  -[WebExtensionWindow _webExtensionTabsWithoutCopying](self, "_webExtensionTabsWithoutCopying");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (WBSWebExtensionTab)activeWebExtensionTab
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = WeakRetained;
  if (!self->_isPrivateWindow)
  {
    objc_msgSend(WeakRetained, "tabController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "normalActiveTabDocument");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v7;

    goto LABEL_7;
  }
  if (!-[WebExtensionWindow _isPrivateWithSingleTabShowingExplanationText](self, "_isPrivateWithSingleTabShowingExplanationText"))
  {
    objc_msgSend(v4, "tabController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "privateActiveTabDocument");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v5 = 0;
LABEL_7:

  return (WBSWebExtensionTab *)v5;
}

- (void)validateToolbarItemForExtension:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "validateExtensionToolbarItemsInWindow:", self);

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

- (id)tabsForWebExtensionContext:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[WebExtensionWindow webExtensionTabs](self, "webExtensionTabs", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (int64_t)windowTypeForWebExtensionContext:(id)a3
{
  return -[WebExtensionWindow isPopupWindow](self, "isPopupWindow", a3);
}

- (int64_t)windowStateForWebExtensionContext:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "webViewIsFullscreen"))
    v6 = 3;
  else
    v6 = 0;

  return v6;
}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (BOOL)isPrivateWindow
{
  return self->_isPrivateWindow;
}

- (void)setIsPrivateWindow:(BOOL)a3
{
  self->_isPrivateWindow = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browserController);
}

@end
