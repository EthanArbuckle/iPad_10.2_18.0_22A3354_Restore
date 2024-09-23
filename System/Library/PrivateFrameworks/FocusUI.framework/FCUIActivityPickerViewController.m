@implementation FCUIActivityPickerViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    FCUIRegisterLogging();
}

+ (BOOL)isOnboardingEncountered
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("FCUIActivityPickerViewControllerOnboardingEncountered"));

  return v3;
}

+ (BOOL)isOnboardingComplete
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("FCUIActivityPickerViewControllerOnboardingComplete"));

  return v3;
}

- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
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
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3.size.height;
  v14 = a3.size.width;
  v15 = a3.origin.y;
  v16 = a3.origin.x;
  v18 = a5;
  v19 = a7;
  -[FCUIActivityPickerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activityViews");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", v20, a6, v19, v16, v15, v14, v13, x, y, width, height);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)setContractedFrame:(CGRect)a3 representedActivity:(id)a4 presentationStyle:(int64_t)a5 transitionCoordinator:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a6;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activityViews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", v15, a5, v14, x, y, width, height);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (FCUIActivityPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  FCUIActivityPickerViewController *v4;
  uint64_t v5;
  FCActivityManager *activityManager;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCUIActivityPickerViewController;
  v4 = -[FCUIActivityPickerViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE37EB8], "sharedActivityManager");
    v5 = objc_claimAutoreleasedReturnValue();
    activityManager = v4->_activityManager;
    v4->_activityManager = (FCActivityManager *)v5;

    -[FCActivityManager addObserver:](v4->_activityManager, "addObserver:", v4);
    v4->_footerPinnedToBottom = 1;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v4, CFSTR("FCUIActivityPickerViewControllerOnboardingComplete"), 1, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("FCUIActivityPickerViewControllerOnboardingComplete"));

  v4.receiver = self;
  v4.super_class = (Class)FCUIActivityPickerViewController;
  -[FCUIActivityPickerViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  FCUIActivityListView *v3;

  v3 = objc_alloc_init(FCUIActivityListView);
  -[FCUIActivityPickerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *SerialWithQoS;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)FCUIActivityPickerViewController;
  -[FCUIActivityPickerViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFooterPinnedToBottom:", self->_footerPinnedToBottom);

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)-[FCUIActivityPickerViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, &__block_literal_global);

  SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke_2;
  v8[3] = &unk_24D20A8F8;
  objc_copyWeak(&v9, &location);
  dispatch_async(SerialWithQoS, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSString *v4;
  void *v5;
  NSString *v6;
  NSComparisonResult v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory(v4, v6);

  if (v7)
  {
    objc_msgSend(v9, "_activityListView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustForContentSizeCategoryChange");

  }
}

void __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[122], "availableActivities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke_3;
    v5[3] = &unk_24D20A8D0;
    v5[4] = v2;
    v6 = v3;
    v4 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureActivityListViewWithAvailableActivities:", *(_QWORD *)(a1 + 40));
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCUIActivityPickerViewController;
  -[FCUIActivityPickerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[FCActivityManager setLifetimeDescriptionsUpdatingEnabled:](self->_activityManager, "setLifetimeDescriptionsUpdatingEnabled:", 1);
  -[FCUIActivityPickerViewController activeActivityDidChangeForManager:](self, "activeActivityDidChangeForManager:", self->_activityManager);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCUIActivityPickerViewController;
  -[FCUIActivityPickerViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  objc_msgSend((id)objc_opt_class(), "_markOnboardingEncountered");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7FocusUI26ActivityEditViewController *editViewController;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FCUIActivityPickerViewController;
  -[FCUIActivityPickerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[FCActivityManager setLifetimeDescriptionsUpdatingEnabled:](self->_activityManager, "setLifetimeDescriptionsUpdatingEnabled:", 0);
  -[ActivityEditViewController dismissViewControllerAnimated:completion:](self->_editViewController, "dismissViewControllerAnimated:completion:", v3, 0);
  editViewController = self->_editViewController;
  self->_editViewController = 0;

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  id v4;

  objc_msgSend(a3, "availableActivities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityPickerViewController _configureActivityListViewWithAvailableActivities:](self, "_configureActivityListViewWithAvailableActivities:", v4);

}

- (void)activityManager:(id)a3 lifetimeDescriptionsDidChangeForActivity:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a4;
  if ((objc_msgSend(v9, "isPlaceholder") & 1) == 0)
  {
    -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __93__FCUIActivityPickerViewController_activityManager_lifetimeDescriptionsDidChangeForActivity___block_invoke;
    v10[3] = &unk_24D20A920;
    v7 = v9;
    v11 = v7;
    objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCUIActivityPickerViewController _configureActivityView:withLifetimesDescriptionsForActivity:](self, "_configureActivityView:withLifetimesDescriptionsForActivity:", v8, v7);
  }

}

uint64_t __93__FCUIActivityPickerViewController_activityManager_lifetimeDescriptionsDidChangeForActivity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "activityUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;

  if (BSEqualStrings())
  {
    if (-[FCUIActivityPickerViewController _updateHeaderOrFooterIfNecessary](self, "_updateHeaderOrFooterIfNecessary"))
    {
      -[FCUIActivityPickerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
      -[FCUIActivityPickerViewController viewIfLoaded](self, "viewIfLoaded");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLayout");

      -[UIViewController fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation](self, "fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation");
    }
  }
}

+ (void)_markOnboardingEncountered
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("FCUIActivityPickerViewControllerOnboardingEncountered"));

}

