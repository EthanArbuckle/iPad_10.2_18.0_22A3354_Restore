@implementation APUIAppIconGridView

- (APUIAppIconGridView)initWithDelegate:(id)a3
{
  id v4;
  APUIAppIconGridView *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  SBIconListModel *model;
  void *v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APUIAppIconGridView;
  v5 = -[APUIAppIconGridView init](&v12, sel_init);
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v6 = (void *)getSBIconListModelClass_softClass;
    v17 = getSBIconListModelClass_softClass;
    if (!getSBIconListModelClass_softClass)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __getSBIconListModelClass_block_invoke;
      v13[3] = &unk_24DB7D4C8;
      v13[4] = &v14;
      __getSBIconListModelClass_block_invoke((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v14, 8);
    v8 = objc_msgSend([v7 alloc], "initWithFolder:maxIconCount:", 0, 8);
    model = v5->_model;
    v5->_model = (SBIconListModel *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel__significantTimeChange_, *MEMORY[0x24BDF75A0], 0);
    -[APUIAppIconGridView _addGridView](v5, "_addGridView");

  }
  return v5;
}

- (void)_significantTimeChange:(id)a3
{
  SBIconListView **p_gridView;
  id WeakRetained;
  id v5;

  p_gridView = &self->_gridView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
  objc_msgSend(WeakRetained, "removeAllIconViews");

  v5 = objc_loadWeakRetained((id *)p_gridView);
  objc_msgSend(v5, "layoutIconsNow");

}

- (id)_emptyStateLabel
{
  UILabel *emptyStateLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  emptyStateLabel = self->_emptyStateLabel;
  if (!emptyStateLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    v5 = self->_emptyStateLabel;
    self->_emptyStateLabel = v4;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("No Suggestions Available"), &stru_24DB7DD40, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_emptyStateLabel, "setText:", v7);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_emptyStateLabel, "setTextColor:", v8);

    -[UILabel setNumberOfLines:](self->_emptyStateLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_emptyStateLabel, "setTextAlignment:", 1);
    emptyStateLabel = self->_emptyStateLabel;
  }
  return emptyStateLabel;
}

- (void)setShouldDisplayEmptyState:(BOOL)a3
{
  void *v4;

  if (self->_shouldDisplayEmptyState != a3)
  {
    self->_shouldDisplayEmptyState = a3;
    if (a3)
    {
      -[APUIAppIconGridView _emptyStateLabel](self, "_emptyStateLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIAppIconGridView addSubview:](self, "addSubview:", v4);

    }
    else
    {
      -[UILabel removeFromSuperview](self->_emptyStateLabel, "removeFromSuperview");
    }
    -[APUIAppIconGridView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLargeIconsEnabled:(BOOL)a3
{
  -[APUIAppIconGridView setLargeIconsEnabled:animated:](self, "setLargeIconsEnabled:animated:", a3, 0);
}

- (void)setLargeIconsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  APUIAppIconGridLayoutProvider *v6;
  APUIAppIconGridLayoutProvider *layoutProvider;
  id WeakRetained;
  _QWORD v9[5];

  if (self->_largeIconsEnabled != a3)
  {
    v4 = a4;
    self->_largeIconsEnabled = a3;
    v6 = -[APUIAppIconGridLayoutProvider initWithLargeIconsEnabled:]([APUIAppIconGridLayoutProvider alloc], "initWithLargeIconsEnabled:", -[APUIAppIconGridView isLargeIconsEnabled](self, "isLargeIconsEnabled"));
    layoutProvider = self->_layoutProvider;
    self->_layoutProvider = v6;

    -[APUIAppIconGridLayoutProvider setMode:](self->_layoutProvider, "setMode:", self->_mode);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
      objc_msgSend(WeakRetained, "setLayoutProvider:animated:", self->_layoutProvider, 1);

    }
    else
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __53__APUIAppIconGridView_setLargeIconsEnabled_animated___block_invoke;
      v9[3] = &unk_24DB7D2B8;
      v9[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v9);
    }
  }
}

void __53__APUIAppIconGridView_setLargeIconsEnabled_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 424));
  objc_msgSend(WeakRetained, "setLayoutProvider:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464), 0);

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 424));
  objc_msgSend(v3, "layoutIconsNow");

}

