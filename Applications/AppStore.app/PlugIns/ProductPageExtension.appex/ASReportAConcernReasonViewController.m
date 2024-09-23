@implementation ASReportAConcernReasonViewController

- (ASReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ASReportAConcernConfiguration *v5;
  ASReportAConcernReasonViewController *v6;

  v5 = objc_alloc_init(ASReportAConcernConfiguration);
  v6 = -[ASReportAConcernReasonViewController initWithConfiguration:](self, "initWithConfiguration:", v5);

  return v6;
}

- (ASReportAConcernReasonViewController)initWithCoder:(id)a3
{
  ASReportAConcernConfiguration *v4;
  ASReportAConcernReasonViewController *v5;

  v4 = objc_alloc_init(ASReportAConcernConfiguration);
  v5 = -[ASReportAConcernReasonViewController initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (ASReportAConcernReasonViewController)initWithConfiguration:(id)a3
{
  id v5;
  ASReportAConcernReasonViewController *v6;
  ASReportAConcernReasonViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASReportAConcernReasonViewController;
  v6 = -[ASReportAConcernReasonViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  ASReportAConcernReasonDataSource *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)ASReportAConcernReasonViewController;
  -[ASReportAConcernReasonViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  -[ASReportAConcernReasonViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backTitle"));
  v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setBackBarButtonItem:", v8);

  v10 = objc_alloc((Class)UIBarButtonItem);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController configuration](self, "configuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cancelTitle"));
  v13 = objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, self, "cancelPressed:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  v15 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v15, "setDelegate:", self);
  v16 = -[ASReportAConcernReasonDataSource initWithTableView:]([ASReportAConcernReasonDataSource alloc], "initWithTableView:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController configuration](self, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reasons"));
  -[ASReportAConcernReasonDataSource setReasons:](v16, "setReasons:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController configuration](self, "configuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectReasonTitle"));
  -[ASReportAConcernReasonDataSource setSelectReasonTitle:](v16, "setSelectReasonTitle:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController configuration](self, "configuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectReasonSubtitle"));
  -[ASReportAConcernReasonDataSource setSelectReasonSubtitle:](v16, "setSelectReasonSubtitle:", v22);

  objc_msgSend(v15, "setDataSource:", v16);
  -[ASReportAConcernReasonViewController setDataSource:](self, "setDataSource:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController view](self, "view"));
  objc_msgSend(v23, "addSubview:", v15);

  -[ASReportAConcernReasonViewController setTableView:](self, "setTableView:", v15);
}

- (void)viewWillLayoutSubviews
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASReportAConcernReasonViewController;
  -[ASReportAConcernReasonViewController viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)cancelPressed:(id)a3
{
  -[ASReportAConcernReasonViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  ASReportAConcernDetailsViewController *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reasons"));
  v9 = objc_msgSend(v6, "row");

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController configuration](self, "configuration"));
  v11 = objc_msgSend(v10, "copy");

  v12 = -[ASReportAConcernDetailsViewController initWithConfiguration:]([ASReportAConcernDetailsViewController alloc], "initWithConfiguration:", v11);
  -[ASReportAConcernDetailsViewController setSelectedReason:](v12, "setSelectedReason:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController completion](self, "completion"));
  -[ASReportAConcernDetailsViewController setCompletion:](v12, "setCompletion:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonViewController navigationController](self, "navigationController"));
  objc_msgSend(v14, "pushViewController:animated:", v12, 1);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ASReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (ASReportAConcernReasonDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
