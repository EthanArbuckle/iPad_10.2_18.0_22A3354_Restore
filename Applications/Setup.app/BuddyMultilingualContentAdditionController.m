@implementation BuddyMultilingualContentAdditionController

- (BuddyMultilingualContentAdditionController)initWithChoseableDataStore:(id)a3 selectionCallback:(id)a4
{
  id v5;
  BuddyMultilingualContentAdditionController *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  BuddyMultilingualContentAdditionController *v17;
  objc_super v19;
  id v20;
  id location[2];
  id v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v5 = v22;
  v22 = 0;
  v19.receiver = v5;
  v19.super_class = (Class)BuddyMultilingualContentAdditionController;
  v6 = -[BuddyMultilingualContentAdditionController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", 0, 0);
  v22 = v6;
  objc_storeStrong(&v22, v6);
  if (v6)
  {
    v7 = objc_msgSend(location[0], "mutableCopy");
    v8 = (void *)*((_QWORD *)v22 + 1);
    *((_QWORD *)v22 + 1) = v7;

    v9 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v10 = (void *)*((_QWORD *)v22 + 2);
    *((_QWORD *)v22 + 2) = v9;

    objc_msgSend(*((id *)v22 + 2), "setDelegate:", v22);
    objc_msgSend(*((id *)v22 + 2), "setDataSource:", v22);
    v11 = objc_msgSend(v20, "copy");
    v12 = (void *)*((_QWORD *)v22 + 3);
    *((_QWORD *)v22 + 3) = v11;

    v13 = objc_msgSend(v22, "view");
    v14 = objc_msgSend(v22, "tableView");
    objc_msgSend(v13, "addSubview:", v14);

    objc_msgSend(*((id *)v22 + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)*((_QWORD *)v22 + 2);
    v16 = objc_msgSend(v22, "view");
    objc_msgSend(v15, "pinToEdges:", v16);

  }
  v17 = (BuddyMultilingualContentAdditionController *)v22;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v22, 0);
  return v17;
}

- (void)viewWillAppear:(BOOL)a3
{
  UITableView *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyMultilingualContentAdditionController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualContentAdditionController;
  -[BuddyMultilingualContentAdditionController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyMultilingualContentAdditionController tableView](v7, "tableView");
  -[UITableView reloadData](v3, "reloadData");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSMutableArray *v5;
  id v6;
  id location[2];
  BuddyMultilingualContentAdditionController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[BuddyMultilingualContentAdditionController dataStore](v9, "dataStore", a4);
  v6 = -[NSMutableArray count](v5, "count");

  objc_storeStrong(location, 0);
  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id location[2];
  BuddyMultilingualContentAdditionController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("com.purpleBuddy.BuddyMultilingualAdditionCell"));
  if (!v13)
  {
    v13 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("com.purpleBuddy.BuddyMultilingualAdditionCell"));

  }
  v5 = -[BuddyMultilingualContentAdditionController dataStore](v16, "dataStore");
  v12 = -[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", objc_msgSend(v14, "row"));

  v6 = objc_msgSend(v12, "title");
  v7 = objc_msgSend(v13, "textLabel");
  objc_msgSend(v7, "setText:", v6);

  v8 = objc_msgSend(v12, "detailText");
  v9 = objc_msgSend(v13, "detailTextLabel");
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v13, "setSelectionStyle:", 2);
  v10 = v13;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void (**v8)(id, id);
  UITableView *v9;
  id v10;
  id v11;
  id location[2];
  BuddyMultilingualContentAdditionController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v5 = -[BuddyMultilingualContentAdditionController selectionCallBack](v13, "selectionCallBack");

  if (v5)
  {
    v6 = -[BuddyMultilingualContentAdditionController dataStore](v13, "dataStore");
    v10 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));

    v7 = -[BuddyMultilingualContentAdditionController dataStore](v13, "dataStore");
    -[NSMutableArray removeObjectAtIndex:](v7, "removeObjectAtIndex:", objc_msgSend(v11, "row"));

    v8 = (void (**)(id, id))-[BuddyMultilingualContentAdditionController selectionCallBack](v13, "selectionCallBack");
    v8[2](v8, v10);

    v9 = -[BuddyMultilingualContentAdditionController tableView](v13, "tableView");
    -[UITableView reloadData](v9, "reloadData");

    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (NSMutableArray)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (id)selectionCallBack
{
  return self->_selectionCallBack;
}

- (void)setSelectionCallBack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionCallBack, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
