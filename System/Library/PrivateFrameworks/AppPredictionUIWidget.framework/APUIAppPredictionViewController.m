@implementation APUIAppPredictionViewController

- (APUIAppPredictionViewController)initWithIdentifier:(id)a3 layoutSize:(unint64_t)a4
{
  return -[APUIAppPredictionViewController initWithIdentifier:layoutSize:mode:](self, "initWithIdentifier:layoutSize:mode:", a3, a4, 0);
}

- (APUIAppPredictionViewController)initWithIdentifier:(id)a3 layoutSize:(unint64_t)a4 mode:(unint64_t)a5
{
  id v8;
  APUIAppPredictionViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableSet *usedFallbacks;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD block[4];
  APUIAppPredictionViewController *v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)APUIAppPredictionViewController;
  v9 = -[APUIWidgetViewController initWithIdentifier:](&v26, sel_initWithIdentifier_, v8);
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    -[APUIWidgetViewController setWidgetIdentifiable:](v9, "setWidgetIdentifiable:", v10);

    -[APUIWidgetViewController widgetIdentifiable](v9, "widgetIdentifiable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWidgetUniqueId:", v8);

    -[APUIWidgetViewController widgetIdentifiable](v9, "widgetIdentifiable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSize:", a4);

    v13 = *MEMORY[0x24BE040B0];
    -[APUIWidgetViewController widgetIdentifiable](v9, "widgetIdentifiable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExtensionBundleId:", v13);

    ATXSpecialWidgetKindAppPredictions();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetViewController widgetIdentifiable](v9, "widgetIdentifiable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWidgetKind:", v15);

    v9->_mode = a5;
    v17 = objc_opt_new();
    usedFallbacks = v9->_usedFallbacks;
    v9->_usedFallbacks = (NSMutableSet *)v17;

    objc_msgSend(MEMORY[0x24BE04158], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetViewController setSuggestionClient:](v9, "setSuggestionClient:", v19);

    -[APUIWidgetViewController suggestionClient](v9, "suggestionClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerObserver:", v9);

    dispatch_get_global_queue(25, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__APUIAppPredictionViewController_initWithIdentifier_layoutSize_mode___block_invoke;
    block[3] = &unk_24DB7D2B8;
    v25 = v9;
    dispatch_async(v21, block);

    __atxlog_handle_home_screen();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2048;
      v30 = a5;
      _os_log_impl(&dword_219979000, v22, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUIAppPredictionViewController initWithIdentifier %@; mode=%ld",
        buf,
        0x16u);
    }

  }
  return v9;
}

void __70__APUIAppPredictionViewController_initWithIdentifier_layoutSize_mode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 64);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationRecords:](APUIAppPredictionViewController, "_bundleIdentifierSetFromApplicationRecords:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__APUIAppPredictionViewController_initWithIdentifier_layoutSize_mode___block_invoke_2;
  v5[3] = &unk_24DB7D290;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __70__APUIAppPredictionViewController_initWithIdentifier_layoutSize_mode___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1032);
  *(_QWORD *)(v3 + 1032) = v2;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", *(_QWORD *)(a1 + 32));

}

- (BOOL)matchesWidgetUniqueID:(id)a3 stackID:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[APUIWidgetViewController identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)APUIAppPredictionViewController;
  -[APUIWidgetViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  NSObject *v3;
  APUIAppIconGridView *v4;
  APUIAppIconGridView *gridView;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)APUIAppPredictionViewController;
  -[APUIAppPredictionViewController viewDidLoad](&v7, sel_viewDidLoad);
  __atxlog_handle_ui();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[APUIAppPredictionViewController viewDidLoad]";
    _os_log_impl(&dword_219979000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s", buf, 0xCu);
  }

  v4 = -[APUIAppIconGridView initWithDelegate:]([APUIAppIconGridView alloc], "initWithDelegate:", self);
  gridView = self->_gridView;
  self->_gridView = v4;

  -[APUIAppIconGridView setMode:](self->_gridView, "setMode:", self->_mode);
  -[APUIAppIconGridView setLegibilitySettings:](self->_gridView, "setLegibilitySettings:", self->_legibilitySettings);
  -[APUIAppIconGridView setOccluded:](self->_gridView, "setOccluded:", -[APUIAppPredictionViewController isOccluded](self, "isOccluded"));
  -[APUIAppPredictionViewController _updateEffectiveLargeIconLayoutAnimated:](self, "_updateEffectiveLargeIconLayoutAnimated:", 0);
  -[APUIAppPredictionViewController _loadAppsInGridView:](self, "_loadAppsInGridView:", self->_gridView);
  -[APUIAppPredictionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_gridView);

}

