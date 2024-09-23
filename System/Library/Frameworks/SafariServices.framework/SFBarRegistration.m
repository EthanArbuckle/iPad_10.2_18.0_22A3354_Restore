@implementation SFBarRegistration

- (id)_UIBarButtonItemsForArrangedBarItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (self->_layout == 2)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    else
      v5 = 0;
    objc_msgSend(v4, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[SFBarRegistration _UIBarButtonItemForBarItem:](self, "_UIBarButtonItemForBarItem:", objc_msgSend(v14, "integerValue"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

          if (v5 && (objc_msgSend(v14, "isEqual:", v7) & 1) == 0)
            objc_msgSend(v8, "addObject:", v5);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v6 = (void *)objc_msgSend(v8, "copy");
    v4 = v17;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[SFBarRegistration _UIBarButtonItemForBarItem:](self, "_UIBarButtonItemForBarItem:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)setBarItem:(int64_t)a3 menu:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SFBarRegistration UIBarButtonItemForItem:](self, "UIBarButtonItemForItem:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMenu:", v6);

}

- (id)_UIBarButtonItemForBarItem:(int64_t)a3
{
  id v3;
  uint64_t v4;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = 72;
      goto LABEL_13;
    case 1:
      v4 = 96;
      goto LABEL_13;
    case 2:
    case 4:
    case 5:
      return v3;
    case 3:
      v4 = 80;
      goto LABEL_13;
    case 6:
      v4 = 112;
      goto LABEL_13;
    case 7:
      v4 = 104;
      goto LABEL_13;
    case 8:
      v4 = 120;
      goto LABEL_13;
    case 9:
      v4 = 128;
      goto LABEL_13;
    case 10:
      v4 = 136;
      goto LABEL_13;
    case 11:
      v4 = 88;
LABEL_13:
      v3 = *(id *)((char *)&self->super.super.isa + v4);
      break;
    default:
      if ((unint64_t)(a3 + 101) < 2)
      {
        v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", 0, 0, 0, 0);
        objc_msgSend(v3, "setWidth:", 44.0);
      }
      break;
  }
  return v3;
}

- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4
{
  if (a3 == 3)
    -[UIBarButtonItem setSelected:](self->_bookmarksItem, "setSelected:", a4);
}

- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4
{
  int v4;
  NSOrderedSet *arrangedBarItems;
  void *v8;
  NSMutableSet *hiddenBarItems;
  void *v10;
  NSMutableSet *v11;
  id v12;

  v4 = a4;
  arrangedBarItems = self->_arrangedBarItems;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(arrangedBarItems) = -[NSOrderedSet containsObject:](arrangedBarItems, "containsObject:", v8);

  if ((_DWORD)arrangedBarItems)
  {
    hiddenBarItems = self->_hiddenBarItems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(hiddenBarItems) = -[NSMutableSet containsObject:](hiddenBarItems, "containsObject:", v10);

    if ((_DWORD)hiddenBarItems != v4)
    {
      v11 = self->_hiddenBarItems;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v4)
        -[NSMutableSet addObject:](v11, "addObject:", v12);
      else
        -[NSMutableSet removeObject:](v11, "removeObject:", v12);

    }
  }
}

- (void)updateArrangedUIBarButtonItemsIfNeeded
{
  NSOrderedSet *v3;
  NSOrderedSet *lastCommittedArrangedBarItems;
  void *v5;
  id WeakRetained;

  if (-[SFBarRegistration _arrangedBarItemsNeedUpdate](self, "_arrangedBarItemsNeedUpdate"))
  {
    -[SFBarRegistration _effectiveArrangedBarItems](self, "_effectiveArrangedBarItems");
    v3 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    lastCommittedArrangedBarItems = self->_lastCommittedArrangedBarItems;
    self->_lastCommittedArrangedBarItems = v3;

    WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
    -[SFBarRegistration _UIBarButtonItemsForArrangedBarItems:](self, "_UIBarButtonItemsForArrangedBarItems:", self->_lastCommittedArrangedBarItems);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setItems:", v5);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "didChangeArrangedBarItems:", self);

  }
}

- (BOOL)_arrangedBarItemsNeedUpdate
{
  void *v3;
  _BOOL4 v4;

  if (self->_lastCommittedArrangedBarItems)
  {
    -[SFBarRegistration _effectiveArrangedBarItems](self, "_effectiveArrangedBarItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = !-[NSOrderedSet isEqualToOrderedSet:](self->_lastCommittedArrangedBarItems, "isEqualToOrderedSet:", v3);

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)_effectiveArrangedBarItems
{
  id WeakRetained;
  void *v4;
  char v5;
  NSOrderedSet *arrangedBarItems;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_barManager);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  arrangedBarItems = self->_arrangedBarItems;
  if ((v5 & 1) != 0)
  {
    -[NSOrderedSet set](arrangedBarItems, "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "barManager:visibleBarItemsForLayout:availableItems:", WeakRetained, self->_layout, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToSet:", v8) & 1) != 0)
      v9 = 0;
    else
      v9 = v8;

    v11 = (void *)-[NSOrderedSet mutableCopy](self->_arrangedBarItems, "mutableCopy");
    v10 = v11;
    if (v9)
    {
      objc_msgSend(v11, "intersectSet:", v9);

    }
  }
  else
  {
    v10 = (void *)-[NSOrderedSet mutableCopy](arrangedBarItems, "mutableCopy");
  }
  objc_msgSend(v10, "minusSet:", self->_hiddenBarItems);
  v12 = (void *)objc_msgSend(v10, "copy");

  return v12;
}

