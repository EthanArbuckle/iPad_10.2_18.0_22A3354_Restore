@implementation DMCRMConfigurationsViewController

- (DMCRMConfigurationsViewController)initWithRMConfigurationsSpecifierProvider:(id)a3 scope:(int64_t)a4
{
  id v6;
  DMCRMConfigurationsViewController *v7;
  int v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMCRMConfigurationsViewController;
  v7 = -[DMCProfileTableViewController initWithStyle:](&v18, sel_initWithStyle_, 2);
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad");
    v9 = CFSTR("DMC_USER_CONFIGURATIONS_TITLE");
    if (a4 == 1)
      v9 = CFSTR("DMC_DEVICE_CONFIGURATIONS_TITLE");
    if (v8)
      v10 = (__CFString *)v9;
    else
      v10 = CFSTR("DMC_CONFIGURATIONS_TITLE");
    DMCEnrollmentLocalizedString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCRMConfigurationsViewController setTitle:](v7, "setTitle:", v11);

    v17.receiver = v7;
    v17.super_class = (Class)DMCRMConfigurationsViewController;
    -[DMCProfileTableViewController updateExtendedLayoutIncludesOpaqueBars](&v17, sel_updateExtendedLayoutIncludesOpaqueBars);
    v16.receiver = v7;
    v16.super_class = (Class)DMCRMConfigurationsViewController;
    -[DMCProfileTableViewController reloadTableOnContentSizeCategoryChange](&v16, sel_reloadTableOnContentSizeCategoryChange);
    -[DMCRMConfigurationsViewController setRmSpecifierProvider:](v7, "setRmSpecifierProvider:", v6);
    -[DMCRMConfigurationsViewController rmSpecifierProvider](v7, "rmSpecifierProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCRMConfigurationsViewController tableView](v7, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerSpecifierBridgeForTableView:", v13);

    -[DMCRMConfigurationsViewController _setSections](v7, "_setSections");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__rmConfigsChanged_, CFSTR("RMConfigurationsSpecifiersDidChangeNotification"), 0);

  }
  return v7;
}

- (void)_setSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[DMCRMConfigurationsViewController rmSpecifierProvider](self, "rmSpecifierProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCRMConfigurationsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableSectionCellsForSpecifiersInTableView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCRMConfigurationsViewController setRmTableSectionCells:](self, "setRmTableSectionCells:", v5);

  -[DMCRMConfigurationsViewController rmSpecifierProvider](self, "rmSpecifierProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCRMConfigurationsViewController setRmSectionTitles:](self, "setRmSectionTitles:", v6);

}

- (void)_rmConfigsChanged:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__DMCRMConfigurationsViewController__rmConfigsChanged___block_invoke;
  v3[3] = &unk_24D52E7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __55__DMCRMConfigurationsViewController__rmConfigsChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_setSections");
    objc_msgSend(v3, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[DMCRMConfigurationsViewController rmTableSectionCells](self, "rmTableSectionCells", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[DMCRMConfigurationsViewController rmTableSectionCells](self, "rmTableSectionCells", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[DMCRMConfigurationsViewController rmSectionTitles](self, "rmSectionTitles", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[DMCRMConfigurationsViewController rmTableSectionCells](self, "rmTableSectionCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[DMCRMConfigurationsViewController rmTableSectionCells](self, "rmTableSectionCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[DMCProfileTableViewController presentViewController:](self, "presentViewController:", v8);
  else
    NSLog(CFSTR("DMCRMConfigurationsViewController could not find a detail view controller for RM configuration at path: %@"), v9);

}

- (RMConfigurationsSpecifierProvider)rmSpecifierProvider
{
  return self->_rmSpecifierProvider;
}

- (void)setRmSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_rmSpecifierProvider, a3);
}

- (NSArray)rmTableSectionCells
{
  return self->_rmTableSectionCells;
}

- (void)setRmTableSectionCells:(id)a3
{
  objc_storeStrong((id *)&self->_rmTableSectionCells, a3);
}

- (NSArray)rmSectionTitles
{
  return self->_rmSectionTitles;
}

- (void)setRmSectionTitles:(id)a3
{
  objc_storeStrong((id *)&self->_rmSectionTitles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmSectionTitles, 0);
  objc_storeStrong((id *)&self->_rmTableSectionCells, 0);
  objc_storeStrong((id *)&self->_rmSpecifierProvider, 0);
}

@end
