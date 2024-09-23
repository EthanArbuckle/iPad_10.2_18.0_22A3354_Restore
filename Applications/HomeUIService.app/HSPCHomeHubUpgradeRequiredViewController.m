@implementation HSPCHomeHubUpgradeRequiredViewController

- (HSPCHomeHubUpgradeRequiredViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  HSPCHomeHubUpgradeRequiredViewController *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HSPCHomeHubUpgradeRequiredViewController;
  v4 = -[HSPCCenterIconViewController initWithCoordinator:config:](&v11, "initWithCoordinator:config:", a3, a4);
  if (v4)
  {
    v5 = HULocalizedString(CFSTR("HUHomeHubUpgradeRequiredTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[HSPCHomeHubUpgradeRequiredViewController setTitle:](v4, "setTitle:", v6);

    v7 = HULocalizedString(CFSTR("HUProximityCardHomeHubUpgradeRequiredSubtitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[HSPCHomeHubUpgradeRequiredViewController setSubtitle:](v4, "setSubtitle:", v8);

    v9 = -[HSPCHomeHubUpgradeRequiredViewController addProminentButtonWithTitleKey:target:futureSelector:](v4, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HULearnMoreTitle"), v4, "handleLearnMoreURL");
  }
  return v4;
}

- (id)iconDescriptor
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v2));

  v4 = objc_alloc((Class)HFImageIconDescriptor);
  v5 = objc_msgSend(v4, "initWithSystemImageNamed:configuration:", HFSymbolIconIdentifierHomeKit, v3);

  return v5;
}

- (id)handleLearnMoreURL
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents homeHub2OnboardingURL](HFURLComponents, "homeHub2OnboardingURL"));
  v4 = objc_msgSend(v2, "openSensitiveURL:", v3);

  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A82D8);
}

@end
