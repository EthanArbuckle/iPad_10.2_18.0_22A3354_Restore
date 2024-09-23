@implementation AMUIInfographViewController

- (AMUIInfographViewController)init
{
  AMUIInfographViewController *v2;
  void *v3;
  uint64_t v4;
  AMUIPosterUpdater *posterUpdater;
  void *v6;
  uint64_t v7;
  SBHWidgetSettings *widgetSettings;
  void *v9;
  uint64_t v10;
  APSubjectMonitorSubscription *appProtectionSubjectMonitorSubscription;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AMUIInfographViewController;
  v2 = -[AMUIInfographViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    +[AMUIPosterSwitcherModel sharedInstance](AMUIPosterSwitcherModel, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "posterConfigurationsUpdater");
    v4 = objc_claimAutoreleasedReturnValue();
    posterUpdater = v2->_posterUpdater;
    v2->_posterUpdater = (AMUIPosterUpdater *)v4;

    objc_msgSend(MEMORY[0x24BEB08C8], "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v2->_widgetSettings;
    v2->_widgetSettings = (SBHWidgetSettings *)v7;

    -[AMUIInfographViewController setWantsDefaultInfographLayout:](v2, "setWantsDefaultInfographLayout:", 0);
    objc_msgSend(MEMORY[0x24BE04330], "subjectMonitorRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addMonitor:subjectMask:subscriptionOptions:", v2, 1, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    appProtectionSubjectMonitorSubscription = v2->_appProtectionSubjectMonitorSubscription;
    v2->_appProtectionSubjectMonitorSubscription = (APSubjectMonitorSubscription *)v10;

  }
  return v2;
}

- (void)dealloc
{
  BSDefaultObserver *defaultObserver;
  BSDefaultObserver *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *keepRootStaticAssertions;
  AMAmbientDefaults *ambientDefaults;
  APSubjectMonitorSubscription *appProtectionSubjectMonitorSubscription;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  defaultObserver = self->_defaultObserver;
  if (defaultObserver)
  {
    -[BSDefaultObserver invalidate](defaultObserver, "invalidate");
    v4 = self->_defaultObserver;
    self->_defaultObserver = 0;

  }
  -[AMUIInfographViewController disableIconStateAutosaveAssertion](self, "disableIconStateAutosaveAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[AMUIInfographViewController setDisableIconStateAutosaveAssertion:](self, "setDisableIconStateAutosaveAssertion:", 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_keepRootStaticAssertions, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10++), "invalidate");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  keepRootStaticAssertions = self->_keepRootStaticAssertions;
  self->_keepRootStaticAssertions = 0;

  ambientDefaults = self->_ambientDefaults;
  self->_ambientDefaults = 0;

  -[APSubjectMonitorSubscription invalidate](self->_appProtectionSubjectMonitorSubscription, "invalidate");
  appProtectionSubjectMonitorSubscription = self->_appProtectionSubjectMonitorSubscription;
  self->_appProtectionSubjectMonitorSubscription = 0;

  v14.receiver = self;
  v14.super_class = (Class)AMUIInfographViewController;
  -[AMUIInfographViewController dealloc](&v14, sel_dealloc);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AMUIInfographViewController;
  -[AMUIInfographViewController viewWillLayoutSubviews](&v21, sel_viewWillLayoutSubviews);
  -[AMUIInfographViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isInAWindow");
  -[AMUIInfographViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaLayoutGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  else
  {
    objc_msgSend(v5, "frame");
    v10 = v17;
    v12 = v18;
    v14 = v19;
    v16 = v20;
  }

  -[SBIconListView setFrame:](self->_iconListView, "setFrame:", v10, v12, v14, v16);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMUIInfographViewController;
  -[AMUIInfographViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[AMUIInfographViewController widgetHostManager](self, "widgetHostManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "activate");
  -[SBIconListView setVisiblySettled:](self->_iconListView, "setVisiblySettled:", 0);
  -[SBIconListView setContentVisibility:](self->_iconListView, "setContentVisibility:", 0);
  -[NSMutableDictionary objectForKey:](self->_keepRootStaticAssertions, "objectForKey:", CFSTR("AMUIKeepRootStaticForInfographNotVisibleReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIInfographViewController;
  -[AMUIInfographViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ATXAmbientSuggestionProvider logViewDidAppear](self->_proactiveClient, "logViewDidAppear");
  -[SBIconListView setVisiblySettled:](self->_iconListView, "setVisiblySettled:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AMUIInfographViewController;
  -[AMUIInfographViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  -[AMUIInfographViewController _syncLocalAmbientIconStateAndIntentsToPoster](self, "_syncLocalAmbientIconStateAndIntentsToPoster");
  -[AMUIInfographViewController stackConfigurationViewController](self, "stackConfigurationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
    objc_msgSend(WeakRetained, "dismissModalInteractions");

  }
  -[SBIconListView setVisiblySettled:](self->_iconListView, "setVisiblySettled:", 0);
  -[AMUIInfographViewController _dismissLaunchConfirmationAnimated:](self, "_dismissLaunchConfirmationAnimated:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMUIInfographViewController;
  -[AMUIInfographViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[ATXAmbientSuggestionProvider logViewDidDisappear](self->_proactiveClient, "logViewDidDisappear");
  -[AMUIInfographViewController _keepIconViewsStaticForReason:](self, "_keepIconViewsStaticForReason:", CFSTR("AMUIKeepRootStaticForInfographNotVisibleReason"));
  -[AMUIInfographViewController widgetHostManager](self, "widgetHostManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "deactivate");
  -[SBIconListView setContentVisibility:](self->_iconListView, "setContentVisibility:", 2);
  -[SBIconListView setVisiblySettled:](self->_iconListView, "setVisiblySettled:", 1);
  -[AMUIInfographViewController _dismissLaunchConfirmationAnimated:](self, "_dismissLaunchConfirmationAnimated:", 0);

}

- (void)setIconManager:(id)a3
{
  CHSWidgetExtensionProvider *v4;
  CHSWidgetExtensionProvider *widgetExtensionProvider;
  SBHAddWidgetSheetConfigurationManager *v6;
  SBHAddWidgetSheetConfigurationManager *addWidgetSheetConfigurationManager;
  id v8;

  v8 = a3;
  objc_storeWeak((id *)&self->_iconManager, v8);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "widgetExtensionProvider");
  v4 = (CHSWidgetExtensionProvider *)objc_claimAutoreleasedReturnValue();
  widgetExtensionProvider = self->_widgetExtensionProvider;
  self->_widgetExtensionProvider = v4;

  -[CHSWidgetExtensionProvider registerObserver:](self->_widgetExtensionProvider, "registerObserver:", self);
  objc_msgSend(v8, "addWidgetSheetConfigurationManager");
  v6 = (SBHAddWidgetSheetConfigurationManager *)objc_claimAutoreleasedReturnValue();
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  self->_addWidgetSheetConfigurationManager = v6;

  -[SBHAddWidgetSheetConfigurationManager setWidgetDragHandlerDelegate:](self->_addWidgetSheetConfigurationManager, "setWidgetDragHandlerDelegate:", self);
  -[SBHAddWidgetSheetConfigurationManager setAllowsFakeWidgets:](self->_addWidgetSheetConfigurationManager, "setAllowsFakeWidgets:", 0);
  -[SBHAddWidgetSheetConfigurationManager setAddWidgetSheetLocation:](self->_addWidgetSheetConfigurationManager, "setAddWidgetSheetLocation:", 2);
  -[SBHAddWidgetSheetConfigurationManager setMinimumRequiredSDKVersion:](self->_addWidgetSheetConfigurationManager, "setMinimumRequiredSDKVersion:", 1);
  if (self->_ambientWidgetLayout
    || -[AMUIInfographViewController wantsDefaultInfographLayout](self, "wantsDefaultInfographLayout"))
  {
    -[AMUIInfographViewController _configureIconManager:](self, "_configureIconManager:", v8);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[AMUIInfographViewController _fetchDefaultWidgetDescriptorStacks](self, "_fetchDefaultWidgetDescriptorStacks");
    -[AMUIInfographViewController _fetchWidgetHostManager](self, "_fetchWidgetHostManager");
    v5 = obj;
  }

}

- (void)setPosterConfiguration:(id)a3
{
  id v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id *p_ambientWidgetLayout;
  id v14;
  void *v15;
  _BOOL8 v16;
  id WeakRetained;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[PRSPosterConfiguration isEqual:](self->_posterConfiguration, "isEqual:", v5);
  AMUILogInfograph();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if ((v6 & 1) != 0)
  {
    if (v8)
      -[AMUIInfographViewController setPosterConfiguration:].cold.1();
  }
  else
  {
    if (v8)
      -[AMUIInfographViewController setPosterConfiguration:].cold.5();

    objc_storeStrong((id *)&self->_posterConfiguration, a3);
    v26 = 0;
    objc_msgSend(v5, "pr_loadAmbientWidgetLayoutWithError:", &v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;
    objc_msgSend(v9, "widgetLayoutIconState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("AMUIIconStateKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (v9 && v10)
      v12 = -[AMUIInfographViewController _emptyIconState:](self, "_emptyIconState:", v11);
    p_ambientWidgetLayout = (id *)&self->_ambientWidgetLayout;
    if (-[PRPosterAmbientWidgetLayout isEqual:](self->_ambientWidgetLayout, "isEqual:", v9))
    {
      v14 = *p_ambientWidgetLayout;
      if (*p_ambientWidgetLayout)
        goto LABEL_20;
    }
    if (v12)
      v15 = 0;
    else
      v15 = v9;
    objc_storeStrong((id *)&self->_ambientWidgetLayout, v15);
    v16 = -[AMUIInfographViewController wantsDefaultInfographLayout](self, "wantsDefaultInfographLayout")
       || *p_ambientWidgetLayout == 0;
    -[AMUIInfographViewController setWantsDefaultInfographLayout:](self, "setWantsDefaultInfographLayout:", v16);
    WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
    if (WeakRetained)
      -[AMUIInfographViewController _configureIconManager:](self, "_configureIconManager:", WeakRetained);

    v14 = *p_ambientWidgetLayout;
    if (*p_ambientWidgetLayout)
    {
LABEL_20:
      objc_msgSend(v14, "widgetLayoutIconState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(*p_ambientWidgetLayout, "widgetLayoutIconState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", CFSTR("AMUIIconStateKey"));
        v20 = objc_claimAutoreleasedReturnValue();

        -[AMUIInfographViewController _uniqueIdentifierStacksFromIconState:](self, "_uniqueIdentifierStacksFromIconState:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        AMUILogInfograph();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v21;
          _os_log_impl(&dword_23600A000, v22, OS_LOG_TYPE_DEFAULT, "Successfully loading infographPosterConfigurationData with unique identifier stacks:%{public}@", buf, 0xCu);
        }

      }
      else
      {
        AMUILogInfograph();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[AMUIInfographViewController setPosterConfiguration:].cold.4();
      }
    }
    else
    {
      AMUILogInfograph();
      v20 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v23)
          -[AMUIInfographViewController setPosterConfiguration:].cold.2();
      }
      else if (v23)
      {
        -[AMUIInfographViewController setPosterConfiguration:].cold.3((uint64_t)v5);
      }
    }

    -[AMUIInfographViewController iconManager](self, "iconManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "iconModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "saveIconStateIfNeeded");

  }
}

- (void)_configureIconManager:(id)a3
{
  SBHIconManager **p_iconManager;
  id WeakRetained;
  id v6;

  p_iconManager = &self->_iconManager;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_iconManager);
  objc_msgSend(WeakRetained, "setRecyclesIconViews:", 0);

  -[AMUIInfographViewController _updateIconModelForIconManager:](self, "_updateIconModelForIconManager:", v6);
  -[AMUIInfographViewController _updateProactiveIntegrationForIconManager:](self, "_updateProactiveIntegrationForIconManager:", v6);
  -[AMUIInfographViewController _updateIconListViewForIconManager:](self, "_updateIconListViewForIconManager:", v6);

}

- (void)_updateIconModelForIconManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *initIntents;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBIconListModel *v17;
  SBIconListModel *listModel;
  id v19;

  v19 = a3;
  -[PRPosterAmbientWidgetLayout widgetLayoutIconState](self->_ambientWidgetLayout, "widgetLayoutIconState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AMUIIconStateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AMUIIntentsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  initIntents = self->_initIntents;
  self->_initIntents = v7;

  objc_msgSend(v19, "iconModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMAmbientDefaults alwaysUpdateIconModelOnAmbientWidgetLayoutChange](self->_ambientDefaults, "alwaysUpdateIconModelOnAmbientWidgetLayoutChange");
  if (!v9 || (v5 ? (v11 = v10 == 0) : (v11 = 0), !v11))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0958]), "initWithCurrentState:desiredState:", v5, 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB08F0]), "initWithStore:", v12);
    objc_msgSend(v19, "setIconModel:", v13);

  }
  objc_msgSend(v9, "disableIconStateAutosaveForReason:", CFSTR("Infograph poster"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController setDisableIconStateAutosaveAssertion:](self, "setDisableIconStateAutosaveAssertion:", v14);

  objc_msgSend(v19, "rootFolder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lists");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();

  -[AMUIInfographViewController _validateIconListModel:](self, "_validateIconListModel:", v17);
  listModel = self->_listModel;
  self->_listModel = v17;

}

- (void)_updateProactiveIntegrationForIconManager:(id)a3
{
  ATXAmbientSuggestionProvider *v4;
  ATXAmbientSuggestionProvider *proactiveClient;
  AMUIProactiveUsageObserver *v6;
  AMUIProactiveUsageObserver *proactiveUsageObserver;
  AMUIProactiveSuggestionsProvider *v8;
  AMUIProactiveSuggestionsProvider *proactiveSuggestionsProvider;
  void *v10;
  id v11;

  v11 = a3;
  if (!self->_proactiveClient)
  {
    v4 = (ATXAmbientSuggestionProvider *)objc_alloc_init(MEMORY[0x24BE199E0]);
    proactiveClient = self->_proactiveClient;
    self->_proactiveClient = v4;

  }
  v6 = -[AMUIProactiveUsageObserver initWithListModel:iconManager:proactiveClient:]([AMUIProactiveUsageObserver alloc], "initWithListModel:iconManager:proactiveClient:", self->_listModel, v11, self->_proactiveClient);
  proactiveUsageObserver = self->_proactiveUsageObserver;
  self->_proactiveUsageObserver = v6;

  v8 = -[AMUIProactiveSuggestionsProvider initWithIconListModel:iconManager:proactiveClient:]([AMUIProactiveSuggestionsProvider alloc], "initWithIconListModel:iconManager:proactiveClient:", self->_listModel, v11, self->_proactiveClient);
  proactiveSuggestionsProvider = self->_proactiveSuggestionsProvider;
  self->_proactiveSuggestionsProvider = v8;

  -[AMUIProactiveSuggestionsProvider setDelegate:](self->_proactiveSuggestionsProvider, "setDelegate:", self);
  -[AMUIProactiveUsageObserver pushStackConfigurationsToProactive](self->_proactiveUsageObserver, "pushStackConfigurationsToProactive");
  objc_msgSend(v11, "setUsageMonitoringEnabled:", 1);
  objc_msgSend(v11, "usageMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self->_proactiveUsageObserver);

}

- (void)_updateIconListViewForIconManager:(id)a3
{
  SBIconListView *iconListView;
  SBIconListView *v5;
  id v6;
  SBIconListModel *listModel;
  uint64_t v8;
  void *v9;
  SBIconListView *v10;
  SBIconListView *v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(a3, "listLayoutProvider");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  iconListView = self->_iconListView;
  if (iconListView)
  {
    -[SBIconListView removeFromSuperview](iconListView, "removeFromSuperview");
    v5 = self->_iconListView;
    self->_iconListView = 0;

  }
  v6 = objc_alloc(MEMORY[0x24BEB0950]);
  listModel = self->_listModel;
  v8 = *MEMORY[0x24BEB09F0];
  -[AMUIInfographViewController _iconViewProvider](self, "_iconViewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (SBIconListView *)objc_msgSend(v6, "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", listModel, v17, v8, 3, v9);
  v11 = self->_iconListView;
  self->_iconListView = v10;

  -[SBIconListView addLayoutObserver:](self->_iconListView, "addLayoutObserver:", self);
  -[SBIconListView setIconViewConfigurationOptions:](self->_iconListView, "setIconViewConfigurationOptions:", 18);
  v12 = -[AMUIInfographViewController _appearState](self, "_appearState");
  v13 = v12 != 3;
  if (v12 == 1)
    v13 = 0;
  if (v12)
    v14 = v13;
  else
    v14 = 1;
  if (v12)
    v15 = 0;
  else
    v15 = 2;
  -[SBIconListView setContentVisibility:](self->_iconListView, "setContentVisibility:", v15);
  -[SBIconListView setVisiblySettled:](self->_iconListView, "setVisiblySettled:", v14);
  -[AMUIInfographViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_iconListView);
  objc_msgSend(v16, "setNeedsLayout");

}

- (id)_loadInfographPosterConfigurationDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  PRPosterAmbientWidgetLayout *ambientWidgetLayout;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconState");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_2;
  ambientWidgetLayout = self->_ambientWidgetLayout;
  if (!ambientWidgetLayout)
  {
    AMUILogInfograph();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AMUIInfographViewController _loadInfographPosterConfigurationDataWithError:].cold.2();
    goto LABEL_3;
  }
  -[PRPosterAmbientWidgetLayout widgetLayoutIconState](ambientWidgetLayout, "widgetLayoutIconState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    AMUILogInfograph();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AMUIInfographViewController _loadInfographPosterConfigurationDataWithError:].cold.3();
    goto LABEL_3;
  }
  -[PRPosterAmbientWidgetLayout widgetLayoutIconState](self->_ambientWidgetLayout, "widgetLayoutIconState");
  v7 = objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController _uniqueIdentifierStacksFromIconState:](self, "_uniqueIdentifierStacksFromIconState:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AMUILogInfograph();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v13;
    _os_log_impl(&dword_23600A000, v14, OS_LOG_TYPE_DEFAULT, "Successfully loading infographPosterConfigurationData with unique identifier stacks:%{public}@", (uint8_t *)&v15, 0xCu);
  }

  if (v7)
  {
LABEL_2:
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("AMUIIconStateKey"));
LABEL_3:

  }
  objc_msgSend(v5, "widgetIntents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_initIntents),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("AMUIIntentsKey"));

  }
  AMUILogInfograph();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[AMUIInfographViewController _loadInfographPosterConfigurationDataWithError:].cold.1();

  return v4;
}

- (void)_syncLocalAmbientIconStateAndIntentsToPoster
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "Poster configuration synced to PosterBoard %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (BOOL)_saveInfographPosterConfigurationData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  AMUIPosterUpdater *posterUpdater;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AMUIInfographViewController posterConfiguration](self, "posterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AMUILogInfograph();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("AMUIIconStateKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController _uniqueIdentifierStacksFromIconState:](self, "_uniqueIdentifierStacksFromIconState:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_23600A000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to save infograph with unique identifier stacks:%{public}@ for poster configuration:%@", buf, 0x16u);

  }
  AMUILogInfograph();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v13)
      -[AMUIInfographViewController _saveInfographPosterConfigurationData:completion:].cold.2();

    objc_initWeak((id *)buf, self);
    posterUpdater = self->_posterUpdater;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke;
    v17[3] = &unk_250763CC0;
    objc_copyWeak(&v20, (id *)buf);
    v18 = v8;
    v19 = v7;
    v15 = -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:](posterUpdater, "updateInfograph:forPosterConfiguration:completion:", v6, v18, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v13)
      -[AMUIInfographViewController _saveInfographPosterConfigurationData:completion:].cold.1();

    v15 = 0;
  }

  return v15;
}

void __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    AMUILogInfograph();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke_cold_2();

    if (v6)
    {
      AMUILogInfograph();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke_cold_1();

    }
    else if ((objc_msgSend(WeakRetained[149], "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_msgSend(WeakRetained, "posterConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serverUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v13)
        objc_msgSend(WeakRetained, "updatePosterConfiguration:withAnimationSettings:", v5, 0);
    }
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

}

- (id)_uniqueIdentifierStacksFromIconState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("iconLists"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count") == 2)
  {
    AMUILogInfograph();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_23600A000, v7, OS_LOG_TYPE_DEFAULT, "Parsing widget stacks:%@ into uniqueIdentifierStacks", buf, 0xCu);
    }

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController _uniqueIdentifiersForStack:](self, "_uniqueIdentifiersForStack:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController _uniqueIdentifiersForStack:](self, "_uniqueIdentifiersForStack:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMUILogInfograph();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AMUIInfographViewController _uniqueIdentifierStacksFromIconState:].cold.1();
    v12 = 0;
  }

  return v12;
}

