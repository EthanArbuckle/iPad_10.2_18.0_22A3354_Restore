@implementation WDSourcesViewController

+ (id)tableViewSectionClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WDSourcesViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WDSourcesViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  HKSourceListDataSource *appsDataSource;
  id v19;
  void *v20;
  uint64_t v21;
  HKSourceListDataSource *devicesDataSource;
  objc_super v24;

  v4 = a4;
  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WDSourcesViewController;
  v7 = -[WDHealthTableViewController initWithProfile:usingInsetStyling:](&v24, sel_initWithProfile_usingInsetStyling_, v6, v4);
  if (v7)
  {
    WDBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SOURCES"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSourcesViewController setTitle:](v7, "setTitle:", v9);

    v10 = (void *)MEMORY[0x24BDF6AC8];
    WDBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("sources"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_imageThatSuppressesAccessibilityHairlineThickening");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSourcesViewController tabBarItem](v7, "tabBarItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

    v15 = objc_alloc(MEMORY[0x24BE4A898]);
    objc_msgSend(v6, "healthStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithHealthStore:", v16);
    appsDataSource = v7->_appsDataSource;
    v7->_appsDataSource = (HKSourceListDataSource *)v17;

    -[HKSourceListDataSource setDeliverUpdates:](v7->_appsDataSource, "setDeliverUpdates:", 1);
    -[HKSourceListDataSource setShouldFetchAppIcons:](v7->_appsDataSource, "setShouldFetchAppIcons:", 0);
    -[HKSourceListDataSource setShouldFetchPurposeStrings:](v7->_appsDataSource, "setShouldFetchPurposeStrings:", 1);
    -[HKSourceListDataSource setShouldIncludeSpecialSources:](v7->_appsDataSource, "setShouldIncludeSpecialSources:", 1);
    v19 = objc_alloc(MEMORY[0x24BE4A898]);
    objc_msgSend(v6, "healthStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithHealthStore:", v20);
    devicesDataSource = v7->_devicesDataSource;
    v7->_devicesDataSource = (HKSourceListDataSource *)v21;

    -[HKSourceListDataSource setDeliverUpdates:](v7->_devicesDataSource, "setDeliverUpdates:", 1);
    -[HKSourceListDataSource setShouldIncludeSpecialSources:](v7->_devicesDataSource, "setShouldIncludeSpecialSources:", 1);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int *v12;
  NSString *restorationSourceBundleIdentifier;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)WDSourcesViewController;
  -[WDTableViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[WDSourcesViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[WDSpinnerTableViewCell defaultReuseIdentifier](WDSpinnerTableViewCell, "defaultReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WDTableViewController tableSections](self, "tableSections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        -[WDTableViewController tableSections](self, "tableSections");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setShouldHideHeader:", objc_msgSend(v11, "count") == 1);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = &OBJC_IVAR___WDSourcesViewController__devicesDataSource;
        else
          v12 = &OBJC_IVAR___WDSourcesViewController__appsDataSource;
        restorationSourceBundleIdentifier = self->_restorationSourceBundleIdentifier;
        v14 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v12);
        objc_msgSend(v10, "setRestorationSourceBundleIdentifier:", restorationSourceBundleIdentifier);
        objc_msgSend(v10, "setSourceListDataSource:", v14);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDSourcesViewController;
  -[WDTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HKSourceListDataSource fetchSources](self->_appsDataSource, "fetchSources");
  -[HKSourceListDataSource fetchSources](self->_devicesDataSource, "fetchSources");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[WDSourcesViewController _updateActivityForViewDidAppear](self, "_updateActivityForViewDidAppear");
  v7.receiver = self;
  v7.super_class = (Class)WDSourcesViewController;
  -[WDSourcesViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  -[WDSourcesViewController settingsNavigationDonatingDelegate](self, "settingsNavigationDonatingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs://root=HEALTH&path=SOURCES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "donateWithDeepLink:andTitle:", v6, CFSTR("Sources"));

}

- (void)pushViewController:(id)a3
{
  -[WDSourcesViewController pushViewController:animated:](self, "pushViewController:animated:", a3, 1);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

  v8.receiver = self;
  v8.super_class = (Class)WDSourcesViewController;
  -[WDTableViewController pushViewController:animated:](&v8, sel_pushViewController_animated_, v6, v4);

}

- (void)applicationWillEnterForeground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDSourcesViewController;
  -[WDTableViewController applicationWillEnterForeground](&v3, sel_applicationWillEnterForeground);
  -[HKSourceListDataSource fetchSources](self->_appsDataSource, "fetchSources");
  -[HKSourceListDataSource fetchSources](self->_devicesDataSource, "fetchSources");
}

- (id)uniqueUserActivityType
{
  return CFSTR("com.apple.Health.tab");
}

- (void)_updateActivityForViewDidAppear
{
  void *v3;
  void *v4;
  id v5;

  -[WDTableViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userActivityManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[WDSourcesViewController title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeActivityForResponder:activityDictionary:title:keywords:", self, 0, v4, 0);

}

- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate
{
  return (HKHealthSettingsNavigationDonating *)objc_loadWeakRetained((id *)&self->_settingsNavigationDonatingDelegate);
}

- (void)setSettingsNavigationDonatingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_settingsNavigationDonatingDelegate, a3);
}

- (NSString)restorationSourceBundleIdentifier
{
  return self->_restorationSourceBundleIdentifier;
}

- (void)setRestorationSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorationSourceBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_settingsNavigationDonatingDelegate);
  objc_storeStrong((id *)&self->_devicesDataSource, 0);
  objc_storeStrong((id *)&self->_appsDataSource, 0);
}

@end