+ (void)_markOnboardingComplete
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("FCUIActivityPickerViewControllerOnboardingComplete"));

}

- (id)_activityListView
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[FCUIActivityPickerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)_updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  id v6;

  if (-[FCUIActivityPickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityPickerViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    objc_msgSend(v6, "sizeThatFits:", v4, v5);
    -[FCUIActivityPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
}

- (void)_updateSelectedStateOfActivityControl:(id)a3 activeActivity:(id)a4 lifetimeOfActiveActivity:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "activityUniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    objc_msgSend(v8, "activityUniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    objc_msgSend(v7, "setSelected:", v12);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "menuItemElements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
          if ((v12 & 1) != 0)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "representedObjectIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "lifetimeIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setSelected:", objc_msgSend(v19, "isEqualToString:", v20));

          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "setSelected:", 0);
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    v8 = v24;
    if ((objc_msgSend(v7, "isPlaceholder") & 1) == 0)
    {
      if (((objc_msgSend(v7, "showsPersistentDetailText") ^ 1 | v12) & 1) != 0)
      {
        if (!(_DWORD)v12)
        {
          objc_msgSend(v7, "setDetailText:", 0);
          goto LABEL_19;
        }
        -[FCActivityManager localizedTerminationDescriptionForActiveActivity](self->_activityManager, "localizedTerminationDescriptionForActiveActivity");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "activityDetailText");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (void *)v21;
      objc_msgSend(v7, "setDetailText:", v21, self);

    }
  }
LABEL_19:

}

- (void)_updateSelectedStateOfActivityViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[FCActivityManager activeActivity](self->_activityManager, "activeActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCActivityManager lifetimeOfActivity:](self->_activityManager, "lifetimeOfActivity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FCUIActivityPickerViewController _activityListView](self, "_activityListView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = objc_opt_class();
        v13 = v11;
        if (v12)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        v15 = v14;

        -[FCUIActivityPickerViewController _updateSelectedStateOfActivityControl:activeActivity:lifetimeOfActiveActivity:](self, "_updateSelectedStateOfActivityControl:activeActivity:lifetimeOfActiveActivity:", v15, v3, v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[UIViewController fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation](self, "fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation");
}

- (void)_presentActivityEditUI:(id)a3
{
  id v4;
  _TtC7FocusUI26ActivityEditViewController *v5;
  void *v6;
  _TtC7FocusUI26ActivityEditViewController *v7;
  uint64_t v8;
  void *v9;
  _TtC7FocusUI26ActivityEditViewController *v10;
  id v11;
  _TtC7FocusUI26ActivityEditViewController *editViewController;
  _TtC7FocusUI26ActivityEditViewController *v13;
  _QWORD v14[4];
  _TtC7FocusUI26ActivityEditViewController *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  v5 = [_TtC7FocusUI26ActivityEditViewController alloc];
  objc_msgSend(v4, "activityDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ActivityEditViewController initWithActivityDescription:](v5, "initWithActivityDescription:", v6);

  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke;
  v18[3] = &unk_24D20A970;
  objc_copyWeak(&v19, &location);
  -[ActivityEditViewController setWillDisappearBlock:](v7, "setWillDisappearBlock:", v18);
  -[FCUIActivityPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  -[FCUIActivityPickerViewController transitionCoordinator](self, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke_3;
  v14[3] = &unk_24D20A998;
  objc_copyWeak(&v17, &location);
  v10 = v7;
  v15 = v10;
  v11 = v4;
  v16 = v11;
  objc_msgSend(v9, "animateAlongsideTransition:completion:", v14, 0);

  editViewController = self->_editViewController;
  self->_editViewController = v10;
  v13 = v10;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "transitionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke_2;
  v3[3] = &unk_24D20A948;
  v3[4] = WeakRetained;
  objc_msgSend(v2, "animateAlongsideTransition:completion:", v3, 0);

}

uint64_t __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_activityListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endIsolation");

  return objc_msgSend(*(id *)(a1 + 32), "_setEditViewController:", 0);
}

void __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_activityListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visibleHeight");
  objc_msgSend(v5, "convertPoint:toView:", v6, 0.0, v7);
  objc_msgSend(v6, "isolateActivityView:withInset:", *(_QWORD *)(a1 + 40), 0.0, 0.0, v8, 0.0);

}

- (void)_openURL:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__FCUIActivityPickerViewController__openURL___block_invoke;
  block[3] = &unk_24D20A9C0;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __45__FCUIActivityPickerViewController__openURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  v5 = *MEMORY[0x24BE38320];
  v14[0] = *MEMORY[0x24BE38310];
  v14[1] = v5;
  v15[0] = MEMORY[0x24BDBD1C8];
  v15[1] = MEMORY[0x24BDBD1C8];
  v14[2] = *MEMORY[0x24BE382E0];
  v15[2] = CFSTR("FCUIAppLaunchOriginActivityPicker");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v4, v6, &v11);
  v8 = v11;

  v9 = FCUILogSelection;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *v3;
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_214772000, v9, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_ERROR))
  {
    __45__FCUIActivityPickerViewController__openURL___block_invoke_cold_1();
  }

}

- (void)_openEditUI:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
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

  objc_msgSend(v7, "activitySettingsURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCUIActivityPickerViewController _openURL:](self, "_openURL:", v8);
}

- (void)_openSetupUI:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
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

  if (v7)
    objc_msgSend(v7, "activitySetupURL");
  else
    objc_msgSend(MEMORY[0x24BDBCF48], "dnd_defaultSetupURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityPickerViewController _openURL:](self, "_openURL:", v8);

}

- (void)_dismissHeader
{
  objc_msgSend((id)objc_opt_class(), "_markOnboardingComplete");
}

- (BOOL)_isConfiguringEducationCard
{
  FCUIActivityPickerViewController *v2;
  BOOL isConfiguringEducationCard;

  v2 = self;
  objc_sync_enter(v2);
  isConfiguringEducationCard = v2->_isConfiguringEducationCard;
  objc_sync_exit(v2);

  return isConfiguringEducationCard;
}

- (void)_setConfiguringEducationCard:(BOOL)a3
{
  FCUIActivityPickerViewController *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isConfiguringEducationCard = a3;
  objc_sync_exit(obj);

}

