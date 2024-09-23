@implementation CPSDataSource

- (CPSDataSource)init
{
  CPSDataSource *v3;
  CPSDataSource *v4;
  objc_super v5;
  SEL v6;
  CPSDataSource *v7;

  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSDataSource;
  v4 = -[CPSDataSource init](&v5, sel_init);
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4)
    v7->_rowAnimation = 5;
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (void)setTableView:(id)a3
{
  id location[2];
  CPSDataSource *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_tableView, location[0]);
  if (location[0])
    objc_msgSend(location[0], "setDataSource:", v4);
  objc_storeStrong(location, 0);
}

- (id)itemAtIndexPath:(id)a3
{
  id location;
  SEL v5;
  CPSDataSource *v6;

  v6 = self;
  v5 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  -[CPSDataSource doesNotRecognizeSelector:](v6, "doesNotRecognizeSelector:", v5);
  objc_storeStrong(&location, 0);
  return 0;
}

- (int64_t)numberOfSections
{
  -[CPSDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a2, self);
  return 0;
}

- (int64_t)numberOfItems
{
  -[CPSDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a2, self);
  return 0;
}

- (NSIndexPath)firstItemIndexPath
{
  -[CPSDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a2, self);
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  -[CPSDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4;
  id location[2];
  CPSDataSource *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSDataSource numberOfSections](v6, "numberOfSections");
  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v6;
  id location[2];
  CPSDataSource *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[CPSDataSource numberOfItemsInSection:](v8, "numberOfItemsInSection:", a4);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void (**v6)(id, id, id, id);
  uint64_t (**v7)(id, id, id, id);
  id v8;
  id v10;
  id v11;
  id v12;
  id location[2];
  CPSDataSource *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = -[CPSDataSource itemAtIndexPath:](v14, "itemAtIndexPath:", v12);
  v7 = (uint64_t (**)(id, id, id, id))-[CPSDataSource cellCreateBlock](v14, "cellCreateBlock");
  v10 = (id)v7[2](v7, v11, v12, location[0]);

  v8 = -[CPSDataSource cellConfigureBlock](v14, "cellConfigureBlock");
  if (v8)
  {
    v6 = (void (**)(id, id, id, id))-[CPSDataSource cellConfigureBlock](v14, "cellConfigureBlock");
    v6[2](v6, v10, v11, v12);

  }
  v5 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  id location;
  SEL v5;
  CPSDataSource *v6;

  v6 = self;
  v5 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  -[CPSDataSource doesNotRecognizeSelector:](v6, "doesNotRecognizeSelector:", v5);
  objc_storeStrong(&location, 0);
  return 0;
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  UITableView *v3;
  id location[2];
  CPSDataSource *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSDataSource tableView](v5, "tableView");
  -[UITableView insertRowsAtIndexPaths:withRowAnimation:](v3, "insertRowsAtIndexPaths:withRowAnimation:", location[0], -[CPSDataSource rowAnimation](v5, "rowAnimation"));

  objc_storeStrong(location, 0);
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  UITableView *v3;
  id location[2];
  CPSDataSource *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSDataSource tableView](v5, "tableView");
  -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](v3, "deleteRowsAtIndexPaths:withRowAnimation:", location[0], -[CPSDataSource rowAnimation](v5, "rowAnimation"));

  objc_storeStrong(location, 0);
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
  UITableView *v3;
  id location[2];
  CPSDataSource *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSDataSource tableView](v5, "tableView");
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v3, "reloadRowsAtIndexPaths:withRowAnimation:", location[0], -[CPSDataSource rowAnimation](v5, "rowAnimation"));

  objc_storeStrong(location, 0);
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  UITableView *v5;
  id v6;
  id location[2];
  CPSDataSource *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[CPSDataSource tableView](v8, "tableView");
  -[UITableView moveRowAtIndexPath:toIndexPath:](v5, "moveRowAtIndexPath:toIndexPath:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSectionsAtIndexes:(id)a3
{
  UITableView *v3;
  id location[2];
  CPSDataSource *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSDataSource tableView](v5, "tableView");
  -[UITableView insertSections:withRowAnimation:](v3, "insertSections:withRowAnimation:", location[0], -[CPSDataSource rowAnimation](v5, "rowAnimation"));

  objc_storeStrong(location, 0);
}

- (void)deleteSectionsAtIndexes:(id)a3
{
  UITableView *v3;
  id location[2];
  CPSDataSource *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSDataSource tableView](v5, "tableView");
  -[UITableView deleteSections:withRowAnimation:](v3, "deleteSections:withRowAnimation:", location[0], -[CPSDataSource rowAnimation](v5, "rowAnimation"));

  objc_storeStrong(location, 0);
}

- (void)reloadData
{
  UITableView *v2;

  v2 = -[CPSDataSource tableView](self, "tableView");
  -[UITableView reloadData](v2, "reloadData");

}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (int64_t)rowAnimation
{
  return self->_rowAnimation;
}

- (void)setRowAnimation:(int64_t)a3
{
  self->_rowAnimation = a3;
}

- (id)cellConfigureBlock
{
  return self->_cellConfigureBlock;
}

- (void)setCellConfigureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)cellCreateBlock
{
  return self->_cellCreateBlock;
}

- (void)setCellCreateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellCreateBlock, 0);
  objc_storeStrong(&self->_cellConfigureBlock, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end
