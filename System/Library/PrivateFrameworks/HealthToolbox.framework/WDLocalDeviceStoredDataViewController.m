@implementation WDLocalDeviceStoredDataViewController

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
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDLocalDeviceStoredDataViewController;
  v4 = -[WDStoredDataByCategoryViewController numberOfSectionsInTableView:](&v6, sel_numberOfSectionsInTableView_, a3);
  return (int64_t)v4
       + -[WDLocalDeviceStoredDataViewController _shouldDisplayPrivacySection](self, "_shouldDisplayPrivacySection");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  id v7;
  int64_t v8;
  objc_super v10;
  objc_super v11;

  v6 = a3;
  if (-[WDLocalDeviceStoredDataViewController _shouldDisplayPrivacySection](self, "_shouldDisplayPrivacySection"))
  {
    if (!a4)
    {
      v8 = 1;
      goto LABEL_7;
    }
    v7 = -[WDStoredDataByCategoryViewController tableView:numberOfRowsInSection:](&v10, sel_tableView_numberOfRowsInSection_, v6, a4 - 1, self, WDLocalDeviceStoredDataViewController, v11.receiver, v11.super_class);
  }
  else
  {
    v7 = -[WDStoredDataByCategoryViewController tableView:numberOfRowsInSection:](&v11, sel_tableView_numberOfRowsInSection_, v6, a4, v10.receiver, v10.super_class, self, WDLocalDeviceStoredDataViewController);
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
  if (!-[WDLocalDeviceStoredDataViewController _shouldDisplayPrivacySection](self, "_shouldDisplayPrivacySection"))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDStoredDataByCategoryViewController tableView:cellForRowAtIndexPath:](&v20, sel_tableView_cellForRowAtIndexPath_, v6, v8, v19.receiver, v19.super_class, self, WDLocalDeviceStoredDataViewController);
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "section"))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDStoredDataByCategoryViewController tableView:cellForRowAtIndexPath:](&v19, sel_tableView_cellForRowAtIndexPath_, v6, v8, self, WDLocalDeviceStoredDataViewController, v20.receiver, v20.super_class);
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WDLocalDeviceStoredDataViewControllerCellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDLocalDeviceStoredDataViewControllerCellIdentifier"));
  WDBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PRIVACY_SETTINGS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  -[WDLocalDeviceStoredDataViewController view](self, "view");
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

LABEL_6:
  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  objc_super v8;
  objc_super v9;

  v6 = a3;
  if (!-[WDLocalDeviceStoredDataViewController _shouldDisplayPrivacySection](self, "_shouldDisplayPrivacySection"))
  {
    -[WDStoredDataByCategoryViewController tableView:titleForHeaderInSection:](&v9, sel_tableView_titleForHeaderInSection_, v6, a4, v8.receiver, v8.super_class, self, WDLocalDeviceStoredDataViewController);
    goto LABEL_5;
  }
  if (a4)
  {
    -[WDStoredDataByCategoryViewController tableView:titleForHeaderInSection:](&v8, sel_tableView_titleForHeaderInSection_, v6, a4 - 1, self, WDLocalDeviceStoredDataViewController, v9.receiver, v9.super_class);
LABEL_5:
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
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("WDLocalDeviceStoredDataViewControllerCellIdentifier"));

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Privacy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openSensitiveURL:withOptions:", v12, 0);

    objc_msgSend(v8, "setSelected:", 0);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WDLocalDeviceStoredDataViewController;
    -[WDStoredDataByCategoryViewController tableView:didSelectRowAtIndexPath:](&v13, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

@end
