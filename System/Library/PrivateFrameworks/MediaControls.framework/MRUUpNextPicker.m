@implementation MRUUpNextPicker

- (MRUUpNextPicker)initWithFrame:(CGRect)a3 dataSource:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  MRUUpNextPicker *v11;
  MRUUpNextPicker *v12;
  id v13;
  uint64_t v14;
  UITableView *tableView;
  objc_class *v16;
  void *v17;
  MRUDiffableDataSource *v18;
  UITableView *v19;
  id *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  id (*v27)(uint64_t, uint64_t, void *, uint64_t);
  void *v28;
  id *v29;
  id v30;
  objc_super v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MRUUpNextPicker;
  v11 = -[MRUUpNextPicker initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a4);
    -[MRUUpNextDataSource setDelegate:](v12->_dataSource, "setDelegate:", v12);
    v13 = objc_alloc(MEMORY[0x1E0DC3D48]);
    -[MRUUpNextPicker bounds](v12, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    tableView = v12->_tableView;
    v12->_tableView = (UITableView *)v14;

    -[UITableView _setAllowsReorderingWhenNotEditing:](v12->_tableView, "_setAllowsReorderingWhenNotEditing:", 1);
    -[UITableView setDelegate:](v12->_tableView, "setDelegate:", v12);
    -[MRUUpNextPicker addSubview:](v12, "addSubview:", v12->_tableView);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView registerClass:forCellReuseIdentifier:](v12->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), v17);
    v18 = [MRUDiffableDataSource alloc];
    v19 = v12->_tableView;
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __44__MRUUpNextPicker_initWithFrame_dataSource___block_invoke;
    v28 = &unk_1E581C0D0;
    v20 = v12;
    v29 = v20;
    v30 = v17;
    v21 = v17;
    v22 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v18, "initWithTableView:cellProvider:", v19, &v25);
    v23 = v20[54];
    v20[54] = (id)v22;

    objc_msgSend(v20[54], "setDelegate:", v20, v25, v26, v27, v28);
    objc_msgSend(v20[54], "setSupportsEditing:", 1);
    objc_msgSend(v20[54], "setSupportsReordering:", 1);
    objc_msgSend(v20, "updateDiffableDataSourceAnimated:", 0);

  }
  return v12;
}

id __44__MRUUpNextPicker_initWithFrame_dataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "dequeueReusableCellWithIdentifier:forIndexPath:", *(_QWORD *)(a1 + 40), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "configureCell:forSong:", v9, v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "configureCell:forTVEpisode:", v9, v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 32), "configureCell:forMovie:", v9, v8);
    }
  }

  return v9;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUUpNextPicker;
  -[MRUUpNextPicker layoutSubviews](&v3, sel_layoutSubviews);
  -[MRUUpNextPicker bounds](self, "bounds");
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isUserInteractionEnabled"))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 1, 0);

  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUUpNextDataSource playItemWithIdentifier:completion:](self->_dataSource, "playItemWithIdentifier:completion:", v8, 0);
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)dataSource:(id)a3 didDeleteItemWithIdentifier:(id)a4
{
  -[MRUUpNextDataSource removeResponseItemWithIdentifier:completion:](self->_dataSource, "removeResponseItemWithIdentifier:completion:", a4, 0);
}

- (void)dataSource:(id)a3 moveItemToTopWithIdentifier:(id)a4
{
  -[MRUUpNextDataSource moveReponseItemToNextWithIdentifier:completion:](self->_dataSource, "moveReponseItemToNextWithIdentifier:completion:", a4, 0);
}

- (void)dataSource:(id)a3 moveItemWithIdentifier:(id)a4 aferIndentifier:(id)a5
{
  -[MRUUpNextDataSource moveReponseItemWithIdentifier:afterResponseItemWithIdentifier:completion:](self->_dataSource, "moveReponseItemWithIdentifier:afterResponseItemWithIdentifier:completion:", a4, a5, 0);
}

- (void)upNextDataSource:(id)a3 didChangeResponseItemIDs:(id)a4
{
  -[MRUUpNextPicker updateDiffableDataSourceAnimated:](self, "updateDiffableDataSourceAnimated:", 1, a4);
}

- (void)updateDiffableDataSourceAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", &unk_1E5878540);
  -[MRUUpNextDataSource responseItemIDs](self->_dataSource, "responseItemIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendItemsWithIdentifiers:", v5);

  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v6, v3);
}

- (id)reponseItemForIndexPath:(id)a3
{
  void *v4;
  void *v5;

  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUUpNextDataSource objectForKeyedSubscript:](self->_dataSource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)configureCell:(id)a3 forSong:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v5, "album");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v5, "artworkCatalog");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setArtworkCatalog:", v12);
}

- (void)configureCell:(id)a3 forTVEpisode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v5, "show");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v5, "artworkCatalog");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setArtworkCatalog:", v12);
}

- (void)configureCell:(id)a3 forMovie:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v5, "artworkCatalog");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setArtworkCatalog:", v9);
}

- (MRUUpNextDataSource)dataSource
{
  return self->_dataSource;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (MRUDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
