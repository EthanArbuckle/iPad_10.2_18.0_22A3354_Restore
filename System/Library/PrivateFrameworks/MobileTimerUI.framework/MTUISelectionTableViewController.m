@implementation MTUISelectionTableViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTUISelectionTableViewController)initWithStyle:(int64_t)a3 title:(id)a4 selectionData:(id)a5 parentIndexPath:(id)a6 allowsMultiple:(BOOL)a7 allowsNone:(BOOL)a8 delegate:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  MTUISelectionTableViewController *v19;
  MTUISelectionTableViewController *v20;
  void *v21;
  objc_super v23;

  v9 = a8;
  v10 = a7;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v23.receiver = self;
  v23.super_class = (Class)MTUISelectionTableViewController;
  v19 = -[MTUISelectionTableViewController initWithStyle:](&v23, sel_initWithStyle_, a3);
  v20 = v19;
  if (v19)
  {
    -[MTUISelectionTableViewController setTitle:](v19, "setTitle:", v15);
    -[MTUISelectionTableViewController setSelectionData:](v20, "setSelectionData:", v16);
    -[MTUISelectionTableViewController setParentIndexPath:](v20, "setParentIndexPath:", v17);
    -[MTUISelectionTableViewController tableView](v20, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsMultipleSelection:", v10);

    -[MTUISelectionTableViewController setAllowsNone:](v20, "setAllowsNone:", v9);
    -[MTUISelectionTableViewController setDelegate:](v20, "setDelegate:", v18);
  }

  return v20;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTUISelectionTableViewController;
  -[MTUISelectionTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "mtui_backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUISelectionTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[MTUISelectionTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEstimatedRowHeight:", *MEMORY[0x24BDF7DE8]);

  -[MTUISelectionTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", *MEMORY[0x24BDF7DE0]);

  -[MTUISelectionTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("MTUISelectionTableViewCellIdentifier"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[MTUISelectionTableViewController selectionData](self, "selectionData", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MTUISelectionTableViewCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("MTUISelectionTableViewCellIdentifier"));
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  objc_msgSend(MEMORY[0x24BDF6950], "mtui_cellHighlightColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectedBackgroundColor:", v13);

  -[MTUISelectionTableViewController selectionData](self, "selectionData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "row");

  objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "isSelected"))
    v17 = 3;
  else
    v17 = 0;
  objc_msgSend(v7, "setAccessoryType:", v17);
  objc_msgSend(v16, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[MTUISelectionTableViewController allowsNone](self, "allowsNone"))
  {
    -[MTUISelectionTableViewController selectionData](self, "selectionData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", &__block_literal_global_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 1 && objc_msgSend(v9, "containsIndex:", objc_msgSend(v7, "row")))
    {
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      goto LABEL_12;
    }

  }
  if ((objc_msgSend(v6, "allowsMultipleSelection") & 1) == 0)
    -[MTUISelectionTableViewController deselectRowsExcluding:](self, "deselectRowsExcluding:", objc_msgSend(v7, "row"));
  -[MTUISelectionTableViewController selectionData](self, "selectionData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIsSelected:", objc_msgSend(v9, "isSelected") ^ 1);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isSelected"))
    v12 = 3;
  else
    v12 = 0;
  objc_msgSend(v11, "setAccessoryType:", v12);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[MTUISelectionTableViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUISelectionTableViewController parentIndexPath](self, "parentIndexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didSelectOptions:parentIndexPath:", v14, v15);

LABEL_12:
}

uint64_t __70__MTUISelectionTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (void)deselectRowsExcluding:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  -[MTUISelectionTableViewController selectionData](self, "selectionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__MTUISelectionTableViewController_deselectRowsExcluding___block_invoke;
  v9[3] = &__block_descriptor_40_e38_B32__0__MTUISelectionViewData_8Q16_B24l;
  v9[4] = a3;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v9);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __58__MTUISelectionTableViewController_deselectRowsExcluding___block_invoke_2;
  v8[3] = &unk_24F0147D8;
  v8[4] = self;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v8);

}

uint64_t __58__MTUISelectionTableViewController_deselectRowsExcluding___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(_QWORD *)(a1 + 32) == a3)
    return 0;
  else
    return objc_msgSend(a2, "isSelected");
}

void __58__MTUISelectionTableViewController_deselectRowsExcluding___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "selectionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsSelected:", 0);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessoryType:", 0);
}

- (NSArray)selectionData
{
  return self->_selectionData;
}

- (void)setSelectionData:(id)a3
{
  objc_storeStrong((id *)&self->_selectionData, a3);
}

- (MTUISelectionTableViewControllerDelegate)delegate
{
  return (MTUISelectionTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSIndexPath)parentIndexPath
{
  return self->_parentIndexPath;
}

- (void)setParentIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_parentIndexPath, a3);
}

- (BOOL)allowsNone
{
  return self->_allowsNone;
}

- (void)setAllowsNone:(BOOL)a3
{
  self->_allowsNone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectionData, 0);
}

@end
