@implementation HSSetupNetworkRouterConfigurator

- (HSSetupNetworkRouterConfigurator)initWithCoordinator:(id)a3
{
  id v4;
  HSPCRouterProtectionAutoViewController *v5;
  HSSetupNetworkRouterConfigurator *v6;
  objc_super v8;

  v4 = a3;
  v5 = -[HSPCRouterProtectionAutoViewController initWithCoordinator:configurationDelegate:]([HSPCRouterProtectionAutoViewController alloc], "initWithCoordinator:configurationDelegate:", v4, self);

  v8.receiver = self;
  v8.super_class = (Class)HSSetupNetworkRouterConfigurator;
  v6 = -[HSSetupConfigurator initWithInitialViewController:](&v8, "initWithInitialViewController:", v5);

  return v6;
}

- (id)_nextViewControllerForResults:(id)a3
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult", a3);
}

@end
