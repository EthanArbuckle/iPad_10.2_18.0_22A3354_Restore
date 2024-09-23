@implementation _UIDocumentPickerOverviewViewController

- (_UIDocumentPickerOverviewViewController)initWithFileTypes:(id)a3 mode:(unint64_t)a4 auxiliaryOptions:(id)a5 includeManagementItem:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  _UIDocumentPickerOverviewViewController *v12;
  _UIDocumentPickerOverviewViewController *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_UIDocumentPickerOverviewViewController;
  v12 = -[_UIContainerHuggingTableViewController initWithStyle:](&v26, sel_initWithStyle_, 0);
  v13 = v12;
  if (v12)
  {
    -[_UIDocumentPickerOverviewViewController setMode:](v12, "setMode:", a4);
    -[_UIDocumentPickerOverviewViewController setAuxiliaryOptions:](v13, "setAuxiliaryOptions:", v11);
    -[_UIDocumentPickerOverviewViewController setFileTypes:](v13, "setFileTypes:", v10);
    -[_UIDocumentPickerOverviewViewController setManage:](v13, "setManage:", v6);
    -[_UIDocumentPickerOverviewViewController tableView](v13, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("com.apple.UIKit.fileprovider.default"));

    v15 = *MEMORY[0x24BDF7718];
    v16 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v17 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v18 = *(double *)(MEMORY[0x24BDF7718] + 24);
    -[_UIDocumentPickerOverviewViewController tableView](v13, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSeparatorInset:", v15, v16, v17, v18);

    -[_UIDocumentPickerOverviewViewController tableView](v13, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlwaysBounceVertical:", 0);

    v21 = *MEMORY[0x24BDF7DE0];
    -[_UIDocumentPickerOverviewViewController tableView](v13, "tableView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRowHeight:", v21);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v13, sel__doneButtonPressed);
    -[_UIDocumentPickerOverviewViewController navigationItem](v13, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRightBarButtonItem:", v23);

    -[_UIDocumentPickerOverviewViewController updateContents](v13, "updateContents");
  }

  return v13;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIDocumentPickerOverviewViewController;
  v4 = a3;
  -[_UIDocumentPickerOverviewViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v11.receiver, v11.super_class);
  v6 = v5;

  -[_UIDocumentPickerOverviewViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = vabdd_f64(v6, v8);

  if (v9 >= 2.22044605e-16)
  {
    -[_UIDocumentPickerOverviewViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (void)updateContents
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF70A0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Browse"), CFSTR("Browse"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerOverviewViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UIDocumentPicker-more"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v9);

  objc_msgSend(v3, "setIdentifier:", CFSTR("__UIDocumentPickerBrowseIdentifier"));
  objc_msgSend(v3, "setNewlyAdded:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[_UIDocumentPickerOverviewViewController auxiliaryOptions](self, "auxiliaryOptions", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v16, "order"))
          objc_msgSend(v10, "addObject:", v16);
        else
          objc_msgSend(v10, "insertObject:atIndex:", v16, 0);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[_UIDocumentPickerOverviewViewController allPickers](self, "allPickers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToArray:", v10);

  if ((v18 & 1) == 0)
  {
    -[_UIDocumentPickerOverviewViewController setAllPickers:](self, "setAllPickers:", v10);
    -[_UIDocumentPickerOverviewViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;
  _QWORD v7[5];

  v3 = a3;
  -[_UIDocumentPickerOverviewViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:", 1);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58___UIDocumentPickerOverviewViewController_viewWillAppear___block_invoke;
  v7[3] = &unk_24E43A808;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v7);
  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentPickerOverviewViewController;
  -[_UIDocumentPickerOverviewViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)updatePreferredContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  -[_UIDocumentPickerOverviewViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[_UIDocumentPickerOverviewViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[_UIDocumentPickerOverviewViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutSubviews");

  -[_UIDocumentPickerOverviewViewController allPickers](self, "allPickers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 8)
    v8 = 8;
  else
    v8 = v7;
  -[_UIDocumentPickerOverviewViewController allPickers](self, "allPickers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (unint64_t)objc_msgSend(v9, "count") > 8;
  -[_UIDocumentPickerOverviewViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsVerticalScrollIndicator:", v10);

  -[_UIDocumentPickerOverviewViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScrollIndicatorInsets:", 10.0, 0.0, 10.0, 0.0);

  -[_UIDocumentPickerOverviewViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visibleCells");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "size");
  objc_msgSend(v15, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  v17 = v16;
  -[_UIDocumentPickerOverviewViewController allPickers](self, "allPickers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 <= v8)
  {
    objc_msgSend(v15, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "font");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v23 = 0;
      v24 = *MEMORY[0x24BDF65F8];
      v25 = 0.0;
      do
      {
        -[_UIDocumentPickerOverviewViewController allPickers](self, "allPickers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndex:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "title");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v24;
        v35[0] = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "boundingRectWithSize:options:attributes:context:", 1, v29, 0, 500.0, v17);
        v31 = v30;

        if (v25 < v31)
          v25 = v31;

        ++v23;
      }
      while (v8 != v23);
      v32 = v25 + 92.0;
    }
    else
    {
      v32 = 92.0;
    }
    v20 = ceil(v32);

  }
  else
  {
    v20 = 320.0;
  }
  -[_UIDocumentPickerOverviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v20, v17 * (double)v8);
  -[_UIDocumentPickerOverviewViewController tableView](self, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setEstimatedRowHeight:", v17);

}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)_UIDocumentPickerOverviewViewController;
  -[_UIDocumentPickerOverviewViewController setPreferredContentSize:](&v10, sel_setPreferredContentSize_);
  -[_UIDocumentPickerOverviewViewController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255516C40))
  {
    objc_msgSend(v6, "preferredContentSize");
    if (v8 != width || v7 != height)
      objc_msgSend(v6, "setPreferredContentSize:", width, height);
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

  -[_UIDocumentPickerOverviewViewController allPickers](self, "allPickers", a3, a4);
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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("com.apple.UIKit.fileprovider.default"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerOverviewViewController allPickers](self, "allPickers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v13);

  objc_msgSend(v11, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  v17 = objc_msgSend(v11, "isNewlyAdded");
  objc_msgSend(v7, "setShowNewlyAdded:", v17);
  objc_msgSend(v7, "setSeparatorInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4;

  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  return (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0000999999975;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  -[_UIDocumentPickerOverviewViewController allPickers](self, "allPickers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerOverviewViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == CFSTR("__UIDocumentPickerBrowseIdentifier"))
    objc_msgSend(v9, "overviewController:selectedDocumentPickerWithIdentifier:", self, v10);
  else
    objc_msgSend(v9, "overviewController:selectedAuxiliaryOptionWithIdentifier:", self, v10);

}

- (_UIDocumentPickerOverviewDelegate)delegate
{
  return (_UIDocumentPickerOverviewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)allPickers
{
  return self->_allPickers;
}

- (void)setAllPickers:(id)a3
{
  objc_storeStrong((id *)&self->_allPickers, a3);
}

- (NSArray)auxiliaryOptions
{
  return self->_auxiliaryOptions;
}

- (void)setAuxiliaryOptions:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryOptions, a3);
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

- (BOOL)manage
{
  return self->_manage;
}

- (void)setManage:(BOOL)a3
{
  self->_manage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTypes, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptions, 0);
  objc_storeStrong((id *)&self->_allPickers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
