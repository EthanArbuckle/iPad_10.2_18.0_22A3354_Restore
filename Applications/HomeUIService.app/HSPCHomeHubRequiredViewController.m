@implementation HSPCHomeHubRequiredViewController

- (HSPCHomeHubRequiredViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  HSPCHomeHubRequiredViewController *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HSPCHomeHubRequiredViewController;
  v7 = -[HSPCCenterIconViewController initWithCoordinator:config:](&v20, "initWithCoordinator:config:", a3, v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "residentDevices"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
      v11 = CFSTR("HUAlertSoftwareUpdateRequired");
    else
      v11 = CFSTR("HUHomeHubRequiredTitle");
    if (v10)
      v12 = CFSTR("HUProximityCardHomeHubSoftwareUpdateRequiredSubtitle");
    else
      v12 = CFSTR("HUProximityCardHomeHubRequiredSubtitle");
    v13 = HULocalizedString(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[HSPCHomeHubRequiredViewController setTitle:](v7, "setTitle:", v14);

    v15 = HULocalizedString(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[HSPCHomeHubRequiredViewController setSubtitle:](v7, "setSubtitle:", v16);

    v17 = -[HSPCHomeHubRequiredViewController addProminentButtonWithTitleKey:target:futureSelector:](v7, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HULearnMoreTitle"), v7, "handleLearnMoreURL");
    v18 = -[HSPCHomeHubRequiredViewController addOptionalDismissButtonWithLocalizedTitleKey:](v7, "addOptionalDismissButtonWithLocalizedTitleKey:", CFSTR("HUOkTitle"));
  }

  return v7;
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
  v5 = objc_msgSend(v4, "initWithSystemImageNamed:configuration:", HFSymbolIconIdentifierBridge, v3);

  return v5;
}

- (id)handleLearnMoreURL
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_homeHubRequiredLearnMoreURL](NSURL, "hf_homeHubRequiredLearnMoreURL"));
  -[HSPCHomeHubRequiredViewController openURL:](self, "openURL:", v3);

  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A80E0);
}

@end
