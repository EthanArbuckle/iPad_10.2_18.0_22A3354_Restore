@implementation HSUserListViewController

- (HSUserListViewController)init
{
  HSUserListViewController *v2;
  id v3;
  void *v4;
  HUUserListTableManager *v5;
  HUUserListTableManager *tableViewManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSUserListViewController;
  v2 = -[HSUserListViewController initWithStyle:](&v8, "initWithStyle:", 1);
  if (v2)
  {
    v3 = objc_alloc((Class)HUUserListTableManager);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController tableView](v2, "tableView"));
    v5 = (HUUserListTableManager *)objc_msgSend(v3, "initWithTableView:viewController:", v4, v2);
    tableViewManager = v2->_tableViewManager;
    v2->_tableViewManager = v5;

    -[HUUserListTableManager setDelegate:](v2->_tableViewManager, "setDelegate:", v2);
  }
  return v2;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSUserListViewController;
  -[HSUserListViewController viewDidLoad](&v5, "viewDidLoad");
  -[HSUserListViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneTapped");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HSUserListViewController;
  -[HSUserListViewController setEditing:animated:](&v12, "setEditing:animated:", a3, a4);
  if (v4)
  {
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100042964;
    v11[3] = &unk_1000A10A8;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000429CC;
    v10[3] = &unk_1000A2E28;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v10, 0.3);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController navigationItem](self, "navigationItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftBarButtonItem"));
    objc_msgSend(v7, "setEnabled:", 1);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100042A18;
    v9[3] = &unk_1000A10A8;
    v9[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.3);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController tableViewManager](self, "tableViewManager"));
  objc_msgSend(v8, "setEditing:", v4);

}

- (HMHome)home
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController tableViewManager](self, "tableViewManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));

  return (HMHome *)v3;
}

- (void)setHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController tableViewManager](self, "tableViewManager"));
  objc_msgSend(v5, "setHome:", v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if (v8)
  {
    -[HSUserListViewController setTitle:](self, "setTitle:", v8);
  }
  else
  {
    v6 = sub_1000593D8(CFSTR("HSUserManagementSharingTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[HSUserListViewController setTitle:](self, "setTitle:", v7);

  }
}

- (void)updateHome:(id)a3
{
  -[HSUserListViewController setHome:](self, "setHome:", a3);
  -[HSUserListViewController _updateEditButton](self, "_updateEditButton");
}

- (void)managerDidDismissWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSUserListViewController delegate](self, "delegate"));
  objc_msgSend(v5, "controllerDidDismissWithError:", v4);

}

- (void)managerDidSendInvitations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSUserListViewController delegate](self, "delegate"));
  objc_msgSend(v5, "controllerDidSendInvitations:", v4);

}

- (void)managerDidUpdateUserList
{
  -[HSUserListViewController _updateEditButton](self, "_updateEditButton");
}

- (void)managerDidRemoveUser:(id)a3 error:(id)a4
{
  if (-[HSUserListViewController _isUserListEmpty](self, "_isUserListEmpty", a3, a4))
  {
    if (-[HSUserListViewController isEditing](self, "isEditing"))
      -[HSUserListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
}

- (void)managerDidCancelInvite:(id)a3 error:(id)a4
{
  if (-[HSUserListViewController _isUserListEmpty](self, "_isUserListEmpty", a3, a4))
  {
    if (-[HSUserListViewController isEditing](self, "isEditing"))
      -[HSUserListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
}

- (void)_doneTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HSUserListViewController delegate](self, "delegate"));
  objc_msgSend(v2, "controllerDidDismissWithError:", 0);

}

- (BOOL)_isUserListEmpty
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController tableViewManager](self, "tableViewManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "users"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController tableViewManager](self, "tableViewManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitations"));
    v5 = objc_msgSend(v7, "count") == 0;

  }
  return v5;
}

- (void)_updateEditButton
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HSUserListViewController navigationItem](self, "navigationItem"));
  if (-[HSUserListViewController _isUserListEmpty](self, "_isUserListEmpty"))
  {
    objc_msgSend(v4, "setRightBarButtonItem:animated:", 0, 1);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserListViewController editButtonItem](self, "editButtonItem"));
    objc_msgSend(v4, "setRightBarButtonItem:animated:", v3, 1);

  }
}

- (HSUserListViewControllerDelegate)delegate
{
  return (HSUserListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUUserListTableManager)tableViewManager
{
  return self->_tableViewManager;
}

- (void)setTableViewManager:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
