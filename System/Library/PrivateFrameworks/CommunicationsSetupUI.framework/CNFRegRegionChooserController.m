@implementation CNFRegRegionChooserController

- (CNFRegRegionChooserController)initWithStyle:(int64_t)a3
{
  CNFRegRegionChooserController *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNFRegRegionChooserController;
  v3 = -[CNFRegRegionChooserController initWithStyle:](&v8, sel_initWithStyle_, a3);
  if (v3)
  {
    CommunicationsSetupUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACETIME_LOCALE_COUNTRY_SELECT_LABEL"), &stru_24D077260, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegRegionChooserController setTitle:](v3, "setTitle:", v6);

  }
  return v3;
}

- (CNFRegRegionChooserController)initWithRegionList:(id)a3 selectedRegionID:(id)a4
{
  id v6;
  id v7;
  CNFRegRegionChooserController *v8;
  CNFRegRegionChooserController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[CNFRegRegionChooserController initWithStyle:](self, "initWithStyle:", 0);
  v9 = v8;
  if (v8)
  {
    -[CNFRegRegionChooserController setRegionList:](v8, "setRegionList:", v6);
    -[CNFRegRegionChooserController setSelectedRegionID:](v9, "setSelectedRegionID:", v7);
    if (v6)
    {
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "parentRegion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "label");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNFRegRegionChooserController setTitle:](v9, "setTitle:", v13);

        }
      }
    }
  }

  return v9;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return CNFRegShouldRotateToOrientation(a3);
}

- (void)viewDidUnload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFRegRegionChooserController;
  -[CNFRegRegionChooserController viewDidUnload](&v7, sel_viewDidUnload);
  -[CNFRegRegionChooserController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchResultsUpdater:", 0);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[CNFRegRegionChooserController setSearchController:](self, "setSearchController:", 0);
  -[CNFRegRegionChooserController setFilteredRegionList:](self, "setFilteredRegionList:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  self->_delegate = 0;
  -[UISearchController setDelegate:](self->_searchController, "setDelegate:", 0);
  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", 0);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CNFRegRegionChooserController;
  -[CNFRegRegionChooserController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CNFRegRegionChooserController;
  -[CNFRegRegionChooserController loadView](&v23, sel_loadView);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "styleUsesCustomTableStyle"))
  {
    objc_msgSend(v3, "tableBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "tableBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegRegionChooserController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v5);

      -[CNFRegRegionChooserController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundView:", 0);

    }
    if (objc_msgSend(v3, "styleUsesCustomSeparatorStyle"))
    {
      -[CNFRegRegionChooserController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setDrawsTopShadowInGroupedSections:", 0);

      v9 = objc_msgSend(v3, "tableSeparatorStyle");
      -[CNFRegRegionChooserController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSeparatorStyle:", v9);

      objc_msgSend(v3, "tableSeparatorColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v3, "tableSeparatorColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegRegionChooserController tableView](self, "tableView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSeparatorColor:", v12);

      }
      objc_msgSend(v3, "tableSeparatorTopShadowColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v3, "tableSeparatorTopShadowColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegRegionChooserController tableView](self, "tableView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSeparatorTopShadowColor:", v15);

      }
      objc_msgSend(v3, "tableSeparatorBottomShadowColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v3, "tableSeparatorBottomShadowColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegRegionChooserController tableView](self, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSeparatorBottomShadowColor:", v18);

      }
    }
    objc_msgSend(v3, "tableSectionBorderColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v3, "tableSectionBorderColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegRegionChooserController tableView](self, "tableView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSectionBorderColor:", v21);

    }
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CNFRegRegionChooserController;
  -[CNFRegRegionChooserController viewDidLoad](&v20, sel_viewDidLoad);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
  -[CNFRegRegionChooserController setSearchController:](self, "setSearchController:", v4);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDimsBackgroundDuringPresentation:", 0);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesNavigationBarDuringPresentation:", 0);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSearchResultsUpdater:", self);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutocapitalizationType:", 0);

  v10 = objc_msgSend(v3, "navigationBarStyle");
  -[CNFRegRegionChooserController searchController](self, "searchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBarStyle:", v10);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegRegionChooserController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTableHeaderView:", v16);

  -[CNFRegRegionChooserController searchController](self, "searchController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "searchBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeToFit");

  -[CNFRegRegionChooserController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (-[UISearchController isActive](self->_searchController, "isActive", a3, a4))
    -[CNFRegRegionChooserController filteredRegionList](self, "filteredRegionList");
  else
    -[CNFRegRegionChooserController regionList](self, "regionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
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
  void *v30;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("RegionCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("RegionCell"));
  if (-[UISearchController isActive](self->_searchController, "isActive"))
    -[CNFRegRegionChooserController filteredRegionList](self, "filteredRegionList");
  else
    -[CNFRegRegionChooserController regionList](self, "regionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isLeafNode"))
  {
    objc_msgSend(v9, "regionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegRegionChooserController selectedRegionID](self, "selectedRegionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
      v14 = 3;
    else
      v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v10);

  objc_msgSend(v7, "setAccessoryType:", v14);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "styleUsesCustomTableStyle"))
  {
    objc_msgSend(v16, "tableCellBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v16, "tableCellBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v18);

    }
    objc_msgSend(v16, "tableCellTextLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v16, "tableCellTextLabelColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTextColor:", v20);

    }
    objc_msgSend(v16, "tableCellTextLabelBackgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v16, "tableCellTextLabelBackgroundColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBackgroundColor:", v23);

    }
    objc_msgSend(v16, "tableCellDetailLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v16, "tableCellDetailLabelColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "detailTextLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTextColor:", v26);

    }
    objc_msgSend(v16, "tableCellDetailLabelBackgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v16, "tableCellDetailLabelBackgroundColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "detailTextLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBackgroundColor:", v29);

    }
  }

  return v7;
}

