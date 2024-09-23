@implementation HSSetupConfigurator

- (HSSetupConfigurator)initWithInitialViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSSetupConfigurator;
  return -[HSSetupConfigurator initWithConfiguratorDelegate:initialViewController:](&v4, "initWithConfiguratorDelegate:initialViewController:", self, a3);
}

- (void)configuratorDidUpdateViewController:(id)a3
{
  if (self != a3)
    NSLog(CFSTR("Invalid delegate originator not bridging self"), a2);
}

- (void)configuratorDidFinish:(id)a3
{
  if (self != a3)
    NSLog(CFSTR("Invalid delegate originator not bridging self"), a2);
}

@end
