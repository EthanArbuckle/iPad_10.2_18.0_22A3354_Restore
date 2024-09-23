@implementation ActionPanel

- (ActionPanel)initWithTabDocument:(id)a3 activityDelegate:(id)a4 menuStyle:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ActionPanel *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  ActionPanel *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  customActivities(v9, a5, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isBlank") & 1) != 0
    || objc_msgSend(v9, "isShowingStartPageOverriddenByExtension"))
  {
    a5 = 1;
  }
  itemProviderCollection(v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedCanonicalURLOrURLForSharing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "urlForSharing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)ActionPanel;
  v15 = -[_SFActivityViewController initWithActivityItemProviderCollection:applicationActivities:sharingURL:sourceURL:](&v32, sel_initWithActivityItemProviderCollection_applicationActivities_sharingURL_sourceURL_, v12, v11, v13, v14);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_tabDocument, a3);
    objc_storeStrong((id *)&v15->_activityDelegate, a4);
    objc_msgSend(v9, "sharingExtensionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFActivityViewController setSharingExtensionController:](v15, "setSharingExtensionController:", v16);

    -[_SFActivityViewController customizationController](v15, "customizationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v15);

    v15->_menuStyle = a5;
    if (a5 == 1)
    {
      -[ActionPanel setSharingStyle:](v15, "setSharingStyle:", 2);
      -[ActionPanel setHideHeaderView:](v15, "setHideHeaderView:", 1);
    }
    -[ActionPanel _primeExtensionDiscovery](v15, "_primeExtensionDiscovery");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = v11;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v23, "setParentViewController:", v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v23, "setParentActivityViewController:", v15);
            objc_msgSend(v23, "setBrowserDocument:", v9);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v23, "setParentViewController:", v15);
            v15->_containsDownloadsActivity = 1;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)&v15->_reloadActivity, v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v23, "setDelegate:", v15);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v20);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v15, sel__reload, *MEMORY[0x1E0D8B710], 0);

    v25 = v15;
    v11 = v27;
  }

  return v15;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ActionPanel;
  -[ActionPanel viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (self->_containsDownloadsActivity)
  {
    objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didBeginViewingDownloads");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ActionPanel;
  -[ActionPanel viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (self->_containsDownloadsActivity)
  {
    objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didEndViewingDownloads");

  }
}

- (void)setSharingURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFActivityViewController sharingURL](self, "sharingURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_SFActivityViewController activityItemProviders](self, "activityItemProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "url");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v5);

          if (v13)
            objc_msgSend(v11, "setUrl:", v4);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v14.receiver = self;
    v14.super_class = (Class)ActionPanel;
    -[_SFActivityViewController setSharingURL:](&v14, sel_setSharingURL_, v4);
  }

}

+ (id)createActivityItemProviderCollectionForTabDocument:(id)a3
{
  return itemProviderCollection(a3, 0);
}

- (void)activityDidComplete:(id)a3 withReturnedItems:(id)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  objc_super v10;

  v5 = a5;
  v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ActionPanel;
  -[_SFActivityViewController activityDidComplete:withReturnedItems:success:](&v10, sel_activityDidComplete_withReturnedItems_success_, v8, a4, v5);
  if (v5 && objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D96E00]))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didPrintPage");

  }
}

- (void)_executeActivity
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  -[ActionPanel activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D96D80]))
  {
    -[_SFActivityViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__ActionPanel__executeActivity__block_invoke;
    v7[3] = &unk_1E9CF16A0;
    v8 = v3;
    objc_msgSend(v5, "actionPanelAddTabDocumentToReadingList:activityDidFinish:", self, v7);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ActionPanel;
    -[_SFActivityViewController _executeActivity](&v6, sel__executeActivity);
  }

}

uint64_t __31__ActionPanel__executeActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2);
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v7)
    v8 = v7;
  else
    v8 = (void (**)(_QWORD))&__block_literal_global;
  objc_msgSend(v6, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ActionPanel _preparePostToSocialNetwork:](self, "_preparePostToSocialNetwork:", v6);
    v8[2](v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D96DB0]))
  {
    -[ActionPanel _prepareMail:completion:](self, "_prepareMail:completion:", v6, v8);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ActionPanel;
    -[_SFActivityViewController _prepareActivity:completion:](&v10, sel__prepareActivity_completion_, v6, v8);
  }

}

- (void)_preparePostToSocialNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "activityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v6 = (void *)getSLComposeViewControllerClass_softClass;
  v13 = getSLComposeViewControllerClass_softClass;
  if (!getSLComposeViewControllerClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getSLComposeViewControllerClass_block_invoke;
    v9[3] = &unk_1E9CF1780;
    v9[4] = &v10;
    __getSLComposeViewControllerClass_block_invoke((uint64_t)v9);
    v6 = (void *)v11[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v10, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TabDocument titleForSharing](self->_tabDocument, "titleForSharing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInitialText:", v8);

  }
}

