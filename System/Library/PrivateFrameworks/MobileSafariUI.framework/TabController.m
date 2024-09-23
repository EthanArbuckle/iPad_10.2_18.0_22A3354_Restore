@implementation TabController

uint64_t __36__TabController__tabCountForDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isInteractivelyInserted") ^ 1;
  else
    v3 = 1;

  return v3;
}

- (NSArray)currentTabs
{
  return (NSArray *)-[TabController _tabsForPrivateBrowsing:]((char *)self, -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
}

- (TabDocument)activeTabDocument
{
  TabDocument *activeLibraryTab;

  activeLibraryTab = self->_activeLibraryTab;
  if (activeLibraryTab)
    return activeLibraryTab;
  -[TabController activeNonLibraryTab](self, "activeNonLibraryTab");
  return (TabDocument *)(id)objc_claimAutoreleasedReturnValue();
}

- (TabDocument)activeNonLibraryTab
{
  return (TabDocument *)-[TabController _activeTabDocumentForPrivateBrowsing:]((char *)self, -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingMode == 1;
}

- (char)_activeTabDocumentForPrivateBrowsing:(char *)a1
{
  uint64_t v2;

  if (a1)
  {
    v2 = 304;
    if (a2)
      v2 = 296;
    a1 = (char *)*(id *)&a1[v2];
  }
  return a1;
}

uint64_t __29__TabController_unpinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

- (WBProfile)activeProfile
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "activeProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBProfile *)v3;
}

- (CollectionViewTab)hiddenTabForExplanationView
{
  return (CollectionViewTab *)self->_tabDocumentBeingHiddenFromTabView;
}

- (BOOL)shouldAllowScrollingPinnedItems
{
  void *v2;
  char v3;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesGlobalPinnedTabs") ^ 1;

  return v3;
}

- (id)_tabCountForDisplay
{
  id *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "activeTabGroup");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isLocal");

    if (v3)
    {
      objc_msgSend(v1, "currentTabs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_202);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = (id *)objc_msgSend(v5, "count");
    }
    else
    {
      objc_msgSend(v1[35], "localTabGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tabs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      objc_msgSend(v1[36], "pinnedTabs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = (id *)(objc_msgSend(v8, "count") + v7);

    }
  }
  return v1;
}

- (char)_tabsForPrivateBrowsing:(char *)a1
{
  uint64_t v2;

  if (a1)
  {
    v2 = 16;
    if (a2)
      v2 = 24;
    a1 = (char *)objc_msgSend(*(id *)&a1[v2], "copy");
  }
  return a1;
}

- (NSString)startPageBackgroundImageIdentifier
{
  void *v3;
  void *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isNamed") & 1) != 0)
  {
    -[TabController activeTabGroup](self, "activeTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TabController activeProfileIdentifier](self, "activeProfileIdentifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v6 = -[__CFString isEqualToString:](v5, "isEqualToString:", *MEMORY[0x1E0D89E20]);
  v7 = &stru_1E9CFDBB0;
  if (!v6)
    v7 = v5;
  v8 = v7;

  return (NSString *)v8;
}

- (WBTabGroup)activeTabGroup
{
  return (WBTabGroup *)-[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", self->_activeTabGroupUUID);
}

- (void)_willPerformBatchUpdates
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 72), "beginFixingTabBarItems");
    objc_msgSend(*(id *)(a1 + 72), "beginFixingTabOverviewItems");
    -[TabController _sendWillBeginDocumentUpdates](a1);
  }
}

- (void)updateUsageTrackingInformationIfNecessary
{
  void *v3;
  uint64_t v4;
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
  -[TabController allTabDocuments](self, "allTabDocuments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[TabController activeTabDocument](self, "activeTabDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:", 1);

}

- (NSArray)allTabDocuments
{
  void *v3;
  void *v4;
  void *v5;

  -[TabController tabDocuments](self, "tabDocuments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController privateTabDocuments](self, "privateTabDocuments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)privateTabDocuments
{
  return (NSArray *)-[NSMutableArray safari_filterObjectsUsingBlock:](self->_mutablePrivateTabs, "safari_filterObjectsUsingBlock:", &__block_literal_global_23_0);
}

- (NSArray)tabDocuments
{
  return (NSArray *)-[NSMutableArray safari_filterObjectsUsingBlock:](self->_mutableNormalTabs, "safari_filterObjectsUsingBlock:", &__block_literal_global_21_0);
}

- (id)tabWithUUID:(id)a3
{
  return -[NSMapTable objectForKey:](self->_uuidToTabMap, "objectForKey:", a3);
}

- (BOOL)canCloseTabWithUUID:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;

  -[TabController tabWithUUID:](self, "tabWithUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isLoading") & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "isBlank") ^ 1;
    if (self && (-[TabController _hasPinnedStartPageExcludingTabs:](self, 0) & 1) != 0
      || ((-[TabController allowsClosingLastTab](self) | v6) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[TabController unpinnedTabs](self, "unpinnedTabs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (unint64_t)objc_msgSend(v8, "count") > 1;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)unpinnedTabs
{
  void *v2;
  void *v3;

  -[TabController currentTabs](self, "currentTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_15_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_hasPinnedStartPageExcludingTabs:(void *)a1
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "activeTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "usesGlobalPinnedTabs");

    if ((v5 & 1) != 0)
    {
      a1 = 0;
    }
    else
    {
      objc_msgSend(a1, "currentTabs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __50__TabController__hasPinnedStartPageExcludingTabs___block_invoke;
      v8[3] = &unk_1E9CF2C90;
      v9 = v3;
      a1 = (void *)objc_msgSend(v6, "safari_containsObjectPassingTest:", v8);

    }
  }

  return a1;
}

uint64_t __32__TabController_setWindowState___block_invoke()
{
  return _WBSLocalizedString();
}

- (void)_forceUpdateTabGroupTitleIfNeeded:(id *)a1
{
  id v3;
  void *v4;
  int v5;
  id WeakRetained;
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "hasDynamicTitle");
    v4 = v7;
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);

      objc_msgSend(a1, "updateSelectedTabGroupName");
      v4 = v7;
    }
  }

}

- (void)updateSelectedTabGroupName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "displayTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isNamed"))
    v6 = v5;
  else
    v6 = 0;
  -[TabCollectionViewManager tabOverview](self->_tabCollectionViewManager, "tabOverview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  -[TabController activeProfile](self, "activeProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (objc_msgSend(WeakRetained, "canShowProfileInTabOverviewToolbar"))
  {
    v10 = objc_msgSend(v24, "isNamed");

    v11 = v24;
    if ((v10 & 1) == 0)
    {
      +[ToolbarItemConfiguration configurationForTabGroup:inProfile:](ToolbarItemConfiguration, "configurationForTabGroup:inProfile:", v24, v8);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {

    v11 = v24;
  }
  +[ToolbarItemConfiguration configurationForTabGroup:](ToolbarItemConfiguration, "configurationForTabGroup:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)v12;
  objc_msgSend(v4, "setTabGroupButtonConfiguration:", v12);

  v14 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v14, "bannerController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tabGroupBanner");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateTitle");

  -[TabController _updateTabOverviewBarButtonItems]((id *)&self->super.isa);
  -[TabController _titleForTabGroupButton]((id *)&self->super.isa);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _imageForTabGroupButton]((id *)&self->super.isa);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _setTabGroupButtonTitle:image:]((uint64_t)self, v17, v18);

  objc_msgSend(v14, "updateTabGroupButtonsVisibility");
  objc_msgSend(v14, "updateTabGroupHeading");
  objc_msgSend(v14, "rootViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unifiedBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNeedsLayout");

  objc_msgSend(v14, "libraryController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sidebarViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateSelectionByIgnoringExistingSelection:", 1);

  if (objc_msgSend(v24, "hasDynamicTitle"))
  {
    -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reloadTabGroup:", v24);

  }
}

- (id)tabGroupSwitcherViewController
{
  if (a1)
  {
    objc_msgSend(a1[9], "tabGroupSwitcherViewController");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)tabThumbnailCollectionView
{
  if (a1)
  {
    objc_msgSend(a1[9], "tabThumbnailCollectionView");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_updateTabOverviewBarButtonItems
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id location;

  if (a1)
  {
    objc_msgSend(a1, "activeTabGroupOrTabGroupVisibleInSwitcher");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isNamed")
      && (+[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "areSharedTabGroupsEnabled"),
          v3,
          (v4 & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_initWeak(&location, a1);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__TabController__updateTabOverviewBarButtonItems__block_invoke;
      v10[3] = &unk_1E9CF8150;
      objc_copyWeak(&v14, &location);
      v11 = v2;
      v7 = v5;
      v12 = v7;
      v8 = WeakRetained;
      v13 = v8;
      -[TabController shareRecordForActiveTabGroupWithCompletionHandler:](a1, v10);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
    else
    {
      objc_msgSend(a1[9], "tabOverview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBarButtonItems:", MEMORY[0x1E0C9AA60]);

    }
  }
}

- (id)_titleForTabGroupButton
{
  id *v1;
  void *v2;
  id WeakRetained;
  char v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "activeTabGroup");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(v1 + 1);
    if (objc_msgSend(WeakRetained, "canShowProfileInNavigationBar"))
    {
      v4 = objc_msgSend(v2, "isNamed");

      if ((v4 & 1) == 0)
      {
        objc_msgSend(v1, "activeProfile");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "title");
        v1 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_7:
        return v1;
      }
    }
    else
    {

    }
    objc_msgSend(v2, "displayTitle");
    v1 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v1;
}

- (void)_setTabGroupButtonTitle:(void *)a3 image:
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "barManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      v9 = (void *)MEMORY[0x1E0CB3498];
      objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributedStringWithAttachment:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendAttributedString:", v11);

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v8, "appendAttributedString:", v12);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
      objc_msgSend(v8, "appendAttributedString:", v13);

      objc_msgSend(v7, "setBarItem:attributedTitle:", 2, v8);
    }
    else
    {
      objc_msgSend(v7, "setBarItem:title:", 2, v14);
    }

  }
}

- (id)_imageForTabGroupButton
{
  id v1;
  id WeakRetained;
  int v3;
  void *v4;
  void *v5;
  int v6;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    v3 = objc_msgSend(WeakRetained, "canShowProfileInNavigationBar");

    if (v3)
    {
      objc_msgSend(v1, "activeProfile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "symbolImage");
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v1, "activeTabGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isShared");

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2.fill"));
        v1 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1 = 0;
      }
    }
  }
  return v1;
}

- (id)tabGroupsMenuForTabGroupButton:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC39D0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__TabController_tabGroupsMenuForTabGroupButton___block_invoke;
  v7[3] = &unk_1E9CF7FA0;
  objc_copyWeak(&v8, &location);
  v9 = a3;
  objc_msgSend(v4, "safari_menuWithTitle:uncachedChildrenProvider:", &stru_1E9CFDBB0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("TabGroupsMenu"));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

uint64_t __27__TabController_pinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned");
}

- (void)openInitialBlankTabDocumentIfNeeded
{
  void *v3;
  NSString *v4;
  NSString *activeTabGroupUUID;
  id WeakRetained;
  void *v7;
  id v8;
  TabDocument *v9;
  void *v10;
  TabDocument *v11;
  TabDocument *normalActiveTabDocument;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!self->_activeTabGroupUUID)
  {
    -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    activeTabGroupUUID = self->_activeTabGroupUUID;
    self->_activeTabGroupUUID = v4;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[TabController startPageBackgroundImageIdentifier](self, "startPageBackgroundImageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "loadBackgroundImageIfNeededForIdentifier:", v7);

  v8 = objc_loadWeakRetained((id *)&self->_browserController);
  if (!-[NSMutableArray count](self->_mutableNormalTabs, "count"))
  {
    v9 = [TabDocument alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:](v9, "initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:", 0, 0, v10, 0, 1, 0, v8);
    normalActiveTabDocument = self->_normalActiveTabDocument;
    self->_normalActiveTabDocument = v11;

    -[TabDocument setIsBlank:](self->_normalActiveTabDocument, "setIsBlank:", 1);
    -[TabDocument displayNewTabOverridePageIfNecessary](self->_normalActiveTabDocument, "displayNewTabOverridePageIfNecessary");
    -[NSMutableArray addObject:](self->_mutableNormalTabs, "addObject:", self->_normalActiveTabDocument);
    -[TabController activeTabGroup](self, "activeTabGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isPrivateBrowsing") & 1) != 0)
    {
      -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v13;
    }
    v15 = v14;
    v19[0] = self->_normalActiveTabDocument;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController persistTabs:inTabGroupWithUUID:inBackground:](self, "persistTabs:inTabGroupWithUUID:inBackground:", v16, v17, 1);

    -[TabDocument setHasBeenInserted:](self->_normalActiveTabDocument, "setHasBeenInserted:", 1);
  }
  -[TabController _createInitialPrivateTabIfNeeded]((id *)&self->super.isa);
  -[TabController _application](self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateTabCount");

  -[TabCollectionViewManager updateTabOverviewItems](self->_tabCollectionViewManager, "updateTabOverviewItems");
  objc_msgSend(v8, "clearCachedTabCompletionData");

}

- (void)_createInitialPrivateTabIfNeeded
{
  TabDocument *v2;
  void *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!objc_msgSend(a1[3], "count"))
    {
      v2 = [TabDocument alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      v5 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:](v2, "initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:", 0, 0, v3, 1, 1, 0, WeakRetained);
      v6 = a1[37];
      a1[37] = (id)v5;

      objc_msgSend(a1[37], "setIsBlank:", 1);
      objc_msgSend(a1[37], "displayNewTabOverridePageIfNecessary");
      objc_msgSend(a1[3], "addObject:", a1[37]);
      objc_msgSend(a1[35], "privateTabGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = a1[37];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "persistTabs:inTabGroupWithUUID:inBackground:", v8, v9, 1);

      objc_msgSend(a1[37], "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLastSelectedTabUUID:", v11);

      objc_msgSend(a1[37], "setHasBeenInserted:", 1);
    }
  }
}

- (id)_allTabGroupsAcrossWindows
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 48), "allSyncedTabGroupsExceptRemoteUnnamedTabGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "browserWindowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "browserControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "tabController", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "windowState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "localTabGroup");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "safari_addObjectUnlessNil:", v14);

        objc_msgSend(v13, "privateTabGroup");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "safari_addObjectUnlessNil:", v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v3;
}

__CFString *__44__TabController__localTabGroupTitleProvider__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  void *v4;
  id *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[35], "localTabGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tabs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[TabController _tabCountForDisplay](v2);
    if (v5
      && ((v6 = v5, v5 != (id *)1)
       || (objc_msgSend(v4, "firstObject"),
           v7 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v7, "url"),
           v8 = (void *)objc_claimAutoreleasedReturnValue(),
           v8,
           v7,
           v8)))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v10, v6);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _WBSLocalizedString();
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = &stru_1E9CFDBB0;
  }

  return v11;
}

- (WBSCloudTabDeviceProvider)profileCloudTabStore
{
  WBTabGroupManager *v3;

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSafariProfilesEnabled")
    && !-[TabController isInDefaultProfile](self, "isInDefaultProfile"))
  {
    v3 = self->_tabGroupManager;
  }
  else
  {
    -[TabController cloudTabStore](self, "cloudTabStore");
    v3 = (WBTabGroupManager *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isInDefaultProfile
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v3 = objc_msgSend(WeakRetained, "isInDefaultProfile");

  return v3;
}

- (CloudTabStore)cloudTabStore
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "browserWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudTabStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CloudTabStore *)v4;
}

- (WBWindowState)windowState
{
  return self->_windowState;
}

- (NSArray)normalTabs
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableNormalTabs, "copy");
}

- (void)persistTabs:(id)a3 inTabGroupWithUUID:(id)a4 inBackground:(BOOL)a5
{
  id v8;
  id v9;
  WBTabGroupManager *tabGroupManager;
  _QWORD v11[4];
  id v12;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    tabGroupManager = self->_tabGroupManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__TabController_Persistence__persistTabs_inTabGroupWithUUID_inBackground___block_invoke;
    v11[3] = &unk_1E9CF4180;
    v12 = v8;
    -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v9, 1, v11);
    if (!a5)
      -[WBTabGroupManager disableSuddenTerminationForPendingChanges](self->_tabGroupManager, "disableSuddenTerminationForPendingChanges");

  }
}

uint64_t __36__TabController_privateTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __29__TabController_tabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __74__TabController_Persistence__persistTabs_inTabGroupWithUUID_inBackground___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v3, "wbTab");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v9, "mutableCopy");

  }
  objc_msgSend(v3, "tabUpdateBlock");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v10)[2](v10, v8);

  return v8;
}

- (TabDocument)hiddenPrivateTabDocumentWhenShowingPrivateBrowsingExplanationText
{
  TabDocument *v3;

  if (-[TabDocument isPrivateBrowsingEnabled](self->_tabDocumentBeingHiddenFromTabView, "isPrivateBrowsingEnabled")
    && -[NSMutableArray count](self->_mutablePrivateTabs, "count") == 1)
  {
    v3 = self->_tabDocumentBeingHiddenFromTabView;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSString)deviceIdentifier
{
  return (NSString *)-[WBTabGroupManager deviceIdentifier](self->_tabGroupManager, "deviceIdentifier");
}

- (void)didGainOwnershipOfTab:(id)a3
{
  NSMapTable *uuidToTabMap;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  uuidToTabMap = self->_uuidToTabMap;
  objc_msgSend(v11, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](uuidToTabMap, "setObject:forKey:", v11, v5);

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v11;
    objc_msgSend(v8, "addRenderingProgressObserver:", self->_tabCollectionViewManager);
    objc_msgSend(v8, "libraryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[TabDocumentManager sharedManager](TabDocumentManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTab:", v8);

    }
    v7 = v11;
  }

}

- (void)updateFocusedTabGroupEnteringForeground
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[TabController _application](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "needsFocusedTabGroupUpdate")
    && (objc_msgSend(v3, "needsFocusProfileUpdate") & 1) == 0)
  {
    -[TabController focusedTabGroup](self, "focusedTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && !-[TabController isTabGroupActive:](self, "isTabGroupActive:", v4))
    {
      if (objc_msgSend(v3, "prefersSingleWindow"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
        objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "presentedViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;
        v10 = v9;
        if (v9 && objc_msgSend(v9, "role") == 1)
        {
          v11 = WBS_LOG_CHANNEL_PREFIXSiriLink();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "Has open FTG alert on entering foreground", (uint8_t *)&v14, 2u);
          }
        }
        else
        {
          objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);
          objc_msgSend(v4, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = WBS_LOG_CHANNEL_PREFIXSiriLink();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = 138543362;
            v15 = v12;
            _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_DEFAULT, "Opening FTG %{public}@ on entering foreground", (uint8_t *)&v14, 0xCu);
          }
          -[TabController setActiveTabGroupUUID:](self, "setActiveTabGroupUUID:", v12);

        }
      }
    }
    else if (self->_didFinishTabGroupSetup)
    {
      objc_msgSend(v3, "setNeedsFocusedTabGroupUpdate:", 0);
    }

  }
}

- (void)updateFocusProfileEnteringForeground
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "role");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v2, v3, "Closing unexpected alert with role (%lu) that was in the way when changing focus profile.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __74__TabController_Persistence__persistTabs_inTabGroupWithUUID_inBackground___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__TabController_Persistence__persistTabs_inTabGroupWithUUID_inBackground___block_invoke_2;
  v7[3] = &unk_1E9CF8BA0;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTabs:", v5);

}

- (void)_suppressSingleEmptyTabIfAppropriate
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id obj;

  if (a1 && (unint64_t)objc_msgSend(*(id *)(a1 + 24), "count") <= 1)
  {
    objc_msgSend(*(id *)(a1 + 24), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController _unhibernateTabIfNeeded:]((TabDocument *)a1, v2);
    obj = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(obj, "isBlank") && (objc_msgSend(obj, "isActive") & 1) == 0)
    {
      v3 = objc_msgSend(*(id *)(a1 + 72), "isShowingTabView");
      objc_msgSend(*(id *)(a1 + 72), "tabOverview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3
        || (objc_msgSend(obj, "tabOverviewItem"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(v4, "isItemAnimating:", v5),
            v5,
            (v6 & 1) == 0))
      {
        objc_msgSend((id)a1, "activeTabGroup");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isPrivateBrowsing");

        if ((v8 ^ 1 | v3) == 1)
        {
          objc_msgSend(*(id *)(a1 + 72), "tabSwitcherViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuidOfTabBeingSelected");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "uuidString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

          if ((v12 & 1) == 0)
          {
            objc_storeStrong((id *)(a1 + 32), obj);
            objc_msgSend(*(id *)(a1 + 32), "displayNewTabOverridePageIfNecessary");
            -[TabController _application]((void *)a1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "updateLockedPrivateBrowsingState");

            objc_msgSend(*(id *)(a1 + 72), "tabSwitcherViewController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setNeedsApplyContentAnimated:", 0);

          }
        }
      }

    }
  }
}

- (TabDocument)_unhibernateTabIfNeeded:(TabDocument *)a1
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v5 = objc_msgSend(v4, "isPrivateBrowsingEnabled");
      v6 = 16;
      if (v5)
        v6 = 24;
      v7 = *(id *)((char *)&a1->super.isa + v6);
      v8 = objc_msgSend(v7, "indexOfObject:", v4);
      -[TabDocument willLoseOwnershipOfTab:](a1, "willLoseOwnershipOfTab:", v4);
      a1 = -[TabDocument initWithHibernatedTab:]([TabDocument alloc], "initWithHibernatedTab:", v4);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v8, a1);
      objc_msgSend(v4, "webExtensionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didReplaceTab:newTab:", v4, a1);

    }
    else
    {
      a1 = v4;
    }
  }

  return a1;
}

- (BOOL)hasMultipleProfiles
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v3 = objc_msgSend(WeakRetained, "hasMultipleProfiles");

  return v3;
}

- (void)addDocumentObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[NSHashTable addObject:](self->_documentObservers, "addObject:");
  if (self->_documentUpdateCount)
  {
    -[NSHashTable addObject:](self->_documentObserversToReceiveUpdatesDidEnd, "addObject:", v4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "tabControllerWillBeginUpdates:", self);
  }

}

- (UIMenu)tabExposeMenu
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC39D0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__TabController_tabExposeMenu__block_invoke;
  v5[3] = &unk_1E9CF7008;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "safari_menuWithUncachedChildrenProvider:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return (UIMenu *)v3;
}

- (void)setPrivateBrowsingMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSHashTable *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  void *v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_privateBrowsingMode != a3)
  {
    v4 = a4;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[TabController currentTabDocuments](self, "currentTabDocuments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v33;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v11), "webView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_stopAllMediaPlayback");

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v9);
    }

    -[TabController activeTabDocument](self, "activeTabDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_privateBrowsingMode = a3;
    -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "presentationState");

    if (v15)
      -[TabController _suppressSingleEmptyTabIfAppropriate]((uint64_t)self);
    -[TabCollectionViewManager setPrivateBrowsingEnabled:animated:](self->_tabCollectionViewManager, "setPrivateBrowsingEnabled:animated:", self->_privateBrowsingMode == 1, v4);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = self->_documentObservers;
    v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v20);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v21, "tabControllerDidChangeCurrentTabDocuments:", self, (_QWORD)v28);
          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v18);
    }

    -[TabController activeTabDocument](self, "activeTabDocument");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController _switchActiveTabDocumentFromTabDocument:toTabDocument:]((uint64_t)self, v13, v22);

    -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "toolbar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBarButton:enabled:", 1, 1);

    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "setNeedsSnapshotUpdateForActiveTabIfTabIsBlank");
    -[TabController updateTabCount](self, "updateTabCount");
    objc_msgSend(WeakRetained, "configuration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "allowsRestoringEducationTabs");

    if (v27)
      -[TabController _restoreEducationTabsIfNecessaryAnimated:]((uint64_t)self, 0);

  }
}

- (void)setPrivateBrowsingEnabled:(BOOL)a3
{
  -[TabController setPrivateBrowsingMode:animated:](self, "setPrivateBrowsingMode:animated:", a3, 1);
}

- (void)setPinnedTabsManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedTabsManager, a3);
}

- (TabController)initWithBrowserController:(id)a3
{
  id v4;
  TabController *v5;
  TabController *v6;
  uint64_t v7;
  NSUUID *browserWindowUUID;
  TabCollectionViewManager *v9;
  TabCollectionViewManager *tabCollectionViewManager;
  NSMutableArray *v11;
  NSMutableArray *mutableNormalTabs;
  NSMutableArray *v13;
  NSMutableArray *mutablePrivateTabs;
  uint64_t v15;
  NSMapTable *uuidToTabMap;
  uint64_t v17;
  NSHashTable *documentObservers;
  uint64_t v19;
  NSMutableArray *expandedTabGroupUUIDs;
  WBSTabOrderManager *v21;
  WBSTabOrderManager *tabOrderManager;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *activeTabGroupUUID;
  uint64_t v28;
  WBTabGroupManager *tabGroupManager;
  NSUndoManager *v30;
  NSUndoManager *undoManager;
  void *v32;
  void *v33;
  TabController *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TabController;
  v5 = -[TabController init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserController, v4);
    objc_msgSend(v4, "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    browserWindowUUID = v6->_browserWindowUUID;
    v6->_browserWindowUUID = (NSUUID *)v7;

    v9 = objc_alloc_init(TabCollectionViewManager);
    tabCollectionViewManager = v6->_tabCollectionViewManager;
    v6->_tabCollectionViewManager = v9;

    -[TabCollectionViewManager setDataSource:](v6->_tabCollectionViewManager, "setDataSource:", v6);
    -[TabCollectionViewManager setBrowserController:](v6->_tabCollectionViewManager, "setBrowserController:", v4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableNormalTabs = v6->_mutableNormalTabs;
    v6->_mutableNormalTabs = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutablePrivateTabs = v6->_mutablePrivateTabs;
    v6->_mutablePrivateTabs = v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    uuidToTabMap = v6->_uuidToTabMap;
    v6->_uuidToTabMap = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v17 = objc_claimAutoreleasedReturnValue();
    documentObservers = v6->_documentObservers;
    v6->_documentObservers = (NSHashTable *)v17;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    expandedTabGroupUUIDs = v6->_expandedTabGroupUUIDs;
    v6->_expandedTabGroupUUIDs = (NSMutableArray *)v19;

    v21 = (WBSTabOrderManager *)objc_alloc_init(MEMORY[0x1E0D8AD18]);
    tabOrderManager = v6->_tabOrderManager;
    v6->_tabOrderManager = v21;

    -[WBSTabOrderManager setTabOrderProvider:](v6->_tabOrderManager, "setTabOrderProvider:", v6);
    objc_msgSend(v4, "windowState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localTabGroup");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    activeTabGroupUUID = v6->_activeTabGroupUUID;
    v6->_activeTabGroupUUID = (NSString *)v26;

    objc_msgSend(v4, "tabGroupManager");
    v28 = objc_claimAutoreleasedReturnValue();
    tabGroupManager = v6->_tabGroupManager;
    v6->_tabGroupManager = (WBTabGroupManager *)v28;

    -[WBTabGroupManager addTabGroupObserver:](v6->_tabGroupManager, "addTabGroupObserver:", v6);
    v30 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E0CB3A48]);
    undoManager = v6->_undoManager;
    v6->_undoManager = v30;

    -[NSUndoManager setGroupsByEvent:](v6->_undoManager, "setGroupsByEvent:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v6, sel__cloudTabsDidUpdate_, CFSTR("CloudTabStoreDidUpdateNotification"), 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v6, sel__beganSharingTabGroup_, *MEMORY[0x1E0D4F290], 0);
    objc_msgSend(MEMORY[0x1E0DCCB80], "sharedProxy");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSyncObserver:", v6);

    objc_msgSend(v32, "addObserver:selector:name:object:", v6, sel__lockedPrivateBrowsingStateDidChange_, CFSTR("lockedPrivateBrowsingStateDidChangeNotification"), 0);
    v34 = v6;

  }
  return v6;
}

- (NSArray)normalAndPrivateTabs
{
  NSMutableArray *mutableNormalTabs;
  void *v3;
  void *v4;

  mutableNormalTabs = self->_mutableNormalTabs;
  -[TabController privateTabs](self, "privateTabs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray arrayByAddingObjectsFromArray:](mutableNormalTabs, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)privateTabs
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutablePrivateTabs, "copy");
}

- (id)tabDocumentWithUUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[TabController tabWithUUID:](self, "tabWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setWindowState:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_windowState, a3);
    -[TabController _localTabGroupTitleProvider](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplayTitleProvider:", v5);

    -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayTitleProvider:", &__block_literal_global_49);

    -[WBTabGroupManager registerWindowState:](self->_tabGroupManager, "registerWindowState:", v8);
  }

}

- (id)_localTabGroupTitleProvider
{
  void *v1;
  _QWORD v3[4];
  id v4;
  id location;

  if (!val)
    return 0;
  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__TabController__localTabGroupTitleProvider__block_invoke;
  v3[3] = &unk_1E9CF82E8;
  objc_copyWeak(&v4, &location);
  v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)unnamedTabGroupDisplayTitleProvider
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__TabController_unnamedTabGroupDisplayTitleProvider__block_invoke;
  v4[3] = &unk_1E9CF8310;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)privateBrowsingAvailabilityDidChange
{
  id v3;

  -[TabController updateSelectedTabGroupName](self, "updateSelectedTabGroupName");
  -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadTabGroups");

}

- (WBTabGroup)unnamedTabGroup
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "unnamedTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBTabGroup *)v3;
}

- (NSArray)namedTabGroups
{
  return (NSArray *)-[TabController _syncedTabGroupsForActiveProfileWithOptions:](self, 2);
}

- (id)_syncedTabGroupsForActiveProfileWithOptions:(_QWORD *)a1
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  if (a2 == 2)
  {
    v6 = (void *)a1[6];
    objc_msgSend(a1, "activeProfileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "namedTabGroupsForProfileWithIdentifier:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a2 == 1)
  {
    v3 = (void *)a1[6];
    objc_msgSend(a1, "activeProfileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unnamedTabGroupsForProfileWithIdentifier:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v2 = (void *)v5;

  }
  return v2;
}

- (NSString)activeProfileIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "activeProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasUnreadTab
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShared");

  if (!v4)
    return 0;
  -[TabController currentTabs](self, "currentTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_containsObjectPassingTest:", &__block_literal_global_395);

  return v6;
}

- (void)tabGroupManagerDidFinishSetup:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  -[TabController _application](self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isRunningPPT") || objc_msgSend(v6, "shouldRestoreStateForPPT"))
  {
    self->_didFinishTabGroupSetup = 1;
    -[TabController readState](self, "readState");
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);

    -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadTabGroups");

  }
}

- (BOOL)updatingTabGroupTabs
{
  return self->_updateTabsSuppressionCount != 0;
}

- (void)updateTabCount
{
  NSHashTable *v3;
  uint64_t v4;
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
  -[TabController _updateAddTabButtonEnabled]((id *)&self->super.isa);
  -[TabController updateLocalTabGroupTitle](self, "updateLocalTabGroupTitle");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_documentObservers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "tabControllerDocumentCountDidChange:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __47__TabController__replaceTabs_withTabs_persist___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  id WeakRetained;

  objc_msgSend(a1[4], "unpinnedTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    goto LABEL_4;
  v3 = a1[4];
  if (v3)
  {
    if ((-[TabController _hasPinnedStartPageExcludingTabs:](v3, 0) & 1) != 0)
    {
LABEL_4:

      goto LABEL_5;
    }
    v3 = a1[4];
  }
  v7 = objc_msgSend(v3, "updatingTabGroupTabs");

  if ((v7 & 1) == 0)
    v8 = -[TabController _openBlankTabDocument]((id *)a1[4]);
LABEL_5:
  v4 = objc_msgSend(a1[5], "count");
  if (v4 != objc_msgSend(a1[6], "count"))
    objc_msgSend(a1[4], "updateTabCount");
  if ((objc_msgSend(*((id *)a1[4] + 9), "tabBarItemsFixed") & 1) == 0)
  {
    v5 = objc_msgSend(a1[5], "count");
    if (v5 != objc_msgSend(a1[6], "count"))
    {
      -[TabController _application](a1[4]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateTabCount");

    }
    objc_msgSend(*((id *)a1[4] + 9), "updateTabOverviewItems");
    objc_msgSend(*((id *)a1[4] + 9), "updateTabBarAnimated:", 0);
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 1);
    objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);

  }
}

- (void)updateLocalTabGroupTitle
{
  BOOL v3;
  id v4;

  -[TabController currentTabs](self, "currentTabs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v3 = -[TabCollectionViewManager tabBarItemsFixed](self->_tabCollectionViewManager, "tabBarItemsFixed");

    if (v3)
      return;
    -[TabController activeTabGroup](self, "activeTabGroup");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TabController _forceUpdateTabGroupTitleIfNeeded:]((id *)&self->super.isa, v4);
  }

}

- (void)_updateAddTabButtonEnabled
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1[9], "tabThumbnailCollectionView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toolbar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBarButton:enabled:", 1, objc_msgSend(a1, "canAddNewTabForCurrentBrowsingMode"));

  }
}

- (BOOL)canAddNewTabForPrivateBrowsing:(BOOL)a3
{
  int v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v3 = a3;
  -[TabController activeTabGroup](self, "activeTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPrivateBrowsing") != v3)
  {
    if ((v3 & 1) != 0)
      -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
    else
      -[TabController unnamedTabGroup](self, "unnamedTabGroup");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  -[TabController _tabsForPrivateBrowsing:]((char *)self, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = -[TabController canAddNewTabInTabGroup:withTabCount:](self, "canAddNewTabInTabGroup:withTabCount:", v5, v8);
  return v9;
}

- (id)_application
{
  if (a1)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)canAddNewTabForCurrentBrowsingMode
{
  return -[TabController canAddNewTabForPrivateBrowsing:](self, "canAddNewTabForPrivateBrowsing:", -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
}

- (void)_didPerformBatchUpdates
{
  id v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(a1[9], "endFixingTabBarItems");
    objc_msgSend(a1[9], "endFixingTabOverviewItems");
    objc_msgSend(a1[9], "updateTabOverviewItems");
    v2 = a1[9];
    v3 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
    objc_msgSend(a1, "activeTabDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateTabBarAnimated:keepingTabVisible:", v3, v4);

    -[TabController _sendDidEndDocumentUpdates]((uint64_t)a1);
  }
}

- (BOOL)isShowingLibraryDocument
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TabController activeTabDocument](self, "activeTabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (WBTabGroup)privateTabGroupIfAvailable
{
  id WeakRetained;
  NSString *activeTabGroupUUID;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (objc_msgSend(WeakRetained, "isPrivateBrowsingAvailable"))
  {

  }
  else
  {
    activeTabGroupUUID = self->_activeTabGroupUUID;
    -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(activeTabGroupUUID) = -[NSString isEqual:](activeTabGroupUUID, "isEqual:", v6);

    if (!(_DWORD)activeTabGroupUUID)
    {
      v7 = 0;
      return (WBTabGroup *)v7;
    }
  }
  -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return (WBTabGroup *)v7;
}

- (void)makeActiveTabDocumentActive
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[TabController activeTabDocument](self, "activeTabDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_documentObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "tabController:didSwitchFromTabDocument:toTabDocument:", self, 0, v3, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)saveTabDocumentUserActivitySoon:(id)a3
{
  TabDocument *v4;
  NSTimer *v5;
  NSTimer *updateContinuityTimer;
  TabDocument *v7;

  v4 = (TabDocument *)a3;
  if (!self->_updateContinuityTimer && self->_normalActiveTabDocument == v4)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateUserActivityTimerFired, 0, 0, 1.0);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    updateContinuityTimer = self->_updateContinuityTimer;
    self->_updateContinuityTimer = v5;

    -[NSTimer setTolerance:](self->_updateContinuityTimer, "setTolerance:", 1.0);
    v4 = v7;
  }

}

- (TabCollectionViewProviding)tabCollectionViewProvider
{
  return (TabCollectionViewProviding *)self->_tabCollectionViewManager;
}

- (void)_sendWillBeginDocumentUpdates
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 128);
    *(_QWORD *)(a1 + 128) = v2 + 1;
    if (!v2)
    {
      v3 = objc_msgSend(*(id *)(a1 + 104), "copy");
      v4 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v3;

      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = *(id *)(a1 + 112);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v10, "tabControllerWillBeginUpdates:", a1, (_QWORD)v11);
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)_sendDidEndDocumentUpdates
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 128) - 1;
    *(_QWORD *)(a1 + 128) = v2;
    if (!v2)
    {
      v3 = *(id *)(a1 + 112);
      v4 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = 0;

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v10, "tabControllerDidEndUpdates:", a1, (_QWORD)v12);
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

    }
    +[TabDocumentManager sharedManager](TabDocumentManager, "sharedManager", (_QWORD)v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reclaimTabsIfNeeded");

  }
}

id __65__TabController_tabGroupManager_didUpdateTabsInTabGroupWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int8x16_t v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  int8x16_t v15;

  objc_msgSend(*(id *)(a1 + 32), "tabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __65__TabController_tabGroupManager_didUpdateTabsInTabGroupWithUUID___block_invoke_2;
  v14 = &unk_1E9CF87A8;
  v10 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v10.i64[0];
  v15 = vextq_s8(v10, v10, 8uLL);
  objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "usesGlobalPinnedTabs"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "isPrivateBrowsing");
    v6 = *(void **)(a1 + 40);
    if ((v5 & 1) != 0)
      -[TabController privatePinnedTabs](v6);
    else
      -[TabController normalPinnedTabs](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v4, *(_OWORD *)&v10, v11, v12, v13, v14);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }

  return v4;
}

void __37__TabController__cloudTabsDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 89))
  {
    *(_BYTE *)(v1 + 89) = 1;
    -[TabController _restoreEducationTabsIfNecessaryAnimated:](*(_QWORD *)(a1 + 32), 1);
  }
}

