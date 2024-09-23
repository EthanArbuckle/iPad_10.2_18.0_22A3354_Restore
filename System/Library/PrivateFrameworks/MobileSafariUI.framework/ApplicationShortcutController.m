@implementation ApplicationShortcutController

+ (id)_shortcutItemWithType:(id)a3 systemImageName:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0DC34A0];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  _SFLocalizedTitleStringForShortcutItemType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3498], "iconWithSystemImageName:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", v7, v9, 0, v10, 0);
  return v11;
}

- (void)setBrowserController:(id)a3
{
  objc_storeWeak((id *)&self->_browserController, a3);
}

+ (void)updateShortcutItemsIfNeeded
{
  void *v3;
  _QWORD v4[5];

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__ApplicationShortcutController_updateShortcutItemsIfNeeded__block_invoke;
  v4[3] = &__block_descriptor_40_e8_v12__0B8l;
  v4[4] = a1;
  objc_msgSend(v3, "determineIfPrivateBrowsingIsAvailableWithCompletionHandler:", v4);

}

- (BOOL)handleActionWithType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__ApplicationShortcutController_handleActionWithType___block_invoke;
  v8[3] = &unk_1E9CF89B8;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "performWithoutAnimation:", v8);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

uint64_t __54__ApplicationShortcutController_handleActionWithType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_handleActionWithType:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_handleActionWithType:(id)a3
{
  id v4;
  BOOL v5;
  id WeakRetained;
  __CFString **v7;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD5918]))
  {
    v5 = 1;
    -[ApplicationShortcutController _openNewEmptyTabWithURLFieldFocused:privateBrowsingState:](self, "_openNewEmptyTabWithURLFieldFocused:privateBrowsingState:", 1, 0);
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD5910]))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      if (objc_msgSend(WeakRetained, "isPrivateBrowsingAvailable"))
      {
        -[ApplicationShortcutController _openNewEmptyTabWithURLFieldFocused:privateBrowsingState:](self, "_openNewEmptyTabWithURLFieldFocused:privateBrowsingState:", 1, 1);
      }
      else
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __55__ApplicationShortcutController__handleActionWithType___block_invoke;
        v9[3] = &unk_1E9CF89E0;
        objc_copyWeak(&v10, &location);
        objc_msgSend(WeakRetained, "updatePrivateBrowsingAvailabilityWithCompletionHandler:", v9);
        objc_destroyWeak(&v10);
      }

    }
    else
    {
      if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD5908]) & 1) != 0)
      {
        v7 = kCollectionTypeBookmarks;
      }
      else
      {
        if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD5920]))
        {
          v5 = 0;
          goto LABEL_14;
        }
        v7 = kCollectionTypeReadingList;
      }
      -[ApplicationShortcutController _showBookmarksPanelWithSelectedCollection:](self, "_showBookmarksPanelWithSelectedCollection:", *v7);
    }
    v5 = 1;
  }
LABEL_14:
  objc_destroyWeak(&location);

  return v5;
}

void __55__ApplicationShortcutController__handleActionWithType___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v3;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v3 = WeakRetained;
      objc_msgSend(WeakRetained, "_openNewEmptyTabWithURLFieldFocused:privateBrowsingState:", 1, 1);
      WeakRetained = v3;
    }

  }
}

- (void)_openNewEmptyTabWithURLFieldFocused:(BOOL)a3 privateBrowsingState:(int64_t)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(_QWORD);
  _QWORD aBlock[4];
  id v27;
  char v28;
  BOOL v29;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "tabCollectionViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  objc_msgSend(WeakRetained, "dismissTransientUIAnimated:options:", v9, 2);
  v10 = objc_msgSend(WeakRetained, "isShowingPrivateTabs");
  if (a4 != 1 || (v10 & 1) != 0)
  {
    if (a4)
      v11 = 0;
    else
      v11 = v10;
    if (v11 == 1)
      objc_msgSend(v7, "selectLocalTabGroup");
  }
  else
  {
    objc_msgSend(v7, "selectPrivateTabGroup");
  }
  if (objc_msgSend(v7, "isPrivateBrowsingEnabled"))
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPrivateBrowsingLocked");

    a3 &= ~(_BYTE)v13;
  }
  else
  {
    v13 = 0;
  }
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__ApplicationShortcutController__openNewEmptyTabWithURLFieldFocused_privateBrowsingState___block_invoke;
  aBlock[3] = &unk_1E9CF8A08;
  v15 = WeakRetained;
  v27 = v15;
  v28 = v9;
  v29 = a3;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v7, "blankTabToReuse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v7, "activeTabDocument");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 != v18)
      objc_msgSend(v7, "setActiveTab:animated:", v17, v9);
    if (v13)
    {
      objc_msgSend(v8, "tabSwitcherViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDismissesOnUnlock:", 1);

    }
    objc_msgSend(v8, "updateTabViewsAnimatingTabBar:", v9);
    objc_msgSend(v8, "tabOverview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((_DWORD)v9 && v20)
    {
      objc_msgSend(v20, "dismissWithAddTabAnimation");
    }
    else
    {
      objc_msgSend(v8, "tabThumbnailCollectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dismissAnimated:", v9);

    }
    v16[2](v16);
  }
  else
  {
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __90__ApplicationShortcutController__openNewEmptyTabWithURLFieldFocused_privateBrowsingState___block_invoke_2;
    v23[3] = &unk_1E9CF8A30;
    v25 = v16;
    v24 = v8;
    objc_msgSend(v7, "openNewTabWithOptions:completionHandler:", 0, v23);

    v21 = v25;
  }

}

