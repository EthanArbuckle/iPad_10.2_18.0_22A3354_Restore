@implementation SFUnifiedBarRegistration

- (SFUnifiedBarRegistration)initWithBar:(id)a3 barManager:(id)a4 persona:(int64_t)a5
{
  id v8;
  id v9;
  SFUnifiedBarRegistration *v10;
  SFUnifiedBarRegistration *v11;
  uint64_t v12;
  NSMutableSet *disabledBarItems;
  uint64_t v14;
  NSMutableSet *hiddenBarItems;
  uint64_t v16;
  SFUnifiedBarButton *bookmarksAndSidebarButton;
  uint64_t v18;
  SFUnifiedBarItem *backButton;
  uint64_t v20;
  SFUnifiedBarItem *forwardButton;
  uint64_t v22;
  SFUnifiedBarItem *tabGroupButton;
  uint64_t v24;
  SFUnifiedBarItem *shareButton;
  uint64_t v26;
  SFUnifiedBarItem *newTabButton;
  uint64_t v28;
  SFUnifiedBarItem *tabOverviewButton;
  uint64_t v30;
  SFUnifiedBarItem *cancelButton;
  SFCollaborationUnifiedBarItem *v32;
  SFCollaborationUnifiedBarItem *collaborationButton;
  SFDownloadsUnifiedBarItem *v34;
  uint64_t v35;
  SFDownloadsUnifiedBarItem *downloadsButton;
  SFUnifiedBarRegistration *v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  id location;
  objc_super v45;

  v8 = a3;
  v9 = a4;
  v45.receiver = self;
  v45.super_class = (Class)SFUnifiedBarRegistration;
  v10 = -[SFUnifiedBarRegistration init](&v45, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_bar, v8);
    objc_storeWeak((id *)&v11->_barManager, v9);
    v11->_persona = a5;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    disabledBarItems = v11->_disabledBarItems;
    v11->_disabledBarItems = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    hiddenBarItems = v11->_hiddenBarItems;
    v11->_hiddenBarItems = (NSMutableSet *)v14;

    -[SFUnifiedBarRegistration _makeBarItemForSFBarItem:](v11, "_makeBarItemForSFBarItem:", 3);
    v16 = objc_claimAutoreleasedReturnValue();
    bookmarksAndSidebarButton = v11->_bookmarksAndSidebarButton;
    v11->_bookmarksAndSidebarButton = (SFUnifiedBarButton *)v16;

    -[SFUnifiedBarRegistration _makeBarItemForSFBarItem:](v11, "_makeBarItemForSFBarItem:", 0);
    v18 = objc_claimAutoreleasedReturnValue();
    backButton = v11->_backButton;
    v11->_backButton = (SFUnifiedBarItem *)v18;

    -[SFUnifiedBarRegistration _makeBarItemForSFBarItem:](v11, "_makeBarItemForSFBarItem:", 1);
    v20 = objc_claimAutoreleasedReturnValue();
    forwardButton = v11->_forwardButton;
    v11->_forwardButton = (SFUnifiedBarItem *)v20;

    -[SFUnifiedBarRegistration _makeBarItemForSFBarItem:](v11, "_makeBarItemForSFBarItem:", 2);
    v22 = objc_claimAutoreleasedReturnValue();
    tabGroupButton = v11->_tabGroupButton;
    v11->_tabGroupButton = (SFUnifiedBarItem *)v22;

    -[SFUnifiedBarRegistration _makeBarItemForSFBarItem:](v11, "_makeBarItemForSFBarItem:", 6);
    v24 = objc_claimAutoreleasedReturnValue();
    shareButton = v11->_shareButton;
    v11->_shareButton = (SFUnifiedBarItem *)v24;

    -[SFUnifiedBarRegistration _makeBarItemForSFBarItem:](v11, "_makeBarItemForSFBarItem:", 7);
    v26 = objc_claimAutoreleasedReturnValue();
    newTabButton = v11->_newTabButton;
    v11->_newTabButton = (SFUnifiedBarItem *)v26;

    -[SFUnifiedBarRegistration _makeBarItemForSFBarItem:](v11, "_makeBarItemForSFBarItem:", 8);
    v28 = objc_claimAutoreleasedReturnValue();
    tabOverviewButton = v11->_tabOverviewButton;
    v11->_tabOverviewButton = (SFUnifiedBarItem *)v28;

    -[SFUnifiedBarRegistration _makeBarItemForSFBarItem:](v11, "_makeBarItemForSFBarItem:", 12);
    v30 = objc_claimAutoreleasedReturnValue();
    cancelButton = v11->_cancelButton;
    v11->_cancelButton = (SFUnifiedBarItem *)v30;

    v32 = (SFCollaborationUnifiedBarItem *)objc_alloc_init(MEMORY[0x1E0D4EC40]);
    collaborationButton = v11->_collaborationButton;
    v11->_collaborationButton = v32;

    objc_initWeak(&location, v11);
    v34 = [SFDownloadsUnifiedBarItem alloc];
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __59__SFUnifiedBarRegistration_initWithBar_barManager_persona___block_invoke;
    v42 = &unk_1E4AC8160;
    objc_copyWeak(&v43, &location);
    v35 = -[SFDownloadsUnifiedBarItem initWithAction:](v34, "initWithAction:", &v39);
    downloadsButton = v11->_downloadsButton;
    v11->_downloadsButton = (SFDownloadsUnifiedBarItem *)v35;

    -[SFUnifiedBarRegistration _updateItems](v11, "_updateItems", v39, v40, v41, v42);
    v37 = v11;
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __59__SFUnifiedBarRegistration_initWithBar_barManager_persona___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_itemReceivedTap:", v5);

}