- (void)tabGroupManager:(id)a3 didUpdateTabsInTabGroupWithUUID:(id)a4
{
  void *v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  int v13;
  NSMutableArray *mutablePrivateTabs;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSMutableArray *mutableNormalTabs;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  id v26;
  TabController *v27;

  objc_msgSend(a3, "tabGroupWithUUID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __65__TabController_tabGroupManager_didUpdateTabsInTabGroupWithUUID___block_invoke;
  v25 = &unk_1E9CF87D0;
  v6 = v5;
  v26 = v6;
  v27 = self;
  v7 = (void (**)(_QWORD))_Block_copy(&v22);
  if (-[TabController isTabGroupActive:](self, "isTabGroupActive:", v6, v22, v23, v24, v25))
  {
    -[TabController currentTabs](self, "currentTabs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController _replaceTabs:withTabs:persist:](self, v8, v9, 0);

LABEL_7:
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);

  -[TabCollectionViewManager tabSwitcherViewController](self->_tabCollectionViewManager, "tabSwitcherViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsApplyContentAnimated:", 1);

  -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqual:", v12);

  if (v13)
  {
    mutablePrivateTabs = self->_mutablePrivateTabs;
    v7[2](v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setArray:](mutablePrivateTabs, "setArray:", v15);

    -[TabController _suppressSingleEmptyTabIfAppropriate]((uint64_t)self);
  }
  else
  {
    objc_msgSend(v6, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray firstObject](self->_mutableNormalTabs, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "wbTab");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tabGroupUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "isEqual:", v19);

    if (v20)
    {
      mutableNormalTabs = self->_mutableNormalTabs;
      v7[2](v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setArray:](mutableNormalTabs, "setArray:", v8);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (BOOL)isTabGroupActive:(id)a3
{
  void *v4;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isEqualToString:", self->_activeTabGroupUUID);

  return (char)self;
}

- (NSArray)pinnedTabs
{
  void *v2;
  void *v3;

  -[TabController currentTabs](self, "currentTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_replaceTabs:(void *)a3 withTabs:(unsigned int)a4 persist:
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  void *v48;
  int v49;
  uint64_t k;
  id WeakRetained;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t m;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD block[4];
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[5];
  id v108;
  id v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __47__TabController__replaceTabs_withTabs_persist___block_invoke;
    v107[3] = &unk_1E9CF2990;
    v107[4] = a1;
    v10 = v8;
    v108 = v10;
    v11 = v7;
    v109 = v11;
    objc_msgSend(v9, "setHandler:", v107);
    if (objc_msgSend(v11, "count") || objc_msgSend(v10, "count"))
    {
      objc_msgSend(a1, "activeTabDocument");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (uint64_t)a1;
      -[TabController mutableCurrentTabs]((char *)a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count")
        && (v14 = objc_msgSend(v11, "count"), v14 == objc_msgSend(v13, "count"))
        && !objc_msgSend(v10, "count"))
      {
        ++*(_QWORD *)(v85 + 176);
        v66 = -[TabController _openBlankTabDocument]((id *)v85);
        --*(_QWORD *)(v85 + 176);
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(v13, "removeObjectsInArray:", v11);
      objc_msgSend(v13, "safari_insertObjects:afterObject:", v10, 0);
      objc_msgSend(v10, "differenceFromArray:withOptions:", v11, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "hasChanges"))
      {
        v77 = __PAIR64__(v15, a4);
        v81 = v7;
        v83 = v13;
        v78 = v12;
        v79 = v9;
        v80 = v8;
        -[TabController _sendWillBeginDocumentUpdates](v85);
        objc_msgSend(*(id *)(v85 + 72), "beginFixingTabBarItems");
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v84 = v16;
        objc_msgSend(v16, "insertions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v104;
          v21 = MEMORY[0x1E0C80D38];
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v104 != v20)
                objc_enumerationMutation(v17);
              v23 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
              if (objc_msgSend(v23, "associatedIndex", v77) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v23, "object");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setHasBeenInserted:", 1);
                objc_msgSend(v24, "setNeedsNewTabSnapshot");
                if ((objc_msgSend(*(id *)(v85 + 208), "containsObject:", v24) & 1) == 0)
                {
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __47__TabController__replaceTabs_withTabs_persist___block_invoke_2;
                  block[3] = &unk_1E9CF1900;
                  v102 = v24;
                  dispatch_async(v21, block);

                }
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
          }
          while (v19);
        }

        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        objc_msgSend(v84, "removals");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
        if (v26)
        {
          v27 = v26;
          v28 = 0;
          v29 = *(_QWORD *)v98;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v98 != v29)
                objc_enumerationMutation(v25);
              v31 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
              if (objc_msgSend(v31, "associatedIndex", v77) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v31, "object");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v85, "willLoseOwnershipOfTab:", v32);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || (+[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager"),
                      v33 = (void *)objc_claimAutoreleasedReturnValue(),
                      v34 = objc_msgSend(v33, "isTabSuspended:", v32),
                      v33,
                      (v34 & 1) == 0))
                {
                  objc_msgSend(v32, "willClose");
                  objc_msgSend(v32, "setClosed:", 1);
                }
                objc_msgSend((id)v85, "activeTabDocument");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v32 == v35;

                if (objc_msgSend(v32, "isClosed"))
                {
                  objc_msgSend(v32, "webExtensionsController");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "tabIDToTabPositionForTabsInTransit");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = v25;
                  v40 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v32, "idForWebExtensions");
                  objc_msgSend(v40, "numberWithDouble:");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "removeObjectForKey:", v41);

                  v25 = v39;
                  v94[0] = MEMORY[0x1E0C809B0];
                  v94[1] = 3221225472;
                  v94[2] = __47__TabController__replaceTabs_withTabs_persist___block_invoke_3;
                  v94[3] = &unk_1E9CF1830;
                  v95 = v37;
                  v96 = v32;
                  v42 = v37;
                  dispatch_async(MEMORY[0x1E0C80D38], v94);

                }
                v28 |= v36;

              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
          }
          while (v27);
        }
        else
        {
          v28 = 0;
        }

        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        objc_msgSend(v84, "insertions");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v90, v111, 16);
        if (v44)
        {
          v45 = v44;
          v46 = 0;
          v47 = *(_QWORD *)v91;
          v7 = v81;
          v48 = v83;
          v49 = v77;
          do
          {
            for (k = 0; k != v45; ++k)
            {
              if (*(_QWORD *)v91 != v47)
                objc_enumerationMutation(v43);
              v46 |= objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * k), "associatedIndex", v77) != 0x7FFFFFFFFFFFFFFFLL;
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v90, v111, 16);
          }
          while (v45);
        }
        else
        {
          v46 = 0;
          v7 = v81;
          v48 = v83;
          v49 = v77;
        }

        objc_msgSend(MEMORY[0x1E0D8ADC8], "tabIDToTabPositionDictionaryForTabs:", v48);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v46 & 1) != 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)(v85 + 8));
          objc_msgSend(WeakRetained, "browserWindowController");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabController _application]((void *)v85);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "browserWindowController");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52 == v54)
          {
            objc_msgSend(MEMORY[0x1E0D8ADC8], "tabIDToTabPositionDictionaryForTabs:", v48);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "firstObject");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "webExtensionsController");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "fireOnMovedEventForTabsWithPreviousTabPositions:currentTabsPositions:", v82, v55);

          }
        }
        if ((HIDWORD(v77) | v49) == 1)
          objc_msgSend((id)v85, "didUpdateTabDocuments");
        if ((v28 & 1) != 0)
        {
          v58 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend((id)v85, "activeTabGroup");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "lastSelectedTabUUID");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)objc_msgSend(v58, "initWithUUIDString:", v60);
          objc_msgSend((id)v85, "tabWithUUID:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v62 || (objc_msgSend(v48, "containsObject:", v62) & 1) == 0)
          {
            -[TabController _firstUnpinnedTab]((void *)v85);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v63;
            if (v63)
            {
              v65 = v63;
            }
            else
            {
              objc_msgSend(v48, "firstObject");
              v65 = (id)objc_claimAutoreleasedReturnValue();
            }
            v67 = v65;

            v62 = v67;
          }
          -[TabController _unhibernateTabIfNeeded:]((TabDocument *)v85, v62);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabController _setActiveTabDocument:]((_QWORD *)v85, v68);

        }
        v69 = objc_loadWeakRetained((id *)(v85 + 8));
        objc_msgSend(v69, "clearCachedTabCompletionData");
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v70 = *(id *)(v85 + 104);
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v86, v110, 16);
        if (v71)
        {
          v72 = v71;
          v73 = *(_QWORD *)v87;
          do
          {
            for (m = 0; m != v72; ++m)
            {
              if (*(_QWORD *)v87 != v73)
                objc_enumerationMutation(v70);
              v75 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * m);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v75, "tabControllerDidChangeCurrentTabDocuments:", v85);
            }
            v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v86, v110, 16);
          }
          while (v72);
        }

        objc_msgSend((id)v85, "activeTabDocument");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v78;
        -[TabController _switchActiveTabDocumentFromTabDocument:toTabDocument:](v85, v78, v76);

        -[TabController _sendDidEndDocumentUpdates](v85);
        objc_msgSend(*(id *)(v85 + 72), "endFixingTabBarItems");

        v9 = v79;
        v8 = v80;
        v13 = v83;
        v16 = v84;
      }

    }
  }

}

- (char)mutableCurrentTabs
{
  char *v1;
  int v2;
  uint64_t v3;

  if (a1)
  {
    v1 = a1;
    v2 = objc_msgSend(a1, "isPrivateBrowsingEnabled");
    v3 = 16;
    if (v2)
      v3 = 24;
    a1 = (char *)*(id *)&v1[v3];
  }
  return a1;
}

- (void)_cloudTabsDidUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__TabController__cloudTabsDidUpdate___block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_restoreEducationTabsIfNecessaryAnimated:(uint64_t)a1
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "allowsRestoringEducationTabs") && !*(_BYTE *)(a1 + 88))
    {
      v5 = +[WBUFeatureManager accessLevel](FeatureManager, "accessLevel");

      if (v5 != 2)
      {
LABEL_13:

        return;
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_sf_dateForKey:", CFSTR("SafariEducationModeEducationTabsLastSyncDate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "cloudTabStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6
        || (objc_msgSend(v6, "timeIntervalSinceReferenceDate"),
            v10 = v9,
            objc_msgSend(v8, "lastModified"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "timeIntervalSinceReferenceDate"),
            v13 = v12,
            v11,
            v10 < v13))
      {
        objc_msgSend(v8, "tabs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count") || *(_BYTE *)(a1 + 89))
        {
          *(_BYTE *)(a1 + 88) = 1;
          objc_msgSend(WeakRetained, "browserWindowController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "restoreEducationDeviceCloudTabs:animated:", v14, a2);

          objc_msgSend((id)a1, "updateEducationTabsLastSyncDate");
        }

      }
    }

    goto LABEL_13;
  }
}

- (id)updateProfileWithIdentifier:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6
{
  return (id)-[WBTabGroupManager updateProfileWithIdentifier:persist:usingBlock:completionHandler:](self->_tabGroupManager, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", a3, a4, a5, a6);
}

- (void)closeTabsAutomaticallyIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  WBTabGroupManager *tabGroupManager;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t v26[16];
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  _QWORD v31[7];
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;

  v3 = objc_msgSend(MEMORY[0x1E0D8A7A8], "automaticTabClosingInterval");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)buf = 0;
    v33 = buf;
    v34 = 0x2020000000;
    v35 = v5;
    -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tabs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke;
    v31[3] = &unk_1E9CF78A8;
    v31[4] = self;
    v31[5] = buf;
    v31[6] = v4;
    objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8A7A8], "setMostDistantLastViewedTime:", *((double *)v33 + 3));
    if (objc_msgSend(v12, "count"))
    {
      -[TabController activeTabGroup](self, "activeTabGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isLocal");

      if (v14)
      {
        v30[0] = v11;
        v30[1] = 3221225472;
        v30[2] = __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_5;
        v30[3] = &unk_1E9CF78D0;
        v30[4] = self;
        objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
          -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v15, 0, 1, 0, 1);

      }
      else
      {
        tabGroupManager = self->_tabGroupManager;
        -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v11;
        v28[1] = 3221225472;
        v28[2] = __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_2;
        v28[3] = &unk_1E9CF78F8;
        v29 = v12;
        -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v20, 1, v28);

      }
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_3;
      v27[3] = &unk_1E9CF78D0;
      v27[4] = self;
      objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v21, 0, 0, 0, 1);
        +[Application sharedApplication](Application, "sharedApplication");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "updateLockedPrivateBrowsingState");

      }
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v12, "count");
      WBSAutomaticTabClosingIntervalAnalyticsTitle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "didCloseTabsAutomaticallyWithCount:tabClosingInterval:", v24, v25);

    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXTabs();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1D7CA3000, v17, OS_LOG_TYPE_DEFAULT, "Not closing any tabs, because none were eligible to close automatically", v26, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v16, OS_LOG_TYPE_DEFAULT, "Not closing any tabs, since the user's preference is to never close tabs automatically", buf, 2u);
    }
  }
}

uint64_t __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  NSObject *v14;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  objc_msgSend(v4, "tabWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "isActive"))
  {
    objc_msgSend(v3, "localAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastVisitTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_msgSend(v12, "timeIntervalSinceReferenceDate"), v13 > 0.0))
    {
      WBSAutomaticTabClosingIntervalTimeInterval();
      if ((objc_msgSend(v3, "canCloseAutomaticallyForInterval:") & 1) != 0)
      {
        v10 = 1;
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v12);
      v18 = v17;

      if (v18 > 0.0)
      {
        v10 = 0;
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v20 = *(double *)(v19 + 24);
        if (v20 >= v18)
          v20 = v18;
        *(double *)(v19 + 24) = v20;
        goto LABEL_11;
      }
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXTabs();
      v10 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_DEFAULT, "Not closing tab automatically because lastViewedTime is unknown.", v21, 2u);
    }
    v10 = 0;
    goto LABEL_11;
  }
  v9 = WBS_LOG_CHANNEL_PREFIXTabs();
  v10 = 0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "Not closing tab automatically because it is active", buf, 2u);
    v10 = 0;
  }
LABEL_12:

  return v10;
}

id __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isPrivateBrowsing") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);
    objc_msgSend(v5, "tabWithUUID:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_closeTabs:(unsigned int)a3 animated:(int)a4 allowAddingToRecentlyClosedTabs:(char)a5 keepWebViewAlive:(int)a6 showAutoCloseTabsAlert:
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  unsigned __int8 v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  TabDocument *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  char isKindOfClass;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  uint64_t v80;
  int v81;
  void *v82;
  void *v83;
  int v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v92;
  id WeakRetained;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  if (!a1)
    goto LABEL_103;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportTabUpdatedWithUpdateType:", 3);

  -[TabController _sendEventsForAutoFillTelemetryForClosingTabs:](a1, v10);
  *(_BYTE *)(a1 + 136) = 1;
  -[TabController _sendWillBeginDocumentUpdates](a1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPrivateBrowsingEnabled");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v13;
  -[TabController _mutableTabsForPrivateBrowsing:]((char *)a1, v13);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wbTab");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tabGroupUUID");
  v15 = objc_claimAutoreleasedReturnValue();

  v87 = v12;
  v88 = (void *)v15;
  v84 = a6;
  if (!v15 && objc_msgSend(v12, "isPrivateBrowsingEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 280), "privateTabGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

    v88 = v17;
    goto LABEL_9;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)a1, "currentTabs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", v12);

    if (v19)
    {
      v17 = *(id *)(a1 + 56);
      v16 = v88;
      goto LABEL_8;
    }
  }
LABEL_9:
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v85 = v10;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v102, v108, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v103 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        if (a4)
        {
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * i), "isBlank") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v25, "hibernate");
          }
          objc_msgSend(WeakRetained, "configuration");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "allowsReopeningClosedTabs");

          if (v27)
            objc_msgSend(v92, "addObject:", v25);
        }
        if ((a5 & 1) == 0)
          objc_msgSend(v25, "setClosed:", 1);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v102, v108, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v92, "count"))
    -[TabController _addTabsToRecentlyClosed:](a1, v92);
  objc_msgSend((id)a1, "activeTabDocument");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 && objc_msgSend(v20, "containsObject:", v28))
  {
    if ((objc_msgSend(v90, "containsObject:", v28) & 1) == 0)
      objc_msgSend(v90, "addObject:", v28);
    v29 = 1;
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v20, "safari_filterObjectsUsingBlock:", &__block_literal_global_66);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v89 & 1) != 0)
    objc_msgSend((id)a1, "privateUnpinnedTabs");
  else
    objc_msgSend((id)a1, "normalUnpinnedTabs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  v33 = objc_msgSend(v30, "count");
  v34 = -[TabController _hasPinnedStartPageExcludingTabs:]((void *)a1, v20);
  v35 = 0;
  if (v33 >= v32 && (v34 & 1) == 0)
  {
    objc_msgSend((id)a1, "currentTabs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "containsObject:", v87);

    if (v37)
    {
      objc_msgSend(*(id *)(a1 + 72), "beginFixingTabBarItems");
      objc_msgSend(*(id *)(a1 + 72), "beginFixingTabOverviewItems");
      if (objc_msgSend((id)a1, "isPrivateBrowsingEnabled"))
      {
        -[TabController tabThumbnailCollectionView]((id *)a1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "presentationState");

        if (v39)
        {
          v40 = -[TabDocument initWithBrowserController:]([TabDocument alloc], "initWithBrowserController:", WeakRetained);
          v41 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v40;

          v35 = 1;
          objc_msgSend(*(id *)(a1 + 32), "setIsBlank:", 1);
          objc_msgSend(*(id *)(a1 + 32), "setScrollPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
          objc_msgSend((id)a1, "insertTab:afterTab:inBackground:animated:", *(_QWORD *)(a1 + 32), 0, 1, 0);
          objc_msgSend(*(id *)(a1 + 32), "displayNewTabOverridePageIfNecessary");
          goto LABEL_50;
        }
      }
      if (v89 == objc_msgSend((id)a1, "isPrivateBrowsingEnabled"))
        v46 = -[TabController _openBlankTabDocument]((id *)a1);
    }
    else
    {
      objc_msgSend((id)a1, "alternateTabs");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "containsObject:", v87);

      if (!v43)
      {
        v35 = 0;
        goto LABEL_50;
      }
      objc_msgSend(*(id *)(a1 + 72), "beginFixingTabBarItems");
      objc_msgSend(*(id *)(a1 + 72), "beginFixingTabOverviewItems");
      -[TabController _insertNewBlankTabDocumentWithPrivateBrowsing:inBackground:animated:]((id *)a1, v89, 1, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v89)
      {
        objc_storeStrong((id *)(a1 + 296), v44);
        v45 = 32;
      }
      else
      {
        v45 = 304;
      }
      v47 = *(void **)(a1 + v45);
      *(_QWORD *)(a1 + v45) = v44;

    }
    v35 = 1;
  }
LABEL_50:
  v48 = v28;
  v49 = v48;
  v82 = v48;
  v81 = v35;
  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 320), "tabToSelectBeforeClosingTabs:", v20);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "tabOverview");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "presentationState"))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_55:
        objc_msgSend(*(id *)(a1 + 72), "setSuppressTabBarAnimation:", a3 ^ 1);
        objc_msgSend((id)a1, "setActiveTab:", v50);
        objc_msgSend(*(id *)(a1 + 72), "setSuppressTabBarAnimation:", 0);
        v79 = v50;
        v86 = v50;
        goto LABEL_57;
      }
      objc_msgSend(v50, "webView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "_hideContentUntilNextUpdate");
    }

    goto LABEL_55;
  }
  v79 = 0;
  v86 = v48;
LABEL_57:
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v53 = v20;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v99 != v56)
          objc_enumerationMutation(v53);
        v58 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
        if ((a5 & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v58, "willClose");
        }
        objc_msgSend(v90, "removeObject:", v58, v79);
        if (v58 == *(void **)(a1 + 32))
        {
          *(_QWORD *)(a1 + 32) = 0;

        }
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
    }
    while (v55);
  }
  v83 = v30;

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v59 = *(id *)(a1 + 104);
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v95;
    do
    {
      for (k = 0; k != v61; ++k)
      {
        if (*(_QWORD *)v95 != v62)
          objc_enumerationMutation(v59);
        v64 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v64, "tabController:didCloseTabDocuments:", a1, v53);
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
    }
    while (v61);
  }

  objc_msgSend(*(id *)(a1 + 72), "setSuppressTabBarAnimation:", a3 ^ 1);
  -[TabController _application]((void *)a1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "updateTabCount");

  objc_msgSend(*(id *)(a1 + 72), "setSuppressTabBarAnimation:", 0);
  objc_msgSend(*(id *)(a1 + 72), "tabOverview");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "itemToActivate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v85;
  v68 = v86;
  if (!v67
    || (objc_msgSend(v53, "valueForKey:", CFSTR("tabOverviewItem")),
        v69 = (void *)objc_claimAutoreleasedReturnValue(),
        v70 = objc_msgSend(v69, "containsObject:", v67),
        v69,
        !v70))
  {
LABEL_82:
    if ((a5 & 1) != 0)
      goto LABEL_84;
    goto LABEL_83;
  }
  if (*(void **)(a1 + 32) != v86)
  {
    objc_msgSend(v86, "tabOverviewItem");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setItemToActivate:", v71);

    goto LABEL_82;
  }
  objc_msgSend(v66, "setItemToActivate:", 0);
  if ((a5 & 1) == 0)
LABEL_83:
    objc_msgSend(*(id *)(a1 + 72), "updateTabOverviewItems", v79);
LABEL_84:
  objc_msgSend(WeakRetained, "clearCachedTabCompletionData", v79);
  if (v81)
  {
    objc_msgSend(*(id *)(a1 + 72), "endFixingTabBarItems");
    objc_msgSend(*(id *)(a1 + 72), "endFixingTabOverviewItems");
  }
  objc_msgSend(*(id *)(a1 + 72), "updateTabBarAnimated:keepingTabVisible:", a3, v80);
  -[TabController _application]((void *)a1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = *MEMORY[0x1E0DC4738];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "removeDefaultImage:forScreen:", v73, v74);

  *(_BYTE *)(a1 + 136) = 0;
  -[TabController _sendDidEndDocumentUpdates](a1);
  -[TabController didUpdateTabDocumentsInTabGroupWithUUID:](a1, v88);
  -[TabController tabThumbnailCollectionView]((id *)a1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (!WeakRetained
    || v89 != objc_msgSend((id)a1, "isPrivateBrowsingEnabled")
    || !objc_msgSend(v75, "presentationState"))
  {
    goto LABEL_100;
  }
  if (objc_msgSend(v90, "count") != 1
    || (-[TabController allowsClosingLastTab]((void *)a1) & 1) != 0
    || *(_QWORD *)(a1 + 176))
  {
    goto LABEL_98;
  }
  objc_msgSend(v90, "firstObject");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v76, "isBlank") & 1) == 0)
  {

LABEL_98:
    v68 = v86;
    if (v89)
      objc_msgSend(*(id *)(a1 + 72), "updateExplanationViewVisibilityAnimated:", a3);
    goto LABEL_100;
  }
  objc_msgSend(v75, "searchController");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "isSearching");

  if ((v78 & 1) != 0)
    goto LABEL_98;
  objc_msgSend(v75, "dismissAnimated:", a3);
  v68 = v86;
LABEL_100:
  if (v84)
    -[TabController _presentAutomaticTabClosingPromptIfNeededForClosedTabCount:](a1, objc_msgSend(v53, "count"));

LABEL_103:
}

uint64_t __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteTabs:", *(_QWORD *)(a1 + 32));
}

id __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "isPrivateBrowsing"))
  {
    v4 = *(void **)(a1 + 32);
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
    objc_msgSend(v4, "tabWithUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_cancelVeryRecentlyClosedTabCountInvalidationTimer
{
  NSTimer *veryRecentlyClosedTabCountInvalidationTimer;
  NSTimer *v4;

  veryRecentlyClosedTabCountInvalidationTimer = self->_veryRecentlyClosedTabCountInvalidationTimer;
  if (veryRecentlyClosedTabCountInvalidationTimer)
  {
    self->_veryRecentlyClosedTabCount = 0;
    -[NSTimer invalidate](veryRecentlyClosedTabCountInvalidationTimer, "invalidate");
    v4 = self->_veryRecentlyClosedTabCountInvalidationTimer;
    self->_veryRecentlyClosedTabCountInvalidationTimer = 0;

  }
}

- (void)_createVeryRecentlyClosedTabCountInvalidationTimer
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 168))
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__cancelVeryRecentlyClosedTabCountInvalidationTimer, 0, 0, 4.0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v2;

    }
  }
}

- (NSArray)alternateTabs
{
  return (NSArray *)-[TabController _tabsForPrivateBrowsing:]((char *)self, -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled") ^ 1);
}

- (char)_mutableTabsForPrivateBrowsing:(char *)a1
{
  uint64_t v2;

  if (a1)
  {
    v2 = 16;
    if (a2)
      v2 = 24;
    a1 = (char *)*(id *)&a1[v2];
  }
  return a1;
}

- (char)mutableAlternateTabs
{
  char *v1;
  int v2;
  uint64_t v3;

  if (a1)
  {
    v1 = a1;
    v2 = objc_msgSend(a1, "isPrivateBrowsingEnabled");
    v3 = 24;
    if (v2)
      v3 = 16;
    a1 = (char *)*(id *)&v1[v3];
  }
  return a1;
}

- (id)normalPinnedTabs
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "normalTabs");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "safari_filterObjectsUsingBlock:", &__block_literal_global_13_1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __33__TabController_normalPinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned");
}

- (id)privatePinnedTabs
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "privateTabs");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "safari_filterObjectsUsingBlock:", &__block_literal_global_14_0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __34__TabController_privatePinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned");
}

- (NSArray)normalUnpinnedTabs
{
  void *v2;
  void *v3;

  -[TabController normalTabs](self, "normalTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_16_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __35__TabController_normalUnpinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

- (NSArray)privateUnpinnedTabs
{
  void *v2;
  void *v3;

  -[TabController privateTabs](self, "privateTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_17_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __36__TabController_privateUnpinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

- (id)tabsOlderThan:(id)a3 inPrivateBrowsing:(BOOL)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a3;
  objc_msgSend(v6, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  if (a4)
    -[TabController privateUnpinnedTabs](self, "privateUnpinnedTabs");
  else
    -[TabController normalUnpinnedTabs](self, "normalUnpinnedTabs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__TabController_tabsOlderThan_inPrivateBrowsing___block_invoke;
  v16[3] = &__block_descriptor_40_e29_B16__0___CollectionViewTab__8l;
  v16[4] = v12;
  objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

BOOL __49__TabController_tabsOlderThan_inPrivateBrowsing___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "lastActivationTime");
  return v3 < *(double *)(a1 + 32);
}

- (id)oldestTabsWithLimit:(unint64_t)a3 inPrivateBrowsing:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[TabController _tabsForPrivateBrowsing:]((char *)self, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safari_prefixWithMaxLength:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __55__TabController_oldestTabsWithLimit_inPrivateBrowsing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(a2, "lastActivationTime");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "lastActivationTime");
  v9 = v8;

  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (unint64_t)numberOfCurrentNonHiddenTabs
{
  void *v3;
  TabDocument *tabDocumentBeingHiddenFromTabView;
  _BOOL4 v5;
  unint64_t v6;

  -[TabController currentTabs](self, "currentTabs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
  if (tabDocumentBeingHiddenFromTabView
    && (v5 = -[TabDocument isPrivateBrowsingEnabled](tabDocumentBeingHiddenFromTabView, "isPrivateBrowsingEnabled"),
        v5 == -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
    && objc_msgSend(v3, "containsObject:", self->_tabDocumentBeingHiddenFromTabView))
  {
    v6 = objc_msgSend(v3, "count") - 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "count");
  }

  return v6;
}

- (unint64_t)numberOfTabsForCloseAllAction
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[TabController numberOfCurrentNonHiddenTabs](self, "numberOfCurrentNonHiddenTabs");
  -[TabController pinnedTabs](self, "pinnedTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 - objc_msgSend(v4, "count");

  return v5;
}

- (NSArray)currentTabDocuments
{
  void *v2;
  void *v3;

  -[TabController currentTabs](self, "currentTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __36__TabController_currentTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)pinnedTabDocuments
{
  void *v2;
  void *v3;

  -[TabController currentTabs](self, "currentTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_25_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __35__TabController_pinnedTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isPinned");
  else
    v3 = 0;

  return v3;
}

- (NSArray)unpinnedTabDocuments
{
  void *v2;
  void *v3;

  -[TabController currentTabs](self, "currentTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __37__TabController_unpinnedTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isPinned") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (NSArray)normalUnpinnedTabDocuments
{
  void *v2;
  void *v3;

  -[TabController normalTabs](self, "normalTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __43__TabController_normalUnpinnedTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isPinned") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (NSArray)privateUnpinnedTabDocuments
{
  void *v2;
  void *v3;

  -[TabController privateTabs](self, "privateTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __44__TabController_privateUnpinnedTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isPinned") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (NSArray)tabDocumentsForAllTabGroups
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  TabController *v13;
  id v14;

  -[TabController currentTabDocuments](self, "currentTabDocuments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[TabController tabGroups](self, "tabGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __44__TabController_tabDocumentsForAllTabGroups__block_invoke;
  v12 = &unk_1E9CF7B28;
  v13 = self;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return (NSArray *)v7;
}

void __44__TabController_tabDocumentsForAllTabGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activeTabGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v3 != v6)
  {
    objc_msgSend(v6, "tabs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__TabController_tabDocumentsForAllTabGroups__block_invoke_2;
    v7[3] = &unk_1E9CF7B00;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

void __44__TabController_tabDocumentsForAllTabGroups__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v5, "initWithUUIDString:", v6);
  +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "referenceToTabWithUUID:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

- (void)removeDocumentObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_documentObservers, "removeObject:", a3);
}

- (void)didUpdateTabDocuments
{
  -[TabController didUpdateTabDocumentsInTabGroupWithUUID:]((uint64_t)self, self->_activeTabGroupUUID);
}

- (void)didUpdateTabDocumentsInTabGroupWithUUID:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[5];

  v3 = a2;
  if (a1 && !*(_QWORD *)(a1 + 176))
  {
    objc_msgSend((id)a1, "activeTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)a1, "activeTabGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "usesGlobalPinnedTabs");

      if (v6)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__TabController_didUpdateTabDocumentsInTabGroupWithUUID___block_invoke;
        aBlock[3] = &unk_1E9CF7B78;
        aBlock[4] = a1;
        v7 = _Block_copy(aBlock);
        objc_msgSend(*(id *)(a1 + 288), "updatePinnedTabsInContainer:usingBlock:", a1, v7);

      }
      if (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(a1 + 56)))
      {
        objc_msgSend((id)a1, "persistAllCurrentTabsInBackground:", 1);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 280), "privateTabGroup");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", v9);

        objc_msgSend(*(id *)(a1 + 48), "tabGroupWithUUID:", v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "usesGlobalPinnedTabs"))
        {
          if ((v10 & 1) != 0)
            objc_msgSend((id)a1, "privateUnpinnedTabs");
          else
            objc_msgSend((id)a1, "normalUnpinnedTabs");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 16;
          if (v10)
            v13 = 24;
          v12 = objc_msgSend(*(id *)(a1 + v13), "copy");
        }
        v14 = (void *)v12;
        objc_msgSend((id)a1, "persistTabs:inTabGroupWithUUID:inBackground:", v12, v3, 1);

      }
      objc_msgSend((id)a1, "updateLocalTabGroupTitle");
    }

  }
}

id __57__TabController_didUpdateTabDocumentsInTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pinnedTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__TabController_didUpdateTabDocumentsInTabGroupWithUUID___block_invoke_2;
  v8[3] = &unk_1E9CF7B50;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__TabController_didUpdateTabDocumentsInTabGroupWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v3, "wbTab");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v9, "mutableCopy");

  }
  objc_msgSend(v3, "tabUpdateBlock");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v10)[2](v10, v8);

  return v8;
}

- (void)updateHibernatedTabDocumentsSavingState
{
  id v2;

  -[TabController allTabDocuments](self, "allTabDocuments");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_42_0);

}

void __56__TabController_updateHibernatedTabDocumentsSavingState__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPersistWhenHibernated:", objc_msgSend(v2, "isHibernated"));

}

- (void)_setActiveTabDocument:(_QWORD *)a1
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a2;
  if (a1)
  {
    v12 = v4;
    objc_msgSend(v4, "libraryType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v12;
      v7 = (id)a1[24];
      a1[24] = v6;
    }
    else
    {
      v8 = (void *)a1[24];
      a1[24] = 0;

      if (objc_msgSend(v12, "isPrivateBrowsingEnabled"))
        v9 = 37;
      else
        v9 = 38;
      v7 = (id)a1[v9];
      if (objc_msgSend(v12, "isPrivateBrowsingEnabled"))
        v10 = 37;
      else
        v10 = 38;
      objc_storeStrong((id *)&a1[v10], a2);
      objc_msgSend(v12, "webExtensionsController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didSelectTab:previousTab:", v12, v7);

      objc_msgSend(a1, "updateUsageTrackingInformationIfNecessary");
      objc_msgSend(a1, "updateActiveTab");
    }

    v4 = v12;
  }

}

- (void)deactivateAllUsageTrackingInformationIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BrowserController **p_browserController;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TabController allTabDocuments](self, "allTabDocuments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    p_browserController = &self->_browserController;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)p_browserController);
        objc_msgSend(WeakRetained, "tabDocumentPlayingPIPVideo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v9)
          objc_msgSend(v9, "updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:", 0);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (BOOL)hasTabsThatShouldBeObscuredForDigitalHealth
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TabController allTabDocuments](self, "allTabDocuments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldObscureForDigitalHealth") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (TabDocument)tabDocumentBeingActivated
{
  void *v2;
  void *v3;
  TabDocument *v4;

  -[TabController tabBeingActivated](self, "tabBeingActivated");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (CollectionViewTab)tabBeingActivated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemToActivate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(v4, "UUID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[TabController tabWithUUID:](self, "tabWithUUID:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    -[TabController activeTabDocument](self, "activeTabDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (CollectionViewTab *)v6;
}

- (BOOL)canCloseTab
{
  TabController *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = self;
  -[TabController activeTabDocument](self, "activeTabDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBlank") && (objc_msgSend(v3, "isPinned") & 1) == 0)
  {
    -[TabController unpinnedTabs](v2, "unpinnedTabs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      if (!v2)
      {
LABEL_22:

        goto LABEL_23;
      }
      v5 = -[TabController _hasPinnedStartPageExcludingTabs:](v2, 0);

      if (!v5)
        goto LABEL_10;
    }
    else
    {

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&v2->_browserController);
  if ((objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled") & 1) == 0)
  {

    goto LABEL_12;
  }
  +[Application sharedApplication](Application, "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPrivateBrowsingLocked");

  if ((v8 & 1) == 0)
  {
LABEL_12:
    -[TabController tabThumbnailCollectionView]((id *)&v2->super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "presentationState") == 1 || objc_msgSend(v4, "presentationState") == 2)
    {
      if (objc_msgSend(v4, "defersActivation"))
      {
        objc_msgSend(v4, "itemToActivate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && (objc_msgSend(v9, "isPinned") & 1) == 0)
        {
          objc_msgSend(v10, "UUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v2) = -[TabController canCloseTabWithUUID:](v2, "canCloseTabWithUUID:", v11);

        }
        else
        {
          LOBYTE(v2) = 0;
        }

      }
      else
      {
        LOBYTE(v2) = 0;
      }
    }
    else
    {
      LOBYTE(v2) = 1;
    }
    goto LABEL_22;
  }
LABEL_10:
  LOBYTE(v2) = 0;
LABEL_23:

  return (char)v2;
}

- (BOOL)canCloseOtherTabs
{
  id WeakRetained;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ((objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled") & 1) != 0)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPrivateBrowsingLocked");

    if ((v5 & 1) != 0)
      return 0;
  }
  else
  {

  }
  -[TabController currentTabs](self, "currentTabs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "presentationState") != 1 && objc_msgSend(v8, "presentationState") != 2;

  }
  return v6;
}

- (void)setActiveTab:(id)a3
{
  -[TabController setActiveTab:animated:deferActivation:](self, "setActiveTab:animated:deferActivation:", a3, 0, 0);
}

- (void)setActiveTab:(id)a3 animated:(BOOL)a4
{
  -[TabController setActiveTab:animated:deferActivation:](self, "setActiveTab:animated:deferActivation:", a3, a4, 0);
}

- (void)setActiveTab:(id)a3 animated:(BOOL)a4 deferActivation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController setActiveTabDocument:animated:deferActivation:](self, "setActiveTabDocument:animated:deferActivation:", v8, v6, v5);

}

- (void)setActiveTabDocument:(id)a3
{
  -[TabController setActiveTabDocument:animated:deferActivation:](self, "setActiveTabDocument:animated:deferActivation:", a3, 0, 0);
}

- (void)setActiveTabDocument:(id)a3 animated:(BOOL)a4
{
  -[TabController setActiveTabDocument:animated:deferActivation:](self, "setActiveTabDocument:animated:deferActivation:", a3, a4, 0);
}

- (void)setActiveTabDocument:(id)a3 animated:(BOOL)a4 deferActivation:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id WeakRetained;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v5 = a5;
  v6 = a4;
  v16 = a3;
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TabCollectionViewManager hasTabBar](self->_tabCollectionViewManager, "hasTabBar")
    || (objc_msgSend(WeakRetained, "rootViewController"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "usingLoweredBar"),
        v10,
        !v6)
    || v11
    || !v9)
  {
    -[TabCollectionViewManager dismissTabHoverPreview](self->_tabCollectionViewManager, "dismissTabHoverPreview");
    objc_msgSend(v16, "libraryType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      v14 = objc_msgSend(v16, "isPrivateBrowsingEnabled");
      if (v14 != -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
      {
        -[TabController _setActiveTabDocument:](self, v16);
        objc_msgSend(WeakRetained, "setPrivateBrowsingEnabled:", objc_msgSend(v16, "isPrivateBrowsingEnabled"));
        goto LABEL_13;
      }
    }
    -[TabController activeTabDocument](self, "activeTabDocument");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController _switchActiveTabDocumentFromTabDocument:toTabDocument:]((uint64_t)self, v15, v16);

    kdebug_trace();
    goto LABEL_13;
  }
  if (v5)
    objc_msgSend(v9, "setDefersActivation:", 1);
  objc_msgSend(v16, "itemForTabCollectionView:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemToActivate:", v12);

  objc_msgSend(v9, "presentAnimated:", 1);
LABEL_13:

}

- (void)_switchActiveTabDocumentFromTabDocument:(void *)a3 toTabDocument:
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1 || v5 == v6)
    goto LABEL_22;
  v8 = objc_msgSend(v5, "isPrivateBrowsingEnabled");
  v9 = 16;
  if (v8)
    v9 = 24;
  v25 = (void *)objc_msgSend(*(id *)(a1 + v9), "copy");
  v10 = objc_msgSend(v25, "containsObject:", v5);
  objc_msgSend(*(id *)(a1 + 72), "tabThumbnailCollectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "presentationState");

  if (v10)
    objc_msgSend(*(id *)(a1 + 72), "updateSnapshotCacheStateSwitchingFromTabDocument:", v5);
  objc_msgSend(v5, "setActive:", 0);
  objc_msgSend(v7, "setActive:", 1);
  -[TabController _setActiveTabDocument:]((_QWORD *)a1, v7);
  if (*(void **)(a1 + 32) == v7 && !v12)
  {
    *(_QWORD *)(a1 + 32) = 0;

LABEL_11:
    objc_msgSend(*(id *)(a1 + 72), "updateSnapshotIdentifiers");
    goto LABEL_12;
  }
  if (!v12)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v5, "parentTabDocumentForBackClosesSpawnedTab");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _prepareToMoveTabDocumentToWindow:createPlaceholderImage:](a1, v7, v13 != v7);

  +[MediaCaptureStatusBarManager sharedManager](MediaCaptureStatusBarManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tabDidBecomeActive:", v7);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 104), "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v19);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "tabController:didSwitchFromTabDocument:toTabDocument:", a1, v5, v7);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "rootViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "statusBarView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "clearStatus");

  objc_msgSend(v7, "updateShowsSiriReaderPlayingIcon");
  objc_msgSend(v7, "sfScribbleControllerIfLoaded");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "reloadData");

LABEL_22:
}

