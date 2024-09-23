@implementation CapsuleNavigationBarRegistration

- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4
{
  self->_disabledBarItems[a3] = !a4;
}

- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4
{
  self->_hiddenBarItems[a3] = a4;
  if (a3 == 11)
    -[CapsuleNavigationBarRegistration _updateDownloadState](self, "_updateDownloadState");
}

- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *buttonsByBarItem;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3 != 6 && a3 != 13)
  {
    v4 = a4;
    buttonsByBarItem = self->_buttonsByBarItem;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](buttonsByBarItem, "objectForKeyedSubscript:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    SFSystemImageNameForBarItem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v4
      || (v9 = (void *)MEMORY[0x1E0DC3870],
          objc_msgSend(v7, "stringByAppendingString:", CFSTR(".fill")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "systemImageNamed:", v10),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v11))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "setImage:forState:", v11, 0);

  }
}

- (void)setBarItem:(int64_t)a3 menu:(id)a4
{
  NSMutableDictionary *menuByBarItem;
  void *v6;
  id v7;
  id v8;

  menuByBarItem = self->_menuByBarItem;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](menuByBarItem, "setObject:forKeyedSubscript:", v7, v8);

}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D4EED8], "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "availability");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_buttonsByBarItem, "objectForKeyedSubscript:", &unk_1E9D62320);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5 == 1);
  if (v5 == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

}

id __54__CapsuleNavigationBarRegistration_updateBarAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;

  v3 = a2;
  v4 = objc_msgSend(v3, "integerValue");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isBarItemHidden:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "background");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v7);

      objc_msgSend(v6, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPreferredSymbolConfigurationForImage:", v9);

      v10 = (void *)MEMORY[0x1E0D4EF48];
      objc_msgSend(*(id *)(a1 + 32), "_actionForBarItem:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "buttonWithConfiguration:primaryAction:", v6, v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = xmmword_1D7EA88D0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v19, "{CGPoint=dd}");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTapTargetSideMargins:", v12);

      objc_msgSend(v5, "sf_applyContentSizeCategoryLimitsForToolbarButton");
      objc_msgSend(v5, "sf_configureLargeContentViewerForBarItem:", v4);
      v13 = objc_alloc_init(MEMORY[0x1E0DC3998]);
      objc_msgSend(v5, "addInteraction:", v13);

      if (v4 == 8)
        objc_msgSend(v5, "setAlwaysUsesUIMenuOrdering:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTintColor:", v14);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v5, v3);
    }
    _SFAccessibilityIdentifierForBarItem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v15);

    objc_msgSend(v5, "setEnabled:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + v4 + 65) == 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMenu:", v16);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "buttonPointerStyleProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPointerStyleProvider:", v17);

    }
  }

  return v5;
}

- (BOOL)_isBarItemHidden:(int64_t)a3
{
  int v3;
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  BOOL *disabledBarItems;
  _BOOL4 v13;
  void *v14;
  char v15;

  if (self->_hiddenBarItems[a3])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
    objc_msgSend(WeakRetained, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "showsStopReloadButtons");

    objc_msgSend(WeakRetained, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "stopReloadButtonShowsStop");

    if (self->_disabledBarItems[4])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4EED8], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = objc_msgSend(v11, "availability") == 0;

    }
    disabledBarItems = self->_disabledBarItems;
    switch(a3)
    {
      case 4:
        break;
      case 5:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_11;
      case 6:
        v13 = self->_disabledBarItems[6];
        goto LABEL_12;
      case 13:
        objc_msgSend(WeakRetained, "item");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v14, "showsPageFormatButton") ^ 1;

        break;
      case 14:
        v15 = v10 & v3 ^ 1;
        goto LABEL_16;
      case 15:
        v15 = v10 | v3 ^ 1;
LABEL_16:
        if (v8)
          LOBYTE(v3) = v15;
        else
          LOBYTE(v3) = 1;
        break;
      default:
        if (a3)
        {
LABEL_11:
          v13 = disabledBarItems[a3];
LABEL_12:
          LOBYTE(v3) = v13;
        }
        else
        {
          LOBYTE(v3) = *disabledBarItems
                    && -[CapsuleNavigationBarRegistration _isBarItemHidden:](self, "_isBarItemHidden:", 1);
        }
        break;
    }

  }
  return v3;
}