- (id)_uniqueIdentifiersForStack:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AMUILogInfograph();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_23600A000, v4, OS_LOG_TYPE_DEFAULT, "Creating uniqueIdentifiers for stack:%@", buf, 0xCu);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("elements"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "objectForKey:", CFSTR("uniqueIdentifier"), (_QWORD)v17);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (__CFString *)v12;
        else
          v14 = CFSTR("(null uniqueIdentifier)");
        v15 = v14;

        objc_msgSend(v6, "addObject:", v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  -[AMUIInfographViewController setPosterConfiguration:](self, "setPosterConfiguration:", a3, a4);
  return 1;
}

- (void)invalidate
{
  void *v2;
  id v3;

  -[AMUIInfographViewController widgetHostManager](self, "widgetHostManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetHost");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deactivate");
}

- (void)noteAmbientViewControllingDelegateDidUpdate
{
  -[AMUIInfographViewController _setupAmbientDefaults](self, "_setupAmbientDefaults");
  -[AMUIInfographViewController _fetchDefaultWidgetDescriptorStacks](self, "_fetchDefaultWidgetDescriptorStacks");
  -[AMUIInfographViewController _fetchWidgetHostManager](self, "_fetchWidgetHostManager");
}

- (BOOL)handleDismiss
{
  void *v3;
  id WeakRetained;

  -[AMUIInfographViewController stackConfigurationViewController](self, "stackConfigurationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
    objc_msgSend(WeakRetained, "dismissModalInteractions");

  }
  return v3 != 0;
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  id v3;
  SBIconListView *iconListView;
  id v5;
  AMUIInfographMultipleAssertion *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  iconListView = self->_iconListView;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__AMUIInfographViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke;
  v8[3] = &unk_250763CE8;
  v9 = v3;
  v5 = v3;
  -[SBIconListView enumerateDisplayedIconViewsUsingBlock:](iconListView, "enumerateDisplayedIconViewsUsingBlock:", v8);
  v6 = -[AMUIInfographMultipleAssertion initWithAssertions:]([AMUIInfographMultipleAssertion alloc], "initWithAssertions:", v5);

  return v6;
}

void __74__AMUIInfographViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelTouchesForCurrentEventInHostedContent");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (BOOL)iconManagerWidgetsCanAppearInSecureEnvironment:(id)a3
{
  return 1;
}

- (void)iconManager:(id)a3 configureIconView:(id)a4 forIcon:(id)a5
{
  objc_class *v6;
  id v7;
  UINotificationFeedbackGenerator *v8;
  UINotificationFeedbackGenerator *widgetStackConfigurationFeedbackGenerator;
  id v10;

  v6 = (objc_class *)MEMORY[0x24BDF6BA0];
  v7 = a4;
  v10 = (id)objc_msgSend([v6 alloc], "initWithTarget:action:", self, sel_configurationLongPressDidUpdate_);
  objc_msgSend(v7, "addGestureRecognizer:");
  objc_msgSend(v7, "setShowsSquareCorners:", 1);
  objc_msgSend(v7, "addObserver:", self);

  if (!self->_widgetStackConfigurationFeedbackGenerator)
  {
    v8 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BDF6C10]);
    widgetStackConfigurationFeedbackGenerator = self->_widgetStackConfigurationFeedbackGenerator;
    self->_widgetStackConfigurationFeedbackGenerator = v8;

  }
}

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[AMUIInfographViewController _applicationBundleIdentifierForLaunchingIconView:](self, "_applicationBundleIdentifierForLaunchingIconView:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[AMUIInfographViewController _showLaunchConfirmationForApplicationWithBundleIdentifier:withActions:iconView:](self, "_showLaunchConfirmationForApplicationWithBundleIdentifier:withActions:iconView:", v8, v7, v9);

}

- (CGRect)iconManager:(id)a3 contentBoundingRectForConfigurationOfIconView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
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
  double v17;
  double v18;
  CGRect result;

  -[AMUIInfographViewController iconManager:containerViewControllerForConfigurationOfIconView:](self, "iconManager:containerViewControllerForConfigurationOfIconView:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    objc_msgSend(v6, "convertRect:toView:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (int64_t)iconManager:(id)a3 userInterfaceStyleForConfigurationOfIconView:(id)a4
{
  void *v4;
  int64_t v5;

  -[AMUIInfographViewController traitCollection](self, "traitCollection", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  return v5;
}

- (unint64_t)_addWidgetSheetStyle
{
  return 1;
}

- (id)customDisplayConfigurationForWidgetViewController
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BEB0928]);
  -[AMUIInfographViewController renderSchemeForWidgetViewController](self, "renderSchemeForWidgetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRenderScheme:colorScheme:", v4, 2);

  return v5;
}

- (id)renderSchemeForWidgetViewController
{
  void *v2;
  void *v3;
  unsigned int IsRedMode;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[AMUIInfographViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForNSIntegerTrait:", v3);
  IsRedMode = AMUIAmbientDisplayStyleIsRedMode();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16AA0]), "initWithRenderingMode:backgroundViewPolicy:", IsRedMode, 1);
  AMUILogInfograph();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 1024;
    v11 = IsRedMode;
    _os_log_impl(&dword_23600A000, v6, OS_LOG_TYPE_DEFAULT, "Created renderScheme:%@ for widget view controller with redModeEnabled:%d", (uint8_t *)&v8, 0x12u);
  }

  return v5;
}

- (Class)iconManager:(id)a3 folderControllerClassForFolderClass:(Class)a4 proposedClass:(Class)a5
{
  return 0;
}

- (id)iconManager:(id)a3 configurationDataForDataSource:(id)a4 ofIcon:(id)a5
{
  id v7;
  NSMutableDictionary *intents;
  NSMutableDictionary *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;

  v7 = a4;
  intents = self->_intents;
  if (!intents)
    intents = (NSMutableDictionary *)self->_initIntents;
  v9 = intents;
  v10 = a5;
  v11 = objc_opt_class();
  v12 = v7;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  objc_msgSend(v14, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v10, "isWidgetIcon");
  v17 = 0;
  if (v14 && v16)
  {
    -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_fetchIntents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *intents;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  _QWORD v19[4];
  id v20;

  -[AMUIInfographViewController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "widgetIntents"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v4, "widgetIntents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __44__AMUIInfographViewController__fetchIntents__block_invoke;
    v19[3] = &unk_250763D10;
    v20 = v9;
    v10 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v19);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    intents = self->_intents;
    self->_intents = v11;

  }
  else
  {
    -[AMUIInfographViewController _loadInfographPosterConfigurationDataWithError:](self, "_loadInfographPosterConfigurationDataWithError:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("AMUIIntentsKey"));
      v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v16 = self->_intents;
      self->_intents = v15;

    }
  }
  v17 = self->_intents;

  return v17;
}

