@implementation ServiceAlertController

- (ServiceAlertController)initWithRemoteViewControllerProxy:(id)a3
{
  id v5;
  ServiceAlertController *v6;
  ServiceAlertController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ServiceAlertController;
  v6 = -[ServiceAlertController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_remoteViewControllerProxy, a3);

  return v7;
}

- (void)dealloc
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_alertViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "setDelegate:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ServiceAlertController;
  -[ServiceAlertController dealloc](&v8, "dealloc");
}

- (void)presentAlertForDialog:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id AssociatedObject;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSMutableArray *alertViews;
  NSMutableArray *v22;
  NSMutableArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_alertViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v5);
      AssociatedObject = objc_getAssociatedObject(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "com.apple.ios.StoreKitUIService.dialog");
      v11 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
      v12 = objc_msgSend(v4, "isEqual:", v11);

      if ((v12 & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[UIAlertView _alertViewForSessionWithRemoteViewController:](UIAlertView, "_alertViewForSessionWithRemoteViewController:", self->_remoteViewControllerProxy));
    objc_setAssociatedObject(v5, "com.apple.ios.StoreKitUIService.dialog", v4, (void *)1);
    -[NSMutableArray setDelegate:](v5, "setDelegate:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
    -[NSMutableArray setMessage:](v5, "setMessage:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    -[NSMutableArray setTitle:](v5, "setTitle:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buttons"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v19), "title"));
          -[NSMutableArray addButtonWithTitle:](v5, "addButtonWithTitle:", v20);

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);
    }
    alertViews = self->_alertViews;
    if (!alertViews)
    {
      v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v23 = self->_alertViews;
      self->_alertViews = v22;

      alertViews = self->_alertViews;
    }
    -[NSMutableArray addObject:](alertViews, "addObject:", v5);
    -[NSMutableArray show](v5, "show");

  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  id v6;
  id AssociatedObject;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  AssociatedObject = objc_getAssociatedObject(v6, "com.apple.ios.StoreKitUIService.dialog");
  v12 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  -[ServiceAlertController _disconnectFromAlertView:](self, "_disconnectFromAlertView:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAlertController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v8, "alertController:alertDidFinishWithButton:") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buttons"));
    v10 = v9;
    if ((a4 & 0x8000000000000000) == 0 && (unint64_t)objc_msgSend(v9, "count") > a4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", a4));
      objc_msgSend(v8, "alertController:alertDidFinishWithButton:", self, v11);

    }
  }

}

- (void)alertViewCancel:(id)a3
{
  id v4;

  -[ServiceAlertController _disconnectFromAlertView:](self, "_disconnectFromAlertView:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAlertController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "alertController:alertDidFinishWithButton:") & 1) != 0)
    objc_msgSend(v4, "alertController:alertDidFinishWithButton:", self, 0);

}

- (void)_disconnectFromAlertView:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(v6), "instancesRespondToSelector:", "_target"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_target"));

    v6 = (id)v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("_UIViewServiceHostedWindowWillDisconnectNotificationName"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("_UIViewServiceRemoteViewControllerWillDisconnectNotificationName"), 0);
  objc_msgSend(v6, "setDelegate:", 0);
  -[NSMutableArray removeObjectIdenticalTo:](self->_alertViews, "removeObjectIdenticalTo:", v6);

}

- (ServiceAlertDelegate)delegate
{
  return (ServiceAlertDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteViewControllerProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alertViews, 0);
}

@end
