@implementation TabOverviewToolbar

- (TabOverviewToolbar)initWithFrame:(CGRect)a3
{
  TabOverviewToolbar *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *background;
  id v8;
  uint64_t v9;
  UIView *contentContainer;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  BarButton *tabGroupButton;
  void *v16;
  uint64_t v17;
  BarButton *addTabButton;
  void *v19;
  BarButton *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  BarButton *doneButton;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BarButton *cancelSearchButton;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UIView *v36;
  UIView *toolbarSeparator;
  void *v38;
  void *v39;
  id v40;
  TabOverviewToolbar *v41;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)TabOverviewToolbar;
  v3 = -[TabOverviewToolbar initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithEffect:", v5);
    background = v3->_background;
    v3->_background = (UIVisualEffectView *)v6;

    -[TabOverviewToolbar bounds](v3, "bounds");
    -[UIVisualEffectView setFrame:](v3->_background, "setFrame:");
    -[UIVisualEffectView setAutoresizingMask:](v3->_background, "setAutoresizingMask:", 18);
    -[TabOverviewToolbar addSubview:](v3, "addSubview:", v3->_background);
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[TabOverviewToolbar bounds](v3, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    contentContainer = v3->_contentContainer;
    v3->_contentContainer = (UIView *)v9;

    -[UIView setAutoresizingMask:](v3->_contentContainer, "setAutoresizingMask:", 0);
    -[TabOverviewToolbar addSubview:](v3, "addSubview:", v3->_contentContainer);
    v11 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[TabOverviewToolbar addInteraction:](v3, "addInteraction:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0DC3FC0]);
    -[TabOverviewToolbar addInteraction:](v3, "addInteraction:", v12);

    objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BarButton buttonWithConfiguration:primaryAction:](BarButton, "buttonWithConfiguration:primaryAction:", v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    tabGroupButton = v3->_tabGroupButton;
    v3->_tabGroupButton = (BarButton *)v14;

    -[BarButton setEnabled:](v3->_tabGroupButton, "setEnabled:", 0);
    -[BarButton setExclusiveTouch:](v3->_tabGroupButton, "setExclusiveTouch:", 1);
    -[BarButton setShouldRespectContextMenuOrdering:](v3->_tabGroupButton, "setShouldRespectContextMenuOrdering:", 1);
    -[BarButton sf_configureLargeContentViewerForBarItem:](v3->_tabGroupButton, "sf_configureLargeContentViewerForBarItem:", 2);
    -[BarButton sizeToFit](v3->_tabGroupButton, "sizeToFit");
    -[UIView addSubview:](v3->_contentContainer, "addSubview:", v3->_tabGroupButton);
    -[BarButton titleLabel](v3->_tabGroupButton, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("TabGroupTitleField"));

    +[BarButton buttonWithType:](BarButton, "buttonWithType:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    addTabButton = v3->_addTabButton;
    v3->_addTabButton = (BarButton *)v17;

    _SFAccessibilityIdentifierForBarItem();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BarButton setAccessibilityIdentifier:](v3->_addTabButton, "setAccessibilityIdentifier:", v19);

    -[BarButton setExclusiveTouch:](v3->_addTabButton, "setExclusiveTouch:", 1);
    v20 = v3->_addTabButton;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BarButton setImage:forState:](v20, "setImage:forState:", v21, 0);

    -[BarButton sf_configureLargeContentViewerForBarItem:](v3->_addTabButton, "sf_configureLargeContentViewerForBarItem:", 7);
    -[BarButton sizeToFit](v3->_addTabButton, "sizeToFit");
    v22 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BarButton setPreferredSymbolConfiguration:forImageInState:](v3->_addTabButton, "setPreferredSymbolConfiguration:forImageInState:", v23, 0);
    -[UIView addSubview:](v3->_contentContainer, "addSubview:", v3->_addTabButton);
    +[BarButton buttonWithType:](BarButton, "buttonWithType:", 1);
    v24 = objc_claimAutoreleasedReturnValue();
    doneButton = v3->_doneButton;
    v3->_doneButton = (BarButton *)v24;

    -[BarButton setExclusiveTouch:](v3->_doneButton, "setExclusiveTouch:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "_sf_preferredFontForTextStyle:symbolicTraits:", v22, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BarButton titleLabel](v3->_doneButton, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v26);

    -[BarButton titleLabel](v3->_doneButton, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAdjustsFontForContentSizeCategory:", 1);

    -[BarButton setAccessibilityIdentifier:](v3->_doneButton, "setAccessibilityIdentifier:", CFSTR("TabViewDoneButton"));
    _WBSLocalizedString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BarButton setTitle:forState:](v3->_doneButton, "setTitle:forState:", v29, 0);
    -[BarButton sf_configureLargeContentViewerWithImage:title:](v3->_doneButton, "sf_configureLargeContentViewerWithImage:title:", 0, v29);
    -[BarButton sizeToFit](v3->_doneButton, "sizeToFit");
    -[UIView addSubview:](v3->_contentContainer, "addSubview:", v3->_doneButton);
    +[BarButton buttonWithType:](BarButton, "buttonWithType:", 1);
    v30 = objc_claimAutoreleasedReturnValue();
    cancelSearchButton = v3->_cancelSearchButton;
    v3->_cancelSearchButton = (BarButton *)v30;

    -[BarButton setExclusiveTouch:](v3->_cancelSearchButton, "setExclusiveTouch:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BarButton titleLabel](v3->_cancelSearchButton, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFont:", v32);

    -[BarButton titleLabel](v3->_cancelSearchButton, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAdjustsFontForContentSizeCategory:", 1);

    _WBSLocalizedString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BarButton setTitle:forState:](v3->_cancelSearchButton, "setTitle:forState:", v35, 0);
    -[BarButton sf_configureLargeContentViewerWithImage:title:](v3->_cancelSearchButton, "sf_configureLargeContentViewerWithImage:title:", 0, v35);
    -[BarButton sizeToFit](v3->_cancelSearchButton, "sizeToFit");
    -[BarButton setAlpha:](v3->_cancelSearchButton, "setAlpha:", 0.0);
    -[UIView addSubview:](v3->_contentContainer, "addSubview:", v3->_cancelSearchButton);
    v36 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    toolbarSeparator = v3->_toolbarSeparator;
    v3->_toolbarSeparator = v36;

    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_toolbarSeparator, "setBackgroundColor:", v38);

    -[UIView setUserInteractionEnabled:](v3->_toolbarSeparator, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v3->_contentContainer, "addSubview:", v3->_toolbarSeparator);
    -[UIView sf_applyContentSizeCategoryLimitsForToolbarButton](v3->_contentContainer, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    objc_msgSend(MEMORY[0x1E0DC3E88], "safari_traitsAffectingTextAppearance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (id)-[TabOverviewToolbar registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v39, v3, sel__setNeedsResizeItems);

    v41 = v3;
  }

  return v3;
}

- (void)setTabGroupButtonConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "buttonConfigurationWithStyle:", self->_tabGroupButtonDisplayStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BarButton setConfiguration:](self->_tabGroupButton, "setConfiguration:", v5);

  objc_msgSend(v4, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _SFAccessibilityIdentifierForBarItem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = CFSTR("Profile");
    objc_msgSend(v4, "accessibilityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WBSMakeAccessibilityIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BarButton setAccessibilityIdentifier:](self->_tabGroupButton, "setAccessibilityIdentifier:", v10);

  }
  else
  {
    -[BarButton setAccessibilityIdentifier:](self->_tabGroupButton, "setAccessibilityIdentifier:", v7);
  }

  self->_needsResizeItems = 1;
  -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");

}