void __44__AMUIInfographViewController__fetchIntents__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;

  v5 = a2;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v7)
  {
    AMUILogInfograph();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44__AMUIInfographViewController__fetchIntents__block_invoke_cold_1((uint64_t)v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);
  }

}

- (void)setIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *intents;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && !self->_intents)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    intents = self->_intents;
    self->_intents = v11;

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@"), v10);
  if (v8)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    if (!v14)
    {
      AMUILogWidgets();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v8, "_indexingHash");
        *(_DWORD *)buf = 138544130;
        v27 = v10;
        v28 = 2048;
        v29 = v24;
        v30 = 2112;
        v31 = v13;
        v32 = 2112;
        v33 = v15;
        _os_log_error_impl(&dword_23600A000, v17, OS_LOG_TYPE_ERROR, "Error archiving intent widget unique identifier '%{public}@/%lld/%@': %@", buf, 0x2Au);
      }
      goto LABEL_17;
    }
    -[NSMutableDictionary setObject:forKey:](self->_intents, "setObject:forKey:", v14, v13);
    v16 = objc_msgSend(v14, "length");
    AMUILogWidgets();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = objc_msgSend(v8, "_indexingHash");
        *(_DWORD *)buf = 138543618;
        v27 = v10;
        v28 = 2048;
        v29 = v19;
        v20 = "Saving intent for widget unique identifier '%{public}@'/%lld";
        v21 = v17;
        v22 = 22;
LABEL_16:
        _os_log_impl(&dword_23600A000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else if (v18)
    {
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      v20 = "Saving 0-length intent for widget unique identifier '%{public}@'";
      v21 = v17;
      v22 = 12;
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  AMUILogWidgets();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v27 = v10;
    v28 = 2048;
    v29 = objc_msgSend(0, "_indexingHash");
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_23600A000, v23, OS_LOG_TYPE_DEFAULT, "Removing intent for widget unique identifier '%{public}@'/%lld/%@", buf, 0x20u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_intents, "removeObjectForKey:", v13);
LABEL_18:

}

- (id)defaultIconStateForIconManager:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint8_t v10[16];

  AMUILogInfograph();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23600A000, v4, OS_LOG_TYPE_DEFAULT, "Fetching default icon state", v10, 2u);
  }

  -[AMUIInfographViewController defaultWidgetDescriptorStacks](self, "defaultWidgetDescriptorStacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController _iconStateFromDefaultWidgetDescriptorStacks:](self, "_iconStateFromDefaultWidgetDescriptorStacks:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[AMUIInfographViewController _defaultIconState](self, "_defaultIconState");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)iconManager:(id)a3 backgroundViewForComponentsOfType:(int64_t)a4 forIconView:(id)a5
{
  id v5;

  if (a4 == 1)
    v5 = 0;
  else
    v5 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  return v5;
}

- (unint64_t)maximumListCountForFoldersForIconManager:(id)a3
{
  return 1;
}

- (id)iconManager:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  return CFSTR("Folder");
}

- (BOOL)iconManagerCanSaveIconState:(id)a3
{
  return 1;
}

- (id)iconManager:(id)a3 metricsForCHSWidget:(id)a4 inLocation:(id)a5
{
  id v7;
  SBHWidgetMetricsProvider *addWidgetSheetMetricsProvider;
  SBHWidgetMetricsProvider *v9;
  SBHWidgetMetricsProvider *v10;
  void *v11;

  v7 = a4;
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x24BEB09E8]))
  {
    addWidgetSheetMetricsProvider = self->_addWidgetSheetMetricsProvider;
    if (!addWidgetSheetMetricsProvider)
    {
      v9 = (SBHWidgetMetricsProvider *)objc_alloc_init(MEMORY[0x24BEB0930]);
      v10 = self->_addWidgetSheetMetricsProvider;
      self->_addWidgetSheetMetricsProvider = v9;

      -[SBHWidgetMetricsProvider setDelegate:](self->_addWidgetSheetMetricsProvider, "setDelegate:", self);
      addWidgetSheetMetricsProvider = self->_addWidgetSheetMetricsProvider;
    }
    -[SBHWidgetMetricsProvider systemMetricsForWidget:](addWidgetSheetMetricsProvider, "systemMetricsForWidget:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)iconManagerAllowsWidgetStackWithSingleWidgetToPresentStackConfigurationSheet:(id)a3
{
  return 1;
}

- (int64_t)iconManager:(id)a3 closeBoxTypeForIconView:(id)a4 proposedType:(int64_t)a5
{
  return 1;
}

- (BOOL)iconManager:(id)a3 shouldContinueToUseBackgroundView:(id)a4 forComponentsOfIconView:(id)a5
{
  return 1;
}

- (BOOL)iconManager:(id)a3 isWidgetValid:(id)a4
{
  return 1;
}

- (BOOL)iconManager:(id)a3 isTimedOutForDataSourceContainerBundleIdentifier:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (objc_class *)MEMORY[0x24BDC1540];
  v5 = a4;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, 0);

  if (v6 && (v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE383E8]), "initWithApplicationRecord:", v6)) != 0)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "isBlockedForScreenTimeExpiration");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isRootFolderContentVisibleForIconManager:(id)a3
{
  return !-[AMUIInfographViewController isConfiguring](self, "isConfiguring", a3);
}

- (double)iconManager:(id)a3 verticalMarginPercentageForConfigurationOfIconView:(id)a4
{
  return 0.0;
}

- (id)iconManager:(id)a3 containerBundleIdentifierForDescriptor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "extensionIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "extensionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMUIInfographViewController _effectiveContainerBundleIdentifierForContainerBundleIdentifier:extensionBundleIdentifier:](self, "_effectiveContainerBundleIdentifierForContainerBundleIdentifier:extensionBundleIdentifier:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_effectiveContainerBundleIdentifierForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4
{
  __CFString *v5;
  id v6;

  v5 = (__CFString *)a3;
  v6 = a4;
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("com.apple.Health.Sleep"))
    && objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Health.Sleep.SleepWidgetExtension")))
  {

    v5 = CFSTR("com.apple.Health");
  }

  return v5;
}

- (BOOL)iconManager:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  return 0;
}

- (id)iconManager:(id)a3 bundleIdentifierToLaunchForWidgetURL:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a4;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLOverrideForURL:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "applicationsAvailableForOpeningURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      AMUILogWidgets();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AMUIInfographViewController iconManager:bundleIdentifierToLaunchForWidgetURL:].cold.1();

      v10 = 0;
    }

  }
  else
  {
    AMUILogWidgets();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23600A000, v7, OS_LOG_TYPE_DEFAULT, "No bundle identifier was found for widget URL because the URL was nil", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)iconManager:(id)a3 iconView:(id)a4 widgetWantsLaunchForBundleIdentifier:(id)a5 withAction:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "setWithObject:", a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController _showLaunchConfirmationForApplicationWithBundleIdentifier:withActions:iconView:](self, "_showLaunchConfirmationForApplicationWithBundleIdentifier:withActions:iconView:", v10, v12, v11);

}

- (id)iconManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  return -[AMUIInfographViewController targetedDragPreviewForIconView:item:session:previewParameters:](self, "targetedDragPreviewForIconView:item:session:previewParameters:", a4, a5, a6, a7);
}

- (BOOL)iconManager:(id)a3 isIconVisibleForBundleIdentifier:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[AMUIInfographViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "viewController:isApplicationVisibleWithBundleIdentifier:", self, v5);

  return (char)self;
}

- (BOOL)iconManager:(id)a3 iconViewDisplaysLabel:(id)a4
{
  return 0;
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  void *v4;
  char isKindOfClass;
  id v6;

  objc_msgSend(a3, "customIconImageViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v6, "setClipsWidgetsToViewBounds:", 0);

}

- (unint64_t)presenterType
{
  return 0;
}

- (BOOL)isDisplayingEditingButtons
{
  return 0;
}

- (BOOL)cannotRemoveLastWidgetInWidgetSheet
{
  return 1;
}

- (int64_t)overrideUserInterfaceStyleForPresentingWidgetSheet
{
  return 1;
}

- (void)stackConfigurationInteraction:(id)a3 requestsPresentAddWidgetSheetFromPresenter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeClass");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB08D8]), "initWithGridSizeClass:", v9);
  -[AMUIInfographViewController _presentAddWidgetSheetFromViewController:withAllowedSizeClasses:allowsNonStackableItems:](self, "_presentAddWidgetSheetFromViewController:withAllowedSizeClasses:allowsNonStackableItems:", v6, v8, 0);

}

- (id)stackConfigurationInteraction:(id)a3 draggedIconForIdentifier:(id)a4
{
  return 0;
}

- (id)stackConfigurationInteraction:(id)a3 dragPreviewForIconView:(id)a4
{
  return 0;
}

- (id)stackConfigurationInteraction:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  return -[AMUIInfographViewController targetedDragPreviewForIconView:item:session:previewParameters:](self, "targetedDragPreviewForIconView:item:session:previewParameters:", a4, a5, a6, a7);
}

- (id)windowForIconDragPreviewsForStackConfigurationInteraction:(id)a3 forWindowScene:(id)a4
{
  return 0;
}

- (id)stackConfigurationInteraction:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5
{
  return 0;
}

- (double)stackConfigurationInteraction:(id)a3 iconContentScaleForGridSizeClass:(id)a4
{
  return 0.5;
}

- (BOOL)stackConfigurationInteractionShouldDisallowLabelArea:(id)a3
{
  return 1;
}

- (BOOL)stackConfigurationInteraction:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  return 0;
}

- (void)stackConfigurationInteraction:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __110__AMUIInfographViewController_stackConfigurationInteraction_iconView_willAnimateDragLiftWithAnimator_session___block_invoke;
  v9[3] = &unk_250763388;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a5, "addAnimations:", v9);

}

uint64_t __110__AMUIInfographViewController_stackConfigurationInteraction_iconView_willAnimateDragLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowsCloseBox:", 0);
}

- (void)stackConfigurationInteraction:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5
{
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a4;
  v7 = a5 == 1;
  v8 = (void *)MEMORY[0x24BDF6F90];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __106__AMUIInfographViewController_stackConfigurationInteraction_iconView_dragLiftAnimationDidChangeDirection___block_invoke;
  v10[3] = &unk_250763960;
  v11 = v6;
  v12 = v7;
  v9 = v6;
  objc_msgSend(v8, "animateWithDuration:animations:", v10, 0.2);

}

uint64_t __106__AMUIInfographViewController_stackConfigurationInteraction_iconView_dragLiftAnimationDidChangeDirection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowsCloseBox:", *(unsigned __int8 *)(a1 + 40));
}

- (int64_t)stackConfigurationInteractionIconViewComponentBackgroundViewType:(id)a3
{
  return 6;
}

- (BOOL)stackConfigurationInteraction:(id)a3 allowsRemovalOfIconDataSource:(id)a4
{
  return objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode", a3, a4) ^ 1;
}

- (void)stackConfigurationViewControllerWillAppear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  SBHAddWidgetSheetConfigurationManager *addWidgetSheetConfigurationManager;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  v10 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v10;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[AMUIInfographViewController setStackConfigurationViewController:](self, "setStackConfigurationViewController:", v7);
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  -[AMUIInfographViewController addWidgetSheetViewController](self, "addWidgetSheetViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetConfigurationManager fetchGalleryContentForStackConfigurationViewController:addWidgetSheetViewController:](addWidgetSheetConfigurationManager, "fetchGalleryContentForStackConfigurationViewController:addWidgetSheetViewController:", v7, v9);

  objc_msgSend(v7, "setCanDismissWhileDragging:", 0);
  -[AMUIInfographViewController _handleWidgetSheetViewControllerWillAppear:](self, "_handleWidgetSheetViewControllerWillAppear:", v10);

  -[AMUIInfographViewController _willEnterConfigurationForReason:](self, "_willEnterConfigurationForReason:", CFSTR("AMUIConfigurationReasonStackConfiguration"));
  -[AMUIInfographViewController _dismissLaunchConfirmationAnimated:](self, "_dismissLaunchConfirmationAnimated:", 1);
  -[AMUIInfographViewController _startStackConfigurationEditingTimeoutTimer](self, "_startStackConfigurationEditingTimeoutTimer");

}

- (void)stackConfigurationViewControllerDidAppear:(id)a3
{
  -[AMUIInfographViewController _handleWidgetSheetViewControllerDidAppear:](self, "_handleWidgetSheetViewControllerDidAppear:", a3);
  -[AMUIInfographViewController _keepIconViewsStaticForReason:](self, "_keepIconViewsStaticForReason:", CFSTR("AMUIKeepRootStaticForStackEditingReason"));
}