- (void)viewDidLayoutSubviews
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
  void *v12;
  uint64_t v13;
  double left;
  NSObject *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;
  CGRect v26;

  v25 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)APUIAppPredictionViewController;
  -[APUIAppPredictionViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[APUIAppPredictionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) != 1 && !self->_mode)
  {
    left = self->_parentLayoutInsets.left;
    v5 = v5 - left;
    v9 = v9 + left + self->_parentLayoutInsets.right;
  }
  -[APUIAppIconGridView setFrame:](self->_gridView, "setFrame:", v5, v7, v9, v11);
  __atxlog_handle_ui();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[APUIAppIconGridView frame](self->_gridView, "frame");
    NSStringFromCGRect(v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromUIEdgeInsets(self->_parentLayoutInsets);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v20 = "-[APUIAppPredictionViewController viewDidLayoutSubviews]";
    v21 = 2114;
    v22 = v16;
    v23 = 2114;
    v24 = v17;
    _os_log_impl(&dword_219979000, v15, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _gridView.frame=%{public}@, parentLayoutInsets=%{public}@", buf, 0x20u);

  }
}

- (void)setOccluded:(BOOL)a3
{
  if (self->_occluded != a3)
  {
    self->_occluded = a3;
    -[APUIAppIconGridView setOccluded:](self->_gridView, "setOccluded:");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v5;
  _UILegibilitySettings *v6;

  v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[APUIAppIconGridView setLegibilitySettings:](self->_gridView, "setLegibilitySettings:", self->_legibilitySettings);
    v5 = v6;
  }

}

- (void)setParentLayoutInsets:(UIEdgeInsets)a3
{
  id v6;

  if (a3.left != self->_parentLayoutInsets.left
    || a3.top != self->_parentLayoutInsets.top
    || a3.right != self->_parentLayoutInsets.right
    || a3.bottom != self->_parentLayoutInsets.bottom)
  {
    self->_parentLayoutInsets = a3;
    -[APUIAppPredictionViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (unint64_t)layoutSize
{
  void *v2;
  unint64_t v3;

  -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "size");

  return v3;
}

- (void)setLayoutSize:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "size");

  if (v6 != a3)
  {
    -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSize:", a3);

    -[APUIAppPredictionViewController _loadAppsInGridView:](self, "_loadAppsInGridView:", self->_gridView);
  }
}

- (void)setMode:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_mode != a3)
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[APUIWidgetViewController identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218242;
      v9 = a3;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "APUIAppPredictionViewController setting mode: %ld for widget with identifier: %@", (uint8_t *)&v8, 0x16u);

    }
    self->_mode = a3;
    -[APUIAppPredictionViewController _updateEffectiveLargeIconLayoutAnimated:](self, "_updateEffectiveLargeIconLayoutAnimated:", 0);
    -[APUIAppIconGridView setMode:](self->_gridView, "setMode:", self->_mode);
    -[APUIAppPredictionViewController viewIfLoaded](self, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (BOOL)supportsLargeIcons
{
  return self->_mode == 0;
}

- (void)setLargeIconsEnabled:(BOOL)a3
{
  -[APUIAppPredictionViewController setLargeIconsEnabled:animated:](self, "setLargeIconsEnabled:animated:", a3, 0);
}

- (void)setLargeIconsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_largeIconsEnabled != a3)
  {
    self->_largeIconsEnabled = a3;
    -[APUIAppPredictionViewController _updateEffectiveLargeIconLayoutAnimated:](self, "_updateEffectiveLargeIconLayoutAnimated:", a4);
  }
}

- (void)_updateEffectiveLargeIconLayoutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  APUIAppIconGridView *gridView;
  _BOOL8 largeIconsEnabled;

  v3 = a3;
  gridView = self->_gridView;
  if (-[APUIAppPredictionViewController supportsLargeIcons](self, "supportsLargeIcons"))
    largeIconsEnabled = self->_largeIconsEnabled;
  else
    largeIconsEnabled = 0;
  -[APUIAppIconGridView setLargeIconsEnabled:animated:](gridView, "setLargeIconsEnabled:animated:", largeIconsEnabled, v3);
}

- (void)suggestionClientDidRefreshProactiveWidgetLayouts:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__APUIAppPredictionViewController_suggestionClientDidRefreshProactiveWidgetLayouts___block_invoke;
  block[3] = &unk_24DB7D2B8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __84__APUIAppPredictionViewController_suggestionClientDidRefreshProactiveWidgetLayouts___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isViewLoaded");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_loadAppsInGridView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));
  return result;
}

- (id)_fallbackBundleIds
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("com.apple.mobilephone"), CFSTR("com.apple.Preferences"), CFSTR("com.apple.mobiletimer"), CFSTR("com.apple.camera"), CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.AppStore"), CFSTR("com.apple.mobileslideshow"), CFSTR("com.apple.mobilesafari"), 0);
}

