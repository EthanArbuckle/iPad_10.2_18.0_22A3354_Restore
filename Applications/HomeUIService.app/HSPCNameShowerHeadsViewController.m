@implementation HSPCNameShowerHeadsViewController

- (HSPCNameShowerHeadsViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  HSPCNameShowerHeadsViewController *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCNameShowerHeadsViewController;
  v4 = -[HSPCNameZonesViewController initWithCoordinator:config:](&v8, "initWithCoordinator:config:", a3, a4);
  if (v4)
  {
    v5 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryNameShowerHeadsTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[HSPCNameShowerHeadsViewController setTitle:](v4, "setTitle:", v6);

    -[HSPCNameShowerHeadsViewController setSubtitle:](v4, "setSubtitle:", 0);
  }
  return v4;
}

@end
