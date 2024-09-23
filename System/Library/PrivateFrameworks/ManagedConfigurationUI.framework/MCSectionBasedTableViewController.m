@implementation MCSectionBasedTableViewController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MCSectionBasedTableViewController defaultView](self, "defaultView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v6, "setFrame:");

  -[MCSectionBasedTableViewController setView:](self, "setView:", v6);
  -[MCSectionBasedTableViewController setSectionBasedTableView:](self, "setSectionBasedTableView:", v6);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSectionBasedTableViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (id)defaultView
{
  return (id)objc_opt_new();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCSectionBasedTableViewController;
  -[MCSectionBasedTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[MCSectionBasedTableViewController _registerCellClass](self, "_registerCellClass");
  -[MCSectionBasedTableViewController sectionBasedTableView](self, "sectionBasedTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[MCSectionBasedTableViewController sectionBasedTableView](self, "sectionBasedTableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);

}

- (void)_registerCellClass
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MCSectionBasedTableViewController sectionControllers](self, "sectionControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[MCSectionBasedTableViewController sectionBasedTableView](self, "sectionBasedTableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "registerCellClassWithTableView:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[MCSectionBasedTableViewController sectionBasedTableView](self, "sectionBasedTableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("sectionHeader"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[MCSectionBasedTableViewController sectionControllers](self, "sectionControllers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[MCSectionBasedTableViewController sectionControllers](self, "sectionControllers", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfRows");

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[MCSectionBasedTableViewController sectionControllers](self, "sectionControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "cellForRowAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return (id)objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("sectionHeader"), a4);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;

  v5 = a4;
  -[MCSectionBasedTableViewController sectionControllers](self, "sectionControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "heightForRowAtIndex:", v8);
  v10 = v9;

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[MCSectionBasedTableViewController sectionControllers](self, "sectionControllers", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightForHeader");
  v8 = v7;

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[MCSectionBasedTableViewController sectionControllers](self, "sectionControllers", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 50.0;
}

- (NSArray)sectionControllers
{
  return self->_sectionControllers;
}

- (void)setSectionControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (MCSectionBasedTableView)sectionBasedTableView
{
  return self->_sectionBasedTableView;
}

- (void)setSectionBasedTableView:(id)a3
{
  objc_storeStrong((id *)&self->_sectionBasedTableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionBasedTableView, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
}

@end
