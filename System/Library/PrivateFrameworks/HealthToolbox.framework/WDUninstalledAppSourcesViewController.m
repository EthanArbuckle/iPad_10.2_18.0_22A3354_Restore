@implementation WDUninstalledAppSourcesViewController

- (void)dealloc
{
  objc_super v3;

  -[HKSourceListDataSource unregisterObserver:](self->_dataSource, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WDUninstalledAppSourcesViewController;
  -[WDUninstalledAppSourcesViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDUninstalledAppSourcesViewController;
  -[WDUninstalledAppSourcesViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WDUninstalledAppSourcesViewController updateUninstalledSources](self, "updateUninstalledSources");
}

- (void)setDataSource:(id)a3
{
  HKSourceListDataSource *v5;
  HKSourceListDataSource *dataSource;
  HKSourceListDataSource *v7;

  v5 = (HKSourceListDataSource *)a3;
  dataSource = self->_dataSource;
  v7 = v5;
  if (dataSource != v5)
  {
    -[HKSourceListDataSource unregisterObserver:](dataSource, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[HKSourceListDataSource registerObserver:](v7, "registerObserver:", self);
  }

}

- (UIImage)uninistalledAppImage
{
  if (uninistalledAppImage_onceToken != -1)
    dispatch_once(&uninistalledAppImage_onceToken, &__block_literal_global_0);
  return (UIImage *)(id)uninistalledAppImage_uninistalledAppImage;
}

void __61__WDUninstalledAppSourcesViewController_uninistalledAppImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  objc_msgSend(v0, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.health.i.dont.exist"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)uninistalledAppImage_uninistalledAppImage;
  uninistalledAppImage_uninistalledAppImage = v1;

}

- (void)updateUninstalledSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[WDUninstalledAppSourcesViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WDUninstalledAppSourcesViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orderedUninstalledAppSources");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[WDUninstalledAppSourcesViewController profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationContext");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v8 == CFSTR("SettingsPrivacy"))
    {
      -[WDUninstalledAppSourcesViewController dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fetchFilteredSourcesWithAuthorizationRecordsForSources:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDUninstalledAppSourcesViewController setUninstalledSources:](self, "setUninstalledSources:", v10);

    }
    else
    {
      -[WDUninstalledAppSourcesViewController setUninstalledSources:](self, "setUninstalledSources:", v12);
    }
    -[WDUninstalledAppSourcesViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadData");

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WDUninstalledAppSourcesViewController uninstalledSources](self, "uninstalledSources", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  WDSourcesListTableViewCell *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("WDUninstalledAppSourcesViewCell"));
  v7 = (WDSourcesListTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[WDSourcesListTableViewCell initWithStyle:reuseIdentifier:]([WDSourcesListTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("WDUninstalledAppSourcesViewCell"));
    -[WDSourcesListTableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
  }
  -[WDUninstalledAppSourcesViewController uninstalledSources](self, "uninstalledSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell setSourceModel:](v7, "setSourceModel:", v10);

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell textLabel](v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  WDSourceStoredDataViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  -[WDUninstalledAppSourcesViewController uninstalledSources](self, "uninstalledSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") - 1;

  if (v6 <= v8)
  {
    v10 = objc_alloc_init(WDSourceStoredDataViewController);
    -[WDUninstalledAppSourcesViewController uninstalledSources](self, "uninstalledSources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSourceStoredDataViewController setSource:](v10, "setSource:", v13);

    -[WDUninstalledAppSourcesViewController profile](self, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDStoredDataByCategoryViewController setProfile:](v10, "setProfile:", v14);

    -[WDUninstalledAppSourcesViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v10, 1);

  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_FAULT))
      -[WDUninstalledAppSourcesViewController tableView:didSelectRowAtIndexPath:].cold.1(v9, self);
  }

}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (HKSourceListDataSource)dataSource
{
  return self->_dataSource;
}

- (NSArray)uninstalledSources
{
  return self->_uninstalledSources;
}

- (void)setUninstalledSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uninstalledSources, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "uninstalledSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v4, "count");
  _os_log_fault_impl(&dword_215814000, v3, OS_LOG_TYPE_FAULT, "The count of uninstalledSources in WDUninstalledAppSourcesViewController is unexpectedly %lu", (uint8_t *)&v5, 0xCu);

}

@end