- (void)_prepareToMoveTabDocumentToWindow:(int)a3 createPlaceholderImage:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  CGRect v27;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 && objc_msgSend(v7, "hasBeenInWindow"))
    {
      if (!a3)
        goto LABEL_9;
      if ((objc_msgSend(v6, "isHibernated") & 1) != 0)
        goto LABEL_9;
      objc_msgSend(v6, "webView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isLoading");

      if ((v10 & 1) != 0
        || (v11 = *(void **)(a1 + 72),
            objc_msgSend(v6, "uuid"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "cachedContentImageForTabWithUUID:allowScaledImage:", v12, 1),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            !v13))
      {
LABEL_9:
        objc_msgSend(*(id *)(a1 + 72), "tabThumbnailCollectionView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "presentationState");

        if (v23 == 2)
        {
          objc_msgSend(v6, "webView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_doAfterNextPresentationUpdateWithoutWaitingForPainting:", &__block_literal_global_119);

        }
      }
      else
      {
        objc_msgSend(v7, "scrollView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "adjustedContentInset");
        v16 = v15;
        objc_msgSend(v14, "contentOffset");
        v18 = v16 + v17;
        objc_msgSend(v6, "appBanner");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        v20 = v18 - CGRectGetHeight(v27);

        objc_msgSend(v7, "setPlaceholderImage:offset:", v13, fmin(v20, 0.0));
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __74__TabController__prepareToMoveTabDocumentToWindow_createPlaceholderImage___block_invoke;
        v25[3] = &unk_1E9CF1900;
        v26 = v7;
        objc_msgSend(v26, "_doAfterNextPresentationUpdateWithoutWaitingForPainting:", v25);
        v21 = *(void **)(a1 + 72);
        objc_msgSend(v13, "size");
        objc_msgSend(v21, "updateStartPageSnapshotIfNeededForTabDocument:currentSnapshotSize:", v6);

      }
    }

  }
}

- (BOOL)canAddNewTabInTabGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "tabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (objc_msgSend(v4, "usesGlobalPinnedTabs"))
  {
    -[TabController pinnedWBTabsForTabGroup:](self, "pinnedWBTabsForTabGroup:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 += objc_msgSend(v7, "count");

  }
  v8 = -[TabController canAddNewTabInTabGroup:withTabCount:](self, "canAddNewTabInTabGroup:withTabCount:", v4, v6);

  return v8;
}

- (BOOL)canAddNewTabInTabGroup:(id)a3 withTabCount:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  char v13;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsUnlimitedTabs");

  if ((v8 & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D8A7A8], "automaticTabClosingInterval")
      || (objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "supportsMultipleScenes"),
          v9,
          (v10 & 1) != 0))
    {
      v11 = 1;
    }
    else
    {
      v11 = objc_msgSend(v6, "isNamed");
    }
    -[TabController _application](self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "maximumTabCountAllowingMoreTabs:", v11) > a4;
  }
  else
  {
    -[TabController _application](self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "canAddNewTabForPrivateBrowsing:", objc_msgSend(v6, "isPrivateBrowsing"));
  }

  return v13;
}

- (id)_oldestInactiveTabDocumentForPrivateBrowsing:(void *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(a1, "privateTabDocuments");
    else
      objc_msgSend(a1, "tabDocuments");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(a1, "activeTabDocument", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v9)
          {
            if (v6)
            {
              objc_msgSend(v6, "lastViewedTime");
              v12 = v11;
              objc_msgSend(v9, "lastViewedTime");
              if (v13 < v12)
              {
                v14 = v9;

                v6 = v14;
              }
            }
            else
            {
              v6 = v9;
            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_makeRoomForNewTab:(uint64_t)a1
{
  id v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!a1)
    return 0;
  v4 = *a2;
  if ((objc_msgSend((id)a1, "canAddNewTabForPrivateBrowsing:", objc_msgSend(v4, "isPrivateBrowsingEnabled")) & 1) != 0
    || *(_BYTE *)(a1 + 136))
  {
    v5 = 1;
  }
  else
  {
    -[TabController _oldestInactiveTabDocumentForPrivateBrowsing:]((void *)a1, objc_msgSend(v4, "isPrivateBrowsingEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v5 = v7 != 0;
    if (v7)
    {
      objc_msgSend(v7, "sessionState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[TabController _unhibernateTabIfNeeded:]((TabDocument *)a1, v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "restoreSessionState:andNavigate:", v9, 0);
        v11 = objc_retainAutorelease(v10);
        *a2 = v11;

      }
      -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:](a1, v8, 0, 0, 0, 1);

    }
  }

  return v5;
}

- (void)performSuppressingDataModelUpdates:(id)a3
{
  ++self->_updateTabsSuppressionCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_updateTabsSuppressionCount;
}

- (void)performBatchUpdatesWithBlock:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[TabController _willPerformBatchUpdates]((uint64_t)self);
  v4[2](v4);

  -[TabController _didPerformBatchUpdates]((id *)&self->super.isa);
}

- (void)_reuseTabAfterInsertion:(id *)a1
{
  id v3;
  id v4;
  void *v5;
  int v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  if (a1)
  {
    v15 = v3;
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isTabSuspended:", v4);

      if (v6)
      {
        WeakRetained = objc_loadWeakRetained(a1 + 1);
        +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v8, "reuseTabForUUID:", v9);

        objc_msgSend(v4, "setBrowserController:afterTabGroupReuse:", WeakRetained, 1);
        objc_msgSend(a1, "allTabGroups");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __41__TabController__reuseTabAfterInsertion___block_invoke;
        v16[3] = &unk_1E9CF7C08;
        v12 = v4;
        v17 = v12;
        objc_msgSend(v11, "safari_firstObjectPassingTest:", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(a1, "isTabGroupActive:", v13) & 1) == 0)
        {
          objc_msgSend(v12, "tabGroupTab");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TabController _removeTab:fromTabGroup:]((uint64_t)a1, v14, v13);

        }
        -[TabController _forceUpdateTabGroupTitleIfNeeded:](a1, v13);

      }
    }

    v3 = v15;
  }

}

uint64_t __41__TabController__reuseTabAfterInsertion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "tabs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__TabController__reuseTabAfterInsertion___block_invoke_2;
  v6[3] = &unk_1E9CF7BE0;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "safari_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __41__TabController__reuseTabAfterInsertion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (void)_removeTab:(void *)a3 fromTabGroup:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __41__TabController__removeTab_fromTabGroup___block_invoke;
    v18[3] = &unk_1E9CF78F8;
    v10 = v5;
    v19 = v10;
    objc_msgSend(v8, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v9, 1, v18);

    ++*(_QWORD *)(a1 + 176);
    if (objc_msgSend(v7, "isPrivateBrowsing") && (objc_msgSend((id)a1, "isTabGroupActive:", v7) & 1) == 0)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v10, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
      objc_msgSend((id)a1, "tabWithUUID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:](a1, v14, 0, 1, 0, 1);
      if (v14 == *(void **)(a1 + 296))
      {
        objc_msgSend(*(id *)(a1 + 24), "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabController _unhibernateTabIfNeeded:]((TabDocument *)a1, v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 296);
        *(_QWORD *)(a1 + 296) = v16;

        objc_msgSend((id)a1, "updateActiveTab");
      }
      -[TabController _createInitialPrivateTabIfNeeded]((id *)a1);

    }
    --*(_QWORD *)(a1 + 176);

  }
}

- (void)_insertTab:(unint64_t)a3 atIndex:(char)a4 inBackground:(unsigned int)a5 animated:(char)a6 updateUI:
{
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id WeakRetained;
  void *v31;
  char v32;
  double v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  char v41;
  char v42;
  _QWORD block[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = v11;
  if (a1)
  {
    v13 = objc_msgSend(v11, "isPrivateBrowsingEnabled");
    if (v13)
      v14 = 3;
    else
      v14 = 2;
    v15 = a1[v14];
    if (objc_msgSend(v15, "containsObject:", v12))
    {
      objc_msgSend(v15, "removeObject:", v12);
      if (objc_msgSend(v15, "count") < a3)
        a3 = objc_msgSend(v15, "count");
      objc_msgSend(v15, "insertObject:atIndex:", v12, a3);
      v16 = v12;
    }
    else
    {
      v42 = a6;
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reportTabUpdatedWithUpdateType:", 4);

      -[TabController _sendWillBeginDocumentUpdates]((uint64_t)a1);
      v49 = v12;
      v18 = -[TabController _makeRoomForNewTab:]((uint64_t)a1, &v49);
      v16 = v49;

      if (v18)
      {
        if (objc_msgSend(v15, "count") <= a3)
          objc_msgSend(v15, "addObject:", v16);
        else
          objc_msgSend(v15, "insertObject:atIndex:", v16, a3);
        v41 = a4;
        -[TabController _reuseTabAfterInsertion:](a1, v16);
      }
      else
      {
        v19 = 38;
        if (v13)
          v19 = 37;
        v20 = a1[v19];
        v21 = (void *)objc_msgSend(a1[v14], "copy");
        if (objc_msgSend(v21, "containsObject:", v20))
        {
          objc_msgSend(a1, "replaceTabDocument:withTabDocument:", v20, v16);
        }
        else
        {
          v22 = WBS_LOG_CHANNEL_PREFIXTabs();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            -[TabController _insertTab:atIndex:inBackground:animated:updateUI:].cold.1(v13, v22);
          objc_msgSend(v15, "addObject:", v16);
          a4 = 0;
        }
        v41 = a4;

      }
      objc_msgSend(v16, "setHasBeenInserted:", 1);
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v23 = a1[13];
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v46 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v28, "tabController:didInsertTabDocument:", a1, v16);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v25);
      }

      if ((objc_msgSend(a1[26], "containsObject:", v16) & 1) == 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __67__TabController__insertTab_atIndex_inBackground_animated_updateUI___block_invoke;
        block[3] = &unk_1E9CF1900;
        v44 = v16;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      objc_msgSend(a1, "didUpdateTabDocuments");
      if ((v42 & 1) != 0)
      {
        objc_msgSend(v16, "setNeedsNewTabSnapshot");
        +[Application sharedApplication](Application, "sharedApplication");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "updateTabCount");

        objc_msgSend(a1[9], "updateTabOverviewItems");
        WeakRetained = objc_loadWeakRetained(a1 + 1);
        objc_msgSend(WeakRetained, "clearCachedTabCompletionData");
        if (!a5
          || (objc_msgSend(a1[9], "hasTabBar") & 1) != 0
          || (objc_msgSend(a1, "activeTabDocument"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v32 = objc_msgSend(v31, "isShowingFindOnPage"),
              v31,
              (v32 & 1) == 0))
        {
          if ((v41 & 1) != 0)
          {
            objc_msgSend(v16, "lastViewedTime");
            if (v33 == 0.0)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
              objc_msgSend(v16, "setLastViewedTime:");
            }
          }
          else
          {
            objc_msgSend(a1, "setActiveTab:animated:", v16, a5);
          }
          objc_msgSend(a1[9], "updateTabBarAnimated:keepingTabVisible:", a5, v16);
          objc_msgSend(WeakRetained, "configuration");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "allowsSearchFeedback");

          if (v35)
          {
            objc_msgSend(WeakRetained, "rootViewController");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "capsuleCollectionViewLayout");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "integerValue") != 2;

            +[UniversalSearchSession sharedSession](UniversalSearchSession, "sharedSession");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "feedbackDispatcher");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "sendNewTabFeedback:", v38);

          }
        }
        -[TabController _sendDidEndDocumentUpdates]((uint64_t)a1);

      }
      else
      {
        -[TabController _sendDidEndDocumentUpdates]((uint64_t)a1);
      }
    }

    v12 = v16;
  }

}

void __67__TabController__insertTab_atIndex_inBackground_animated_updateUI___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "webExtensionsController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didOpenTab:", *(_QWORD *)(a1 + 32));

}

- (void)insertTab:(id)a3 afterTab:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6
{
  unsigned int v6;
  id v10;
  unint64_t v11;
  id v12;

  v6 = a6;
  v10 = a4;
  v12 = a3;
  v11 = -[TabController _indexForInsertionAfterTab:withPrivateBrowsingEnabled:]((uint64_t)self, v10, objc_msgSend(v12, "isPrivateBrowsingEnabled"));

  -[TabController _insertTab:atIndex:inBackground:animated:updateUI:]((id *)&self->super.isa, v12, v11, a5, v6, !self->_isClosingTabs);
}

- (uint64_t)_indexForInsertionAfterTab:(int)a3 withPrivateBrowsingEnabled:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a2;
  if (a1)
  {
    v6 = 16;
    if (a3)
      v6 = 24;
    v7 = (void *)objc_msgSend(*(id *)(a1 + v6), "copy");
    v8 = v7;
    if (v5 && (v9 = objc_msgSend(v7, "indexOfObject:", v5), v9 != 0x7FFFFFFFFFFFFFFFLL))
      v10 = v9 + 1;
    else
      v10 = objc_msgSend(v8, "count");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)insertTabs:(id)a3 beforeTab:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  BOOL v18;
  _QWORD v19[4];
  _QWORD v20[4];

  v10 = a3;
  v11 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0x7FFFFFFFFFFFFFFFLL;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0x7FFFFFFFFFFFFFFFLL;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__TabController_insertTabs_beforeTab_inBackground_animated___block_invoke;
  v13[3] = &unk_1E9CF7C30;
  v15 = v20;
  v16 = v19;
  v13[4] = self;
  v12 = v11;
  v14 = v12;
  v17 = a5;
  v18 = a6;
  objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v13);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);

}

void __60__TabController_insertTabs_beforeTab_inBackground_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isPrivateBrowsingEnabled"))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = -[TabController _indexForInsertionBeforeTab:withPrivateBrowsingEnabled:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 1);
      v5 = v6;
      v7 = *(_QWORD *)(a1 + 48);
LABEL_6:
      *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24) = v6;
    }
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = -[TabController _indexForInsertionBeforeTab:withPrivateBrowsingEnabled:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
      v5 = v6;
      v7 = *(_QWORD *)(a1 + 56);
      goto LABEL_6;
    }
  }
  -[TabController _insertTab:atIndex:inBackground:animated:updateUI:](*(id **)(a1 + 32), v8, v5, *(_BYTE *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), a3 == 0);

}

- (uint64_t)_indexForInsertionBeforeTab:(int)a3 withPrivateBrowsingEnabled:
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = 16;
    if (a3)
      v4 = 24;
    v5 = *(void **)(a1 + v4);
    v6 = a2;
    v7 = (void *)objc_msgSend(v5, "copy");
    v3 = objc_msgSend(v7, "indexOfObject:", v6);

    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      v3 = 0;

  }
  return v3;
}

- (void)insertNewTabDocument:(id)a3 forcingOrderAfterTabDocument:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  WBSTabOrderManager *tabOrderManager;
  void *v16;
  id v17;

  v6 = a6;
  v7 = a5;
  v17 = a3;
  v10 = a4;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v17, "ancestorUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    tabOrderManager = self->_tabOrderManager;
    if (v14)
      -[WBSTabOrderManager tabToInsertSpawnedTabAfter](tabOrderManager, "tabToInsertSpawnedTabAfter");
    else
      -[WBSTabOrderManager tabToInsertNewBlankTabAfter](tabOrderManager, "tabToInsertNewBlankTabAfter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v12;
  -[TabController insertTab:afterTab:inBackground:animated:](self, "insertTab:afterTab:inBackground:animated:", v17, v12, v7, v6);

}

- (void)insertNewTabDocumentWithDefaultOrdering:(id)a3 inBackground:(BOOL)a4 animated:(BOOL)a5
{
  -[TabController insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:](self, "insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:", a3, 0, a4, a5);
}

- (id)_insertNewBlankTabDocumentWithPrivateBrowsing:(uint64_t)a3 inBackground:(uint64_t)a4 animated:
{
  char v4;

  if (a1)
  {
    if (a2)
      v4 = 2;
    else
      v4 = 1;
    -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:](a1, v4, a3, a4);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (TabDocument)_insertNewBlankTabDocumentWithOptions:(uint64_t)a3 inBackground:(uint64_t)a4 animated:
{
  uint64_t v8;
  id v9;
  TabDocument *v10;
  uint64_t v11;
  id WeakRetained;
  TabDocument *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  if (!a1)
  {
    v13 = 0;
    return v13;
  }
  if ((a2 & 3) == 2)
  {
    v8 = 1;
  }
  else if ((a2 & 3) == 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(a1, "isPrivateBrowsingEnabled");
  }
  v9 = a1[4];
  if (!v9 || (_DWORD)v8 != objc_msgSend(v9, "isPrivateBrowsingEnabled"))
  {
    v10 = [TabDocument alloc];
    v11 = -[TabController _controlledByAutomation]((uint64_t)a1);
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    v13 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:](v10, "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, v8, v11, 0, 0, WeakRetained, 0);

    objc_msgSend(a1, "activeTabDocument");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument setNextLoadComesFromSearchPage:](v13, "setNextLoadComesFromSearchPage:", objc_msgSend(v14, "isSearchPage"));

    -[TabDocument setIsBlank:](v13, "setIsBlank:", 1);
    -[TabDocument setScrollPoint:](v13, "setScrollPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(a1[9], "tabOverview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "presentationState"))
    {
      objc_msgSend(a1, "currentTabs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 == 1)
        objc_msgSend(a1[9], "setShouldDeferSnapshotRequest:", 1);
    }
    else
    {

    }
    if ((_DWORD)v8 != objc_msgSend(a1, "isPrivateBrowsingEnabled"))
    {
      v19 = 0;
LABEL_29:
      -[TabDocument displayNewTabOverridePageIfNecessary](v13, "displayNewTabOverridePageIfNecessary");
      objc_msgSend(a1, "insertTab:afterTab:inBackground:animated:", v13, v19, a3, a4);

      return v13;
    }
    if ((a2 & 0xC) == 8)
    {
      objc_msgSend(a1[40], "tabInsertionHintForPosition:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((a2 & 0xC) == 4)
        objc_msgSend(a1[40], "tabInsertionHintForNewBlankTabInCurrentContext");
      else
        objc_msgSend(a1[40], "tabInsertionHintForNewBlankTab");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;
    objc_msgSend(v20, "tabToInsertAfter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "relationType");
    if (v22 == 2)
    {
      objc_msgSend(a1, "activeTabDocument");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument updateAncestryToChildOfTopLevelAncestorRelatedTab:](v13, "updateAncestryToChildOfTopLevelAncestorRelatedTab:", v23);
    }
    else
    {
      if (v22 != 1)
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(a1, "activeTabDocument");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDocument updateAncestryWithParentTab:](v13, "updateAncestryWithParentTab:", v23);
    }

    goto LABEL_28;
  }
  v13 = (TabDocument *)a1[4];
  v18 = a1[4];
  a1[4] = 0;

  if ((a3 & 1) == 0)
    objc_msgSend(a1, "setActiveTabDocument:animated:", v13, a4);
  return v13;
}

- (uint64_t)_controlledByAutomation
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (objc_msgSend(WeakRetained, "isControlledByAutomation"))
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "automationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canCreateNewAutomationTabs");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)insertNewBlankTabDocumentAnimated:(BOOL)a3
{
  id v3;

  v3 = -[TabController _insertNewBlankTabDocumentWithPrivateBrowsing:inBackground:animated:]((id *)&self->super.isa, -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"), 0, a3);
}

- (CollectionViewTab)blankTabToReuse
{
  void *v3;
  TabDocument *v4;
  void *v5;
  void *v6;
  void *v7;
  TabDocument *v8;

  -[TabController activeTabDocument](self, "activeTabDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBlank"))
  {
    v4 = v3;
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    -[TabController currentTabs](self, "currentTabs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_firstObjectPassingTest:", &__block_literal_global_56_0);
    v4 = (TabDocument *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
LABEL_9:
      v8 = 0;
      goto LABEL_10;
    }
  }
  if (v4 == self->_tabDocumentBeingHiddenFromTabView)
    goto LABEL_9;
  if (!-[TabDocument isPinned](v4, "isPinned"))
  {
    -[TabController currentTabs](self, "currentTabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController moveTab:overTab:](self, "moveTab:overTab:", v4, v7);

  }
  v8 = v4;
LABEL_10:

  return (CollectionViewTab *)v8;
}

uint64_t __32__TabController_blankTabToReuse__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBlank");
}

- (id)_openBlankTabDocument
{
  if (a1)
  {
    -[TabController _insertNewBlankTabDocumentWithPrivateBrowsing:inBackground:animated:](a1, objc_msgSend(a1, "isPrivateBrowsingEnabled"), 1, 0);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)openNewTabWithOptions:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;
  char v16;
  uint8_t buf[8];
  _QWORD v18[5];
  id v19;
  int64_t v20;

  v6 = a4;
  if (v6)
    v7 = v6;
  else
    v7 = &__block_literal_global_58;
  if (-[TabController isPrivateBrowsingAndLocked](self, "isPrivateBrowsingAndLocked"))
  {
    -[TabController _application](self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__TabController_openNewTabWithOptions_completionHandler___block_invoke_2;
    v18[3] = &unk_1E9CF7C98;
    v18[4] = self;
    v19 = v7;
    v20 = a3;
    objc_msgSend(v8, "authenticateToUnlockPrivateBrowsingWithCompletionHandler:", v18);

    WeakRetained = v19;
    goto LABEL_17;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (!self
    || (a3 & 3) == 1
    || (a3 & 3) != 2 && !-[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
  {
    v10 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend(WeakRetained, "isPrivateBrowsingAvailable") & 1) != 0)
  {
    v10 = 1;
LABEL_13:
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__TabController_openNewTabWithOptions_completionHandler___block_invoke_59;
    v12[3] = &unk_1E9CF7CC0;
    v16 = v10;
    v14 = v7;
    v12[4] = self;
    WeakRetained = WeakRetained;
    v13 = WeakRetained;
    v15 = a3;
    objc_msgSend(WeakRetained, "makeSpaceForTabWithPrivateBrowsing:resultHandler:", v10, v12);

    goto LABEL_17;
  }
  v11 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_INFO, "Preventing new private tab because Private Browsing is not available", buf, 2u);
  }
  (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
LABEL_17:

}

uint64_t __57__TabController_openNewTabWithOptions_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "openNewTabWithOptions:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __57__TabController_openNewTabWithOptions_completionHandler___block_invoke_59(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  id v6;

  if ((a2 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 64) && (objc_msgSend(*(id *)(a1 + 32), "isPrivateBrowsingEnabled") & 1) == 0)
      -[TabController _suppressSingleEmptyTabIfAppropriate](*(_QWORD *)(a1 + 32));
    -[TabController tabThumbnailCollectionView](*(id **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "presentationState");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "setPrivateBrowsingEnabled:", *(unsigned __int8 *)(a1 + 64));
      -[TabController _addNewActiveTabOverviewTab](*(_QWORD *)(a1 + 32));
    }
    else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "hasTabBar"))
    {
      -[TabController _openBlankTabDocumentInTabBarWithOptions:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56));
    }
    else
    {
      v6 = -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56), 0, objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));
    }
    v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v5();
}

- (void)_addNewActiveTabOverviewTab
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (!a1)
    return;
  objc_msgSend(*(id *)(a1 + 72), "setShouldDeferSnapshotRequest:", 1);
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v3 = objc_msgSend(v2, "isPrivateBrowsingEnabled");
  v4 = objc_msgSend((id)a1, "isPrivateBrowsingEnabled");
  v5 = *(void **)(a1 + 32);
  if (v3 != v4)
  {
LABEL_6:
    *(_QWORD *)(a1 + 32) = 0;

    if (objc_msgSend((id)a1, "isPrivateBrowsingEnabled"))
      v8 = 2;
    else
      v8 = 1;
    -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:]((id *)a1, v8, 1, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v12 = v5;
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

  objc_msgSend(*(id *)(a1 + 72), "updateTabOverviewItems");
  v7 = (uint64_t)v12;
LABEL_10:
  v13 = (id)v7;
  objc_msgSend((id)a1, "setActiveTabDocument:", v7);
  objc_msgSend(*(id *)(a1 + 72), "tabOverview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "dismissWithAddTabAnimation");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "tabThumbnailCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissAnimated:", 1);

  }
}

- (void)_openBlankTabDocumentInTabBarWithOptions:(id *)a1
{
  void *v4;
  id v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1[9], "beginFixingTabBarItems");
    -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:](a1, a2, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setActiveTabDocument:", v4);

    objc_msgSend(a1[9], "endFixingTabBarItems");
    v5 = a1[9];
    objc_msgSend(a1, "activeTabDocument");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateTabBarAnimated:keepingTabVisible:", 1, v6);

  }
}

- (void)openLibraryForType:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *libraryTabs;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  TabDocument *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[TabController activeTabDocument](self, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    -[TabCollectionViewManager tabThumbnailCollectionView](self->_tabCollectionViewManager, "tabThumbnailCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissAnimated:", 0);

    if (!self->_libraryTabs)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      libraryTabs = self->_libraryTabs;
      self->_libraryTabs = v8;

    }
    if (!self->_activeLibraryTab)
    {
      -[TabController tabGroups](self, "tabGroups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController setActiveTabGroupUUID:](self, "setActiveTabGroupUUID:", v12);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_libraryTabs, "objectForKeyedSubscript:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:]([TabDocument alloc], "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, 0, -[TabController _controlledByAutomation]((uint64_t)self), 0, 0, WeakRetained, 0);
      -[TabDocument setIsBlank:](v15, "setIsBlank:", 1);
      -[TabDocument setLibraryType:](v15, "setLibraryType:", v17);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_libraryTabs, "setObject:forKeyedSubscript:", v15, v17);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_libraryTabs, "objectForKeyedSubscript:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController setActiveTabDocument:](self, "setActiveTabDocument:", v16);

    objc_msgSend(WeakRetained, "updateUnifiedBarVisibility");
  }

}

- (void)openTab:(id)a3 navigatedFromLibraryType:(id)a4
{
  id v6;
  id v7;
  TabDocument *activeLibraryTab;
  void *v9;
  id WeakRetained;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setSuppressWebExtensionEvents:", 0);
  activeLibraryTab = self->_activeLibraryTab;
  self->_activeLibraryTab = 0;

  -[TabController activeNonLibraryTab](self, "activeNonLibraryTab");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:](self, "insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:", v7, v9, 0, 0);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_libraryTabs, "setObject:forKeyedSubscript:", 0, v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "updateUnifiedBarVisibility");

}

- (void)closeTab:(id)a3 animated:(BOOL)a4
{
  if (self)
    -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, a3, a4, 1, 0, 1);
}

- (void)closeTabWithURL:(id)a3 UUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  WBTabGroupManager *tabGroupManager;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TabController tabWithUUID:](self, "tabWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "safari_isSameAsURLRemovingFragment:", v6) & 1) != 0)
    {
      -[TabController currentTabs](self, "currentTabs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v9);

      if (v12)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          objc_msgSend(v7, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = (uint64_t)v15;
          _os_log_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_DEFAULT, "Closing tab with UUID %{public}@", buf, 0xCu);

        }
        if (self)
          -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v9, 1u, 0, 0, 1);
        goto LABEL_15;
      }
    }
    else
    {

    }
  }
  -[TabController activeTabGroup](self, "activeTabGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isLocal");

  if ((v17 & 1) == 0)
  {
    -[TabController windowState](self, "windowState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localTabGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "tabs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __38__TabController_closeTabWithURL_UUID___block_invoke;
    v30[3] = &unk_1E9CF7CE8;
    v31 = v7;
    v32 = v6;
    objc_msgSend(v20, "safari_filterObjectsUsingBlock:", v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "count");
    if (v23)
    {
      v24 = v23;
      v25 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v34 = v24;
        _os_log_impl(&dword_1D7CA3000, v25, OS_LOG_TYPE_DEFAULT, "Closing %zu tabs in local tab group", buf, 0xCu);
      }
      tabGroupManager = self->_tabGroupManager;
      objc_msgSend(v19, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v21;
      v28[1] = 3221225472;
      v28[2] = __38__TabController_closeTabWithURL_UUID___block_invoke_61;
      v28[3] = &unk_1E9CF78F8;
      v29 = v22;
      -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v27, 1, v28);

    }
  }
LABEL_15:

}

uint64_t __38__TabController_closeTabWithURL_UUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(v3, "syncableURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safari_isSameAsURLRemovingFragment:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __38__TabController_closeTabWithURL_UUID___block_invoke_61(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteTabs:", *(_QWORD *)(a1 + 32));
}

- (void)closeTabs:(id)a3 inInactiveTabGroup:(id)a4
{
  id v6;
  id v7;
  WBTabGroupManager *tabGroupManager;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  TabController *v16;

  v6 = a3;
  v7 = a4;
  if (!-[TabController isTabGroupActive:](self, "isTabGroupActive:", v7))
  {
    tabGroupManager = self->_tabGroupManager;
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __46__TabController_closeTabs_inInactiveTabGroup___block_invoke;
    v14 = &unk_1E9CF7D10;
    v15 = v6;
    v16 = self;
    -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v9, 1, &v11);

    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0, v11, v12, v13, v14);

  }
}

void __46__TabController_closeTabs_inInactiveTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "deleteTabs:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "usesGlobalPinnedTabs"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "isPinned", (_QWORD)v12))
          {
            v10 = *(void **)(*(_QWORD *)(a1 + 40) + 288);
            objc_msgSend(v9, "uuid");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "removeTabWithUUID:persist:", v11, 1);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)_detachTab:(unsigned int)a3 animated:
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    objc_msgSend(a1, "currentTabs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v8);

    if ((v6 & 1) != 0)
    {
      -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)a1, v8, a3, 0, 1, 0);
      objc_msgSend(v8, "resetTabViewItems");
    }
    else
    {
      -[TabController mutableAlternateTabs]((char *)a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v8);

    }
  }

}

- (void)_closeTab:(unsigned int)a3 animated:(int)a4 allowAddingToRecentlyClosedTabs:(char)a5 keepWebViewAlive:(int)a6 showAutoCloseTabsAlert:
{
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
    {
      v14[0] = a2;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = a2;
      objc_msgSend(v11, "arrayWithObjects:count:", v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:](a1, v13, a3, a4, a5, a6);
    }
  }
}

- (void)_detachTabs:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "currentTabs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    if ((v6 & 1) != 0)
    {
      -[TabController mutableCurrentTabs]((char *)a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectsInArray:", v3);

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = a1[13];
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v26;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v13, "tabController:didCloseTabDocuments:", a1, v3);
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v10);
      }

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = v3;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18++), "resetTabViewItems", (_QWORD)v21);
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v16);
      }

      objc_msgSend(a1[9], "tabThumbnailCollectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setItemToActivate:", 0);

      objc_msgSend(a1[9], "updateTabBarAnimated:", 0);
    }
    else
    {
      -[TabController mutableAlternateTabs]((char *)a1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectsInArray:", v3);

    }
  }

}

- (void)closeTabDocuments:(id)a3
{
  -[TabController closeTabs:animated:](self, "closeTabs:animated:", a3, 1);
}

- (void)closeTabs:(id)a3
{
  -[TabController closeTabs:animated:](self, "closeTabs:animated:", a3, 1);
}

- (void)closeTabs:(id)a3 animated:(BOOL)a4
{
  -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, a3, a4, 1, 0, 1);
}

- (void)closeTabs:(id)a3 animated:(BOOL)a4 allowAddingToRecentlyClosedTabs:(BOOL)a5 showAutoCloseTabsAlert:(BOOL)a6
{
  -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, a3, a4, a5, 0, a6);
}

- (void)_sendEventsForAutoFillTelemetryForClosingTabs:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "sendEventsForAutoFillTelemetry");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }

}

- (void)_addTabsToRecentlyClosed:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "tabStateData", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isBlank") & 1) == 0)
            objc_msgSend(v4, "addObject:", v12);
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0D4EF28], "sharedBrowserSavedState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addRecentlyClosedTabs:", v4);

    -[TabController _registerUndoActionsForClosedTabs:](a1, v5);
  }

}

uint64_t __109__TabController__closeTabs_animated_allowAddingToRecentlyClosedTabs_keepWebViewAlive_showAutoCloseTabsAlert___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

- (void)allowsClosingLastTab
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = (uint64_t)result;
    objc_msgSend(result, "activeTabGroup");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[TabController canCloseLastTabInTabGroup:](v1, v2);

    return (void *)v3;
  }
  return result;
}

- (void)_presentAutomaticTabClosingPromptIfNeededForClosedTabCount:(uint64_t)a1
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD aBlock[5];

  if (!a1
    || (objc_msgSend(MEMORY[0x1E0D8A7A8], "userHasPreferenceForAutomaticTabClosingInterval") & 1) != 0
    || (objc_msgSend((id)a1, "isControlledByAutomation") & 1) != 0)
  {
    return;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__TabController__presentAutomaticTabClosingPromptIfNeededForClosedTabCount___block_invoke;
  aBlock[3] = &unk_1E9CF1900;
  aBlock[4] = a1;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 72), "tabThumbnailCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "presentationState") == 1)
  {

LABEL_7:
    v7 = *(_QWORD *)(a1 + 160) + a2;
    *(_QWORD *)(a1 + 160) = v7;
    goto LABEL_9;
  }
  v6 = objc_msgSend(v5, "presentationState");

  if (v6 == 2)
    goto LABEL_7;
  v7 = *(_QWORD *)(a1 + 160);
LABEL_9:
  if (v7 > 9)
    goto LABEL_13;
  v8 = *(_QWORD *)(a1 + 152);
  if (!v8)
  {
    -[TabController _createVeryRecentlyClosedTabCountInvalidationTimer](a1);
    v8 = *(_QWORD *)(a1 + 152);
  }
  v9 = v8 + a2;
  *(_QWORD *)(a1 + 152) = v9;
  if (v9 >= 6)
LABEL_13:
    v4[2](v4);

}

- (void)_registerUndoActionsForClosedTabs:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 144);
    if (!v4)
    {
LABEL_5:
      -[TabController _registerSingleUndoActionForClosedTabs:]((id *)a1, v3);
      goto LABEL_14;
    }
    v5 = objc_msgSend(v4, "type");
    if (v5 == 1)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = v3;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v16 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1, (_QWORD)v12);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[TabController _registerSingleUndoActionForClosedTabs:]((id *)a1, v11);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        }
        while (v8);
      }

    }
    else if (!v5)
    {
      goto LABEL_5;
    }
  }
LABEL_14:

}

uint64_t __76__TabController__presentAutomaticTabClosingPromptIfNeededForClosedTabCount___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "presentAutomaticTabClosingAlertController");

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelVeryRecentlyClosedTabCountInvalidationTimer");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  return result;
}

- (void)closeTab
{
  id v3;

  -[TabController activeTabDocument](self, "activeTabDocument");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController closeTab:animated:](self, "closeTab:animated:", v3, 1);

}

- (void)closeOtherTabs
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  -[TabController currentTabs](self, "currentTabs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__TabController_closeOtherTabs__block_invoke;
  v10[3] = &unk_1E9CF2C90;
  v10[4] = self;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __31__TabController_closeOtherTabs__block_invoke_2;
  v8[3] = &unk_1E9CF1830;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[TabController registerUndoWithName:actions:](self, "registerUndoWithName:actions:", v6, v8);

}

BOOL __31__TabController_closeOtherTabs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  id v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isPinned") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activeTabDocument");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v5 != v3;

  }
  return v4;
}

void __31__TabController_closeOtherTabs__block_invoke_2(uint64_t a1)
{
  -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 1u, 1, 0, 1);
}

- (void)closeAllOpenTabsAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  -[TabController unpinnedTabs](self, "unpinnedTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _undoCloseAllTabsActionName](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__TabController_closeAllOpenTabsAnimated___block_invoke;
  v8[3] = &unk_1E9CF1D28;
  v8[4] = self;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  -[TabController registerUndoWithName:actions:](self, "registerUndoWithName:actions:", v6, v8);

}

- (id)_undoCloseAllTabsActionName
{
  if (a1)
  {
    objc_msgSend(a1, "numberOfCurrentNonHiddenTabs");
    _WBSLocalizedString();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __42__TabController_closeAllOpenTabsAnimated___block_invoke(uint64_t a1)
{
  -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 1, 0, 1);
}

- (void)togglePinningTab:(id)a3 inInactiveTabGroup:(id)a4
{
  id v6;
  id v7;
  char v8;
  PinnedTabsManager *pinnedTabsManager;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isPinned");
  pinnedTabsManager = self->_pinnedTabsManager;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__TabController_togglePinningTab_inInactiveTabGroup___block_invoke;
  v15[3] = &unk_1E9CF7D80;
  v15[4] = self;
  v16 = v7;
  v17 = v6;
  v18 = v8 ^ 1;
  v10 = v6;
  v14 = v7;
  -[PinnedTabsManager performUpdatesUsingBlock:](pinnedTabsManager, "performUpdatesUsingBlock:", v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "libraryController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sidebarViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadSectionControllersIfNeeded");

}

void __53__TabController_togglePinningTab_inInactiveTabGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__TabController_togglePinningTab_inInactiveTabGroup___block_invoke_2;
  v6[3] = &unk_1E9CF7D58;
  v4 = *(id *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v3, 1, v6);

}

void __53__TabController_togglePinningTab_inInactiveTabGroup___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mutableTabWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v7 = v6;

  objc_msgSend(v7, "setSyncable:", objc_msgSend(v11, "isSyncable"));
  v8 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPinned:title:url:", v8, v9, v10);

  -[TabController _tabGroupTabDidUpdatePinned:inTabGroup:](*(id **)(a1 + 40), v7, v11);
}

- (void)_tabGroupTabDidUpdatePinned:(void *)a3 inTabGroup:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if ((objc_msgSend(v6, "usesGlobalPinnedTabs") & 1) != 0)
    {
      if (objc_msgSend(v5, "isPinned"))
      {
        if (objc_msgSend(v5, "isSyncable"))
        {
          v22[0] = v5;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "deleteTabs:", v8);

          objc_msgSend(a1[6], "flushDeletedTabsInTabGroup:", v7);
          v9 = objc_alloc(MEMORY[0x1E0DCCB30]);
          objc_msgSend(v5, "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "deviceIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (id)objc_msgSend(v9, "initWithUUID:deviceIdentifier:", v10, v11);

          objc_msgSend(v12, "adoptAttributesFromTab:", v5);
        }
        else
        {
          objc_msgSend(v7, "removeTab:", v5);
          v12 = v5;
        }
        v20 = a1[36];
        -[TabController _containerForPinnedTabsInTabGroup:](a1, v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendTab:inContainer:", v12, v19);
      }
      else
      {
        if (!objc_msgSend(v7, "isSyncable"))
        {
          objc_msgSend(a1[36], "moveTab:toTabGroup:afterTab:", v5, v7, 0);
          goto LABEL_15;
        }
        v14 = objc_alloc(MEMORY[0x1E0DCCB30]);
        objc_msgSend(v5, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deviceIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v14, "initWithUUID:deviceIdentifier:", v15, v16);

        objc_msgSend(v12, "adoptAttributesFromTab:", v5);
        v17 = a1[36];
        objc_msgSend(v5, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeTabWithUUID:persist:", v18, 1);

        v21 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "insertTabs:afterTab:", v19, 0);
      }

    }
    else
    {
      objc_msgSend(v7, "lastPinnedTabExcluding:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((WBSIsEqual() & 1) == 0)
        objc_msgSend(v7, "reorderTab:afterTab:", v5, v13);

    }
  }
LABEL_15:

}