- (void)_loadAppsInGridView:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 userInteracting;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  NSObject *v11;
  CFAbsoluteTime Current;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  CFAbsoluteTime v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_userInteracting)
  {
    __atxlog_handle_ui();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      userInteracting = self->_userInteracting;
      *(_DWORD *)buf = 136446466;
      v21 = "-[APUIAppPredictionViewController _loadAppsInGridView:]";
      v22 = 1024;
      LODWORD(v23) = userInteracting;
      _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s aborted: _userInteracting=%{BOOL}d", buf, 0x12u);
    }
LABEL_15:

    goto LABEL_16;
  }
  -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "size");

  if (v8 != 1)
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[APUIAppPredictionViewController _loadAppsInGridView:].cold.2(self, v5);
    goto LABEL_15;
  }
  __atxlog_handle_ui();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 136446466;
    v21 = "-[APUIAppPredictionViewController _loadAppsInGridView:]";
    v22 = 2112;
    v23 = WeakRetained;
    _os_log_impl(&dword_219979000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _delegate=%@", buf, 0x16u);

  }
  __atxlog_handle_ui();
  v11 = objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (!v4)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[APUIAppPredictionViewController _loadAppsInGridView:].cold.1(v5, v15, v16);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v21 = "-[APUIAppPredictionViewController _loadAppsInGridView:]";
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s starting asynchronous layout request", buf, 0xCu);
  }

  Current = CFAbsoluteTimeGetCurrent();
  -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__APUIAppPredictionViewController__loadAppsInGridView___block_invoke;
  v17[3] = &unk_24DB7D308;
  v19 = Current;
  v17[4] = self;
  v18 = v4;
  objc_msgSend(v13, "layoutForAppPredictionPanel:completionHandler:", v14, v17);

LABEL_16:
}

void __55__APUIAppPredictionViewController__loadAppsInGridView___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__APUIAppPredictionViewController__loadAppsInGridView___block_invoke_2;
  v6[3] = &unk_24DB7D2E0;
  v9 = a1[6];
  v4 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __55__APUIAppPredictionViewController__loadAppsInGridView___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  CFAbsoluteTime v3;
  int v5;
  const char *v6;
  __int16 v7;
  CFAbsoluteTime v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_ui();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    v5 = 136446466;
    v6 = "-[APUIAppPredictionViewController _loadAppsInGridView:]_block_invoke_2";
    v7 = 2048;
    v8 = v3;
    _os_log_impl(&dword_219979000, v2, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s finished asynchronous layout request: %f seconds", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setLayout:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutInGridView:", *(_QWORD *)(a1 + 48));
}

- (void)_updateLayoutInGridView:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *bundleIdSuggestionMap;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableSet *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSMutableSet *v51;
  APUIAppFallback *v52;
  void *v53;
  void *v54;
  __int128 v55;
  NSObject *v56;
  NSObject *v57;
  NSMutableSet *v58;
  APUIAppFallback *v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  void *v81;
  void *v82;
  void *v83;
  NSMutableSet **p_usedFallbacks;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t v94;
  char v95[15];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  NSObject *v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v83 = (void *)objc_opt_new();
  v5 = (NSMutableDictionary *)objc_opt_new();
  bundleIdSuggestionMap = self->_bundleIdSuggestionMap;
  self->_bundleIdSuggestionMap = v5;

  -[APUIWidgetViewController layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v81 = v4;
    objc_msgSend(v4, "setShouldDisplayEmptyState:", 0);
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    -[APUIWidgetViewController layout](self, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oneByOneSuggestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    if (!v10)
      goto LABEL_23;
    v11 = v10;
    v12 = *(_QWORD *)v97;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v97 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        objc_msgSend(v14, "executableSpecification");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "executableObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          if (!-[NSObject length](v17, "length"))
            goto LABEL_21;
          if ((objc_msgSend(MEMORY[0x24BE04100], "isAppClipWebClipBundleId:", v17) & 1) != 0
            || objc_msgSend(MEMORY[0x24BE04100], "isInstalledAndNotRestrictedForBundle:", v17))
          {
            if ((-[NSMutableSet containsObject:](self->_installingBundleIds, "containsObject:", v17) & 1) == 0)
              objc_msgSend(v83, "addObject:", v17);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleIdSuggestionMap, "setObject:forKeyedSubscript:", v14, v17);
            __atxlog_handle_ui();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v103 = v17;
              v19 = v18;
              v20 = "SuggestionsWidget: app suggestion for: %@";
              goto LABEL_19;
            }
          }
          else
          {
            __atxlog_handle_ui();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v103 = v17;
              v19 = v18;
              v20 = "SuggestionsWidget: %@ is restricted or not installed";
LABEL_19:
              _os_log_impl(&dword_219979000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
            }
          }

          goto LABEL_21;
        }
        __atxlog_handle_home_screen();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[APUIAppPredictionViewController _updateLayoutInGridView:].cold.3(&v94, v95, v17);
