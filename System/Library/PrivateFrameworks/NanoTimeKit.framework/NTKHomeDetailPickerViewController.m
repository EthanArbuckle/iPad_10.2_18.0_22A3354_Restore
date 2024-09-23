@implementation NTKHomeDetailPickerViewController

- (NTKHomeDetailPickerViewController)initWithDetailConfiguration:(id)a3 homeListItem:(id)a4
{
  id v7;
  id v8;
  NTKHomeDetailPickerViewController *v9;
  uint64_t v10;
  NSString *parentSectionName;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKHomeDetailPickerViewController;
  v9 = -[NTKHomeDetailPickerViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    objc_msgSend(v7, "title");
    v10 = objc_claimAutoreleasedReturnValue();
    parentSectionName = v9->_parentSectionName;
    v9->_parentSectionName = (NSString *)v10;

    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v9->_homeListItem, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UITableView *v12;
  UITableView *tableView;
  void *v14;
  NTKHomeDetailPickerDataSource *v15;
  void *v16;
  NTKHomeDetailPickerDataSource *dataSource;
  NTKHomeDetailPickerDataSource *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NTKHomeDetailPickerViewController;
  -[NTKHomeDetailPickerViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[NTKHomeDetailPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 1, v5, v7, v9, v11);
  tableView = self->_tableView;
  self->_tableView = v12;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v14);

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  v15 = -[NTKHomeDetailPickerDataSource initWithTableView:detailConfiguration:homeListItem:]([NTKHomeDetailPickerDataSource alloc], "initWithTableView:detailConfiguration:homeListItem:", self->_tableView, self->_configuration, self->_homeListItem);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", v15);
  -[NTKHomeDetailPickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_tableView);

  dataSource = self->_dataSource;
  self->_dataSource = v15;
  v18 = v15;

  -[NTKHomeDetailPickerViewController setTitle:](self, "setTitle:", self->_parentSectionName);
}

- (void)_didSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKHomeDetailPickerViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pickerItemForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKHomeDetailPickerViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "visibleCells", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "ntk_setPickerSelected:", 0);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "cellForRowAtIndexPath:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ntk_setPickerSelected:", 1);
  -[NTKHomeDetailPickerViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homeDetailPickerViewController:didSelectItem:", self, v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NTKHomeDetailPickerViewController _didSelectItemAtIndexPath:](self, "_didSelectItemAtIndexPath:", a4);
}

- (NTKHomeDetailPickerViewControllerDelegate)delegate
{
  return (NTKHomeDetailPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSString)parentSectionName
{
  return self->_parentSectionName;
}

- (void)setParentSectionName:(id)a3
{
  objc_storeStrong((id *)&self->_parentSectionName, a3);
}

- (NTKComplicationPickerDetailViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NTKHomeDetailPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NTKHomeListItem)homeListItem
{
  return self->_homeListItem;
}

- (void)setHomeListItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeListItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeListItem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_parentSectionName, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
