@implementation AUUITableViewController

- (void)initAUUITableViewControllerCommon
{
  TableViewManager *v3;
  const char *v4;

  if (!self->_tableManager)
  {
    v3 = objc_alloc_init(TableViewManager);
    self->_tableManager = v3;
    objc_msgSend_setDelegate_(v3, v4, (uint64_t)self);
  }
}

- (AUUITableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AUUITableViewController *v4;
  const char *v5;
  uint64_t v6;
  AUUITableViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AUUITableViewController;
  v4 = -[AUUITableViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  v7 = v4;
  if (v4)
    objc_msgSend_initAUUITableViewControllerCommon(v4, v5, v6);
  return v7;
}

- (AUUITableViewController)initWithCoder:(id)a3
{
  AUUITableViewController *v3;
  const char *v4;
  uint64_t v5;
  AUUITableViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AUUITableViewController;
  v3 = -[AUUITableViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
  v6 = v3;
  if (v3)
    objc_msgSend_initAUUITableViewControllerCommon(v3, v4, v5);
  return v6;
}

- (void)dealloc
{
  const char *v3;
  objc_super v4;

  objc_msgSend_setTableView_(self, a2, 0);
  objc_msgSend_setDelegate_(self->_tableManager, v3, 0);

  self->_tableManager = 0;
  v4.receiver = self;
  v4.super_class = (Class)AUUITableViewController;
  -[AUUITableViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AUUITableViewController;
  -[AUUITableViewController loadView](&v10, sel_loadView);
  v5 = objc_msgSend_tableView(self, v3, v4);
  v8 = (void *)objc_msgSend_tableManager(self, v6, v7);
  objc_msgSend_setManagedTableView_(v8, v9, v5);
}

- (void)setTableView:(id)a3
{
  const char *v5;
  objc_super v6;

  objc_msgSend_initAUUITableViewControllerCommon(self, a2, (uint64_t)a3);
  objc_msgSend_setManagedTableView_(self->_tableManager, v5, (uint64_t)a3);
  v6.receiver = self;
  v6.super_class = (Class)AUUITableViewController;
  -[AUUITableViewController setTableView:](&v6, sel_setTableView_, a3);
}

- (TableViewManagerDelegate)delegate
{
  uint64_t v2;

  return (TableViewManagerDelegate *)objc_msgSend_delegate(self->_tableManager, a2, v2);
}

- (void)setDelegate:(id)a3
{
  const char *v5;

  objc_msgSend_initAUUITableViewControllerCommon(self, a2, (uint64_t)a3);
  objc_msgSend_setDelegate_(self->_tableManager, v5, (uint64_t)a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend_viewWillAppear_(self->_tableManager, a2, a3);
  v5.receiver = self;
  v5.super_class = (Class)AUUITableViewController;
  -[AUUITableViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend_viewWillDisappear_(self->_tableManager, a2, a3);
  v5.receiver = self;
  v5.super_class = (Class)AUUITableViewController;
  -[AUUITableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (TableViewManager)tableManager
{
  return self->_tableManager;
}

@end