- (void)_updateDownloadState
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (self->_hiddenBarItems[11])
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasUnviewedDownloads"))
  {

LABEL_6:
    v3 = -[CapsuleNavigationBarRegistration pageFormatItemState](self, "pageFormatItemState") | 0x80;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalProgress");
  v7 = v6;

  if (v7 != -2.0)
    goto LABEL_6;
LABEL_2:
  v3 = -[CapsuleNavigationBarRegistration pageFormatItemState](self, "pageFormatItemState") & 0xFFFFFFFFFFFFFF7FLL;
LABEL_7:
  -[CapsuleNavigationBarRegistration setPageFormatItemState:](self, "setPageFormatItemState:", v3);
}

- (unint64_t)pageFormatItemState
{
  return self->_pageFormatItemState;
}

- (void)updateBarAnimated:(BOOL)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  CapsuleNavigationBarRegistration *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __54__CapsuleNavigationBarRegistration_updateBarAnimated___block_invoke;
  v12 = &unk_1E9CFA3F0;
  v13 = self;
  v14 = WeakRetained;
  v5 = WeakRetained;
  v6 = _Block_copy(&v9);
  -[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_leadingBarItems, "safari_mapAndFilterObjectsUsingBlock:", v6, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeadingButtons:", v7);

  -[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_trailingBarItems, "safari_mapAndFilterObjectsUsingBlock:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrailingButtons:", v8);

  -[CapsuleNavigationBarRegistration _voiceSearchAvailabilityDidChange:](self, "_voiceSearchAvailabilityDidChange:", 0);
  -[CapsuleNavigationBarRegistration _updateFormatMenuButton](self, "_updateFormatMenuButton");

}

- (void)_updateFormatMenuButton
{
  uint64_t v3;
  double v4;
  double *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  v3 = objc_msgSend(WeakRetained, "layoutStyle");
  v4 = 10.0;
  if (v3 == 2)
  {
    v4 = 5.0;
    v5 = (double *)MEMORY[0x1E0D4F300];
  }
  else
  {
    v5 = (double *)MEMORY[0x1E0D4F090];
  }
  -[SFNavigationBarToggleButton setMinimumSideMargin:](self->_formatMenuButton, "setMinimumSideMargin:", v4);
  -[SFNavigationBarToggleButton setResizableBackgroundCornerRadius:](self->_formatMenuButton, "setResizableBackgroundCornerRadius:", *v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "unclippedContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setPointerPreviewContainer:](self->_formatMenuButton, "setPointerPreviewContainer:", v6);

  }
}

