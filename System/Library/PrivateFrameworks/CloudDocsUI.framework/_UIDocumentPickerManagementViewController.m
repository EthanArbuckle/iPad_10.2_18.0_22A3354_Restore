@implementation _UIDocumentPickerManagementViewController

- (_UIDocumentPickerManagementViewController)initWithFileTypes:(id)a3 mode:(unint64_t)a4
{
  id v6;
  _UIDocumentPickerManagementViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentPickerManagementViewController;
  v7 = -[_UIContainerHuggingTableViewController initWithStyle:](&v20, sel_initWithStyle_, 0);
  if (v7)
  {
    +[_UIDocumentPickerDescriptor manageablePickersForMode:documentTypes:](_UIDocumentPickerDescriptor, "manageablePickersForMode:documentTypes:", a4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerManagementViewController setAllPickers:](v7, "setAllPickers:", v8);

    -[_UIDocumentPickerManagementViewController setFileTypes:](v7, "setFileTypes:", v6);
    -[_UIDocumentPickerManagementViewController setMode:](v7, "setMode:", a4);
    -[_UIDocumentPickerManagementViewController tableView](v7, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("com.apple.UIKit.fileprovider.default"));

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Manage Locations"), CFSTR("Manage Locations"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerManagementViewController setTitle:](v7, "setTitle:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v7, sel__doneButtonPressed);
    -[_UIDocumentPickerManagementViewController navigationItem](v7, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

    -[_UIDocumentPickerManagementViewController setEditing:animated:](v7, "setEditing:animated:", 1, 0);
    -[_UIDocumentPickerManagementViewController tableView](v7, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlwaysBounceVertical:", 0);

    v15 = *MEMORY[0x24BDF7DE0];
    -[_UIDocumentPickerManagementViewController tableView](v7, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRowHeight:", v15);

    -[_UIDocumentPickerManagementViewController tableView](v7, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadData");

    -[_UIDocumentPickerManagementViewController _updateContentSize](v7, "_updateContentSize");
    -[_UIDocumentPickerManagementViewController tableView](v7, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadData");

  }
  return v7;
}

- (void)_updateContentSize
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __63___UIDocumentPickerManagementViewController__updateContentSize__block_invoke;
  v2[3] = &unk_24E43A808;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v2);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[_UIDocumentPickerManagementViewController _updateContentSize](self, "_updateContentSize");
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerManagementViewController;
  -[_UIDocumentPickerManagementViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (_UIDocumentPickerManagementViewController)initWithStyle:(int64_t)a3
{
  return -[_UIDocumentPickerManagementViewController initWithFileTypes:mode:](self, "initWithFileTypes:mode:", 0, 0);
}

- (_UIDocumentPickerManagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[_UIDocumentPickerManagementViewController initWithFileTypes:mode:](self, "initWithFileTypes:mode:", 0, 0);
}

- (_UIDocumentPickerManagementViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerManagementViewController;
  return -[_UIDocumentPickerManagementViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;

  -[_UIDocumentPickerManagementViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)_doneButtonPressed
{
  id v2;
  id v3;

  -[_UIDocumentPickerManagementViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  id v23;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("com.apple.UIKit.fileprovider.default"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  v13 = -[_UIDocumentPickerManagementViewController mode](self, "mode");
  -[_UIDocumentPickerManagementViewController fileTypes](self, "fileTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v10, "pickerEnabledForMode:documentTypes:reason:", v13, v14, &v23);
  v15 = v23;

  objc_msgSend(v7, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(v7, "setShowNewlyAdded:", objc_msgSend(v10, "isNewlyAdded"));
  objc_msgSend(v10, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDF8110]);

  objc_msgSend(v7, "editingAccessoryView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 && (v18 & 1) == 0)
  {
    v20 = objc_alloc(MEMORY[0x24BDF6E28]);
    v19 = (void *)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v7, "setEditingAccessoryView:", v19);
    objc_msgSend(v7, "editingAccessoryView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_switchToggled_, 4096);

  }
  if (v18)
    objc_msgSend(v7, "setEditingAccessoryView:", 0);
  objc_msgSend(v19, "setOn:", objc_msgSend(v10, "enabled"));

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a4;
  -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerManagementViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  objc_msgSend(v14, "imageWithScale:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setImage:", v12);
}

- (void)switchToggled:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  -[_UIDocumentPickerManagementViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "convertPoint:fromView:", v4);
  v7 = v6;
  v9 = v8;

  -[_UIDocumentPickerManagementViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v14, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v4, "isOn");
  objc_msgSend(v12, "setEnabled:", v13);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;

  v5 = a4;
  -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDF8110]);

  if ((v7 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", &__block_literal_global_3) != 0x7FFFFFFFFFFFFFFFLL;

    v10 = (unint64_t)(v12 - v14) > 1;
  }

  return v10;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v6 = a5;
  v7 = objc_msgSend(v6, "row");
  -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_31);

  if (v7 == v9)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v6;
  }
  v11 = v10;

  return v11;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v7 = a5;
  v8 = a4;
  -[_UIDocumentPickerManagementViewController allPickers](self, "allPickers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v8, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "row");

  objc_msgSend(v13, "removeObjectAtIndex:", v11);
  v12 = objc_msgSend(v7, "row");

  objc_msgSend(v13, "insertObject:atIndex:", v10, v12);
  -[_UIDocumentPickerManagementViewController setAllPickers:](self, "setAllPickers:", v13);
  +[_UIDocumentPickerDescriptor setOrderFromPickers:](_UIDocumentPickerDescriptor, "setOrderFromPickers:", v13);

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (NSArray)allPickers
{
  return self->_allPickers;
}

- (void)setAllPickers:(id)a3
{
  objc_storeStrong((id *)&self->_allPickers, a3);
}

- (NSArray)fileTypes
{
  return self->_fileTypes;
}

- (void)setFileTypes:(id)a3
{
  objc_storeStrong((id *)&self->_fileTypes, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTypes, 0);
  objc_storeStrong((id *)&self->_allPickers, 0);
}

@end
