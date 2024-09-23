@implementation TabBarManager

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5
{
  -[TabBarManager _setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "_setItemArrangement:animated:keepingItemVisible:completionHandler:", a3, a4, a5, 0);
}

- (void)_setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  UnifiedTabBar *inlineTabBar;
  void *v20;
  UnifiedTabBar *standaloneTabBar;
  void *v22;
  id v23;
  _QWORD block[4];
  void (**v25)(_QWORD);
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  objc_storeStrong((id *)&self->_itemArrangement, a3);
  if (self->_inlineTabBar)
  {
    v14 = dispatch_group_create();
    v15 = v14;
    v16 = MEMORY[0x1E0C809B0];
    if (self->_inlineTabBar)
    {
      dispatch_group_enter(v14);
      -[TabBarManager _inlineItemArrangementForItemArrangement:displayMode:](self, "_inlineItemArrangementForItemArrangement:displayMode:", v11, self->_displayMode);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v11;
      v18 = v8
         && -[TabBarManager _canAnimateInlineTabBarForTransitionToItemArrangement:](self, "_canAnimateInlineTabBarForTransitionToItemArrangement:", v11);
      inlineTabBar = self->_inlineTabBar;
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke;
      v28[3] = &unk_1E9CF1900;
      v29 = v15;
      -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](inlineTabBar, "setItemArrangement:animated:keepingItemVisible:completionHandler:", v17, v18, v12, v28);

      v11 = v23;
    }
    if (self->_standaloneTabBar)
    {
      dispatch_group_enter(v15);
      -[TabBarManager standaloneItemArrangementForItemArrangement:displayMode:](self, "standaloneItemArrangementForItemArrangement:displayMode:", v11, self->_displayMode);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (v12)
          v8 = 1;
        else
          v8 = -[TabBarManager _canAnimateStandaloneTabBarForTransitionToItemArrangement:](self, "_canAnimateStandaloneTabBarForTransitionToItemArrangement:", v20);
      }
      standaloneTabBar = self->_standaloneTabBar;
      objc_msgSend(v12, "secondaryItem", v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v16;
      v26[1] = 3221225472;
      v26[2] = __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2;
      v26[3] = &unk_1E9CF1900;
      v27 = v15;
      -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](standaloneTabBar, "setItemArrangement:animated:keepingItemVisible:completionHandler:", v20, v8, v22, v26);

    }
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_3;
    block[3] = &unk_1E9CF1950;
    v25 = v13;
    dispatch_group_notify(v15, MEMORY[0x1E0C80D38], block);

  }
  else if (v13)
  {
    v13[2](v13);
  }

}

- (void)setHiddenItems:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenItems, a3);
}

- (UnifiedTabBar)standaloneTabBar
{
  return self->_standaloneTabBar;
}

- (UnifiedTabBar)effectiveTabBar
{
  int64_t displayMode;
  uint64_t v3;

  displayMode = self->_displayMode;
  if (displayMode == 1)
  {
    v3 = 64;
    return (UnifiedTabBar *)*(id *)((char *)&self->super.isa + v3);
  }
  if (displayMode == 2)
  {
    v3 = 72;
    return (UnifiedTabBar *)*(id *)((char *)&self->super.isa + v3);
  }
  return (UnifiedTabBar *)0;
}

- (UnifiedTabBar)inlineTabBar
{
  return self->_inlineTabBar;
}

- (SFLockdownStatusBar)lockdownStatusBar
{
  return self->_lockdownStatusBar;
}