- (void)stackConfigurationViewControllerWillDisappear:(id)a3
{
  id v4;

  -[AMUIInfographViewController _handleWidgetSheetViewControllerWillDisappear:](self, "_handleWidgetSheetViewControllerWillDisappear:", a3);
  -[AMUIInfographViewController _willEndConfigurationForReason:](self, "_willEndConfigurationForReason:", CFSTR("AMUIConfigurationReasonStackConfiguration"));
  -[NSMutableDictionary objectForKey:](self->_keepRootStaticAssertions, "objectForKey:", CFSTR("AMUIKeepRootStaticForStackEditingReason"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");
  -[AMUIInfographViewController _invalidateStackConfigurationEditingTimeoutTimer](self, "_invalidateStackConfigurationEditingTimeoutTimer");

}

- (void)stackConfigurationViewControllerDidDisappear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = objc_opt_class();
  v9 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v9;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[AMUIInfographViewController stackConfigurationViewController](self, "stackConfigurationViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[AMUIInfographViewController setStackConfigurationViewController:](self, "setStackConfigurationViewController:", 0);
    -[SBHAddWidgetSheetConfigurationManager setStackConfigurationSuggestedWidgetItems:](self->_addWidgetSheetConfigurationManager, "setStackConfigurationSuggestedWidgetItems:", 0);
  }
  -[AMUIInfographViewController _handleWidgetSheetViewControllerDidDisappear:](self, "_handleWidgetSheetViewControllerDidDisappear:", v9);
  objc_storeWeak((id *)&self->_iconViewPresentingStackConfiguration, 0);

}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[AMUIInfographViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v9 != 0, 0);
  objc_msgSend(v6, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v9, "presenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController _handleInsertionForWidgetIcon:withReferenceIconView:fromPresenter:](self, "_handleInsertionForWidgetIcon:withReferenceIconView:fromPresenter:", v7, v6, v8);

  }
}

- (void)_handleInsertionForWidgetIcon:(id)a3 withReferenceIconView:(id)a4 fromPresenter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  AMUIInfographViewController *v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  v12 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke;
  v24 = &unk_250763DB0;
  v25 = v8;
  v26 = v14;
  v27 = self;
  v28 = v9;
  v15 = v9;
  v16 = v14;
  v17 = v8;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7EA970](&v21);
  objc_msgSend(v16, "iconListView", v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "model");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v18)[2](v18, v20);
}

void __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, double);
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BEB0970], "placeholderForIcon:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIcon:", v4);
  if (objc_msgSend(v3, "directlyContainsIcon:", v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "iconListView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v6 = MEMORY[0x24BDAC760];
    v33 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_2;
    v24[3] = &unk_250763D60;
    v31 = v32;
    v25 = v3;
    v7 = v4;
    v26 = v7;
    v27 = *(id *)(a1 + 32);
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(void **)(a1 + 56);
    v28 = v8;
    v29 = v9;
    v30 = v10;
    v11 = (void *)MEMORY[0x23B7EA970](v24);
    v12 = objc_alloc_init(MEMORY[0x24BEB0948]);
    objc_initWeak(&location, v12);
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_4;
    v19[3] = &unk_250763D88;
    v13 = v7;
    v20 = v13;
    v14 = v11;
    v21 = v14;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v12, "setDidAddIconViewBlock:", v19);
    objc_msgSend(v8, "addLayoutObserver:", v12);
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_5;
    v18[3] = &unk_2507634B8;
    v18[4] = v32;
    v15 = (void *)MEMORY[0x23B7EA970](v18);
    objc_msgSend(*(id *)(a1 + 40), "scrollIconToVisible:animated:completion:", v13, 0, v15);
    objc_msgSend(*(id *)(a1 + 40), "iconListView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayedIconViewForIcon:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v14[2](v14, 0.0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    _Block_object_dispose(v32, 8);
  }

}

void __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v2;
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    v4 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_3;
    v8[3] = &unk_250763D38;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(void **)(a1 + 72);
    v12 = v5;
    v13 = v6;
    v14 = v7;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], v8);

  }
}

void __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "replaceIcon:withIcon:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 56), "layoutAndCreateIcon:", *(_QWORD *)(a1 + 48));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 64) + 1216));
  objc_msgSend(WeakRetained, "widgetInsertionRippleIconAnimatorForIcon:iconListView:withReferenceIconView:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "animateWithCompletion:", 0);
}

void __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __n128 v9;
  id WeakRetained;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9.n128_u64[0] = 0x3FD3333333333333;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v9.n128_f64[0] = 0.0;
    (*(void (**)(uint64_t, __n128))(v6 + 16))(v6, v9);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "invalidate");

  }
}

uint64_t __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_5(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
    *(_BYTE *)(v1 + 24) = 1;
  return result;
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  -[AMUIInfographViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)addWidgetSheetViewControllerWillAppear:(id)a3
{
  id v4;

  v4 = a3;
  -[AMUIInfographViewController _invalidateStackConfigurationEditingTimeoutTimer](self, "_invalidateStackConfigurationEditingTimeoutTimer");
  -[AMUIInfographViewController _handleWidgetSheetViewControllerWillAppear:](self, "_handleWidgetSheetViewControllerWillAppear:", v4);

}

- (void)addWidgetSheetViewControllerDidAppear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AMUIInfographViewController stackConfigurationViewController](self, "stackConfigurationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "keepIconImageViewControllersStaticForReason:", CFSTR("AMUIKeepStackStaticForAddWidgetSheetPresentationReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v8, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("AMUIKeepStackStaticForAddWidgetSheetPresentationReason"));

    }
  }
  -[AMUIInfographViewController _handleWidgetSheetViewControllerDidAppear:](self, "_handleWidgetSheetViewControllerDidAppear:", v8);

}

- (void)addWidgetSheetViewControllerWillDisappear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AMUIKeepStackStaticForAddWidgetSheetPresentationReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("AMUIKeepStackStaticForAddWidgetSheetPresentationReason"));

  }
  -[AMUIInfographViewController _handleWidgetSheetViewControllerWillDisappear:](self, "_handleWidgetSheetViewControllerWillDisappear:", v7);
  -[AMUIInfographViewController _restartStackConfigurationEditingTimeoutTimer](self, "_restartStackConfigurationEditingTimeoutTimer");

}

- (void)_handleWidgetSheetViewControllerWillAppear:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  objc_msgSend(v3, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuppressesEditingStateForListView:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v3, "hidesPresenterTitledButtons"))
      v5 = 0.0;
    else
      v5 = 0.3;
  }
  else
  {
    v5 = 0.3;
  }
  v6 = (void *)MEMORY[0x24BDF6F90];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__AMUIInfographViewController__handleWidgetSheetViewControllerWillAppear___block_invoke;
  v8[3] = &unk_250763388;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "animateWithDuration:animations:completion:", v8, 0, v5);

}

uint64_t __74__AMUIInfographViewController__handleWidgetSheetViewControllerWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitledButtonsAlpha:", 0.0);
}

- (void)_handleWidgetSheetViewControllerWillDisappear:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a3, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuppressesEditingStateForListView:", 0);
  v4 = (void *)MEMORY[0x24BDF6F90];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__AMUIInfographViewController__handleWidgetSheetViewControllerWillDisappear___block_invoke;
  v6[3] = &unk_250763388;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v6, 0, 0.3);

}

uint64_t __77__AMUIInfographViewController__handleWidgetSheetViewControllerWillDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitledButtonsAlpha:", 1.0);
}

- (void)_handleWidgetSheetViewControllerDidDisappear:(id)a3
{
  id v3;

  objc_msgSend(a3, "presenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateExtraButtonVisibilityAnimated:", 1);

}

- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v11 = objc_opt_class();
  v12 = v8;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v10)
  {
    -[AMUIInfographViewController widgetIconForDescriptor:sizeClass:](self, "widgetIconForDescriptor:sizeClass:", v10, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v14)
  {
    objc_msgSend(v14, "descriptorsForSizeClass:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController widgetIconForDescriptors:sizeClass:](self, "widgetIconForDescriptors:sizeClass:", v16, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BEB0978];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCHSWidgetDescriptor:", v5);

  SBHIconGridSizeClassForCHSWidgetFamily();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGridSizeClass:", v7);

  return v6;
}

- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BEB0978];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCHSWidgetDescriptors:", v5);

  SBHIconGridSizeClassForCHSWidgetFamily();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGridSizeClass:", v7);

  return v6;
}

- (void)didBeginDraggingWidgetIcon:(id)a3
{
  -[AMUIInfographViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  SBHAddWidgetSheetConfigurationManager *addWidgetSheetConfigurationManager;
  id v4;

  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  -[AMUIInfographViewController addWidgetSheetViewController](self, "addWidgetSheetViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetConfigurationManager updatePresentedWidgetEditingViewController:](addWidgetSheetConfigurationManager, "updatePresentedWidgetEditingViewController:", v4);

}

- (void)widgetHostManager:(id)a3 didNoteStackChangedActiveWidget:(id)a4
{
  void *v5;
  id v6;

  -[AMUIInfographViewController delegate](self, "delegate", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController _infographConfigurationMetadata](self, "_infographConfigurationMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didUpdateActiveConfigurationMetadata:", self, v5);

}

- (id)_infographConfigurationMetadata
{
  id v3;
  SBIconListView *iconListView;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  iconListView = self->_iconListView;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__AMUIInfographViewController__infographConfigurationMetadata__block_invoke;
  v7[3] = &unk_250763DD8;
  v5 = v3;
  v8 = v5;
  -[SBIconListView enumerateIconViewsUsingBlock:](iconListView, "enumerateIconViewsUsingBlock:", v7);

  return v5;
}

void __62__AMUIInfographViewController__infographConfigurationMetadata__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(a2, "customIconImageViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v16;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "widgetIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeWidget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("WidgetStack"), "stringByAppendingFormat:", CFSTR("%lu"), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@:%@"), v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, v10);
  }

}

- (void)_presentAddWidgetSheetFromViewController:(id)a3 withAllowedSizeClasses:(id)a4 allowsNonStackableItems:(BOOL)a5
{
  _BOOL8 v5;
  SBHAddWidgetSheetConfigurationManager *addWidgetSheetConfigurationManager;
  SBHAddWidgetSheetConfigurationManager *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;

  v5 = a5;
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  v39 = a4;
  v10 = addWidgetSheetConfigurationManager;
  v11 = a4;
  v12 = a3;
  -[SBHAddWidgetSheetConfigurationManager applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:](v10, "applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:", v12, &v39, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v39;

  v38 = v14;
  v15 = objc_msgSend(v14, "chsWidgetFamilyMask");
  v16 = v5;
  -[AMUIInfographViewController _iconViewProvider](self, "_iconViewProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController iconManager](self, "iconManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addWidgetSheetIconImageCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init(MEMORY[0x24BEB08C0]);
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB0900]), "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v20, v17, v15, v16, v19, -[AMUIInfographViewController _addWidgetSheetStyle](self, "_addWidgetSheetStyle"));
  objc_msgSend(v21, "setAddWidgetSheetLocation:", -[SBHAddWidgetSheetConfigurationManager addWidgetSheetLocation](v10, "addWidgetSheetLocation"));
  objc_msgSend(v21, "setPresenter:", v12);

  objc_msgSend(v21, "setAddWidgetSheetWidgetBackgroundType:", 1);
  -[AMUIInfographViewController traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOverrideUserInterfaceStyle:", objc_msgSend(v22, "userInterfaceStyle"));

  -[SBHAddWidgetSheetConfigurationManager stackConfigurationSuggestedWidgetItems](v10, "stackConfigurationSuggestedWidgetItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setGalleryLayoutSize:", 0);
  objc_msgSend(v21, "setSuggestedItems:forGalleryLayoutSize:", v23, 0);
  -[AMUIInfographViewController setAddWidgetSheetViewController:](self, "setAddWidgetSheetViewController:", v21);
  objc_msgSend(v21, "setApplicationWidgetCollections:", v13);
  objc_msgSend(v21, "setDelegate:", self);
  objc_msgSend(v21, "setModalPresentationStyle:", 2);
  -[AMUIInfographViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;

  objc_msgSend(v21, "preferredInsetsForSheetPresentationInInterfaceOrientation:", -[AMUIInfographViewController interfaceOrientation](self, "interfaceOrientation"));
  objc_msgSend(v21, "setPreferredContentSize:", v26 - (v29 + v30), v28 - (v31 + v32));
  objc_msgSend(v21, "presentationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_class();
  v35 = v33;
  if (v34)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;
  }
  else
  {
    v36 = 0;
  }
  v37 = v36;

  objc_msgSend(v37, "_setShouldDismissWhenTappedOutside:", 1);
  objc_msgSend(v37, "setPrefersEdgeAttachedInCompactHeight:", 1);
  objc_msgSend(v37, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);
  objc_msgSend(v37, "setPreferredCornerRadius:", 35.0);

  -[AMUIInfographViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
}

- (void)_showLaunchConfirmationForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4 iconView:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id buf;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  CGAffineTransform v67;
  _QWORD v68[6];
  _QWORD v69[3];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[AMUIInfographViewController isConfiguring](self, "isConfiguring"))
  {
    AMUILogInfograph();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23600A000, v11, OS_LOG_TYPE_DEFAULT, "Skipping launch confirmation because of configuration", (uint8_t *)&buf, 2u);
    }
LABEL_12:

    goto LABEL_17;
  }
  objc_msgSend(v10, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    AMUILogInfograph();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23600A000, v11, OS_LOG_TYPE_DEFAULT, "Skipping launch confirmation because iconView is no longer in a window", (uint8_t *)&buf, 2u);
    }
    goto LABEL_12;
  }
  objc_msgSend(v10, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v15)
  {
    AMUILogInfograph();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23600A000, v11, OS_LOG_TYPE_DEFAULT, "Skipping launch confirmation because iconView is not in the correct window", (uint8_t *)&buf, 2u);
    }
    goto LABEL_12;
  }
  -[AMUIInfographViewController _willShowTemporaryOverlayForReason:](self, "_willShowTemporaryOverlayForReason:", CFSTR("AMUITemporaryOverlayReasonSetUpLaunchConfirmation"));
  -[AMUIInfographViewController _dismissLaunchConfirmationAnimated:](self, "_dismissLaunchConfirmationAnimated:", 1);
  if (v10)
  {
    v16 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithEffect:", v17);

    objc_msgSend(v18, "_setContinuousCornerRadius:", 14.0);
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsGroupBlending:", 1);

    objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("infograph-launch-confirmation"));
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:", 4, 33.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationPreferringMonochrome");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configurationByApplyingConfiguration:", v21);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("arrow.up.forward.square.fill"), v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v57);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setTintColor:", v22);

    objc_msgSend(v59, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsGroupBlending:", 1);

    objc_msgSend(v59, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCompositingFilter:", v26);

    objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v18, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v59);

    -[AMUIInfographViewController view](self, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addSubview:", v18);
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__launchConfirmationTapGestureDidFire_);
    objc_msgSend(v18, "addGestureRecognizer:", v44);
    -[AMUIInfographViewController setLaunchConfirmationView:](self, "setLaunchConfirmationView:", v18);
    -[AMUIInfographViewController setPendingLaunchBundleIdentifier:](self, "setPendingLaunchBundleIdentifier:", v8);
    -[AMUIInfographViewController setPendingLaunchActions:](self, "setPendingLaunchActions:", v9);
    v41 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v18, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToConstant:", 60.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v54;
    objc_msgSend(v18, "heightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToConstant:", 60.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v52;
    objc_msgSend(v18, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, -15.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v48;
    objc_msgSend(v18, "centerYAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 15.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v45;
    objc_msgSend(v18, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v68[4] = v28;
    objc_msgSend(v18, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v68[5] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v32);

    CGAffineTransformMakeScale(&v67, 0.01, 0.01);
    objc_msgSend(v18, "setTransform:", &v67);
    objc_msgSend(v18, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x24BE0BEA0], "settingsWithMass:stiffness:damping:", 2.0, 219.325, 21.4268);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BE0BF08];
    v34 = MEMORY[0x24BDAC760];
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke;
    v65[3] = &unk_250763388;
    v35 = v18;
    v66 = v35;
    objc_msgSend(v33, "animateWithSettings:options:actions:completion:", v56, 2, v65, 0);
    objc_msgSend(MEMORY[0x24BE0BE48], "settingsWithMass:stiffness:damping:", 2.0, 1973.92, 125.664);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDelay:", 0.085);
    v37 = (void *)MEMORY[0x24BE0BF08];
    v63[0] = v34;
    v63[1] = 3221225472;
    v63[2] = __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_2;
    v63[3] = &unk_250763388;
    v38 = v35;
    v64 = v38;
    objc_msgSend(v37, "animateWithSettings:options:actions:completion:", v36, 2, v63, 0);
    objc_initWeak(&buf, self);
    v39 = (void *)MEMORY[0x24BDBCF40];
    v60[0] = v34;
    v60[1] = 3221225472;
    v60[2] = __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_3;
    v60[3] = &unk_250763E00;
    objc_copyWeak(&v61, &buf);
    objc_msgSend(v39, "scheduledTimerWithTimeInterval:repeats:block:", 0, v60, 10.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController setLaunchConfirmationCancelTimer:](self, "setLaunchConfirmationCancelTimer:", v40);
    -[AMUIInfographViewController _willShowTemporaryOverlayForReason:](self, "_willShowTemporaryOverlayForReason:", CFSTR("AMUITemporaryOverlayReasonLaunchConfirmation"));

    objc_destroyWeak(&v61);
    objc_destroyWeak(&buf);

  }
  else
  {
    -[AMUIInfographViewController _handleLaunchRequestForApplicationWithBundleIdentifier:withActions:](self, "_handleLaunchRequestForApplicationWithBundleIdentifier:withActions:", v8, v9);
  }
  -[AMUIInfographViewController _willHideTemporaryOverlayForReason:](self, "_willHideTemporaryOverlayForReason:", CFSTR("AMUITemporaryOverlayReasonSetUpLaunchConfirmation"));
LABEL_17:

}

uint64_t __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissLaunchConfirmationAnimated:", 1);

}

