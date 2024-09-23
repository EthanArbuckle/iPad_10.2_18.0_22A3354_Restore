@implementation HUStaticConfigurator

- (HUStaticConfigurator)initWithConfiguratorDelegate:(id)a3 viewControllers:(id)a4
{
  id v7;
  HUStaticConfigurator *v8;
  id v9;
  void *v10;
  HUStaticConfigurator *v11;
  objc_super v13;
  _QWORD v14[4];
  HUStaticConfigurator *v15;

  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__HUStaticConfigurator_initWithConfiguratorDelegate_viewControllers___block_invoke;
  v14[3] = &unk_1E6F604C8;
  v8 = self;
  v15 = v8;
  v9 = a3;
  objc_msgSend(v7, "na_each:", v14);
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = v8;
  v13.super_class = (Class)HUStaticConfigurator;
  v11 = -[HUConfigurator initWithConfiguratorDelegate:initialViewController:](&v13, sel_initWithConfiguratorDelegate_initialViewController_, v9, v10);

  if (v11)
    objc_storeStrong((id *)&v11->_staticViewControllers, a4);

  return v11;
}

uint64_t __69__HUStaticConfigurator_initWithConfiguratorDelegate_viewControllers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (HUStaticConfigurator)initWithConfiguratorDelegate:(id)a3 contentViewControllers:(id)a4
{
  HUStaticConfigurator *v6;
  id v7;
  void *v8;
  HUStaticConfigurator *v9;
  _QWORD v11[4];
  HUStaticConfigurator *v12;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HUStaticConfigurator_initWithConfiguratorDelegate_contentViewControllers___block_invoke;
  v11[3] = &unk_1E6F604F0;
  v6 = self;
  v12 = v6;
  v7 = a3;
  objc_msgSend(a4, "na_map:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUStaticConfigurator initWithConfiguratorDelegate:viewControllers:](v6, "initWithConfiguratorDelegate:viewControllers:", v7, v8);

  return v9;
}

HUConfigurationWrapperViewController *__76__HUStaticConfigurator_initWithConfiguratorDelegate_contentViewControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HUConfigurationWrapperViewController *v4;

  v3 = a2;
  v4 = -[HUConfigurationWrapperViewController initWithContentViewController:configurationDelegate:]([HUConfigurationWrapperViewController alloc], "initWithContentViewController:configurationDelegate:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_nextViewControllerForResults:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  -[HUStaticConfigurator staticViewControllers](self, "staticViewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurator currentViewController](self, "currentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[HUConfigurator currentViewController](self, "currentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStaticConfigurator staticViewControllers](self, "staticViewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("currentViewController %@ not in staticViewControllers %@"), v7, v8);

  }
  v9 = v6 + 1;
  -[HUStaticConfigurator staticViewControllers](self, "staticViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 < v11
    && (-[HUStaticConfigurator staticViewControllers](self, "staticViewControllers"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "objectAtIndexedSubscript:", v9),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (NSArray)staticViewControllers
{
  return self->_staticViewControllers;
}

- (void)setStaticViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticViewControllers, 0);
}

@end
