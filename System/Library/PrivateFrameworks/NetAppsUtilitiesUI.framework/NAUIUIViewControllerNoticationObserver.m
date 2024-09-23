@implementation NAUIUIViewControllerNoticationObserver

- (NAUIUIViewControllerNoticationObserver)init
{
  NAUIUIViewControllerNoticationObserver *v2;
  uint64_t v3;
  NSMutableArray *observations;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NAUIUIViewControllerNoticationObserver;
  v2 = -[NAUIUIViewControllerNoticationObserver init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    observations = v2->_observations;
    v2->_observations = (NSMutableArray *)v3;

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v2->_observations;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDF75D0];
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __46__NAUIUIViewControllerNoticationObserver_init__block_invoke;
    v18[3] = &unk_24D612608;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v8, 0, v7, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v6, "addObject:", v10);

    v11 = v2->_observations;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BDF7528];
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __46__NAUIUIViewControllerNoticationObserver_init__block_invoke_2;
    v16[3] = &unk_24D612608;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v13, 0, v12, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v11, "addObject:", v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __46__NAUIUIViewControllerNoticationObserver_init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "naui_applicationWillEnterForeground");

}

void __46__NAUIUIViewControllerNoticationObserver_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "naui_applicationDidEnterBackground");

}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_observations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)NAUIUIViewControllerNoticationObserver;
  -[NAUIUIViewControllerNoticationObserver dealloc](&v10, sel_dealloc);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_observations, 0);
}

@end