- (BOOL)isTabPinnable:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "canSetPinned"))
  {
    objc_msgSend(v4, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      objc_msgSend(v4, "tabGroupUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        && (-[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", v7),
            (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v9 = v8;
        v6 = objc_msgSend(v8, "usesGlobalPinnedTabs") ^ 1;

      }
      else
      {
        LOBYTE(v6) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)moveTab:(id)a3 overTab:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TabController mutableCurrentTabs]((char *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v6);
  v19 = v7;
  v10 = objc_msgSend(v8, "indexOfObject:", v7);
  objc_msgSend(v8, "removeObjectAtIndex:", v9);
  objc_msgSend(v8, "insertObject:atIndex:", v6, v10);
  -[TabCollectionViewManager updateTabOverviewItems](self->_tabCollectionViewManager, "updateTabOverviewItems");
  -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self->_tabCollectionViewManager, "updateTabBarAnimated:keepingTabVisible:", 1, v6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_documentObservers;
  v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "tabController:didMoveTabDocument:overTabDocument:", self, v6, v6);
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "clearCachedTabCompletionData");

  -[TabController didUpdateTabDocuments](self, "didUpdateTabDocuments");
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reportTabUpdatedWithUpdateType:", 8);

}

- (id)tabDocumentForURL:(id)a3
{
  return -[TabController tabDocumentForURL:forceUnhibernate:](self, "tabDocumentForURL:forceUnhibernate:", a3, 0);
}

- (id)tabDocumentForURL:(id)a3 forceUnhibernate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  -[TabController tabForURL:](self, "tabForURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v7 = v8;
  }
  v9 = v7;

  return v9;
}

- (id)tabForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0DC3F68], "webClipWithURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "pageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_webkit_URLByRemovingFragment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "_webkit_URLByRemovingFragment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabController currentTabs](self, "currentTabs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __27__TabController_tabForURL___block_invoke;
  v16[3] = &unk_1E9CF1F70;
  v17 = v11;
  v18 = v9;
  v13 = v9;
  v14 = v11;
  objc_msgSend(v12, "safari_firstObjectPassingTest:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __27__TabController_tabForURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReusableForURL:webClipURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (TabDocument)tabDocumentForSpotlightSearch
{
  void *v2;
  void *v3;

  -[TabController currentTabDocuments](self, "currentTabDocuments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_firstObjectPassingTest:", &__block_literal_global_79_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TabDocument *)v3;
}

uint64_t __46__TabController_tabDocumentForSpotlightSearch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsReuseForSpotlightSearch");
}

- (uint64_t)_tabShouldBeHiddenFromWebExtensions:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "isPrivate"))
  {
    objc_msgSend(a1, "privateTabs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1 && objc_msgSend(v4, "isBlank"))
      v6 = objc_msgSend(v4, "isActive") ^ 1;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tabWithIDForWebExtensions:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  -[TabController normalAndPrivateTabs](self, "normalAndPrivateTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__TabController_tabWithIDForWebExtensions___block_invoke;
  v10[3] = &__block_descriptor_40_e29_B16__0___CollectionViewTab__8l;
  *(double *)&v10[4] = a3;
  objc_msgSend(v5, "safari_firstObjectPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TabController _tabShouldBeHiddenFromWebExtensions:](self, v6))
    v7 = 0;
  else
    v7 = v6;
  v8 = v7;

  return v8;
}

BOOL __43__TabController_tabWithIDForWebExtensions___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "idForWebExtensions");
  return v3 == *(double *)(a1 + 32);
}

- (id)duplicateTab:(id)a3
{
  id v4;
  id WeakRetained;
  TabDocument *v6;
  void *v7;
  TabDocument *v8;
  TabDocument *v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v6 = [TabDocument alloc];
  objc_msgSend(v4, "tabStateData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TabDocument initWithTabStateData:hibernated:browserController:](v6, "initWithTabStateData:hibernated:browserController:", v7, 0, WeakRetained);

  if (v8)
  {
    if (objc_msgSend(v4, "isBlank"))
      -[TabDocument setIsBlank:](v8, "setIsBlank:", 1);
    -[TabController insertTab:afterTab:inBackground:animated:](self, "insertTab:afterTab:inBackground:animated:", v8, v4, -[TabDocument isPrivateBrowsingEnabled](v8, "isPrivateBrowsingEnabled") ^ objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"), 1);
    v9 = v8;
  }

  return v8;
}

- (void)sortTabsWithMode:(int64_t)a3
{
  id v5;

  -[TabController activeTabGroupUUID](self, "activeTabGroupUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController sortTabsInTabGroupWithUUIDString:withSortMode:](self, "sortTabsInTabGroupWithUUIDString:withSortMode:", v5, a3);

}

- (void)sortTabsInTabGroupWithUUIDString:(id)a3 withSortMode:(int64_t)a4
{
  WBTabGroupManager *tabGroupManager;
  id WeakRetained;
  _QWORD v7[5];

  tabGroupManager = self->_tabGroupManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__TabController_sortTabsInTabGroupWithUUIDString_withSortMode___block_invoke;
  v7[3] = &__block_descriptor_40_e27_v16__0__WBMutableTabGroup_8l;
  v7[4] = a4;
  -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabsInTabGroupWithUUID:persist:usingBlock:", a3, 1, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 1);

}

void __63__TabController_sortTabsInTabGroupWithUUIDString_withSortMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = a2;
  objc_msgSend(v3, "tabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__TabController_sortTabsInTabGroupWithUUIDString_withSortMode___block_invoke_2;
  v6[3] = &__block_descriptor_40_e39_q24__0__WBMutableTab_8__WBMutableTab_16l;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "sortWithOptions:usingComparator:", 16, v6);
  objc_msgSend(v3, "setTabs:", v5);

}

uint64_t __63__TabController_sortTabsInTabGroupWithUUIDString_withSortMode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 == 1)
  {
    objc_msgSend(v6, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_highLevelDomainFromHost");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safari_highLevelDomainFromHost");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v9 && v10)
    {
      v3 = 1;
      goto LABEL_13;
    }
    if (v9 && !v10)
    {
      v3 = -1;
      goto LABEL_13;
    }
    if (!(v9 | v10))
    {
      v3 = 0;
      goto LABEL_13;
    }
LABEL_4:
    v3 = objc_msgSend((id)v9, "localizedStandardCompare:", v10);
LABEL_13:

    goto LABEL_14;
  }
  if (!v8)
  {
    objc_msgSend(v6, "title");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
LABEL_14:

  return v3;
}

- (void)replaceBlankActiveTabWithTab:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  TabController *v11;
  id v12;

  v8 = a3;
  -[TabController activeTabDocument](self, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isBlank") & 1) != 0
    || (-[TabController currentTabs](self, "currentTabs"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 != 1))
  {
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__TabController_replaceBlankActiveTabWithTab___block_invoke;
    v9[3] = &unk_1E9CF2990;
    v10 = v8;
    v11 = self;
    v12 = v4;
    objc_msgSend(v7, "performWithoutAnimation:", v9);

  }
}

void __46__TabController_replaceBlankActiveTabWithTab___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "browserController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(id **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "wbTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TabController _dropWBTab:fromBrowserController:atIndex:pinned:anchorTab:](v2, v3, v6, 0, 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "closeTab:animated:", *(_QWORD *)(a1 + 48), 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "updateFavoritesForNewDocument");

}

- (id)_dropWBTab:(void *)a3 fromBrowserController:(unint64_t)a4 atIndex:(int)a5 pinned:(void *)a6 anchorTab:
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  unint64_t v35;
  char v36;
  id *v37;
  void *v38;
  id WeakRetained;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  unsigned int v77;
  unint64_t v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[5];
  id v86;
  id v87;
  id v88;
  unint64_t v89;
  _QWORD aBlock[4];
  char v91;
  id v92;
  id v93;
  _QWORD v94[3];

  v94[1] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v80 = a6;
  if (!a1)
  {
    v71 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v12, "tabController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v11, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);
  objc_msgSend(v13, "tabWithUUID:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v77 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  if ((objc_msgSend(v11, "canSetPinned") & 1) == 0)
    a5 = objc_msgSend(v11, "isPinned");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke;
  aBlock[3] = &__block_descriptor_33_e22_v16__0__WBMutableTab_8l;
  v91 = a5;
  v81 = _Block_copy(aBlock);
  objc_msgSend(v11, "tabGroupUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _foreignLocalTabGroupWithUUID:](a1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "activeTabGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a5 && (objc_msgSend(v20, "usesGlobalPinnedTabs") & 1) != 0)
    v22 = 0;
  else
    v22 = v21;
  v23 = v22;
  v24 = (void *)v17;
  v82 = v19;
  v79 = v21;
  v78 = a4;
  if ((objc_msgSend(v19, "isEqual:", v23) & 1) != 0)
  {
    LOBYTE(v25) = 1;
  }
  else if ((objc_msgSend(v19, "isSyncable") & 1) != 0)
  {
    LOBYTE(v25) = 0;
  }
  else
  {
    v25 = objc_msgSend(v23, "isSyncable") ^ 1;
  }
  objc_msgSend(v82, "profileIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "profileIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = WBSIsEqual();

  if ((v82 != 0) == (v23 != 0))
  {
    if (v24)
      v36 = v25;
    else
      v36 = 0;
    if ((v36 & 1) != 0)
    {
      v29 = v24;
      objc_msgSend(v12, "tabController");
      v37 = (id *)objc_claimAutoreleasedReturnValue();

      if (v37 == a1)
      {
        objc_msgSend(a1, "currentTabs");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "indexOfObject:", v24);

        v35 = 0x1E0CB3000;
        if (v74 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[TabController _insertTab:atIndex:inBackground:animated:updateUI:](a1, v29, v78, 1, v77, 1);
        }
        else
        {
          objc_msgSend(a1, "currentTabs");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "objectAtIndexedSubscript:", (_QWORD)((__PAIR128__(v78, v74) - v78) >> 64));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "moveTab:overTab:", v29, v76);

        }
LABEL_31:
        if (!v23)
          goto LABEL_36;
        goto LABEL_32;
      }
      objc_msgSend(v12, "tabController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController _detachTab:animated:](v38, v24, v77);

      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(v24, "setBrowserController:", WeakRetained);

      -[TabController _insertTab:atIndex:inBackground:animated:updateUI:](a1, v24, v78, 1, v77, 1);
    }
    else
    {
      v46 = (void *)v78;
      if (v78)
      {
        objc_msgSend(a1, "currentTabs");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectAtIndexedSubscript:", v78 - 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "wbTab");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v93 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController updateLastSelectedTabUUIDForClosingWBTabs:]((uint64_t)a1, v49);

      if ((v28 & 1) == 0)
      {
        +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v11, "uuid");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v51, "initWithUUIDString:", v52);
        objc_msgSend(v50, "removeReusableTabWithUUID:", v53);

      }
      v54 = a1[6];
      v92 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v55, v23, v46, 0);

      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "reportTabUpdatedWithUpdateType:", 8);

      v29 = v24;
    }
    v35 = 0x1E0CB3000uLL;
    goto LABEL_31;
  }
  v29 = v24;
  if (v23 || ((a5 ^ 1) & 1) != 0)
  {
    v35 = 0x1E0CB3000;
    if (!v23)
      goto LABEL_36;
    v40 = a1[6];
    v94[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "wbTab");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v41, v23, v42, 0);

    v43 = a1[36];
    objc_msgSend(v11, "uuid");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeTabWithUUID:persist:", v44, objc_msgSend(v23, "isSyncable"));

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "reportTabUpdatedWithUpdateType:", 8);

LABEL_32:
    v57 = a1[15];
    v58 = objc_alloc(*(Class *)(v35 + 2600));
    objc_msgSend(v11, "uuid");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v58, "initWithUUIDString:", v59);
    objc_msgSend(v57, "objectForKeyedSubscript:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "UUIDString");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      v63 = v62;
    }
    else
    {
      objc_msgSend(v11, "uuid");
      v63 = (id)objc_claimAutoreleasedReturnValue();
    }
    v64 = v63;
    objc_msgSend(a1[6], "updateTabWithUUID:persist:notify:usingBlock:", v63, 0, 1, v81);

    goto LABEL_36;
  }
  v30 = MEMORY[0x1E0C809B0];
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_2;
  v85[3] = &unk_1E9CF7EC0;
  v85[4] = a1;
  v31 = v11;
  v86 = v31;
  v87 = v29;
  v88 = v81;
  v89 = v78;
  v32 = _Block_copy(v85);
  objc_msgSend(a1[36], "updatePinnedTabsInContainer:usingBlock:", a1, v32);
  v33 = a1[6];
  objc_msgSend(v82, "uuid");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v30;
  v83[1] = 3221225472;
  v83[2] = __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_4;
  v83[3] = &unk_1E9CF78F8;
  v84 = v31;
  objc_msgSend(v33, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v34, 1, v83);

  v35 = 0x1E0CB3000;
LABEL_36:
  v65 = objc_alloc(*(Class *)(v35 + 2600));
  objc_msgSend(v11, "uuid");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v65, "initWithUUIDString:", v66);

  objc_msgSend(a1[15], "objectForKeyedSubscript:", v67);
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v68;
  if (v68)
    v70 = (void *)v68;
  else
    v70 = v67;
  objc_msgSend(a1, "tabWithUUID:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
  return v71;
}

- (void)replaceTabDocument:(id)a3 withTabDocument:(id)a4
{
  -[TabController replaceTabDocument:withTabDocument:committingSpeculativeLoad:](self, "replaceTabDocument:withTabDocument:committingSpeculativeLoad:", a3, a4, 0);
}

- (void)replaceTabDocument:(id)a3 withTabDocument:(id)a4 committingSpeculativeLoad:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSHashTable *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  id WeakRetained;
  int v26;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "isPrivateBrowsingEnabled");
  if (v5)
  {
    objc_msgSend(v8, "tabGroupTab");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTabGroupTab:", v11);

  }
  objc_msgSend(v8, "willClose");
  -[TabController _mutableTabsForPrivateBrowsing:]((char *)self, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", v8);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138478339;
      v34 = v8;
      v35 = 2113;
      v36 = v9;
      v37 = 2113;
      v38 = v12;
      _os_log_fault_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_FAULT, "Failed to find old tab document %{private}@ in all tab documents %{private}@ to be replaced with new tab document %{private}@, inserting with default ordering instead", buf, 0x20u);
    }
    -[TabController insertNewTabDocumentWithDefaultOrdering:inBackground:animated:](self, "insertNewTabDocumentWithDefaultOrdering:inBackground:animated:", v9, 0, 1);
  }
  else
  {
    v15 = v13;
    v26 = v10;
    -[TabController willLoseOwnershipOfTab:](self, "willLoseOwnershipOfTab:", v8);
    v27 = v5;
    if (v5)
    {
      objc_msgSend(v8, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUuid:", v16);

    }
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v15, v9);
    objc_msgSend(v9, "didReplaceTabDocument:", v8);
    objc_msgSend(v8, "webExtensionsController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didReplaceTab:newTab:", v8, v9);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = self->_documentObservers;
    v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
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
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v23, "tabController:didReplaceTabDocument:withTabDocument:", self, v8, v9);
        }
        v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v20);
    }

    if (v27)
      ++self->_updateTabsSuppressionCount;
    -[TabController _activeTabDocumentForPrivateBrowsing:]((char *)self, v26);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v24 == v8)
    {
      if (v26 == -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
        -[TabController setActiveTabDocument:](self, "setActiveTabDocument:", v9);
      else
        -[TabController _setActiveTabDocument:](self, v9);
    }
    if (v27)
      --self->_updateTabsSuppressionCount;
    -[TabController didUpdateTabDocuments](self, "didUpdateTabDocuments");
    -[TabCollectionViewManager updateTabOverviewItems](self->_tabCollectionViewManager, "updateTabOverviewItems");
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "clearCachedTabCompletionData");

  }
}

void __47__TabController__replaceTabs_withTabs_persist___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "webExtensionsController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didOpenTab:", *(_QWORD *)(a1 + 32));

}

uint64_t __47__TabController__replaceTabs_withTabs_persist___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCloseTab:windowIsClosing:", *(_QWORD *)(a1 + 40), 0);
}

- (id)_firstUnpinnedTab
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "currentTabs");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "safari_firstObjectPassingTest:", &__block_literal_global_384);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)updateWBTabWithTab:(id)a3 notify:(BOOL)a4 persist:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  int v10;
  PinnedTabsManager *pinnedTabsManager;
  void *v12;
  void *v13;
  WBTabGroupManager *tabGroupManager;
  id v15;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (self->_activeTabGroupUUID && !self->_updateTabsSuppressionCount)
  {
    v15 = v8;
    if (objc_msgSend(v8, "isPinned")
      && (-[TabController activeTabGroup](self, "activeTabGroup"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "usesGlobalPinnedTabs"),
          v9,
          v10))
    {
      pinnedTabsManager = self->_pinnedTabsManager;
      objc_msgSend(v15, "uuidString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tabUpdateBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PinnedTabsManager updatePinnedTabWithUUID:inContainer:usingBlock:](pinnedTabsManager, "updatePinnedTabWithUUID:inContainer:usingBlock:", v12, self, v13);
    }
    else
    {
      tabGroupManager = self->_tabGroupManager;
      objc_msgSend(v15, "uuidString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tabUpdateBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroupManager updateTabWithUUID:persist:notify:usingBlock:](tabGroupManager, "updateTabWithUUID:persist:notify:usingBlock:", v12, v5, v6, v13);
    }

    if (v5)
    {
      -[TabController persistTab:notify:](self, "persistTab:notify:", v15, v6);
      -[TabController updateActiveTab](self, "updateActiveTab");
    }
    -[TabController updateLocalTabGroupTitle](self, "updateLocalTabGroupTitle");
    v8 = v15;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TabController;
  -[TabController dealloc](&v4, sel_dealloc);
}

- (void)clearBrowserController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[TabCollectionViewManager clearSnapshotCache](self->_tabCollectionViewManager, "clearSnapshotCache");
  objc_storeWeak((id *)&self->_browserController, 0);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TabController normalAndPrivateTabs](self, "normalAndPrivateTabs", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearBrowserController");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[WBTabGroupManager removeTabGroupObserver:](self->_tabGroupManager, "removeTabGroupObserver:", self);
  -[PinnedTabsManager removePinnedTabsObserver:](self->_pinnedTabsManager, "removePinnedTabsObserver:", self);
}

- (BOOL)isControlledByAutomation
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v3 = objc_msgSend(WeakRetained, "isControlledByAutomation");

  return v3;
}

- (void)setPrivateBrowsingMode:(int64_t)a3
{
  -[TabController setPrivateBrowsingMode:animated:](self, "setPrivateBrowsingMode:animated:", a3, 0);
}

- (BOOL)isPrivateBrowsingAndLocked
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled");
  if (v3)
  {
    -[TabController _application](self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPrivateBrowsingLocked");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)updateLockedBrowsingState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TabController privateTabDocuments](self, "privateTabDocuments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateLockedBrowsingState");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (uint64_t)_performWithFixedTabBarItems:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD);

  if (result)
  {
    v2 = result;
    v3 = *(void **)(result + 72);
    v4 = a2;
    objc_msgSend(v3, "beginFixingTabBarItems");
    v4[2](v4);

    return objc_msgSend(*(id *)(v2 + 72), "endFixingTabBarItems");
  }
  return result;
}

- (void)insertTabDocumentFromTabStateData:(id)a3
{
  id v4;
  TabDocument *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TabDocument *v11;

  v4 = a3;
  v5 = [TabDocument alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v11 = -[TabDocument initWithTabStateData:hibernated:browserController:](v5, "initWithTabStateData:hibernated:browserController:", v4, 0, WeakRetained);

  -[TabController activeTabDocument](self, "activeTabDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isBlank"))
  {
    -[TabCollectionViewManager beginFixingTabBarItems](self->_tabCollectionViewManager, "beginFixingTabBarItems");
    -[TabController activeTabDocument](self, "activeTabDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController insertTab:afterTab:inBackground:animated:](self, "insertTab:afterTab:inBackground:animated:", v11, v8, 0, 1);

    -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v7, 0, 0, 0, 1);
    -[TabCollectionViewManager endFixingTabBarItems](self->_tabCollectionViewManager, "endFixingTabBarItems");
    -[TabCollectionViewManager updateTabBarAnimated:](self->_tabCollectionViewManager, "updateTabBarAnimated:", 0);
  }
  else
  {
    -[TabController insertTab:afterTab:inBackground:animated:](self, "insertTab:afterTab:inBackground:animated:", v11, 0, 0, 0);
  }
  -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabCollectionViewManager tabOverview](self->_tabCollectionViewManager, "tabOverview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissAnimated:", objc_msgSend(v10, "presentationState") != 0);

}

- (void)restoreEducationDeviceTabs
{
  -[TabController _restoreEducationTabsIfNecessaryAnimated:]((uint64_t)self, 0);
}

- (void)updateEducationTabsLastSyncDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_didRestoreCloudTabsForEducationDevice)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TabController cloudTabStore](self, "cloudTabStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastModified");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("SafariEducationModeEducationTabsLastSyncDate"));

    objc_msgSend(v6, "synchronize");
  }
}

- (void)addBookmarkFolderForTabs:(id)a3
{
  BrowserController **p_browserController;
  id v4;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "addBookmarkFolderForTabs:", v4);

}

- (id)dropTabsAtIndex:(unint64_t)a3 pinned:(BOOL)a4 dropSession:(id)a5 dragItems:(id)a6
{
  void *v6;
  id v11;
  id v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *originalToReplacementUUIDMap;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  BOOL v41;

  v11 = a5;
  v12 = a6;
  -[TabCollectionViewManager dismissTabHoverPreview](self->_tabCollectionViewManager, "dismissTabHoverPreview");
  +[TabDocumentManager sharedManager](TabDocumentManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginSuppressingTabRecycling");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  originalToReplacementUUIDMap = self->_originalToReplacementUUIDMap;
  self->_originalToReplacementUUIDMap = v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TabController currentTabs](self, "currentTabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3 - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke;
  v36[3] = &unk_1E9CF7E28;
  v36[4] = self;
  v40 = a3;
  v41 = a4;
  v21 = v18;
  v37 = v21;
  v22 = v19;
  v38 = v22;
  v23 = v16;
  v39 = v23;
  objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", 2, v36);
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v20;
    v31 = 3221225472;
    v32 = __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke_2;
    v33 = &unk_1E9CF7E78;
    v34 = v12;
    v35 = v22;
    objc_msgSend(v24, "buildNavigationIntentForDropSession:completionHandler:", v11, &v30);

  }
  +[TabDocumentManager sharedManager](TabDocumentManager, "sharedManager", v30, v31, v32, v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "endSuppressingTabRecycling");

  -[TabController didUpdateTabDocuments](self, "didUpdateTabDocuments");
  -[TabCollectionViewManager updateTabOverviewItems](self->_tabCollectionViewManager, "updateTabOverviewItems");
  v26 = self->_originalToReplacementUUIDMap;
  self->_originalToReplacementUUIDMap = 0;

  v27 = v39;
  v28 = v23;

  return v28;
}

void __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  objc_msgSend(v5, "safari_localWBTab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_localBrowserController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || ((v8 = objc_msgSend(v6, "isPrivateBrowsing"),
         v8 == objc_msgSend(*(id *)(a1 + 32), "isPrivateBrowsingEnabled"))
      ? (v9 = v7 == 0)
      : (v9 = 1),
        v9))
  {
    -[TabController _openTabForDroppedLinkAtIndex:pinned:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v11);

  }
  else
  {
    -[TabController _dropWBTab:fromBrowserController:atIndex:pinned:anchorTab:](*(id **)(a1 + 32), v6, v7, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(void **)(a1 + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 56), "insertObject:atIndex:", v12, 0);

}

- (TabDocument)_openTabForDroppedLinkAtIndex:(uint64_t)a3 pinned:
{
  unsigned int v6;
  id v7;
  int v8;
  TabDocument *v9;
  id WeakRetained;
  TabDocument *v11;
  id v13;

  if (a1)
  {
    v6 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
    v7 = a1[4];
    if (v7
      && (v8 = objc_msgSend(v7, "isPrivateBrowsingEnabled"),
          v8 == objc_msgSend(a1, "isPrivateBrowsingEnabled")))
    {
      v11 = (TabDocument *)a1[4];
      v13 = a1[4];
      a1[4] = 0;

      if (-[TabDocument canSetPinned](v11, "canSetPinned"))
        objc_msgSend(a1, "setTab:isPinned:", v11, a3);
    }
    else
    {
      v9 = [TabDocument alloc];
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      v11 = -[TabDocument initWithBrowserController:](v9, "initWithBrowserController:", WeakRetained);

      if (-[TabDocument canSetPinned](v11, "canSetPinned"))
        -[TabDocument setPinned:](v11, "setPinned:", a3);
      -[TabController _insertTab:atIndex:inBackground:animated:updateUI:](a1, v11, a2, 1, v6, 1);
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "type") == 9)
    {
      objc_msgSend(v4, "navigationIntents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    v7 = objc_msgSend(v5, "count");
    if (v7 == objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v8 = *(void **)(a1 + 40);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke_3;
      v9[3] = &unk_1E9CF7E50;
      v10 = v6;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

    }
  }

}

void __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleNavigationIntent:completion:", v6, 0);

}

void __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v3, "pinnedTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(v12, "title");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    v3 = v12;
  }
  else
  {
    v7 = 0;
  }
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v3, "pinnedURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v12, "url");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v12, "setPinned:title:url:", *(unsigned __int8 *)(a1 + 32), v7, v11);

}

- (id)_foreignLocalTabGroupWithUUID:(id *)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    -[TabController _tabGroupsFromAllWindows](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__TabController__foreignLocalTabGroupWithUUID___block_invoke;
    v6[3] = &unk_1E9CF7C08;
    v7 = v3;
    objc_msgSend(v4, "safari_firstObjectPassingTest:", v6);
    a1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

id __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  _QWORD v17[4];
  id v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pinnedTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_3;
  v17[3] = &unk_1E9CF7B50;
  v5 = v3;
  v18 = v5;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(*(id *)(a1 + 40), "isSyncable"))
  {
    v8 = objc_alloc(MEMORY[0x1E0DCCB30]);
    objc_msgSend(*(id *)(a1 + 40), "deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUID:deviceIdentifier:", 0, v9);

    objc_msgSend(v10, "adoptAttributesFromTab:", *(_QWORD *)(a1 + 40));
    v11 = *(_QWORD **)(a1 + 32);
    v12 = v11[6];
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tabGroupManager:willReplaceTabWithUUID:withTabWithUUID:", v12, v13, v14);

  }
  else
  {
    v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  }
  objc_msgSend(*(id *)(a1 + 48), "tabUpdateBlock");
  v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v15)[2](v15, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(v7, "insertObject:atIndex:", v10, *(_QWORD *)(a1 + 64));

  return v7;
}

id __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v3, "wbTab");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v10, "mutableCopy");

  }
  objc_msgSend(v3, "tabUpdateBlock");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v11)[2](v11, v9);

  return v9;
}

void __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isSyncable"))
  {
    v5[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteTabs:", v4);

  }
  else
  {
    objc_msgSend(v3, "removeTab:", *(_QWORD *)(a1 + 32));
  }

}

- (void)updateLastSelectedTabUUIDForClosingWBTabs:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  TabGroupTabOrderProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "tabGroupWithUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TabGroupTabOrderProvider initWithTabGroup:]([TabGroupTabOrderProvider alloc], "initWithTabGroup:", v6);
    objc_msgSend(*(id *)(a1 + 320), "setTabOrderProvider:", v7);
    v8 = *(void **)(a1 + 320);
    -[TabGroupTabOrderProvider orderedTabsForTabs:](v7, "orderedTabsForTabs:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "tabToSelectBeforeClosingTabs:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 320), "setTabOrderProvider:", a1);
    if (v11)
    {
      v12 = *(void **)(a1 + 48);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__TabController_updateLastSelectedTabUUIDForClosingWBTabs___block_invoke;
      v13[3] = &unk_1E9CF78F8;
      v14 = v11;
      objc_msgSend(v12, "updateTabGroupWithUUID:persist:usingBlock:", v5, 1, v13);

    }
  }
}

- (void)willLoseOwnershipOfTab:(id)a3
{
  NSMapTable *uuidToTabMap;
  void *v5;
  TabCollectionViewManager *tabCollectionViewManager;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  uuidToTabMap = self->_uuidToTabMap;
  objc_msgSend(v9, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](uuidToTabMap, "removeObjectForKey:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    tabCollectionViewManager = self->_tabCollectionViewManager;
    v7 = v9;
    objc_msgSend(v7, "removeRenderingProgressObserver:", tabCollectionViewManager);
    +[TabDocumentManager sharedManager](TabDocumentManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeTab:", v7);

  }
}

- (void)tabDocumentDidUpdateUUID:(id)a3 previousUUID:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (a4)
    -[NSMapTable removeObjectForKey:](self->_uuidToTabMap, "removeObjectForKey:", a4);
  objc_msgSend(v7, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_uuidToTabMap, "setObject:forKey:", v7, v6);
  -[TabCollectionViewManager updateSnapshotIdentifiers](self->_tabCollectionViewManager, "updateSnapshotIdentifiers");

}

- (void)_hibernateTab:(char *)a1
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  HibernatedTab *v8;
  void *v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    v10 = v3;
    v4 = objc_msgSend(v3, "isPrivateBrowsingEnabled");
    v5 = 16;
    if (v4)
      v5 = 24;
    v6 = *(id *)&a1[v5];
    v7 = objc_msgSend(v6, "indexOfObject:", v10);
    objc_msgSend(a1, "willLoseOwnershipOfTab:", v10);
    objc_msgSend(v10, "willClose");
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = -[HibernatedTab initWithTabDocument:]([HibernatedTab alloc], "initWithTabDocument:", v10);
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v7, v8);
      objc_msgSend(v10, "webExtensionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didReplaceTab:newTab:", v10, v8);

    }
    v3 = v10;
  }

}

uint64_t __74__TabController__prepareToMoveTabDocumentToWindow_createPlaceholderImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlaceholderImage:", 0);
}

- (void)_lockedPrivateBrowsingStateDidChange:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController _application](self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
  {
    v5 = -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled");

    if (v5)
      -[TabCollectionViewManager updateTabOverviewItems](self->_tabCollectionViewManager, "updateTabOverviewItems");
  }
  else
  {

  }
}

- (void)_cancelPendingUpdateUserActivityTimer
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 80);
    if (v2)
    {
      objc_msgSend(v2, "invalidate");
      v3 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

    }
  }
}

- (void)_updateUserActivityTimerFired
{
  -[TabController _cancelPendingUpdateUserActivityTimer]((uint64_t)self);
  -[TabDocument updateUserActivity](self->_normalActiveTabDocument, "updateUserActivity");
}

- (NSArray)tabsMatchingSearchTerm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "presentationState"))
  {
    objc_msgSend(v3, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemsMatchingSearchTerm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__TabController_tabsMatchingSearchTerm__block_invoke;
    v8[3] = &unk_1E9CF7F08;
    v8[4] = self;
    objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v6;
}

id __39__TabController_tabsMatchingSearchTerm__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)indexOfSelectedTab
{
  void *v3;
  unint64_t v4;

  -[TabController activeTabDocument](self, "activeTabDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TabController indexForTab:](self, "indexForTab:", v3);

  return v4;
}

- (id)tabAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[TabController currentTabs](self, "currentTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)originatingTabForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "shouldSelectOriginatingTabWhenClosed"))
  {
    objc_msgSend(v4, "ancestorTabIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
      -[TabController tabWithUUID:](self, "tabWithUUID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)numberOfTabs
{
  void *v2;
  unint64_t v3;

  -[TabController currentTabs](self, "currentTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)indexForTab:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[TabController currentTabs](self, "currentTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)tabGroupWithUUID:(id)a3
{
  return (id)-[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", a3);
}

- (id)_tabGroupsFromAllWindows
{
  id *v1;
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v1 = a1;
  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(v1 + 1);
    objc_msgSend(WeakRetained, "browserWindowController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browserControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "windowState", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localTabGroup");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "safari_addObjectUnlessNil:", v13);

          objc_msgSend(v11, "windowState");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "privateTabGroup");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "safari_addObjectUnlessNil:", v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    objc_msgSend(v1[6], "allSyncedTabGroupsExceptRemoteUnnamedTabGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v16);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __47__TabController__foreignLocalTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)canRenameActiveTabGroup
{
  void *v2;
  char v3;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSyncable");

  return v3;
}

- (id)_createNewTabGroupActionForTabGroupsMenu:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  char v12;

  if (!a1)
    return 0;
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCustomTabGroupsEnabled");

  if (!v5)
    return 0;
  v6 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__TabController__createNewTabGroupActionForTabGroupsMenu___block_invoke;
  v11[3] = &unk_1E9CF7F58;
  v11[4] = a1;
  v12 = a2;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("NewEmptyTabGroupMenuItem"));
  return v9;
}

uint64_t __58__TabController__createNewTabGroupActionForTabGroupsMenu___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];
  char v8;

  objc_msgSend(a2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 5;
  else
    v4 = 3;

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__TabController__createNewTabGroupActionForTabGroupsMenu___block_invoke_2;
  v7[3] = &unk_1E9CF7F30;
  v7[4] = v5;
  v7[5] = v4;
  v8 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v5, "createTabGroupFromExistingTabs:completionHandler:", 0, v7);
}

void __58__TabController__createNewTabGroupActionForTabGroupsMenu___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    -[TabController _reportTabGroupCreationPrepopulatedWithTabs:fromPotentialAnalyticsSource:TabGroupsMenu:](*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_reportTabGroupCreationPrepopulatedWithTabs:(uint64_t)a3 fromPotentialAnalyticsSource:(int)a4 TabGroupsMenu:
{
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (a1)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v10 = 2;
      goto LABEL_6;
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "usingLoweredBar");

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (v8)
    {
      v10 = 5;
LABEL_6:
      objc_msgSend(v9, "didCreateTabGroupFromLocation:prepopulatedWithTabs:", v10, a2);
LABEL_7:

      return;
    }
    objc_msgSend(v9, "didCreateTabGroupFromLocation:prepopulatedWithTabs:", a3, a2);

    if (a3 == 3)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didCreateNewTabGroupFromTheDropDownMenu");
      goto LABEL_7;
    }
  }
}

- (id)_createFromCurrentTabsActionForTabGroupsMenu:(void *)a1
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  char v16;

  if (!a1)
    return 0;
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCustomTabGroupsEnabled");

  if (!v5)
    return 0;
  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unnamedTabGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__TabController__createFromCurrentTabsActionForTabGroupsMenu___block_invoke;
  v15[3] = &unk_1E9CF7F58;
  v15[4] = a1;
  v16 = a2;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v10, v12, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __62__TabController__createFromCurrentTabsActionForTabGroupsMenu___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];
  char v8;

  objc_msgSend(a2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 5;
  else
    v4 = 3;

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__TabController__createFromCurrentTabsActionForTabGroupsMenu___block_invoke_2;
  v7[3] = &unk_1E9CF7F30;
  v7[4] = v5;
  v7[5] = v4;
  v8 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v5, "createTabGroupFromExistingTabs:completionHandler:", 1, v7);
}

void __62__TabController__createFromCurrentTabsActionForTabGroupsMenu___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    -[TabController _reportTabGroupCreationPrepopulatedWithTabs:fromPotentialAnalyticsSource:TabGroupsMenu:](*(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)createTabGroupFromExistingTabs:(BOOL)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[TabController unnamedTabGroup](self, "unnamedTabGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController _representativeHostForTabGroup:](self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[TabController _closeTabGroup:]((id *)&self->super.isa, v8);
      v14 = 0;
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v8, "tabs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 == 2)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
    }
    else
    {
      v12 = v11 - 1;
      if (v11 != 1)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringWithFormat:", v15, v9, v12);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
    }
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v9);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (void *)v16;

    objc_msgSend(v8, "tabs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController presentAlertToCreateTabGroupFromTabs:withTitle:message:suggestedName:okActionTitle:completionHandler:](self, "presentAlertToCreateTabGroupFromTabs:withTitle:message:suggestedName:okActionTitle:completionHandler:", v18, v6, v14, 0, v7, v19);

    goto LABEL_12;
  }
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController presentAlertToCreateTabGroupFromTabs:withTitle:message:suggestedName:okActionTitle:completionHandler:](self, "presentAlertToCreateTabGroupFromTabs:withTitle:message:suggestedName:okActionTitle:completionHandler:", 0, v6, v14, 0, v7, v19);
LABEL_13:

}

- (id)_representativeHostForTabGroup:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    -[TabController _urlForActiveTabInTabGroup:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_userVisibleHostOrExtensionDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(v3, "representativeURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_closeTabGroup:(id *)a1
{
  id v3;
  id WeakRetained;

  if (a1)
  {
    v3 = a2;
    -[TabController _selectNewTabGroupIfNecessaryBeforeClosingTabGroup:](a1, v3);
    objc_msgSend(a1[6], "removeTabGroup:", v3);

    objc_msgSend(a1, "updateSelectedTabGroupName");
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 1);

  }
}

- (uint64_t)_currentTabsAreBlank
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "unpinnedTabs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_containsObjectPassingTest:", &__block_literal_global_149_0) ^ 1;

  return v2;
}

BOOL __37__TabController__currentTabsAreBlank__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)tabGroupsMenuChildrenProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _createNewTabGroupActionForTabGroupsMenu:]((uint64_t)self, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  if (-[TabController canCreateTabGroupFromCurrentTabs](self, "canCreateTabGroupFromCurrentTabs"))
  {
    -[TabController _createFromCurrentTabsActionForTabGroupsMenu:](self, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);

  }
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  -[TabController _switchToTabGroupMenu](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithArray:", v9);

  -[TabController submenuForSwitchingProfiles](self, "submenuForSwitchingProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_addObjectUnlessNil:", v11);

  return v10;
}

- (id)_switchToTabGroupMenu
{
  void *v1;
  void *v2;
  _QWORD v4[5];

  if (!a1)
    return 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__TabController__switchToTabGroupMenu__block_invoke;
  v4[3] = &unk_1E9CF7FC8;
  v4[4] = a1;
  objc_msgSend(a1, "tabGroupsMenuElementsWithOptions:newTabGroupName:hostTitle:descendantCount:movingSelectedTabs:actionHandler:", 15, 0, 0, 0, 0, v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __48__TabController_tabGroupsMenuForTabGroupButton___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didOpenTabGroupDropDownMenu");

    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v4, "reportIOSToolbarButtonUsage:withLayout:", 7, objc_msgSend(v5, "analyticsLayoutProvenance"));

    }
    objc_msgSend(WeakRetained, "tabGroupsMenuChildrenProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canCreateTabGroupFromCurrentTabs
{
  void *v3;
  int v4;
  void *v5;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isNamed") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[TabController activeTabGroup](self, "activeTabGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isPrivateBrowsing") & 1) != 0)
      LOBYTE(v4) = 0;
    else
      v4 = -[TabController _currentTabsAreBlank](self) ^ 1;

  }
  return v4;
}

void __38__TabController__switchToTabGroupMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setActiveTabGroupUUID:", v3);

}