- (void)setShowingLockdownStatusBar:(BOOL)a3
{
  SFLockdownStatusBar *v4;
  SFLockdownStatusBar *lockdownStatusBar;

  if (self->_showingLockdownStatusBar != a3)
  {
    self->_showingLockdownStatusBar = a3;
    if (a3)
    {
      v4 = (SFLockdownStatusBar *)objc_alloc_init(MEMORY[0x1E0D4ECC0]);
      lockdownStatusBar = self->_lockdownStatusBar;
      self->_lockdownStatusBar = v4;
    }
    else
    {
      lockdownStatusBar = self->_lockdownStatusBar;
      self->_lockdownStatusBar = 0;
    }

    -[TabBarManager _updateUnifiedBarContentArrangement](self, "_updateUnifiedBarContentArrangement");
  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (SFUnifiedTabBarItemArrangement)itemArrangement
{
  return self->_itemArrangement;
}

- (void)scrollToActiveItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SFUnifiedTabBarItemArrangement *itemArrangement;
  id v6;

  v3 = a3;
  itemArrangement = self->_itemArrangement;
  -[SFUnifiedTabBarItemArrangement activeItem](itemArrangement, "activeItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TabBarManager setItemArrangement:animated:keepingItemVisible:](self, "setItemArrangement:animated:keepingItemVisible:", itemArrangement, v3, v6);

}

- (_SFFluidProgressView)minimizedProgressView
{
  return self->_minimizedProgressView;
}

- (void)setSuppressesStandaloneTabBar:(BOOL)a3
{
  if (self->_suppressesStandaloneTabBar != a3)
  {
    self->_suppressesStandaloneTabBar = a3;
    -[TabBarManager _updateUsesStandaloneTabBar](self, "_updateUsesStandaloneTabBar");
    -[TabBarManager _updateUnifiedBarContentArrangement](self, "_updateUnifiedBarContentArrangement");
    -[TabBarManager _configureStandaloneTabBar](self, "_configureStandaloneTabBar");
  }
}

- (TabBarManager)init
{
  TabBarManager *v2;
  SFUnifiedTabBarItemArrangement *v3;
  SFUnifiedTabBarItemArrangement *itemArrangement;
  uint64_t v5;
  NSHashTable *observers;
  _SFFluidProgressView *v7;
  _SFFluidProgressView *minimizedProgressView;
  TabBarManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TabBarManager;
  v2 = -[TabBarManager init](&v11, sel_init);
  if (v2)
  {
    v3 = (SFUnifiedTabBarItemArrangement *)objc_alloc_init(MEMORY[0x1E0D4EEC8]);
    itemArrangement = v2->_itemArrangement;
    v2->_itemArrangement = v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v7 = (_SFFluidProgressView *)objc_alloc_init(MEMORY[0x1E0D4EF60]);
    minimizedProgressView = v2->_minimizedProgressView;
    v2->_minimizedProgressView = v7;

    v9 = v2;
  }

  return v2;
}

- (void)_updateUsesStandaloneTabBar
{
  _BOOL8 v2;

  v2 = self->_displayMode == 2 && !self->_suppressesStandaloneTabBar;
  -[TabBarManager _setUsesStandaloneTabBar:](self, "_setUsesStandaloneTabBar:", v2);
}

- (void)_updateUnifiedBarContentArrangement
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_addObjectUnlessNil:", self->_lockdownStatusBar);
  objc_msgSend(v5, "safari_addObjectUnlessNil:", self->_bookmarksBar);
  objc_msgSend(v5, "safari_addObjectUnlessNil:", self->_standaloneTabBar);
  if (self->_standaloneTabBar)
    v3 = 2;
  else
    v3 = self->_suppressesStandaloneTabBar && self->_displayMode == 2;
  -[SFUnifiedBar setMarginLevel:](self->_unifiedBar, "setMarginLevel:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EEA8]), "initWithInlineContentView:standaloneContentViews:", self->_inlineTabBar, v5);
  -[SFUnifiedBar setContentArrangement:](self->_unifiedBar, "setContentArrangement:", v4);

}

- (void)_setUsesStandaloneTabBar:(BOOL)a3
{
  UnifiedTabBar *standaloneTabBar;
  UnifiedTabBar *v5;
  UnifiedTabBar *v6;

  standaloneTabBar = self->_standaloneTabBar;
  if ((((standaloneTabBar == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      -[TabBarManager createStandaloneTabBar](self, "createStandaloneTabBar");
      v5 = (UnifiedTabBar *)objc_claimAutoreleasedReturnValue();
      v6 = self->_standaloneTabBar;
      self->_standaloneTabBar = v5;

      -[TabBarManager _notifyDidCreateTabBar:](self, "_notifyDidCreateTabBar:", self->_standaloneTabBar);
    }
    else
    {
      self->_standaloneTabBar = 0;

    }
  }
}

- (void)_configureStandaloneTabBar
{
  UnifiedTabBar *standaloneTabBar;
  void *v4;
  void *v5;

  standaloneTabBar = self->_standaloneTabBar;
  if (standaloneTabBar)
  {
    -[TabBarManager standaloneItemArrangementForItemArrangement:displayMode:](self, "standaloneItemArrangementForItemArrangement:displayMode:", self->_itemArrangement, self->_displayMode);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](standaloneTabBar, "setItemArrangement:animated:keepingItemVisible:completionHandler:", v4, 0, v5, 0);

    -[SFUnifiedTabBar setNavigationDelegate:](self->_standaloneTabBar, "setNavigationDelegate:", self->_unifiedBar);
  }
}

- (void)setUnifiedBar:(id)a3
{
  id v5;
  UnifiedBar *v6;

  v6 = (UnifiedBar *)a3;
  if (self->_unifiedBar != v6)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D4EEA8]);
    -[SFUnifiedBar setContentArrangement:](self->_unifiedBar, "setContentArrangement:", v5);

    objc_storeStrong((id *)&self->_unifiedBar, a3);
    -[SFUnifiedTabBar setNavigationDelegate:](self->_inlineTabBar, "setNavigationDelegate:", v6);
    -[SFUnifiedTabBar setNavigationDelegate:](self->_standaloneTabBar, "setNavigationDelegate:", v6);
    -[TabBarManager _updateUnifiedBarContentArrangement](self, "_updateUnifiedBarContentArrangement");
  }

}

