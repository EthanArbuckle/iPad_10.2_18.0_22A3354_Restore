@implementation HRWDTableViewController

- (void)_addObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

}

- (HRWDTableViewController)initWithStyle:(int64_t)a3
{
  HRWDTableViewController *v3;
  HRWDTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRWDTableViewController;
  v3 = -[HRWDTableViewController initWithStyle:](&v6, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
    -[HRWDTableViewController _addObservers](v3, "_addObservers");
  return v4;
}

- (HRWDTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  HRWDTableViewController *v4;
  HRWDTableViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HRWDTableViewController;
  v4 = -[HRWDTableViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[HRWDTableViewController _addObservers](v4, "_addObservers");
  return v5;
}

- (HRWDTableViewController)initWithCoder:(id)a3
{
  HRWDTableViewController *v3;
  HRWDTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRWDTableViewController;
  v3 = -[HRWDTableViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HRWDTableViewController _addObservers](v3, "_addObservers");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HRWDTableViewController;
  -[HRWDTableViewController dealloc](&v4, sel_dealloc);
}

+ (id)tableViewSectionClasses
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HRWDTableViewController;
  -[HRWDTableViewController viewWillAppear:](&v14, sel_viewWillAppear_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_tableSections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "viewWillAppear:", v3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)applicationWillEnterForeground
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_tableSections;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "applicationWillEnterForeground", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)applicationDidEnterBackground
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_tableSections;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "applicationDidEnterBackground", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  NSArray *tableSections;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HRWDTableViewController;
  -[HKTableViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[HRWDTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend((id)objc_opt_class(), "tableViewSectionClasses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v14 + 1) + 8 * v10)), "initWithDelegate:atSection:", self, v8 + v10);
        objc_msgSend(v11, "setUpWithTableViewController:", self);
        objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      v8 += v10;
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  tableSections = self->_tableSections;
  self->_tableSections = v12;

  -[HRWDTableViewController reloadTable](self, "reloadTable");
}

- (void)reloadTable
{
  id v2;

  -[HRWDTableViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HRWDTableViewController _section:](self, "_section:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRows");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HRWDTableViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "cellForRow:table:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_tableSections, "count", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[HRWDTableViewController _section:](self, "_section:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleForHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[HRWDTableViewController _section:](self, "_section:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleForFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;

  v5 = a4;
  -[HRWDTableViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "estimatedHeightForRow:", v7);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  -[HRWDTableViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "accessoryButtonTappedForRow:", v6);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a4;
  -[HRWDTableViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willSelectRow:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "integerValue");
    if (v9 == objc_msgSend(v5, "row"))
      v10 = v5;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  -[HRWDTableViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HRWDTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v12[3] = &unk_1E74D1890;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "didSelectRow:representedByCell:withCompletion:", v9, v10, v12);

}

void __61__HRWDTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v4;
  _QWORD block[5];
  id v6;
  char v7;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HRWDTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    block[3] = &unk_1E74D1868;
    v4 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __61__HRWDTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (id)_section:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tableSections, "objectAtIndexedSubscript:", a3);
}

- (id)_sectionAtIndexPath:(id)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tableSections, "objectAtIndexedSubscript:", objc_msgSend(a3, "section"));
}

- (id)indexPathForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HRWDTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reloadSection:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v7 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  if ((_DWORD)v7 == v4)
  {
    -[HRWDTableViewController tableView](self, "tableView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadSections:withRowAnimation:", v11, 5);

  }
  else
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v4);
    -[HRWDTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadSections:withRowAnimation:", v10, 5);

    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v8);
  }
}

- (void)pushViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HRWDTableViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

}

- (NSArray)tableSections
{
  return self->_tableSections;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_tableSections, 0);
}

@end