- (void)_addGridView
{
  SBIconListView **p_gridView;
  id WeakRetained;
  APUIAppIconGridLayoutProvider *v5;
  APUIAppIconGridLayoutProvider *layoutProvider;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  p_gridView = &self->_gridView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);

  if (!WeakRetained)
  {
    v5 = -[APUIAppIconGridLayoutProvider initWithLargeIconsEnabled:]([APUIAppIconGridLayoutProvider alloc], "initWithLargeIconsEnabled:", -[APUIAppIconGridView isLargeIconsEnabled](self, "isLargeIconsEnabled"));
    layoutProvider = self->_layoutProvider;
    self->_layoutProvider = v5;

    -[APUIAppIconGridLayoutProvider setMode:](self->_layoutProvider, "setMode:", self->_mode);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v7 = (void *)getSBIconListViewClass_softClass;
    v23 = getSBIconListViewClass_softClass;
    v8 = MEMORY[0x24BDAC760];
    if (!getSBIconListViewClass_softClass)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __getSBIconListViewClass_block_invoke;
      v19[3] = &unk_24DB7D4C8;
      v19[4] = &v20;
      __getSBIconListViewClass_block_invoke((uint64_t)v19);
      v7 = (void *)v21[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v20, 8);
    v10 = (void *)objc_msgSend([v9 alloc], "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", self->_model, self->_layoutProvider, CFSTR("SBIconLocationAppPredictions"), 1, self);
    objc_msgSend(v10, "setIconViewConfigurationOptions:", 16);
    objc_msgSend(v10, "setContentVisibility:", self->_occluded);
    objc_msgSend(v10, "setLegibilitySettings:", self->_legibilitySettings);
    -[APUIAppIconGridView _iconLabelAlphaForMode:](self, "_iconLabelAlphaForMode:", self->_mode);
    objc_msgSend(v10, "setIconsLabelAlpha:");
    objc_msgSend(v10, "addLayoutObserver:", self);
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "additionalIconListLayoutObserversForAppIconGridView:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    v15 = 3221225472;
    v16 = __35__APUIAppIconGridView__addGridView__block_invoke;
    v17 = &unk_24DB7D410;
    v18 = v10;
    v13 = v10;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v14);
    -[APUIAppIconGridView addSubview:](self, "addSubview:", v13, v14, v15, v16, v17);
    objc_storeWeak((id *)p_gridView, v13);

  }
}

uint64_t __35__APUIAppIconGridView__addGridView__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addLayoutObserver:", a2);
}