- (CapsuleNavigationBarRegistration)initWithBar:(id)a3 barManager:(id)a4
{
  id v6;
  id v7;
  CapsuleNavigationBarRegistration *v8;
  CapsuleNavigationBarRegistration *v9;
  uint64_t v10;
  NSMutableDictionary *buttonsByBarItem;
  uint64_t v12;
  NSMutableDictionary *menuByBarItem;
  NSArray *leadingBarItems;
  NSArray *trailingBarItems;
  id v16;
  void *v17;
  uint64_t v18;
  SFNavigationBarToggleButton *formatMenuButton;
  void *v20;
  void *v21;
  SFNavigationBarToggleButton *v22;
  id v23;
  SFNavigationBarToggleButton *v24;
  void *v25;
  SFNavigationBarToggleButton *v26;
  void *v27;
  SFNavigationBarToggleButton *v28;
  void *v29;
  void *v30;
  CapsuleNavigationBarRegistration *v31;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CapsuleNavigationBarRegistration;
  v8 = -[CapsuleNavigationBarRegistration init](&v33, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_bar, v6);
    objc_storeWeak((id *)&v9->_manager, v7);
    v9->_pageFormatItemState = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    buttonsByBarItem = v9->_buttonsByBarItem;
    v9->_buttonsByBarItem = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    menuByBarItem = v9->_menuByBarItem;
    v9->_menuByBarItem = (NSMutableDictionary *)v12;

    leadingBarItems = v9->_leadingBarItems;
    v9->_leadingBarItems = (NSArray *)&unk_1E9D62940;

    trailingBarItems = v9->_trailingBarItems;
    v9->_trailingBarItems = (NSArray *)&unk_1E9D62958;

    v16 = objc_alloc(MEMORY[0x1E0D4ECE0]);
    objc_msgSend(MEMORY[0x1E0D4ECE0], "pageMenuImageWithIntelligence:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithImage:forInputMode:", v17, 0);
    formatMenuButton = v9->_formatMenuButton;
    v9->_formatMenuButton = (SFNavigationBarToggleButton *)v18;

    -[CapsuleNavigationBarRegistration _updateFormatMenuButton](v9, "_updateFormatMenuButton");
    -[SFNavigationBarToggleButton setClipsToBounds:](v9->_formatMenuButton, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setPreferredSymbolConfiguration:](v9->_formatMenuButton, "setPreferredSymbolConfiguration:", v20);

    -[SFNavigationBarToggleButton setClickEnabled:](v9->_formatMenuButton, "setClickEnabled:", 1);
    -[SFNavigationBarToggleButton pointerInteraction](v9->_formatMenuButton, "pointerInteraction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setEnabled:", 0);

    -[SFNavigationBarToggleButton sf_applyContentSizeCategoryLimitsForToolbarButton](v9->_formatMenuButton, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    -[SFNavigationBarToggleButton sf_configureLargeContentViewerForBarItem:](v9->_formatMenuButton, "sf_configureLargeContentViewerForBarItem:", 13);
    v22 = v9->_formatMenuButton;
    v23 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[SFNavigationBarToggleButton addInteraction:](v22, "addInteraction:", v23);

    v24 = v9->_formatMenuButton;
    -[CapsuleNavigationBarRegistration _touchDownActionForBarItem:](v9, "_touchDownActionForBarItem:", 13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton addAction:forControlEvents:](v24, "addAction:forControlEvents:", v25, 1);

    v26 = v9->_formatMenuButton;
    -[CapsuleNavigationBarRegistration _actionForBarItem:](v9, "_actionForBarItem:", 13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton addAction:forControlEvents:](v26, "addAction:forControlEvents:", v27, 0x2000);

    v28 = v9->_formatMenuButton;
    -[CapsuleNavigationBarRegistration _longPressActionForBarItem:](v9, "_longPressActionForBarItem:", 13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton addAction:forControlEvents:](v28, "addAction:forControlEvents:", v29, *MEMORY[0x1E0D4F0A8]);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_buttonsByBarItem, "setObject:forKeyedSubscript:", v9->_formatMenuButton, &unk_1E9D622D8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v9, sel__voiceSearchAvailabilityDidChange_, *MEMORY[0x1E0D4F360], 0);

    v31 = v9;
  }

  return v9;
}

- (id)_actionForBarItem:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13[2];
  id location;

  if (a3 == 5)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    SFSystemImageNameForBarItem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemImageNamed:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 == 11)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.down.circle.fill"));
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
  }
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC3428];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__CapsuleNavigationBarRegistration__actionForBarItem___block_invoke;
  v12[3] = &unk_1E9CFA418;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, v5, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v10;
}

