@implementation ServiceBridgedNavigationController

+ (id)sharedController
{
  if (qword_100063348 != -1)
    dispatch_once(&qword_100063348, &stru_100049E08);
  return (id)qword_100063340;
}

- (ServiceBridgedNavigationController)init
{
  ServiceBridgedNavigationController *v2;
  NSMutableArray *v3;
  NSMutableArray *containerViewControllers;
  ServiceBridgedNavigationItem *v5;
  ServiceBridgedNavigationItem *bridgedNavigationItem;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ServiceBridgedNavigationController;
  v2 = -[ServiceBridgedNavigationController init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    containerViewControllers = v2->_containerViewControllers;
    v2->_containerViewControllers = v3;

    v5 = objc_alloc_init(ServiceBridgedNavigationItem);
    bridgedNavigationItem = v2->_bridgedNavigationItem;
    v2->_bridgedNavigationItem = v5;

  }
  return v2;
}

- (void)setupWithContainerViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ServiceBridgedNavigationController removeAllContainerViewControllers](self, "removeAllContainerViewControllers");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)synchonrizeContinainerViewControllers
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers"));
  v4 = objc_msgSend(v3, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentViewController", (_QWORD)v13));

        if (!v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers"));
          objc_msgSend(v12, "removeObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)removeAllContainerViewControllers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers"));
  objc_msgSend(v2, "removeAllObjects");

}

- (id)topViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = objc_opt_class(SUNavigationContainerViewController);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers"));
    objc_msgSend(v7, "addObject:", v9);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController proxyHandler](self, "proxyHandler"));
    objc_msgSend(v8, "pushBridgedViewController:animated:", v9, v4);

  }
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers")),
        v7 = (uint64_t)objc_msgSend(v6, "indexOfObject:", v5),
        v6,
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers"));
    v9 = (char *)objc_msgSend(v8, "count") - v7 - 1;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController containerViewControllers](self, "containerViewControllers"));
    objc_msgSend(v10, "removeObjectsInRange:", v7 + 1, v9);

  }
  else
  {
    -[ServiceBridgedNavigationController removeAllContainerViewControllers](self, "removeAllContainerViewControllers");
    v7 = -1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationController proxyHandler](self, "proxyHandler"));
  objc_msgSend(v11, "popBridgedViewControllersToIndex:", v7);

  return 0;
}

- (ServiceBridgedNavigationControllerProxy)proxyHandler
{
  return (ServiceBridgedNavigationControllerProxy *)objc_loadWeakRetained((id *)&self->_proxyHandler);
}

- (void)setProxyHandler:(id)a3
{
  objc_storeWeak((id *)&self->_proxyHandler, a3);
}

- (ServiceBridgedNavigationItem)bridgedNavigationItem
{
  return self->_bridgedNavigationItem;
}

- (NSMutableArray)containerViewControllers
{
  return self->_containerViewControllers;
}

- (void)setContainerViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewControllers, 0);
  objc_storeStrong((id *)&self->_bridgedNavigationItem, 0);
  objc_destroyWeak((id *)&self->_proxyHandler);
}

@end
