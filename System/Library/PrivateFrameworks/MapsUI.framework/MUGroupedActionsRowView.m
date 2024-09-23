@implementation MUGroupedActionsRowView

- (MUGroupedActionsRowView)initWithConfiguration:(id)a3
{
  id v5;
  MUGroupedActionsRowView *v6;
  MUGroupedActionsRowView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUGroupedActionsRowView;
  v6 = -[MUGroupedActionsRowView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[MUGroupedActionsRowView _setupStackLayout](v7, "_setupStackLayout");
  }

  return v7;
}

- (void)_setupStackLayout
{
  MUCompositionalStackLayoutGroup *v3;
  MUCompositionalStackLayoutGroup *buttonLayoutGroup;
  double v5;
  MUCompositionalStackLayout *v6;
  void *v7;
  MUCompositionalStackLayout *v8;
  MUCompositionalStackLayout *containerStackLayout;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = -[MUCompositionalStackLayoutGroup initWithIdentifier:axis:]([MUCompositionalStackLayoutGroup alloc], "initWithIdentifier:axis:", CFSTR("buttons"), -[MUGroupedActionsRowView preferredOrientation](self, "preferredOrientation"));
  buttonLayoutGroup = self->_buttonLayoutGroup;
  self->_buttonLayoutGroup = v3;

  -[MUCompositionalStackLayoutGroup setSpacing:](self->_buttonLayoutGroup, "setSpacing:", 8.0);
  LODWORD(v5) = 1112276992;
  -[MUCompositionalStackLayoutGroup setAlignmentFittingSizePriority:](self->_buttonLayoutGroup, "setAlignmentFittingSizePriority:", v5);
  v6 = [MUCompositionalStackLayout alloc];
  -[MUGroupedActionsRowView layoutMarginsGuide](self, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MUCompositionalStackLayout initWithContainer:group:](v6, "initWithContainer:group:", v7, self->_buttonLayoutGroup);
  containerStackLayout = self->_containerStackLayout;
  self->_containerStackLayout = v8;

  v10 = (void *)MEMORY[0x1E0CB3718];
  v16[0] = self->_containerStackLayout;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_mapsui_activateLayouts:", v11);

  -[MUGroupedActionsRowView _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)-[MUGroupedActionsRowView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v13, sel__updateLayoutIfNeeded);

}

- (void)setViewModels:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *viewModels;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSArray isEqual:](self->_viewModels, "isEqual:", v4) & 1) == 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_viewModels;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9++), "removeObserver:", self);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v10 = (NSArray *)objc_msgSend(v4, "copy");
    viewModels = self->_viewModels;
    self->_viewModels = v10;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_viewModels;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "addObserver:", self, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[MUGroupedActionsRowView createActionViews](self, "createActionViews");
  }

}

- (NSArray)actionButtons
{
  return (NSArray *)(id)-[NSArray copy](self->_actionButtons, "copy");
}

