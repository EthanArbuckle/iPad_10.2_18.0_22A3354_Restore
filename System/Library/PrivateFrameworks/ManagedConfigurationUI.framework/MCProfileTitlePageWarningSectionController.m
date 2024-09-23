@implementation MCProfileTitlePageWarningSectionController

- (MCProfileTitlePageWarningSectionController)initWithWarning:(id)a3
{
  id v5;
  MCProfileTitlePageWarningSectionController *v6;
  MCProfileTitlePageWarningSectionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCProfileTitlePageWarningSectionController;
  v6 = -[MCProfileTitlePageWarningSectionController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_warning, a3);

  return v7;
}

- (void)registerCellClassWithTableView:(id)a3
{
  id v4;

  v4 = a3;
  -[MCProfileTitlePageWarningSectionController setTableView:](self, "setTableView:", v4);
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("warningCell"));

}

- (id)cellForRowAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MCProfileTitlePageWarningSectionController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCProfileTitlePageWarningSectionController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("warningCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCProfileTitlePageWarningSectionController warning](self, "warning");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

  }
  else
  {
    v6 = (void *)objc_opt_new();
  }
  return v6;
}

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)titleForHeader
{
  void *v2;
  void *v3;

  -[MCProfileTitlePageWarningSectionController warning](self, "warning");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)heightForRowAtIndex:(unint64_t)a3
{
  return *MEMORY[0x1E0CEBC10];
}

- (double)heightForHeader
{
  int v2;
  double result;

  v2 = MCUIIsiPhone();
  result = 50.0;
  if (v2)
    return 40.0;
  return result;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (MCProfileWarning)warning
{
  return self->_warning;
}

- (void)setWarning:(id)a3
{
  objc_storeStrong((id *)&self->_warning, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warning, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end