id __30__TabController_tabExposeMenu__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __30__TabController_tabExposeMenu__block_invoke_2;
    v13[3] = &unk_1E9CF61B8;
    v13[4] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC39D0], "sf_tabMenuWithAdditionalChildrenProvider:", v13);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[9], "tabBarManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "displayMode");

    if (v5 != 2)
    {
      -[TabController _switchToTabGroupMenu](WeakRetained);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

    }
    objc_msgSend(v3, "addObject:", v2);
    objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "preferredCapsuleLayoutStyle");

    if (v8 == 1)
    {
      objc_msgSend(v3, "reverseObjectEnumerator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");

      v3 = (void *)v11;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __30__TabController_tabExposeMenu__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeTabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TabMenuProvider moveMenuForTab:dataSource:](TabMenuProvider, "moveMenuForTab:dataSource:", v2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (uint64_t)tabCollectionViewManager
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (UIMenu)newTabGroupMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIMenu *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _createNewTabGroupActionForTabGroupsMenu:]((uint64_t)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  -[TabController activeTabGroup](self, "activeTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isNamed") & 1) == 0)
  {
    -[TabController activeTabGroup](self, "activeTabGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isPrivateBrowsing") & 1) != 0 || -[TabController _currentTabsAreBlank](self))
    {

    }
    else
    {
      -[TabController activeTabDocument](self, "activeTabDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "libraryType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_6;
      -[TabController _createFromCurrentTabsActionForTabGroupsMenu:](self, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);
    }
  }

LABEL_6:
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E9CFDBB0, v3);
  v7 = (UIMenu *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)selectPreviousTabGroup
{
  -[TabController _switchTabGroupLoopByRelativeIndex:](self, -1);
}

- (void)_switchTabGroupLoopByRelativeIndex:(void *)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (a1)
  {
    objc_msgSend(a1, "tabGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(a1, "activeTabGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isPrivateBrowsing") & 1) == 0)
      objc_msgSend(v13, "safari_removeObjectsPassingTest:", &__block_literal_global_158);
    v6 = objc_msgSend(v13, "count");
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v13, "indexOfObject:", v5);
      v9 = v8 + a2;
      if ((unint64_t)(v8 + a2) > 0x7FFFFFFFFFFFFFFELL)
        v9 = v7 - 1;
      if (v9 >= v7)
        v10 = 0;
      else
        v10 = v9;
      if (v10 != v8)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setActiveTabGroupUUID:", v12);

      }
    }

  }
}

- (void)selectNextTabGroup
{
  -[TabController _switchTabGroupLoopByRelativeIndex:](self, 1);
}

uint64_t __52__TabController__switchTabGroupLoopByRelativeIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPrivateBrowsing");
}

- (void)updateActiveTab
{
  TabDocument *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  WBTabGroupManager *tabGroupManager;
  NSString *activeTabGroupUUID;
  void *v11;
  WBTabGroupManager *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  if (self->_activeTabGroupUUID && !self->_updateTabsSuppressionCount)
  {
    -[TabController activeTabDocument](self, "activeTabDocument");
    v3 = (TabDocument *)objc_claimAutoreleasedReturnValue();
    -[TabDocument libraryType](v3, "libraryType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      if (v3 == self->_tabDocumentBeingHiddenFromTabView)
      {
        v6 = 0;
      }
      else
      {
        -[TabDocument uuid](v3, "uuid");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "UUIDString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!-[TabDocument isPinned](v3, "isPinned")
        || (-[TabController activeTabGroup](self, "activeTabGroup"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "usesGlobalPinnedTabs"),
            v7,
            (v8 & 1) == 0))
      {
        tabGroupManager = self->_tabGroupManager;
        activeTabGroupUUID = self->_activeTabGroupUUID;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __32__TabController_updateActiveTab__block_invoke;
        v15[3] = &unk_1E9CF78F8;
        v16 = v6;
        -[WBTabGroupManager updateTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabGroupWithUUID:persist:usingBlock:", activeTabGroupUUID, 1, v15);

      }
      -[TabDocument tabGroupTab](v3, "tabGroupTab");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isShared") && (objc_msgSend(v11, "isMarkedAsRead") & 1) == 0)
      {
        v12 = self->_tabGroupManager;
        objc_msgSend(v11, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroupManager updateTabWithUUID:persist:notify:usingBlock:](v12, "updateTabWithUUID:persist:notify:usingBlock:", v13, 1, 1, &__block_literal_global_159);

      }
      -[WBWindowState activeTabUUIDForTabGroupWithUUID:](self->_windowState, "activeTabUUIDForTabGroupWithUUID:", self->_activeTabGroupUUID);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((WBSIsEqual() & 1) == 0)
      {
        -[WBWindowState setActiveTabUUID:forTabGroupWithUUID:](self->_windowState, "setActiveTabUUID:forTabGroupWithUUID:", v6, self->_activeTabGroupUUID);
        -[WBTabGroupManager saveWindowState:completionHandler:](self->_tabGroupManager, "saveWindowState:completionHandler:", self->_windowState, 0);
      }

    }
  }
}

uint64_t __32__TabController_updateActiveTab__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLastSelectedTabUUID:", *(_QWORD *)(a1 + 32));
}

uint64_t __32__TabController_updateActiveTab__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markAsRead");
}

- (void)updateBackgroundImageForTabGroup:(id)a3
{
  -[WBTabGroupManager updateTabGroupWithUUID:persist:usingBlock:](self->_tabGroupManager, "updateTabGroupWithUUID:persist:usingBlock:", a3, 1, &__block_literal_global_160);
}

uint64_t __50__TabController_updateBackgroundImageForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markBackgroundImageAsModified");
}

- (UIMenu)menuForSwitchingProfiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[TabController tabGroupManager](self, "tabGroupManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__TabController_menuForSwitchingProfiles__block_invoke;
  v8[3] = &unk_1E9CF80B0;
  v8[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E9CFDBB0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v6;
}

id __41__TabController_menuForSwitchingProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__TabController_menuForSwitchingProfiles__block_invoke_2;
  v13[3] = &unk_1E9CF6E08;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v7 = v3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("ProfileSwitcher-%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v11);

  objc_msgSend(v8, "setState:", -[TabController _isProfileActive:](*(void **)(a1 + 32), v7));
  return v8;
}

void __41__TabController_menuForSwitchingProfiles__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveProfileIdentifier:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "hideTabGroupPicker");

}

- (void)_isProfileActive:(void *)result
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    objc_msgSend(a2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activeProfileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v4);

    return (void *)v5;
  }
  return result;
}

- (UIMenu)menuForSwitchingProfilesQuickly
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  TabController *v18;
  id v19;

  -[TabController tabGroupManager](self, "tabGroupManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "activeProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("EnableQuickProfileSwitcher"));

    if (v10)
    {
      objc_msgSend(v5, "removeObject:", v8);
      objc_msgSend(v5, "addObject:", v8);
    }
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __48__TabController_menuForSwitchingProfilesQuickly__block_invoke;
    v17 = &unk_1E9CF80D8;
    v18 = self;
    v19 = v8;
    v11 = v8;
    objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v12, v14, v15, v16, v17, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (UIMenu *)v6;
}

id __48__TabController_menuForSwitchingProfilesQuickly__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__TabController_menuForSwitchingProfilesQuickly__block_invoke_2;
  v13[3] = &unk_1E9CF6E08;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v7 = v3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("ProfileSwitcher-%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v11);

  objc_msgSend(v8, "setState:", objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)));
  return v8;
}

void __48__TabController_menuForSwitchingProfilesQuickly__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveProfileIdentifier:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "hideTabGroupPicker");

}

- (UIMenu)submenuForSwitchingProfiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  if (!-[TabController hasMultipleProfiles](self, "hasMultipleProfiles"))
    return (UIMenu *)0;
  -[TabController tabGroupManager](self, "tabGroupManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__TabController_submenuForSwitchingProfiles__block_invoke;
  v17[3] = &unk_1E9CF80B0;
  v17[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabController activeProfile](self, "activeProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "symbolImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.crop.rectangle.stack"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  v12 = (void *)MEMORY[0x1E0DC39D0];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "menuWithTitle:image:identifier:options:children:", v13, v11, 0, 0, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabController activeProfile](self, "activeProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSubtitle:", v16);

  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("ProfileSwitcher"));
  return (UIMenu *)v14;
}

id __44__TabController_submenuForSwitchingProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__TabController_submenuForSwitchingProfiles__block_invoke_2;
  v13[3] = &unk_1E9CF6E08;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v7 = v3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("ProfileSwitcher-%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v11);

  objc_msgSend(v8, "setState:", -[TabController _isProfileActive:](*(void **)(a1 + 32), v7));
  return v8;
}

void __44__TabController_submenuForSwitchingProfiles__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setActiveProfileIdentifier:", v2);

}

void __49__TabController__updateTabOverviewBarButtonItems__block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__TabController__updateTabOverviewBarButtonItems__block_invoke_2;
    v6[3] = &unk_1E9CF8128;
    v6[4] = WeakRetained;
    v7 = a1[4];
    v8 = v3;
    v9 = a1[5];
    objc_copyWeak(&v11, a1 + 7);
    v10 = a1[6];
    dispatch_async(MEMORY[0x1E0C80D38], v6);

    objc_destroyWeak(&v11);
  }

}

void __49__TabController__updateTabOverviewBarButtonItems__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;

  objc_msgSend(*(id *)(a1 + 32), "activeTabGroupOrTabGroupVisibleInSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D4ED90]);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "tabGroupManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "iconForSharingTabGroup:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithTabGroup:inTabGroupManager:existingShare:icon:", v5, v6, v7, v8);

    v10 = *(void **)(a1 + 56);
    v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v12 = (void *)MEMORY[0x1E0DC3428];
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __49__TabController__updateTabOverviewBarButtonItems__block_invoke_3;
    v30 = &unk_1E9CF8100;
    v13 = v9;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v31 = v13;
    v32 = v14;
    v33 = v15;
    objc_copyWeak(&v34, (id *)(a1 + 72));
    objc_msgSend(v12, "actionWithHandler:", &v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v11, "initWithBarButtonSystemItem:primaryAction:", 9, v16, v27, v28, v29, v30);
    objc_msgSend(v10, "addObject:", v17);

    if (*(_QWORD *)(a1 + 48))
    {
      v18 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 11.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v19);

      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352))
      {
        v20 = objc_msgSend(*(id *)(a1 + 64), "newCollaborationButtonWithActiveTabGroup:existingShare:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(void **)(v21 + 352);
        *(_QWORD *)(v21 + 352) = v20;

      }
      v23 = *(void **)(a1 + 56);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352));
      objc_msgSend(v23, "addObject:", v24);

    }
    v25 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "tabOverview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBarButtonItems:", v25);

    objc_destroyWeak(&v34);
  }
}

void __49__TabController__updateTabOverviewBarButtonItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v4, "iconForSharingTabGroup:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateMetadataIcon:", v7);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabController _presentShareSheetWithTabGroupActivityItemConfiguration:sender:](WeakRetained, v8, v9);
}

- (void)_presentShareSheetWithTabGroupActivityItemConfiguration:(void *)a3 sender:
{
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  if (a1)
  {
    -[TabController _tabGroupShareSheetWithTabGroupActivityItemConfiguration:](a1, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE88]), "initWithItem:", v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "safari_popoverSourceInfo");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = 0;
          goto LABEL_9;
        }
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4EFA0]), "initWithView:", v9);
      }
    }
    v7 = (void *)v6;
LABEL_9:
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    objc_msgSend(WeakRetained, "presentModalViewController:fromPopoverSource:", v5, v7);

  }
}

- (void)shareRecordForActiveTabGroupWithCompletionHandler:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "activeTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isShared") & 1) != 0)
    {
      objc_initWeak(&location, a1);
      v5 = (void *)a1[6];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __67__TabController_shareRecordForActiveTabGroupWithCompletionHandler___block_invoke;
      v6[3] = &unk_1E9CF8200;
      objc_copyWeak(&v9, &location);
      v7 = v4;
      v8 = v3;
      objc_msgSend(v5, "shareRecordForTabGroup:completionHandler:", v7, v6);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    }

  }
}

- (id)tabGroupShareSheetForCurrentTabGroup
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController shareRecordForActiveTabGroup](self, "shareRecordForActiveTabGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D4ED90]);
  -[TabController tabGroupManager](self, "tabGroupManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController iconForSharingActiveTabGroup](self, "iconForSharingActiveTabGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTabGroup:inTabGroupManager:existingShare:icon:", v3, v6, v4, v7);

  -[TabController _tabGroupShareSheetWithTabGroupActivityItemConfiguration:](self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_tabGroupShareSheetWithTabGroupActivityItemConfiguration:(void *)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItemsConfiguration:", v3);
    objc_initWeak(&location, a1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__TabController__tabGroupShareSheetWithTabGroupActivityItemConfiguration___block_invoke;
    v6[3] = &unk_1E9CF8178;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "setCompletionWithItemsHandler:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __74__TabController__tabGroupShareSheetWithTabGroupActivityItemConfiguration___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[TabController _requestContactsAccessIfNeeded]((uint64_t)WeakRetained);

  }
  else if (v11)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __74__TabController__tabGroupShareSheetWithTabGroupActivityItemConfiguration___block_invoke_cold_1(v14);
  }

}

- (void)_requestContactsAccessIfNeeded
{
  id v1;

  if (a1)
  {
    if (!objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0))
    {
      objc_msgSend(MEMORY[0x1E0D8A868], "sharedContactStoreManager");
      v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "requestAccessForEntityType:completionHandler:", 0, &__block_literal_global_192);

    }
  }
}

- (void)_beganSharingTabGroup:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__TabController__beganSharingTabGroup___block_invoke;
  v6[3] = &unk_1E9CF1830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __39__TabController__beganSharingTabGroup___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56)))
    -[TabController _updateTabOverviewBarButtonItems](*(id **)(a1 + 32));
}

- (void)_markAllTabsInTabGroupAsRead:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 48);
    objc_msgSend(a2, "uuid");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v3, 1, &__block_literal_global_185);

  }
}

void __46__TabController__markAllTabsInTabGroupAsRead___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a2, "tabs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isMarkedAsRead") & 1) == 0)
          objc_msgSend(v7, "markAsRead");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_presentShareSheetForTabGroup:(void *)a3 sender:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(a1, "shareRecordForActiveTabGroup");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D4ED90]);
    objc_msgSend(a1, "tabGroupManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "iconForSharingTabGroup:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithTabGroup:inTabGroupManager:existingShare:icon:", v6, v8, v11, v9);

    -[TabController _presentShareSheetWithTabGroupActivityItemConfiguration:sender:]((id *)a1, v10, v5);
  }
}

void __47__TabController__requestContactsAccessIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__TabController__requestContactsAccessIfNeeded__block_invoke_cold_1(v4);
  }

}

- (UIImage)iconForSharingActiveTabGroup
{
  void *v3;
  void *v4;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController iconForSharingTabGroup:](self, "iconForSharingTabGroup:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (id)iconForSharingTabGroup:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)MEMORY[0x1E0D4EF88];
  v4 = a3;
  objc_msgSend(v3, "sharedSiteMetadataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabGroupIconProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconForTabGroup:", v4);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = iconForSharingTabGroup__appIcon;
  if (!(v7 | iconForSharingTabGroup__appIcon))
  {
    v9 = (void *)MEMORY[0x1E0D4ECB0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appIconForBundleIdentifier:imageSize:", v11, 60.0, 60.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("AppIcon"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)iconForSharingTabGroup__appIcon;
    iconForSharingTabGroup__appIcon = (uint64_t)v14;

    v8 = iconForSharingTabGroup__appIcon;
  }
  if (v7)
    v16 = (void *)v7;
  else
    v16 = (void *)v8;
  v17 = v16;

  return v17;
}

void __67__TabController_shareRecordForActiveTabGroupWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "isTabGroupActive:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    -[TabController _updateShare:forActiveTabGroup:](WeakRetained, v4, *(void **)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_updateShare:(void *)a3 forActiveTabGroup:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  UIImage *image;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C94A80]);

    objc_msgSend(a1, "iconForSharingTabGroup:", v5);
    image = (UIImage *)objc_claimAutoreleasedReturnValue();

    UIImagePNGRepresentation(image);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C94A78]);

  }
}

- (CKShare)shareRecordForActiveTabGroupIfIsShared
{
  void *v3;
  void *v4;

  -[TabController activeTabGroupOrTabGroupVisibleInSwitcher](self, "activeTabGroupOrTabGroupVisibleInSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isShared"))
  {
    -[TabController shareRecordForActiveTabGroup](self, "shareRecordForActiveTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (CKShare *)v4;
}

- (CKShare)shareRecordForActiveTabGroup
{
  void *v3;
  void *v4;
  id v5;

  -[TabController activeTabGroupOrTabGroupVisibleInSwitcher](self, "activeTabGroupOrTabGroupVisibleInSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager shareRecordForTabGroup:](self->_tabGroupManager, "shareRecordForTabGroup:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TabController _updateShare:forActiveTabGroup:](self, v4, v3);
    v5 = v4;
  }

  return (CKShare *)v4;
}

- (id)cachedTabSwitcherShareConfigurationForTabGroup:(id)a3
{
  NSMutableDictionary *cachedShareConfigurationsByTabGroupUUID;
  void *v4;
  void *v5;

  cachedShareConfigurationsByTabGroupUUID = self->_cachedShareConfigurationsByTabGroupUUID;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedShareConfigurationsByTabGroupUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedShareConfigurationsByTabGroupUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedShareConfigurationsByTabGroupUUID, "setObject:forKeyedSubscript:", 0, v4);
    -[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__TabController_clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID___block_invoke;
    v7[3] = &unk_1E9CF8228;
    v7[4] = self;
    -[TabController tabSwitcherShareConfigurationForTabGroup:completion:](self, "tabSwitcherShareConfigurationForTabGroup:completion:", v6, v7);

  }
}

void __77__TabController_clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "tabSwitcherViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsApplyContentAnimated:", 0);

}

- (void)tabSwitcherShareConfigurationForTabGroup:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  char v9;
  NSMutableDictionary *cachedShareConfigurationsByTabGroupUUID;
  void *v11;
  void *v12;
  WBTabGroupManager *tabGroupManager;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, void *);
  id v17;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "isNamed")
    && (+[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "areSharedTabGroupsEnabled"),
        v8,
        (v9 & 1) != 0))
  {
    cachedShareConfigurationsByTabGroupUUID = self->_cachedShareConfigurationsByTabGroupUUID;
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](cachedShareConfigurationsByTabGroupUUID, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v7[2](v7, v12);
    }
    else
    {
      objc_initWeak(&location, self);
      tabGroupManager = self->_tabGroupManager;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke;
      v14[3] = &unk_1E9CF82A0;
      v14[4] = self;
      v15 = v6;
      objc_copyWeak(&v17, &location);
      v16 = v7;
      -[WBTabGroupManager shareRecordForTabGroup:completionHandler:](tabGroupManager, "shareRecordForTabGroup:completionHandler:", v15, v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    v7[2](v7, 0);
  }

}

void __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke_2;
  block[3] = &unk_1E9CF8278;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  -[TabController _updateShare:forActiveTabGroup:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  v2 = objc_alloc(MEMORY[0x1E0D4ED90]);
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[6];
  objc_msgSend(v5, "iconForSharingTabGroup:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithTabGroup:inTabGroupManager:existingShare:icon:", v3, v6, v4, v7);

  v9 = objc_alloc(MEMORY[0x1E0D4EE28]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke_3;
  v20[3] = &unk_1E9CF8250;
  objc_copyWeak(&v23, (id *)(a1 + 64));
  v10 = v8;
  v21 = v10;
  v22 = *(id *)(a1 + 48);
  v11 = (void *)objc_msgSend(v9, "initWithShareHandler:", v20);
  if (*(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v13 = (void *)objc_msgSend(WeakRetained, "newCollaborationButtonWithActiveTabGroup:existingShare:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(v11, "setCollaborationButtonForLargeTitle:", v13);

    v14 = (void *)objc_msgSend(WeakRetained, "newCollaborationButtonWithActiveTabGroup:existingShare:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(v11, "setCollaborationButtonForNavigationBar:", v14);

  }
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 256);
    *(_QWORD *)(v17 + 256) = v16;

    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
  }
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v19);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_destroyWeak(&v23);

}

void __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "iconForSharingTabGroup:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateMetadataIcon:", v6);

    -[TabController _presentShareSheetWithTabGroupActivityItemConfiguration:sender:](v4, *(void **)(a1 + 32), v7);
  }

}

__CFString *__52__TabController_unnamedTabGroupDisplayTitleProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "usesGlobalPinnedTabs"))
    {
      v5 = (void *)WeakRetained[36];
      -[TabController _containerForPinnedTabsInTabGroup:](WeakRetained, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pinnedTabsInContainer:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v3, "tabs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = objc_msgSend(v7, "count") + v10;

    if (!v11)
      goto LABEL_10;
    if (v11 != 1)
      goto LABEL_9;
    objc_msgSend(v3, "tabs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
LABEL_9:
      v15 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v16, v11);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_10:
      _WBSLocalizedString();
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = &stru_1E9CFDBB0;
  }

  return v8;
}

- (id)_containerForPinnedTabsInTabGroup:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "isPrivateBrowsing"))
    {
      v5 = 1;
    }
    else
    {
      if (!objc_msgSend(v4, "isInDefaultProfile"))
      {
        objc_msgSend(v4, "profileIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[PinnedTabsContainer containerWithActiveProfileIdentifier:](PinnedTabsContainer, "containerWithActiveProfileIdentifier:", v6);
        a1 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      v5 = 0;
    }
    +[PinnedTabsContainer containerWithPrivateBrowsing:](PinnedTabsContainer, "containerWithPrivateBrowsing:", v5);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return a1;
}

- (void)willSelectProfileWithIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) == 0)
    -[PinnedTabsManager willSelectProfileWithIdentifier:](self->_pinnedTabsManager, "willSelectProfileWithIdentifier:", v4);

}

- (void)didSelectProfileWithIdentifier:(id)a3 previousProfileIdentifier:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadTabGroups");

  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) == 0)
    -[PinnedTabsManager didDeselectProfileWithIdentifier:](self->_pinnedTabsManager, "didDeselectProfileWithIdentifier:", v6);

}

- (WBTabGroup)focusedTabGroup
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  -[TabController _application](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedTabGroupUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TabController tabGroupWithUUID:](self, "tabGroupWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXSiriLink();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[TabController focusedTabGroup].cold.1();
    }
  }
  else
  {
    v5 = 0;
  }

  return (WBTabGroup *)v5;
}

- (void)openFocusProfileWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  -[TabController _application](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TabController activeProfile](self, "activeProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
      -[TabController _presentOpenAlertForFocusProfile:completionHandler:]((uint64_t)self, v5, v10);
  }

}

- (void)_presentOpenAlertForFocusProfile:(void *)a3 completionHandler:
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  id v28;
  id v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v34 = v5;
  if (a1)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 280), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v9;
      v45 = 2114;
      v46 = v10;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Prompting to switch to focus profile %{public}@ on window %{public}@", buf, 0x16u);

    }
    if (v6)
      v11 = v6;
    else
      v11 = &__block_literal_global_224;
    v12 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    _WBSLocalizedString();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0D8AD00], "alertControllerWithTitle:message:preferredStyle:", v15);
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRole:", 1);
    v18 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_2;
    v41[3] = &unk_1E9CF8360;
    v21 = v11;
    v42 = v21;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v20;
    v38[1] = 3221225472;
    v38[2] = __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_3;
    v38[3] = &unk_1E9CF8420;
    v38[4] = a1;
    v39 = v16;
    v6 = v21;
    v40 = v6;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 0, v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addAction:", v22);
    objc_msgSend(v17, "addAction:", v25);
    objc_msgSend(v17, "setPreferredAction:", v25);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = v20;
    aBlock[1] = 3221225472;
    aBlock[2] = __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_4;
    aBlock[3] = &unk_1E9CF1830;
    v28 = v27;
    v36 = v28;
    v29 = v17;
    v37 = v29;
    v30 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v28, "presentedViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v21) = objc_opt_isKindOfClass();

    if ((v21 & 1) != 0)
      objc_msgSend(v28, "dismissViewControllerAnimated:completion:", 1, v30);
    else
      v30[2](v30);

  }
}

- (void)openFocusedTabGroupWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TabController focusedTabGroup](self, "focusedTabGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[TabController isTabGroupActive:](self, "isTabGroupActive:", v4))
    -[TabController _presentOpenAlertForFocusedTabGroup:completionHandler:]((uint64_t)self, v4, v5);

}

- (void)_presentOpenAlertForFocusedTabGroup:(void *)a3 completionHandler:
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  id v28;
  id v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v34 = v5;
  if (a1)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 280), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v9;
      v45 = 2114;
      v46 = v10;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Prompting to open FTG %{public}@ on window %{public}@", buf, 0x16u);

    }
    if (v6)
      v11 = v6;
    else
      v11 = &__block_literal_global_231;
    v12 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    _WBSLocalizedString();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0D8AD00], "alertControllerWithTitle:message:preferredStyle:", v15);
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRole:", 1);
    v18 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_2;
    v41[3] = &unk_1E9CF8360;
    v21 = v11;
    v42 = v21;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v20;
    v38[1] = 3221225472;
    v38[2] = __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_3;
    v38[3] = &unk_1E9CF8420;
    v38[4] = a1;
    v39 = v16;
    v6 = v21;
    v40 = v6;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 0, v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addAction:", v22);
    objc_msgSend(v17, "addAction:", v25);
    objc_msgSend(v17, "setPreferredAction:", v25);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = v20;
    aBlock[1] = 3221225472;
    aBlock[2] = __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_4;
    aBlock[3] = &unk_1E9CF1830;
    v28 = v27;
    v36 = v28;
    v29 = v17;
    v37 = v29;
    v30 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v28, "presentedViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v21) = objc_opt_isKindOfClass();

    if ((v21 & 1) != 0)
      objc_msgSend(v28, "dismissViewControllerAnimated:completion:", 1, v30);
    else
      v30[2](v30);

  }
}

- (id)_tabGroupAlertControllerWithTitle:(uint64_t)a3 message:(void *)a4 okActionTitle:(uint64_t)a5 role:(char)a6 showingSuggestionsIfPossible:(void *)a7 actionHandler:(void *)a8 completionHandler:
{
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  char v38;

  v15 = a7;
  v16 = a8;
  if (a1)
  {
    v17 = (void *)MEMORY[0x1E0D8AD00];
    v18 = a4;
    objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", a2, a3, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRole:", a5);
    objc_msgSend(v19, "setDelegate:", a1);
    v20 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke;
    v37[3] = &unk_1E9CF8338;
    v37[4] = a1;
    v38 = a6;
    objc_msgSend(v19, "addTextFieldWithConfigurationHandler:", v37);
    v21 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v20;
    v35[1] = 3221225472;
    v35[2] = __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke_2;
    v35[3] = &unk_1E9CF8360;
    v23 = v16;
    v36 = v23;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addAction:", v24);
    v25 = (void *)MEMORY[0x1E0DC3448];
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke_3;
    v31[3] = &unk_1E9CF8388;
    v26 = v19;
    v32 = v26;
    v33 = v15;
    v34 = v23;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v18, 0, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "addAction:", v27);
    objc_msgSend(v26, "setPreferredAction:", v27);
    objc_msgSend(v26, "textFields");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDelegate:", a1);

    a1 = v26;
  }

  return a1;
}

void __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "setAutocorrectionType:", 2);
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerValue") <= 2 && objc_msgSend(v3, "integerValue") < 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "integerValue") > 2)
  {
    v4 = 3;
  }
  else
  {
    v4 = objc_msgSend(v3, "integerValue");
  }
  objc_msgSend(v10, "setAutocapitalizationType:", v4);
  objc_msgSend(v10, "setClearButtonMode:", 1);
  if (*(_BYTE *)(a1 + 40))
  {
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "areTabGroupSuggestionsEnabled");
    v8 = *(_QWORD *)(a1 + 32);
    v7 = a1 + 32;
    *(_BYTE *)(v8 + 232) = v6;

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v7 = a1 + 32;
    *(_BYTE *)(v9 + 232) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)v7 + 232))
    objc_msgSend(v10, "setAutocorrectionType:", 1);

}

uint64_t __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v10, "length");
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "textFields");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

    }
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, v4 != 0);

}

- (void)presentAlertToCreateTabGroupFromTabs:(id)a3 withTitle:(id)a4 message:(id)a5 suggestedName:(id)a6 okActionTitle:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id WeakRetained;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;

  v14 = a3;
  v34 = a4;
  v15 = a5;
  v33 = a7;
  v16 = a8;
  v17 = v15;
  v18 = a6;
  +[Application sharedApplication](Application, "sharedApplication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isCloudHistoryEnabled");

  v21 = v17;
  if (v20)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v23, v17, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v25 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __118__TabController_presentAlertToCreateTabGroupFromTabs_withTitle_message_suggestedName_okActionTitle_completionHandler___block_invoke;
  v37[3] = &unk_1E9CF83B0;
  v37[4] = self;
  v38 = v14;
  v39 = v16;
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __118__TabController_presentAlertToCreateTabGroupFromTabs_withTitle_message_suggestedName_okActionTitle_completionHandler___block_invoke_2;
  v35[3] = &unk_1E9CF83D8;
  v35[4] = self;
  v36 = v39;
  v32 = v39;
  v26 = v14;
  -[TabController _tabGroupAlertControllerWithTitle:message:okActionTitle:role:showingSuggestionsIfPossible:actionHandler:completionHandler:](self, (uint64_t)v34, (uint64_t)v21, v33, 2, 1, v37, v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "textFields");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v18);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "presentViewController:animated:completion:", v27, 1, 0);

}

void __118__TabController_presentAlertToCreateTabGroupFromTabs_withTitle_message_suggestedName_okActionTitle_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "addNewTabGroupWithTitle:fromTabs:", a2, *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "scrollSidebarToTopAnimated:", 1);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

uint64_t __118__TabController_presentAlertToCreateTabGroupFromTabs_withTitle_message_suggestedName_okActionTitle_completionHandler___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2;
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(result + 32) + 8));
    objc_msgSend(WeakRetained, "closePreviewDocument");

    result = *(_QWORD *)(v2 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (id)addNewTabGroupWithTitle:(id)a3 fromExistingTabs:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[TabController unnamedTabGroup](self, "unnamedTabGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[TabController addNewTabGroupWithTitle:fromTabs:](self, "addNewTabGroupWithTitle:fromTabs:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_addTabGroup:(void *)a3 fromTabs:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    *(_BYTE *)(a1 + 184) = 1;
    objc_msgSend(*(id *)(a1 + 48), "insertTabGroup:afterTabGroup:", a2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(a1 + 184) = 0;
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v24 = v6;
      v25 = v5;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      obj = v5;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v28 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v12, "tabGroupUUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "uuid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 280), "activeTabUUIDForTabGroupWithUUID:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v16)
            {
              objc_msgSend(*(id *)(a1 + 280), "removeActiveTabUUIDForTabGroupWithUUID:", v13);
              objc_msgSend(*(id *)(a1 + 280), "activeTabUUIDForTabGroupWithUUID:", v7);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
                v18 = *(void **)(a1 + 280);
                objc_msgSend(v12, "uuid");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setActiveTabUUID:forTabGroupWithUUID:", v19, v7);

              }
            }

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v9);
      }

      v6 = v24;
      objc_msgSend(*(id *)(a1 + 48), "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", obj, v24, 0, 0);
      v5 = v25;
    }
    objc_msgSend((id)a1, "setActiveTabGroupUUID:", v7);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);

    objc_msgSend(*(id *)(a1 + 72), "tabSwitcherViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeedsScrollToTabGroup:", v6);

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didCreateNewTabGroup");

    objc_msgSend(*(id *)(a1 + 48), "tabGroupWithUUID:", v7);
    a1 = objc_claimAutoreleasedReturnValue();

  }
  return (id)a1;
}

- (id)addNewTabGroupWithTitle:(id)a3 fromTabs:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = objc_alloc(MEMORY[0x1E0DCCB38]);
    -[TabController deviceIdentifier](self, "deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTitle:deviceIdentifier:", v6, v9);

    -[TabController activeProfileIdentifier](self, "activeProfileIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProfileIdentifier:", v11);

    -[TabController _addTabGroup:fromTabs:]((uint64_t)self, (uint64_t)v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dismissOpenTabGroupAlertIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  WBWindowState *windowState;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "role") == 1)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      windowState = self->_windowState;
      v8 = v6;
      -[WBWindowState uuid](windowState, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Dismissing open FTG alert on window %{public}@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

uint64_t __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setActiveProfileIdentifier:", v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setActiveTabGroupUUID:", v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_presentRenameAlertForTabGroup:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id *v18;
  id v19;

  v3 = a2;
  if (a1)
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __48__TabController__presentRenameAlertForTabGroup___block_invoke;
    v17 = &unk_1E9CF8468;
    v18 = a1;
    v7 = v3;
    v19 = v7;
    -[TabController _tabGroupAlertControllerWithTitle:message:okActionTitle:role:showingSuggestionsIfPossible:actionHandler:completionHandler:](a1, (uint64_t)v4, (uint64_t)v5, v6, 3, 0, &v14, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayTitle", v14, v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v9);

    WeakRetained = objc_loadWeakRetained(a1 + 1);
    objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

void __48__TabController__presentRenameAlertForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__TabController__presentRenameAlertForTabGroup___block_invoke_2;
  v8[3] = &unk_1E9CF78F8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "updateTabGroupWithUUID:persist:usingBlock:", v6, 1, v8);

}

uint64_t __48__TabController__presentRenameAlertForTabGroup___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", *(_QWORD *)(a1 + 32));
}

- (void)_updateContextKitSuggestionsForTabGroupWithCompletionHandler:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  _QWORD *v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)a1[28];
    a1[28] = 0;

    objc_msgSend(a1, "currentTabDocuments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v19 = a1;
      v20 = v3;
      v6 = dispatch_group_create();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v13, "contextController", v19);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "URL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              v16 = v14 == 0;
            else
              v16 = 1;
            if (!v16)
            {
              dispatch_group_enter(v6);
              v25[0] = MEMORY[0x1E0C809B0];
              v25[1] = 3221225472;
              v25[2] = __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke;
              v25[3] = &unk_1E9CF8490;
              v26 = v6;
              v27 = v7;
              objc_msgSend(v14, "cachedResponseForURL:completionHandler:", v15, v25);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v10);
      }

      dispatch_get_global_queue(9, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke_2;
      block[3] = &unk_1E9CF4FA0;
      v22 = v7;
      v3 = v20;
      v23 = v19;
      v24 = v20;
      v18 = v7;
      dispatch_group_notify(v6, v17, block);

    }
    else
    {
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    }

  }
}

void __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = *(id *)(a1 + 40);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v2 = (void *)getCKContextClientClass_softClass_0;
    v14 = getCKContextClientClass_softClass_0;
    v3 = MEMORY[0x1E0C809B0];
    if (!getCKContextClientClass_softClass_0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getCKContextClientClass_block_invoke_0;
      v10[3] = &unk_1E9CF1780;
      v10[4] = &v11;
      __getCKContextClientClass_block_invoke_0((uint64_t)v10);
      v2 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v2);
    _Block_object_dispose(&v11, 8);
    objc_msgSend(v4, "clientWithDefaultRequestType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E9CF84B8;
    v7 = *(id *)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 40);
    v9 = v7;
    objc_msgSend(v5, "groupResponses:withReply:", v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (v5
    || (objc_msgSend(v12, "results"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v12, "completer");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 224);
    *(_QWORD *)(v10 + 224) = v9;

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

- (void)tabGroupNamingTextDidChange:(id)a3
{
  id v4;
  id v5;

  if (self->_showsTabGroupNameSuggestions)
  {
    v4 = a3;
    objc_msgSend(v4, "text");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[TabController _updateTabGroupSuggestions:matchingText:]((uint64_t)self, v4, v5);

  }
}

- (void)_updateTabGroupSuggestions:(void *)a3 matchingText:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    if ((unint64_t)objc_msgSend(v5, "length") > 3
      || UIKeyboardAlwaysShowCandidateBarForCurrentInputMode()
      || (objc_msgSend(*(id *)(a1 + 224), "resultsMatching:", v6),
          v7 = objc_claimAutoreleasedReturnValue(),
          v8 = *(void **)(a1 + 216),
          *(_QWORD *)(a1 + 216) = v7,
          v8,
          !objc_msgSend(*(id *)(a1 + 216), "count")))
    {
      objc_msgSend(v13, "setAutocorrectionType:", 2);
      objc_msgSend(v13, "textInputSuggestionDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSuggestions:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 216), "safari_prefixWithMaxLength:", 3);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 216);
      *(_QWORD *)(a1 + 216) = v9;

      objc_msgSend(*(id *)(a1 + 216), "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_243);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAutocorrectionType:", 1);
      objc_msgSend(v13, "textInputSuggestionDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSuggestions:", v11);

      objc_msgSend(*(id *)(a1 + 224), "logResultsShown:serverOverride:forInput:", objc_msgSend(v11, "count"), 0, v6);
    }

  }
}

id __57__TabController__updateTabGroupSuggestions_matchingText___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3E40];
  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textSuggestionWithInputText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)isTabInActiveTabGroup:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = result;
    objc_msgSend(a2, "tabGroupUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(v2 + 56));

    return v4;
  }
  return result;
}

- (void)selectLocalTabGroup
{
  void *v3;
  id v4;

  -[TabController unnamedTabGroup](self, "unnamedTabGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController setActiveTabGroupUUID:](self, "setActiveTabGroupUUID:", v3);

}

- (void)updateBackgroundImageForProfile:(id)a3
{
  id v3;

  v3 = (id)-[WBTabGroupManager updateProfileWithIdentifier:persist:usingBlock:completionHandler:](self->_tabGroupManager, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", a3, 1, &__block_literal_global_246_0, 0);
}

uint64_t __49__TabController_updateBackgroundImageForProfile___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markBackgroundImageAsModified");
}

- (void)selectPrivateTabGroup
{
  void *v3;
  id v4;

  -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController setActiveTabGroupUUID:](self, "setActiveTabGroupUUID:", v3);

}

- (void)didFocusTabGroup:(id)a3
{
  BrowserController **p_browserController;
  id v4;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "didFocusTabGroup:", v4);

}

- (NSArray)profiles
{
  return (NSArray *)-[WBTabGroupManager profiles](self->_tabGroupManager, "profiles");
}

- (void)setActiveProfileIdentifier:(id)a3
{
  BrowserController **p_browserController;
  id v4;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "setActiveProfileIdentifier:", v4);

}

- (id)tabGroupsForProfileWithIdentifier:(id)a3
{
  return (id)-[WBTabGroupManager namedTabGroupsForProfileWithIdentifier:](self->_tabGroupManager, "namedTabGroupsForProfileWithIdentifier:", a3);
}

- (void)_closeLibraryIfNeeded
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;

  if (a1 && a1[24])
  {
    objc_msgSend(a1, "activeTabGroup");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isPrivateBrowsing");
    v4 = 38;
    if (v3)
      v4 = 37;
    v5 = (id)a1[v4];

    objc_msgSend(a1, "setActiveTabDocument:", v5);
  }
}

