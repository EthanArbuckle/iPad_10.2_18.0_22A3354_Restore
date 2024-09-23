@implementation MRUDiffableDataSource

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return self->_supportsReordering;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v7 = a5;
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewDiffableDataSource snapshot](self, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUDiffableDataSource delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "item");

  if (v11)
  {
    if (v8 && (objc_msgSend(v12, "isEqualToString:", v8) & 1) == 0)
    {
      objc_msgSend(v9, "moveItemWithIdentifier:afterItemWithIdentifier:", v12, v8);
      -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self, "applySnapshot:animatingDifferences:", v9, 0);
      objc_msgSend(v10, "dataSource:moveItemWithIdentifier:aferIndentifier:", self, v12, v8);
    }
  }
  else
  {
    objc_msgSend(v9, "moveItemWithIdentifier:beforeItemWithIdentifier:", v12, v8);
    -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self, "applySnapshot:animatingDifferences:", v9, 0);
    objc_msgSend(v10, "dataSource:moveItemToTopWithIdentifier:", self, v12);
  }

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return self->_supportsEditing;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self, "itemIdentifierForIndexPath:", a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[UITableViewDiffableDataSource snapshot](self, "snapshot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteItemsWithIdentifiers:", v8);

      -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self, "applySnapshot:animatingDifferences:", v7, 0);
      -[MRUDiffableDataSource delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataSource:didDeleteItemWithIdentifier:", self, v6);

    }
  }
}

- (MRUDiffableDataSourceDelegate)delegate
{
  return (MRUDiffableDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)supportsReordering
{
  return self->_supportsReordering;
}

- (void)setSupportsReordering:(BOOL)a3
{
  self->_supportsReordering = a3;
}

- (BOOL)supportsEditing
{
  return self->_supportsEditing;
}

- (void)setSupportsEditing:(BOOL)a3
{
  self->_supportsEditing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