- (void)_launchConfirmationTapGestureDidFire:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[AMUIInfographViewController pendingLaunchBundleIdentifier](self, "pendingLaunchBundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController pendingLaunchActions](self, "pendingLaunchActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "bs_filter:", &__block_literal_global_10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMUIInfographViewController _handleLaunchRequestForApplicationWithBundleIdentifier:withActions:](self, "_handleLaunchRequestForApplicationWithBundleIdentifier:withActions:", v6, v5);

    }
    -[AMUIInfographViewController _dismissLaunchConfirmationAnimated:](self, "_dismissLaunchConfirmationAnimated:", 1);

  }
}

uint64_t __68__AMUIInfographViewController__launchConfirmationTapGestureDidFire___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValid");
}

- (void)_dismissLaunchConfirmationAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  -[AMUIInfographViewController launchConfirmationView](self, "launchConfirmationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (v3)
    {
      v7 = (void *)MEMORY[0x24BDF6F90];
      v8 = MEMORY[0x24BDAC760];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __66__AMUIInfographViewController__dismissLaunchConfirmationAnimated___block_invoke;
      v15[3] = &unk_250763388;
      v16 = v5;
      v10 = v8;
      v11 = 3221225472;
      v12 = __66__AMUIInfographViewController__dismissLaunchConfirmationAnimated___block_invoke_2;
      v13 = &unk_2507637B0;
      v14 = v16;
      objc_msgSend(v7, "animateWithDuration:animations:completion:", v15, &v10, 0.3);

    }
    else
    {
      objc_msgSend(v5, "removeFromSuperview");
    }
    -[AMUIInfographViewController setLaunchConfirmationView:](self, "setLaunchConfirmationView:", 0, v10, v11, v12, v13);
    -[AMUIInfographViewController _willHideTemporaryOverlayForReason:](self, "_willHideTemporaryOverlayForReason:", CFSTR("AMUITemporaryOverlayReasonLaunchConfirmation"));
  }
  -[AMUIInfographViewController launchConfirmationCancelTimer](self, "launchConfirmationCancelTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[AMUIInfographViewController setLaunchConfirmationCancelTimer:](self, "setLaunchConfirmationCancelTimer:", 0);
  -[AMUIInfographViewController setPendingLaunchBundleIdentifier:](self, "setPendingLaunchBundleIdentifier:", 0);
  -[AMUIInfographViewController setPendingLaunchActions:](self, "setPendingLaunchActions:", 0);

}

uint64_t __66__AMUIInfographViewController__dismissLaunchConfirmationAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __66__AMUIInfographViewController__dismissLaunchConfirmationAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_handleLaunchRequestForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a4;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE38310]);
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v9, *MEMORY[0x24BE38320]);
  objc_msgSend(v8, "bs_setSafeObject:forKey:", CFSTR("AMUIAppLaunchOriginAmbient"), *MEMORY[0x24BE382E0]);
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v7, *MEMORY[0x24BE382A0]);

  objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke;
  v13[3] = &unk_250763E68;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "openApplication:withOptions:completion:", v12, v10, v13);

}

void __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a3;
  AMUILogInfograph();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5)
      __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke_cold_2();
  }
  else if (v5)
  {
    __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke_cold_1();
  }

}

- (void)_registerForAmbientPresentationTraitChanges
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[AMUIInfographViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v4, &__block_literal_global_146);

}

void __74__AMUIInfographViewController__registerForAmbientPresentationTraitChanges__block_invoke(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2 + 152;
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "customDisplayConfigurationForWidgetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AMUILogInfograph();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_23600A000, v6, OS_LOG_TYPE_DEFAULT, "Updating widget view controllers to custom display configuration:%@ due to displayStyleTrait change", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(WeakRetained, "updateWidgetViewControllersWithCustomDisplayConfiguration:", v5);
}