uint64_t __90__ApplicationShortcutController__openNewEmptyTabWithURLFieldFocused_privateBrowsingState___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setFavoritesAreEmbedded:animated:", 1, *(unsigned __int8 *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "updateFirstResponderOrFocus");
  if (*(_BYTE *)(a1 + 41))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "canAutoFocusURLField");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "setFavoritesFieldFocused:animated:", 1, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void __90__ApplicationShortcutController__openNewEmptyTabWithURLFieldFocused_privateBrowsingState___block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didOpenNewBlankTabWithTrigger:tabCollectionViewType:", 3, objc_msgSend(*(id *)(a1 + 32), "visibleTabCollectionViewType"));

  }
}

- (void)_showBookmarksPanelWithSelectedCollection:(id)a3
{
  BrowserController **p_browserController;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeTabDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isBlank"))
  {
    if ((objc_msgSend(WeakRetained, "isPresentingModalBookmarksController") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(WeakRetained, "sidebarUIProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isShowingSidebar");

    }
  }
  else
  {
    v8 = 0;
  }

  if (objc_msgSend(WeakRetained, "isSuspendedOrSuspending") && (v8 & 1) == 0)
    -[ApplicationShortcutController _openNewEmptyTabWithURLFieldFocused:privateBrowsingState:](self, "_openNewEmptyTabWithURLFieldFocused:privateBrowsingState:", 0, 2);
  v10 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  objc_msgSend(WeakRetained, "tabCollectionViewProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tabThumbnailCollectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissAnimated:", v10);

  if ((_DWORD)v10)
  {
    objc_msgSend(WeakRetained, "sidebarUIProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isShowingSidebar"))
    {

    }
    else
    {
      v14 = objc_msgSend(WeakRetained, "isPresentingModalBookmarksController");

      if ((v14 & 1) == 0)
      {
        objc_msgSend(WeakRetained, "toggleBookmarksPresentation");
        goto LABEL_14;
      }
    }
  }
  objc_msgSend(WeakRetained, "showBookmarksPanelWithNonAnimatedTransition");
LABEL_14:
  objc_msgSend(WeakRetained, "setCurrentBookmarksCollection:", v5);

}

+ (id)_shortcutItemsIncludingPrivateBrowsing:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD block[5];
  _QWORD v9[3];
  _QWORD v10[5];

  v3 = a3;
  v10[4] = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ApplicationShortcutController__shortcutItemsIncludingPrivateBrowsing___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_shortcutItemsIncludingPrivateBrowsing__onceToken != -1)
    dispatch_once(&_shortcutItemsIncludingPrivateBrowsing__onceToken, block);
  if (v3)
  {
    v10[0] = _shortcutItemsIncludingPrivateBrowsing__newTabShortcutItem;
    v10[1] = _shortcutItemsIncludingPrivateBrowsing__newPrivateTabShortcutItem;
    v10[2] = _shortcutItemsIncludingPrivateBrowsing__showBookmarksShortcutItem;
    v10[3] = _shortcutItemsIncludingPrivateBrowsing__showReadingListShortcutItem;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v10;
    v6 = 4;
  }
  else
  {
    v9[0] = _shortcutItemsIncludingPrivateBrowsing__newTabShortcutItem;
    v9[1] = _shortcutItemsIncludingPrivateBrowsing__showBookmarksShortcutItem;
    v9[2] = _shortcutItemsIncludingPrivateBrowsing__showReadingListShortcutItem;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v9;
    v6 = 3;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __72__ApplicationShortcutController__shortcutItemsIncludingPrivateBrowsing___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "_shortcutItemWithType:systemImageName:", *MEMORY[0x1E0CD5920], CFSTR("eyeglasses"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_shortcutItemsIncludingPrivateBrowsing__showReadingListShortcutItem;
  _shortcutItemsIncludingPrivateBrowsing__showReadingListShortcutItem = v2;

  objc_msgSend(*(id *)(a1 + 32), "_shortcutItemWithType:systemImageName:", *MEMORY[0x1E0CD5908], CFSTR("book"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_shortcutItemsIncludingPrivateBrowsing__showBookmarksShortcutItem;
  _shortcutItemsIncludingPrivateBrowsing__showBookmarksShortcutItem = v4;

  objc_msgSend(*(id *)(a1 + 32), "_shortcutItemWithType:systemImageName:", *MEMORY[0x1E0CD5910], CFSTR("plus.square.fill.on.square.fill"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_shortcutItemsIncludingPrivateBrowsing__newPrivateTabShortcutItem;
  _shortcutItemsIncludingPrivateBrowsing__newPrivateTabShortcutItem = v6;

  objc_msgSend(*(id *)(a1 + 32), "_shortcutItemWithType:systemImageName:", *MEMORY[0x1E0CD5918], CFSTR("plus.square.on.square"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_shortcutItemsIncludingPrivateBrowsing__newTabShortcutItem;
  _shortcutItemsIncludingPrivateBrowsing__newTabShortcutItem = v8;

}

void __60__ApplicationShortcutController_updateShortcutItemsIfNeeded__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__ApplicationShortcutController_updateShortcutItemsIfNeeded__block_invoke_2;
  v2[3] = &__block_descriptor_41_e5_v8__0l;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __60__ApplicationShortcutController_updateShortcutItemsIfNeeded__block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_shortcutItemsIncludingPrivateBrowsing:", *(unsigned __int8 *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "shortcutItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "isEqualToArray:", v2);

  if ((v3 & 1) == 0)
    objc_msgSend(*v1, "setShortcutItems:", v4);

}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browserController);
}

@end
