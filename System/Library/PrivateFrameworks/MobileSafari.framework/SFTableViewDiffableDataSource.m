@implementation SFTableViewDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id WeakRetained;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "dataSource:headerTextForSection:", self, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id WeakRetained;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "dataSource:footerTextForSection:", self, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sectionIndexTitlesForDataSource:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id WeakRetained;
  int64_t v9;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(WeakRetained, "dataSource:sectionForSectionIndexTitle:atIndex:", self, v7, a5);
  else
    v9 = 0;

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "dataSource:commitEditingStyle:forItemIdentifier:", self, a4, v8);

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(WeakRetained, "dataSource:canEditRowAtIndexPath:", self, v5);
  else
    v7 = 0;

  return v7;
}

- (SFTableViewDiffableDataSourceDelegate)delegate
{
  return (SFTableViewDiffableDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
