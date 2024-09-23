@implementation WDWatchStoredDataViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDWatchStoredDataViewController;
  -[WDStoredDataByCategoryViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WDWatchStoredDataViewController updateTableHeaderViewForUnpairedWatch](self, "updateTableHeaderViewForUnpairedWatch");
}

- (void)addUnpairedWatchHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
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
  UILabel *messageLabel;
  void *v31;
  id v32;
  CGRect v33;

  -[WDStoredDataByCategoryViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 != 3)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v7, "setTextAlignment:", 1);
    WDBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SOURCES_WATCH_UNPAIRED"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v32 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    -[WDSourceStoredDataViewController source](self, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v32, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v13);

    v14 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "addSubview:", v7);
    -[UILabel topAnchor](v7, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 30.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[UILabel bottomAnchor](v7, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[UILabel leadingAnchor](v7, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 40.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[UILabel trailingAnchor](v7, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -40.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    objc_msgSend(v14, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDWatchStoredDataViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    objc_msgSend(v27, "constraintEqualToConstant:", CGRectGetWidth(v33));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    messageLabel = self->_messageLabel;
    self->_messageLabel = v7;

    -[WDWatchStoredDataViewController _updateFont](self, "_updateFont");
    objc_msgSend(v14, "layoutIfNeeded");
    -[WDWatchStoredDataViewController tableView](self, "tableView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTableHeaderView:", v14);

  }
}

- (void)updateTableHeaderViewForUnpairedWatch
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDD3D80]);
  -[WDStoredDataByCategoryViewController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithHealthStore:", v5);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__WDWatchStoredDataViewController_updateTableHeaderViewForUnpairedWatch__block_invoke;
  v7[3] = &unk_24D38D0F0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "fetchNanoSyncPairedDevicesWithCompletion:", v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __72__WDWatchStoredDataViewController_updateTableHeaderViewForUnpairedWatch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__WDWatchStoredDataViewController_updateTableHeaderViewForUnpairedWatch__block_invoke_2;
  v5[3] = &unk_24D38D0C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __72__WDWatchStoredDataViewController_updateTableHeaderViewForUnpairedWatch__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handlePairedDevicesSnapshot:", *(_QWORD *)(a1 + 32));

}

- (void)handlePairedDevicesSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[WDSourceStoredDataViewController source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceInfoForSourceBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!-[WDWatchStoredDataViewController watchPaired](self, "watchPaired"))
    {
      -[WDWatchStoredDataViewController setWatchPaired:](self, "setWatchPaired:", 1);
      -[WDWatchStoredDataViewController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTableHeaderView:", 0);

      -[WDWatchStoredDataViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginUpdates");

      -[WDWatchStoredDataViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSections:withRowAnimation:", v11, 3);

      -[WDWatchStoredDataViewController tableView](self, "tableView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endUpdates");

    }
  }
  else
  {
    -[WDWatchStoredDataViewController addUnpairedWatchHeaderView](self, "addUnpairedWatchHeaderView");
  }
}

- (void)_updateFont
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", 20.0);
  objc_msgSend(v3, "systemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_messageLabel, "setFont:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDWatchStoredDataViewController;
  -[WDStoredDataByCategoryViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDWatchStoredDataViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[WDWatchStoredDataViewController _updateFont](self, "_updateFont");
      -[WDWatchStoredDataViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginUpdates");

      -[WDWatchStoredDataViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tableHeaderView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsLayout");

      -[WDWatchStoredDataViewController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endUpdates");

    }
  }

}

- (BOOL)_shouldDisplayPrivacySection
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[WDStoredDataByCategoryViewController profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type") != 3;

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  char *v5;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  if (-[WDWatchStoredDataViewController watchPaired](self, "watchPaired")
    && -[WDWatchStoredDataViewController _shouldDisplayPrivacySection](self, "_shouldDisplayPrivacySection"))
  {
    v7.receiver = self;
    v7.super_class = (Class)WDWatchStoredDataViewController;
    v5 = (char *)-[WDStoredDataByCategoryViewController numberOfSectionsInTableView:](&v7, sel_numberOfSectionsInTableView_, v4)+ 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WDWatchStoredDataViewController;
    v5 = -[WDStoredDataByCategoryViewController numberOfSectionsInTableView:](&v8, sel_numberOfSectionsInTableView_, v4);
  }

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  id v7;
  int64_t v8;
  objc_super v10;
  objc_super v11;

  v6 = a3;
  if (-[WDWatchStoredDataViewController watchPaired](self, "watchPaired")
    && -[WDWatchStoredDataViewController _shouldDisplayPrivacySection](self, "_shouldDisplayPrivacySection"))
  {
    if (!a4)
    {
      v8 = 1;
      goto LABEL_7;
    }
    v7 = -[WDStoredDataByCategoryViewController tableView:numberOfRowsInSection:](&v10, sel_tableView_numberOfRowsInSection_, v6, a4 - 1, self, WDWatchStoredDataViewController, v11.receiver, v11.super_class);
  }
  else
  {
    v7 = -[WDStoredDataByCategoryViewController tableView:numberOfRowsInSection:](&v11, sel_tableView_numberOfRowsInSection_, v6, a4, v10.receiver, v10.super_class, self, WDWatchStoredDataViewController);
  }
  v8 = (int64_t)v7;
LABEL_7:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (-[WDWatchStoredDataViewController watchPaired](self, "watchPaired")
    && -[WDWatchStoredDataViewController _shouldDisplayPrivacySection](self, "_shouldDisplayPrivacySection"))
  {
    if (objc_msgSend(v7, "section"))
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19.receiver = self;
      v19.super_class = (Class)WDWatchStoredDataViewController;
      -[WDStoredDataByCategoryViewController tableView:cellForRowAtIndexPath:](&v19, sel_tableView_cellForRowAtIndexPath_, v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WDWatchStoredDataViewControllerPrivacyCellIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDWatchStoredDataViewControllerPrivacyCellIdentifier"));
      WDBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PRIVACY_SETTINGS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

      -[WDWatchStoredDataViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTextColor:", v15);

      -[WDStoredDataByCategoryViewController bodyFont](self, "bodyFont");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFont:", v17);

    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)WDWatchStoredDataViewController;
    -[WDStoredDataByCategoryViewController tableView:cellForRowAtIndexPath:](&v20, sel_tableView_cellForRowAtIndexPath_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  objc_super v8;
  objc_super v9;

  v6 = a3;
  if (!-[WDWatchStoredDataViewController watchPaired](self, "watchPaired")
    || !-[WDWatchStoredDataViewController _shouldDisplayPrivacySection](self, "_shouldDisplayPrivacySection"))
  {
    -[WDStoredDataByCategoryViewController tableView:titleForHeaderInSection:](&v9, sel_tableView_titleForHeaderInSection_, v6, a4, v8.receiver, v8.super_class, self, WDWatchStoredDataViewController);
    goto LABEL_6;
  }
  if (a4)
  {
    -[WDStoredDataByCategoryViewController tableView:titleForHeaderInSection:](&v8, sel_tableView_titleForHeaderInSection_, v6, a4 - 1, self, WDWatchStoredDataViewController, v9.receiver, v9.super_class);
LABEL_6:
    a4 = objc_claimAutoreleasedReturnValue();
  }

  return (id)a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("WDWatchStoredDataViewControllerPrivacyCellIdentifier"));

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:root=PRIVACY_ID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openSensitiveURL:withOptions:", v12, 0);

    objc_msgSend(v8, "setSelected:", 0);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WDWatchStoredDataViewController;
    -[WDStoredDataByCategoryViewController tableView:didSelectRowAtIndexPath:](&v13, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

- (BOOL)watchPaired
{
  return self->_watchPaired;
}

- (void)setWatchPaired:(BOOL)a3
{
  self->_watchPaired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end
