@implementation HUTableViewDiffableDataSource

- (HUTableViewDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 delegate:(id)a5
{
  HUTableViewDiffableDataSourceDelegate **p_delegate;
  id v9;
  id v10;
  HUTableViewDiffableDataSource *v11;
  objc_super v13;

  p_delegate = &self->_delegate;
  v9 = a4;
  v10 = a3;
  objc_storeWeak((id *)p_delegate, a5);
  v13.receiver = self;
  v13.super_class = (Class)HUTableViewDiffableDataSource;
  v11 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](&v13, sel_initWithTableView_cellProvider_, v10, v9);

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HUTableViewDiffableDataSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HUTableViewDiffableDataSource delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView:titleForHeaderInSection:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HUTableViewDiffableDataSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HUTableViewDiffableDataSource delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView:titleForFooterInSection:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[HUTableViewDiffableDataSource delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HUTableViewDiffableDataSource delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "tableView:canEditRowAtIndexPath:", v6, v7);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[HUTableViewDiffableDataSource delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HUTableViewDiffableDataSource delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "tableView:canMoveRowAtIndexPath:", v6, v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[HUTableViewDiffableDataSource delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[HUTableViewDiffableDataSource delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:commitEditingStyle:forRowAtIndexPath:", v12, a4, v8);

  }
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[HUTableViewDiffableDataSource delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HUTableViewDiffableDataSource delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tableView:moveRowAtIndexPath:toIndexPath:", v13, v8, v9);

  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  unsigned __int8 v3;
  void *v4;
  objc_super v6;

  if (sel_tableView_commitEditingStyle_forRowAtIndexPath_ == a3)
  {
    -[HUTableViewDiffableDataSource delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HUTableViewDiffableDataSource;
    v3 = -[HUTableViewDiffableDataSource respondsToSelector:](&v6, sel_respondsToSelector_, a3);
  }
  return v3 & 1;
}

- (HUTableViewDiffableDataSourceDelegate)delegate
{
  return (HUTableViewDiffableDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
