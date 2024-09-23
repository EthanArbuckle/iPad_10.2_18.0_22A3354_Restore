@implementation HSPCRouterDetectedViewController

- (HSPCRouterDetectedViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  HSPCRouterDetectedViewController *v4;
  HSPCRouterDetectedViewController *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HSPCRouterDetectedViewController;
  v4 = -[HSPCDetectedViewController initWithCoordinator:config:](&v16, "initWithCoordinator:config:", a3, a4);
  v5 = v4;
  if (!v4)
    return v5;
  if (!-[HSPCRouterDetectedViewController canContinue](v4, "canContinue"))
  {
    v7 = sub_1000593D8(CFSTR("HSSetupConfirmationNetworkRouterResidentRequiredViewControllerTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[HSPCRouterDetectedViewController setTitle:](v5, "setTitle:", v8);

    v6 = CFSTR("HSSetupConfirmationNetworkRouterResidentRequiredViewControllerDescription");
    goto LABEL_6;
  }
  if (-[HSPCDetectedViewController isFirstDetectedCard](v5, "isFirstDetectedCard"))
  {
    v6 = CFSTR("HSSetupConfirmationNetworkRouterViewControllerDescription");
LABEL_6:
    v9 = HFLocalizedWiFiStringKeyForKey(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = sub_1000593D8(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCRouterDetectedViewController setSubtitle:](v5, "setSubtitle:", v12);

    goto LABEL_8;
  }
  -[HSPCRouterDetectedViewController setSubtitle:](v5, "setSubtitle:", 0);
LABEL_8:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRouterDetectedViewController subtitle](v5, "subtitle"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_learnAboutNetworkProtectionURL](NSURL, "hf_learnAboutNetworkProtectionURL"));
    -[HSPCRouterDetectedViewController addLearnMoreButtonWithURL:](v5, "addLearnMoreButtonWithURL:", v14);

  }
  return v5;
}

- (BOOL)canContinue
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));

  v4 = !v3
    || (objc_msgSend(v3, "hf_isNetworkRouterSupported") & 1) != 0
    || ((unint64_t)objc_msgSend(v3, "networkRouterSupportDisableReason") & 1) == 0;

  return v4;
}

- (id)prominentButtonLocalizedTitle
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  if (-[HSPCRouterDetectedViewController canContinue](self, "canContinue"))
  {
    v7.receiver = self;
    v7.super_class = (Class)HSPCRouterDetectedViewController;
    v3 = -[HSPCDetectedViewController prominentButtonLocalizedTitle](&v7, "prominentButtonLocalizedTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v5 = HULocalizedString(CFSTR("HUOkTitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v4;
}

- (id)commitConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[HSPCRouterDetectedViewController canContinue](self, "canContinue") ^ 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v2));

  return v3;
}

@end