- (id)_iconStateWithLeadingElements:(id)a3 trialingElements:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[2];
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[7];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v20[0] = CFSTR("elements");
  v20[1] = CFSTR("allowsExternalSuggestions");
  v21[0] = a3;
  v21[1] = &unk_250778C18;
  v20[2] = CFSTR("gridSize");
  v20[3] = CFSTR("allowsSuggestions");
  v21[2] = CFSTR("small");
  v21[3] = &unk_250778C30;
  v20[4] = CFSTR("iconType");
  v21[4] = CFSTR("custom");
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  v13 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("elements");
  v18[1] = CFSTR("allowsExternalSuggestions");
  v19[0] = v6;
  v19[1] = &unk_250778C18;
  v18[2] = CFSTR("gridSize");
  v18[3] = CFSTR("allowsSuggestions");
  v19[2] = CFSTR("small");
  v19[3] = &unk_250778C30;
  v18[4] = CFSTR("iconType");
  v19[4] = CFSTR("custom");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("iconLists");
  v14[0] = v7;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_iconStateFromDefaultWidgetDescriptorStacks:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AMUILogInfograph();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_23600A000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to create iconStateFromDefaultWidgetDescriptorStacks:%@", (uint8_t *)&v13, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController _stackElementsFromWidgetDescriptors:](self, "_stackElementsFromWidgetDescriptors:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController _stackElementsFromWidgetDescriptors:](self, "_stackElementsFromWidgetDescriptors:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController _iconStateWithLeadingElements:trialingElements:](self, "_iconStateWithLeadingElements:trialingElements:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMUILogInfograph();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_23600A000, v11, OS_LOG_TYPE_DEFAULT, "Successfully created iconStateFromDefaultWidgetDescriptorStacks:%@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    AMUILogInfograph();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_23600A000, v6, OS_LOG_TYPE_DEFAULT, "Could not create default icon state because defaultWidgetDescriptorStacks was nil", (uint8_t *)&v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_stackElementsFromWidgetDescriptors:(id)a3
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
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "kind");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "extensionIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "containerBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "extensionBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = CFSTR("elementType");
        v21[1] = CFSTR("widgetIdentifier");
        v22[0] = CFSTR("widget");
        v22[1] = v10;
        v21[2] = CFSTR("containerBundleIdentifier");
        v21[3] = CFSTR("bundleIdentifier");
        v22[2] = v12;
        v22[3] = v13;
        v21[4] = CFSTR("widgetSuggestionSource");
        v22[4] = CFSTR("onboarding");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_defaultIconState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  AMUIInfographViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[4];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[4];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[7];

  v65[5] = *MEMORY[0x24BDAC8D0];
  v64[0] = CFSTR("elementType");
  v64[1] = CFSTR("widgetIdentifier");
  v65[0] = CFSTR("widget");
  v65[1] = CFSTR("com.apple.mobiletimer.datetime");
  v64[2] = CFSTR("containerBundleIdentifier");
  v64[3] = CFSTR("bundleIdentifier");
  v65[2] = CFSTR("com.apple.mobiletimer");
  v65[3] = CFSTR("com.apple.mobiletimer.WorldClockWidget");
  v64[4] = CFSTR("widgetSuggestionSource");
  v65[4] = CFSTR("onboarding");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 5);
  v41 = objc_claimAutoreleasedReturnValue();
  v62[0] = CFSTR("elementType");
  v62[1] = CFSTR("widgetIdentifier");
  v63[0] = CFSTR("widget");
  v63[1] = CFSTR("com.apple.CalendarWidget.CalendarDateWidget");
  v62[2] = CFSTR("containerBundleIdentifier");
  v62[3] = CFSTR("bundleIdentifier");
  v63[2] = CFSTR("com.apple.mobilecal");
  v63[3] = CFSTR("com.apple.mobilecal.CalendarWidgetExtension");
  v62[4] = CFSTR("widgetSuggestionSource");
  v63[4] = CFSTR("onboarding");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v60[0] = CFSTR("elementType");
  v60[1] = CFSTR("widgetIdentifier");
  v61[0] = CFSTR("widget");
  v61[1] = CFSTR("detail");
  v60[2] = CFSTR("containerBundleIdentifier");
  v60[3] = CFSTR("bundleIdentifier");
  v61[2] = CFSTR("com.apple.stocks");
  v61[3] = CFSTR("com.apple.stocks.widget");
  v60[4] = CFSTR("widgetSuggestionSource");
  v61[4] = CFSTR("onboarding");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 5);
  v3 = objc_claimAutoreleasedReturnValue();
  v58[0] = CFSTR("elementType");
  v58[1] = CFSTR("widgetIdentifier");
  v59[0] = CFSTR("widget");
  v59[1] = CFSTR("com.apple.mobiletimer.square");
  v58[2] = CFSTR("containerBundleIdentifier");
  v58[3] = CFSTR("bundleIdentifier");
  v59[2] = CFSTR("com.apple.mobiletimer");
  v59[3] = CFSTR("com.apple.mobiletimer.WorldClockWidget");
  v58[4] = CFSTR("widgetSuggestionSource");
  v59[4] = CFSTR("onboarding");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 5);
  v57[0] = v41;
  v35 = (void *)v3;
  v36 = (void *)v2;
  v57[1] = v2;
  v57[2] = v3;
  v34 = objc_claimAutoreleasedReturnValue();
  v57[3] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController _validatedStackFromWidgets:](self, "_validatedStackFromWidgets:", v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v55[0] = CFSTR("elementType");
  v55[1] = CFSTR("widgetIdentifier");
  v56[0] = CFSTR("widget");
  v56[1] = CFSTR("com.apple.CalendarWidget.CalendarMonthWidget");
  v55[2] = CFSTR("containerBundleIdentifier");
  v55[3] = CFSTR("bundleIdentifier");
  v56[2] = CFSTR("com.apple.mobilecal");
  v56[3] = CFSTR("com.apple.mobilecal.CalendarWidgetExtension");
  v55[4] = CFSTR("widgetSuggestionSource");
  v56[4] = CFSTR("onboarding");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v53[0] = CFSTR("elementType");
  v53[1] = CFSTR("widgetIdentifier");
  v54[0] = CFSTR("widget");
  v54[1] = CFSTR("com.apple.weather");
  v53[2] = CFSTR("containerBundleIdentifier");
  v53[3] = CFSTR("bundleIdentifier");
  v54[2] = CFSTR("com.apple.weather");
  v54[3] = CFSTR("com.apple.weather.widget");
  v53[4] = CFSTR("widgetSuggestionSource");
  v54[4] = CFSTR("onboarding");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 5);
  v6 = objc_claimAutoreleasedReturnValue();
  v51[0] = CFSTR("elementType");
  v51[1] = CFSTR("widgetIdentifier");
  v52[0] = CFSTR("widget");
  v52[1] = CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget");
  v51[2] = CFSTR("containerBundleIdentifier");
  v51[3] = CFSTR("bundleIdentifier");
  v52[2] = CFSTR("com.apple.mobilecal");
  v52[3] = CFSTR("com.apple.mobilecal.CalendarWidgetExtension");
  v51[4] = CFSTR("widgetSuggestionSource");
  v52[4] = CFSTR("onboarding");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 5);
  v7 = objc_claimAutoreleasedReturnValue();
  v49[0] = CFSTR("elementType");
  v49[1] = CFSTR("widgetIdentifier");
  v49[2] = CFSTR("containerBundleIdentifier");
  v50[0] = CFSTR("widget");
  v50[1] = CFSTR("com.apple.reminders.widget");
  v49[3] = CFSTR("bundleIdentifier");
  v49[4] = CFSTR("widgetSuggestionSource");
  v50[2] = CFSTR("com.apple.reminders");
  v50[3] = CFSTR("com.apple.reminders.WidgetExtension");
  v50[4] = CFSTR("onboarding");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
  v39 = (void *)v6;
  v40 = (void *)v5;
  v48[0] = v5;
  v48[1] = v6;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v7;
  v48[2] = v7;
  v48[3] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographViewController _validatedStackFromWidgets:](self, "_validatedStackFromWidgets:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v42, "count");
  v11 = objc_msgSend(v9, "count");
  v12 = v11;
  if (v10 && v11)
  {
    v14 = (void *)v41;
    v13 = v42;
    v15 = self;
    v17 = v35;
    v16 = v36;
    v18 = (void *)v34;
  }
  else
  {
    v46[0] = CFSTR("elementType");
    v46[1] = CFSTR("widgetIdentifier");
    v47[0] = CFSTR("widget");
    v47[1] = CFSTR("BatteriesAvocadoWidget");
    v46[2] = CFSTR("containerBundleIdentifier");
    v46[3] = CFSTR("bundleIdentifier");
    v47[2] = CFSTR("com.apple.Batteries");
    v47[3] = CFSTR("com.apple.Batteries.BatteriesAvocadoWidgetExtension");
    v46[4] = CFSTR("widgetSuggestionSource");
    v47[4] = CFSTR("onboarding");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = CFSTR("elementType");
    v44[1] = CFSTR("widgetIdentifier");
    v45[0] = CFSTR("widget");
    v45[1] = CFSTR("SingleContactWidget_iOS");
    v44[2] = CFSTR("containerBundleIdentifier");
    v44[3] = CFSTR("bundleIdentifier");
    v45[2] = CFSTR("com.apple.PeopleViewService");
    v45[3] = CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS");
    v44[4] = CFSTR("widgetSuggestionSource");
    v45[4] = CFSTR("onboarding");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "count") == 2)
    {
      objc_msgSend(v42, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "valueForKey:", CFSTR("containerBundleIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.mobiletimer"));

    }
    else
    {
      v21 = 0;
    }
    v17 = v35;
    v16 = v36;
    v18 = (void *)v34;
    v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v10 | v12)
    {
      if (v10)
      {
        v15 = self;
        if (v12)
        {
          v14 = (void *)v41;
          v13 = v42;
        }
        else
        {
          v13 = v42;
          if (objc_msgSend(v42, "count") == 1)
            v26 = 1;
          else
            v26 = v21;
          if (v26 == 1)
          {
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v33);
            v27 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v27;
          }
          else
          {
            -[AMUIInfographViewController _splitStackElements:intoLeadingElements:trailingElements:](self, "_splitStackElements:intoLeadingElements:trailingElements:", v42, v22, v23);
          }
          v14 = (void *)v41;
        }
      }
      else
      {
        v14 = (void *)v41;
        v15 = self;
        if (objc_msgSend(v9, "count") == 1)
        {
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v33);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[AMUIInfographViewController _splitStackElements:intoLeadingElements:trailingElements:](self, "_splitStackElements:intoLeadingElements:trailingElements:", v9, v22, v23);
          v13 = v42;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v33);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v32);
      v25 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v25;
      v13 = (void *)v24;
      v14 = (void *)v41;
      v15 = self;
    }
    if (objc_msgSend(v22, "count") && objc_msgSend(v23, "count"))
    {
      v28 = v22;

      v29 = v23;
      v9 = v29;
      v13 = v28;
    }

  }
  -[AMUIInfographViewController _iconStateWithLeadingElements:trialingElements:](v15, "_iconStateWithLeadingElements:trialingElements:", v13, v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (void)_splitStackElements:(id)a3 intoLeadingElements:(id)a4 trailingElements:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (unint64_t)objc_msgSend(v9, "count") >> 1;
  objc_msgSend(v9, "subarrayWithRange:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v11);

  objc_msgSend(v9, "subarrayWithRange:", v10, objc_msgSend(v9, "count") - v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v12);
}

- (id)_validatedStackFromWidgets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", CFSTR("containerBundleIdentifier"), v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("extensionBundleIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[AMUIInfographViewController _recordExistsForContainerBundleIdentifier:](self, "_recordExistsForContainerBundleIdentifier:", v10);
        v13 = -[AMUIInfographViewController _isApplicationProtectedForContainerBundleIdentifier:extensionBundleIdentifier:](self, "_isApplicationProtectedForContainerBundleIdentifier:extensionBundleIdentifier:", v10, v11);
        if (v12 && !v13)
          objc_msgSend(v15, "addObject:", v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v15;
}

- (BOOL)_preparePosterConfigurationToSaveWithCurrentIconState:(id)a3 intents:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[AMUIInfographViewController _emptyIconState:](self, "_emptyIconState:", v8))
  {
    AMUILogInfograph();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AMUIInfographViewController _preparePosterConfigurationToSaveWithCurrentIconState:intents:reason:].cold.1();
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (v8)
      -[NSObject setObject:forKey:](v13, "setObject:forKey:", v8, CFSTR("AMUIIconStateKey"));
    if (v9)
      -[NSObject setObject:forKey:](v11, "setObject:forKey:", v9, CFSTR("AMUIIntentsKey"));
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __100__AMUIInfographViewController__preparePosterConfigurationToSaveWithCurrentIconState_intents_reason___block_invoke;
    v15[3] = &unk_250763ED0;
    v16 = v10;
    v12 = -[AMUIInfographViewController _saveInfographPosterConfigurationData:completion:](self, "_saveInfographPosterConfigurationData:completion:", v11, v15);

  }
  return v12;
}

void __100__AMUIInfographViewController__preparePosterConfigurationToSaveWithCurrentIconState_intents_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    AMUILogInfograph();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_23600A000, v7, OS_LOG_TYPE_ERROR, "Error saving poster configuration. Updated reason:%@ configuration:%@ error:%@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (BOOL)_emptyIconState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  BOOL v19;

  objc_msgSend(a3, "objectForKey:", CFSTR("iconLists"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      v9 = v7;
      if (v8)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v12 = v10;

      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_class();
      v15 = v13;
      if (v14)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v17 = v16;

      v18 = -[AMUIInfographViewController _isStackEmpty:](self, "_isStackEmpty:", v12);
      v19 = -[AMUIInfographViewController _isStackEmpty:](self, "_isStackEmpty:", v17);

      v11 = v18 || v19;
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)_isStackEmpty:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "bs_safeArrayForKey:", CFSTR("elements"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeStringForKey:", CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5 == 0;
  if (v4 && objc_msgSend(v4, "count"))
    v6 = 0;

  return v6;
}

- (void)configurationLongPressDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = v5;
      -[AMUIInfographViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createUnlockRequestForViewController:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setName:", v12);

      AMUIAmbientUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UNLOCK_WIDGET_STACK_EDITING"), &stru_250764378, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUnlockDestination:", v14);

      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __63__AMUIInfographViewController_configurationLongPressDidUpdate___block_invoke;
      v16[3] = &unk_250763788;
      objc_copyWeak(&v18, &location);
      v15 = v8;
      v17 = v15;
      objc_msgSend(v9, "requestUnlockForViewController:withRequest:completion:", self, v10, v16);
      -[AMUIInfographViewController _dismissLaunchConfirmationAnimated:](self, "_dismissLaunchConfirmationAnimated:", 1);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
  }

}

void __63__AMUIInfographViewController_configurationLongPressDidUpdate___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  int v4;
  void *v5;
  int v6;
  id *v7;

  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v4 = objc_msgSend(*(id *)(a1 + 32), "_isInAWindow");
      WeakRetained = v7;
      if (v4)
      {
        objc_msgSend(v7, "viewIfLoaded");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "_isInAWindow");

        WeakRetained = v7;
        if (v6)
        {
          objc_msgSend(v7[141], "notificationOccurred:", 0);
          objc_storeWeak(v7 + 140, *(id *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 32), "presentStackConfigurationCard");
          WeakRetained = v7;
        }
      }
    }

  }
}

- (void)_fetchWidgetHostManager
{
  void *v3;
  void *v4;
  id v5;

  -[AMUIInfographViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetHostManagerForViewController:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setDelegate:", self);
    -[AMUIInfographViewController setWidgetHostManager:](self, "setWidgetHostManager:", v5);
    objc_msgSend(v5, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInfographViewController setIconManager:](self, "setIconManager:", v4);

  }
}

- (void)_fetchDefaultWidgetDescriptorStacks
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[AMUIInfographViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultWidgetDescriptorStacksForViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AMUILogInfograph();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_23600A000, v5, OS_LOG_TYPE_DEFAULT, "Fetched defaultWidgetDescriptorStacks:%@", (uint8_t *)&v6, 0xCu);
  }

  -[AMUIInfographViewController setDefaultWidgetDescriptorStacks:](self, "setDefaultWidgetDescriptorStacks:", v4);
}

- (void)_keepIconViewsStaticForReason:(id)a3
{
  id v4;
  NSMutableDictionary *keepRootStaticAssertions;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  keepRootStaticAssertions = self->_keepRootStaticAssertions;
  if (!keepRootStaticAssertions)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = self->_keepRootStaticAssertions;
    self->_keepRootStaticAssertions = v6;

    keepRootStaticAssertions = self->_keepRootStaticAssertions;
  }
  v8 = keepRootStaticAssertions;
  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x24BE0BE98]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__AMUIInfographViewController__keepIconViewsStaticForReason___block_invoke;
  v14[3] = &unk_250763EF8;
  objc_copyWeak(&v16, &location);
  v12 = v4;
  v15 = v12;
  v13 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v11, v12, v14);

  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v13, v12);
  -[AMUIInfographViewController _evaluatePresentationModeForIconViews](self, "_evaluatePresentationModeForIconViews");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __61__AMUIInfographViewController__keepIconViewsStaticForReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[153], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_evaluatePresentationModeForIconViews");
    WeakRetained = v3;
  }

}

- (void)_evaluatePresentationModeForIconViews
{
  -[AMUIInfographViewController _updateIconViewsWithPresentationMode:](self, "_updateIconViewsWithPresentationMode:", -[NSMutableDictionary count](self->_keepRootStaticAssertions, "count") != 0);
}

- (void)_updateIconViewsWithPresentationMode:(unint64_t)a3
{
  SBIconListView *iconListView;
  _QWORD v4[5];

  iconListView = self->_iconListView;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__AMUIInfographViewController__updateIconViewsWithPresentationMode___block_invoke;
  v4[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
  v4[4] = a3;
  -[SBIconListView enumerateIconViewsUsingBlock:](iconListView, "enumerateIconViewsUsingBlock:", v4);
}

void __68__AMUIInfographViewController__updateIconViewsWithPresentationMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(a2, "customIconImageViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "setPresentationMode:", *(_QWORD *)(a1 + 32));
      v4 = v6;
    }
  }

}