LABEL_21:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
      if (!v11)
      {
LABEL_23:

        -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[APUIWidgetViewController identifier](self, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "pageIndexOfAppPredictionPanelWithIdentifier:", v22);

        if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __atxlog_handle_ui();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[APUIAppPredictionViewController _updateLayoutInGridView:].cold.2(self, v24);

          p_usedFallbacks = &self->_usedFallbacks;
          -[NSMutableSet removeAllObjects](self->_usedFallbacks, "removeAllObjects");
        }
        else
        {
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          p_usedFallbacks = &self->_usedFallbacks;
          v36 = self->_usedFallbacks;
          v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v91;
            do
            {
              for (j = 0; j != v38; ++j)
              {
                if (*(_QWORD *)v91 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
                objc_msgSend(v41, "suggestion");
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                if (v42)
                {
                  -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "bundleId");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "markFallbackAppSuggestion:asUnusedForPage:", v44, v23);

                }
              }
              v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
            }
            while (v38);
          }

          -[NSMutableSet removeAllObjects](*p_usedFallbacks, "removeAllObjects");
          -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "unusedFallbackAppSuggestionsForPage:", v23);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v83, "count") <= 7)
          {
            do
            {
              if (!objc_msgSend(v46, "count"))
                break;
              objc_msgSend(v46, "firstObject");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "executableSpecification");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "executableObject");
              v49 = objc_claimAutoreleasedReturnValue();

              __atxlog_handle_ui();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v103 = v49;
                _os_log_debug_impl(&dword_219979000, v50, OS_LOG_TYPE_DEBUG, "SuggestionsWidget: using HSSC fallback: %@", buf, 0xCu);
              }

              objc_msgSend(v83, "addObject:", v49);
              objc_msgSend(v46, "removeObjectAtIndex:", 0);
              v51 = *p_usedFallbacks;
              v52 = -[APUIAppFallback initWithProactiveSuggestion:]([APUIAppFallback alloc], "initWithProactiveSuggestion:", v47);
              -[NSMutableSet addObject:](v51, "addObject:", v52);

              -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "markFallbackAppSuggestion:asUsedForPage:", v49, v23);

            }
            while ((unint64_t)objc_msgSend(v83, "count") < 8);
          }

        }
        -[APUIAppPredictionViewController _fallbackBundleIds](self, "_fallbackBundleIds");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v54;
        if ((unint64_t)objc_msgSend(v83, "count") <= 7)
        {
          *(_QWORD *)&v55 = 138412290;
          v80 = v55;
          do
          {
            if (!objc_msgSend(v54, "count", v80))
              break;
            objc_msgSend(v54, "lastObject");
            v56 = objc_claimAutoreleasedReturnValue();
            __atxlog_handle_ui();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v80;
              v103 = v56;
              _os_log_debug_impl(&dword_219979000, v57, OS_LOG_TYPE_DEBUG, "SuggestionsWidget: using fallback: %@", buf, 0xCu);
            }

            objc_msgSend(v54, "removeLastObject");
            objc_msgSend(v83, "addObject:", v56);
            v58 = *p_usedFallbacks;
            v59 = -[APUIAppFallback initWithBundleId:]([APUIAppFallback alloc], "initWithBundleId:", v56);
            -[NSMutableSet addObject:](v58, "addObject:", v59);

            v54 = v82;
          }
          while ((unint64_t)objc_msgSend(v83, "count") < 8);
        }
        objc_msgSend(v83, "array");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v83, "count");
        if (v61 >= 8)
          v62 = 8;
        else
          v62 = v61;
        objc_msgSend(v60, "subarrayWithRange:", 0, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setBundleIds:", v63);

        __atxlog_handle_ui();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v81, "bundleIds");
          v65 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v103 = v65;
          _os_log_impl(&dword_219979000, v64, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: gridView.bundleIds=%@", buf, 0xCu);

        }
        -[APUIWidgetViewController suggestionIds](self, "suggestionIds");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v66, "mutableCopy");

        v67 = (void *)objc_opt_new();
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        objc_msgSend(v81, "bundleIds");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
        if (v69)
        {
          v70 = v69;
          v71 = *(_QWORD *)v87;
          do
          {
            for (k = 0; k != v70; ++k)
            {
              if (*(_QWORD *)v87 != v71)
                objc_enumerationMutation(v68);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdSuggestionMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * k));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = v73;
              if (v73)
              {
                objc_msgSend(v73, "uuid");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "UUIDString");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "addObject:", v76);

              }
            }
            v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
          }
          while (v70);
        }

        v77 = (void *)objc_msgSend(v67, "copy");
        -[APUIWidgetViewController setSuggestionIds:](self, "setSuggestionIds:", v77);

        v35 = (void *)v85;
        if (-[APUIWidgetViewController effectiveViewVisibility](self, "effectiveViewVisibility"))
        {
          -[APUIWidgetViewController suggestionIds](self, "suggestionIds");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[APUIWidgetViewController logChangeWithNewSuggestionIds:previousSuggestionIds:suggestionClient:](self, "logChangeWithNewSuggestionIds:previousSuggestionIds:suggestionClient:", v78, v85, v79);

        }
        v4 = v81;
        v34 = v82;
        goto LABEL_68;
      }
    }
  }
  __atxlog_handle_ui();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[APUIAppPredictionViewController _updateLayoutInGridView:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

  objc_msgSend(v4, "setShouldDisplayEmptyState:", 1);
  objc_msgSend(v4, "setBundleIds:", 0);
  -[APUIWidgetViewController suggestionIds](self, "suggestionIds");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");

  -[APUIWidgetViewController setSuggestionIds:](self, "setSuggestionIds:", 0);
  -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIWidgetViewController logChangeWithNewSuggestionIds:previousSuggestionIds:suggestionClient:](self, "logChangeWithNewSuggestionIds:previousSuggestionIds:suggestionClient:", 0, v34, v35);