- (void)setDisplayMode:(int64_t)a3
{
  UnifiedTabBar *cachedInlineTabBar;
  void *v6;
  void *v7;
  UnifiedTabBar *inlineTabBar;
  void *v9;
  void *v10;

  if (self->_displayMode != a3)
  {
    self->_displayMode = a3;
    cachedInlineTabBar = self->_cachedInlineTabBar;
    -[TabBarManager _setUsesInlineTabBar:](self, "_setUsesInlineTabBar:", (unint64_t)(a3 - 1) < 2);
    -[TabBarManager _updateUsesStandaloneTabBar](self, "_updateUsesStandaloneTabBar");
    -[TabBarManager _updateUnifiedBarContentArrangement](self, "_updateUnifiedBarContentArrangement");
    if (self->_inlineTabBar)
    {
      if (cachedInlineTabBar)
      {
        v6 = 0;
      }
      else
      {
        -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[UnifiedTabBar window](self->_inlineTabBar, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        -[UnifiedTabBar layoutIfNeeded](self->_inlineTabBar, "layoutIfNeeded");
      inlineTabBar = self->_inlineTabBar;
      -[TabBarManager _inlineItemArrangementForItemArrangement:displayMode:](self, "_inlineItemArrangementForItemArrangement:displayMode:", self->_itemArrangement, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](inlineTabBar, "setItemArrangement:animated:keepingItemVisible:completionHandler:", v9, 0, v6, 0);

      -[SFUnifiedTabBar setRole:](self->_inlineTabBar, "setRole:", a3 == 2);
      -[SFUnifiedTabBar setNavigationDelegate:](self->_inlineTabBar, "setNavigationDelegate:", self->_unifiedBar);
      -[SFUnifiedTabBar tabHoverPreviewController](self->_inlineTabBar, "tabHoverPreviewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0);

      -[SFUnifiedTabBar setSearchFieldShowsFormatMenuButtonAccessories:](self->_inlineTabBar, "setSearchFieldShowsFormatMenuButtonAccessories:", _SFDeviceIsPad() ^ 1);
      -[SFUnifiedTabBar setMinimizedProgressView:](self->_inlineTabBar, "setMinimizedProgressView:", self->_minimizedProgressView);

    }
    -[TabBarManager _configureStandaloneTabBar](self, "_configureStandaloneTabBar");
    -[SFUnifiedBar setShowsSeparator:](self->_unifiedBar, "setShowsSeparator:", a3 == 2);
    -[TabBarManager _notifyDidUpdateDisplayMode](self, "_notifyDidUpdateDisplayMode");
  }
}

- (void)setBookmarksBar:(id)a3
{
  BookmarksBarView *v5;
  BookmarksBarView *v6;

  v5 = (BookmarksBarView *)a3;
  if (self->_bookmarksBar != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bookmarksBar, a3);
    -[TabBarManager _updateUnifiedBarContentArrangement](self, "_updateUnifiedBarContentArrangement");
    v5 = v6;
  }

}

- (void)_setUsesInlineTabBar:(BOOL)a3
{
  UnifiedTabBar *inlineTabBar;
  UnifiedTabBar **p_inlineTabBar;
  UnifiedTabBar **p_cachedInlineTabBar;
  UnifiedTabBar *v7;
  UnifiedTabBar *v8;
  UnifiedTabBar *cachedInlineTabBar;

  p_inlineTabBar = &self->_inlineTabBar;
  inlineTabBar = self->_inlineTabBar;
  if ((((inlineTabBar == 0) ^ a3) & 1) == 0)
  {
    p_cachedInlineTabBar = &self->_cachedInlineTabBar;
    if (a3)
    {
      if (*p_cachedInlineTabBar)
        v7 = *p_cachedInlineTabBar;
      else
        v7 = objc_alloc_init(UnifiedTabBar);
      v8 = self->_inlineTabBar;
      self->_inlineTabBar = v7;

      -[SFUnifiedTabBar setShowsSquishedTitleContainer:](self->_inlineTabBar, "setShowsSquishedTitleContainer:", 1);
      -[SFUnifiedTabBar setRole:](self->_inlineTabBar, "setRole:", self->_displayMode == 2);
      cachedInlineTabBar = self->_cachedInlineTabBar;
      if (cachedInlineTabBar)
        goto LABEL_10;
      -[TabBarManager _notifyDidCreateTabBar:](self, "_notifyDidCreateTabBar:", self->_inlineTabBar);
    }
    else
    {
      objc_storeStrong((id *)&self->_cachedInlineTabBar, inlineTabBar);
      p_cachedInlineTabBar = p_inlineTabBar;
    }
    cachedInlineTabBar = *p_cachedInlineTabBar;
LABEL_10:
    *p_cachedInlineTabBar = 0;

  }
}

- (id)createStandaloneTabBar
{
  UnifiedTabBar *v2;

  v2 = objc_alloc_init(UnifiedTabBar);
  -[SFUnifiedTabBar setRole:](v2, "setRole:", 2);
  -[UnifiedTabBar setMaximumContentSizeCategory:](v2, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
  return v2;
}

- (void)setItemArrangement:(id)a3
{
  -[TabBarManager _setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "_setItemArrangement:animated:keepingItemVisible:completionHandler:", a3, 0, 0, 0);
}

- (void)setActiveItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SFUnifiedTabBarItemArrangement arrangementWithActiveItem:](self->_itemArrangement, "arrangementWithActiveItem:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TabBarManager _setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "_setItemArrangement:animated:keepingItemVisible:completionHandler:", v6, v4, 0, 0);

}

- (void)setActiveItemIsExpanded:(BOOL)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  SFUnifiedTabBarItemArrangement *itemArrangement;
  id v9;
  id v10;

  v5 = a4;
  v6 = a3;
  itemArrangement = self->_itemArrangement;
  v9 = a5;
  -[SFUnifiedTabBarItemArrangement arrangementWithActiveItemIsExpanded:](itemArrangement, "arrangementWithActiveItemIsExpanded:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TabBarManager _setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "_setItemArrangement:animated:keepingItemVisible:completionHandler:", v10, v5, 0, v9);

}

void __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_inlineItemArrangementForItemArrangement:(id)a3 displayMode:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 2:
      v8 = objc_alloc(MEMORY[0x1E0D4EEC8]);
      objc_msgSend(v7, "activeItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self = (TabBarManager *)objc_msgSend(v8, "initWithItem:activeItemIsExpanded:", v9, objc_msgSend(v7, "activeItemIsExpanded"));

      break;
    case 1:
      objc_msgSend(v6, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __70__TabBarManager__inlineItemArrangementForItemArrangement_displayMode___block_invoke;
      v14[3] = &unk_1E9CF9EC0;
      v14[4] = self;
      objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "activeItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSSet containsObject:](self->_hiddenItems, "containsObject:", v12))
      {

        v12 = 0;
      }
      self = (TabBarManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EEC8]), "initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:", v11, v12, objc_msgSend(v7, "activeItemIsExpanded"), objc_msgSend(v7, "allowsScrollingPinnedItems"));

      break;
    case 0:
      self = (TabBarManager *)objc_alloc_init(MEMORY[0x1E0D4EEC8]);
      break;
  }

  return self;
}