- (void)_drillDownControllersWithArray:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  CNFRegRegionChooserController *v13;
  void *v14;
  void *v15;
  CNFRegRegionChooserController *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "addObject:", self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CNFRegRegionChooserController regionList](self, "regionList", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[CNFRegRegionChooserController selectedRegionID](self, "selectedRegionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "regionWithID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if ((objc_msgSend(v10, "isLeafNode") & 1) == 0)
          {
            v13 = [CNFRegRegionChooserController alloc];
            objc_msgSend(v10, "subRegions");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegRegionChooserController selectedRegionID](self, "selectedRegionID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[CNFRegRegionChooserController initWithRegionList:selectedRegionID:](v13, "initWithRegionList:selectedRegionID:", v14, v15);

            -[CNFRegRegionChooserController setDelegate:](v16, "setDelegate:", self);
            -[CNFRegRegionChooserController parentController](self, "parentController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegRegionChooserController setParentController:](v16, "setParentController:", v17);

            -[CNFRegRegionChooserController rootController](self, "rootController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegRegionChooserController setRootController:](v16, "setRootController:", v18);

            -[CNFRegRegionChooserController specifier](self, "specifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegRegionChooserController setSpecifier:](v16, "setSpecifier:", v19);

            -[CNFRegRegionChooserController _drillDownControllersWithArray:](v16, "_drillDownControllersWithArray:", v4);
          }
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)drillDownControllerList
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegRegionChooserController _drillDownControllersWithArray:](self, "_drillDownControllersWithArray:", v3);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_selectRegionList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  CNFRegRegionChooserController *v7;
  void *v8;
  CNFRegRegionChooserController *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v13;
    if (v6)
    {
      v7 = [CNFRegRegionChooserController alloc];
      -[CNFRegRegionChooserController selectedRegionID](self, "selectedRegionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CNFRegRegionChooserController initWithRegionList:selectedRegionID:](v7, "initWithRegionList:selectedRegionID:", v13, v8);

      -[CNFRegRegionChooserController setDelegate:](v9, "setDelegate:", self);
      -[CNFRegRegionChooserController parentController](self, "parentController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegRegionChooserController setParentController:](v9, "setParentController:", v10);

      -[CNFRegRegionChooserController rootController](self, "rootController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegRegionChooserController setRootController:](v9, "setRootController:", v11);

      -[CNFRegRegionChooserController specifier](self, "specifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegRegionChooserController setSpecifier:](v9, "setSpecifier:", v12);

      -[CNFRegRegionChooserController showController:](self, "showController:", v9);
      v5 = v13;
    }
  }

}

- (void)_selectRegionID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v12;
    if (v6)
    {
      -[CNFRegRegionChooserController setSelectedRegionID:](self, "setSelectedRegionID:", v12);
      -[CNFRegRegionChooserController delegate](self, "delegate");
      v7 = objc_claimAutoreleasedReturnValue();
      v5 = v12;
      if (v7)
      {
        v8 = (void *)v7;
        -[CNFRegRegionChooserController delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_respondsToSelector();

        v5 = v12;
        if ((v10 & 1) != 0)
        {
          -[CNFRegRegionChooserController delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "regionChooser:selectedRegionID:", self, v12);

          v5 = v12;
        }
      }
    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  UISearchController *searchController;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  searchController = self->_searchController;
  v6 = a4;
  if (-[UISearchController isActive](searchController, "isActive"))
    -[CNFRegRegionChooserController filteredRegionList](self, "filteredRegionList");
  else
    -[CNFRegRegionChooserController regionList](self, "regionList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isLeafNode"))
  {
    objc_msgSend(v10, "regionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegRegionChooserController _selectRegionID:](self, "_selectRegionID:", v9);
  }
  else
  {
    objc_msgSend(v10, "subRegions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegRegionChooserController _selectRegionList:](self, "_selectRegionList:", v9);
  }

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CNFRegRegionChooserController regionList](self, "regionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11++), "search:withResults:", v6, v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_12);
  OSLogHandleForIDSCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEBUG, "Search results for {%@} : %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v14 = v6;
    v15 = v7;
    IMLogString();
  }
  -[CNFRegRegionChooserController setFilteredRegionList:](self, "setFilteredRegionList:", v7, v14, v15);
  -[CNFRegRegionChooserController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

}

uint64_t __72__CNFRegRegionChooserController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void)_hideTableViewCells
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CNFRegRegionChooserController tableView](self, "tableView", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setAlpha:", 0.0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_showTableViewCells
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CNFRegRegionChooserController tableView](self, "tableView", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setAlpha:", 1.0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController", a3);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "styleUsesCustomTableStyle"))
  {
    objc_msgSend(v23, "tableBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v23, "tableBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegRegionChooserController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v5);

      -[CNFRegRegionChooserController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundView:", 0);

    }
    if (objc_msgSend(v23, "styleUsesCustomSearchResultsStyle"))
    {
      -[CNFRegRegionChooserController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setDrawsTopShadowInGroupedSections:", 0);

      v9 = objc_msgSend(v23, "searchResultsTableSeparatorStyle");
      -[CNFRegRegionChooserController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSeparatorStyle:", v9);

      objc_msgSend(v23, "searchResultsTableSeparatorColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v23, "searchResultsTableSeparatorColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegRegionChooserController tableView](self, "tableView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSeparatorColor:", v12);

      }
      objc_msgSend(v23, "searchResultsTableSeparatorTopShadowColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v23, "searchResultsTableSeparatorTopShadowColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegRegionChooserController tableView](self, "tableView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSeparatorTopShadowColor:", v15);

      }
      objc_msgSend(v23, "searchResultsTableSeparatorBottomShadowColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v23, "searchResultsTableSeparatorBottomShadowColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegRegionChooserController tableView](self, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSeparatorBottomShadowColor:", v18);

      }
    }
    objc_msgSend(v23, "tableSectionBorderColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v23, "tableSectionBorderColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegRegionChooserController tableView](self, "tableView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSectionBorderColor:", v21);

    }
    -[CNFRegRegionChooserController _hideTableViewCells](self, "_hideTableViewCells");
  }

}

- (void)didPresentSearchController:(id)a3
{
  id v4;

  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "styleUsesCustomTableStyle"))
    -[CNFRegRegionChooserController _showTableViewCells](self, "_showTableViewCells");

}