- (void)setActiveTabGroupUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  NSString *v11;
  NSString *activeTabGroupUUID;
  void *v13;
  void *v14;
  int v15;
  id WeakRetained;
  _SWCollaborationButtonView *tabOverviewCollaborationButton;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSHashTable *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TabController activeTabGroup](self, "activeTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabCollectionViewManager tabSwitcherViewController](self->_tabCollectionViewManager, "tabSwitcherViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsScrollToTabGroup:", v6);

  if (objc_msgSend(v5, "isIdentical:", v6))
  {
    -[TabController _closeLibraryIfNeeded](self);
  }
  else
  {
    if (self->_activeTabGroupUUID)
    {
      -[TabController tabGroupManager](self, "tabGroupManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endParticipantPresenceReportingForTabGroupWithUUID:", self->_activeTabGroupUUID);

    }
    v9 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __39__TabController_setActiveTabGroupUUID___block_invoke;
    v43[3] = &unk_1E9CF1900;
    v43[4] = self;
    objc_msgSend(v9, "setHandler:", v43);
    v10 = objc_msgSend(v4, "isEqualToString:", self->_activeTabGroupUUID);
    if ((v10 & 1) == 0)
      -[TabController persistAllCurrentTabsInBackground:](self, "persistAllCurrentTabsInBackground:", 0);
    v11 = (NSString *)objc_msgSend(v4, "copy");
    activeTabGroupUUID = self->_activeTabGroupUUID;
    self->_activeTabGroupUUID = v11;

    -[TabController _application](self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "focusedTabGroupUUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v4);

    if (v15)
      objc_msgSend(v13, "setNeedsFocusedTabGroupUpdate:", 0);
    if (v4)
    {
      -[WBWindowState setActiveTabGroupUUID:](self->_windowState, "setActiveTabGroupUUID:", v4);
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "willSelectTabGroupWithUUID:", v4);

      -[PinnedTabsManager removePinnedTabsObserver:](self->_pinnedTabsManager, "removePinnedTabsObserver:", self);
      if ((v10 & 1) == 0)
      {
        -[TabController _sendWillBeginDocumentUpdates]((uint64_t)self);
        -[TabCollectionViewManager beginFixingTabBarItems](self->_tabCollectionViewManager, "beginFixingTabBarItems");
        -[TabCollectionViewManager beginFixingTabOverviewItems](self->_tabCollectionViewManager, "beginFixingTabOverviewItems");
        ++self->_updateTabsSuppressionCount;
        -[TabController _updateTabsForTabGroup:]((uint64_t)self, v6);
        --self->_updateTabsSuppressionCount;
      }
      tabOverviewCollaborationButton = self->_tabOverviewCollaborationButton;
      self->_tabOverviewCollaborationButton = 0;

      -[TabController updateSelectedTabGroupName](self, "updateSelectedTabGroupName");
      if (objc_msgSend(v6, "usesGlobalPinnedTabs"))
      {
        -[PinnedTabsManager addPinnedTabsObserver:](self->_pinnedTabsManager, "addPinnedTabsObserver:", self);
        -[TabController _updateActiveTabForTabGroup:](self, v6);
      }
      objc_msgSend(v6, "tabs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (!v19)
        -[TabController didUpdateTabDocuments](self, "didUpdateTabDocuments");
      -[TabController didFocusTabGroup:](self, "didFocusTabGroup:", v6);
      if ((v10 & 1) == 0)
      {
        -[TabCollectionViewManager endFixingTabBarItems](self->_tabCollectionViewManager, "endFixingTabBarItems");
        -[TabCollectionViewManager endFixingTabOverviewItems](self->_tabCollectionViewManager, "endFixingTabOverviewItems");
        -[TabCollectionViewManager updateTabOverviewItems](self->_tabCollectionViewManager, "updateTabOverviewItems");
        -[TabCollectionViewManager updateExplanationViewVisibilityAnimated:](self->_tabCollectionViewManager, "updateExplanationViewVisibilityAnimated:", 1);
      }
      -[TabController activeTabDocument](self, "activeTabDocument");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self->_tabCollectionViewManager, "updateTabBarAnimated:keepingTabVisible:", 0);
      -[TabCollectionViewManager tabOverview](self->_tabCollectionViewManager, "tabOverview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "presentationState") == 2)
        objc_msgSend(v20, "resetPresentationScrollPosition");
      v37 = v20;
      v21 = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(v21, "updateFavoritesForNewDocument");
      objc_msgSend(v21, "reloadSidebarAnimated:", 0);
      -[TabController startPageBackgroundImageIdentifier](self, "startPageBackgroundImageIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "loadBackgroundImageIfNeededForIdentifier:", v22);

      if ((v10 & 1) == 0)
      {
        v35 = v9;
        v36 = v4;
        -[NSUndoManager removeAllActions](self->_undoManager, "removeAllActions");
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v23 = self->_documentObservers;
        v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v40 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v28, "tabController:didSwitchFromTabGroup:", self, v5);
            }
            v25 = -[NSHashTable countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          }
          while (v25);
        }

        -[TabController _sendDidEndDocumentUpdates]((uint64_t)self);
        v9 = v35;
        v4 = v36;
      }
      if (objc_msgSend(v6, "isShared"))
        -[TabController _requestContactsAccessIfNeeded]((uint64_t)self);
      if (objc_msgSend(v6, "isSyncable"))
      {
        objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_alloc(MEMORY[0x1E0D8AD08]);
        -[TabController tabGroupManager](self, "tabGroupManager");
        v31 = v13;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v30, "initWithTabGroup:tabProvider:", v6, v32);
        objc_msgSend(v29, "preloadRequest:withPriority:responseHandler:", v33, 0, 0);

        v13 = v31;
      }
      -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activeTabGroupDidChange");

    }
  }

}

void __39__TabController_setActiveTabGroupUUID___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[7])
  {
    objc_msgSend(v2, "tabGroupManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginParticipantPresenceReportingForTabGroupWithUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

  }
}

- (void)_updateTabsForTabGroup:(uint64_t)a1
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  TabDocument *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void (**v36)(_QWORD);
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD aBlock[5];
  id v43;
  _QWORD v44[6];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  _QWORD v52[5];
  uint8_t v53[4];
  uint64_t v54;
  TabDocument *v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[TabController _sendWillBeginDocumentUpdates](a1);
    v4 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __40__TabController__updateTabsForTabGroup___block_invoke;
    v52[3] = &unk_1E9CF1900;
    v52[4] = a1;
    v41 = v4;
    objc_msgSend(v4, "setHandler:", v52);
    v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      objc_msgSend(v3, "privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Updating tab documents for %{public}@", (uint8_t *)&buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v3, "tabsUUIDSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isPrivateBrowsing");
    v11 = 16;
    if (v10)
      v11 = 24;
    v12 = (void *)objc_msgSend(*(id *)(a1 + v11), "copy");
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __40__TabController__updateTabsForTabGroup___block_invoke_328;
    v49[3] = &unk_1E9CF1F70;
    v40 = v9;
    v50 = v40;
    v51 = a1;
    objc_msgSend(v12, "safari_filterObjectsUsingBlock:", v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "activeWebExtensionWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "idForWebExtensions");
    v16 = v15;
    v17 = (void *)MEMORY[0x1E0D8ADC8];
    objc_msgSend(v14, "webExtensionTabs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tabIDToTabPositionDictionaryForTabs:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v20 = v13;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend((id)a1, "willLoseOwnershipOfTab:", v24);
          -[TabController _reuseTabIfNecessary:](a1, v24);
          -[TabController _tabWasAddedToReusableTabs:fromWindowWithID:previousTabPositions:](a1, v24, v19, v16);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
      }
      while (v21);
    }

    v25 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      v27 = objc_msgSend(v20, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_1D7CA3000, v26, OS_LOG_TYPE_INFO, "Closing %zu tabs", (uint8_t *)&buf, 0xCu);

    }
    -[TabController _detachTabs:]((id *)a1, v20);
    objc_msgSend(v3, "tabs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__10;
    v59 = __Block_byref_object_dispose__10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __40__TabController__updateTabsForTabGroup___block_invoke_329;
    v44[3] = &unk_1E9CF86E8;
    v44[4] = a1;
    v44[5] = &buf;
    objc_msgSend(v28, "safari_mapAndFilterObjectsUsingBlock:", v44);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v28, "count") && (objc_msgSend(v3, "isPrivateBrowsing") & 1) == 0)
    {
      v30 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:]([TabDocument alloc], "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, 0, -[TabController _controlledByAutomation](a1), 0, 0, WeakRetained, 0);
      -[TabDocument setIsBlank:](v30, "setIsBlank:", 1);
      v55 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v31 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v31;
    }
    if (objc_msgSend(v29, "count"))
    {
      v32 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = objc_msgSend(v29, "count");
        *(_DWORD *)v53 = 134217984;
        v54 = v33;
        _os_log_impl(&dword_1D7CA3000, v32, OS_LOG_TYPE_INFO, "Inserting %zu tabs", v53, 0xCu);
      }

      v34 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "copy");
      v35 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v34;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__TabController__updateTabsForTabGroup___block_invoke_331;
      aBlock[3] = &unk_1E9CF1830;
      aBlock[4] = a1;
      v43 = v29;
      v36 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(*(id *)(a1 + 72), "tabOverview");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
        objc_msgSend(v37, "performUpdatesWithoutTabCloseAnimation:", v36);
      else
        v36[2](v36);
      v39 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = 0;

      -[TabController _tabDocumentsWereReusedWhenActiveTabGroupChanged:](a1, *(void **)(*((_QWORD *)&buf + 1) + 40));
    }
    -[TabController _updateActiveTabForTabGroup:]((_QWORD *)a1, v3);
    objc_msgSend(WeakRetained, "setPrivateBrowsingEnabled:", objc_msgSend(v3, "isPrivateBrowsing"));

    _Block_object_dispose(&buf, 8);
  }

}

- (void)_updateActiveTabForTabGroup:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)a1[35];
    v15 = v3;
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeTabUUIDForTabGroupWithUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isSyncable"))
    {
      objc_msgSend(v15, "lastSelectedTabUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v15, "lastSelectedTabUUID");
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v8;
      }
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
    objc_msgSend(a1, "tabWithUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isPrivateBrowsing");
    v12 = 2;
    if (v11)
      v12 = 3;
    v13 = (void *)objc_msgSend((id)a1[v12], "copy");
    if ((objc_msgSend(v13, "containsObject:", v10) & 1) == 0)
    {
      objc_msgSend(v13, "lastObject");
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
    objc_msgSend(a1, "setActiveTab:", v10);

    v3 = v15;
  }

}

- (BOOL)createTabGroupAlertIsPresented
{
  id WeakRetained;
  void *v3;
  void *v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "role") == 2;

  return v5;
}

- (NSString)moveLocalTabsToNewGroupTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[TabController activeTabGroupOrTabGroupVisibleInSwitcher](self, "activeTabGroupOrTabGroupVisibleInSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isNamed") & 1) != 0
    || (objc_msgSend(v3, "isPrivateBrowsing") & 1) != 0
    || (-[TabController activeTabDocument](self, "activeTabDocument"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "libraryType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5)
    || (objc_msgSend(v3, "isEmpty") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "unnamedTabGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tabs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    v12 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v13, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)activeLibraryType
{
  void *v2;
  void *v3;

  -[TabController activeTabDocument](self, "activeTabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)tabGroups
{
  void *v3;
  void *v4;
  void *v5;

  -[TabController unnamedTabGroups](self, "unnamedTabGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController namedTabGroups](self, "namedTabGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)unnamedTabGroups
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;

  if (self->_windowState)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(WeakRetained, "unnamedTabGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_addObjectUnlessNil:", v5);

    if (objc_msgSend(WeakRetained, "isPrivateBrowsingAvailable"))
    {
      -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (NSSet)nonActiveTabGroupsInCurrentBrowsingMode
{
  id WeakRetained;
  char v4;
  void *v5;
  void *v6;
  WBTabGroupManager *tabGroupManager;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E20];
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    tabGroupManager = self->_tabGroupManager;
    -[TabController activeProfileIdentifier](self, "activeProfileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager namedTabGroupsForProfileWithIdentifier:](tabGroupManager, "namedTabGroupsForProfileWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(WeakRetained, "browserWindowController", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "browserControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "tabController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "windowState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "activeTabGroup");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v22, "addObject:", v18);
        if ((v4 & 1) != 0)
          objc_msgSend(v17, "privateTabGroup");
        else
          objc_msgSend(v16, "unnamedTabGroup");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v6, "addObject:", v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  objc_msgSend(v6, "minusSet:", v22);
  return (NSSet *)v6;
}

- (id)existingPersistedTitleForTabDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TabController activeTabGroup](self, "activeTabGroup", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          objc_msgSend(v10, "title");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)imageForTabGroup:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  v4 = a3;
  if (-[TabController hasMultipleProfiles](self, "hasMultipleProfiles")
    && (objc_msgSend(v4, "isNamed") & 1) == 0
    && (objc_msgSend(v4, "isPrivateBrowsing") & 1) == 0)
  {
    -[TabController activeProfile](self, "activeProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolImage");
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v14 = v9;

    goto LABEL_18;
  }
  if (objc_msgSend(v4, "isSyncable"))
  {
    v5 = objc_msgSend(v4, "isShared");
    v6 = (void *)MEMORY[0x1E0DC3870];
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.on.square.badge.person.crop"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.on.square"));
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_17;
    }
    v15 = CFSTR("square.on.square");
LABEL_13:
    objc_msgSend(v6, "systemImageNamed:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!objc_msgSend(v4, "isLocal"))
  {
    if (!objc_msgSend(v4, "isPrivateBrowsing"))
    {
      v14 = 0;
      goto LABEL_18;
    }
    v6 = (void *)MEMORY[0x1E0DC3870];
    v15 = CFSTR("hand.raised");
    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x1E0DC3870];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "scene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_currentDeviceImageNameForOrientation:", objc_msgSend(v12, "interfaceOrientation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_systemImageNamed:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v14;
}

- (id)swipeActionsConfigurationForTabGroup:(id)a3 forPickerSheet:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;
  id location;

  v6 = a3;
  if (objc_msgSend(v6, "isNamed"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0DC36C8];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke;
    v23[3] = &unk_1E9CF8560;
    objc_copyWeak(&v25, &location);
    v10 = v6;
    v24 = v10;
    v26 = a4;
    objc_msgSend(v8, "contextualActionWithStyle:title:handler:", 1, v9, v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v12);

    objc_msgSend(v7, "addObject:", v11);
    if (objc_msgSend(v10, "isNamed"))
    {
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0DC36C8];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke_3;
      v19[3] = &unk_1E9CF8560;
      objc_copyWeak(&v21, &location);
      v20 = v10;
      v22 = a4;
      objc_msgSend(v14, "contextualActionWithStyle:title:handler:", 0, v13, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pencil"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImage:", v16);

      objc_msgSend(v7, "addObject:", v15);
      objc_destroyWeak(&v21);

    }
    objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPerformsFirstActionWithFullSwipe:", 1);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  char v11;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke_2;
    v9[3] = &unk_1E9CF4B80;
    v9[4] = WeakRetained;
    v10 = v5;
    v11 = *(_BYTE *)(a1 + 48);
    -[TabController _presentCloseAlertForTabGroup:completionHandler:]((uint64_t)v7, v8, v9);

  }
}

void __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "libraryController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sidebarViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadSectionControllersIfNeeded");

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "tabSwitcherViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsApplyContentAnimated:", 1);
    objc_msgSend(v7, "applyContentIfNeeded");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!*(_BYTE *)(a1 + 48))
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didUseSidebarAction:", 4);

    }
  }
}

- (void)_presentCloseAlertForTabGroup:(void *)a3 completionHandler:
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D8AD00], "deleteConfirmationAlertWithTabGroup:manager:delegate:", v5, *(_QWORD *)(a1 + 48), a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__TabController__presentCloseAlertForTabGroup_completionHandler___block_invoke;
    v10[3] = &unk_1E9CF4C28;
    v10[4] = a1;
    v11 = v5;
    v12 = v6;
    objc_msgSend(v7, "presentFromViewController:withResultHandler:", v9, v10);

  }
}

void __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    -[TabController _presentRenameAlertForTabGroup:](WeakRetained, *(void **)(a1 + 32));
    v8[2](v8, 1);
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didUseSidebarAction:", 3);

    }
  }

}

- (id)swipeActionsConfigurationForTab:(id)a3 inTabGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(void **, uint64_t, uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id location;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_5:
    v12 = (void *)MEMORY[0x1E0DC36C8];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __60__TabController_swipeActionsConfigurationForTab_inTabGroup___block_invoke;
    v22 = &unk_1E9CF8588;
    objc_copyWeak(&v25, &location);
    v23 = v7;
    v24 = v6;
    objc_msgSend(v12, "contextualActionWithStyle:title:handler:", 1, v13, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"), v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v15);

    v16 = (void *)MEMORY[0x1E0DC3D08];
    v27[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithActions:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setPerformsFirstActionWithFullSwipe:", 1);
    objc_destroyWeak(&v25);
    goto LABEL_6;
  }
  objc_msgSend(v7, "tabs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (unint64_t)objc_msgSend(v9, "count") < 2;

  if (!v10)
    goto LABEL_5;
  v11 = 0;
LABEL_6:
  objc_destroyWeak(&location);

  return v11;
}

void __60__TabController_swipeActionsConfigurationForTab_inTabGroup___block_invoke(void **a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v5)(id, uint64_t);
  id *WeakRetained;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isTabGroupActive:", a1[4]))
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(a1[5], "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);
      objc_msgSend(v7, "tabWithUUID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "closeTab:animated:", v11, 0);

    }
    else if (objc_msgSend(a1[5], "isPinned"))
    {
      v16[0] = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "closeTabs:inInactiveTabGroup:", v12, a1[4]);

    }
    else
    {
      -[TabController _removeTab:fromTabGroup:]((uint64_t)v7, a1[5], a1[4]);
    }
    v13 = objc_loadWeakRetained(v7 + 1);
    objc_msgSend(v13, "reloadSidebarAnimated:", 1);
    objc_msgSend(v13, "libraryController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sidebarViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadSectionControllersIfNeeded");

    v5[2](v5, 1);
  }

}

- (id)menuForTabGroup:(id)a3 variant:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC39D0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__TabController_menuForTabGroup_variant___block_invoke;
  v11[3] = &unk_1E9CF85B0;
  objc_copyWeak(v13, &location);
  v8 = v6;
  v12 = v8;
  v13[1] = (id)a4;
  objc_msgSend(v7, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", &stru_1E9CFDBB0, 0, 0, 1, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v9;
}

id __41__TabController_menuForTabGroup_variant___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[TabController _subMenusForTabGroup:variant:](WeakRetained, *(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subMenusForTabGroup:(uint64_t)a3 variant:
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  void *v47;
  BOOL v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  void *v59;
  id v60;
  BOOL v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id location;
  _BYTE v67[128];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v50 = a2;
  if (!a1)
  {
    v46 = 0;
    goto LABEL_28;
  }
  v49 = a1;
  objc_initWeak(&location, a1);
  if (!objc_msgSend(v50, "isPrivateBrowsing")
    || (+[Application sharedApplication](Application, "sharedApplication"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isPrivateBrowsingLocked"),
        v5,
        (v6 & 1) == 0))
  {
    v48 = a3 != 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController _shareActionForTabGroup:](a1, v50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "safari_addObjectUnlessNil:", v7);

    v8 = (void *)-[TabController _copyLinksActionForTabGroup:forPickerSheet:]((uint64_t)a1, v50, a3 != 0);
    objc_msgSend(v47, "safari_addObjectUnlessNil:", v8);

    if (objc_msgSend(v47, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v47);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v9);

    }
    if (objc_msgSend(v50, "isNamed"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController _renameActionForTabGroup:forPickerSheet:](a1, v50, a3 != 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v11);

      -[TabController _deleteActionForTabGroup:forPickerSheet:]((id *)a1, v50, a3 != 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v13);

    }
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSafariProfilesEnabled"))
    {
      +[TabMenuProvider moveMenuForTabGroup:dataSource:](TabMenuProvider, "moveMenuForTabGroup:dataSource:", v50, a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "safari_addObjectUnlessNil:", v14);

    }
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      objc_msgSend(v50, "tabs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v63 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            v25 = objc_alloc(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v24, "uuid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v25, "initWithUUIDString:", v26);
            objc_msgSend(v49, "iconForTabUUID:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = (void *)MEMORY[0x1E0DC3428];
            -[WBTab displayTitle](v24);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __46__TabController__subMenusForTabGroup_variant___block_invoke;
            v57[3] = &unk_1E9CF85D8;
            objc_copyWeak(&v60, &location);
            v31 = v50;
            v61 = v48;
            v58 = v31;
            v59 = v24;
            objc_msgSend(v29, "actionWithTitle:image:identifier:handler:", v30, v28, 0, v57);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "addObject:", v32);
            objc_destroyWeak(&v60);

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        }
        while (v21);
      }

      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v17);
    }
    else
    {
      if (a3)
        goto LABEL_23;
      v15 = (void *)MEMORY[0x1E0DC39D0];
      -[TabController _toggleTabViewActionForTabGroup:]((id *)a1, v50);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v16;
      -[TabController _toggleSidebarSectionIsExpandedActionForTabGroup:](a1, v50);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v19);

    }
LABEL_23:
    if (SFDebugMenuEnabled() && objc_msgSend(v50, "isSyncable"))
    {
      objc_msgSend(v50, "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0DC3428];
      v36 = MEMORY[0x1E0C809B0];
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __46__TabController__subMenusForTabGroup_variant___block_invoke_2;
      v54[3] = &unk_1E9CF8600;
      objc_copyWeak(&v56, &location);
      v37 = v33;
      v55 = v37;
      objc_msgSend(v35, "actionWithTitle:image:identifier:handler:", CFSTR("Copy Tab Group Sync Data"), 0, 0, v54);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v38);

      v39 = (void *)MEMORY[0x1E0DC3428];
      v51[0] = v36;
      v51[1] = 3221225472;
      v51[2] = __46__TabController__subMenusForTabGroup_variant___block_invoke_3;
      v51[3] = &unk_1E9CF8600;
      objc_copyWeak(&v53, &location);
      v40 = v37;
      v52 = v40;
      objc_msgSend(v39, "actionWithTitle:image:identifier:handler:", CFSTR("Copy Tab Group and Tabs Sync Data"), 0, 0, v51);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v41);

      v42 = (void *)MEMORY[0x1E0DC39D0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Debug UUID %@ (Internal Only)"), v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "menuWithTitle:image:identifier:options:children:", v43, 0, 0, 1, v34);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v44);

      objc_destroyWeak(&v53);
      objc_destroyWeak(&v56);

    }
    goto LABEL_27;
  }
  v46 = (id)MEMORY[0x1E0C9AA60];
LABEL_27:
  objc_destroyWeak(&location);
LABEL_28:

  return v46;
}

- (id)_shareActionForTabGroup:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v3 = a2;
  v4 = v3;
  if (a1
    && objc_msgSend(v3, "isNamed")
    && (+[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "areSharedTabGroupsEnabled"),
        v5,
        v6))
  {
    objc_initWeak(&location, a1);
    v7 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__TabController__shareActionForTabGroup___block_invoke;
    v12[3] = &unk_1E9CF8600;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("ShareTabGroupButton"));
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)_copyLinksActionForTabGroup:(char)a3 forPickerSheet:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  char v14;

  v5 = a2;
  v6 = v5;
  if (a1 && objc_msgSend(v5, "hasTextForPasteboard"))
  {
    objc_msgSend(v6, "tabCountForPasteboard");
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__TabController__copyLinksActionForTabGroup_forPickerSheet___block_invoke;
    v12[3] = &unk_1E9CF7F58;
    v13 = v6;
    v14 = a3;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v7, v9, 0, v12);
    v10 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_renameActionForTabGroup:(char)a3 forPickerSheet:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  char v18;
  id location;

  v5 = a2;
  v6 = v5;
  if (a1 && objc_msgSend(v5, "isNamed"))
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, a1);
    v8 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pencil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __57__TabController__renameActionForTabGroup_forPickerSheet___block_invoke;
    v15 = &unk_1E9CF8650;
    objc_copyWeak(&v17, &location);
    v16 = v6;
    v18 = a3;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v7, v9, 0, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("RenameTabGroupButton"), v12, v13, v14, v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_deleteActionForTabGroup:(char)a3 forPickerSheet:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  char v22;
  id location;

  v5 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "shareRecordForTabGroup:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "currentUserParticipant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "role");

      if (v10 != 1)
      {
        _WBSLocalizedString();
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }
    }
    v12 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __57__TabController__deleteActionForTabGroup_forPickerSheet___block_invoke;
    v19 = &unk_1E9CF8650;
    objc_copyWeak(&v21, &location);
    v20 = v5;
    v22 = a3;
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v6, v13, 0, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setAttributes:", 2, v16, v17, v18, v19);
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("DeleteTabGroupButton"));

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_toggleTabViewActionForTabGroup:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v4 = (void *)MEMORY[0x1E0DC3428];
    if (objc_msgSend(a1[9], "isShowingTabView")
      && objc_msgSend(a1, "isTabGroupActive:", v3))
    {
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v7 = 1;
    }
    else
    {
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v6 = 1;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.on.square"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__TabController__toggleTabViewActionForTabGroup___block_invoke;
    v11[3] = &unk_1E9CF8600;
    objc_copyWeak(&v13, &location);
    v12 = v3;
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v8, 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    if (v7)

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_toggleSidebarSectionIsExpandedActionForTabGroup:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "isTabGroupUUIDExpanded:", v5);

    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, a1);
    v7 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.grid.1x2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__TabController__toggleSidebarSectionIsExpandedActionForTabGroup___block_invoke;
    v11[3] = &unk_1E9CF8600;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v6, v8, 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __46__TabController__subMenusForTabGroup_variant___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_12;
  v11 = WeakRetained;
  if ((objc_msgSend(WeakRetained, "isTabGroupActive:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v3 = objc_loadWeakRetained(v11 + 1);
    objc_msgSend(v3, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "usingLoweredBar");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
    }
    else
    {
      v8 = *(unsigned __int8 *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v8)
      {
        v9 = 1;
        goto LABEL_8;
      }
    }
    v9 = 4;
LABEL_8:
    objc_msgSend(v6, "didSwitchToTabGroupFromLocation:", v9);

  }
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didUseSidebarAction:", 15);

  }
  -[TabController _switchToTab:orTabUUID:inTabGroup:](v11, *(void **)(a1 + 40), 0, *(void **)(a1 + 32));
  WeakRetained = v11;
LABEL_12:

}

- (BOOL)_switchToTab:(void *)a3 orTabUUID:(void *)a4 inTabGroup:
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL8 v15;

  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v15 = 0;
    goto LABEL_12;
  }
  objc_msgSend(a4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setActiveTabGroupUUID:", v9);

  WeakRetained = objc_loadWeakRetained(a1 + 1);
  objc_msgSend(WeakRetained, "dismissTransientUIAnimated:options:", 1, 2);
  if (v7)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v11, "initWithUUIDString:", v12);

    if (v13)
    {
LABEL_4:
      objc_msgSend(a1, "tabWithUUID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;
      if (v14)
        objc_msgSend(a1, "setActiveTab:", v14);
      if (objc_msgSend(a1[9], "isShowingTabView"))
        objc_msgSend(WeakRetained, "toggleTabView");

      goto LABEL_11;
    }
  }
  else
  {
    v13 = v8;
    if (v13)
      goto LABEL_4;
  }
  v15 = 0;
LABEL_11:

LABEL_12:
  return v15;
}

void __46__TabController__subMenusForTabGroup_variant___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[6], "tabGroupWithUUID:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "debugSyncDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:", v4);

    WeakRetained = v6;
  }

}

void __46__TabController__subMenusForTabGroup_variant___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[6], "tabGroupWithUUID:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "debugRecursiveSyncDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:", v4);

    WeakRetained = v6;
  }

}

- (id)contextMenuConfigurationForTabGroup:(id)a3 variant:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC36B8];
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__TabController_contextMenuConfigurationForTabGroup_variant___block_invoke;
  v12[3] = &unk_1E9CF8628;
  objc_copyWeak(v14, &location);
  v9 = v6;
  v13 = v9;
  v14[1] = (id)a4;
  objc_msgSend(v7, "configurationWithIdentifier:previewProvider:actionProvider:", v8, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  return v10;
}

id __61__TabController_contextMenuConfigurationForTabGroup_variant___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "menuForTabGroup:variant:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contextMenuConfigurationForTab:(id)a3 inTabGroup:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);
  -[TabController tabWithUUID:](self, "tabWithUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "isActive"))
      v12 = 4470;
    else
      v12 = 4402;
    +[TabMenuProvider actionProviderForTab:dataSource:options:](TabMenuProvider, "actionProviderForTab:dataSource:options:", v11, self, v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TabMenuProvider actionProviderForTabGroupTab:inTabGroup:dataSource:options:](TabMenuProvider, "actionProviderForTabGroupTab:inTabGroup:dataSource:options:", v6, v7, self, 4470);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x1E0DC36B8];
    objc_msgSend(v6, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationWithIdentifier:previewProvider:actionProvider:", v16, 0, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __41__TabController__shareActionForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabController _presentShareSheetForTabGroup:sender:](WeakRetained, v5, v6);
}

void __60__TabController__copyLinksActionForTabGroup_forPickerSheet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_copyLinksForTabGroup:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didSendTabGroup");

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didUseSidebarAction:", 12);

  }
}

void __57__TabController__renameActionForTabGroup_forPickerSheet___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    -[TabController _presentRenameAlertForTabGroup:](WeakRetained, *(void **)(a1 + 32));
    WeakRetained = v4;
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "didUseSidebarAction:", 3);

      WeakRetained = v4;
    }
  }

}

void __57__TabController__deleteActionForTabGroup_forPickerSheet___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__TabController__deleteActionForTabGroup_forPickerSheet___block_invoke_2;
    v5[3] = &__block_descriptor_33_e8_v12__0B8l;
    v6 = *(_BYTE *)(a1 + 48);
    -[TabController _presentCloseAlertForTabGroup:completionHandler:]((uint64_t)WeakRetained, v4, v5);
  }

}

void __57__TabController__deleteActionForTabGroup_forPickerSheet___block_invoke_2(uint64_t a1, int a2)
{
  BOOL v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
    v2 = 1;
  else
    v2 = a2 == 0;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didUseSidebarAction:", 4);

  }
}

void __49__TabController__toggleTabViewActionForTabGroup___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didUseSidebarAction:", 14);

    if ((objc_msgSend(v9, "isTabGroupActive:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "didSwitchToTabGroupFromLocation:", 1);

    }
    if ((objc_msgSend(v9, "isTabGroupActive:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActiveTabGroupUUID:", v5);

LABEL_7:
      v8 = objc_loadWeakRetained(v9 + 1);
      objc_msgSend(v8, "toggleTabView");

      WeakRetained = v9;
      goto LABEL_8;
    }
    v6 = objc_msgSend(v9[9], "isShowingTabView");
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActiveTabGroupUUID:", v7);

    WeakRetained = v9;
    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
LABEL_8:

}

void __66__TabController__toggleSidebarSectionIsExpandedActionForTabGroup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "toggleTabGroupUUIDExpanded:", v2);

    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "libraryController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadExpansionStateForTabGroup:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)isTabUUIDActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[TabController activeTabDocument](self, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  return v8;
}

- (BOOL)isTabGroupUUIDExpanded:(id)a3
{
  return -[NSMutableArray containsObject:](self->_expandedTabGroupUUIDs, "containsObject:", a3);
}