- (id)viewForBarItem:(int64_t)a3
{
  NSMutableDictionary *buttonsByBarItem;
  void *v4;
  void *v5;

  buttonsByBarItem = self->_buttonsByBarItem;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](buttonsByBarItem, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_touchDownActionForBarItem:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC3428];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CapsuleNavigationBarRegistration__touchDownActionForBarItem___block_invoke;
  v7[3] = &unk_1E9CFA418;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)_longPressActionForBarItem:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC3428];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CapsuleNavigationBarRegistration__longPressActionForBarItem___block_invoke;
  v7[3] = &unk_1E9CFA418;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (void)setPageFormatItemState:(unint64_t)a3
{
  __int16 v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSString *previousWebpageIdentifier;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unsigned int v37;
  SFNavigationBarToggleButton **p_formatMenuButton;
  SFNavigationBarToggleButton *formatMenuButton;
  void *v40;
  SFNavigationBarToggleButton *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id WeakRetained;

  if ((a3 & 0x40) == 0 && self->_pageFormatItemState == a3)
    return;
  self->_pageFormatItemState = a3;
  v5 = ~(_WORD)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
  objc_msgSend(WeakRetained, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mediaStateIcon");
  v8 = v7 != 0;

  if ((v5 & 0x810) != 0)
  {
    if ((a3 & 0x11) == 1 || (a3 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D4ECE0], "readerImageWithSummary:", (a3 >> 12) & 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("ReaderButton");
    }
    else
    {
      if ((a3 & 0x14) != 4 && (a3 & 8) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D4ECE0], "pageMenuImageWithIntelligence:", (a3 >> 13) & 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFNavigationBarToggleButton setImage:](self->_formatMenuButton, "setImage:", v11);

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFNavigationBarToggleButton setGlyphTintColor:](self->_formatMenuButton, "setGlyphTintColor:", v12);

        _SFAccessibilityIdentifierForBarItem();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFNavigationBarToggleButton setAccessibilityIdentifier:](self->_formatMenuButton, "setAccessibilityIdentifier:", v13);

        -[SFNavigationBarToggleButton image](self->_formatMenuButton, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFNavigationBarToggleButton setLargeContentImage:](self->_formatMenuButton, "setLargeContentImage:", v14);

        v15 = 1;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0D4ECE0], "translationImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("TranslationButton");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4ECE0], "siriReaderPlayingImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("SiriReaderButton");
  }
  -[SFNavigationBarToggleButton setImage:](self->_formatMenuButton, "setImage:", v9);

  -[SFNavigationBarToggleButton setAccessibilityIdentifier:](self->_formatMenuButton, "setAccessibilityIdentifier:", v10);
  -[SFNavigationBarToggleButton sf_configureLargeContentViewerForBarItem:](self->_formatMenuButton, "sf_configureLargeContentViewerForBarItem:", 13);
  v15 = 0;