- (void)_setNeedsUpdateItems
{
  self->_needsUpdateItems = 1;
}

- (void)_updateItemsIfNeeded
{
  if (self->_needsUpdateItems)
    -[SFUnifiedBarRegistration _updateItems](self, "_updateItems");
}

- (void)_updateItems
{
  int64_t persona;
  NSArray *v4;
  void *v5;
  unint64_t state;
  BOOL v7;
  NSArray *leadingBarItems;
  NSArray *v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *trailingBarItems;
  void *v16;
  void *v17;
  NSSet *v18;
  NSSet *allBarItems;
  void *v20;
  void *v21;
  id v22;

  self->_needsUpdateItems = 0;
  persona = self->_persona;
  v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  if (!persona)
  {
    v5 = &unk_1E4B273E8;
    state = self->_state;
    switch(self->_contentMode)
    {
      case 1:
        if (state >= 3)
          goto LABEL_5;
        v5 = (void *)qword_1E4AC81D0[state];
        break;
      case 2:
LABEL_5:
        v5 = &unk_1E4B27418;
        break;
      case 3:
        v5 = &unk_1E4B27430;
        v7 = state == 2;
        goto LABEL_8;
      case 6:
        v5 = &unk_1E4B27448;
        v7 = state == 1;
LABEL_8:
        if (v7)
          v5 = (void *)MEMORY[0x1E0C9AA60];
        break;
      default:
        break;
    }
    v4 = v5;
  }
  leadingBarItems = self->_leadingBarItems;
  self->_leadingBarItems = v4;

  if (self->_persona)
  {
    v9 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v10 = self->_state;
    switch(self->_contentMode)
    {
      case 1:
        if (v10 >= 3)
          goto LABEL_16;
        v11 = &unk_1E4AC81E8;
        goto LABEL_19;
      case 2:
LABEL_16:
        v12 = &unk_1E4B274A8;
        break;
      case 3:
        if (v10 >= 3)
          goto LABEL_20;
        v11 = &unk_1E4AC8200;
LABEL_19:
        v12 = (void *)v11[v10];
        break;
      case 4:
LABEL_20:
        v12 = &unk_1E4B274F0;
        break;
      case 5:
        v13 = &unk_1E4B27508;
        v14 = &unk_1E4B27520;
        goto LABEL_26;
      case 6:
        v13 = &unk_1E4B27538;
        if (v10 == 1)
          v13 = &unk_1E4B27550;
        v14 = &unk_1E4B27568;
LABEL_26:
        if (v10 == 2)
          v12 = v14;
        else
          v12 = v13;
        break;
      default:
        v12 = &unk_1E4B27460;
        break;
    }
    v9 = v12;
  }
  trailingBarItems = self->_trailingBarItems;
  self->_trailingBarItems = v9;

  v16 = (void *)MEMORY[0x1E0C99E60];
  -[NSArray arrayByAddingObjectsFromArray:](self->_leadingBarItems, "arrayByAddingObjectsFromArray:", self->_trailingBarItems);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (NSSet *)objc_claimAutoreleasedReturnValue();
  allBarItems = self->_allBarItems;
  self->_allBarItems = v18;

  -[SFUnifiedBarRegistration _imageForBarItem:](self, "_imageForBarItem:", 3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarButton setImage:](self->_bookmarksAndSidebarButton, "setImage:", v22);
  -[SFUnifiedBarButton view](self->_bookmarksAndSidebarButton, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLargeContentImage:", v22);
  if (self->_contentMode > 6uLL)
  {
    v21 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "setLargeContentTitle:", v21);

}

- (id)_makeBarItemForSFBarItem:(int64_t)a3
{
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
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;

  objc_initWeak(&location, self);
  -[SFUnifiedBarRegistration _imageForBarItem:](self, "_imageForBarItem:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D4EEA0]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __53__SFUnifiedBarRegistration__makeBarItemForSFBarItem___block_invoke;
  v19 = &unk_1E4AC8188;
  objc_copyWeak(&v20, &location);
  v7 = (void *)objc_msgSend(v6, "initWithImage:action:", v5, &v16);
  objc_msgSend(v7, "view", v16, v17, v18, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SFAccessibilityTitleForBarItem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sf_configureLargeContentViewerWithImage:title:", v5, v9);

  if (a3 == 2)
  {
    objc_msgSend(v7, "setSpacingOptions:", 10);
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v12);

    objc_msgSend(v11, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v11, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", 0);

    objc_msgSend(v11, "updateTitleFont");
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    objc_msgSend(v7, "setSpacingOptions:", 1);
    goto LABEL_8;
  }
  if (a3 != 12)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v7, "setTitle:", v10);
LABEL_9:
  _SFAccessibilityIdentifierForBarItem();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v7;
}

void __53__SFUnifiedBarRegistration__makeBarItemForSFBarItem___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_itemReceivedTap:", v5);

}

- (id)_imageForBarItem:(int64_t)a3
{
  unint64_t v3;
  __CFString *v4;
  void *v5;

  if (a3 == 3)
  {
    v3 = self->_contentMode - 2;
    if (v3 > 4)
      v4 = CFSTR("sidebar.leading");
    else
      v4 = off_1E4AC8218[v3];
  }
  else
  {
    SFSystemImageNameForBarItem();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableSet *disabledBarItems;
  void *v8;
  NSMutableSet *v9;
  void *v10;
  id v11;

  v4 = a4;
  disabledBarItems = self->_disabledBarItems;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(disabledBarItems) = -[NSMutableSet containsObject:](disabledBarItems, "containsObject:", v8);

  if ((_DWORD)disabledBarItems == v4)
  {
    if ((unint64_t)a3 <= 1)
      self->_nextUpdateShouldPinScrollPositionToTrailingEdge = 1;
    v9 = self->_disabledBarItems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[NSMutableSet removeObject:](v9, "removeObject:", v10);
    else
      -[NSMutableSet addObject:](v9, "addObject:", v10);

    if (a3 != 1 || self->_contentMode <= 3uLL)
    {
      -[SFUnifiedBarRegistration unifiedBarItemForSFBarItem:](self, "unifiedBarItemForSFBarItem:", a3);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEnabled:", v4);

    }
  }
}

- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableSet *hiddenBarItems;
  void *v8;

  v4 = a4;
  if (-[SFUnifiedBarRegistration _isBarItemHidden:](self, "_isBarItemHidden:") != a4)
  {
    hiddenBarItems = self->_hiddenBarItems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[NSMutableSet addObject:](hiddenBarItems, "addObject:", v8);
    else
      -[NSMutableSet removeObject:](hiddenBarItems, "removeObject:", v8);

    -[SFUnifiedBarRegistration _setNeedsUpdateItems](self, "_setNeedsUpdateItems");
  }
}

- (BOOL)_isBarItemHidden:(int64_t)a3
{
  NSMutableSet *hiddenBarItems;
  void *v7;
  char v8;
  NSMutableSet *disabledBarItems;
  void *v10;

  if (a3 || self->_contentMode < 4uLL)
  {
    hiddenBarItems = self->_hiddenBarItems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](hiddenBarItems, "containsObject:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v8 = 0;
      if (a3 == 1 && self->_contentMode >= 4uLL)
      {
        disabledBarItems = self->_disabledBarItems;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NSMutableSet containsObject:](disabledBarItems, "containsObject:", v10);

      }
    }

  }
  else
  {
    if (-[NSMutableSet containsObject:](self->_disabledBarItems, "containsObject:", &unk_1E4B26140))
      return -[NSMutableSet containsObject:](self->_disabledBarItems, "containsObject:", &unk_1E4B26158);
    return 0;
  }
  return v8;
}