- (void)setCustomActivityImage:(id)a3 accessibilityLabel:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SFBarRegistration _UIBarButtonItemForBarItem:](self, "_UIBarButtonItemForBarItem:", 10);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  objc_msgSend(v8, "setTitle:", v6);
  objc_msgSend(v8, "setAccessibilityLabel:", v6);

}

- (void)setImage:(id)a3 forBarItem:(int64_t)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a3;
  v11 = v7;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0DC3870];
    SFSystemImageNameForBarItem();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemImageNamed:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[SFBarRegistration _UIBarButtonItemForBarItem:](self, "_UIBarButtonItemForBarItem:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v7);

  v10 = v11;
  if (!v11)
  {

    v10 = 0;
  }

}

uint64_t __59__SFBarRegistration_initWithBar_barManager_layout_persona___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTitlesAndMenus");
}

- (SFBarRegistration)initWithBar:(id)a3 barManager:(id)a4 layout:(int64_t)a5 persona:(int64_t)a6
{
  id v10;
  id v11;
  SFBarRegistration *v12;
  SFBarRegistration *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  NSOrderedSet *arrangedBarItems;
  NSMutableSet *v18;
  NSMutableSet *hiddenBarItems;
  uint64_t v20;
  uint64_t v21;
  UIBarButtonItem *backItem;
  void *v23;
  uint64_t v24;
  UIBarButtonItem *forwardItem;
  void *v26;
  uint64_t v27;
  UIBarButtonItem *bookmarksItem;
  void *v29;
  uint64_t v30;
  UIBarButtonItem *shareItem;
  void *v32;
  uint64_t v33;
  UIBarButtonItem *newTabItem;
  void *v35;
  uint64_t v36;
  UIBarButtonItem *tabExposeItem;
  void *v38;
  uint64_t v39;
  UIBarButtonItem *openInSafariItem;
  void *v41;
  uint64_t v42;
  UIBarButtonItem *customActivityItem;
  void *v44;
  uint64_t v45;
  SFDownloadsBarButtonItem *downloadsItem;
  void *v47;
  SFBarRegistration *v48;
  SFBarRegistration *v49;
  _QWORD block[4];
  SFBarRegistration *v52;
  objc_super v53;

  v10 = a3;
  v11 = a4;
  v53.receiver = self;
  v53.super_class = (Class)SFBarRegistration;
  v12 = -[SFBarRegistration init](&v53, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_bar, v10);
    objc_storeWeak((id *)&v13->_barManager, v11);
    switch(a6)
    {
      case 0:
        if ((unint64_t)a5 >= 3)
          goto LABEL_10;
        v14 = &unk_1E4AC1ED8;
        goto LABEL_9;
      case 1:
      case 3:
        if ((unint64_t)a5 >= 3)
          goto LABEL_10;
        v14 = &unk_1E4AC1EF0;
        goto LABEL_9;
      case 2:
        if ((unint64_t)a5 > 2)
          goto LABEL_10;
        v14 = &unk_1E4AC1F08;
LABEL_9:
        v15 = v14[a5];
        break;
      default:
LABEL_10:
        v15 = MEMORY[0x1E0C9AA60];
        break;
    }
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    arrangedBarItems = v13->_arrangedBarItems;
    v13->_arrangedBarItems = (NSOrderedSet *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hiddenBarItems = v13->_hiddenBarItems;
    v13->_hiddenBarItems = v18;

    v13->_layout = a5;
    if (a5 == 2)
      v20 = 4;
    else
      v20 = 3;
    objc_msgSend(v10, "_setItemDistribution:", v20);
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B259F0))
    {
      v21 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 0);
      backItem = v13->_backItem;
      v13->_backItem = (UIBarButtonItem *)v21;

      _SFAccessibilityIdentifierForBarItem();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_backItem, "setAccessibilityIdentifier:", v23);

    }
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B25A08))
    {
      v24 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 1);
      forwardItem = v13->_forwardItem;
      v13->_forwardItem = (UIBarButtonItem *)v24;

      _SFAccessibilityIdentifierForBarItem();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_forwardItem, "setAccessibilityIdentifier:", v26);

    }
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B25A20))
    {
      v27 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 3);
      bookmarksItem = v13->_bookmarksItem;
      v13->_bookmarksItem = (UIBarButtonItem *)v27;

      _SFAccessibilityIdentifierForBarItem();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_bookmarksItem, "setAccessibilityIdentifier:", v29);

      _SFRoundEdgeInsetsToPixels();
      -[UIBarButtonItem _setAdditionalSelectionInsets:](v13->_bookmarksItem, "_setAdditionalSelectionInsets:");
      -[UIBarButtonItem _sf_setTarget:longPressAction:](v13->_bookmarksItem, "_sf_setTarget:longPressAction:", v13, sel__itemReceivedLongPress_);
    }
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B25A38))
    {
      v30 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 6);
      shareItem = v13->_shareItem;
      v13->_shareItem = (UIBarButtonItem *)v30;

      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_shareItem, "setAccessibilityIdentifier:", CFSTR("ShareButton"));
      _SFAccessibilityIdentifierForBarItem();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_shareItem, "setAccessibilityIdentifier:", v32);

      -[UIBarButtonItem _sf_setTarget:touchDownAction:longPressAction:](v13->_shareItem, "_sf_setTarget:touchDownAction:longPressAction:", v13, sel__itemReceivedTouchDown_, sel__itemReceivedLongPress_);
    }
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B25A50))
    {
      v33 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 7);
      newTabItem = v13->_newTabItem;
      v13->_newTabItem = (UIBarButtonItem *)v33;

      _SFAccessibilityIdentifierForBarItem();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_newTabItem, "setAccessibilityIdentifier:", v35);

      -[UIBarButtonItem _sf_setTarget:longPressAction:](v13->_newTabItem, "_sf_setTarget:longPressAction:", v13, sel__itemReceivedLongPress_);
    }
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B25A68))
    {
      v36 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 8);
      tabExposeItem = v13->_tabExposeItem;
      v13->_tabExposeItem = (UIBarButtonItem *)v36;

      _SFAccessibilityIdentifierForBarItem();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_tabExposeItem, "setAccessibilityIdentifier:", v38);

      -[UIBarButtonItem _sf_setTarget:longPressAction:](v13->_tabExposeItem, "_sf_setTarget:longPressAction:", v13, sel__itemReceivedLongPress_);
    }
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B25A80))
    {
      v39 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 9);
      openInSafariItem = v13->_openInSafariItem;
      v13->_openInSafariItem = (UIBarButtonItem *)v39;

      _SFAccessibilityIdentifierForBarItem();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_openInSafariItem, "setAccessibilityIdentifier:", v41);

      -[UIBarButtonItem _sf_setTarget:longPressAction:](v13->_openInSafariItem, "_sf_setTarget:longPressAction:", v13, sel__itemReceivedLongPress_);
    }
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B25A98))
    {
      v42 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 10);
      customActivityItem = v13->_customActivityItem;
      v13->_customActivityItem = (UIBarButtonItem *)v42;

      _SFAccessibilityIdentifierForBarItem();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setAccessibilityIdentifier:](v13->_customActivityItem, "setAccessibilityIdentifier:", v44);

    }
    if (-[NSOrderedSet containsObject:](v13->_arrangedBarItems, "containsObject:", &unk_1E4B25AB0))
    {
      v45 = -[SFBarRegistration _newBarButtonItemForSFBarItem:](v13, "_newBarButtonItemForSFBarItem:", 11);
      downloadsItem = v13->_downloadsItem;
      v13->_downloadsItem = (SFDownloadsBarButtonItem *)v45;

      _SFAccessibilityIdentifierForBarItem();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDownloadsBarButtonItem setAccessibilityIdentifier:](v13->_downloadsItem, "setAccessibilityIdentifier:", v47);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SFBarRegistration_initWithBar_barManager_layout_persona___block_invoke;
    block[3] = &unk_1E4ABFE00;
    v48 = v13;
    v52 = v48;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v49 = v48;

  }
  return v13;
}