uint64_t __70__TabBarManager__inlineItemArrangementForItemArrangement_displayMode___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", a2) ^ 1;
}

- (id)standaloneItemArrangementForItemArrangement:(id)a3 displayMode:(int64_t)a4
{
  id v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[5];

  v7 = a3;
  v8 = v7;
  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
    {
      objc_msgSend(v7, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __73__TabBarManager_standaloneItemArrangementForItemArrangement_displayMode___block_invoke;
      v16[3] = &unk_1E9CF9EE8;
      v16[4] = self;
      objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "activeItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSSet containsObject:](self->_hiddenItems, "containsObject:", v11))
      {

        v11 = 0;
      }
      v12 = objc_msgSend(v8, "allowsScrollingPinnedItems");
      v13 = objc_alloc(MEMORY[0x1E0D4EEC8]);
      objc_msgSend(v11, "secondaryItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)objc_msgSend(v13, "initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:", v10, v14, 0, v12);

    }
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D4EEC8]);
  }

  return v4;
}

id __73__TabBarManager_standaloneItemArrangementForItemArrangement_displayMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "secondaryItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)_canAnimateInlineTabBarForTransitionToItemArrangement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (self->_displayMode != 2)
    return 1;
  objc_msgSend(a3, "activeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBar itemArrangement](self->_inlineTabBar, "itemArrangement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 == v6;

  return v7;
}