- (void)setSearchBar:(id)a3
{
  UISearchBar *v5;
  id v6;

  v6 = a3;
  v5 = self->_searchBar;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchBar, a3);
    if (-[UISearchBar isDescendantOfView:](v5, "isDescendantOfView:", self))
      -[UISearchBar removeFromSuperview](v5, "removeFromSuperview");
    if (v6 && -[TabOverviewToolbar _canDisplaySearchBarAndSidebarButton](self, "_canDisplaySearchBarAndSidebarButton"))
    {
      -[UIView addSubview:](self->_contentContainer, "addSubview:", v6);
      -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)addInteraction:(id)a3 toBarButton:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addInteraction:", v6);

}

- (void)setBarButton:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)addPrimaryAction:(id)a3 forBarButton:(int64_t)a4
{
  BarButton *v6;
  BarButton *sidebarButton;
  void *v8;
  id v9;

  v9 = a3;
  if (a4 == 4 && !self->_sidebarButton)
  {
    +[BarButton sidebarButtonWithPrimaryAction:](BarButton, "sidebarButtonWithPrimaryAction:", 0);
    v6 = (BarButton *)objc_claimAutoreleasedReturnValue();
    sidebarButton = self->_sidebarButton;
    self->_sidebarButton = v6;

    if (-[TabOverviewToolbar _canDisplaySearchBarAndSidebarButton](self, "_canDisplaySearchBarAndSidebarButton"))
    {
      -[UIView addSubview:](self->_contentContainer, "addSubview:", self->_sidebarButton);
      self->_needsResizeItems = 1;
    }
    -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
  }
  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:forControlEvents:", v9, 0x2000);

}

- (void)setMenu:(id)a3 forBarButton:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMenu:", v6);

}

