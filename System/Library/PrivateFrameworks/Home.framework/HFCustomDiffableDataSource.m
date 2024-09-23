@implementation HFCustomDiffableDataSource

- (HFCustomDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (HFCustomDiffableDataSource)init
{
  HFCustomDiffableDataSource *v2;
  HFCustomDiffableDataSourceSnapshot *v3;
  HFCustomDiffableDataSourceSnapshot *snapshot;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFCustomDiffableDataSource;
  v2 = -[HFCustomDiffableDataSource init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HFCustomDiffableDataSourceSnapshot);
    snapshot = v2->_snapshot;
    v2->_snapshot = v3;

  }
  return v2;
}

- (void)setSections:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFCustomDiffableDataSource snapshot](self, "snapshot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSections:", v4);

}

- (NSArray)sections
{
  void *v2;
  void *v3;

  -[HFCustomDiffableDataSource snapshot](self, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCustomDiffableDataSource.m"), 95, CFSTR("%@:%@ Should NOT be called, this ItemManager does not support diffable"), self, v8);

}

- (id)itemIdentifierForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  -[HFCustomDiffableDataSource sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v12 = 0;
  }
  else
  {
    -[HFCustomDiffableDataSource sections](self, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "item") < 0 || (v11 = objc_msgSend(v4, "item"), v11 >= objc_msgSend(v10, "count")))
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v12;
}

- (id)indexPathForItemIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[HFCustomDiffableDataSource _sectionForItem:assertOnNotFound:](self, "_sectionForItem:assertOnNotFound:", v4, 0);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    -[HFCustomDiffableDataSource sections](self, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCustomDiffableDataSource _indexPathForItem:inDisplayedItemsArray:](self, "_indexPathForItem:inDisplayedItemsArray:", v4, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)_sectionForItem:(id)a3
{
  return -[HFCustomDiffableDataSource _sectionForItem:assertOnNotFound:](self, "_sectionForItem:assertOnNotFound:", a3, 1);
}

- (unint64_t)_sectionForItem:(id)a3 assertOnNotFound:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;

  v4 = a4;
  v7 = a3;
  -[HFCustomDiffableDataSource sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __63__HFCustomDiffableDataSource__sectionForItem_assertOnNotFound___block_invoke;
  v16 = &unk_1EA734D68;
  v9 = v7;
  v17 = v9;
  v10 = objc_msgSend(v8, "indexOfObjectPassingTest:", &v13);

  if (v4 && v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCustomDiffableDataSource.m"), 142, CFSTR("Could not find section for item: %@"), v9, v13, v14, v15, v16);

  }
  return v10;
}

uint64_t __63__HFCustomDiffableDataSource__sectionForItem_assertOnNotFound___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_indexPathForItem:(id)a3 inDisplayedItemsArray:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v7
    && (v8 = -[HFCustomDiffableDataSource _sectionForItem:](self, "_sectionForItem:", v6),
        v9 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v6),
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)supplementaryViewProvider
{
  return 0;
}

- (void)setSupplementaryViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong(&self->supplementaryViewProvider, 0);
}

@end
