@implementation SUUIReportAConcernReasonViewController

- (SUUIReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIReportAConcernConfiguration *v5;
  SUUIReportAConcernReasonViewController *v6;

  v5 = objc_alloc_init(SUUIReportAConcernConfiguration);
  v6 = -[SUUIReportAConcernReasonViewController initWithConfiguration:](self, "initWithConfiguration:", v5);

  return v6;
}

- (SUUIReportAConcernReasonViewController)initWithCoder:(id)a3
{
  SUUIReportAConcernConfiguration *v4;
  SUUIReportAConcernReasonViewController *v5;

  v4 = objc_alloc_init(SUUIReportAConcernConfiguration);
  v5 = -[SUUIReportAConcernReasonViewController initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (SUUIReportAConcernReasonViewController)initWithConfiguration:(id)a3
{
  id v5;
  SUUIReportAConcernReasonViewController *v6;
  SUUIReportAConcernReasonViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIReportAConcernReasonViewController;
  v6 = -[SUUIReportAConcernReasonViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
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
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  SUUIReportAConcernReasonDataSource *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SUUIReportAConcernReasonViewController;
  -[SUUIReportAConcernReasonViewController viewDidLoad](&v25, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REPORT_A_CONCERN"), &stru_2511FF0C8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernReasonViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_2511FF0C8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, 0, 0);
  -[SUUIReportAConcernReasonViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackBarButtonItem:", v8);

  v10 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_2511FF0C8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, self, sel_cancelPressed_);
  -[SUUIReportAConcernReasonViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  v15 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v16 = (void *)objc_msgSend(v15, "initWithFrame:style:", 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v16, "setDelegate:", self);
  v17 = -[SUUIReportAConcernReasonDataSource initWithTableView:]([SUUIReportAConcernReasonDataSource alloc], "initWithTableView:", v16);
  -[SUUIReportAConcernReasonViewController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reasons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernReasonDataSource setReasons:](v17, "setReasons:", v19);

  -[SUUIReportAConcernReasonViewController configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "selectReasonTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernReasonDataSource setSelectReasonTitle:](v17, "setSelectReasonTitle:", v21);

  -[SUUIReportAConcernReasonViewController configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "selectReasonSubtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernReasonDataSource setSelectReasonSubtitle:](v17, "setSelectReasonSubtitle:", v23);

  objc_msgSend(v16, "setDataSource:", v17);
  -[SUUIReportAConcernReasonViewController setDataSource:](self, "setDataSource:", v17);
  -[SUUIReportAConcernReasonViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v16);

  -[SUUIReportAConcernReasonViewController setTableView:](self, "setTableView:", v16);
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
  v13.super_class = (Class)SUUIReportAConcernReasonViewController;
  -[SUUIReportAConcernReasonViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[SUUIReportAConcernReasonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SUUIReportAConcernReasonViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)cancelPressed:(id)a3
{
  -[SUUIReportAConcernReasonViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SUUIReportAConcernDetailsViewController *v12;
  SUUIReportAConcernMetadata *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[SUUIReportAConcernReasonViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIReportAConcernReasonViewController configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = -[SUUIReportAConcernDetailsViewController initWithConfiguration:]([SUUIReportAConcernDetailsViewController alloc], "initWithConfiguration:", v11);
  v13 = objc_alloc_init(SUUIReportAConcernMetadata);
  -[SUUIReportAConcernMetadata setSelectedReason:](v13, "setSelectedReason:", v17);
  -[SUUIReportAConcernMetadata setItemIdentifier:](v13, "setItemIdentifier:", objc_msgSend(v11, "itemIdentifier"));
  objc_msgSend(v11, "reportConcernURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernMetadata setReportConcernURL:](v13, "setReportConcernURL:", v14);

  -[SUUIReportAConcernDetailsViewController setMetadata:](v12, "setMetadata:", v13);
  -[SUUIReportAConcernReasonViewController completion](self, "completion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernDetailsViewController setCompletion:](v12, "setCompletion:", v15);

  -[SUUIReportAConcernReasonViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushViewController:animated:", v12, 1);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (SUUIReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (SUUIReportAConcernReasonDataSource)dataSource
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