- (id)_buttonForBarButton:(int64_t)a3
{
  if ((unint64_t)a3 <= 4)
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *off_1E9CFB148[a3]);
  return (id)(id)a2;
}

- (void)setTabGroupButtonDisplayStyle:(int64_t)a3
{
  self->_tabGroupButtonDisplayStyle = a3;
}

- (void)setBackgroundHidden:(BOOL)a3
{
  if (self->_backgroundHidden != a3)
  {
    self->_backgroundHidden = a3;
    -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShouldReserveSpaceForSidebarButton:(BOOL)a3
{
  if (self->_shouldReserveSpaceForSidebarButton != a3)
  {
    self->_shouldReserveSpaceForSidebarButton = a3;
    if (self->_searchBar)
    {
      if (-[TabOverviewToolbar _canDisplaySearchBarAndSidebarButton](self, "_canDisplaySearchBarAndSidebarButton"))
        -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setBarButton:(int64_t)a3 hidden:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  void *v8;
  id v9;

  v4 = a4;
  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "isHidden");
  objc_msgSend(v9, "setHidden:", v4);
  if (!v4)
  {
    objc_msgSend(v9, "configurationUpdateHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v9, "setNeedsUpdateConfiguration");
  }
  if (a3 == 4
    && v7 != v4
    && -[TabOverviewToolbar _canDisplaySearchBarAndSidebarButton](self, "_canDisplaySearchBarAndSidebarButton"))
  {
    -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPlacement:(int64_t)a3
{
  if (self->_placement != a3)
  {
    self->_placement = a3;
    if (-[TabOverviewToolbar _canDisplaySearchBarAndSidebarButton](self, "_canDisplaySearchBarAndSidebarButton"))
    {
      if (self->_searchBar)
        -[UIView addSubview:](self->_contentContainer, "addSubview:");
      if (self->_sidebarButton)
        -[UIView addSubview:](self->_contentContainer, "addSubview:");
    }
    else
    {
      -[UISearchBar removeFromSuperview](self->_searchBar, "removeFromSuperview");
      -[BarButton removeFromSuperview](self->_sidebarButton, "removeFromSuperview");
    }
    -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_canDisplaySearchBarAndSidebarButton
{
  return self->_placement == 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  CGFloat Width;
  int64_t placement;
  double Height;
  BarButton *doneButton;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v26 = *MEMORY[0x1E0C80C00];
  placement = self->_placement;
  switch(placement)
  {
    case 2:
      Width = *MEMORY[0x1E0C9D820];
      v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
    case 1:
      -[TabOverviewToolbar bounds](self, "bounds", a3.width, a3.height);
      Width = CGRectGetWidth(v31);
      v14 = *MEMORY[0x1E0D4F088];
      -[TabOverviewToolbar superview](self, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeAreaInsets");
      v16 = 0.0;
      if (v17 > 0.0)
        v16 = 6.0;
      v3 = v14 + v16;

      break;
    case 0:
      -[TabOverviewToolbar _resizeItemsIfNeeded](self, "_resizeItemsIfNeeded", a3.width, a3.height);
      -[UISearchBar bounds](self->_searchBar, "bounds");
      Height = CGRectGetHeight(v28);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      doneButton = self->_doneButton;
      v24[0] = self->_addTabButton;
      v24[1] = doneButton;
      v24[2] = self->_tabGroupButton;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "bounds");
            Height = fmax(Height, CGRectGetHeight(v29));
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v11);
      }

      -[TabOverviewToolbar bounds](self, "bounds");
      Width = CGRectGetWidth(v30);
      v3 = fmax(Height + 0.0 + -6.0, 44.0);
      break;
  }
  v18 = Width;
  v19 = v3;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)layoutSubviews
{
  int64_t placement;
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TabOverviewToolbar;
  -[TabOverviewToolbar layoutSubviews](&v5, sel_layoutSubviews);
  if (!self->_contentBorrowed)
  {
    -[TabOverviewToolbar bounds](self, "bounds");
    -[UIView setFrame:](self->_contentContainer, "setFrame:");
  }
  -[TabOverviewToolbar _resizeItemsIfNeeded](self, "_resizeItemsIfNeeded");
  placement = self->_placement;
  if (placement)
  {
    if (placement == 1)
      -[TabOverviewToolbar _layoutForBottomPlacement](self, "_layoutForBottomPlacement");
  }
  else
  {
    -[TabOverviewToolbar _layoutForTopPlacement](self, "_layoutForTopPlacement");
  }
  v4 = self->_backgroundHidden || self->_contentBorrowed;
  -[UIView setHidden:](self->_toolbarSeparator, "setHidden:", v4);
  -[UIVisualEffectView setHidden:](self->_background, "setHidden:", v4);
}

- (void)_resizeItemsIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  CGRect v10;

  if (self->_needsResizeItems)
  {
    -[UISearchBar text](self->_searchBar, "text");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setText:](self->_searchBar, "setText:", &stru_1E9CFDBB0);
    -[UISearchBar searchField](self->_searchBar, "searchField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], v5);
    self->_searchBarMinimumWidth = v6;

    -[UISearchBar setText:](self->_searchBar, "setText:", v9);
    -[BarButton sizeToFit](self->_doneButton, "sizeToFit");
    -[BarButton sizeToFit](self->_addTabButton, "sizeToFit");
    -[BarButton sizeToFit](self->_cancelSearchButton, "sizeToFit");
    -[BarButton sizeToFit](self->_sidebarButton, "sizeToFit");
    -[BarButton sizeThatFits:](self->_tabGroupButton, "sizeThatFits:", v4, v5);
    -[BarButton setBounds:](self->_tabGroupButton, "setBounds:", 0.0, 0.0, v7, v8);
    -[BarButton bounds](self->_tabGroupButton, "bounds");
    self->_tabGroupButtonPreferredWidth = CGRectGetWidth(v10);
    -[BarButton sizeToFit](self->_cancelSearchButton, "sizeToFit");
    self->_needsResizeItems = 0;

  }
}

- (void)_layoutForTopPlacement
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double Width;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double searchBarLeadingMargin;
  BarButton *sidebarButton;
  double MaxX;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  BarButton *v63;
  double v64;
  double v65;
  double v66;
  BarButton *addTabButton;
  BarButton *cancelSearchButton;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t i;
  void *v75;
  void (**v76)(_QWORD, _QWORD, _QWORD);
  uint64_t v77;
  uint64_t v78;
  double Height;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat rect;
  CGFloat v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  _QWORD aBlock[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  _BYTE v106[128];
  uint64_t v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;

  v107 = *MEMORY[0x1E0C80C00];
  -[TabOverviewToolbar safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = -[TabOverviewToolbar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[TabOverviewToolbar bounds](self, "bounds");
  v14 = v12;
  if (v4 == 0.0)
    v15 = 3.0;
  else
    v15 = 0.0;
  v92 = v15;
  v98 = v11;
  v99 = v10;
  rect = v13;
  v93 = v4;
  v16 = v4 + v15 + -3.0 + (CGRectGetHeight(*(CGRect *)&v10) - v4) * 0.5;
  if (self->_sidebarButton)
    v17 = v16 + 3.0;
  else
    v17 = v16;
  -[BarButton bounds](self->_doneButton, "bounds");
  v90 = v8;
  v91 = v6;
  v97 = v17;
  _SFRoundRectToPixels();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[BarButton setFrame:](self->_doneButton, "setFrame:");
  -[BarButton bounds](self->_addTabButton, "bounds");
  v88 = v21;
  v89 = v19;
  v86 = v25;
  v87 = v23;
  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  if (v9)
    CGRectGetMinX(*(CGRect *)&v26);
  else
    CGRectGetMaxX(*(CGRect *)&v26);
  _SFRoundRectToPixels();
  v31 = v30;
  v85 = v32;
  v95 = v33;
  v96 = v34;
  -[BarButton setFrame:](self->_addTabButton, "setFrame:");
  -[BarButton bounds](self->_sidebarButton, "bounds");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[TabOverviewToolbar directionalLayoutMargins](self, "directionalLayoutMargins");
  v44 = fmax(v43, 20.0);
  v84 = v31;
  if ((v9 & 1) == 0)
  {
    v108.origin.y = v98;
    v108.origin.x = v99;
    v108.size.width = v14;
    v108.size.height = rect;
    Width = CGRectGetWidth(v108);
    v109.origin.x = v36;
    v109.origin.y = v38;
    v109.size.width = v40;
    v109.size.height = v42;
    v44 = Width - CGRectGetWidth(v109) - v44;
  }
  v110.origin.x = v44;
  v110.origin.y = v38;
  v110.size.width = v40;
  v110.size.height = v42;
  v46 = v97 + CGRectGetHeight(v110) * -0.5;
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_sidebarButton, "setFrame:");
  v111.origin.y = v98;
  v111.origin.x = v99;
  v111.size.width = v14;
  v111.size.height = rect;
  v47 = CGRectGetWidth(v111);
  v112.origin.x = v85;
  v112.origin.y = v95;
  v112.size.height = v96;
  v112.size.width = v84;
  v48 = v47 - CGRectGetWidth(v112);
  v113.origin.y = v88;
  v113.origin.x = v89;
  v113.size.height = v86;
  v113.size.width = v87;
  v49 = v48 - CGRectGetWidth(v113);
  v114.origin.x = v44;
  v114.origin.y = v46;
  v114.size.width = v40;
  v114.size.height = v42;
  fmin(fmin(v49 - CGRectGetWidth(v114) - self->_searchBarMinimumWidth + -180.0, self->_tabGroupButtonPreferredWidth), 350.0);
  -[BarButton frame](self->_tabGroupButton, "frame");
  v50 = v85;
  v51 = v95;
  v52 = v96;
  v53 = v84;
  if (v9)
    CGRectGetMinX(*(CGRect *)&v50);
  else
    CGRectGetMaxX(*(CGRect *)&v50);
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_tabGroupButton, "setFrame:");
  -[BarButton setNeedsLayout](self->_tabGroupButton, "setNeedsLayout");
  -[BarButton bounds](self->_cancelSearchButton, "bounds");
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_cancelSearchButton, "setFrame:");
  searchBarLeadingMargin = self->_searchBarLeadingMargin;
  sidebarButton = self->_sidebarButton;
  if (sidebarButton
    && (self->_shouldReserveSpaceForSidebarButton || (-[BarButton isHidden](sidebarButton, "isHidden") & 1) == 0))
  {
    if (v9)
    {
      v115.origin.y = v46;
      v115.origin.x = v44;
      v115.size.width = v40;
      v115.size.height = v42;
      MaxX = CGRectGetMaxX(v115);
    }
    else
    {
      v116.origin.y = v98;
      v116.origin.x = v99;
      v116.size.width = v14;
      v116.size.height = rect;
      v57 = CGRectGetWidth(v116);
      v117.origin.y = v46;
      v117.origin.x = v44;
      v117.size.width = v40;
      v117.size.height = v42;
      MaxX = v57 - CGRectGetMinX(v117);
    }
    searchBarLeadingMargin = searchBarLeadingMargin + fmax(MaxX + 30.0 - searchBarLeadingMargin, 0.0);
  }
  v58 = fmax(searchBarLeadingMargin, fmax(v91, v90));
  -[BarButton bounds](self->_tabGroupButton, "bounds", *(_QWORD *)&v84);
  v59 = CGRectGetWidth(v118);
  -[BarButton bounds](self->_addTabButton, "bounds");
  v60 = v59 + CGRectGetWidth(v119);
  -[BarButton bounds](self->_doneButton, "bounds");
  v61 = v60 + CGRectGetWidth(v120) + 60.0;
  v121.origin.y = v98;
  v121.origin.x = v99;
  v121.size.width = v14;
  v121.size.height = rect;
  v62 = CGRectGetWidth(v121) + v58 * -2.0 + -30.0 - v61;
  v63 = self->_sidebarButton;
  if (v63)
  {
    -[BarButton bounds](v63, "bounds");
    v62 = v62 - (CGRectGetWidth(v122) + 30.0);
  }
  v64 = fmax(self->_searchBarMinimumWidth, fmin(v62, 371.0));
  if ((v9 & 1) == 0)
  {
    v123.origin.y = v98;
    v123.origin.x = v99;
    v123.size.width = v14;
    v123.size.height = rect;
    v58 = CGRectGetWidth(v123) - v58 - v64;
  }
  if (self->_sidebarButton)
    v65 = v93 + v92 + -6.0 + 3.0;
  else
    v65 = v93 + v92 + -6.0;
  -[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v58, v65, v64, v66);
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  addTabButton = self->_addTabButton;
  v105[0] = self->_doneButton;
  v105[1] = addTabButton;
  cancelSearchButton = self->_cancelSearchButton;
  v105[2] = self->_tabGroupButton;
  v105[3] = cancelSearchButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v102;
    v73 = 0.0;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v102 != v72)
          objc_enumerationMutation(v69);
        objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "bounds");
        v73 = fmax(v73, CGRectGetHeight(v124));
      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
    }
    while (v71);
  }
  else
  {
    v73 = 0.0;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__TabOverviewToolbar__layoutForTopPlacement__block_invoke;
  aBlock[3] = &__block_descriptor_40_e22_v24__0__BarButton_8Q16l;
  *(double *)&aBlock[4] = v73;
  v75 = _Block_copy(aBlock);
  v76 = (void (**)(_QWORD, _QWORD, _QWORD))v75;
  if (v9)
    v77 = 2;
  else
    v77 = 8;
  if (v9)
    v78 = 8;
  else
    v78 = 2;
  (*((void (**)(void *, BarButton *, uint64_t))v75 + 2))(v75, self->_doneButton, v77);
  ((void (**)(_QWORD, BarButton *, uint64_t))v76)[2](v76, self->_addTabButton, 10);
  ((void (**)(_QWORD, BarButton *, uint64_t))v76)[2](v76, self->_tabGroupButton, v78);
  ((void (**)(_QWORD, BarButton *, _QWORD))v76)[2](v76, self->_cancelSearchButton, 0);
  v125.origin.x = v99;
  v125.origin.y = v98;
  v125.size.width = v14;
  v125.size.height = rect;
  Height = CGRectGetHeight(v125);
  _SFOnePixel();
  v81 = Height - v80;
  v126.origin.x = v99;
  v126.origin.y = v98;
  v126.size.width = v14;
  v126.size.height = rect;
  v82 = CGRectGetWidth(v126);
  _SFOnePixel();
  -[UIView setFrame:](self->_toolbarSeparator, "setFrame:", 0.0, v81, v82, v83);

}

void __44__TabOverviewToolbar__layoutForTopPlacement__block_invoke(uint64_t a1, void *a2)
{
  double v2;
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
  id v14;
  CGRect v15;

  v14 = a2;
  objc_msgSend(v14, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  UIEdgeInsetsMakeWithEdges();
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  CGRectGetHeight(v15);
  UIEdgeInsetsMakeWithEdges();
  UIEdgeInsetsMin();
  objc_msgSend(v14, "setBarButtonHitRect:", v3 + v13, v5 + v10, v7 - (v13 + v11), v9 - (v10 + v12));

}

- (void)setShowingSearchCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  double v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  double v11;
  double v12;
  _QWORD v13[5];
  BOOL v14;
  _QWORD aBlock[5];
  BOOL v16;

  v5 = a3;
  -[BarButton alpha](self->_cancelSearchButton, "alpha");
  if ((((v7 <= 0.0) ^ v5) & 1) == 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__TabOverviewToolbar_setShowingSearchCancelButton_animated___block_invoke;
    aBlock[3] = &unk_1E9CF1EE8;
    aBlock[4] = self;
    v16 = v5;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __60__TabOverviewToolbar_setShowingSearchCancelButton_animated___block_invoke_2;
    v13[3] = &unk_1E9CF1EE8;
    v14 = v5;
    v13[4] = self;
    v10 = (void (**)(_QWORD))_Block_copy(v13);
    if (!a4)
    {
      v9[2](v9);
      v10[2](v10);
    }
    if (v5)
      v11 = 0.1;
    else
      v11 = 0.0;
    if (v5)
      v12 = 0.0;
    else
      v12 = 0.1;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327686, v9, 0, 0.35, v11);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327686, v10, 0, 0.35, v12);

  }
}