- (id)bundleIdAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  CGPoint v19;

  y = a3.y;
  x = a3.x;
  v18 = *MEMORY[0x24BDAC8D0];
  -[APUIAppIconGridView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "apuiFindInnermostSuperviewOfClass:", getSBIconViewClass());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_ui();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19.x = x;
    v19.y = y;
    NSStringFromCGPoint(v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136446722;
    v13 = "-[APUIAppIconGridView bundleIdAtLocation:]";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_219979000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@ bundleID=%@", (uint8_t *)&v12, 0x20u);

  }
  return v8;
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (void)iconTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  int v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "AppIconGridView: iconTapped", buf, 2u);
  }

  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(WeakRetained, "appIconGridView:launchAppFromIcon:", self, v6);

  if (v8)
  {
    __atxlog_handle_ui();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_219979000, v9, OS_LOG_TYPE_DEFAULT, "AppIconGridView: iconTapped but delegate handled launch", v10, 2u);
    }
  }
  else
  {
    objc_msgSend(v6, "applicationBundleID");
    v9 = objc_claimAutoreleasedReturnValue();
    +[APUIAppIconDataSource openApplication:completion:](APUIAppIconDataSource, "openApplication:completion:", v9, 0);
  }

}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  SBHReusableViewMap *reusableIconViewMap;
  void *v5;
  objc_class *v6;
  SBHReusableViewMap *v7;
  SBHReusableViewMap *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  reusableIconViewMap = self->_reusableIconViewMap;
  if (!reusableIconViewMap)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v5 = (void *)getSBHReusableViewMapClass_softClass;
    v14 = getSBHReusableViewMapClass_softClass;
    if (!getSBHReusableViewMapClass_softClass)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __getSBHReusableViewMapClass_block_invoke;
      v10[3] = &unk_24DB7D4C8;
      v10[4] = &v11;
      __getSBHReusableViewMapClass_block_invoke((uint64_t)v10);
      v5 = (void *)v12[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v11, 8);
    v7 = (SBHReusableViewMap *)objc_alloc_init(v6);
    v8 = self->_reusableIconViewMap;
    self->_reusableIconViewMap = v7;

    reusableIconViewMap = self->_reusableIconViewMap;
  }
  -[SBHReusableViewMap dequeueReusableViewOfClass:](reusableIconViewMap, "dequeueReusableViewOfClass:", getSBIconViewClass());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recycleIconView:(id)a3
{
  -[SBHReusableViewMap recycleView:](self->_reusableIconViewMap, "recycleView:", a3);
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return -[SBHReusableViewMap isViewRecycled:](self->_reusableIconViewMap, "isViewRecycled:", a3);
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_ui();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[APUIAppIconGridView configureIconView:forIcon:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_219979000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s icon=%@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setIcon:", v6);
  objc_msgSend(v7, "setLabelAccessoryHidden:", self->_mode == 1);
  -[APUIAppIconGridView _configureAliasingForIconView:](self, "_configureAliasingForIconView:", v7);

}

- (void)_configureAliasingForIconView:(id)a3
{
  id v4;
  unint64_t mode;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v4 = a3;
  mode = self->_mode;
  if (mode == 1)
  {
    v13 = v4;
    objc_msgSend(v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsEdgeAntialiasing:", 1);

    objc_msgSend(v13, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldRasterize:", 1);

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v11 = v10;
    objc_msgSend(v13, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRasterizationScale:", v11);

    goto LABEL_5;
  }
  if (!mode)
  {
    v13 = v4;
    objc_msgSend(v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsEdgeAntialiasing:", 0);

    objc_msgSend(v13, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldRasterize:", 0);
LABEL_5:

    v4 = v13;
  }

}

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  char v7;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(WeakRetained, "appIconGridView:shouldDisplayBadgeWithBundleIdentifier:", self, v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setOccluded:(BOOL)a3
{
  id WeakRetained;

  if (self->_occluded != a3)
  {
    self->_occluded = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
    objc_msgSend(WeakRetained, "setContentVisibility:", self->_occluded);

  }
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v5;
  _UILegibilitySettings *legibilitySettings;
  id WeakRetained;
  _UILegibilitySettings *v8;

  v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    legibilitySettings = self->_legibilitySettings;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
    objc_msgSend(WeakRetained, "setLegibilitySettings:", legibilitySettings);

    v5 = v8;
  }

}

- (BOOL)appIconDataSource:(id)a3 launchAppFromIcon:(id)a4
{
  APUIAppIconGridView *v4;
  APUIAppIconGridViewDelegate **p_delegate;
  id v6;
  id WeakRetained;

  v4 = self;
  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "appIconGridView:launchAppFromIcon:", v4, v6);

  return (char)v4;
}

- (void)setBundleIds:(id)a3
{
  NSArray *v4;
  NSArray *bundleIds;
  APUIAppIconDataSource *v6;
  APUIAppIconDataSource *dataSource;
  NSArray *v8;
  NSArray *v9;
  NSObject *v10;
  id WeakRetained;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  NSObject *v25;
  id v26;
  NSArray *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t v36[128];
  _BYTE buf[24];
  void *v38;
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  bundleIds = self->_bundleIds;
  if (bundleIds != v4 && !-[NSArray isEqualToArray:](bundleIds, "isEqualToArray:", v4))
  {
    if (!self->_dataSource)
    {
      v6 = objc_alloc_init(APUIAppIconDataSource);
      dataSource = self->_dataSource;
      self->_dataSource = v6;

      -[APUIAppIconDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
    }
    v27 = v4;
    v8 = (NSArray *)-[NSArray copy](v4, "copy");
    v9 = self->_bundleIds;
    self->_bundleIds = v8;

    -[SBIconListModel removeAllIcons](self->_model, "removeAllIcons");
    __atxlog_handle_ui();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[APUIAppIconGridView setBundleIds:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = WeakRetained;
      _os_log_impl(&dword_219979000, v10, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _delegate=%@", buf, 0x16u);

    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = v27;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v29;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v15);
          v17 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v17, "appIconGridView:iconForApplicationWithBundleIdentifier:", self, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            __atxlog_handle_ui();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v18;
              _os_log_impl(&dword_219979000, v19, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: iconForApplicationWithBundleIdentifier:%@ = %@", buf, 0x16u);
            }

            -[SBIconListModel addIcon:](self->_model, "addIcon:", v18);
          }
          else
          {
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.mobiletimer")))
            {
              v32 = 0;
              v33 = &v32;
              v34 = 0x2050000000;
              v20 = (void *)getSBHClockApplicationIconClass_softClass;
              v35 = getSBHClockApplicationIconClass_softClass;
              if (!getSBHClockApplicationIconClass_softClass)
              {
                *(_QWORD *)buf = MEMORY[0x24BDAC760];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __getSBHClockApplicationIconClass_block_invoke;
                v38 = &unk_24DB7D4C8;
                v39 = &v32;
                __getSBHClockApplicationIconClass_block_invoke((uint64_t)buf);
                v20 = (void *)v33[3];
              }
              v21 = objc_retainAutorelease(v20);
              _Block_object_dispose(&v32, 8);
              v22 = objc_msgSend([v21 alloc], "initWithLeafIdentifier:applicationBundleID:", CFSTR("com.apple.mobiletimer"), CFSTR("com.apple.mobiletimer"));
              if (v22)
                goto LABEL_23;
            }
            v32 = 0;
            v33 = &v32;
            v34 = 0x2050000000;
            v23 = (void *)getSBLeafIconClass_softClass;
            v35 = getSBLeafIconClass_softClass;
            if (!getSBLeafIconClass_softClass)
            {
              *(_QWORD *)buf = MEMORY[0x24BDAC760];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __getSBLeafIconClass_block_invoke;
              v38 = &unk_24DB7D4C8;
              v39 = &v32;
              __getSBLeafIconClass_block_invoke((uint64_t)buf);
              v23 = (void *)v33[3];
            }
            v24 = objc_retainAutorelease(v23);
            _Block_object_dispose(&v32, 8);
            v22 = objc_msgSend([v24 alloc], "initWithLeafIdentifier:applicationBundleID:", v16, v16);
            if (v22)
            {
LABEL_23:
              -[NSObject addIconDataSource:](v22, "addIconDataSource:", self->_dataSource);
              __atxlog_handle_ui();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v16;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v22;
                _os_log_impl(&dword_219979000, v25, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: leafIcon initWithLeafIdentifier:%@ = %@", buf, 0x16u);
              }

              -[SBIconListModel addIcon:](self->_model, "addIcon:", v22);
            }
            else
            {
              __atxlog_handle_ui();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v16;
                _os_log_fault_impl(&dword_219979000, v22, OS_LOG_TYPE_FAULT, "Could not create leaf icon for: %@", buf, 0xCu);
              }
            }

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v13);
    }

    v26 = objc_loadWeakRetained((id *)&self->_gridView);
    objc_msgSend(v26, "setIconsNeedLayout");

    v4 = v27;
  }

}

- (void)setMode:(unint64_t)a3
{
  NSObject *v5;
  SBIconListView **p_gridView;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[APUIAppIconGridView setMode:]";
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s %lu", buf, 0x16u);
  }

  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[APUIAppIconGridLayoutProvider setMode:](self->_layoutProvider, "setMode:", a3);
    p_gridView = &self->_gridView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
    -[APUIAppIconGridView _iconLabelAlphaForMode:](self, "_iconLabelAlphaForMode:", a3);
    objc_msgSend(WeakRetained, "setIconsLabelAlpha:");

    v8 = objc_loadWeakRetained((id *)&self->_gridView);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __31__APUIAppIconGridView_setMode___block_invoke;
    v11[3] = &unk_24DB7D438;
    v11[4] = self;
    objc_msgSend(v8, "enumerateIconViewsUsingBlock:", v11);

    v9 = objc_loadWeakRetained((id *)&self->_gridView);
    objc_msgSend(v9, "setIconsNeedLayout");

    v10 = objc_loadWeakRetained((id *)p_gridView);
    objc_msgSend(v10, "layoutIconsIfNeeded");

  }
}

uint64_t __31__APUIAppIconGridView_setMode___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureAliasingForIconView:", a2);
}

- (double)_iconLabelAlphaForMode:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (!a3)
    return 1.0;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconListView **p_gridView;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGRect v28;

  v27 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)APUIAppIconGridView;
  -[APUIAppIconGridView layoutSubviews](&v22, sel_layoutSubviews);
  -[APUIAppIconGridView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  p_gridView = &self->_gridView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
  objc_msgSend(WeakRetained, "setFrame:", v4, v6, v8, v10);

  -[UILabel sizeToFit](self->_emptyStateLabel, "sizeToFit");
  -[APUIAppIconGridView bounds](self, "bounds");
  v14 = v13;
  -[UILabel bounds](self->_emptyStateLabel, "bounds");
  v16 = floor((v14 - v15) * 0.5);
  -[APUIAppIconGridView bounds](self, "bounds");
  v18 = v17;
  -[UILabel bounds](self->_emptyStateLabel, "bounds");
  -[UILabel setFrame:](self->_emptyStateLabel, "setFrame:", 0.0, v16, v18);
  __atxlog_handle_ui();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_loadWeakRetained((id *)p_gridView);
    objc_msgSend(v20, "frame");
    NSStringFromCGRect(v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v24 = "-[APUIAppIconGridView layoutSubviews]";
    v25 = 2112;
    v26 = v21;
    _os_log_impl(&dword_219979000, v19, OS_LOG_TYPE_INFO, "SuggestionsWidget: %{public}s _gridView.frame=%@", buf, 0x16u);

  }
}