- (void)_configureEducationCardIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  NSObject *SerialWithQoS;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id location;
  _QWORD v22[5];
  id v23;

  -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if (!-[FCUIActivityPickerViewController _isConfiguringEducationCard](self, "_isConfiguringEducationCard"))
  {
    -[FCUIActivityPickerViewController _setConfiguringEducationCard:](self, "_setConfiguringEducationCard:", 1);
    +[FCUIActivityPickerEducationCardView defaultEducationCardViewActivityIdentifiers](FCUIActivityPickerEducationCardView, "defaultEducationCardViewActivityIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCUIActivityPickerEducationCardView defaultEducationCardViewFallbackBaubleDescriptions](FCUIActivityPickerEducationCardView, "defaultEducationCardViewFallbackBaubleDescriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy_;
    v22[4] = __Block_byref_object_dispose_;
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("%@.educationCardBaubleDescriptions"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();

    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke;
    block[3] = &unk_24D20AA78;
    objc_copyWeak(&v20, &location);
    v16 = v5;
    v17 = v6;
    v19 = v22;
    v18 = v3;
    v13 = v6;
    v14 = v5;
    dispatch_async(SerialWithQoS, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    _Block_object_dispose(v22, 8);
  }

}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  unint64_t v3;
  void *v4;
  void *v5;
  FCUIActivityBaubleDescription *v6;
  FCUIActivityBaubleDescription *v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  __int128 v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[122], "activityWithIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = -[FCUIActivityBaubleDescription initWithActivityDescription:]([FCUIActivityBaubleDescription alloc], "initWithActivityDescription:", v5);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v3);
        v6 = (FCUIActivityBaubleDescription *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
      if (v6)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v6);

      ++v3;
    }
    while (v3 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_2;
  block[3] = &unk_24D20AA50;
  block[4] = WeakRetained;
  v9 = *(_OWORD *)(a1 + 48);
  v8 = (id)v9;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if ((objc_msgSend((id)objc_opt_class(), "isOnboardingComplete") & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v3 = (void *)MEMORY[0x24BEBD388];
    v4 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_3;
    v11[3] = &unk_24D20A9E8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v3, "actionWithHandler:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCUIActivityPickerEducationCardView defaultEducationCardViewWithProminentViewBaubleDescriptions:dismissAction:](FCUIActivityPickerEducationCardView, "defaultEducationCardViewWithProminentViewBaubleDescriptions:dismissAction:", v2, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD388], "actionWithHandler:", &__block_literal_global_41);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDefaultAction:", v7);

    objc_msgSend(*(id *)(a1 + 40), "setHeaderView:", v6);
    objc_msgSend(*(id *)(a1 + 32), "_setConfiguringEducationCard:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentSize");
    v8 = (void *)MEMORY[0x24BEBDB00];
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_43;
    v9[3] = &unk_24D20A9C0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "fcui_animateWithDefaultParameters:completion:", v9, 0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
    __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_3_cold_1();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissHeader");

}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_40(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
    __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_40_cold_1();

}

uint64_t __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_updateHeaderOrFooterIfNecessary
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  FCUIAddActivityFooterView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCUIAddActivityFooterView *v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;
  _QWORD block[5];

  if (!-[FCUIActivityPickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = 0;
    goto LABEL_8;
  }
  -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isOnboardingComplete") & 1) != 0)
    {
      objc_msgSend(v3, "setHeaderView:", 0);
      objc_msgSend(v3, "activityViews");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");
      v6 = -[FCActivityManager maximumActivityCountForUserInterface](self->_activityManager, "maximumActivityCountForUserInterface");

      objc_msgSend(v3, "footerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v5 < v6)
      {

        if (!v8)
        {
          objc_initWeak(&location, self);
          objc_initWeak(&from, v3);
          v9 = [FCUIAddActivityFooterView alloc];
          v10 = (void *)MEMORY[0x24BEBD388];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_NEW_FOCUS"), &stru_24D20B520, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = __68__FCUIActivityPickerViewController__updateHeaderOrFooterIfNecessary__block_invoke_2;
          v17[3] = &unk_24D20AAA0;
          objc_copyWeak(&v18, &location);
          objc_copyWeak(&v19, &from);
          objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v12, 0, CFSTR("newFocus"), v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[FCUIAddActivityFooterView initWithAction:](v9, "initWithAction:", v13);
          objc_msgSend(v3, "setFooterView:", v14);

          objc_destroyWeak(&v19);
          objc_destroyWeak(&v18);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
LABEL_14:
          v15 = 1;
          goto LABEL_9;
        }
        goto LABEL_8;
      }

      if (!v8)
        goto LABEL_8;
    }
    else
    {
      if (!-[FCActivityManager isDefaultConfiguration](self->_activityManager, "isDefaultConfiguration"))
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __68__FCUIActivityPickerViewController__updateHeaderOrFooterIfNecessary__block_invoke;
        block[3] = &unk_24D20A9C0;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        goto LABEL_8;
      }
      -[FCUIActivityPickerViewController _configureEducationCardIfNecessary](self, "_configureEducationCardIfNecessary");
    }
    objc_msgSend(v3, "setFooterView:", 0);
    goto LABEL_14;
  }
LABEL_8:
  v15 = 0;
LABEL_9:

  return v15;
}

uint64_t __68__FCUIActivityPickerViewController__updateHeaderOrFooterIfNecessary__block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "_markOnboardingComplete");
}