- (void)setSearchBarLeadingMargin:(double)a3
{
  if (self->_searchBarLeadingMargin != a3)
  {
    self->_searchBarLeadingMargin = a3;
    -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_layoutForBottomPlacement
{
  double v3;
  double v4;
  int v5;
  double v6;
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
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double Width;
  double v24;
  double MidY;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat rect;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  -[TabOverviewToolbar safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v5 = -[TabOverviewToolbar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[TabOverviewToolbar bounds](self, "bounds");
  rect = v9;
  v10 = 6.0;
  if (v4 <= 0.0)
    v10 = 0.0;
  v63 = v7;
  v65 = v6;
  v11 = v6 + 0.0;
  v12 = v10 + v7;
  v61 = v8;
  v13 = v8 - (v4 + v10);
  -[BarButton bounds](self->_addTabButton, "bounds");
  v17 = v16;
  v19 = v18;
  v72 = v15;
  if (v5)
  {
    v20 = v15;
    v21 = 20.0;
  }
  else
  {
    v22 = v14;
    v74.origin.x = v11;
    v74.origin.y = v12;
    v74.size.width = rect;
    v74.size.height = v13;
    Width = CGRectGetWidth(v74);
    v75.origin.x = v22;
    v75.origin.y = v17;
    v75.size.width = v72;
    v75.size.height = v19;
    v24 = Width - CGRectGetWidth(v75);
    v20 = v72;
    v21 = v24 + -20.0;
  }
  v76.origin.x = v11;
  v76.origin.y = v12;
  v76.size.width = rect;
  v76.size.height = v13;
  MidY = CGRectGetMidY(v76);
  v77.origin.x = v21;
  v77.origin.y = v17;
  v77.size.width = v20;
  v77.size.height = v19;
  v66 = MidY + CGRectGetHeight(v77) * -0.5;
  v67 = v19;
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_addTabButton, "setFrame:");
  -[BarButton bounds](self->_doneButton, "bounds");
  v27 = v26;
  v29 = v28;
  v70 = v31;
  v71 = v30;
  v32 = 20.0;
  v33 = 20.0;
  if (v5)
  {
    v78.origin.x = v11;
    v78.origin.y = v12;
    v78.size.width = rect;
    v78.size.height = v13;
    v34 = CGRectGetWidth(v78);
    v79.origin.x = v27;
    v79.origin.y = v29;
    v79.size.height = v70;
    v79.size.width = v71;
    v33 = v34 - CGRectGetWidth(v79) + -20.0;
    v32 = v21;
  }
  v60 = v32;
  v80.origin.x = v11;
  v80.origin.y = v12;
  v80.size.width = rect;
  v80.size.height = v13;
  v35 = CGRectGetMidY(v80);
  v81.origin.x = v33;
  v81.origin.y = v29;
  v69 = v11;
  v81.size.width = v71;
  v81.size.height = v70;
  v68 = v12;
  v36 = v35 - CGRectGetHeight(v81) * 0.5;
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_doneButton, "setFrame:");
  v82.origin.y = v63;
  v82.origin.x = v65;
  v82.size.width = rect;
  v82.size.height = v61;
  v37 = CGRectGetWidth(v82);
  v83.origin.x = v21;
  v83.origin.y = v66;
  v83.size.height = v19;
  v83.size.width = v72;
  v38 = v37 - CGRectGetWidth(v83);
  v84.origin.x = v33;
  v62 = v36;
  v84.origin.y = v36;
  v84.size.width = v71;
  v84.size.height = v70;
  v39 = v38 - CGRectGetWidth(v84) + -80.0;
  -[BarButton bounds](self->_tabGroupButton, "bounds");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v85.origin.y = v68;
  v85.origin.x = v11;
  v85.size.width = rect;
  v85.size.height = v13;
  v48 = CGRectGetMidY(v85);
  v86.origin.x = v41;
  v86.origin.y = v43;
  v86.size.width = v45;
  v64 = v47;
  v86.size.height = v47;
  v49 = v48 - CGRectGetHeight(v86) * 0.5;
  if (self->_tabGroupButtonPreferredWidth >= v39)
  {
    if (v5)
      v54 = v67;
    else
      v54 = v70;
    if (v5)
      v55 = v72;
    else
      v55 = v71;
    v56 = v66;
    if (!v5)
      v56 = v62;
    v57 = v60;
    CGRectGetMaxX(*(CGRect *)(&v54 - 3));
    v52 = rect;
    v53 = v13;
    v51 = v68;
    v50 = v69;
  }
  else
  {
    v51 = v68;
    v50 = v69;
    v87.origin.x = v69;
    v87.origin.y = v68;
    v87.size.width = rect;
    v87.size.height = v13;
    CGRectGetWidth(v87);
    v88.origin.x = v41;
    v88.origin.y = v49;
    v88.size.width = v45;
    v88.size.height = v64;
    CGRectGetWidth(v88);
    v52 = rect;
    v53 = v13;
  }
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_tabGroupButton, "setFrame:");
  v89.origin.x = v50;
  v89.origin.y = v51;
  v89.size.width = v52;
  v89.size.height = v53;
  v58 = CGRectGetWidth(v89);
  _SFOnePixel();
  -[UIView setFrame:](self->_toolbarSeparator, "setFrame:", 0.0, 0.0, v58, v59);
}

- (void)_setNeedsResizeItems
{
  self->_needsResizeItems = 1;
  -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat width;
  CGFloat height;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  TabOverviewToolbar *v32;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGPoint v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  y = a3.y;
  x = a3.x;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!-[TabOverviewToolbar isUserInteractionEnabled](self, "isUserInteractionEnabled")
    || (-[TabOverviewToolbar bounds](self, "bounds"), v41.x = x, v41.y = y, !CGRectContainsPoint(v43, v41)))
  {
    v32 = 0;
    goto LABEL_22;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[UIView subviews](self->_contentContainer, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v9)
  {

LABEL_24:
    v32 = self;
    goto LABEL_22;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v36;
  v34 = 1.79769313e308;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v36 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v14, "alpha");
      if (v15 > 0.0 && (objc_msgSend(v14, "isHidden") & 1) == 0)
      {
        if (objc_msgSend(v14, "isUserInteractionEnabled"))
        {
          objc_msgSend(v14, "frame");
          v16 = v44.origin.x;
          v17 = v44.origin.y;
          width = v44.size.width;
          height = v44.size.height;
          v20 = fmin((CGRectGetWidth(v44) + -44.0) * 0.5, 0.0);
          v45.origin.x = v16;
          v45.origin.y = v17;
          v45.size.width = width;
          v45.size.height = height;
          v21 = fmin((CGRectGetHeight(v45) + -44.0) * 0.5, 0.0);
          v46.origin.x = v16;
          v46.origin.y = v17;
          v46.size.width = width;
          v46.size.height = height;
          v47 = CGRectInset(v46, v20, v21);
          v22 = v47.origin.x;
          v23 = v47.origin.y;
          v24 = v47.size.width;
          v25 = v47.size.height;
          v42.x = x;
          v42.y = y;
          if (CGRectContainsPoint(v47, v42))
          {
            v48.origin.x = v22;
            v48.origin.y = v23;
            v48.size.width = v24;
            v48.size.height = v25;
            v26 = vabdd_f64(x, CGRectGetMinX(v48));
            v49.origin.x = v22;
            v49.origin.y = v23;
            v49.size.width = v24;
            v49.size.height = v25;
            v27 = fmin(v26, vabdd_f64(x, CGRectGetMaxX(v49)));
            if (v27 < v34)
            {
              v28 = v14;

              v34 = v27;
              v11 = v28;
            }
          }
        }
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  }
  while (v10);

  if (!v11)
    goto LABEL_24;
  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v11, "hitTest:withEvent:", v7);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (void *)v29;
  else
    v31 = v11;
  v32 = v31;

LABEL_22:
  return v32;
}