+ (id)createDismissSuggestionApplicationShortcutItemWithType:(id)a3 localizedName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.never-show-suggestion")))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0A28]), "initWithSystemImageName:", CFSTR("hand.raised"));
    objc_msgSend(v7, "setIcon:", v8);

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Don’t Suggest “%@”"), &stru_24DB7DD40, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v6);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.dismiss-suggestion")))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0A28]), "initWithSystemImageName:", CFSTR("hand.thumbsdown"));
    objc_msgSend(v7, "setIcon:", v13);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v15 = CFSTR("Suggest Shortcut Less");
LABEL_7:
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_24DB7DD40, 0);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.save-suggestion")))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0A28]), "initWithSystemImageName:", CFSTR("plus.circle"));
    objc_msgSend(v7, "setIcon:", v16);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v15 = CFSTR("Add Shortcut to Siri");
    goto LABEL_7;
  }
  v12 = &stru_24DB7DD40;
LABEL_9:
  objc_msgSend(v7, "setLocalizedTitle:", v12);
  objc_msgSend(v7, "setType:", v5);
  __atxlog_handle_ui();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v20 = "+[APUIAppIconGridView createDismissSuggestionApplicationShortcutItemWithType:localizedName:]";
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_219979000, v17, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s localizedItemTitle=%@ itemType=%@", buf, 0x20u);
  }

  return v7;
}

