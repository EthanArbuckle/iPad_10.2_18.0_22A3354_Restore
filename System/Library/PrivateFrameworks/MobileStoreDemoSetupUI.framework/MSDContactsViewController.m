@implementation MSDContactsViewController

- (MSDContactsViewController)init
{
  MSDContactsViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)MSDContactsViewController;
  v2 = -[MSDContactsViewController init](&v19, sel_init);
  if (v2)
  {
    +[MSDStoreContactsModel sharedInstance](MSDStoreContactsModel, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDContactsViewController setContactsModel:](v2, "setContactsModel:", v3);

    v4 = (void *)objc_opt_new();
    -[MSDContactsViewController setRegions:](v2, "setRegions:", v4);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[MSDContactsViewController contactsModel](v2, "contactsModel", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "regionToCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
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
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          -[MSDContactsViewController regions](v2, "regions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CONTACT_NUMBER_HEADER"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDContactsViewController setTitle:](v2, "setTitle:", v13);

  }
  return v2;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[6];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)MSDContactsViewController;
  -[MSDContactsViewController viewDidLoad](&v27, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MSDContactsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDContactsViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safeAreaLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  objc_msgSend(v4, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDContactsViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v17;
  objc_msgSend(v4, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDContactsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v9;
  objc_msgSend(v4, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDContactsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v16);
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ContactsViewTableCell"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[MSDContactsViewController regions](self, "regions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  -[MSDContactsViewController regions](self, "regions", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
    return 0;
  -[MSDContactsViewController regions](self, "regions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSDContactsViewController contactsModel](self, "contactsModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "regionToCountryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  -[MSDContactsViewController regions](self, "regions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
  {
    v20 = 0;
  }
  else
  {
    -[MSDContactsViewController regions](self, "regions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSDContactsViewController contactsModel](self, "contactsModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regionToCountryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v5, "row");
    if (v14 >= objc_msgSend(v13, "count"))
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v5, "row"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDContactsViewController contactsModel](self, "contactsModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contactNumberForCountryCode:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForCountryCode:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("ContactsViewTableCell"));
      objc_msgSend(v20, "defaultContentConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v19);
      objc_msgSend(v21, "setSecondaryText:", v17);
      objc_msgSend(v20, "setContentConfiguration:", v21);

    }
  }

  return v20;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[MSDContactsViewController regions](self, "regions", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v9 = 0;
  }
  else
  {
    -[MSDContactsViewController regions](self, "regions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (MSDStoreContactsModel)contactsModel
{
  return self->_contactsModel;
}

- (void)setContactsModel:(id)a3
{
  objc_storeStrong((id *)&self->_contactsModel, a3);
}

- (NSMutableArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_storeStrong((id *)&self->_regions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_contactsModel, 0);
}

@end