- (void)_registerForFirstPresentationStateChange
{
  AMAmbientDefaults *ambientDefaults;
  void *v4;
  uint64_t v5;
  id v6;
  BSDefaultObserver *v7;
  BSDefaultObserver *defaultObserver;
  _QWORD v9[4];
  id v10;
  id location;

  if (-[AMAmbientDefaults isFirstPresentation](self->_ambientDefaults, "isFirstPresentation"))
  {
    objc_initWeak(&location, self);
    ambientDefaults = self->_ambientDefaults;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "firstPresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC9B8];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __71__AMUIInfographViewController__registerForFirstPresentationStateChange__block_invoke;
    v9[3] = &unk_2507633B0;
    objc_copyWeak(&v10, &location);
    -[AMAmbientDefaults observeDefault:onQueue:withBlock:](ambientDefaults, "observeDefault:onQueue:withBlock:", v4, v5, v9);
    v7 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
    defaultObserver = self->_defaultObserver;
    self->_defaultObserver = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __71__AMUIInfographViewController__registerForFirstPresentationStateChange__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained[137], "isFirstPresentation") & 1) == 0)
  {
    v3 = dispatch_time(0, 800000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__AMUIInfographViewController__registerForFirstPresentationStateChange__block_invoke_2;
    block[3] = &unk_250763388;
    block[4] = v2;
    dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __71__AMUIInfographViewController__registerForFirstPresentationStateChange__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flashPageControlAnimated:", 1);
}

- (void)_flashPageControlAnimated:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__AMUIInfographViewController__flashPageControlAnimated___block_invoke;
  v3[3] = &__block_descriptor_33_e38_v16__0__SBHWidgetStackViewController_8l;
  v4 = a3;
  -[AMUIInfographViewController _enumerateWidgetStackViewControllersWithBlock:](self, "_enumerateWidgetStackViewControllersWithBlock:", v3);
}

void __57__AMUIInfographViewController__flashPageControlAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_flashPageControlAnimated:", *(unsigned __int8 *)(a1 + 32));

}

- (void)_enumerateWidgetStackViewControllersWithBlock:(id)a3
{
  id v4;
  SBIconListView *iconListView;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  iconListView = self->_iconListView;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__AMUIInfographViewController__enumerateWidgetStackViewControllersWithBlock___block_invoke;
  v7[3] = &unk_250763F60;
  v8 = v4;
  v6 = v4;
  -[SBIconListView enumerateIconViewsUsingBlock:](iconListView, "enumerateIconViewsUsingBlock:", v7);

}

void __77__AMUIInfographViewController__enumerateWidgetStackViewControllersWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a2, "customIconImageViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v6;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_applicationBundleIdentifierForLaunchingIconView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isWidgetIcon"))
  {
    objc_msgSend(v3, "customIconImageViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "currentWidgetViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sbh_underlyingAvocadoHostViewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "widget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "extensionIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isConfiguring
{
  return -[NSCountedSet count](self->_configurationReasons, "count") != 0;
}

- (void)_willEnterConfigurationForReason:(id)a3
{
  NSCountedSet *configurationReasons;
  NSCountedSet *v5;
  NSCountedSet *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  configurationReasons = self->_configurationReasons;
  if (!configurationReasons)
  {
    v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    v6 = self->_configurationReasons;
    self->_configurationReasons = v5;

    configurationReasons = self->_configurationReasons;
  }
  v7 = -[NSCountedSet count](configurationReasons, "count");
  -[NSCountedSet addObject:](self->_configurationReasons, "addObject:", v9);
  if (!v7)
  {
    -[AMUIInfographViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerWillBeginConfiguration:", self);

  }
}

- (void)_willEndConfigurationForReason:(id)a3
{
  NSCountedSet *configurationReasons;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  id v9;

  configurationReasons = self->_configurationReasons;
  v5 = a3;
  v6 = -[NSCountedSet count](configurationReasons, "count");
  -[NSCountedSet removeObject:](self->_configurationReasons, "removeObject:", v5);

  v7 = -[NSCountedSet count](self->_configurationReasons, "count");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    -[AMUIInfographViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllerWillEndConfiguration:", self);

  }
}

- (void)_willShowTemporaryOverlayForReason:(id)a3
{
  NSCountedSet *temporaryOverlayReasons;
  NSCountedSet *v5;
  NSCountedSet *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  temporaryOverlayReasons = self->_temporaryOverlayReasons;
  if (!temporaryOverlayReasons)
  {
    v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    v6 = self->_temporaryOverlayReasons;
    self->_temporaryOverlayReasons = v5;

    temporaryOverlayReasons = self->_temporaryOverlayReasons;
  }
  v7 = -[NSCountedSet count](temporaryOverlayReasons, "count");
  -[NSCountedSet addObject:](self->_temporaryOverlayReasons, "addObject:", v9);
  if (!v7)
  {
    -[AMUIInfographViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerWillBeginShowingTemporaryOverlay:", self);

  }
}

- (void)_willHideTemporaryOverlayForReason:(id)a3
{
  NSCountedSet *temporaryOverlayReasons;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  id v9;

  temporaryOverlayReasons = self->_temporaryOverlayReasons;
  v5 = a3;
  v6 = -[NSCountedSet count](temporaryOverlayReasons, "count");
  -[NSCountedSet removeObject:](self->_temporaryOverlayReasons, "removeObject:", v5);

  v7 = -[NSCountedSet count](self->_temporaryOverlayReasons, "count");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    -[AMUIInfographViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllerWillEndShowingTemporaryOverlay:", self);

  }
}

- (id)targetedDragPreviewForIconView:(id)a3 item:(id)a4 session:(id)a5 previewParameters:(id)a6
{
  id v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v20;
  CGRect v21;

  v7 = a6;
  v8 = a3;
  objc_msgSend(v8, "iconImageInfo");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v15);

  v16 = (void *)MEMORY[0x24BDF6870];
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v10;
  v20.size.height = v12;
  v21 = CGRectInset(v20, -6.0, -6.0);
  objc_msgSend(v16, "bezierPathWithRoundedRect:cornerRadius:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisiblePath:", v17);

  objc_msgSend(v8, "defaultDragPreviewWithParameters:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_setupAmbientDefaults
{
  void *v3;
  AMAmbientDefaults *v4;
  AMAmbientDefaults *ambientDefaults;
  uint64_t v6;

  -[AMUIInfographViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ambientDefaultsForViewController:", self);
  v4 = (AMAmbientDefaults *)objc_claimAutoreleasedReturnValue();
  ambientDefaults = self->_ambientDefaults;
  self->_ambientDefaults = v4;

  if (-[AMUIInfographViewController wantsDefaultInfographLayout](self, "wantsDefaultInfographLayout"))
    v6 = 1;
  else
    v6 = -[AMAmbientDefaults isFirstPresentation](self->_ambientDefaults, "isFirstPresentation");
  -[AMUIInfographViewController setWantsDefaultInfographLayout:](self, "setWantsDefaultInfographLayout:", v6);
  -[AMUIInfographViewController _registerForFirstPresentationStateChange](self, "_registerForFirstPresentationStateChange");
}

- (void)_validateIconListModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AMUIInfographViewController _validateIcons:inIconListModel:](self, "_validateIcons:inIconListModel:", v5, v4);
    v6 = objc_msgSend(v4, "numberOfIcons");
    switch(v6)
    {
      case 0:
        -[AMUIInfographViewController _createBatteriesWidgetIcon](self, "_createBatteriesWidgetIcon");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMUIInfographViewController _createContactsWidgetIcon](self, "_createContactsWidgetIcon");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v7;
        v36[1] = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v4, "addIcons:", v9);

        goto LABEL_27;
      case 1:
        objc_msgSend(v4, "firstIcon");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterAmbientWidgetLayout widgetLayoutIconState](self->_ambientWidgetLayout, "widgetLayoutIconState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "objectForKey:", CFSTR("AMUIIconStateKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", CFSTR("iconLists"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_class();
          v16 = v14;
          if (v15)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v17 = v16;
            else
              v17 = 0;
          }
          else
          {
            v17 = 0;
          }
          v18 = v17;

          if (v18)
          {
            objc_msgSend(v18, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_opt_class();
            v21 = v19;
            if (v20)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v22 = v21;
              else
                v22 = 0;
            }
            else
            {
              v22 = 0;
            }
            v23 = v22;

            if (v23 && objc_msgSend(v23, "count") == 2)
            {
              objc_msgSend(v23, "firstObject");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_opt_class();
              __BSSafeCast(v24, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                objc_msgSend(v26, "objectForKey:", CFSTR("displayIdentifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_opt_class();
                __BSSafeCast(v27, v28);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v7, "uniqueIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = v26;
                v30 = objc_msgSend(v35, "isEqualToString:", v29);

                -[AMUIInfographViewController _createBatteriesWidgetIcon](self, "_createBatteriesWidgetIcon");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v30;
                v26 = v34;
                v33 = (id)objc_msgSend(v4, "insertIcon:atIndex:", v31, v32);

              }
            }

          }
        }

        goto LABEL_27;
      case 2:
        -[AMUIInfographViewController _defaultIconState](self, "_defaultIconState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMUIInfographViewController _migrateClockCityWidgetForIconListModel:withDefaultIconState:](self, "_migrateClockCityWidgetForIconListModel:withDefaultIconState:", v4, v7);
LABEL_27:

        break;
    }
  }

}

- (void)_validateIcons:(id)a3 inIconListModel:(id)a4
{
  id v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = a4;
  obj = v6;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v9 = objc_opt_class();
        v10 = v8;
        if (v9)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
        }
        else
        {
          v11 = 0;
        }
        v12 = v11;

        if (v12)
        {
          v26 = i;
          objc_msgSend(v12, "widgets");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v28 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                objc_msgSend(v18, "containerBundleIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (!-[AMUIInfographViewController _recordExistsForContainerBundleIdentifier:](self, "_recordExistsForContainerBundleIdentifier:", v19))
                {
                  AMUILogInfograph();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v36 = v18;
                    _os_log_impl(&dword_23600A000, v20, OS_LOG_TYPE_DEFAULT, "Removing widget:%@ from icon because container app was deleted", buf, 0xCu);
                  }

                  objc_msgSend(v12, "removeIconDataSource:", v18);
                }
                if (-[AMUIInfographViewController _isApplicationForWidgetProtected:](self, "_isApplicationForWidgetProtected:", v18))
                {
                  AMUILogInfograph();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v36 = v18;
                    _os_log_impl(&dword_23600A000, v21, OS_LOG_TYPE_DEFAULT, "Removing widget:%@ from icon because container app is locked or hidden", buf, 0xCu);
                  }

                  objc_msgSend(v12, "removeIconDataSource:", v18);
                }

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
            }
            while (v15);
          }
          if (!objc_msgSend(v12, "iconDataSourceCount"))
            objc_msgSend(v22, "removeIcon:", v12);

          i = v26;
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v25);
  }

}

- (BOOL)_isApplicationForWidgetProtected:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[AMUIInfographViewController _isApplicationProtectedForContainerBundleIdentifier:extensionBundleIdentifier:](self, "_isApplicationProtectedForContainerBundleIdentifier:extensionBundleIdentifier:", v5, v6);
  return (char)self;
}

- (BOOL)_isApplicationProtectedForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  -[AMUIInfographViewController _effectiveContainerBundleIdentifierForContainerBundleIdentifier:extensionBundleIdentifier:](self, "_effectiveContainerBundleIdentifierForContainerBundleIdentifier:extensionBundleIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "isLocked") & 1) != 0 || objc_msgSend(v5, "isHidden");

  return v6;
}

- (BOOL)_recordExistsForContainerBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  return v5 != 0;
}

- (id)_createBatteriesWidgetIcon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0920]), "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", CFSTR("BatteriesAvocadoWidget"), CFSTR("com.apple.Batteries.BatteriesAvocadoWidgetExtension"), CFSTR("com.apple.Batteries"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0978]), "initWithWidget:", v2);

  return v3;
}

- (id)_createContactsWidgetIcon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0920]), "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", CFSTR("SingleContactWidget_iOS"), CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"), CFSTR("com.apple.PeopleViewService"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0978]), "initWithWidget:", v2);

  return v3;
}