LABEL_68:

}

- (BOOL)appIconGridView:(id)a3 launchAppFromIcon:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a4, "applicationBundleID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdSuggestionMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetViewController layout](self, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logDidTapSuggestion:widget:blendingCacheId:", v6, v8, v11);

    -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didFinishExecutingTappedSuggestion:fromWidget:", v6, v13);

  }
  return 0;
}

- (BOOL)appIconGridView:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  char v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v8, "appPredictionViewController:shouldDisplayBadgeWithBundleIdentifier:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)appIconGridView:(id)a3 iconForApplicationWithBundleIdentifier:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "appPredictionViewController:iconForApplicationWithBundleIdentifier:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)additionalIconListLayoutObserversForAppIconGridView:(id)a3
{
  APUIAppPredictionViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "additionalIconListLayoutObserversForAppPredictionViewController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v8;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return -[APUIAppIconGridView iconViewForIcon:location:](self->_gridView, "iconViewForIcon:location:", a3, a4);
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  return -[APUIAppIconGridView firstIconViewForIcon:inLocations:](self->_gridView, "firstIconViewForIcon:inLocations:", a3, a4);
}

- (id)firstIconViewForIcon:(id)a3
{
  return -[APUIAppIconGridView firstIconViewForIcon:](self->_gridView, "firstIconViewForIcon:", a3);
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  return -[APUIAppIconGridView firstIconViewForIcon:excludingLocations:](self->_gridView, "firstIconViewForIcon:excludingLocations:", a3, a4);
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return -[APUIAppIconGridView isDisplayingIcon:inLocation:](self->_gridView, "isDisplayingIcon:inLocation:", a3, a4);
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  return -[APUIAppIconGridView isDisplayingIcon:inLocations:](self->_gridView, "isDisplayingIcon:inLocations:", a3, a4);
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return -[APUIAppIconGridView isDisplayingIcon:](self->_gridView, "isDisplayingIcon:", a3);
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return -[APUIAppIconGridView isDisplayingIconView:](self->_gridView, "isDisplayingIconView:", a3);
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  return -[APUIAppIconGridView isDisplayingIconView:inLocation:](self->_gridView, "isDisplayingIconView:inLocation:", a3, a4);
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  -[APUIAppIconGridView enumerateDisplayedIconViewsForIcon:usingBlock:](self->_gridView, "enumerateDisplayedIconViewsForIcon:usingBlock:", a3, a4);
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  -[APUIAppIconGridView enumerateDisplayedIconViewsUsingBlock:](self->_gridView, "enumerateDisplayedIconViewsUsingBlock:", a3);
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("SBIconLocationAppPredictions"));
}

- (NSSet)presentedIconLocations
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SBIconLocationAppPredictions"));
}