- (void)highlightIconForBundleId:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[APUIAppIconGridView highlightIconForBundleId:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleId=%@", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
  v7 = WeakRetained;
  if (v4)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__APUIAppIconGridView_highlightIconForBundleId___block_invoke;
    v8[3] = &unk_24DB7D438;
    v9 = v4;
    objc_msgSend(v7, "enumerateIconViewsUsingBlock:", v8);

    v7 = v9;
  }
  else
  {
    objc_msgSend(WeakRetained, "enumerateIconViewsUsingBlock:", &__block_literal_global_0);
  }

}

void __48__APUIAppIconGridView_highlightIconForBundleId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  v5 = 0.5;
  if ((_DWORD)a1)
    v5 = 1.0;
  objc_msgSend(v6, "setAlpha:", v5);

}

uint64_t __48__APUIAppIconGridView_highlightIconForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 1.0);
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  unint64_t mode;
  id v6;

  mode = self->_mode;
  v6 = a4;
  -[APUIAppIconGridView _iconLabelAlphaForMode:](self, "_iconLabelAlphaForMode:", mode);
  objc_msgSend(v6, "setIconLabelAlpha:");

}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationAppPredictions")))
  {
    -[APUIAppIconGridView firstIconViewForIcon:](self, "firstIconViewForIcon:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(a4, "containsObject:", CFSTR("SBIconLocationAppPredictions")))
  {
    -[APUIAppIconGridView firstIconViewForIcon:](self, "firstIconViewForIcon:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)firstIconViewForIcon:(id)a3
{
  SBIconListView **p_gridView;
  id v4;
  id WeakRetained;
  void *v6;

  p_gridView = &self->_gridView;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_gridView);
  objc_msgSend(WeakRetained, "iconViewForIcon:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if ((objc_msgSend(a4, "containsObject:", CFSTR("SBIconLocationAppPredictions")) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[APUIAppIconGridView firstIconViewForIcon:](self, "firstIconViewForIcon:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationAppPredictions")))
    v7 = -[APUIAppIconGridView isDisplayingIcon:](self, "isDisplayingIcon:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (objc_msgSend(a4, "containsObject:", CFSTR("SBIconLocationAppPredictions")))
    v7 = -[APUIAppIconGridView isDisplayingIcon:](self, "isDisplayingIcon:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  SBIconListView **p_gridView;
  id v5;
  id WeakRetained;
  void *v7;
  BOOL v8;

  p_gridView = &self->_gridView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_gridView);
  objc_msgSend(WeakRetained, "iconViewForIcon:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[APUIAppIconGridView isDisplayingIconView:](self, "isDisplayingIconView:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  SBIconListView **p_gridView;
  id v4;
  id WeakRetained;
  char v6;

  p_gridView = &self->_gridView;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_gridView);
  v6 = objc_msgSend(WeakRetained, "isDisplayingIconView:", v4);

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationAppPredictions")))
    v7 = -[APUIAppIconGridView isDisplayingIconView:](self, "isDisplayingIconView:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  -[APUIAppIconGridView firstIconViewForIcon:](self, "firstIconViewForIcon:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7[2](v7, v6);

}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__APUIAppIconGridView_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_24DB7D4A0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "enumerateIconViewsUsingBlock:", v7);

}

uint64_t __61__APUIAppIconGridView_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (BOOL)shouldDisplayEmptyState
{
  return self->_shouldDisplayEmptyState;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)isOccluded
{
  return self->_occluded;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isLargeIconsEnabled
{
  return self->_largeIconsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_reusableIconViewMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_emptyStateLabel, 0);
  objc_destroyWeak((id *)&self->_gridView);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