- (id)_newBarButtonItemForSFBarItem:(int64_t)a3
{
  id v5;
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

  if (a3 == 10)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_msgSend(v5, "initWithImage:style:target:action:", v6, 0, self, sel__itemReceivedTap_);

    return v7;
  }
  else if (a3 == 11)
  {
    return -[SFDownloadsBarButtonItem initWithTarget:action:]([SFDownloadsBarButtonItem alloc], "initWithTarget:action:", self, sel__itemReceivedTap_);
  }
  else
  {
    SFSystemImageNameForBarItem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4920]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationWithTraitCollection:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v12, 0, self, sel__itemReceivedTap_);
    v14 = v13;
    if (self->_layout == 2)
      objc_msgSend(v13, "_setWidth:", 60.0);
    _SFAccessibilityIdentifierForBarItem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityIdentifier:", v15);

    return v14;
  }
}

- (void)_updateTitlesAndMenus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_backItem)
  {
    SFAccessibilityTitleForBarItem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_backItem, "setTitle:", v3);

  }
  if (self->_forwardItem)
  {
    SFAccessibilityTitleForBarItem();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_forwardItem, "setTitle:", v4);

  }
  if (self->_bookmarksItem)
  {
    SFAccessibilityTitleForBarItem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_bookmarksItem, "setTitle:", v5);

  }
  if (self->_shareItem)
  {
    SFAccessibilityTitleForBarItem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_shareItem, "setTitle:", v6);

  }
  if (self->_newTabItem)
  {
    SFAccessibilityTitleForBarItem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_newTabItem, "setTitle:", v7);

  }
  if (self->_tabExposeItem)
  {
    SFAccessibilityTitleForBarItem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_tabExposeItem, "setTitle:", v8);

  }
  if (self->_openInSafariItem)
  {
    SFAccessibilityTitleForBarItem();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_openInSafariItem, "setTitle:", v9);

  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;
  id WeakRetained;
  int64_t v10;
  objc_super v12;

  if (sel__itemReceivedLongPress_ == a3)
  {
    v8 = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_barManager);
    v10 = -[SFBarRegistration _barItemForUIBarButtonItem:](self, "_barItemForUIBarButtonItem:", v8);

    v7 = objc_msgSend(WeakRetained, "barRegistration:canHandleLongPressForBarItem:", self, v10);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SFBarRegistration;
    v6 = a4;
    v7 = -[SFBarRegistration canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);

  }
  return v7;
}