- (void)setShowingContextMenu:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_showingContextMenu != a3)
  {
    v3 = a3;
    __atxlog_handle_ui();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446466;
      v7 = "-[APUIAppPredictionViewController setShowingContextMenu:]";
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s showingContextMenu=%{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    self->_showingContextMenu = v3;
    -[APUIAppPredictionViewController _updateUserInteractingState](self, "_updateUserInteractingState");
    if (v3)
    {
      if (-[APUIAppPredictionViewController _canDismissSelectedSuggestion](self, "_canDismissSelectedSuggestion"))
        -[APUIAppIconGridView highlightIconForBundleId:](self->_gridView, "highlightIconForBundleId:", self->_selectedBundleId);
    }
    else
    {
      -[APUIAppIconGridView highlightIconForBundleId:](self->_gridView, "highlightIconForBundleId:", 0);
      -[APUIAppPredictionViewController _loadAppsInGridView:](self, "_loadAppsInGridView:", self->_gridView);
    }
  }
}

- (void)setShowingAlert:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[APUIAppPredictionViewController setShowingAlert:]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s showingAlert=%{BOOL}u", (uint8_t *)&v6, 0x12u);
  }

  if (self->_showingAlert != v3)
  {
    self->_showingAlert = v3;
    -[APUIAppPredictionViewController _updateUserInteractingState](self, "_updateUserInteractingState");
  }
}

- (void)_updateUserInteractingState
{
  _BOOL4 v2;

  v2 = self->_showingAlert || self->_showingContextMenu;
  if (self->_userInteracting != v2)
    -[APUIAppPredictionViewController setUserInteracting:](self, "setUserInteracting:");
}

- (void)setUserInteracting:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[APUIAppPredictionViewController setUserInteracting:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s userInteracting=%{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  if (self->_userInteracting != v3)
  {
    self->_userInteracting = v3;
    -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsUserInteractingWithProactiveWidget:", v3);

  }
}

- (void)willShowContextMenuAtLocation:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v6;
  void *v7;
  APUIAppIconGridView *gridView;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSString *v14;
  NSString *selectedBundleId;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  CGPoint v21;

  y = a3.y;
  x = a3.x;
  v20 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_ui();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v21.x = x;
    v21.y = y;
    NSStringFromCGPoint(v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136446466;
    v17 = "-[APUIAppPredictionViewController willShowContextMenuAtLocation:]";
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_219979000, v6, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s location=%@", (uint8_t *)&v16, 0x16u);

  }
  gridView = self->_gridView;
  -[APUIAppPredictionViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIAppIconGridView convertPoint:fromView:](gridView, "convertPoint:fromView:", v9, x, y);
  v11 = v10;
  v13 = v12;

  -[APUIAppIconGridView bundleIdAtLocation:](self->_gridView, "bundleIdAtLocation:", v11, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  selectedBundleId = self->_selectedBundleId;
  self->_selectedBundleId = v14;

}

- (NSArray)applicationShortcutItems
{
  NSString *v3;
  NSString *selectedAppLocalizedName;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  void *v8;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[APUIAppPredictionViewController _canDismissSelectedSuggestion](self, "_canDismissSelectedSuggestion"))
  {
    objc_msgSend(MEMORY[0x24BE04100], "localizedNameForBundle:", self->_selectedBundleId);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    selectedAppLocalizedName = self->_selectedAppLocalizedName;
    self->_selectedAppLocalizedName = v3;

    __atxlog_handle_ui();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_selectedAppLocalizedName;
      *(_DWORD *)buf = 136446466;
      v12 = "-[APUIAppPredictionViewController applicationShortcutItems]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _selectedAppLocalizedName=%@", buf, 0x16u);
    }

    +[APUIAppIconGridView createDismissSuggestionApplicationShortcutItemWithType:localizedName:](APUIAppIconGridView, "createDismissSuggestionApplicationShortcutItemWithType:localizedName:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.never-show-suggestion"), self->_selectedAppLocalizedName);
    v7 = objc_claimAutoreleasedReturnValue();
    v10 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v12 = "-[APUIAppPredictionViewController applicationShortcutItems]";
      _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s No additional shortcut items", buf, 0xCu);
    }
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v8;
}