- (void)_prepareMail:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a4;
  objc_msgSend(a3, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_sf_isMFMailComposeViewController") & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "setKeyboardVisible:", 1);
    -[TabDocument titleForSharing](self->_tabDocument, "titleForSharing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubject:", v8);

    -[_SFActivityViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionPanel:prepareForMailActivityWithMailController:completionHandler:", self, v7, v10);

  }
  else
  {
    v10[2]();
  }

}

- (void)_performActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SafariActivityTypeWebExtension"));

  if (v6)
  {
    -[TabDocument browserController](self->_tabDocument, "browserController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentModalViewController:completion:", v8, 0);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ActionPanel;
    -[_SFActivityViewController _performActivity:](&v9, sel__performActivity_, v4);
  }

}

- (void)_reload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  TabDocument *tabDocument;
  int64_t menuStyle;
  AddBookmarkActivityDelegate *activityDelegate;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[_SFActivityViewController printController](self, "printController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printInteractionControllerDidFinish");

  -[_SFActivityViewController setPrintController:](self, "setPrintController:", 0);
  itemProviderCollection(self->_tabDocument, self->_menuStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFActivityViewController customizationController](self, "customizationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityItemProvidersWithCustomizationController:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[ActionPanel activityTypeOrder](self, "activityTypeOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  tabDocument = self->_tabDocument;
  menuStyle = self->_menuStyle;
  activityDelegate = self->_activityDelegate;
  v24 = v6;
  customActivities(tabDocument, menuStyle, activityDelegate, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;

  -[ActionPanel setActivityTypeOrder:](self, "setActivityTypeOrder:", v11);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v17, "setParentViewController:", self);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v17;
          objc_msgSend(v18, "setParentActivityViewController:", self);
          objc_msgSend(v18, "setBrowserDocument:", self->_tabDocument);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v17, "setParentViewController:", self);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v14);
  }

  -[_SFActivityViewController _updateActivityItems:applicationActivities:](self, "_updateActivityItems:applicationActivities:", v19, v12);
}

- (id)excludedActivityTypes
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)ActionPanel;
  -[_SFActivityViewController excludedActivityTypes](&v10, sel_excludedActivityTypes);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  if (-[TabDocument isPDFDocument](self->_tabDocument, "isPDFDocument"))
  {
    v11[0] = *MEMORY[0x1E0D96DC8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  return v6;
}

- (id)downloadsViewController
{
  void *v3;
  void *v4;

  -[_SFActivityViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadsViewControllerForActionPanel:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateReloadActivity
{
  if (self->_reloadActivity)
  {
    if ((-[ActionPanel isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
      -[ActionPanel _reloadActivity:](self, "_reloadActivity:", self->_reloadActivity);
  }
}

- (int64_t)provenanceForSafariActivity:(id)a3
{
  return 0;
}

- (id)webViewForCustomizationController:(id)a3
{
  return -[TabDocument webView](self->_tabDocument, "webView", a3);
}

- (BOOL)isContentObscuredByDigitalHealthForCustomizationController:(id)a3
{
  return -[TabDocument shouldObscureForDigitalHealth](self->_tabDocument, "shouldObscureForDigitalHealth", a3);
}

- (BOOL)isDisplayingQuickLookDocumentForCustomizationController:(id)a3
{
  return -[TabDocument hasQuickLookContent](self->_tabDocument, "hasQuickLookContent", a3);
}

- (BOOL)isReaderAvailableForCustomizationController:(id)a3
{
  return -[TabDocument isReaderAvailable](self->_tabDocument, "isReaderAvailable", a3);
}

- (BOOL)isShowingReaderForCustomizationController:(id)a3
{
  return -[TabDocument isShowingReader](self->_tabDocument, "isShowingReader", a3);
}

- (BOOL)addBookmarkActivityCanSaveBookmarkChanges:(id)a3
{
  return -[AddBookmarkActivityDelegate addBookmarkActivityCanSaveBookmarkChanges:](self->_activityDelegate, "addBookmarkActivityCanSaveBookmarkChanges:", a3);
}

- (void)addBookmarkActivityFailedToAcquireBookmarkLock:(id)a3
{
  -[AddBookmarkActivityDelegate addBookmarkActivityFailedToAcquireBookmarkLock:](self->_activityDelegate, "addBookmarkActivityFailedToAcquireBookmarkLock:", a3);
}

- (id)addBookmarkActivityTabGroupProvider
{
  return (id)-[AddBookmarkActivityDelegate addBookmarkActivityTabGroupProvider](self->_activityDelegate, "addBookmarkActivityTabGroupProvider");
}

- (TabDocument)tabDocument
{
  return self->_tabDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
  objc_storeStrong((id *)&self->_reloadActivity, 0);
  objc_storeStrong((id *)&self->_activityDelegate, 0);
}

@end