LABEL_13:
  if ((a3 & 0x3000) != 0)
  {
    previousWebpageIdentifier = self->_previousWebpageIdentifier;
    objc_msgSend(WeakRetained, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "webpageIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(previousWebpageIdentifier) = -[NSString isEqualToString:](previousWebpageIdentifier, "isEqualToString:", v18);

    if ((previousWebpageIdentifier & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "didShowSparkleSBA");

      objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "item");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "webpageIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:componentType:componentIdentifier:summaryText:tableOfContentsArrayLength:", v22, 0, &unk_1E9D62338, 0, 0);

      objc_msgSend(WeakRetained, "item");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "webpageIdentifier");
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      v25 = self->_previousWebpageIdentifier;
      self->_previousWebpageIdentifier = v24;

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D4ECE0], "extensionsImage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v28);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v29);

  }
  if (v7)
  {
    objc_msgSend(WeakRetained, "item");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "mediaStateIcon");
    _SFImageForMediaStateIcon();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageWithRenderingMode:", 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safari_addObjectUnlessNil:", v32);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v33);

  }
  if ((a3 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye.slash"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v34);

    objc_msgSend(MEMORY[0x1E0DC3658], "safari_scribbleThemeColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v35);

  }
  v36 = objc_msgSend(v26, "count");
  if ((a3 & 0x80) != 0)
    v37 = v8 & (a3 >> 8);
  else
    v37 = 1;
  if (v37 == 1)
  {
    formatMenuButton = self->_formatMenuButton;
    p_formatMenuButton = &self->_formatMenuButton;
    -[SFNavigationBarToggleButton setAccessoryView:](formatMenuButton, "setAccessoryView:", 0);
  }
  else
  {
    -[CapsuleNavigationBarRegistration _progressView](self, "_progressView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = self->_formatMenuButton;
    p_formatMenuButton = &self->_formatMenuButton;
    -[SFNavigationBarToggleButton setAccessoryView:](v41, "setAccessoryView:", v40);

  }
  -[SFNavigationBarToggleButton setShowsBadge:](*p_formatMenuButton, "setShowsBadge:", (v8 & (a3 >> 8) & (a3 >> 7) | (a3 >> 9)) & v15);
  if (v36)
  {
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setSecondaryImage:](*p_formatMenuButton, "setSecondaryImage:", v42);

  }
  else
  {
    -[SFNavigationBarToggleButton setSecondaryImage:](*p_formatMenuButton, "setSecondaryImage:", 0);
  }
  if (objc_msgSend(v27, "count"))
  {
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setSecondaryImageColor:](*p_formatMenuButton, "setSecondaryImageColor:", v43);

  }
  else
  {
    -[SFNavigationBarToggleButton setSecondaryImageColor:](*p_formatMenuButton, "setSecondaryImageColor:", 0);
  }
  if (v36 <= 1)
  {
    -[SFNavigationBarToggleButton setTertiaryImage:](*p_formatMenuButton, "setTertiaryImage:", 0);
  }
  else
  {
    objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setTertiaryImage:](*p_formatMenuButton, "setTertiaryImage:", v44);

  }
  if ((unint64_t)objc_msgSend(v27, "count") <= 1)
  {
    -[SFNavigationBarToggleButton setTertiaryImageColor:](*p_formatMenuButton, "setTertiaryImageColor:", 0);
  }
  else
  {
    objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setTertiaryImageColor:](*p_formatMenuButton, "setTertiaryImageColor:", v45);

  }
  -[SFNavigationBarToggleButton setSelected:](*p_formatMenuButton, "setSelected:", (a3 >> 5) & 1);
  -[SFNavigationBarToggleButton setUsesInsetFromBackground:](*p_formatMenuButton, "setUsesInsetFromBackground:", (a3 >> 10) & 1);
  -[SFNavigationBarToggleButton invalidateIntrinsicContentSize](*p_formatMenuButton, "invalidateIntrinsicContentSize");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CapsuleNavigationBarRegistration;
  -[CapsuleNavigationBarRegistration dealloc](&v4, sel_dealloc);
}

- (id)_progressView
{
  SFMoreMenuButton *progressView;
  id v4;
  void *v5;
  SFMoreMenuButton *v6;
  SFMoreMenuButton *v7;

  progressView = self->_progressView;
  if (!progressView)
  {
    v4 = objc_alloc(MEMORY[0x1E0D4ECD0]);
    -[CapsuleNavigationBarRegistration _actionForBarItem:](self, "_actionForBarItem:", 11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (SFMoreMenuButton *)objc_msgSend(v4, "initWithFrame:primaryAction:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_progressView;
    self->_progressView = v6;

    -[SFMoreMenuButton setUserInteractionEnabled:](self->_progressView, "setUserInteractionEnabled:", 0);
    -[SFMoreMenuButton setProgressStyle:](self->_progressView, "setProgressStyle:", 1);
    -[SFMoreMenuButton setSymbolScale:](self->_progressView, "setSymbolScale:", 2);
    progressView = self->_progressView;
  }
  return progressView;
}

- (UIButton)microphoneButton
{
  return (UIButton *)-[NSMutableDictionary objectForKeyedSubscript:](self->_buttonsByBarItem, "objectForKeyedSubscript:", &unk_1E9D62320);
}

- (BOOL)containsBarItem:(int64_t)a3
{
  char v5;
  NSArray *leadingBarItems;
  void *v7;
  NSArray *trailingBarItems;
  void *v9;

  if (-[CapsuleNavigationBarRegistration _isBarItemHidden:](self, "_isBarItemHidden:"))
    return 0;
  leadingBarItems = self->_leadingBarItems;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray containsObject:](leadingBarItems, "containsObject:", v7))
  {
    v5 = 1;
  }
  else
  {
    trailingBarItems = self->_trailingBarItems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NSArray containsObject:](trailingBarItems, "containsObject:", v9);

  }
  return v5;
}