- (BOOL)_canDismissSelectedSuggestion
{
  NSMutableSet *usedFallbacks;
  APUIAppFallback *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSString *selectedBundleId;
  const char *v11;
  NSString *v12;
  BOOL v13;
  int v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_selectedBundleId)
  {
    usedFallbacks = self->_usedFallbacks;
    v4 = -[APUIAppFallback initWithBundleId:]([APUIAppFallback alloc], "initWithBundleId:", self->_selectedBundleId);
    LODWORD(usedFallbacks) = -[NSMutableSet containsObject:](usedFallbacks, "containsObject:", v4);

    if ((_DWORD)usedFallbacks)
    {
      __atxlog_handle_ui();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136446210;
        v16 = "-[APUIAppPredictionViewController _canDismissSelectedSuggestion]";
        v6 = "SuggestionsWidget: %{public}s Cannot dismiss a fallback";
LABEL_7:
        _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v15, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdSuggestionMap, "objectForKeyedSubscript:", self->_selectedBundleId);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject executableSpecification](v5, "executableSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "executableType");

    if (v8 == 5)
    {
      __atxlog_handle_ui();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        goto LABEL_16;
      }
      selectedBundleId = self->_selectedBundleId;
      v15 = 136446466;
      v16 = "-[APUIAppPredictionViewController _canDismissSelectedSuggestion]";
      v17 = 2112;
      v18 = selectedBundleId;
      v11 = "SuggestionsWidget: %{public}s _selectedBundleId %@ is app clip. Cannot dismiss suggestion";
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x24BE04100], "isAppClipWebClipBundleId:", self->_selectedBundleId))
      {
        v13 = 1;
        goto LABEL_17;
      }
      __atxlog_handle_ui();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v12 = self->_selectedBundleId;
      v15 = 136446466;
      v16 = "-[APUIAppPredictionViewController _canDismissSelectedSuggestion]";
      v17 = 2112;
      v18 = v12;
      v11 = "SuggestionsWidget: %{public}s _selectedBundleId %@ is AppClip. Cannot dismiss suggestion";
    }
    _os_log_impl(&dword_219979000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x16u);
    goto LABEL_15;
  }
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446210;
    v16 = "-[APUIAppPredictionViewController _canDismissSelectedSuggestion]";
    v6 = "SuggestionsWidget: %{public}s _selectedBundleId is nil. Cannot dismiss suggestion";
    goto LABEL_7;
  }
LABEL_16:
  v13 = 0;
LABEL_17:

  return v13;
}

- (void)didSelectApplicationShortcutItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v36 = "-[APUIAppPredictionViewController didSelectApplicationShortcutItem:]";
    v37 = 2112;
    v38 = v4;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s applicationShortcutItem=%@", buf, 0x16u);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdSuggestionMap, "objectForKeyedSubscript:", self->_selectedBundleId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[APUIAppPredictionViewController didSelectApplicationShortcutItem:]";
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s suggestion=%@", buf, 0x16u);
    }

    objc_msgSend(v4, "type");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.never-show-suggestion")))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Don’t Suggest “%@”"), &stru_24DB7DD40, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v11, self->_selectedAppLocalizedName);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("“%@” will not be suggested on Home Screen. You can change this later in Siri Settings."), &stru_24DB7DD40, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v15, self->_selectedAppLocalizedName);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24DB7DD40, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, v31, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x24BDAC760];
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __68__APUIAppPredictionViewController_didSelectApplicationShortcutItem___block_invoke;
      v34[3] = &unk_24DB7D330;
      v34[4] = self;
      objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v17, 1, v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v20);

      v21 = (void *)MEMORY[0x24BDF67E8];
      v32[0] = v19;
      v32[1] = 3221225472;
      v32[2] = __68__APUIAppPredictionViewController_didSelectApplicationShortcutItem___block_invoke_2;
      v32[3] = &unk_24DB7D358;
      v32[4] = self;
      v33 = v6;
      objc_msgSend(v21, "actionWithTitle:style:handler:", v12, 2, v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v22);

      -[APUIAppPredictionViewController setShowingAlert:](self, "setShowingAlert:", 1);
      -[APUIAppPredictionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);

    }
    else
    {
      __atxlog_handle_home_screen();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[APUIAppPredictionViewController didSelectApplicationShortcutItem:].cold.2((uint64_t)v8, v12, v30);
    }

  }
  else
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[APUIAppPredictionViewController didSelectApplicationShortcutItem:].cold.1(v8, v23, v24, v25, v26, v27, v28, v29);
  }

}

uint64_t __68__APUIAppPredictionViewController_didSelectApplicationShortcutItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowingAlert:", 0);
}

void __68__APUIAppPredictionViewController_didSelectApplicationShortcutItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setShowingAlert:", 0);
  objc_msgSend(*(id *)(a1 + 32), "suggestionClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "widgetIdentifiable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logContextMenuNeverShowAgainForSuggestion:widget:blendingCacheId:", v2, v3, v6);

}

- (void)applicationInstallsDidStart:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationProxies:](APUIAppPredictionViewController, "_bundleIdentifierSetFromApplicationProxies:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[APUIAppPredictionViewController applicationInstallsDidStart:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleIds=%@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__APUIAppPredictionViewController_applicationInstallsDidStart___block_invoke;
  v7[3] = &unk_24DB7D290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __63__APUIAppPredictionViewController_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "unionSet:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateGridViewForBundleIds:", *(_QWORD *)(a1 + 40));
}

