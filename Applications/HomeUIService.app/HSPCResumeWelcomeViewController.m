@implementation HSPCResumeWelcomeViewController

- (HSPCResumeWelcomeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  HSPCResumeWelcomeViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HSPCResumeWelcomeViewController;
  v7 = -[HSPCDetectedViewController initWithCoordinator:config:](&v17, "initWithCoordinator:config:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTuple"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryCategoryOrPrimaryServiceType"));

    v10 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardResumeAccessoryConfigurationCardTitle"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTuple"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleForAccessoryWithDefaultValue:", v11));
    -[HSPCResumeWelcomeViewController setTitle:](v7, "setTitle:", v13);

    v14 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardResumeAccessoryConfigurationCardSubtitle"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[HSPCResumeWelcomeViewController setSubtitle:](v7, "setSubtitle:", v15);

  }
  return v7;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HSPCResumeWelcomeViewController;
  -[HSPCCenterIconViewController viewDidLoad](&v2, "viewDidLoad");
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8128);
}

@end