- (void)_migrateClockCityWidgetForIconListModel:(id)a3 withDefaultIconState:(id)a4
{
  id v6;
  AMAmbientDefaults *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  v6 = a4;
  v7 = self->_ambientDefaults;
  if ((-[AMAmbientDefaults hasMigratedClockCityWidget](v7, "hasMigratedClockCityWidget") & 1) == 0)
  {
    objc_msgSend(v37, "iconAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v10 = v8;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    objc_msgSend(v12, "iconDataSources");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("iconLists"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    v16 = v14;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    if (v18)
    {
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_class();
      v21 = v19;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v24 = v22;

      if (v24)
      {
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_opt_class();
        v27 = v25;
        if (v26)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v27;
          else
            v28 = 0;
        }
        else
        {
          v28 = 0;
        }
        v29 = v28;

        if (v29)
        {
          objc_msgSend(v29, "objectForKey:", CFSTR("elements"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_opt_class();
          v32 = v30;
          if (v31)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v33 = v32;
            else
              v33 = 0;
          }
          else
          {
            v33 = 0;
          }
          v23 = v33;

        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
    if (-[AMUIInfographViewController _shouldMigrateClockCityWidgetForIconDataSources:withWidgetStackElements:](self, "_shouldMigrateClockCityWidgetForIconDataSources:withWidgetStackElements:", v13, v23))
    {
      objc_msgSend(v13, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeIconDataSource:", v34);
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0920]), "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.mobiletimer.datetime"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"));
      objc_msgSend(v13, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertIconDataSource:beforeIconDataSource:", v35, v36);

    }
    -[AMAmbientDefaults setMigratedClockCityWidget:](v7, "setMigratedClockCityWidget:", 1);

  }
}

- (BOOL)_shouldMigrateClockCityWidgetForIconDataSources:(id)a3 withWidgetStackElements:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  char v24;
  char v25;
  char v26;
  void *v28;

  v5 = a3;
  v6 = a4;
  v28 = v5;
  v7 = objc_msgSend(v5, "count");
  if (v7 < objc_msgSend(v6, "count"))
  {
LABEL_26:
    v9 = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v9 = 1;
    while (1)
    {
      objc_msgSend(v28, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      v12 = v10;
      if (v11)
        v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
      else
        v13 = 0;
      v14 = v13;

      objc_msgSend(v6, "objectAtIndex:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_class();
      v17 = v15;
      if (v16)
        v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v17 : 0;
      else
        v18 = 0;
      v19 = v18;

      if (!v14 || !v19)
        break;
      objc_msgSend(v14, "extensionBundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "kind");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", CFSTR("bundleIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v19, "objectForKey:", CFSTR("widgetIdentifier"));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = CFSTR("com.apple.mobiletimer.City");
      }
      v24 = objc_msgSend(v20, "isEqualToString:", v22);
      v25 = objc_msgSend(v21, "isEqualToString:", v23);
      if (v9)
        v26 = v24;
      else
        v26 = 0;
      v9 = v26 & v25;

      if (++v8 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_27;
    }

    goto LABEL_26;
  }
  v9 = 1;
LABEL_27:

  return v9;
}

- (void)_restartStackConfigurationEditingTimeoutTimer
{
  NSTimer *v3;
  NSTimer *configurationEditTimeoutTimer;

  -[AMUIInfographViewController _invalidateStackConfigurationEditingTimeoutTimer](self, "_invalidateStackConfigurationEditingTimeoutTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__stackConfigurationEditingTimeoutTimerFired, 0, 0, 30.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  configurationEditTimeoutTimer = self->_configurationEditTimeoutTimer;
  self->_configurationEditTimeoutTimer = v3;

  -[NSTimer setTolerance:](self->_configurationEditTimeoutTimer, "setTolerance:", 10.0);
}

- (void)_stackConfigurationEditingTimeoutTimerFired
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewPresentingStackConfiguration);
  objc_msgSend(WeakRetained, "dismissStackConfigurationCard");

  -[AMUIInfographViewController _invalidateStackConfigurationEditingTimeoutTimer](self, "_invalidateStackConfigurationEditingTimeoutTimer");
}

- (void)_invalidateStackConfigurationEditingTimeoutTimer
{
  NSTimer *configurationEditTimeoutTimer;
  NSTimer *v4;

  configurationEditTimeoutTimer = self->_configurationEditTimeoutTimer;
  if (configurationEditTimeoutTimer)
  {
    -[NSTimer invalidate](configurationEditTimeoutTimer, "invalidate");
    v4 = self->_configurationEditTimeoutTimer;
    self->_configurationEditTimeoutTimer = 0;

  }
}

- (void)proactiveSuggestionsProvider:(id)a3 willUseIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6
{
  -[AMUIInfographViewController setIntent:forIconWithIdentifier:widgetUniqueIdentifier:](self, "setIntent:forIconWithIdentifier:widgetUniqueIdentifier:", a4, a5, a6);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  SBIconListLayoutProvider *addWidgetSheetListLayoutProvider;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  AMUIInfographListLayoutProvider *v8;
  void *v9;
  id v10;
  void *v11;
  SBIconListLayoutProvider *v12;
  SBIconListLayoutProvider *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  addWidgetSheetListLayoutProvider = self->_addWidgetSheetListLayoutProvider;
  if (!addWidgetSheetListLayoutProvider)
  {
    v4 = *MEMORY[0x24BEB09F0];
    v5 = objc_alloc_init(MEMORY[0x24BEB08C0]);
    objc_msgSend(v5, "layoutForIconLocation:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB08B0]), "initWithBaseListLayout:", v6);
    v8 = objc_alloc_init(AMUIInfographListLayoutProvider);
    -[AMUIInfographListLayoutProvider layoutForIconLocation:](v8, "layoutForIconLocation:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setListLayout:forSelector:", v9, sel_widgetContentMargins);
    objc_msgSend(v7, "setListLayout:forSelector:", v9, sel_widgetContentMarginsWithBackgroundRemoved);
    objc_msgSend(v7, "setListLayout:forSelector:", v9, sel_widgetScaleFactor);
    objc_msgSend(v7, "setListLayout:forSelector:", v9, sel_iconImageInfo);
    objc_msgSend(v7, "setListLayout:forSelector:", v9, sel_iconImageInfoForGridSizeClass_);
    v10 = objc_alloc(MEMORY[0x24BEB08B8]);
    v15 = v4;
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (SBIconListLayoutProvider *)objc_msgSend(v10, "initWithListLayouts:", v11);
    v13 = self->_addWidgetSheetListLayoutProvider;
    self->_addWidgetSheetListLayoutProvider = v12;

    addWidgetSheetListLayoutProvider = self->_addWidgetSheetListLayoutProvider;
  }
  return addWidgetSheetListLayoutProvider;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a4, "customIconImageViewController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "addObserver:", self);

}

- (void)widgetStackViewControllerWillBeginScrolling:(id)a3
{
  -[AMUIInfographViewController _dismissLaunchConfirmationAnimated:](self, "_dismissLaunchConfirmationAnimated:", 1);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__AMUIInfographViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_250763388;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __76__AMUIInfographViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1216));
  objc_msgSend(WeakRetained, "rootFolder");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_validateIconListModel:", v4);
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (AMUIInfographViewControllerDelegate)delegate
{
  return (AMUIInfographViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  return self->_appProtectionSubjectMonitorSubscription;
}

- (SBHMainAddSheetViewControlling)addWidgetSheetViewController
{
  return self->_addWidgetSheetViewController;
}

- (void)setAddWidgetSheetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_addWidgetSheetViewController, a3);
}

- (SBHStackConfigurationViewController)stackConfigurationViewController
{
  return self->_stackConfigurationViewController;
}

- (void)setStackConfigurationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stackConfigurationViewController, a3);
}

- (PRSPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (AMUIWidgetHostManager)widgetHostManager
{
  return (AMUIWidgetHostManager *)objc_loadWeakRetained((id *)&self->_widgetHostManager);
}

- (void)setWidgetHostManager:(id)a3
{
  objc_storeWeak((id *)&self->_widgetHostManager, a3);
}

- (NSArray)defaultWidgetDescriptorStacks
{
  return (NSArray *)objc_loadWeakRetained((id *)&self->_defaultWidgetDescriptorStacks);
}

- (void)setDefaultWidgetDescriptorStacks:(id)a3
{
  objc_storeWeak((id *)&self->_defaultWidgetDescriptorStacks, a3);
}

- (BOOL)wantsDefaultInfographLayout
{
  return self->_wantsDefaultInfographLayout;
}

- (void)setWantsDefaultInfographLayout:(BOOL)a3
{
  self->_wantsDefaultInfographLayout = a3;
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (NSMutableDictionary)keepRootStaticAssertions
{
  return self->_keepRootStaticAssertions;
}

- (void)setKeepRootStaticAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_keepRootStaticAssertions, a3);
}

- (UIView)launchConfirmationView
{
  return self->_launchConfirmationView;
}

- (void)setLaunchConfirmationView:(id)a3
{
  objc_storeStrong((id *)&self->_launchConfirmationView, a3);
}

- (NSTimer)launchConfirmationCancelTimer
{
  return self->_launchConfirmationCancelTimer;
}

- (void)setLaunchConfirmationCancelTimer:(id)a3
{
  objc_storeStrong((id *)&self->_launchConfirmationCancelTimer, a3);
}

- (NSString)pendingLaunchBundleIdentifier
{
  return self->_pendingLaunchBundleIdentifier;
}

- (void)setPendingLaunchBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1248);
}

- (NSSet)pendingLaunchActions
{
  return self->_pendingLaunchActions;
}

- (void)setPendingLaunchActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (BSInvalidatable)disableIconStateAutosaveAssertion
{
  return self->_disableIconStateAutosaveAssertion;
}

- (void)setDisableIconStateAutosaveAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_disableIconStateAutosaveAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableIconStateAutosaveAssertion, 0);
  objc_storeStrong((id *)&self->_pendingLaunchActions, 0);
  objc_storeStrong((id *)&self->_pendingLaunchBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchConfirmationCancelTimer, 0);
  objc_storeStrong((id *)&self->_launchConfirmationView, 0);
  objc_storeStrong((id *)&self->_keepRootStaticAssertions, 0);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_destroyWeak((id *)&self->_defaultWidgetDescriptorStacks);
  objc_destroyWeak((id *)&self->_widgetHostManager);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_stackConfigurationViewController, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetViewController, 0);
  objc_storeStrong((id *)&self->_appProtectionSubjectMonitorSubscription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_widgetDragHandler);
  objc_storeStrong((id *)&self->_widgetStackConfigurationFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_iconViewPresentingStackConfiguration);
  objc_storeStrong((id *)&self->_configurationEditTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_defaultObserver, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_ambientWidgetLayout, 0);
  objc_storeStrong((id *)&self->_posterUpdater, 0);
  objc_storeStrong((id *)&self->_initIntents, 0);
  objc_storeStrong((id *)&self->_intents, 0);
  objc_storeStrong((id *)&self->_temporaryOverlayReasons, 0);
  objc_storeStrong((id *)&self->_configurationReasons, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetListLayoutProvider, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_widgetExtensionProvider, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetConfigurationManager, 0);
  objc_storeStrong((id *)&self->_listModel, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionsProvider, 0);
  objc_storeStrong((id *)&self->_proactiveUsageObserver, 0);
  objc_storeStrong((id *)&self->_proactiveClient, 0);
}

- (void)_setAmbientDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_ambientDefaults, a3);
}

+ (id)_clockCityWidget
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB0920]), "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.mobiletimer.City"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"));
}

+ (id)_clockLocalWidget
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB0920]), "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.mobiletimer.datetime"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"));
}

+ (id)_bigDateTimeWidget
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB0920]), "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.CalendarWidget.CalendarDateWidget"), CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.mobilecal"));
}

+ (id)_stocksWidget
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB0920]), "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", CFSTR("detail"), CFSTR("com.apple.stocks.widget"), CFSTR("com.apple.stocks"));
}

+ (id)_clockSquareWidget
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB0920]), "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.mobiletimer.square"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"));
}

+ (id)_defaultWidgetDescriptionForKind:(id)a3 bundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("elementType");
  v13[1] = CFSTR("widgetIdentifier");
  v14[0] = CFSTR("widget");
  v14[1] = a3;
  v13[2] = CFSTR("containerBundleIdentifier");
  v13[3] = CFSTR("bundleIdentifier");
  v14[2] = a5;
  v14[3] = a4;
  v13[4] = CFSTR("widgetSuggestionSource");
  v14[4] = CFSTR("onboarding");
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_clockCityWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:](AMUIInfographViewController, "_defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.mobiletimer.City"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"));
}

+ (id)_clockLocalWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:](AMUIInfographViewController, "_defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.mobiletimer.datetime"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"));
}

+ (id)_bigDateTimeWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:](AMUIInfographViewController, "_defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.CalendarWidget.CalendarDateWidget"), CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.mobilecal"));
}

+ (id)_stocksWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:](AMUIInfographViewController, "_defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:", CFSTR("detail"), CFSTR("com.apple.stocks.widget"), CFSTR("com.apple.stocks"));
}

+ (id)_clockSquareWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:](AMUIInfographViewController, "_defaultWidgetDescriptionForKind:bundleIdentifier:containerBundleIdentifier:", CFSTR("com.apple.mobiletimer.square"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"));
}

- (void)setPosterConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0(&dword_23600A000, v0, v1, "Skipping setPosterConfiguration; same poster already set (current '%@', new '%@')");
  OUTLINED_FUNCTION_2_0();
}

- (void)setPosterConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "Received empty widgetLayoutIconState from posterConfiguration:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)setPosterConfiguration:(uint64_t)a1 .cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0(&dword_23600A000, v1, v2, "Received nil ambientWidgetLayout from posterConfiguration:%@ withError:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

- (void)setPosterConfiguration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "Received nil widgetLayoutIconState from posterConfiguration:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)setPosterConfiguration:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "Executing setPosterConfiguration; new poster configuration incoming (new '%@')",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_loadInfographPosterConfigurationDataWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "Load memory icon state %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_loadInfographPosterConfigurationDataWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Error loading infographPosterConfigurationData, ambientWidgetLayout is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_loadInfographPosterConfigurationDataWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Error loading infographPosterConfigurationData, widgetLayoutIconState is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_saveInfographPosterConfigurationData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Failed to save infograph to poster configuration because we don't have a poster configuration yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_saveInfographPosterConfigurationData:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "Poster updater tries to update poster configuration %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "Failed to update infograph configuration with error: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "The updated poster configuration is %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_uniqueIdentifierStacksFromIconState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "Cannot create unique identifier stacks from icon state, invalid stacks in iconLists:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __44__AMUIInfographViewController__fetchIntents__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0(&dword_23600A000, v1, v2, "Fail to archive intent for %@ with error %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

- (void)iconManager:bundleIdentifierToLaunchForWidgetURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "No app proxies found for widget URL:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_0(&dword_23600A000, v0, v1, "[%{public}@] Application launch from widget succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_23600A000, v0, v1, "[%{public}@] Application launch from widget failed: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_preparePosterConfigurationToSaveWithCurrentIconState:intents:reason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "AMUIInfographViewController prepares to save an empty IconState", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