- (void)_updateEnabledBarItems
{
  _SFBarItemEnumerateCases();
}

void __50__SFUnifiedBarRegistration__updateEnabledBarItems__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _QWORD *v6;
  _BOOL8 v8;
  id v9;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  v6 = *(_QWORD **)(a1 + 32);
  if ((_DWORD)v4)
    v8 = a2 == 1 && v6[20] > 3uLL;
  else
    v8 = 1;
  objc_msgSend(v6, "unifiedBarItemForSFBarItem:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v8);

}

- (void)updateBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v3 = a3;
  -[SFUnifiedBarRegistration _updateItemsIfNeeded](self, "_updateItemsIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  objc_msgSend(WeakRetained, "setInlineContentViewPinsScrollPositionToTrailingEdgeDuringResize:", self->_nextUpdateShouldPinScrollPositionToTrailingEdge);
  v5 = objc_alloc(MEMORY[0x1E0D4EEB0]);
  -[SFUnifiedBarRegistration _unifiedBarItemsForSFBarItems:](self, "_unifiedBarItemsForSFBarItems:", self->_leadingBarItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistration _unifiedBarItemsForSFBarItems:](self, "_unifiedBarItemsForSFBarItems:", self->_trailingBarItems);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithLeadingItems:trailingItems:", v6, v7);

  objc_msgSend(WeakRetained, "setItemArrangement:animated:", v8, v3);
  objc_msgSend(WeakRetained, "setInlineContentViewPinsScrollPositionToTrailingEdgeDuringResize:", 0);
  self->_nextUpdateShouldPinScrollPositionToTrailingEdge = 0;

}