- (id)menuForBarButton:(int64_t)a3
{
  void *v3;
  void *v4;

  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTabGroupButtonTitle:(id)a3
{
  id v4;
  ToolbarItemConfiguration *v5;

  v4 = a3;
  v5 = objc_alloc_init(ToolbarItemConfiguration);
  -[ToolbarItemConfiguration setTitle:](v5, "setTitle:", v4);

  -[TabOverviewToolbar setTabGroupButtonConfiguration:](self, "setTabGroupButtonConfiguration:", v5);
}

- (BOOL)barButtonIsEnabled:(int64_t)a3
{
  void *v3;
  char v4;

  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (BOOL)barButtonIsHidden:(int64_t)a3
{
  void *v3;
  char v4;

  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

uint64_t __60__TabOverviewToolbar_setShowingSearchCancelButton_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", (double)*(unint64_t *)&a2);
}

uint64_t __60__TabOverviewToolbar_setShowingSearchCancelButton_animated___block_invoke_2(uint64_t a1)
{
  double v2;

  if (*(_BYTE *)(a1 + 40))
    v2 = 0.0;
  else
    v2 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", v2);
}

- (void)removePrimaryAction:(id)a3 forBarButton:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAction:forControlEvents:", v6, 0x2000);

}

- (void)removeInteraction:(id)a3 fromBarButton:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeInteraction:", v6);

}

