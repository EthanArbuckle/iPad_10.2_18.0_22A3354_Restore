@implementation AAUICustodiansListViewController

- (AAUICustodiansListViewController)initWithContacts:(id)a3
{
  id v4;
  AAUIOBCustodiansListViewModel *v5;
  AAUIOBCustodiansListViewModel *viewModel;
  AAUIOBCustodiansListViewModel *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[AAUIOBCustodiansListViewModel initWithContacts:]([AAUIOBCustodiansListViewModel alloc], "initWithContacts:", v4);

  viewModel = self->_viewModel;
  self->_viewModel = v5;

  v7 = self->_viewModel;
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodiansListViewController;
  return -[AAUIOBTableWelcomeController initWithViewModel:](&v9, sel_initWithViewModel_, v7);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUICustodiansListViewController;
  -[AAUIOBTableWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[AAUICustodiansListViewController _setupTableView](self, "_setupTableView");
}

- (void)_setupTableView
{
  void *v3;
  id v4;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AAOBCustodiansListViewModel contacts](self->_viewModel, "contacts", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  AAUITrustedContactCell *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("CustodiansListCell"));
  v7 = (AAUITrustedContactCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[AAUITrustedContactCell initWithStyle:reuseIdentifier:]([AAUITrustedContactCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("CustodiansListCell"));
  -[AAOBCustodiansListViewModel contacts](self->_viewModel, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUICustodiansListViewController _pictureStore](self, "_pictureStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUITrustedContactCell updateWithContact:pictureStore:](v7, "updateWithContact:pictureStore:", v10, v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (id)_pictureStore
{
  AAUIProfilePictureStore *pictureStore;
  AAUIProfilePictureStore *v4;
  AAUIProfilePictureStore *v5;

  pictureStore = self->_pictureStore;
  if (!pictureStore)
  {
    v4 = (AAUIProfilePictureStore *)objc_opt_new();
    v5 = self->_pictureStore;
    self->_pictureStore = v4;

    pictureStore = self->_pictureStore;
  }
  return pictureStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