- (void)setDownloadsItemProgress:(double)a3
{
  -[SFDownloadsBarButtonItem setProgress:](self->_downloadsItem, "setProgress:", a3);
}

- (void)pulseDownloadsItem
{
  -[SFDownloadsBarButtonItem pulse](self->_downloadsItem, "pulse");
}

- (BOOL)containsBarItem:(int64_t)a3
{
  NSOrderedSet *lastCommittedArrangedBarItems;
  void *v7;

  if (*MEMORY[0x1E0D4F3D8] == a3)
    return 0;
  -[SFBarRegistration updateArrangedUIBarButtonItemsIfNeeded](self, "updateArrangedUIBarButtonItemsIfNeeded");
  lastCommittedArrangedBarItems = self->_lastCommittedArrangedBarItems;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(lastCommittedArrangedBarItems) = -[NSOrderedSet containsObject:](lastCommittedArrangedBarItems, "containsObject:", v7);

  return (char)lastCommittedArrangedBarItems;
}

- (id)popoverSourceInfoForItem:(int64_t)a3
{
  void *v3;
  void *v4;

  -[SFBarRegistration _UIBarButtonItemForBarItem:](self, "_UIBarButtonItemForBarItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE88]), "initWithItem:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)setProgress:(double)a3 forBarItem:(int64_t)a4
{
  if (a4 == 11)
    -[SFBarRegistration setDownloadsItemProgress:](self, "setDownloadsItemProgress:", a3);
}

- (void)pulseBarItem:(int64_t)a3
{
  if (a3 == 11)
    -[SFBarRegistration pulseDownloadsItem](self, "pulseDownloadsItem");
}

- (int64_t)_barItemForUIBarButtonItem:(id)a3
{
  SFDownloadsBarButtonItem *v4;
  int64_t v5;

  v4 = (SFDownloadsBarButtonItem *)a3;
  if ((SFDownloadsBarButtonItem *)self->_backItem == v4)
  {
    v5 = 0;
  }
  else if ((SFDownloadsBarButtonItem *)self->_forwardItem == v4)
  {
    v5 = 1;
  }
  else if ((SFDownloadsBarButtonItem *)self->_bookmarksItem == v4)
  {
    v5 = 3;
  }
  else if ((SFDownloadsBarButtonItem *)self->_shareItem == v4)
  {
    v5 = 6;
  }
  else if ((SFDownloadsBarButtonItem *)self->_newTabItem == v4)
  {
    v5 = 7;
  }
  else if ((SFDownloadsBarButtonItem *)self->_tabExposeItem == v4)
  {
    v5 = 8;
  }
  else if ((SFDownloadsBarButtonItem *)self->_openInSafariItem == v4)
  {
    v5 = 9;
  }
  else if ((SFDownloadsBarButtonItem *)self->_customActivityItem == v4)
  {
    v5 = 10;
  }
  else if (self->_downloadsItem == v4)
  {
    v5 = 11;
  }
  else
  {
    v5 = 17;
  }

  return v5;
}

- (void)_itemReceivedTouchDown:(id)a3
{
  _SFBarManager **p_barManager;
  id v5;
  int64_t v6;
  id WeakRetained;

  p_barManager = &self->_barManager;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_barManager);
  v6 = -[SFBarRegistration _barItemForUIBarButtonItem:](self, "_barItemForUIBarButtonItem:", v5);

  objc_msgSend(WeakRetained, "barRegistration:didReceiveTouchDownForBarItem:", self, v6);
}