- (void)createActionViews
{
  NSArray **p_actionButtons;
  void *v4;
  unint64_t v5;
  MUActionRowItemView *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_actionButtons = &self->_actionButtons;
  -[NSArray makeObjectsPerformSelector:](self->_actionButtons, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_viewModels, "count"))
  {
    v5 = 0;
    do
    {
      v6 = -[MUActionRowItemView initWithStyle:useVibrancy:]([MUActionRowItemView alloc], "initWithStyle:useVibrancy:", -[MUGroupedActionsRowViewConfiguration style](self->_configuration, "style"), -[MUGroupedActionsRowViewConfiguration useVibrancy](self->_configuration, "useVibrancy"));
      -[MUGroupedActionsRowViewConfiguration tintColor](self->_configuration, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUActionRowItemView setTintColor:](v6, "setTintColor:", v7);

      -[MUGroupedActionsRowViewConfiguration itemBackgroundColor](self->_configuration, "itemBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUActionRowItemView setContentBackgroundColor:](v6, "setContentBackgroundColor:", v8);

      -[MUGroupedActionsRowViewConfiguration itemHighlightColor](self->_configuration, "itemHighlightColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUActionRowItemView setHighlightedBackgroundColor:](v6, "setHighlightedBackgroundColor:", v9);

      -[MUActionRowItemView setDelegate:](v6, "setDelegate:", self);
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (v5 < -[NSArray count](self->_viewModels, "count"));
  }
  objc_storeStrong((id *)p_actionButtons, v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_viewModels;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[MUGroupedActionsRowView actionRowItemViewModelDidUpdate:](self, "actionRowItemViewModelDidUpdate:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  -[MUGroupedActionsRowView _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
}

- (int64_t)preferredOrientation
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;

  if (MUIdiomInTraitEnvironment(self) == 5)
    return 0;
  -[MUGroupedActionsRowView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  return IsAccessibilityCategory;
}

- (int64_t)preferredDistribution
{
  if (MUIdiomInTraitEnvironment(self) == 5)
    return 2;
  else
    return -[MUCompositionalStackLayoutGroup axis](self->_buttonLayoutGroup, "axis") != 1;
}

- (void)actionRowItemViewModelDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(void);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  void (**v24)(void);
  _QWORD aBlock[4];
  id v26;
  id location;

  v4 = a3;
  -[MUGroupedActionsRowView _itemViewForViewModel:](self, "_itemViewForViewModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "setEnabled:", objc_msgSend(v4, "isEnabled"));
    objc_msgSend(v4, "titleText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleText:", v6);

    objc_msgSend(v4, "symbolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlyphName:", v7);

    objc_msgSend(v4, "accessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessoryView:", v8);

    objc_msgSend(v4, "accessibilityIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v9);

    objc_msgSend(v4, "titleText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v10);

    objc_initWeak(&location, v5);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MUGroupedActionsRowView_actionRowItemViewModelDidUpdate___block_invoke;
    aBlock[3] = &unk_1E2E022D0;
    objc_copyWeak(&v26, &location);
    v12 = (void (**)(void))_Block_copy(aBlock);
    v12[2]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildMenuWithPresentationOptions:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", 1);
      v19 = v11;
      v20 = 3221225472;
      v21 = __59__MUGroupedActionsRowView_actionRowItemViewModelDidUpdate___block_invoke_2;
      v22 = &unk_1E2E022F8;
      v23 = v4;
      v24 = v12;
      objc_msgSend(v5, "_setMenuProvider:", &v19);

    }
    if (!+[MUInfoCardStyle hasExternallyProvidedTintColor](MUInfoCardStyle, "hasExternallyProvidedTintColor", v19, v20, v21, v22))
    {
      objc_msgSend(v4, "preferredTintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v4, "preferredTintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setTintColor:", v16);

      }
      objc_msgSend(v4, "preferredBackgroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v4, "preferredBackgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setContentBackgroundColor:", v18);

      }
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

MUPresentationOptions *__59__MUGroupedActionsRowView_actionRowItemViewModelDidUpdate___block_invoke(id *a1)
{
  MUPresentationOptions *v2;
  id WeakRetained;
  id v4;
  void *v5;

  v2 = objc_alloc_init(MUPresentationOptions);
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  -[MUPresentationOptions setSourceView:](v2, "setSourceView:", WeakRetained);

  v4 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPresentationOptions setContextMenuInteraction:](v2, "setContextMenuInteraction:", v5);

  return v2;
}

id __59__MUGroupedActionsRowView_actionRowItemViewModelDidUpdate___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "buildMenuWithPresentationOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_itemViewForViewModel:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[NSArray indexOfObject:](self->_viewModels, "indexOfObject:", a3);
  if (v4 >= -[NSArray count](self->_actionButtons, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_actionButtons, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_viewModelForItemView:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[NSArray indexOfObject:](self->_actionButtons, "indexOfObject:", a3);
  if (v4 >= -[NSArray count](self->_viewModels, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_viewModels, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_updateLayoutIfNeeded
{
  int64_t v3;
  double v4;
  MUFeatureDiscoveryAnnotationView *featureDiscoveryView;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  MUFeatureDiscoveryAnnotationView *v15;
  MUFeatureDiscoveryAnnotationView *v16;
  MUFeatureDiscoveryAnnotationView *v17;
  void *v18;
  void *v19;
  MUCompositionalStackLayoutGroup *v20;
  MUFeatureDiscoveryAnnotationView *v21;
  void *v22;
  MUCompositionalStackLayout *v23;
  void *v24;
  MUCompositionalStackLayout *v25;
  MUCompositionalStackLayout *v26;
  MUCompositionalStackLayout *v27;
  MUCompositionalStackLayout *v28;
  void *v29;
  void *v30;
  int64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  MUCompositionalStackLayout *v47;
  _QWORD v48[2];
  MUCompositionalStackLayout *containerStackLayout;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = -[MUGroupedActionsRowViewConfiguration style](self->_configuration, "style");
  if (v3 == 1)
  {
    v4 = 4.0;
  }
  else
  {
    if (v3)
      goto LABEL_6;
    v4 = 8.0;
  }
  -[MUCompositionalStackLayoutGroup setSpacing:](self->_buttonLayoutGroup, "setSpacing:", v4);
LABEL_6:
  -[MUCompositionalStackLayoutGroup setAxis:](self->_buttonLayoutGroup, "setAxis:", -[MUGroupedActionsRowView preferredOrientation](self, "preferredOrientation"));
  -[MUCompositionalStackLayoutGroup setDistribution:](self->_buttonLayoutGroup, "setDistribution:", -[MUGroupedActionsRowView preferredDistribution](self, "preferredDistribution"));
  -[MUFeatureDiscoveryAnnotationView removeFromSuperview](self->_featureDiscoveryView, "removeFromSuperview");
  featureDiscoveryView = self->_featureDiscoveryView;
  self->_featureDiscoveryView = 0;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = 424;
  v7 = self->_actionButtons;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[MUGroupedActionsRowView _viewModelForItemView:](self, "_viewModelForItemView:", v12, v37);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isHidden"))
        {
          objc_msgSend(v12, "removeFromSuperview");
        }
        else
        {
          -[MUGroupedActionsRowView addSubview:](self, "addSubview:", v12);
          objc_msgSend(v6, "addObject:", v12);
        }
        objc_msgSend(v13, "featureDiscoveryView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = self->_featureDiscoveryView;

          if (!v15)
          {
            objc_msgSend(v13, "featureDiscoveryView");
            v16 = (MUFeatureDiscoveryAnnotationView *)objc_claimAutoreleasedReturnValue();
            v17 = self->_featureDiscoveryView;
            self->_featureDiscoveryView = v16;

            -[MUFeatureDiscoveryAnnotationView setTranslatesAutoresizingMaskIntoConstraints:](self->_featureDiscoveryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            -[MUFeatureDiscoveryAnnotationView setShowBubbleIndicator:](self->_featureDiscoveryView, "setShowBubbleIndicator:", 1);
            -[MUFeatureDiscoveryAnnotationView setSourceView:](self->_featureDiscoveryView, "setSourceView:", v12);
            -[MUGroupedActionsRowView addSubview:](self, "addSubview:", self->_featureDiscoveryView);
          }
        }

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v9);
  }

  -[MUCompositionalStackLayoutGroup setArrangedLayoutItems:](self->_buttonLayoutGroup, "setArrangedLayoutItems:", v6);
  v18 = (void *)MEMORY[0x1E0CB3718];
  containerStackLayout = self->_containerStackLayout;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &containerStackLayout, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_mapsui_deactivateLayouts:", v19);

  if (self->_featureDiscoveryView)
  {
    v20 = -[MUCompositionalStackLayoutGroup initWithIdentifier:axis:]([MUCompositionalStackLayoutGroup alloc], "initWithIdentifier:axis:", CFSTR("content"), 1);
    -[MUCompositionalStackLayoutGroup setSpacing:](v20, "setSpacing:", 20.0);
    v21 = self->_featureDiscoveryView;
    v48[0] = self->_buttonLayoutGroup;
    v48[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCompositionalStackLayoutGroup setArrangedLayoutItems:](v20, "setArrangedLayoutItems:", v22);

    v23 = [MUCompositionalStackLayout alloc];
    -[MUGroupedActionsRowView layoutMarginsGuide](self, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MUCompositionalStackLayout initWithContainer:group:](v23, "initWithContainer:group:", v24, v20);
    v26 = self->_containerStackLayout;
    self->_containerStackLayout = v25;

  }
  else
  {
    v27 = [MUCompositionalStackLayout alloc];
    -[MUGroupedActionsRowView layoutMarginsGuide](self, "layoutMarginsGuide");
    v20 = (MUCompositionalStackLayoutGroup *)objc_claimAutoreleasedReturnValue();
    v28 = -[MUCompositionalStackLayout initWithContainer:group:](v27, "initWithContainer:group:", v20, self->_buttonLayoutGroup);
    v24 = self->_containerStackLayout;
    self->_containerStackLayout = v28;
  }

  v29 = (void *)MEMORY[0x1E0CB3718];
  v47 = self->_containerStackLayout;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_mapsui_activateLayouts:", v30);

  v31 = -[MUCompositionalStackLayoutGroup axis](self->_buttonLayoutGroup, "axis");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v32 = *(id *)((char *)&self->super.super.super.isa + v37);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "setFullWidthMode:", v31 == 1);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v34);
  }

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUGroupedActionsRowView;
  -[MUGroupedActionsRowView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MUGroupedActionsRowView _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
}

- (void)actionRowItemSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MUPresentationOptions *v7;

  v4 = a3;
  v7 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions setSourceView:](v7, "setSourceView:", v4);
  objc_msgSend(v4, "frame");
  -[MUPresentationOptions setSourceRect:](v7, "setSourceRect:");
  -[MUGroupedActionsRowView _viewModelForItemView:](self, "_viewModelForItemView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MUGroupedActionsRowView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionsRowView:didSelectViewModel:presentationOptions:", self, v5, v7);

  }
}

- (void)actionRowItemPresentedMenu:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MUGroupedActionsRowView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = v9;
  if ((v5 & 1) != 0)
  {
    -[MUGroupedActionsRowView _viewModelForItemView:](self, "_viewModelForItemView:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[MUGroupedActionsRowView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actionsRowView:didPresentMenuForViewModel:", self, v7);

    }
    v6 = v9;
  }

}

- (BOOL)hasContent
{
  NSArray *v2;
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
  v2 = self->_viewModels;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isHidden", (_QWORD)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (MUPlaceCardActionsRowViewDelegate)delegate
{
  return (MUPlaceCardActionsRowViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_buttonLayoutGroup, 0);
  objc_storeStrong((id *)&self->_containerStackLayout, 0);
  objc_storeStrong((id *)&self->_featureDiscoveryView, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
