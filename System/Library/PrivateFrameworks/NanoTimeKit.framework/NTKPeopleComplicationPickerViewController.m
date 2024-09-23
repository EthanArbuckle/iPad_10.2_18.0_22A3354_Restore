@implementation NTKPeopleComplicationPickerViewController

- (NTKPeopleComplicationPickerViewController)initWithDetailConfiguration:(id)a3
{
  id v5;
  NTKPeopleComplicationPickerViewController *v6;
  uint64_t v7;
  NSString *parentSectionName;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKPeopleComplicationPickerViewController;
  v6 = -[NTKPeopleComplicationPickerViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    objc_msgSend(v5, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    parentSectionName = v6->_parentSectionName;
    v6->_parentSectionName = (NSString *)v7;

    objc_storeStrong((id *)&v6->_configuration, a3);
    v6->_isFirstTimeVisible = 1;
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
  NTKPeopleDetailComplicationPickerDataSource *v15;
  void *v16;
  NTKPeopleDetailComplicationPickerDataSource *dataSource;
  NTKPeopleDetailComplicationPickerDataSource *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NTKPeopleComplicationPickerViewController;
  -[NTKPeopleComplicationPickerViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[NTKPeopleComplicationPickerViewController view](self, "view");
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
  v15 = -[NTKPeopleDetailComplicationPickerDataSource initWithTableView:detailConfiguration:]([NTKPeopleDetailComplicationPickerDataSource alloc], "initWithTableView:detailConfiguration:", self->_tableView, self->_configuration);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", v15);
  -[NTKPeopleComplicationPickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_tableView);

  dataSource = self->_dataSource;
  self->_dataSource = v15;
  v18 = v15;

  -[NTKPeopleComplicationPickerViewController setTitle:](self, "setTitle:", self->_parentSectionName);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationPickerViewController;
  -[NTKPeopleComplicationPickerViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationPickerViewController;
  -[NTKPeopleComplicationPickerViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationPickerViewController;
  -[NTKPeopleComplicationPickerViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationPickerViewController;
  -[NTKPeopleComplicationPickerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (self->_isFirstTimeVisible)
  {
    -[NTKPeopleComplicationPickerViewController scrollToSelectedIdentifierAnimated:](self, "scrollToSelectedIdentifierAnimated:", 0);
    self->_isFirstTimeVisible = 0;
  }
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
  -[NTKPeopleComplicationPickerViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationItemForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKPeopleComplicationPickerViewController tableView](self, "tableView");
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
  -[NTKPeopleComplicationPickerViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "peopleComplicationPickerViewController:didSelectItem:", self, v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NTKPeopleComplicationPickerViewController _didSelectItemAtIndexPath:](self, "_didSelectItemAtIndexPath:", a4);
}

- (void)scrollToSelectedIdentifierAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  -[NTKPeopleComplicationPickerViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedIndexPath");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "item"))
      v6 = 2;
    else
      v6 = 1;
    -[NTKPeopleComplicationPickerViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v8, v6, v3);

  }
}

- (NTKPeopleComplicationPickerViewControllerDelegate)delegate
{
  return (NTKPeopleComplicationPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (NTKPeopleDetailComplicationPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)isFirstTimeVisible
{
  return self->_isFirstTimeVisible;
}

- (void)setIsFirstTimeVisible:(BOOL)a3
{
  self->_isFirstTimeVisible = a3;
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
