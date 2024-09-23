@implementation HUConfigurator

- (HUConfigurator)initWithConfiguratorDelegate:(id)a3 initialViewController:(id)a4
{
  id v6;
  id v7;
  HUConfigurator *v8;
  HUConfigurator *v9;
  NSMutableArray *v10;
  NSMutableArray *displayedViewControllers;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUConfigurator;
  v8 = -[HUConfigurator init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_configuratorDelegate, v6);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    displayedViewControllers = v9->_displayedViewControllers;
    v9->_displayedViewControllers = v10;

    -[HUConfigurator _addViewControllerToDisplay:](v9, "_addViewControllerToDisplay:", v7);
  }

  return v9;
}

- (HUConfigurationViewController)currentViewController
{
  void *v2;
  void *v3;

  -[HUConfigurator displayedViewControllers](self, "displayedViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUConfigurationViewController *)v3;
}

- (void)pushViewControllerForResults:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  -[HUConfigurator _nextViewControllerForResults:](self, "_nextViewControllerForResults:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HUConfigurator_pushViewControllerForResults___block_invoke;
  v6[3] = &unk_1E6F4C610;
  v6[4] = self;
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v6);

}

void __47__HUConfigurator_pushViewControllerForResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_opt_class();
  v11 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v11;
  else
    v4 = 0;
  v5 = v4;

  v6 = v5;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF244B50))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9, "_addViewControllerToDisplay:", v8);
    objc_msgSend(*(id *)(a1 + 32), "configuratorDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuratorDidUpdateViewController:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v9, "configuratorDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuratorDidFinish:", *(_QWORD *)(a1 + 32));
  }

}

- (void)viewController:(id)a3 didFinishWithConfigurationResults:(id)a4
{
  -[HUConfigurator pushViewControllerForResults:](self, "pushViewControllerForResults:", a4);
}

- (id)_nextViewControllerForResults:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3);
}

- (void)_addViewControllerToDisplay:(id)a3
{
  -[NSMutableArray addObject:](self->_displayedViewControllers, "addObject:", a3);
}

- (void)_removeDisplayedViewController
{
  if ((unint64_t)-[NSMutableArray count](self->_displayedViewControllers, "count") >= 2)
    -[NSMutableArray removeLastObject](self->_displayedViewControllers, "removeLastObject");
}

- (HUConfiguratorDelegate)configuratorDelegate
{
  return (HUConfiguratorDelegate *)objc_loadWeakRetained((id *)&self->_configuratorDelegate);
}

- (void)setConfiguratorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configuratorDelegate, a3);
}

- (NSArray)displayedViewControllers
{
  return &self->_displayedViewControllers->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configuratorDelegate);
  objc_storeStrong((id *)&self->_displayedViewControllers, 0);
}

@end