- (id)_unifiedBarItemsForSFBarItems:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SFUnifiedBarRegistration__unifiedBarItemsForSFBarItems___block_invoke;
  v4[3] = &unk_1E4AC81B0;
  v4[4] = self;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __58__SFUnifiedBarRegistration__unifiedBarItemsForSFBarItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isBarItemHidden:", objc_msgSend(v3, "integerValue")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unifiedBarItemForSFBarItem:", objc_msgSend(v3, "integerValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int64_t)_SFBarItemForUnifiedBarItem:(id)a3
{
  SFCollaborationUnifiedBarItem *v4;
  int64_t v5;

  v4 = (SFCollaborationUnifiedBarItem *)a3;
  if ((SFCollaborationUnifiedBarItem *)self->_backButton == v4)
  {
    v5 = 0;
  }
  else if (self->_bookmarksAndSidebarButton == v4)
  {
    v5 = 3;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_forwardButton == v4)
  {
    v5 = 1;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_tabGroupButton == v4)
  {
    v5 = 2;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_shareButton == v4)
  {
    v5 = 6;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_newTabButton == v4)
  {
    v5 = 7;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_tabOverviewButton == v4)
  {
    v5 = 8;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_downloadsButton == v4)
  {
    v5 = 11;
  }
  else if ((SFCollaborationUnifiedBarItem *)self->_cancelButton == v4)
  {
    v5 = 12;
  }
  else if (self->_collaborationButton == v4)
  {
    v5 = 16;
  }
  else
  {
    v5 = 17;
  }

  return v5;
}

- (id)unifiedBarItemForSFBarItem:(int64_t)a3
{
  id v3;

  if ((unint64_t)a3 <= 0x10 && ((0x119CFu >> a3) & 1) != 0)
    v3 = *(id *)((char *)&self->super.isa + qword_1A3CB24A0[a3]);
  else
    v3 = 0;
  return v3;
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
  v6 = -[SFUnifiedBarRegistration _SFBarItemForUnifiedBarItem:](self, "_SFBarItemForUnifiedBarItem:", v5);

  objc_msgSend(WeakRetained, "barRegistration:didReceiveTapForBarItem:", self, v6);
}

- (BOOL)containsBarItem:(int64_t)a3
{
  NSSet *allBarItems;
  void *v6;
  _BOOL4 v7;

  allBarItems = self->_allBarItems;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet containsObject:](allBarItems, "containsObject:", v6))
    v7 = !-[SFUnifiedBarRegistration _isBarItemHidden:](self, "_isBarItemHidden:", a3);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (id)popoverSourceInfoForItem:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SFUnifiedBarRegistration unifiedBarItemForSFBarItem:](self, "unifiedBarItemForSFBarItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EFA0]), "initWithView:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)viewForBarItem:(int64_t)a3
{
  void *v3;
  void *v4;

  -[SFUnifiedBarRegistration unifiedBarItemForSFBarItem:](self, "unifiedBarItemForSFBarItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setBarItem:(int64_t)a3 menu:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[SFUnifiedBarRegistration unifiedBarItemForSFBarItem:](self, "unifiedBarItemForSFBarItem:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMenu:", v6);

}

- (void)setProgress:(double)a3 forBarItem:(int64_t)a4
{
  if (a4 == 11)
    -[SFDownloadsUnifiedBarItem setProgress:](self->_downloadsButton, "setProgress:", a3);
}

- (void)pulseBarItem:(int64_t)a3
{
  if (a3 == 11)
    -[SFDownloadsUnifiedBarItem pulse](self->_downloadsButton, "pulse");
}

- (void)setTitle:(id)a3 forBarItem:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  if (v6)
  {
    v8 = v6;
    -[SFUnifiedBarRegistration unifiedBarItemForSFBarItem:](self, "unifiedBarItemForSFBarItem:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "setTitle:", v8);

    v6 = v8;
  }

}

- (void)setImage:(id)a3 forBarItem:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SFUnifiedBarRegistration unifiedBarItemForSFBarItem:](self, "unifiedBarItemForSFBarItem:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8)
    {
      objc_msgSend(v6, "setImage:", v8);
    }
    else
    {
      -[SFUnifiedBarRegistration _imageForBarItem:](self, "_imageForBarItem:", a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v7);

    }
  }

}

