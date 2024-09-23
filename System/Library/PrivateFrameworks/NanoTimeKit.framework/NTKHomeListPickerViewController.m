@implementation NTKHomeListPickerViewController

- (NTKHomeListPickerViewController)initWithDetailConfiguration:(id)a3
{
  id v5;
  NTKHomeListPickerViewController *v6;
  uint64_t v7;
  NSString *parentSectionName;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKHomeListPickerViewController;
  v6 = -[NTKHomeListPickerViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    objc_msgSend(v5, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    parentSectionName = v6->_parentSectionName;
    v6->_parentSectionName = (NSString *)v7;

    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v6;
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
  NTKHomeListPickerDataSource *v15;
  void *v16;
  NTKHomeListPickerDataSource *dataSource;
  NTKHomeListPickerDataSource *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NTKHomeListPickerViewController;
  -[NTKHomeListPickerViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[NTKHomeListPickerViewController view](self, "view");
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
  v15 = -[NTKHomeListPickerDataSource initWithTableView:detailConfiguration:]([NTKHomeListPickerDataSource alloc], "initWithTableView:detailConfiguration:", self->_tableView, self->_configuration);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", v15);
  -[NTKHomeListPickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_tableView);

  dataSource = self->_dataSource;
  self->_dataSource = v15;
  v18 = v15;

  -[NTKHomeListPickerViewController setTitle:](self, "setTitle:", self->_parentSectionName);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "visibleCells", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12++), "ntk_setPickerSelected:", 0);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ntk_setPickerSelected:", 1);
  -[NTKHomeListPickerViewController dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pickerItemForIndexPath:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKHomeListPickerViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "homeListPickerViewController:didSelectItem:", self, v15);

}

- (NTKHomeListPickerViewControllerDelegate)delegate
{
  return (NTKHomeListPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (NTKHomeListPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_parentSectionName, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