void __68__FCUIActivityPickerViewController__updateHeaderOrFooterIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
  {
    objc_msgSend(v2, "footerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_openSetupUI:", v3);

  }
}

- (void)_configureActivityView:(id)a3 withLifetimesDescriptionsForActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id obj;
  _QWORD v30[4];
  id v31;
  FCUIActivityPickerViewController *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isPlaceholder") & 1) == 0)
  {
    objc_msgSend(v5, "activityUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = v5;
        v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v27 = v6;
        objc_msgSend(v6, "activityLifetimeDescriptions");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v35 != v14)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v16, "lifetimeIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)MEMORY[0x24BEBD388];
              objc_msgSend(v16, "lifetimeName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v30[0] = MEMORY[0x24BDAC760];
              v30[1] = 3221225472;
              v30[2] = __96__FCUIActivityPickerViewController__configureActivityView_withLifetimesDescriptionsForActivity___block_invoke;
              v30[3] = &unk_24D20AAC8;
              v31 = v10;
              v32 = self;
              v33 = v16;
              objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v19, 0, v17, v30);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "lifetimeMetadata");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setDiscoverabilityTitle:", v21);

              objc_msgSend(v11, "addObject:", v20);
            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v13);
        }

        if (objc_msgSend(v11, "count"))
        {
          v5 = v10;
          objc_msgSend(v10, "setMenuItemActions:", v11);
          -[FCActivityManager activeActivity](self->_activityManager, "activeActivity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCActivityManager lifetimeOfActivity:](self->_activityManager, "lifetimeOfActivity:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCUIActivityPickerViewController _updateSelectedStateOfActivityControl:activeActivity:lifetimeOfActiveActivity:](self, "_updateSelectedStateOfActivityControl:activeActivity:lifetimeOfActiveActivity:", v5, v22, v23);

          v6 = v27;
        }
        else
        {
          v6 = v27;
          objc_msgSend(v27, "activityLifetimesAlternativeDescription");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "length");

          v5 = v10;
          if (!v25)
          {
LABEL_17:
            -[FCUIActivityPickerViewController view](self, "view");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setNeedsLayout");

            -[UIViewController fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation](self, "fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation");
            goto LABEL_18;
          }
          objc_msgSend(v27, "activityLifetimesAlternativeDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setMenuAlternativeDescription:", v22);
        }

        goto LABEL_17;
      }
    }
  }
LABEL_18:

}

