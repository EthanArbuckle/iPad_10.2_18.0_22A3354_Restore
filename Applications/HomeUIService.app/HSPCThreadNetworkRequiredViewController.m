@implementation HSPCThreadNetworkRequiredViewController

- (void)configureCard
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = HULocalizedString(CFSTR("HUProximityCardThreadNetworkRequiredTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[HSPCThreadNetworkRequiredViewController setTitle:](self, "setTitle:", v4);

  v5 = HULocalizedString(CFSTR("HUProximityCardThreadNetworkRequiredSubtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[HSPCThreadNetworkRequiredViewController setSubtitle:](self, "setSubtitle:", v6);

  v7 = -[HSPCThreadNetworkRequiredViewController addProminentButtonWithTitleKey:target:futureSelector:](self, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HULearnMoreTitle"), self, "handleLearnMoreURL");
  v8 = -[HSPCThreadNetworkRequiredViewController addOptionalDismissButtonWithLocalizedTitleKey:](self, "addOptionalDismissButtonWithLocalizedTitleKey:", CFSTR("HUDoneTitle"));
}

- (id)handleLearnMoreURL
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_threadNetworkRequiredLearnMoreURL](NSURL, "hf_threadNetworkRequiredLearnMoreURL"));
  -[HSPCThreadNetworkRequiredViewController openURL:](self, "openURL:", v3);

  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8230);
}

@end