- (void)setAttributedTitle:(id)a3 forBarItem:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[SFUnifiedBarRegistration unifiedBarItemForSFBarItem:](self, "unifiedBarItemForSFBarItem:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAttributedTitle:", v7);

}

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    -[SFUnifiedBarRegistration _updateEnabledBarItems](self, "_updateEnabledBarItems");
    -[SFUnifiedBarRegistration _setNeedsUpdateItems](self, "_setNeedsUpdateItems");
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[SFUnifiedBarRegistration _setNeedsUpdateItems](self, "_setNeedsUpdateItems");
  }
}

- (_SWCollaborationButtonView)collaborationButton
{
  return (_SWCollaborationButtonView *)-[SFCollaborationUnifiedBarItem collaborationButton](self->_collaborationButton, "collaborationButton");
}

- (void)setCollaborationButton:(id)a3
{
  -[SFCollaborationUnifiedBarItem setCollaborationButton:](self->_collaborationButton, "setCollaborationButton:", a3);
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_downloadsButton, 0);
  objc_storeStrong((id *)&self->_tabOverviewButton, 0);
  objc_storeStrong((id *)&self->_newTabButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_tabGroupButton, 0);
  objc_storeStrong((id *)&self->_forwardButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_bookmarksAndSidebarButton, 0);
  objc_storeStrong((id *)&self->_allBarItems, 0);
  objc_storeStrong((id *)&self->_trailingBarItems, 0);
  objc_storeStrong((id *)&self->_leadingBarItems, 0);
  objc_storeStrong((id *)&self->_hiddenBarItems, 0);
  objc_storeStrong((id *)&self->_disabledBarItems, 0);
  objc_destroyWeak((id *)&self->_barManager);
  objc_destroyWeak((id *)&self->_bar);
}

@end