void __96__FCUIActivityPickerViewController__configureActivityView_withLifetimesDescriptionsForActivity___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
    __96__FCUIActivityPickerViewController__configureActivityView_withLifetimesDescriptionsForActivity___block_invoke_cold_1();
  v22 = v3;
  objc_msgSend(a1[5], "_activityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "_activityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lifetimeOfActivity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = a1[4];
  v9 = a1[6];
  objc_msgSend(v5, "activityUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  if (objc_msgSend(v10, "isEqual:", v11))
  {
    objc_msgSend(v7, "lifetimeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lifetimeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13) ^ 1;

  }
  else
  {
    v14 = 1;
  }

  objc_msgSend(a1[5], "_activityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v14)
    v16 = v8;
  else
    v16 = 0;
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v22, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("Activity control menu item tapped: %@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActivity:active:withLifetime:reason:", v16, v14, v9, v19);

  objc_msgSend(a1[5], "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNeedsLayout");

  objc_msgSend(a1[5], "fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation");
}

- (void)_configureActivityListViewWithAvailableActivities:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  FCUIActivityControl *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  id v26;
  FCUIActivityPickerViewController *val;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id from;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id location;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  val = self;
  -[FCUIActivityPickerViewController _activityListView](self, "_activityListView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAdjustsFontForContentSizeCategory:", 1);
  objc_initWeak(&location, self);
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v23, "activityViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v5, "mutableCopy");

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v6)
  {
    v25 = *(_QWORD *)v48;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v28 = v6;
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v48 != v25)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy_;
        v45 = __Block_byref_object_dispose_;
        v46 = 0;
        v40[0] = v7;
        v40[1] = 3221225472;
        v40[2] = __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke;
        v40[3] = &unk_24D20AAF0;
        v40[4] = v9;
        v40[5] = &v41;
        objc_msgSend(v29, "enumerateObjectsUsingBlock:", v40);
        v10 = (void *)v42[5];
        if (v10)
        {
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

        }
        else
        {
          v14 = -[FCUIActivityControl initWithActivityDescription:style:]([FCUIActivityControl alloc], "initWithActivityDescription:style:", v9, 1);
        }
        if (v42[5])
        {
          -[FCUIActivityControl setActivityDescription:](v14, "setActivityDescription:", v9);
          objc_msgSend(v29, "removeObject:", v42[5]);
        }
        objc_initWeak(&from, v14);
        v15 = (void *)MEMORY[0x24BEBD388];
        v36[0] = v7;
        v36[1] = 3221225472;
        v36[2] = __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_2;
        v36[3] = &unk_24D20AB18;
        objc_copyWeak(&v37, &from);
        objc_copyWeak(&v38, &location);
        v36[4] = v9;
        objc_msgSend(v15, "actionWithHandler:", v36);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCUIActivityControl setDefaultAction:](v14, "setDefaultAction:", v16);
        if ((objc_msgSend(v9, "isPlaceholder") & 1) == 0)
        {
          v17 = (void *)MEMORY[0x24BEBD388];
          v33[0] = v7;
          v33[1] = 3221225472;
          v33[2] = __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_61;
          v33[3] = &unk_24D20AAA0;
          objc_copyWeak(&v34, &from);
          objc_copyWeak(&v35, &location);
          objc_msgSend(v17, "actionWithHandler:", v33);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCUIActivityControl setOptionsAction:](v14, "setOptionsAction:", v18);
          -[FCUIActivityPickerViewController _configureActivityView:withLifetimesDescriptionsForActivity:](val, "_configureActivityView:withLifetimesDescriptionsForActivity:", v14, v9);
          v19 = (void *)MEMORY[0x24BEBD388];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_SETTINGS"), &stru_24D20B520, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v7;
          v30[1] = 3221225472;
          v30[2] = __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_66;
          v30[3] = &unk_24D20AAA0;
          objc_copyWeak(&v31, &from);
          objc_copyWeak(&v32, &location);
          objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v21, 0, 0, v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCUIActivityControl setFooterAction:](v14, "setFooterAction:", v22);

          objc_destroyWeak(&v32);
          objc_destroyWeak(&v31);

          objc_destroyWeak(&v35);
          objc_destroyWeak(&v34);
        }
        objc_msgSend(v26, "addObject:", v14);

        objc_destroyWeak(&v38);
        objc_destroyWeak(&v37);
        objc_destroyWeak(&from);

        _Block_object_dispose(&v41, 8);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v6);
  }

  objc_msgSend(v23, "setActivityViews:", v26);
  -[FCUIActivityPickerViewController _updateHeaderOrFooterIfNecessary](val, "_updateHeaderOrFooterIfNecessary");
  -[FCUIActivityPickerViewController _updateSelectedStateOfActivityViews](val, "_updateSelectedStateOfActivityViews");
  -[FCUIActivityPickerViewController _updatePreferredContentSize](val, "_updatePreferredContentSize");

  objc_destroyWeak(&location);
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "activityUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BSEqualObjects();

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_2(id *a1)
{
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
  {
    __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_2_cold_1();
    if (!WeakRetained)
      goto LABEL_11;
  }
  else if (!WeakRetained)
  {
    goto LABEL_11;
  }
  if ((objc_msgSend(WeakRetained, "isExpanded") & 1) == 0)
  {
    v3 = objc_msgSend(WeakRetained, "isPlaceholder");
    v4 = objc_loadWeakRetained(a1 + 6);
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v4, "_openSetupUI:", WeakRetained);
    }
    else
    {
      objc_msgSend(v4, "_activityManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activeActivity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "activityUniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activityUniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);
      v11 = v10;
      v12 = v10 ^ 1u;

      objc_msgSend(v5, "_activityManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v11 & 1) != 0)
        v14 = 0;
      else
        v14 = a1[4];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Activity control tapped: %@"), WeakRetained);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActivity:active:reason:", v14, v12, v15);

    }
  }
