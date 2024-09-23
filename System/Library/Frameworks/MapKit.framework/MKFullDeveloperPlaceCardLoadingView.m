@implementation MKFullDeveloperPlaceCardLoadingView

+ (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 320.0;
  v3 = 442.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MKFullDeveloperPlaceCardLoadingView)init
{
  MKFullDeveloperPlaceCardLoadingView *v2;
  MKFullDeveloperPlaceCardLoadingView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKFullDeveloperPlaceCardLoadingView;
  v2 = -[MKFullDeveloperPlaceCardLoadingView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
    -[MKFullDeveloperPlaceCardLoadingView setup](v2, "setup");
  return v3;
}

- (void)setup
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
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
  _QWORD v27[9];

  v27[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("DeveloperPlaceCardFullBackgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v6);

  -[UITableView setUserInteractionEnabled:](self->_tableView, "setUserInteractionEnabled:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKFullDeveloperPlaceCardLoadingView addSubview:](self, "addSubview:", self->_tableView);
  v19 = (void *)MEMORY[0x1E0CB3718];
  -[UITableView topAnchor](self->_tableView, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFullDeveloperPlaceCardLoadingView topAnchor](self, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v24;
  -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFullDeveloperPlaceCardLoadingView bottomAnchor](self, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  -[UITableView leadingAnchor](self->_tableView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFullDeveloperPlaceCardLoadingView leadingAnchor](self, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v17;
  -[UITableView trailingAnchor](self->_tableView, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFullDeveloperPlaceCardLoadingView trailingAnchor](self, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v9;
  -[UITableView heightAnchor](self->_tableView, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:", 442.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v11;
  -[MKFullDeveloperPlaceCardLoadingView widthAnchor](self, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToConstant:", 320.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v13;
  -[MKFullDeveloperPlaceCardLoadingView heightAnchor](self, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToConstant:", 442.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v16);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
  {
    v6 = 0;
  }
  else
  {
    +[MKDeveloperPlaceCardLoadingViewDecorator decorateView:ofType:](MKDeveloperPlaceCardLoadingViewDecorator, "decorateView:ofType:", 0, 3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 76.0;
  if (a4)
    return 12.0;
  return result;
}

- (int64_t)viewTypeForIndexPath:(id)a3
{
  id v3;
  _BOOL4 v4;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "section"))
  {
    v4 = objc_msgSend(v3, "section") == 1;

    return 2 * v4;
  }
  else
  {
    v6 = objc_msgSend(v3, "row");

    return v6 == 3;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = -[MKFullDeveloperPlaceCardLoadingView viewTypeForIndexPath:](self, "viewTypeForIndexPath:", v5);
  objc_msgSend(v6, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKDeveloperPlaceCardLoadingViewDecorator decorateView:ofType:](MKDeveloperPlaceCardLoadingViewDecorator, "decorateView:ofType:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v10);

  v11 = objc_msgSend(v5, "section");
  objc_msgSend(v6, "set_mapkit_forceSeparatorFrameToCGRectZero:", v11 == 0);
  objc_msgSend(v6, "setSeparatorInset:", 0.0, 48.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("DeveloperPlaceCardPlatterColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 2 * (a4 == 1);
  else
    return 4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
}

@end