- (void)_itemReceivedTap:(id)a3
{
  _SFBarManager **p_barManager;
  id v5;
  int64_t v6;
  id WeakRetained;

  p_barManager = &self->_barManager;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_barManager);
  v6 = -[SFBarRegistration _barItemForUIBarButtonItem:](self, "_barItemForUIBarButtonItem:", v5);

  objc_msgSend(WeakRetained, "barRegistration:didReceiveTapForBarItem:", self, v6);
}

- (void)_itemReceivedLongPress:(id)a3
{
  _SFBarManager **p_barManager;
  id v5;
  int64_t v6;
  id WeakRetained;

  p_barManager = &self->_barManager;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_barManager);
  v6 = -[SFBarRegistration _barItemForUIBarButtonItem:](self, "_barItemForUIBarButtonItem:", v5);

  objc_msgSend(WeakRetained, "barRegistration:didReceiveLongPressForBarItem:", self, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customActivityItem, 0);
  objc_storeStrong((id *)&self->_openInSafariItem, 0);
  objc_storeStrong((id *)&self->_tabExposeItem, 0);
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_newTabItem, 0);
  objc_storeStrong((id *)&self->_forwardItem, 0);
  objc_storeStrong((id *)&self->_downloadsItem, 0);
  objc_storeStrong((id *)&self->_bookmarksItem, 0);
  objc_storeStrong((id *)&self->_backItem, 0);
  objc_storeStrong((id *)&self->_lastCommittedArrangedBarItems, 0);
  objc_storeStrong((id *)&self->_hiddenBarItems, 0);
  objc_destroyWeak((id *)&self->_barManager);
  objc_destroyWeak((id *)&self->_bar);
  objc_storeStrong((id *)&self->_arrangedBarItems, 0);
}

@end