LABEL_11:

}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_61(uint64_t a1)
{
  id WeakRetained;
  id v3;
  _FCCCAnimator *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
  {
    __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_61_cold_1();
    if (!WeakRetained)
      goto LABEL_7;
  }
  else if (!WeakRetained)
  {
    goto LABEL_7;
  }
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_alloc_init(_FCCCAnimator);
  v5 = objc_alloc_init(MEMORY[0x24BEBDD80]);
  objc_msgSend(v3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContainerView:", v6);

  objc_msgSend(v5, "_setAnimator:", v4);
  objc_msgSend(v5, "_transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_activityListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "isExpanded"))
    v9 = 0;
  else
    v9 = WeakRetained;
  objc_msgSend(v8, "setExpandedActivityView:withTransitionCoordinator:", v9, v7);

  -[_FCCCAnimator animateTransition:](v4, "animateTransition:", v5);
  objc_msgSend(v3, "_updatePreferredContentSize");

LABEL_7:
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_66(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
  {
    __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_66_cold_1();
    if (!WeakRetained)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (WeakRetained)
  {
LABEL_3:
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v3, "_openEditUI:", WeakRetained);

  }
LABEL_4:

}

- (BOOL)isFooterPinnedToBottom
{
  return self->_footerPinnedToBottom;
}

- (void)setFooterPinnedToBottom:(BOOL)a3
{
  self->_footerPinnedToBottom = a3;
}

- (FCActivityManager)_activityManager
{
  return self->_activityManager;
}

- (void)_setActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_activityManager, a3);
}

- (_TtC7FocusUI26ActivityEditViewController)_editViewController
{
  return self->_editViewController;
}

- (void)_setEditViewController:(id)a3
{
  objc_storeStrong((id *)&self->_editViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editViewController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

void __45__FCUIActivityPickerViewController__openURL___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_214772000, v0, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214772000, v0, v1, "Activity picker education view dismiss action triggered: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214772000, v0, v1, "Activity picker education view default action triggered: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __96__FCUIActivityPickerViewController__configureActivityView_withLifetimesDescriptionsForActivity___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_214772000, v0, OS_LOG_TYPE_DEBUG, "Activity control menu action triggered: activityView: %{public}@; menuAction: %{public}@",
    v1,
    0x16u);
  OUTLINED_FUNCTION_1();
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214772000, v0, v1, "Activity control tapped: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_61_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214772000, v0, v1, "Activity control options action triggered: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_66_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214772000, v0, v1, "Activity view footer action triggered: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