- (void)regionChooser:(id)a3 selectedRegionID:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
    -[CNFRegRegionChooserController _selectRegionID:](self, "_selectRegionID:", v7);

}

- (void)setParentController:(id)a3
{
  objc_storeStrong((id *)&self->_parentController, a3);
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setRootController:(id)a3
{
  objc_storeStrong((id *)&self->_rootController, a3);
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setSpecifier:(id)a3
{
  PSSpecifier *v5;
  PSSpecifier *v6;

  v5 = (PSSpecifier *)a3;
  if (self->_specifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_specifier, a3);
    v5 = v6;
  }

}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  objc_msgSend(MEMORY[0x24BE75578], "setPreferenceValue:specifier:", a3, a4);
}

- (id)readPreferenceValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE75578], "readPreferenceValue:", a3);
}

- (void)showController:(id)a3
{
  -[PSController showController:](self->_parentController, "showController:", a3);
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  -[PSController showController:animate:](self->_parentController, "showController:animate:", a3, a4);
}

- (void)handleURL:(id)a3
{
  -[PSController handleURL:](self->_parentController, "handleURL:", a3);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (NSArray)regionList
{
  return self->_regionList;
}

- (void)setRegionList:(id)a3
{
  objc_storeStrong((id *)&self->_regionList, a3);
}

- (NSString)selectedRegionID
{
  return self->_selectedRegionID;
}

- (void)setSelectedRegionID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRegionID, a3);
}

- (CNFRegRegionChooserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegRegionChooserDelegate *)a3;
}

- (NSArray)filteredRegionList
{
  return self->_filteredRegionList;
}

- (void)setFilteredRegionList:(id)a3
{
  objc_storeStrong((id *)&self->_filteredRegionList, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong((id *)&self->_filteredRegionList, 0);
  objc_storeStrong((id *)&self->_regionList, 0);
  objc_storeStrong((id *)&self->_selectedRegionID, 0);
}

@end