- (BOOL)_canAnimateStandaloneTabBarForTransitionToItemArrangement:(id)a3
{
  UnifiedTabBar *standaloneTabBar;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  standaloneTabBar = self->_standaloneTabBar;
  v4 = a3;
  -[SFUnifiedTabBar itemArrangement](standaloneTabBar, "itemArrangement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToArray:", v7) ^ 1;
  return (char)v4;
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyDidCreateTabBar:(id)a3
{
  id v4;
  NSHashTable *v5;
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
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_msgSend(v10, "tabBarManager:didCreateTabBar:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateDisplayMode
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observers;
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
          objc_msgSend(v8, "tabBarManagerDidUpdateDisplayMode:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (NSSet)hiddenItems
{
  return self->_hiddenItems;
}

- (UnifiedBar)unifiedBar
{
  return self->_unifiedBar;
}

- (BOOL)suppressesStandaloneTabBar
{
  return self->_suppressesStandaloneTabBar;
}

- (BookmarksBarView)bookmarksBar
{
  return self->_bookmarksBar;
}

- (BOOL)showingLockdownStatusBar
{
  return self->_showingLockdownStatusBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimizedProgressView, 0);
  objc_storeStrong((id *)&self->_lockdownStatusBar, 0);
  objc_storeStrong((id *)&self->_bookmarksBar, 0);
  objc_storeStrong((id *)&self->_standaloneTabBar, 0);
  objc_storeStrong((id *)&self->_inlineTabBar, 0);
  objc_storeStrong((id *)&self->_unifiedBar, 0);
  objc_storeStrong((id *)&self->_itemArrangement, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_cachedInlineTabBar, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