- (CGRect)rectForBarButton:(int64_t)a3
{
  void *v3;
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
  double v15;
  CGRect result;

  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)resolvedTintColorForBarButton:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)snapshotBarContentsAfterScreenUpdates:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC3F58]);
  -[TabOverviewToolbar bounds](self, "bounds");
  v6 = (void *)objc_msgSend(v5, "initWithFrame:");
  -[UIVisualEffectView effect](self->_background, "effect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEffect:", v7);

  -[UIView snapshotViewAfterScreenUpdates:](self->_contentContainer, "snapshotViewAfterScreenUpdates:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_contentContainer, "frame");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  return v6;
}

- (id)toolbarContentViewForCapsuleCollectionView:(id)a3
{
  UIView *v3;

  if (self->_placement == 2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  }
  else
  {
    self->_contentBorrowed = 1;
    -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout", a3);
    v3 = self->_contentContainer;
  }
  return v3;
}

- (double)capsuleCollectionView:(id)a3 heightForToolbarContentView:(id)a4
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v4 = 0.0;
  if (self->_placement != 2)
  {
    v5 = *MEMORY[0x1E0D4F088];
    -[TabOverviewToolbar superview](self, "superview", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaInsets");
    v7 = 0.0;
    if (v8 > 0.0)
      v7 = 6.0;
    v4 = v5 + v7;

  }
  return v4;
}

- (void)capsuleCollectionView:(id)a3 relinquishToolbarContentView:(id)a4
{
  if (self->_placement != 2)
  {
    self->_contentBorrowed = 0;
    -[TabOverviewToolbar addSubview:](self, "addSubview:", a4);
    -[TabOverviewToolbar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isBackgroundHidden
{
  return self->_backgroundHidden;
}

- (BOOL)contentBorrowed
{
  return self->_contentBorrowed;
}

- (int64_t)placement
{
  return self->_placement;
}

- (double)searchBarLeadingMargin
{
  return self->_searchBarLeadingMargin;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (BOOL)shouldReserveSpaceForSidebarButton
{
  return self->_shouldReserveSpaceForSidebarButton;
}

- (int64_t)tabGroupButtonDisplayStyle
{
  return self->_tabGroupButtonDisplayStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_toolbarSeparator, 0);
  objc_storeStrong((id *)&self->_tabGroupButton, 0);
  objc_storeStrong((id *)&self->_sidebarButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
  objc_storeStrong((id *)&self->_cancelSearchButton, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_addTabButton, 0);
}

@end