- (void)applicationsDidInstall:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationProxies:](APUIAppPredictionViewController, "_bundleIdentifierSetFromApplicationProxies:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[APUIAppPredictionViewController applicationsDidInstall:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleIds=%@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__APUIAppPredictionViewController_applicationsDidInstall___block_invoke;
  v7[3] = &unk_24DB7D290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __58__APUIAppPredictionViewController_applicationsDidInstall___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "minusSet:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateGridViewForBundleIds:", *(_QWORD *)(a1 + 40));
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationProxies:](APUIAppPredictionViewController, "_bundleIdentifierSetFromApplicationProxies:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[APUIAppPredictionViewController applicationInstallsDidUpdateIcon:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleIds=%@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__APUIAppPredictionViewController_applicationInstallsDidUpdateIcon___block_invoke;
  v7[3] = &unk_24DB7D290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __68__APUIAppPredictionViewController_applicationInstallsDidUpdateIcon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateGridViewForBundleIds:", *(_QWORD *)(a1 + 40));
}

- (void)applicationsDidUninstall:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationProxies:](APUIAppPredictionViewController, "_bundleIdentifierSetFromApplicationProxies:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[APUIAppPredictionViewController applicationsDidUninstall:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleIds=%@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__APUIAppPredictionViewController_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_24DB7D290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __60__APUIAppPredictionViewController_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "minusSet:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateGridViewForBundleIds:", *(_QWORD *)(a1 + 40));
}

- (void)_updateGridViewForBundleIds:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (!v5)
    goto LABEL_12;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v4);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdSuggestionMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v7 |= v10 != 0;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  }
  while (v6);
  if ((v7 & 1) != 0)
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_219979000, v11, OS_LOG_TYPE_DEFAULT, "APUIAppPredictionViewController _updateInstallingBundleIdsWithApplicationProxies: %@ ; reloading apps",
        buf,
        0xCu);
    }

    -[APUIAppPredictionViewController _loadAppsInGridView:](self, "_loadAppsInGridView:", self->_gridView);
  }
  else
  {
LABEL_12:
    __atxlog_handle_home_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_219979000, v12, OS_LOG_TYPE_DEFAULT, "APUIAppPredictionViewController _updateInstallingBundleIdsWithApplicationProxies: %@ ; not reloading apps",
        buf,
        0xCu);
    }

  }
}

+ (id)_bundleIdentifierSetFromApplicationRecords:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "bundleIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (id)_bundleIdentifierSetFromApplicationProxies:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);
  return v7;
}

uint64_t __78__APUIAppPredictionViewController__bundleIdentifierSetFromApplicationProxies___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

- (BOOL)isShowingContextMenu
{
  return self->_showingContextMenu;
}

- (UIEdgeInsets)parentLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_parentLayoutInsets.top;
  left = self->_parentLayoutInsets.left;
  bottom = self->_parentLayoutInsets.bottom;
  right = self->_parentLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
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

- (BOOL)isUserInteracting
{
  return self->_userInteracting;
}

- (BOOL)isLargeIconsEnabled
{
  return self->_largeIconsEnabled;
}

- (APUIAppPredictionViewControllerDelegate)delegate
{
  return (APUIAppPredictionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isShowingAlert
{
  return self->_showingAlert;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_usedFallbacks, 0);
  objc_storeStrong((id *)&self->_selectedAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_selectedBundleId, 0);
  objc_storeStrong((id *)&self->_installingBundleIds, 0);
  objc_storeStrong((id *)&self->_bundleIdSuggestionMap, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
}

- (void)_loadAppsInGridView:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "-[APUIAppPredictionViewController _loadAppsInGridView:]";
  OUTLINED_FUNCTION_0(&dword_219979000, a1, a3, "SuggestionsWidget: %{public}s gridView=nil", (uint8_t *)&v3);
}

- (void)_loadAppsInGridView:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "widgetIdentifiable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v3, "size");
  OUTLINED_FUNCTION_0(&dword_219979000, a2, v4, "Trying to load apps for unsupported app panel size: %ld", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2();
}

- (void)_updateLayoutInGridView:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_219979000, a1, a3, "SuggestionsWidget: no layout, falling back to label", a5, a6, a7, a8, 0);
}

- (void)_updateLayoutInGridView:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_219979000, a2, OS_LOG_TYPE_ERROR, "SuggestionsWidget: could not find page index for app prediction widget with identifier: %{public}@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)_updateLayoutInGridView:(os_log_t)log .cold.3(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_219979000, log, OS_LOG_TYPE_FAULT, "App suggestion executable is not a string as expected", buf, 2u);
}

- (void)didSelectApplicationShortcutItem:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_219979000, a1, a3, "No selected suggestion found ", a5, a6, a7, a8, 0);
}

- (void)didSelectApplicationShortcutItem:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_219979000, a2, a3, "didSelectApplicationShortcutItem: %@ is not valid for App Prediction Panel", (uint8_t *)&v3);
}

@end