- (void)toggleTabGroupUUIDExpanded:(id)a3
{
  NSMutableArray *expandedTabGroupUUIDs;
  id v5;
  int v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  expandedTabGroupUUIDs = self->_expandedTabGroupUUIDs;
  v5 = a3;
  v6 = -[NSMutableArray containsObject:](expandedTabGroupUUIDs, "containsObject:", v5);
  v7 = self->_expandedTabGroupUUIDs;
  if (v6)
    -[NSMutableArray removeObject:](v7, "removeObject:", v5);
  else
    -[NSMutableArray addObject:](v7, "addObject:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "libraryController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sidebarViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsUpdateSelection");

}

- (id)iconForTabUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faviconForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[TabController tabWithUUID:](self, "tabWithUUID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[TabController alternateTabs](self, "alternateTabs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __32__TabController_iconForTabUUID___block_invoke;
      v12[3] = &unk_1E9CF2C90;
      v13 = v4;
      objc_msgSend(v9, "safari_firstObjectPassingTest:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "tabCollectionItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "icon");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __32__TabController_iconForTabUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)dragItemForTab:(id)a3 tabItem:(id)a4
{
  void *v5;
  BrowserController **p_browserController;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;

  v5 = (void *)MEMORY[0x1E0DC3758];
  p_browserController = &self->_browserController;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(v5, "safari_itemWithTab:tabItem:browserController:", v8, v7, WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)moveTab:(id)a3 fromTabGroupWithUUID:(id)a4 toTabGroupWithUUID:(id)a5 afterTab:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  WBTabGroupManager *tabGroupManager;
  void *v19;
  void *v20;
  WBTabGroupManager *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  -[TabController tabGroupWithUUID:](self, "tabGroupWithUUID:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController tabGroupWithUUID:](self, "tabGroupWithUUID:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = objc_msgSend(v13, "isPrivateBrowsing");
  if ((_DWORD)v12 == objc_msgSend(v14, "isPrivateBrowsing"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if (WBSIsEqual())
    {
      objc_msgSend(v14, "tabs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "indexOfObject:", v11);
      if (v17 != objc_msgSend(v16, "indexOfObject:", v10))
      {
        tabGroupManager = self->_tabGroupManager;
        objc_msgSend(v14, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __74__TabController_moveTab_fromTabGroupWithUUID_toTabGroupWithUUID_afterTab___block_invoke;
        v23[3] = &unk_1E9CF7D10;
        v24 = v10;
        v25 = v11;
        -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v19, 1, v23);

        objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);
      }
    }
    else
    {
      v27[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController updateLastSelectedTabUUIDForClosingWBTabs:]((uint64_t)self, v20);

      v21 = self->_tabGroupManager;
      v26 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](v21, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v22, v14, v11, 0);

      objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reportTabUpdatedWithUpdateType:", 8);
    }

  }
}

uint64_t __74__TabController_moveTab_fromTabGroupWithUUID_toTabGroupWithUUID_afterTab___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reorderTab:afterTab:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)moveTabWithUUID:(id)a3 fromForeignLocalGroupWithUUIDIntoActiveGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[TabController _foreignLocalTabGroupWithUUID:]((id *)&self->super.isa, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "isPrivateBrowsing");
    -[TabController activeTabGroup](self, "activeTabGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPrivateBrowsing");

    if (v9 != v11)
    {
      if (v9)
        -[TabController selectPrivateTabGroup](self, "selectPrivateTabGroup");
      else
        -[TabController selectLocalTabGroup](self, "selectLocalTabGroup");
    }
    objc_msgSend(v8, "tabWithUUID:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13 != 0;
    if (v13)
    {
      objc_msgSend(v8, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController moveTab:fromTabGroupWithUUID:toTabGroupWithUUID:afterTab:](self, "moveTab:fromTabGroupWithUUID:toTabGroupWithUUID:afterTab:", v13, v14, self->_activeTabGroupUUID, 0);

      -[TabController _tabForWBTab:]((id *)&self->super.isa, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController insertTab:afterTab:inBackground:animated:](self, "insertTab:afterTab:inBackground:animated:", v15, 0, 0, 0);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_tabForWBTab:(id *)a1
{
  if (a1)
  {
    -[TabController _tabForWBTab:didReuseTabDocument:](a1, a2, 0);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (NSArray)allSyntheticBookmarkFolders
{
  return (NSArray *)-[TabController syntheticBookmarkFoldersIncludingActiveTabGroup:](self, "syntheticBookmarkFoldersIncludingActiveTabGroup:", 1);
}

- (id)syntheticBookmarkFoldersIncludingActiveTabGroup:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  -[TabController namedTabGroups](self, "namedTabGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__TabController_syntheticBookmarkFoldersIncludingActiveTabGroup___block_invoke;
  v8[3] = &unk_1E9CF8698;
  v9 = a3;
  v8[4] = self;
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __65__TabController_syntheticBookmarkFoldersIncludingActiveTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40) || (objc_msgSend(*(id *)(a1 + 32), "isTabGroupActive:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "syntheticBookmarkFolderForTabGroup:withAttribution:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)syntheticBookmarkFolderForTabGroup:(id)a3 withAttribution:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a3;
  -[WBTabGroupManager topScopedBookmarkListForTabGroup:](self->_tabGroupManager, "topScopedBookmarkListForTabGroup:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "displayTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v8;
    }

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5610]), "initWithBookmarkList:title:", v7, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)perTabGroupBookmarkListForFolderID:(int)a3 filteredUsingString:(id)a4
{
  return (id)-[WBTabGroupManager scopedBookmarkListWithID:filteredUsingString:](self->_tabGroupManager, "scopedBookmarkListWithID:filteredUsingString:", *(_QWORD *)&a3, a4);
}

- (id)topScopedBookmarkListForActiveTabGroup
{
  WBTabGroupManager *tabGroupManager;
  void *v3;
  void *v4;

  tabGroupManager = self->_tabGroupManager;
  -[TabController activeTabGroup](self, "activeTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager topScopedBookmarkListForTabGroup:](tabGroupManager, "topScopedBookmarkListForTabGroup:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)insertPerTabGroupBookmark:(id)a3 inPerTabGroupBookmarkFolderWithID:(int)a4
{
  uint64_t v4;
  WBTabGroupManager *tabGroupManager;
  id v7;
  WBTabGroupManager *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  tabGroupManager = self->_tabGroupManager;
  v7 = a3;
  -[WBTabGroupManager scopedBookmarkListWithID:filteredUsingString:](tabGroupManager, "scopedBookmarkListWithID:filteredUsingString:", v4, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = self->_tabGroupManager;
  objc_msgSend(v12, "bookmarkArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager insertScopedBookmark:inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:](v8, "insertScopedBookmark:inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:", v7, v4, v11, 1);

}

- (id)copyBookmark:(id)a3 toPerTabGroupBookmarkFolderWithID:(int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x1E0DCCB98];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v8, "initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:", v9, v10, v4, 1, v11, 1);
  -[TabController insertPerTabGroupBookmark:inPerTabGroupBookmarkFolderWithID:](self, "insertPerTabGroupBookmark:inPerTabGroupBookmarkFolderWithID:", v12, v4);
  return v12;
}

- (void)reorderScopedBookmarkWithUUID:(id)a3 afterBookmarkWithUUID:(id)a4 notify:(BOOL)a5
{
  -[WBTabGroupManager reorderScopedBookmarkWithUUID:afterBookmarkWithUUID:notify:](self->_tabGroupManager, "reorderScopedBookmarkWithUUID:afterBookmarkWithUUID:notify:", a3, a4, a5);
}

- (void)updateScopedBookmarkWithUUID:(id)a3 title:(id)a4 address:(id)a5
{
  -[WBTabGroupManager updateScopedBookmarkWithUUID:title:address:notify:](self->_tabGroupManager, "updateScopedBookmarkWithUUID:title:address:notify:", a3, a4, a5, 1);
}

- (void)deleteScopedBookmarkWithUUID:(id)a3 completionHandler:(id)a4
{
  -[WBTabGroupManager deleteScopedBookmarkWithUUID:notify:completionHandler:](self->_tabGroupManager, "deleteScopedBookmarkWithUUID:notify:completionHandler:", a3, 1, a4);
}

- (BOOL)hasActiveLibrary
{
  void *v2;
  BOOL v3;

  -[TabController activeLibraryType](self, "activeLibraryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasNamedTabGroups
{
  void *v2;
  BOOL v3;

  -[TabController namedTabGroups](self, "namedTabGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)openInTabGroupMenuWithNewTabGroupName:(id)a3 URL:(id)a4 descendantCount:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  if (-[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v11, "safari_userVisibleHostWithoutWWWSubdomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __83__TabController_openInTabGroupMenuWithNewTabGroupName_URL_descendantCount_handler___block_invoke;
    v20[3] = &unk_1E9CF86C0;
    objc_copyWeak(&v22, &location);
    v21 = v12;
    -[TabController tabGroupsMenuElementsWithOptions:newTabGroupName:hostTitle:descendantCount:movingSelectedTabs:actionHandler:](self, "tabGroupsMenuElementsWithOptions:newTabGroupName:hostTitle:descendantCount:movingSelectedTabs:actionHandler:", 20, v10, v14, a5, 0, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v22);
  }
  v15 = (void *)MEMORY[0x1E0DC39D0];
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "menuWithTitle:image:identifier:options:children:", v16, v17, 0, 0, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v18;
}

void __83__TabController_openInTabGroupMenuWithNewTabGroupName_URL_descendantCount_handler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "removeSingleBlankTabFromInactiveTabGroup:", v7);
    objc_msgSend(v7, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveTabGroupUUID:", v5);

    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }

}

- (void)switchOutOfSyncedTabGroup
{
  void *v3;
  int v4;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNamed");

  if (v4)
    -[TabController selectLocalTabGroup](self, "selectLocalTabGroup");
}

- (BOOL)switchToTabWithUUID:(id)a3 inTabGroupWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[TabController tabGroups](self, "tabGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v19 = v6;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
        {
          v6 = v19;
          v17 = -[TabController _switchToTab:orTabUUID:inTabGroup:]((id *)&self->super.isa, 0, v19, v13);
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
    v17 = 0;
    v6 = v19;
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)_urlForActiveTabInTabGroup:(_QWORD *)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a1;
  if (a1)
  {
    v3 = (void *)a1[35];
    objc_msgSend(a2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeTabUUIDForTabGroupWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
      objc_msgSend(v2, "tabWithUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "url");
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (void)evictTabDocument:(id)a3
{
  id v4;

  ++self->_updateTabsSuppressionCount;
  v4 = a3;
  objc_msgSend(v4, "setClosed:", 1);
  objc_msgSend(v4, "willClose");

  --self->_updateTabsSuppressionCount;
}

- (void)closeTabGroup:(id)a3
{
  -[TabController _presentCloseAlertForTabGroup:completionHandler:]((uint64_t)self, a3, 0);
}

uint64_t __65__TabController__presentCloseAlertForTabGroup_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2)
    -[TabController _closeTabGroup:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_selectNewTabGroupIfNecessaryBeforeClosingTabGroup:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (a1 && objc_msgSend(a1, "isTabGroupActive:", v3))
  {
    objc_msgSend(a1, "tabGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", v3);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[TabController _selectNewTabGroupIfNecessaryBeforeClosingTabGroup:].cold.1(v6);
      v7 = 0;
    }
    else
    {
      v8 = v5;
      if (v5 + 1 < (unint64_t)objc_msgSend(v4, "count"))
        v7 = v8 + 1;
      else
        v7 = v8 - 1;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isPrivateBrowsing"))
    {
      objc_msgSend(a1, "unnamedTabGroup");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    objc_msgSend(v9, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setActiveTabGroupUUID:", v11);

  }
}

- (void)createNewTabGroup
{
  -[TabController createTabGroupFromExistingTabs:completionHandler:](self, "createTabGroupFromExistingTabs:completionHandler:", 0, 0);
}

- (void)renameTabGroup:(id)a3
{
  -[TabController _presentRenameAlertForTabGroup:]((id *)&self->super.isa, a3);
}

- (void)moveTab:(id)a3 toTabGroupWithUUID:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  PinnedTabsManager *pinnedTabsManager;
  void *v16;
  void *v17;
  id v18;
  WBTabGroupManager *tabGroupManager;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  PinnedTabsManager *v27;
  void *v28;
  void *v29;
  WBTabGroupManager *v30;
  void *v31;
  void *v32;
  PinnedTabsManager *v33;
  void *v34;
  WBTabGroupManager *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TabController tabGroupWithUUID:](self, "tabGroupWithUUID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isPrivate");
  if (v8 == objc_msgSend(v7, "isPrivateBrowsing")
    && !-[TabController isTabGroupActive:](self, "isTabGroupActive:", v7))
  {
    -[TabController removeSingleBlankTabFromInactiveTabGroup:](self, "removeSingleBlankTabFromInactiveTabGroup:", v7);
    objc_msgSend(v6, "webExtensionWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webExtensionTabs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObject:", v6);

    objc_msgSend(v9, "idForWebExtensions");
    v13 = v12;
    -[TabController _reuseTabIfNecessary:]((uint64_t)self, v6);
    objc_msgSend(v6, "webExtensionsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didMoveTab:fromWindowWithID:indexInOldWindow:", v6, v11, v13);

    if (objc_msgSend(v6, "isPinned"))
    {
      pinnedTabsManager = self->_pinnedTabsManager;
      objc_msgSend(v6, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PinnedTabsManager removeTabWithUUID:persist:](pinnedTabsManager, "removeTabWithUUID:persist:", v17, 0);

      objc_msgSend(v6, "wbTab");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "usesGlobalPinnedTabs") & 1) != 0)
      {
        tabGroupManager = self->_tabGroupManager;
        objc_msgSend(v18, "tabGroupUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = MEMORY[0x1E0C809B0];
        v38 = 3221225472;
        v39 = __44__TabController_moveTab_toTabGroupWithUUID___block_invoke;
        v40 = &unk_1E9CF78F8;
        v18 = v18;
        v41 = v18;
        -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v20, 1, &v37);

        v21 = objc_alloc(MEMORY[0x1E0DCCB30]);
        objc_msgSend(v6, "uuid", v37, v38, v39, v40);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "deviceIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v21, "initWithUUID:deviceIdentifier:", v23, v24);

        objc_msgSend(v6, "tabUpdateBlock");
        v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v26)[2](v26, v25);

        v27 = self->_pinnedTabsManager;
        -[TabController _containerForPinnedTabsInTabGroup:](self, v7);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PinnedTabsManager appendTab:inContainer:](v27, "appendTab:inContainer:", v25, v28);

        v29 = v41;
LABEL_9:

        -[TabController _forceUpdateTabGroupTitleIfNeeded:]((id *)&self->super.isa, v7);
        objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "reportTabUpdatedWithUpdateType:", 8);

        goto LABEL_10;
      }
      v33 = self->_pinnedTabsManager;
      objc_msgSend(v18, "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PinnedTabsManager removeTabWithUUID:persist:](v33, "removeTabWithUUID:persist:", v34, 1);

      v35 = self->_tabGroupManager;
      v43[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPinnedTab");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](v35, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v29, v7, v31, 0);
    }
    else
    {
      v30 = self->_tabGroupManager;
      objc_msgSend(v6, "wbTab");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v42 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tabs");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](v30, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v29, v7, v32, 0);

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_reuseTabIfNecessary:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v5;
      +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addReusableTab:", v3);

    }
  }

}

void __44__TabController_moveTab_toTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);

}

- (void)moveTabGroup:(id)a3 beforeOrAfterTabGroup:(id)a4
{
  id v6;
  WBTabGroupManager *tabGroupManager;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  tabGroupManager = self->_tabGroupManager;
  -[TabController activeProfileIdentifier](self, "activeProfileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager namedTabGroupsForProfileWithIdentifier:](tabGroupManager, "namedTabGroupsForProfileWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  v12 = objc_msgSend(v9, "indexOfObject:", v14);
  v13 = v10;
  if (v11 < v12)
  {
    if (v11)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11 - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  if (v11 != v12)
  {
    self->_suppressSidebarReloadAnimation = 1;
    -[WBTabGroupManager moveTabGroup:afterTabGroup:](self->_tabGroupManager, "moveTabGroup:afterTabGroup:", v14, v13);
    self->_suppressSidebarReloadAnimation = 0;
  }

}

- (void)moveTabGroup:(id)a3 toProfile:(id)a4
{
  id v6;
  id v7;
  WBTabGroupManager *tabGroupManager;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TabController _selectNewTabGroupIfNecessaryBeforeClosingTabGroup:](self, v7);
  tabGroupManager = self->_tabGroupManager;
  objc_msgSend(v6, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager moveTabGroup:toProfileWithIdentifier:afterTabGroup:](tabGroupManager, "moveTabGroup:toProfileWithIdentifier:afterTabGroup:", v7, v9, 0);
}

- (void)_tabWasAddedToReusableTabs:(void *)a3 fromWindowWithID:(double)a4 previousTabPositions:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v13;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "idForWebExtensions");
      objc_msgSend(v9, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v8, "webExtensionsController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "didMoveTab:fromWindowWithID:indexInOldWindow:", v8, objc_msgSend(v11, "index"), a4);

      }
    }
  }

}

- (void)_tabDocumentsWereReusedWhenActiveTabGroupChanged:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      v8 = *MEMORY[0x1E0D8B740];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if (v10 != *(_QWORD *)(a1 + 32))
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "webExtensionsController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "didMoveTab:fromWindowWithID:indexInOldWindow:", v10, 0, v8);

          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
  }

}

void __40__TabController__updateTabsForTabGroup___block_invoke(uint64_t a1)
{
  -[TabController _sendDidEndDocumentUpdates](*(_QWORD *)(a1 + 32));
}

BOOL __40__TabController__updateTabsForTabGroup___block_invoke_328(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v4, "containsObject:", v5) & 1) == 0 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) != (_QWORD)v3;

  return v6;
}

id __40__TabController__updateTabsForTabGroup___block_invoke_329(uint64_t a1, void *a2)
{
  void *v3;
  char v5;

  v5 = 0;
  -[TabController _tabForWBTab:didReuseTabDocument:](*(id **)(a1 + 32), a2, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
  return v3;
}

- (id)_tabForWBTab:(_BYTE *)a3 didReuseTabDocument:
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  HibernatedTab *v15;
  uint64_t v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

    +[WBReusableTabManager sharedManager](ReusableTabManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reuseTabForUUID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "setBrowserController:afterTabGroupReuse:", WeakRetained, 1);
      objc_msgSend(v11, "restoreStateFromTab:", v5);
      if (a3)
        *a3 = 1;
      v12 = v11;
    }
    else
    {
      objc_msgSend(a1, "tabWithUUID:", v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "allowsUnlimitedTabs");

        if (v14)
        {
          v15 = -[HibernatedTab initWithWBTab:browserController:]([HibernatedTab alloc], "initWithWBTab:browserController:", v5, WeakRetained);
        }
        else
        {
          if (objc_msgSend(v5, "isPinned") && !objc_msgSend(v5, "isSyncable"))
          {
            objc_msgSend(a1[36], "privatePinnedTabs");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v17, "containsObject:", v5);

          }
          else
          {
            v16 = objc_msgSend(v5, "isPrivateBrowsing");
          }
          v15 = -[TabDocument initWithTabGroupTab:privateBrowsingEnabled:hibernated:bookmark:browserController:]([TabDocument alloc], "initWithTabGroupTab:privateBrowsingEnabled:hibernated:bookmark:browserController:", v5, v16, 1, 0, WeakRetained);
        }
        v12 = v15;
      }
      objc_msgSend(v12, "updateTabIcon");
      if (a3)
        *a3 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __40__TabController__updateTabsForTabGroup___block_invoke_331(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertTabs:beforeTab:inBackground:animated:", *(_QWORD *)(a1 + 40), 0, 1, 1);
}

- (id)moveMenuOnPageMenuWithDismissHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TabController activeTabDocument](self, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TabMenuProvider moveMenuForTab:dataSource:showTitle:dismissHandler:](TabMenuProvider, "moveMenuForTab:dataSource:showTitle:dismissHandler:", v5, self, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tabGroupsMenuElementsWithOptions:(unint64_t)a3 newTabGroupName:(id)a4 hostTitle:(id)a5 descendantCount:(int64_t)a6 movingSelectedTabs:(id)a7 actionHandler:(id)a8
{
  return -[TabController tabGroupsMenuElementsWithOptions:newTabGroupName:hostTitle:descendantCount:movingSelectedTabs:actionHandler:dismissHandler:](self, "tabGroupsMenuElementsWithOptions:newTabGroupName:hostTitle:descendantCount:movingSelectedTabs:actionHandler:dismissHandler:", a3, a4, a5, a6, a7, a8, &__block_literal_global_332);
}

- (id)tabGroupsMenuElementsWithOptions:(unint64_t)a3 newTabGroupName:(id)a4 hostTitle:(id)a5 descendantCount:(int64_t)a6 movingSelectedTabs:(id)a7 actionHandler:(id)a8 dismissHandler:(id)a9
{
  char v13;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[6];
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  TabController *v61;
  id v62;
  id v63;
  int64_t v64;
  _QWORD v65[3];
  _BYTE v66[128];
  uint64_t v67;

  v13 = a3;
  v67 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v48 = a7;
  v47 = a8;
  v46 = a9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 & 0x10) != 0)
  {
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isCustomTabGroupsEnabled");

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke;
      v57[3] = &unk_1E9CF8758;
      v62 = v46;
      v58 = v16;
      v64 = a6;
      v59 = v15;
      v60 = v48;
      v61 = self;
      v63 = v47;
      objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v21, v22, 0, v57);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("NewTabGroupButton"));
      objc_msgSend(v17, "addObject:", v23);

    }
  }
  v41 = v17;
  v42 = v16;
  v43 = v15;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[TabController tabGroups](self, "tabGroups");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v54 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if ((!-[TabController isTabGroupActive:](self, "isTabGroupActive:", v29)
           || ((v13 & 2) != 0 || (objc_msgSend(v29, "isLocal") & 1) == 0)
           && ((v13 & 4) != 0 || (objc_msgSend(v29, "isSyncable") & 1) == 0))
          && ((v13 & 8) != 0 || (objc_msgSend(v29, "isPrivateBrowsing") & 1) == 0))
        {
          -[TabController imageForTabGroup:](self, "imageForTabGroup:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(v29, "displayTitle");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke_3;
          v49[3] = &unk_1E9CF8780;
          v51 = v46;
          v52 = v47;
          v49[4] = v29;
          v49[5] = self;
          v50 = v48;
          objc_msgSend(v31, "actionWithTitle:image:identifier:handler:", v32, v30, 0, v49);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "title");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setAccessibilityIdentifier:", v34);

          if ((v13 & 1) != 0)
            objc_msgSend(v33, "setState:", -[TabController isTabGroupActive:](self, "isTabGroupActive:", v29));
          if (objc_msgSend(v29, "isNamed"))
            v35 = v44;
          else
            v35 = v45;
          objc_msgSend(v35, "addObject:", v33);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v41);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v36;
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v37;
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v44);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

void __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v4 = *(id *)(a1 + 32);
  }
  else
  {
    _WBSLocalizedString();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 80);
  v7 = v6 - 1;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v6 > 1)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      if (v6 != 2)
      {
        _WBSLocalizedString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        v28 = v7;
        goto LABEL_13;
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
    }
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
LABEL_13:
    objc_msgSend(v8, "stringWithFormat:", v10, v11, v5, v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 11;
    goto LABEL_22;
  }
  if (v6)
  {
    if (v6 > 1)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      if (v6 != 2)
      {
        _WBSLocalizedString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v7;
        goto LABEL_20;
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
    }
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    objc_msgSend(v9, "stringWithFormat:", v17, v5, v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 48), "count");
    v15 = (void *)MEMORY[0x1E0CB3940];
    if (v14 == 1)
    {
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v5);
    }
    else
    {
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v16, objc_msgSend(*(id *)(a1 + 48), "count"));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sender");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v19 = 3;
    else
      v19 = 9;
  }
  else
  {
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v24, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 10;
  }
LABEL_22:
  v21 = *(_QWORD *)(a1 + 48);
  v20 = *(void **)(a1 + 56);
  v22 = *(_QWORD *)(a1 + 40);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke_2;
  v29[3] = &unk_1E9CF8730;
  v31 = *(id *)(a1 + 72);
  v30 = *(id *)(a1 + 48);
  v32 = v19;
  objc_msgSend(v20, "presentAlertToCreateTabGroupFromTabs:withTitle:message:suggestedName:okActionTitle:completionHandler:", v21, v13, v12, v22, v18, v29);

}

void __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    if (*(_QWORD *)(a1 + 40) && !objc_msgSend(*(id *)(a1 + 32), "count"))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didCreateTabGroupFromLocation:prepopulatedWithTabs:", *(_QWORD *)(a1 + 48), 1);

    v3 = v5;
  }

}

void __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usingLoweredBar");

  objc_msgSend(v19, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v19, "sender");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0)
      goto LABEL_12;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didSwitchToTabGroupFromLocation:", 3);

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didSelectTabGroupInDropDownMenu");

    if (objc_msgSend(*(id *)(a1 + 32), "isPrivateBrowsing"))
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didSelectStartPrivateWindowInDropDownMenu");
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) != 0)
    goto LABEL_10;
  objc_msgSend(v19, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  if ((v10 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 5;
LABEL_14:
    objc_msgSend(v12, "didSwitchToTabGroupFromLocation:", v14);
    goto LABEL_15;
  }
LABEL_12:
  if (!objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 10;
    goto LABEL_14;
  }
LABEL_16:

}

- (id)profilesMenuElementsWithOptions:(unint64_t)a3 movingSelectedTabGroups:(id)a4 actionHandler:(id)a5
{
  char v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  id v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v5 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v23 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[TabController profiles](self, "profiles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
        if ((v5 & 2) != 0
          || (-[TabController _isProfileActive:](self, *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11)) & 1) == 0)
        {
          v13 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(v12, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "symbolImage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __87__TabController_profilesMenuElementsWithOptions_movingSelectedTabGroups_actionHandler___block_invoke;
          v24[3] = &unk_1E9CF7758;
          v16 = v23;
          v24[4] = v12;
          v25 = v16;
          objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "title");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAccessibilityIdentifier:", v18);

          if ((v5 & 1) != 0)
            objc_msgSend(v17, "setState:", -[TabController _isProfileActive:](self, v12));
          objc_msgSend(v7, "addObject:", v17);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __87__TabController_profilesMenuElementsWithOptions_movingSelectedTabGroups_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removeSingleBlankTabFromInactiveTabGroup:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[TabController isTabGroupActive:](self, "isTabGroupActive:", v10);
  v5 = v10;
  if (!v4)
  {
    objc_msgSend(v10, "tabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") <= 1)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          -[TabController _removeTab:fromTabGroup:]((uint64_t)self, v8, v10);
      }

    }
    v5 = v10;
  }

}

- (void)removeSingleBlankTabFromActiveTabGroup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TabController currentTabs](self, "currentTabs", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          -[TabController closeTab:animated:](self, "closeTab:animated:", v8, 0);
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)openBookmark:(id)a3 inTabGroup:(id)a4
{
  -[TabController _openBookmark:orURL:inTabGroup:]((id *)&self->super.isa, a3, 0, a4);
}

- (void)_openBookmark:(void *)a3 orURL:(void *)a4 inTabGroup:
{
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id WeakRetained;
  unint64_t v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (a1 && v17 | v7)
  {
    if (objc_msgSend(a1, "isTabGroupActive:", v8))
    {
      objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPrefersOpenInNewTab:", 1);
      if (v17)
        objc_msgSend(v9, "navigationIntentWithBookmark:");
      else
        objc_msgSend(v9, "navigationIntentWithURL:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v15);

    }
    else
    {
      objc_msgSend(a1, "removeSingleBlankTabFromInactiveTabGroup:", v8);
      if (objc_msgSend((id)v17, "isFolder"))
      {
        objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "listWithID:", objc_msgSend((id)v17, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bookmarkArray");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
        {
          v13 = 0;
          do
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[TabController _openSingleBookmark:orURL:inTabGroup:setActive:](a1, v14, 0, v8, v13 == 0);

            ++v13;
          }
          while (v13 < objc_msgSend(v12, "count"));
        }

      }
      else
      {
        -[TabController _openSingleBookmark:orURL:inTabGroup:setActive:](a1, (void *)v17, (void *)v7, v8, 1);
      }
      -[TabController _forceUpdateTabGroupTitleIfNeeded:](a1, v8);
    }
  }

}

- (void)openURL:(id)a3 inTabGroup:(id)a4
{
  -[TabController _openBookmark:orURL:inTabGroup:]((id *)&self->super.isa, 0, a3, a4);
}

- (void)_openSingleBookmark:(void *)a3 orURL:(void *)a4 inTabGroup:(int)a5 setActive:
{
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    if (v21)
    {
      objc_msgSend(v21, "title");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v21, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLWithString:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = v9;
      v11 = &stru_1E9CFDBB0;
    }
    v15 = objc_alloc(MEMORY[0x1E0DCCB58]);
    objc_msgSend(a1, "deviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithTitle:url:deviceIdentifier:", v11, v14, v16);

    -[TabController _appendTab:toTabGroup:]((uint64_t)a1, v17, v10);
    if (a5)
    {
      v18 = (void *)a1[35];
      objc_msgSend(v17, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActiveTabUUID:forTabGroupWithUUID:", v19, v20);

    }
  }

}

- (void)_appendTab:(void *)a3 toTabGroup:
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  if (a1)
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(a3, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__TabController__appendTab_toTabGroup___block_invoke;
    v8[3] = &unk_1E9CF78F8;
    v9 = v5;
    objc_msgSend(v6, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v7, 1, v8);

  }
}

void __39__TabController__appendTab_toTabGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend(v2, "mutableCopy");
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendTabs:", v5);

}

void __41__TabController__removeTab_fromTabGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);

}

- (id)browserControllerContainingLocalTabGroupUUID:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "browserWindowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "browserControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__TabController_browserControllerContainingLocalTabGroupUUID___block_invoke;
  v11[3] = &unk_1E9CF1B50;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "safari_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __62__TabController_browserControllerContainingLocalTabGroupUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v4, "privateTabGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v11);

  }
  return v8;
}

- (void)registerTabGroupManagerObserver:(id)a3
{
  -[WBTabGroupManager addTabGroupObserver:](self->_tabGroupManager, "addTabGroupObserver:", a3);
}

- (WBTabGroup)activeTabGroupOrTabGroupVisibleInSwitcher
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (SFEnhancedTabOverviewEnabled()
    && -[TabCollectionViewManager isShowingTabView](self->_tabCollectionViewManager, "isShowingTabView"))
  {
    -[TabCollectionViewManager tabSwitcherViewController](self->_tabCollectionViewManager, "tabSwitcherViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "visibleTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[TabController activeTabGroup](self, "activeTabGroup");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    -[TabController activeTabGroup](self, "activeTabGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (WBTabGroup *)v7;
}

- (BOOL)scrollTabSwitcherToTabGroupIfShowing:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (SFEnhancedTabOverviewEnabled()
    && -[TabCollectionViewManager isShowingTabView](self->_tabCollectionViewManager, "isShowingTabView"))
  {
    -[TabCollectionViewManager tabSwitcherViewController](self->_tabCollectionViewManager, "tabSwitcherViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollToTabGroup:", v4);

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
  NSString *activeTabGroupUUID;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  activeTabGroupUUID = self->_activeTabGroupUUID;
  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v7, "isEqualToString:", activeTabGroupUUID))
    -[TabController updateSelectedTabGroupName](self, "updateSelectedTabGroupName");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0);

  -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabGroupWithUUID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "reloadTabGroup:", v10);
}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "reloadSidebarAnimated:", !self->_suppressSidebarReloadAnimation);

  -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadTabGroups");

}

id __65__TabController_tabGroupManager_didUpdateTabsInTabGroupWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  objc_msgSend(v4, "tabWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[TabController _tabForWBTab:](*(id **)(a1 + 32), v3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  if ((objc_msgSend(*(id *)(a1 + 40), "usesGlobalPinnedTabs") & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(v3, "isPinned");
  objc_msgSend(v11, "setPinned:", v12);
  objc_msgSend(v11, "setWBTab:", v3);

  return v11;
}

- (void)tabGroupManager:(id)a3 didUpdateTabWithUUID:(id)a4 userDriven:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  int v40;
  _BOOL4 v41;
  _QWORD v42[4];
  id v43;
  TabController *v44;
  id v45;
  uint8_t buf[4];
  _BOOL4 v47;
  uint64_t v48;

  v5 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "tabWithUUID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[TabController isTabInActiveTabGroup:]((uint64_t)self, v7))
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v7, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);
      -[TabController tabWithUUID:](self, "tabWithUUID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "setWBTab:", v7);
        v12 = objc_alloc_init(MEMORY[0x1E0D89D00]);
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __65__TabController_tabGroupManager_didUpdateTabWithUUID_userDriven___block_invoke;
        v42[3] = &unk_1E9CF2990;
        v13 = v11;
        v43 = v13;
        v44 = self;
        v14 = v7;
        v45 = v14;
        objc_msgSend(v12, "setHandler:", v42);
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual())
        {
          v17 = v12;
          objc_msgSend(v13, "url");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "url");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (WBSIsEqual())
          {
            v40 = objc_msgSend(v13, "isPinned");
            v38 = objc_msgSend(v14, "isPinned");

            v12 = v17;
            if (v40 == v38)
            {
              v20 = WBS_LOG_CHANNEL_PREFIXTabGroup();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D7CA3000, v20, OS_LOG_TYPE_INFO, "Ignoring tab update because title, url, and pinned state are identical", buf, 2u);
              }
LABEL_26:

              goto LABEL_27;
            }
LABEL_11:
            objc_msgSend(v13, "url");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "url");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = WBSIsEqual();

            objc_msgSend(v13, "expectedOrCurrentURL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "safari_isSafariWebExtensionURL"))
            {
              objc_msgSend(v13, "webExtensionsController");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "url");
              v41 = v5;
              v39 = v12;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "_extensionURLToLoadFromPersistentStateURL:", v26);
              v27 = v24;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = WBSIsEqual();

              v24 = v27;
              v12 = v39;
              v5 = v41;

            }
            else
            {
              v29 = 0;
            }
            if (((v23 | v29) & 1) == 0)
            {
              v30 = WBS_LOG_CHANNEL_PREFIXTabGroup();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109120;
                v47 = v5;
                _os_log_impl(&dword_1D7CA3000, v30, OS_LOG_TYPE_INFO, "Navigating tab because the URL has changed (user driven: %d)", buf, 8u);
              }
              if (v5)
              {
                -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, v13);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "unhibernate");
                v32 = v31;

                objc_msgSend(v32, "restoreStateFromTab:", v14);
                v13 = v32;
              }
              else
              {
                objc_msgSend(v13, "clearBackForwardList");
                objc_msgSend(v14, "url");
                v32 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "title");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "loadURL:title:skipSyncableTabUpdates:", v32, v33, 1);

              }
              objc_msgSend(v13, "updateTabIcon");
            }
            v34 = objc_msgSend(v13, "isPinned");
            if (v34 != objc_msgSend(v14, "isPinned"))
            {
              v35 = WBS_LOG_CHANNEL_PREFIXTabGroup();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D7CA3000, v35, OS_LOG_TYPE_INFO, "Changing pinned state of tab", buf, 2u);
              }
              objc_msgSend(v13, "setPinned:", objc_msgSend(v14, "isPinned"));
              objc_msgSend(v14, "pinnedTitle");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setPinnedTitle:", v36);

              objc_msgSend(v14, "pinnedURL");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setPinnedURL:", v37);

            }
            goto LABEL_26;
          }

          v12 = v17;
        }

        goto LABEL_11;
      }
    }
  }
LABEL_27:

}

void __65__TabController_tabGroupManager_didUpdateTabWithUUID_userDriven___block_invoke(id *a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(a1[5], "activeTabGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isShared"))
    v2 = objc_msgSend(a1[6], "isMarkedAsRead") ^ 1;
  else
    v2 = 0;
  objc_msgSend(a1[4], "setUnread:", v2);

}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  void *v5;
  WBWindowState *windowState;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "removedTabGroupWithUUID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    windowState = self->_windowState;
    v11 = v5;
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBWindowState removeActiveTabUUIDForTabGroupWithUUID:](windowState, "removeActiveTabUUIDForTabGroupWithUUID:", v7);

    objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "isPrivateBrowsing");
    if ((objc_msgSend(v11, "isSyncable") & 1) != 0)
    {
      objc_msgSend(v11, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBlankSnapshotGroupIdentifier:forPrivateBrowsing:syncableTabGroupUUID:forWindowWithUUID:", 0, v9, v10, self->_browserWindowUUID);

    }
    else
    {
      objc_msgSend(v8, "setBlankSnapshotGroupIdentifier:forPrivateBrowsing:syncableTabGroupUUID:forWindowWithUUID:", 0, v9, 0, self->_browserWindowUUID);
    }

    v5 = v11;
  }

}

- (void)tabGroupManager:(id)a3 willReplaceTabWithUUID:(id)a4 withTabWithUUID:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x1E0CB3A28];
  v8 = a5;
  v9 = a4;
  v11 = (id)objc_msgSend([v7 alloc], "initWithUUIDString:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_originalToReplacementUUIDMap, "setObject:forKeyedSubscript:", v10, v11);

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  objc_msgSend(v4, "selectAll:", 0);
  if (self->_showsTabGroupNameSuggestions)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__TabController_textFieldDidBeginEditing___block_invoke;
    v5[3] = &unk_1E9CF4650;
    v5[4] = self;
    v6 = v4;
    -[TabController _updateContextKitSuggestionsForTabGroupWithCompletionHandler:](self, v5);

  }
}

void __42__TabController_textFieldDidBeginEditing___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if ((a2 & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__TabController_textFieldDidBeginEditing___block_invoke_2;
    v5[3] = &unk_1E9CF1830;
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v6 = v3;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 232) = 0;
    objc_msgSend(*(id *)(a1 + 40), "setAutocorrectionType:", 2);
  }
}

void __42__TabController_textFieldDidBeginEditing___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel_tabGroupNamingTextDidChange_, 0x20000);
  -[TabController _updateTabGroupSuggestions:matchingText:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), 0);
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  NSArray *tabGroupSuggestions;
  void *v7;
  CKContextCompleter *contextCompleter;
  id v9;
  _QWORD v10[4];
  id v11;

  if (self->_showsTabGroupNameSuggestions)
  {
    objc_msgSend(a3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    tabGroupSuggestions = self->_tabGroupSuggestions;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__TabController_textFieldDidEndEditing___block_invoke;
    v10[3] = &unk_1E9CF6BC8;
    v9 = v5;
    v11 = v9;
    -[NSArray safari_firstObjectPassingTest:](tabGroupSuggestions, "safari_firstObjectPassingTest:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[CKContextCompleter logEngagement:forInput:](self->_contextCompleter, "logEngagement:forInput:", v7, 0);
    contextCompleter = self->_contextCompleter;
    self->_contextCompleter = 0;

  }
}

uint64_t __40__TabController_textFieldDidEndEditing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)registerUndoWithName:(id)a3 actions:(id)a4
{
  id v6;
  id v7;
  TabCloseUndoGroup *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[TabCloseUndoGroup initWithName:]([TabCloseUndoGroup alloc], "initWithName:", v7);

  -[TabController _registerUndoWithGroup:actions:]((uint64_t)self, v8, v6);
}

- (void)_registerUndoWithGroup:(void *)a3 actions:
{
  id *v6;
  void *v7;
  id v8;
  void (**v9)(void);
  id v10;
  id v11;

  v11 = a2;
  if (a1)
  {
    v7 = *(void **)(a1 + 144);
    v6 = (id *)(a1 + 144);
    v8 = v7;
    objc_storeStrong(v6, a2);
    v9 = a3;
    v9[2]();

    v10 = *v6;
    *v6 = v8;

  }
}

- (void)registerUndoWithType:(int64_t)a3 actions:(id)a4
{
  id v6;
  TabCloseUndoGroup *v7;

  v6 = a4;
  v7 = -[TabCloseUndoGroup initWithType:]([TabCloseUndoGroup alloc], "initWithType:", a3);
  -[TabController _registerUndoWithGroup:actions:]((uint64_t)self, v7, v6);

}

- (void)_registerSingleUndoActionForClosedTabs:(id *)a1
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    objc_msgSend(a1[43], "beginUndoGrouping");
    v5 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__TabController__registerSingleUndoActionForClosedTabs___block_invoke;
    v13[3] = &unk_1E9CF1900;
    v13[4] = a1;
    objc_msgSend(v5, "setHandler:", v13);
    objc_msgSend(a1[43], "prepareWithInvocationTarget:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_undoCloseTabs:", v3);

    objc_msgSend(WeakRetained, "setOverridesUndoManagerForClosedTabs:", 1);
    if ((objc_msgSend(a1[43], "isUndoing") & 1) == 0 && (objc_msgSend(a1[43], "isRedoing") & 1) == 0)
    {
      objc_msgSend(a1[18], "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "length"))
      {
        v8 = objc_msgSend(v3, "count");
        if (v8 == 1)
        {
          _WBSLocalizedString();
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = v8;
          v11 = (void *)MEMORY[0x1E0CB3940];
          _WBSLocalizedString();
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
          v9 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v12;
        }

        v7 = (void *)v9;
      }
      objc_msgSend(a1[43], "setActionName:", v7);

    }
  }

}

uint64_t __56__TabController__registerSingleUndoActionForClosedTabs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "endUndoGrouping");
}

- (void)_undoCloseTabs:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  TabController *v12;
  id v13;
  BOOL v14;

  v4 = a3;
  v5 = (unint64_t)objc_msgSend(v4, "count") > 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__TabController__undoCloseTabs___block_invoke;
  v10[3] = &unk_1E9CF7D80;
  v9 = v4;
  v11 = v9;
  v12 = self;
  v14 = v5;
  v7 = v6;
  v13 = v7;
  -[TabController performBatchUpdatesWithBlock:](self, "performBatchUpdatesWithBlock:", v10);
  if (-[NSUndoManager isUndoing](self->_undoManager, "isUndoing"))
  {
    -[NSUndoManager prepareWithInvocationTarget:](self->_undoManager, "prepareWithInvocationTarget:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_redoCloseTabsWithUUIDs:", v7);

  }
}

void __32__TabController__undoCloseTabs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  TabDocument *v8;
  id WeakRetained;
  TabDocument *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        v8 = [TabDocument alloc];
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
        v10 = -[TabDocument initWithTabStateData:hibernated:browserController:](v8, "initWithTabStateData:hibernated:browserController:", v7, 0, WeakRetained, (_QWORD)v13);

        -[TabController _insertTab:atIndex:inBackground:animated:updateUI:](*(id **)(a1 + 40), v10, objc_msgSend(v7, "orderIndex"), *(_BYTE *)(a1 + 56), 0, 1);
        v11 = *(void **)(a1 + 48);
        -[TabDocument uuid](v10, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (void)_redoCloseTabsWithUUIDs:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__TabController__redoCloseTabsWithUUIDs___block_invoke;
  v5[3] = &unk_1E9CF87F8;
  v5[4] = self;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v4, 1u, 1, 0, 0);

}

uint64_t __41__TabController__redoCloseTabsWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "tabWithUUID:", a2);
}

- (id)globalPinnedTabsForTabGroup:(id)a3
{
  PinnedTabsManager *pinnedTabsManager;
  void *v4;
  void *v5;

  pinnedTabsManager = self->_pinnedTabsManager;
  -[TabController _containerForPinnedTabsInTabGroup:](self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PinnedTabsManager pinnedTabsInContainer:](pinnedTabsManager, "pinnedTabsInContainer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)selectFirstUnpinnedTab
{
  void *v3;

  -[TabController _firstUnpinnedTab](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[TabController setActiveTab:](self, "setActiveTab:", v3);

  return v3 != 0;
}

- (void)setTab:(id)a3 isPinned:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  PinnedTabsManager *pinnedTabsManager;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v4 = a4;
  v15 = a3;
  if (objc_msgSend(v15, "isPinned") != v4)
  {
    objc_msgSend(v15, "setPinned:", v4);
    objc_msgSend(v15, "wbTab");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabGroupUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController tabGroupWithUUID:](self, "tabGroupWithUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      if ((objc_msgSend(v15, "isPrivateBrowsingEnabled") & 1) != 0)
        -[WBWindowState privateTabGroup](self->_windowState, "privateTabGroup");
      else
        -[TabController unnamedTabGroup](self, "unnamedTabGroup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    pinnedTabsManager = self->_pinnedTabsManager;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __33__TabController_setTab_isPinned___block_invoke;
    v16[3] = &unk_1E9CF2AF8;
    v16[4] = self;
    v17 = v8;
    v18 = v6;
    v19 = v15;
    v10 = v6;
    v11 = v8;
    -[PinnedTabsManager performUpdatesUsingBlock:](pinnedTabsManager, "performUpdatesUsingBlock:", v16);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 1);
    objc_msgSend(WeakRetained, "libraryController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sidebarViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadSectionControllersIfNeeded");

  }
}

void __33__TabController_setTab_isPinned___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__TabController_setTab_isPinned___block_invoke_2;
  v6[3] = &unk_1E9CF8820;
  v7 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  objc_msgSend(v2, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v3, 1, v6);

}

void __33__TabController_setTab_isPinned___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mutableTabWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 40), "tabUpdateBlock");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v8)[2](v8, v7);

  -[TabController _tabGroupTabDidUpdatePinned:inTabGroup:](*(id **)(a1 + 48), v7, v9);
}

- (BOOL)trySwitchingToPinnedTabOnNavigationToURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  -[TabController activeTabDocument](self, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[TabController _findPinnedTabMatchingURL:](self, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = v9 == (_QWORD)v5;
    else
      v11 = 1;
    v8 = !v11;
    if (v11)
    {
      v12 = v5;
    }
    else
    {
      -[TabController setActiveTab:animated:](self, "setActiveTab:animated:", v9, 1);
      -[TabController activeTabDocument](self, "activeTabDocument");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[TabController _shouldReloadAfterAutomaticallySwitchingToTab:]((uint64_t)self, v12))
        objc_msgSend(v12, "reload");
      if (-[TabController _shouldCloseAfterAutomaticallySwitchingFromTab:]((_BOOL8)self, v12))
        -[TabController closeTab:animated:](self, "closeTab:animated:", v12, 1);
    }

    v5 = v12;
  }

  return v8;
}

- (id)_findPinnedTabMatchingURL:(void *)a1
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "pinnedTabs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "absoluteString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v4, "isEqual:", v13) & 1) != 0)
          goto LABEL_14;
        objc_msgSend(v10, "committedURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v4, "isEqual:", v16) & 1) != 0)
        {
          v13 = v16;
LABEL_14:
          v17 = v10;

          goto LABEL_15;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v17 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_15:

  return v17;
}

- (uint64_t)_shouldReloadAfterAutomaticallySwitchingToTab:(uint64_t)a1
{
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  objc_msgSend(a2, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isPlayingAudio") ^ 1;

  return v3;
}

- (BOOL)_shouldCloseAfterAutomaticallySwitchingFromTab:(_BOOL8)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isPinned") & 1) != 0 || !objc_msgSend(v4, "isBlank"))
    {
      a1 = 0;
    }
    else
    {
      objc_msgSend((id)a1, "unpinnedTabs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (unint64_t)objc_msgSend(v5, "count") > 1;

    }
  }

  return a1;
}

- (TabDocument)singleUnpinnedBlankTab
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[TabController unpinnedTabs](self, "unpinnedTabs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[TabController unpinnedTabs](self, "unpinnedTabs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isBlank"))
    {
      -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  return (TabDocument *)v7;
}

uint64_t __34__TabController__firstUnpinnedTab__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

uint64_t __50__TabController__hasPinnedStartPageExcludingTabs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "isPinned") && objc_msgSend(v3, "isBlank"))
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) ^ 1;
  else
    v4 = 0;

  return v4;
}

- (id)recentlyClosedTabsMenuForTabGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[TabController tabGroupWithUUID:](self, "tabGroupWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPrivateBrowsing");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__TabController_recentlyClosedTabsMenuForTabGroupWithUUID___block_invoke;
    aBlock[3] = &unk_1E9CF8868;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    v8 = _Block_copy(aBlock);
    v9 = (void *)MEMORY[0x1E0DC39D0];
    -[TabController activeProfile](self, "activeProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_recentlyClosedTabsMenuForProfile:showProfileTitle:openHandler:", v10, -[TabController hasMultipleProfiles](self, "hasMultipleProfiles"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __59__TabController_recentlyClosedTabsMenuForTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setActiveTabGroupUUID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "insertTabDocumentFromTabStateData:", v6);
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 4, objc_msgSend(v4[9], "visibleTabCollectionViewType"));

  }
}

- (NSString)activeTabUUID
{
  void *v2;
  void *v3;

  -[TabController activeTabDocument](self, "activeTabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuidString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setActiveTabUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[TabController tabGroupRelatedToTabWithUUID:](self, "tabGroupRelatedToTabWithUUID:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isPrivateBrowsing") & 1) != 0
    || (objc_msgSend(v4, "profileIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[TabController activeProfileIdentifier](self, "activeProfileIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    -[TabController activeTabGroupUUID](self, "activeTabGroupUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v4, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController setActiveTabGroupUUID:](self, "setActiveTabGroupUUID:", v11);

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v14);
    -[TabController tabWithUUID:](self, "tabWithUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[TabController setActiveTab:](self, "setActiveTab:", v13);

  }
}

- (id)appendWBTabInTabGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  TabDocument *v8;
  TabDocument *tabDocumentBeingHiddenFromTabView;
  void *v10;
  void *v11;
  void *v12;
  WBTabGroupManager *tabGroupManager;
  _QWORD v15[4];
  TabDocument *v16;

  v4 = a3;
  if (self->_tabDocumentBeingHiddenFromTabView
    && (-[TabController privateTabGroupIfAvailable](self, "privateTabGroupIfAvailable"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "uuid"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqual:", v4),
        v6,
        v5,
        v7))
  {
    -[TabDocument tabGroupTab](self->_tabDocumentBeingHiddenFromTabView, "tabGroupTab");
    v8 = (TabDocument *)objc_claimAutoreleasedReturnValue();
    -[TabController setActiveTabGroupUUID:](self, "setActiveTabGroupUUID:", v4);
    tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
    self->_tabDocumentBeingHiddenFromTabView = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DCCB30];
    -[TabController deviceIdentifier](self, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startPageTabWithDeviceIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    tabGroupManager = self->_tabGroupManager;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__TabController_appendWBTabInTabGroupWithUUID___block_invoke;
    v15[3] = &unk_1E9CF78F8;
    v8 = v12;
    v16 = v8;
    -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v4, 1, v15);
    tabDocumentBeingHiddenFromTabView = v16;
  }

  return v8;
}

void __47__TabController_appendWBTabInTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendTabs:", v4, v5, v6);

}

- (void)authenticateToUnlockPrivateBrowsing
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "authenticateToUnlockPrivateBrowsing");

}

- (uint64_t)_wbTabIsShowingStartPageOverriddenByExtension:(_QWORD *)a1
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tabGroupRelatedToTabWithUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "profileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)a1[6];
      objc_msgSend(v6, "profileIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "profileWithIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    +[Application sharedApplication](Application, "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "webExtensionsControllerForTabWithPrivateBrowsingEnabled:profile:", objc_msgSend(v4, "isPrivateBrowsing"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "extensionOverriddenStartPageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v4, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_persistentStateURLForExtensionURL:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (uint64_t)_wbTabIsBlank:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isBlank") & 1) != 0)
      a1 = 1;
    else
      a1 = -[TabController _wbTabIsShowingStartPageOverriddenByExtension:]((_QWORD *)a1, v4);
  }

  return a1;
}

- (BOOL)canCloseWBTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  char v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController tabGroupRelatedToTabWithUUID:](self, "tabGroupRelatedToTabWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unpinnedTabs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > 1
    || (-[TabController canCloseLastTabInTabGroup:]((uint64_t)self, v6) & 1) != 0
    || (objc_msgSend(v6, "pinnedStartPage"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    v10 = 1;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);

    if (-[TabController _wbTabIsBlank:]((uint64_t)self, v4))
    {
      -[TabController tabWithUUID:](self, "tabWithUUID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "isLoading");

    }
    else
    {
      v10 = 1;
    }

  }
  return v10;
}

- (uint64_t)canCloseLastTabInTabGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  void *WeakRetained;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "isPrivateBrowsing"))
    {
      objc_msgSend(*(id *)(a1 + 288), "privatePinnedTabs");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(WeakRetained, "count") == 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v6 = objc_msgSend(WeakRetained, "isControlledByAutomation");
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)closeWBTabs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  TabDocument *v21;
  TabDocument *tabDocumentBeingHiddenFromTabView;
  PinnedTabsManager *pinnedTabsManager;
  _QWORD v24[4];
  id v25;
  TabController *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D89D00]);
  v6 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __29__TabController_closeWBTabs___block_invoke;
  v29[3] = &unk_1E9CF1830;
  v29[4] = self;
  v7 = v4;
  v30 = v7;
  objc_msgSend(v5, "setHandler:", v29);
  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = __29__TabController_closeWBTabs___block_invoke_2;
  v28[3] = &unk_1E9CF8890;
  v28[4] = self;
  objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 == objc_msgSend(v7, "count"))
    -[TabController _addTabsToRecentlyClosed:]((uint64_t)self, v8);
  objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithObjectsInFastEnumerationCollection:groupedUsingBlock:", v7, &__block_literal_global_389);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController privateTabGroupIfAvailable](self, "privateTabGroupIfAvailable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = v15 == -[NSMutableArray count](self->_mutablePrivateTabs, "count");

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v7, "safari_filterObjectsUsingBlock:", &__block_literal_global_390);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  v27[1] = 3221225472;
  v27[2] = __29__TabController_closeWBTabs___block_invoke_5;
  v27[3] = &unk_1E9CF8918;
  v27[4] = self;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v27);
  if (v16)
  {
    -[NSMutableArray firstObject](self->_mutablePrivateTabs, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isBlank");

    if (v19)
    {
      -[NSMutableArray firstObject](self->_mutablePrivateTabs, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, v20);
      v21 = (TabDocument *)objc_claimAutoreleasedReturnValue();
      tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
      self->_tabDocumentBeingHiddenFromTabView = v21;

    }
  }
  if (objc_msgSend(v17, "count"))
  {
    pinnedTabsManager = self->_pinnedTabsManager;
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __29__TabController_closeWBTabs___block_invoke_7;
    v24[3] = &unk_1E9CF1830;
    v25 = v17;
    v26 = self;
    -[PinnedTabsManager performUpdatesUsingBlock:](pinnedTabsManager, "performUpdatesUsingBlock:", v24);

  }
}

void __29__TabController_closeWBTabs___block_invoke(uint64_t a1)
{
  -[TabController _presentAutomaticTabClosingPromptIfNeededForClosedTabCount:](*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "count"));
}

id __29__TabController_closeWBTabs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isPrivateBrowsing") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "isControlledByAutomation") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);
    objc_msgSend(v5, "tabWithUUID:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __29__TabController_closeWBTabs___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tabGroupUUID");
}

BOOL __29__TabController_closeWBTabs___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "tabGroupUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __29__TabController_closeWBTabs___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  -[TabController updateLastSelectedTabUUIDForClosingWBTabs:](v6, v5);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__TabController_closeWBTabs___block_invoke_6;
  v10[3] = &unk_1E9CF78F8;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v7, 1, v10);

}

uint64_t __29__TabController_closeWBTabs___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteTabs:", *(_QWORD *)(a1 + 32));
}

void __29__TabController_closeWBTabs___block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 288);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "uuid", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeTabWithUUID:persist:", v8, 1);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)defaultTabToSelectInTabGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[TabController isTabGroupActive:](self, "isTabGroupActive:", v4))
  {
    -[TabController activeTabDocument](self, "activeTabDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wbTab");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "lastSelectedTabUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController wbTabWithUUID:](self, "wbTabWithUUID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v6 = v7;
    }
    else
    {
      objc_msgSend(v4, "firstUnpinnedTab");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v6 = v9;
      }
      else
      {
        objc_msgSend(v4, "tabs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v6;
}

- (BOOL)isTabWithUUIDBeingHiddenFromTabView:(id)a3
{
  TabDocument *tabDocumentBeingHiddenFromTabView;
  id v4;
  void *v5;
  char v6;

  tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
  v4 = a3;
  -[TabDocument uuidString](tabDocumentBeingHiddenFromTabView, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (void)switchToTabGroupVisibleInSwitcherIfNeeded
{
  void *v3;
  void *v4;
  NSString *activeTabGroupUUID;
  void *v6;
  void *v7;
  id v8;

  -[TabCollectionViewManager tabSwitcherViewController](self->_tabCollectionViewManager, "tabSwitcherViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRenamingVisibleTabGroup");

  -[TabController activeTabGroupOrTabGroupVisibleInSwitcher](self, "activeTabGroupOrTabGroupVisibleInSwitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  activeTabGroupUUID = self->_activeTabGroupUUID;
  v8 = v4;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(activeTabGroupUUID) = -[NSString isEqualToString:](activeTabGroupUUID, "isEqualToString:", v6);

  if ((activeTabGroupUUID & 1) == 0)
  {
    objc_msgSend(v8, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController setActiveTabGroupUUID:](self, "setActiveTabGroupUUID:", v7);

  }
}

- (void)_movePinnedWBTab:(void *)a3 toTabGroup:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "tabGroupRelatedToTabWithUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((WBSIsEqual() & 1) != 0)
    {
LABEL_13:

      goto LABEL_14;
    }
    v9 = objc_alloc(MEMORY[0x1E0DCCB30]);
    objc_msgSend(v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithUUID:deviceIdentifier:", v10, v11);

    objc_msgSend(v12, "adoptAttributesFromTab:", v5);
    objc_msgSend(v12, "setSyncable:", objc_msgSend(v6, "isSyncable"));
    -[TabController _containerForPinnedTabsInTabGroup:]((void *)a1, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "usesGlobalPinnedTabs")
      && objc_msgSend(v6, "usesGlobalPinnedTabs"))
    {
      v14 = *(void **)(a1 + 288);
      objc_msgSend(v5, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeTabWithUUID:persist:", v15, 1);

      objc_msgSend(*(id *)(a1 + 288), "appendTab:inContainer:", v12, v13);
    }
    else
    {
      if (objc_msgSend(v8, "usesGlobalPinnedTabs"))
      {
        v16 = *(void **)(a1 + 288);
        objc_msgSend(v5, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeTabWithUUID:persist:", v17, 1);

        v18 = *(void **)(a1 + 48);
        objc_msgSend(v6, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __45__TabController__movePinnedWBTab_toTabGroup___block_invoke;
        v31[3] = &unk_1E9CF78F8;
        v32 = v12;
        objc_msgSend(v18, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v19, 1, v31);

        v20 = v32;
      }
      else
      {
        v21 = objc_msgSend(v6, "usesGlobalPinnedTabs");
        v22 = *(void **)(a1 + 48);
        if (!v21)
        {
          v33[0] = v5;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "lastPinnedTab");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v24, v6, v25, 0);

          goto LABEL_12;
        }
        objc_msgSend(v8, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = MEMORY[0x1E0C809B0];
        v27 = 3221225472;
        v28 = __45__TabController__movePinnedWBTab_toTabGroup___block_invoke_2;
        v29 = &unk_1E9CF78F8;
        v30 = v5;
        objc_msgSend(v22, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v23, 1, &v26);

        objc_msgSend(*(id *)(a1 + 288), "appendTab:inContainer:", v12, v13, v26, v27, v28, v29);
        v20 = v30;
      }

    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:

}

void __45__TabController__movePinnedWBTab_toTabGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPinnedTab", v6, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertTabs:afterTab:", v4, v5);

}

void __45__TabController__movePinnedWBTab_toTabGroup___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);

}

- (void)moveWBTabs:(id)a3 toTabGroup:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  WBTabGroupManager *tabGroupManager;
  void *v10;
  void *v11;
  PinnedTabsManager *pinnedTabsManager;
  id v13;
  _QWORD v14[4];
  id v15;
  TabController *v16;
  id v17;

  v13 = a4;
  objc_msgSend(a3, "safari_splitArrayUsingCondition:", &__block_literal_global_392);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    tabGroupManager = self->_tabGroupManager;
    objc_msgSend(v13, "tabs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](tabGroupManager, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v8, v13, v11, 0);

  }
  if (objc_msgSend(v7, "count"))
  {
    pinnedTabsManager = self->_pinnedTabsManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__TabController_moveWBTabs_toTabGroup___block_invoke_2;
    v14[3] = &unk_1E9CF2990;
    v15 = v7;
    v16 = self;
    v17 = v13;
    -[PinnedTabsManager performUpdatesUsingBlock:](pinnedTabsManager, "performUpdatesUsingBlock:", v14);

  }
}

uint64_t __39__TabController_moveWBTabs_toTabGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned");
}

void __39__TabController_moveWBTabs_toTabGroup___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        -[TabController _movePinnedWBTab:toTabGroup:](*(_QWORD *)(a1 + 40), *(void **)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(void **)(a1 + 48));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)pinnedWBTabsForTabGroup:(id)a3
{
  id v4;
  PinnedTabsManager *pinnedTabsManager;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "usesGlobalPinnedTabs"))
  {
    pinnedTabsManager = self->_pinnedTabsManager;
    -[TabController _containerForPinnedTabsInTabGroup:](self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PinnedTabsManager pinnedTabsInContainer:](pinnedTabsManager, "pinnedTabsInContainer:", v6);
  }
  else
  {
    objc_msgSend(v4, "tabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_393);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __41__TabController_pinnedWBTabsForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned");
}

- (void)setTitle:(id)a3 forTabGroupWithUUID:(id)a4
{
  id v6;
  WBTabGroupManager *tabGroupManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  tabGroupManager = self->_tabGroupManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__TabController_setTitle_forTabGroupWithUUID___block_invoke;
  v9[3] = &unk_1E9CF78F8;
  v10 = v6;
  v8 = v6;
  -[WBTabGroupManager updateTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabGroupWithUUID:persist:usingBlock:", a4, 1, v9);

}

uint64_t __46__TabController_setTitle_forTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", *(_QWORD *)(a1 + 32));
}

- (void)setWBTabs:(id)a3 arePinned:(BOOL)a4
{
  id v6;
  PinnedTabsManager *pinnedTabsManager;
  id v8;
  _QWORD v9[4];
  id v10;
  TabController *v11;
  BOOL v12;

  v6 = a3;
  pinnedTabsManager = self->_pinnedTabsManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__TabController_setWBTabs_arePinned___block_invoke;
  v9[3] = &unk_1E9CF1D28;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[PinnedTabsManager performUpdatesUsingBlock:](pinnedTabsManager, "performUpdatesUsingBlock:", v9);

}

void __37__TabController_setWBTabs_arePinned___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "reverseObjectEnumerator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (*(unsigned __int8 *)(a1 + 48) != objc_msgSend(v10, "isPinned")
          && (!*(_BYTE *)(a1 + 48) || objc_msgSend(*(id *)(a1 + 40), "isTabPinnable:", v10)))
        {
          v11 = *(void **)(a1 + 40);
          objc_msgSend(v10, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "tabGroupRelatedToTabWithUUID:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = *(_QWORD *)(a1 + 40);
          v16 = *(void **)(v15 + 48);
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __37__TabController_setWBTabs_arePinned___block_invoke_2;
          v17[3] = &unk_1E9CF7D58;
          v18 = *(_BYTE *)(a1 + 48);
          v17[4] = v10;
          v17[5] = v15;
          objc_msgSend(v16, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v14, 1, v17);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

void __37__TabController_setWBTabs_arePinned___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mutableTabWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v7 = v6;

  objc_msgSend(v7, "setSyncable:", objc_msgSend(v11, "isSyncable"));
  v8 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPinned:title:url:", v8, v9, v10);

  -[TabController _tabGroupTabDidUpdatePinned:inTabGroup:](*(id **)(a1 + 40), v7, v11);
}

- (id)tabGroupRelatedToTabWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBTabGroupManager *tabGroupManager;
  void *v8;
  uint64_t v9;
  void *v10;
  char v12;
  WBWindowState *windowState;
  id WeakRetained;
  void *v15;

  v4 = a3;
  -[WBTabGroupManager tabWithUUID:](self->_tabGroupManager, "tabWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    tabGroupManager = self->_tabGroupManager;
    objc_msgSend(v5, "tabGroupUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager tabGroupWithUUID:](tabGroupManager, "tabGroupWithUUID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PinnedTabsManager containerForTabWithUUID:](self->_pinnedTabsManager, "containerForTabWithUUID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isInDefaultProfile"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(v8, "activeProfileIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "existingUnnamedTabGroupForProfileWithIdentifier:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    v12 = objc_msgSend(v8, "isPrivateBrowsingEnabled");
    windowState = self->_windowState;
    if ((v12 & 1) != 0)
      -[WBWindowState privateTabGroup](windowState, "privateTabGroup");
    else
      -[WBWindowState localTabGroup](windowState, "localTabGroup");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_4:

  return v10;
}

uint64_t __59__TabController_updateLastSelectedTabUUIDForClosingWBTabs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLastSelectedTabUUID:", *(_QWORD *)(a1 + 32));
}

- (id)wbTabWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[WBTabGroupManager tabWithUUID:](self->_tabGroupManager, "tabWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PinnedTabsManager tabWithUUID:](self->_pinnedTabsManager, "tabWithUUID:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)_updateTabsWithPinnedTabs:(unsigned int)a3 persist:
{
  id v5;
  id v6;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(a1, "pinnedTabs");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TabController _replaceTabs:withTabs:persist:](a1, v6, v5, a3);

  }
}

- (void)reorderPinnedTabsIntoPlace
{
  void *v3;
  int v4;
  id v5;

  -[TabController activeTabGroup](self, "activeTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSyncable");

  if (v4)
  {
    -[TabController pinnedTabs](self, "pinnedTabs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[TabController _updateTabsWithPinnedTabs:persist:](self, v5, 1u);

  }
}

- (void)pinnedTabsManager:(id)a3 didUpdatePinnedTabs:(id)a4 isPrivate:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  char v8;
  id v9;

  v5 = a5;
  v9 = a4;
  if (-[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled") == v5)
  {
    -[TabController activeTabGroup](self, "activeTabGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSyncable");

    if ((v8 & 1) == 0 && (v5 || -[TabController isInDefaultProfile](self, "isInDefaultProfile")))
      -[TabController _updateTabsWithPinnedWBTabs:](self, v9);
  }

}

- (void)_updateTabsWithPinnedWBTabs:(void *)a1
{
  void *v3;
  _QWORD v4[5];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__TabController__updateTabsWithPinnedWBTabs___block_invoke;
    v4[3] = &unk_1E9CF8890;
    v4[4] = a1;
    objc_msgSend(a2, "safari_mapObjectsUsingBlock:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController _updateTabsWithPinnedTabs:persist:](a1, v3, 0);

  }
}

- (void)pinnedTabsManager:(id)a3 didUpdatePinnedTabs:(id)a4 inProfileWithIdentifier:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  BOOL v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[TabController activeProfileIdentifier](self, "activeProfileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if ((v9 & 1) == 0)
    goto LABEL_6;
  -[TabController activeTabGroup](self, "activeTabGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "usesGlobalPinnedTabs") & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v11 = -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled");

  if (!v11)
    -[TabController _updateTabsWithPinnedWBTabs:](self, v12);
LABEL_7:

}

id __45__TabController__updateTabsWithPinnedWBTabs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  objc_msgSend(v4, "tabWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[TabController _tabForWBTab:](*(id **)(a1 + 32), v3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "setPinned:", 1);
  objc_msgSend(v11, "setWBTab:", v3);

  return v11;
}

uint64_t __29__TabController_hasUnreadTab__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isUnread");
}

- (void)attemptToSelectTabGroupFromShare:(id)a3
{
  void *v4;
  void *v5;

  -[WBTabGroupManager tabGroupMatchingShare:](self->_tabGroupManager, "tabGroupMatchingShare:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[TabController _selectAcceptedSharedTabGroup:]((uint64_t)self, v4);
    v4 = v5;
  }
  self->_didSelectAcceptedSharedTabGroup = v4 != 0;

}

- (void)_selectAcceptedSharedTabGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v3 = a2;
    -[TabController _markAllTabsInTabGroupAsRead:](a1, v3);
    objc_msgSend(v3, "profileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setActiveProfileIdentifier:", v4);

    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setActiveTabGroupUUID:", v5);

    objc_msgSend((id)a1, "currentTabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setActiveTab:", v7);

    objc_msgSend(*(id *)(a1 + 72), "tabSwitcherViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsScrollToTabGroup:", v3);

    *(_BYTE *)(a1 + 248) = 1;
  }
}

- (void)displayAlreadyAcceptedSharedTabGroupWithUUID:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController didFetchRecentlyAcceptedSharedTabGroupWithUUID:acceptedShareDate:](self, "didFetchRecentlyAcceptedSharedTabGroupWithUUID:acceptedShareDate:", v5, v6);

}

- (void)didFetchRecentlyAcceptedSharedTabGroupWithUUID:(id)a3 acceptedShareDate:(id)a4
{
  id v6;
  id v7;
  WBTabGroupManager *tabGroupManager;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (!self->_didSelectAcceptedSharedTabGroup)
  {
    objc_initWeak(&location, self);
    tabGroupManager = self->_tabGroupManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__TabController_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke;
    v9[3] = &unk_1E9CF1BF8;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    -[WBTabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:](tabGroupManager, "reloadTabGroupsFromDatabaseWithCompletionHandler:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __82__TabController_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = (uint64_t *)(a1 + 32);
    objc_msgSend(WeakRetained, "tabGroupWithUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[TabController _selectAcceptedSharedTabGroup:]((uint64_t)v3, v6);
    }
    else
    {
      v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __82__TabController_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke_cold_1(v4, v7, v8);
    }

  }
}

- (id)representativeURLForTabGroupConfirmationAlert:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "tabGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _urlForActiveTabInTabGroup:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tabGroupConfirmationAlertDidBeginDismissal:(id)a3
{
  id WeakRetained;

  if (objc_msgSend(a3, "role") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "closePreviewDocument");

  }
}

- (void)clearHiddenTabForExplanationView
{
  TabDocument *tabDocumentBeingHiddenFromTabView;

  tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
  self->_tabDocumentBeingHiddenFromTabView = 0;

}

- (void)clearTabsClosedWhileTabViewPresentedCount
{
  self->_tabsClosedWhileTabViewPresentedCount = 0;
}

- (void)openNewTabWithCompletionHandler:(id)a3
{
  -[TabController openNewTabWithOptions:completionHandler:](self, "openNewTabWithOptions:completionHandler:", 0, a3);
}

- (void)insertTabWithUUIDForNavigation:(id)a3
{
  uint64_t v4;
  TabDocument *tabDocumentBeingHiddenFromTabView;
  _BOOL4 v6;
  TabDocument *v7;
  char v8;
  TabDocument *v9;
  id v10;

  -[TabController tabWithUUID:](self, "tabWithUUID:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
    if (!tabDocumentBeingHiddenFromTabView
      || (v6 = -[TabDocument isPrivateBrowsingEnabled](tabDocumentBeingHiddenFromTabView, "isPrivateBrowsingEnabled"),
          v6 != -[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
      || (v9 = self->_tabDocumentBeingHiddenFromTabView,
          v7 = self->_tabDocumentBeingHiddenFromTabView,
          self->_tabDocumentBeingHiddenFromTabView = 0,
          v7,
          (v4 = (uint64_t)v9) == 0))
    {
      if (-[TabController isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))
        v8 = 2;
      else
        v8 = 1;
      -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:]((id *)&self->super.isa, v8, 1, 0);
      v4 = objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = (id)v4;
  -[TabController setActiveTab:](self, "setActiveTab:", v4);

}

- (NSString)activeTabGroupUUID
{
  return self->_activeTabGroupUUID;
}

- (PinnedTabsManager)pinnedTabsManager
{
  return self->_pinnedTabsManager;
}

- (TabDocument)privateActiveTabDocument
{
  return self->_privateActiveTabDocument;
}

- (void)setPrivateActiveTabDocument:(id)a3
{
  objc_storeStrong((id *)&self->_privateActiveTabDocument, a3);
}

- (TabDocument)normalActiveTabDocument
{
  return self->_normalActiveTabDocument;
}

- (void)setNormalActiveTabDocument:(id)a3
{
  objc_storeStrong((id *)&self->_normalActiveTabDocument, a3);
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (int64_t)privateBrowsingMode
{
  return self->_privateBrowsingMode;
}

- (WBSTabOrderManager)tabOrderManager
{
  return self->_tabOrderManager;
}

- (NSUUID)browserWindowUUID
{
  return self->_browserWindowUUID;
}

- (int64_t)tabDisplayMode
{
  return self->_tabDisplayMode;
}

- (void)setTabDisplayMode:(int64_t)a3
{
  self->_tabDisplayMode = a3;
}

- (BOOL)shouldTogglePrivateBrowsingOnSplit
{
  return self->_shouldTogglePrivateBrowsingOnSplit;
}

- (void)setShouldTogglePrivateBrowsingOnSplit:(BOOL)a3
{
  self->_shouldTogglePrivateBrowsingOnSplit = a3;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (_SWCollaborationButtonView)tabOverviewCollaborationButton
{
  return self->_tabOverviewCollaborationButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabOverviewCollaborationButton, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_browserWindowUUID, 0);
  objc_storeStrong((id *)&self->_tabOrderManager, 0);
  objc_storeStrong((id *)&self->_normalActiveTabDocument, 0);
  objc_storeStrong((id *)&self->_privateActiveTabDocument, 0);
  objc_storeStrong((id *)&self->_pinnedTabsManager, 0);
  objc_storeStrong((id *)&self->_windowState, 0);
  objc_storeStrong((id *)&self->_fluidTabOverviewViewController, 0);
  objc_storeStrong((id *)&self->_cachedShareConfigurationsByTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_expandedTabGroupUUIDs, 0);
  objc_storeStrong((id *)&self->_contextCompleter, 0);
  objc_storeStrong((id *)&self->_tabGroupSuggestions, 0);
  objc_storeStrong((id *)&self->_tabDocumentsThatShouldSuppressOnCreatedEvents, 0);
  objc_storeStrong((id *)&self->_libraryTabs, 0);
  objc_storeStrong((id *)&self->_activeLibraryTab, 0);
  objc_storeStrong((id *)&self->_veryRecentlyClosedTabCountInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_undoGroup, 0);
  objc_storeStrong((id *)&self->_originalToReplacementUUIDMap, 0);
  objc_storeStrong((id *)&self->_documentObserversToReceiveUpdatesDidEnd, 0);
  objc_storeStrong((id *)&self->_documentObservers, 0);
  objc_storeStrong((id *)&self->_uuidToTabMap, 0);
  objc_storeStrong((id *)&self->_updateContinuityTimer, 0);
  objc_storeStrong((id *)&self->_tabCollectionViewManager, 0);
  objc_storeStrong((id *)&self->_activeTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_tabDocumentBeingHiddenFromTabView, 0);
  objc_storeStrong((id *)&self->_mutablePrivateTabs, 0);
  objc_storeStrong((id *)&self->_mutableNormalTabs, 0);
  objc_destroyWeak((id *)&self->_browserController);
}

- (void)saveStateInBackground:(BOOL)a3 needsValidate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  v4 = a3;
  if (+[WBUFeatureManager accessLevel](FeatureManager, "accessLevel", a3, a4) == 2)
    -[TabController updateEducationTabsLastSyncDate](self, "updateEducationTabsLastSyncDate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (objc_msgSend(WeakRetained, "isShowingReader"))
  {
    -[TabController activeTabDocument](self, "activeTabDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "verticalScrollOffsetForReaderViewInTabDocument:", v6);
    v8 = v7;
    -[TabController activeTabDocument](self, "activeTabDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReaderViewTopScrollOffset:", (uint64_t)v8);

  }
  objc_msgSend(WeakRetained, "tabGroupManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "windowState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveWindowState:completionHandler:", v11, 0);

  -[TabController persistAllCurrentTabsInBackground:](self, "persistAllCurrentTabsInBackground:", v4);
}

- (void)persistAllCurrentTabsInBackground:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[TabController activeTabGroup](self, "activeTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "usesGlobalPinnedTabs"))
    -[TabController unpinnedTabs](self, "unpinnedTabs");
  else
    -[TabController currentTabs](self, "currentTabs");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[TabController persistTabs:inTabGroupWithUUID:inBackground:](self, "persistTabs:inTabGroupWithUUID:inBackground:", v6, self->_activeTabGroupUUID, v3);
}

- (void)persistTab:(id)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WBTabGroupManager *tabGroupManager;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  tabGroupManager = self->_tabGroupManager;
  v11 = v6;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tabUpdateBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager updateTabWithUUID:persist:notify:usingBlock:](tabGroupManager, "updateTabWithUUID:persist:notify:usingBlock:", v9, 1, v4, v10);

}

- (void)saveStateInBackground:(BOOL)a3
{
  -[TabController saveStateInBackground:needsValidate:](self, "saveStateInBackground:needsValidate:", a3, 0);
}

- (uint64_t)_didCompleteStateRestoration
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (result)
  {
    v1 = (void *)result;
    -[TabController tabCollectionViewManager](result);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "activeTabDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateTabBarAnimated:keepingTabVisible:", 0, v3);

    -[TabController tabCollectionViewManager]((uint64_t)v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateTabOverviewItems");

    return objc_msgSend(v1, "updateHibernatedTabDocumentsSavingState");
  }
  return result;
}

- (TabDocument)_activeTabDocumentForTabGroup:(TabDocument *)a1
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
  void *v12;
  uint64_t v13;

  v3 = a2;
  if (a1)
  {
    -[TabDocument windowState](a1, "windowState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupsToActiveTabs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    -[TabDocument tabWithUUID:](a1, "tabWithUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_11:
      -[TabController _unhibernateTabIfNeeded:](a1, v9);
      a1 = (TabDocument *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    if (objc_msgSend(v3, "isPrivateBrowsing"))
    {
      -[TabDocument privateUnpinnedTabs](a1, "privateUnpinnedTabs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[TabDocument privateTabs](a1, "privateTabs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v9 = (void *)v13;

        goto LABEL_10;
      }
    }
    else
    {
      -[TabDocument normalUnpinnedTabs](a1, "normalUnpinnedTabs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[TabDocument normalTabs](a1, "normalTabs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v11 = v11;
    v9 = v11;
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:

  return a1;
}

- (id)_mutableTabsForTabGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  char v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  char v14;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "isPrivateBrowsing");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v4, "tabs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__TabController_Persistence___mutableTabsForTabGroup___block_invoke;
    v12[3] = &unk_1E9CF8BC8;
    v12[4] = a1;
    v8 = WeakRetained;
    v13 = v8;
    v14 = v5;
    objc_msgSend(v7, "safari_mapObjectsUsingBlock:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __54__TabController_Persistence___mutableTabsForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  HibernatedTab *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  objc_msgSend(v4, "tabWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "restoreStateFromTab:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "allowsUnlimitedTabs");

    if (v10)
      v11 = -[HibernatedTab initWithWBTab:browserController:]([HibernatedTab alloc], "initWithWBTab:browserController:", v3, *(_QWORD *)(a1 + 40));
    else
      v11 = -[TabDocument initWithTabGroupTab:privateBrowsingEnabled:hibernated:bookmark:browserController:]([TabDocument alloc], "initWithTabGroupTab:privateBrowsingEnabled:hibernated:bookmark:browserController:", v3, *(unsigned __int8 *)(a1 + 48), 1, 0, *(_QWORD *)(a1 + 40));
    v8 = v11;
  }
  objc_msgSend(v8, "updateTabIconWithDelay:", 0.4);

  return v8;
}

- (_BYTE)_focusedTabGroupForWindowState:(_BYTE *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend(a1, "isPrivateBrowsingEnabled") & 1) != 0)
    {
      a1 = 0;
    }
    else
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "needsFocusedTabGroupUpdate") & 1) != 0)
      {
        objc_msgSend(a1, "focusedTabGroup");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
          goto LABEL_15;
        if (a1[64])
          objc_msgSend(v4, "setNeedsFocusedTabGroupUpdate:", 0);
        if ((objc_msgSend(v3, "newlyCreated") & 1) != 0
          || (objc_msgSend(a1, "isTabGroupActive:", v5) & 1) != 0
          || objc_msgSend(v4, "prefersSingleWindow"))
        {
          v6 = (id)WBS_LOG_CHANNEL_PREFIXSiriLink();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v3, "uuid");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "uuid");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = 138543618;
            v11 = v7;
            v12 = 2114;
            v13 = v8;
            _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "Initiate window %{public}@ with FTG %{public}@", (uint8_t *)&v10, 0x16u);

          }
          a1 = v5;
        }
        else
        {
LABEL_15:
          a1 = 0;
        }

      }
      else
      {
        a1 = 0;
      }

    }
  }

  return a1;
}

- (id)_activeTabGroupForWindowState:(void *)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(a1, "isPrivateBrowsingEnabled"))
    {
      objc_msgSend(v3, "privateTabGroup");
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a1)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(v3, "activeTabGroupUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tabGroupWithUUID:", v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a1)
      {
LABEL_6:
        objc_msgSend(v3, "localTabGroup");
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return a1;
}

- (BOOL)readState
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *activeTabGroupUUID;
  uint64_t v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *mutableNormalTabs;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  NSMutableArray *mutablePrivateTabs;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[5];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[TabController windowState](self, "windowState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _activeTabGroupForWindowState:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController _focusedTabGroupForWindowState:](self, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  if (!-[TabController isTabGroupActive:](self, "isTabGroupActive:", v9) || !self->_didReadWindowState)
  {
    if (self->_activeTabGroupUUID)
    {
      -[TabController tabGroupManager](self, "tabGroupManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endParticipantPresenceReportingForTabGroupWithUUID:", self->_activeTabGroupUUID);

    }
    v11 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "privacyPreservingDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = (uint64_t)v12;
      _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "Read active tab group from saved state: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v9, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSString *)objc_msgSend(v13, "copy");
    activeTabGroupUUID = self->_activeTabGroupUUID;
    self->_activeTabGroupUUID = v14;

    v16 = objc_msgSend(v9, "isPrivateBrowsing");
    objc_msgSend(WeakRetained, "setPrivateBrowsingEnabled:", v16);
    if ((_DWORD)v16)
    {
      objc_msgSend(v4, "localTabGroup");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v9;
    }
    v18 = v17;
    -[TabController _mutableTabsForTabGroup:]((uint64_t)self, v17);
    v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    mutableNormalTabs = self->_mutableNormalTabs;
    self->_mutableNormalTabs = v19;

    v21 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = -[NSMutableArray count](self->_mutableNormalTabs, "count");
      *(_DWORD *)buf = 134217984;
      v36 = v22;
      _os_log_impl(&dword_1D7CA3000, v21, OS_LOG_TYPE_DEFAULT, "Read %zu normal tabs from saved state", buf, 0xCu);
    }

    if (!self->_didReadWindowState)
    {
      objc_msgSend(v4, "privateTabGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController _mutableTabsForTabGroup:]((uint64_t)self, v23);
      v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      mutablePrivateTabs = self->_mutablePrivateTabs;
      self->_mutablePrivateTabs = v24;

      v26 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[NSMutableArray count](self->_mutablePrivateTabs, "count");
        *(_DWORD *)buf = 134217984;
        v36 = v27;
        _os_log_impl(&dword_1D7CA3000, v26, OS_LOG_TYPE_DEFAULT, "Read %zu private tabs from saved state", buf, 0xCu);
      }

    }
    if (objc_msgSend(v9, "usesGlobalPinnedTabs"))
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __39__TabController_Persistence__readState__block_invoke;
      v34[3] = &unk_1E9CF31B0;
      v34[4] = self;
      -[TabController _performWithFixedTabBarItems:]((uint64_t)self, v34);
    }
    -[TabController _activeTabDocumentForTabGroup:]((TabDocument *)self, v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController setNormalActiveTabDocument:](self, "setNormalActiveTabDocument:", v28);

    if (!self->_didReadWindowState)
    {
      objc_msgSend(v4, "privateTabGroup");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController _activeTabDocumentForTabGroup:]((TabDocument *)self, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabController setPrivateActiveTabDocument:](self, "setPrivateActiveTabDocument:", v30);

    }
    -[TabController openInitialBlankTabDocumentIfNeeded](self, "openInitialBlankTabDocumentIfNeeded");
    -[TabController tabCollectionViewManager]((uint64_t)self);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "updateSnapshotIdentifiers");

    -[TabController _didCompleteStateRestoration]((uint64_t)self);
    self->_didReadWindowState = 1;
    if (self->_activeTabGroupUUID)
    {
      -[TabController tabGroupManager](self, "tabGroupManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "beginParticipantPresenceReportingForTabGroupWithUUID:", self->_activeTabGroupUUID);

    }
  }

  return 1;
}

void __39__TabController_Persistence__readState__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pinnedTabsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPinnedTabsObserver:", *(_QWORD *)(a1 + 32));

}

- (void)persistActiveTabGroupOrTabGroupVisibleInSwitcher
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  -[TabController activeTabGroupOrTabGroupVisibleInSwitcher](self, "activeTabGroupOrTabGroupVisibleInSwitcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController windowState](self, "windowState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActiveTabGroupUUID:", v4);

  -[WBTabGroupManager saveWindowState:completionHandler:](self->_tabGroupManager, "saveWindowState:completionHandler:", v3, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "writePrivateBrowsingEnabled:", objc_msgSend(v6, "isPrivateBrowsing"));

}

- (void)_insertTab:(char)a1 atIndex:(NSObject *)a2 inBackground:animated:updateUI:.cold.1(char a1, NSObject *a2)
{
  __CFString *v3;
  __CFString *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = v3;
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1D7CA3000, a2, OS_LOG_TYPE_FAULT, "Active tab document is not present in the list of tab documents; private browsing enabled: %{public}@",
    v5,
    0xCu);

  OUTLINED_FUNCTION_3();
}

void __74__TabController__tabGroupShareSheetWithTabGroupActivityItemConfiguration___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Tab group share sheet failed: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __47__TabController__requestContactsAccessIfNeeded__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Failed to obtain contacts access: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)focusedTabGroup
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1D7CA3000, v0, v1, "Couldn't find FTG %{public}@", v2);
}

- (void)_selectNewTabGroupIfNecessaryBeforeClosingTabGroup:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D7CA3000, v3, v4, "Attempt to delete nonexistent tabGroup: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __82__TabController_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_2(&dword_1D7CA3000, a2, a3, "Recently accepted shared Tab Group with UUID %{public}@ was nil after reload.", (uint8_t *)&v4);
}

@end