- (id)popoverSourceInfoForItem:(int64_t)a3
{
  void *WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *buttonsByBarItem;
  void *v11;
  uint64_t v12;

  if (a3 == 13 || a3 == 11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_bar);
    v5 = objc_msgSend(WeakRetained, "layoutStyle");
    v6 = objc_alloc(MEMORY[0x1E0D4EFA0]);
    v7 = v6;
    if (v5 == 1)
    {
      -[SFNavigationBarToggleButton tiplessPopoverSourceView](self->_formatMenuButton, "tiplessPopoverSourceView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithView:", v8);

      objc_msgSend(v9, "setShouldPassthroughSuperview:", 1);
      objc_msgSend(v9, "setPermittedArrowDirections:", 2);
    }
    else
    {
      v9 = (void *)objc_msgSend(v6, "initWithView:", self->_formatMenuButton);
    }
    objc_msgSend(v9, "setShouldHideArrow:", 1);
    if (objc_msgSend(WeakRetained, "layoutStyle") == 2)
      v12 = 1;
    else
      v12 = 2;
    objc_msgSend(v9, "setProvenance:", v12);
  }
  else
  {
    buttonsByBarItem = self->_buttonsByBarItem;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](buttonsByBarItem, "objectForKeyedSubscript:", v11);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    if (WeakRetained)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EFA0]), "initWithView:", WeakRetained);
    else
      v9 = 0;
  }

  return v9;
}

- (void)setProgress:(double)a3 forBarItem:(int64_t)a4
{
  void *v6;

  if (a4 == 11)
  {
    -[CapsuleNavigationBarRegistration _progressView](self, "_progressView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDownloadProgress:animated:", 1, a3);

    -[CapsuleNavigationBarRegistration _updateDownloadState](self, "_updateDownloadState");
  }
}

void __54__CapsuleNavigationBarRegistration__actionForBarItem___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  char v3;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "pageFormatItemState");
    if (*(_QWORD *)(a1 + 40) != 13 || (v3 & 0x10) != 0)
      goto LABEL_10;
    v5 = v3;
    objc_msgSend(v9, "bar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v7, "navigationBarReaderButtonWasTapped:", v6);
    }
    else
    {
      if ((v5 & 4) == 0)
      {

LABEL_10:
        v6 = objc_loadWeakRetained(v9 + 1);
        objc_msgSend(v6, "barRegistration:didReceiveTapForBarItem:", v9, *(_QWORD *)(a1 + 40));
LABEL_14:

        WeakRetained = v9;
        goto LABEL_15;
      }
      objc_msgSend(v7, "navigationBarTranslateButtonWasTapped:", v6);
    }

    goto LABEL_14;
  }
LABEL_15:

}

void __63__CapsuleNavigationBarRegistration__touchDownActionForBarItem___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "barRegistration:didReceiveTouchDownForBarItem:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __63__CapsuleNavigationBarRegistration__longPressActionForBarItem___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    if (objc_msgSend(v3, "barRegistration:canHandleLongPressForBarItem:", v4, *(_QWORD *)(a1 + 40)))
      objc_msgSend(v3, "barRegistration:didReceiveLongPressForBarItem:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  stringForBarItems((uint64_t)self->_disabledBarItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  stringForBarItems((uint64_t)self->_hiddenBarItems);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: disabled = %@; hidden = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (SFCapsuleNavigationBar)bar
{
  return (SFCapsuleNavigationBar *)objc_loadWeakRetained((id *)&self->_bar);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bar);
  objc_storeStrong((id *)&self->_previousWebpageIdentifier, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_formatMenuButton, 0);
  objc_storeStrong((id *)&self->_menuByBarItem, 0);
  objc_storeStrong((id *)&self->_buttonsByBarItem, 0);
  objc_storeStrong((id *)&self->_trailingBarItems, 0);
  objc_storeStrong((id *)&self->_leadingBarItems, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end
