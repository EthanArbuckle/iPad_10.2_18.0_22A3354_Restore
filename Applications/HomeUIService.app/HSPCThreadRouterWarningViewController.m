@implementation HSPCThreadRouterWarningViewController

- (HSPCThreadRouterWarningViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  HSPCThreadRouterWarningViewController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  objc_super v32;
  NSAttributedStringKey v33;
  void *v34;

  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HSPCThreadRouterWarningViewController;
  v7 = -[HSPCCenterIconViewController initWithCoordinator:config:](&v32, "initWithCoordinator:config:", a3, v6);
  if (v7)
  {
    v8 = HULocalizedString(CFSTR("HUAccessoryNeedsThreadNetworkTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[HSPCThreadRouterWarningViewController setTitle:](v7, "setTitle:", v9);

    v10 = HULocalizedString(CFSTR("HUProximityCardAccessoryNeedsThreadNetworkSubtitleNoResident"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "residentDevices"));
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = HULocalizedString(CFSTR("HUProximityCardAccessoryNeedsThreadNetworkSubtitleWithResident"));
      v16 = objc_claimAutoreleasedReturnValue(v15);

      v11 = (void *)v16;
    }
    v17 = HULocalizedString(CFSTR("HULearnMoreTitle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@..."), v18));

    v20 = objc_alloc((Class)NSAttributedString);
    v33 = NSForegroundColorAttributeName;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
    v34 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v23 = objc_msgSend(v20, "initWithString:attributes:", v19, v22);

    v24 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v11);
    objc_msgSend(v24, "appendAttributedString:", v23);
    -[HSPCThreadRouterWarningViewController setAttributedSubtitle:](v7, "setAttributedSubtitle:", v24);
    v25 = objc_msgSend(objc_alloc((Class)HUStringInLabelTapGestureRecognizer), "initWithTarget:action:hitBoxString:userInfo:", v7, "_handleLearnMoreURL", v19, &__NSDictionary0__struct);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCThreadRouterWarningViewController contentView](v7, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subtitleLabel"));
    objc_msgSend(v27, "setUserInteractionEnabled:", 1);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCThreadRouterWarningViewController contentView](v7, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subtitleLabel"));
    objc_msgSend(v29, "addGestureRecognizer:", v25);

    v30 = -[HSPCThreadRouterWarningViewController addProminentButtonWithTitleKey:target:futureSelector:](v7, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v7, "handleContinue");
  }

  return v7;
}

- (id)iconDescriptor
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v2));

  v4 = objc_msgSend(objc_alloc((Class)HFImageIconDescriptor), "initWithSystemImageNamed:configuration:", CFSTR("exclamationmark.triangle.fill"), v3);
  return v4;
}

- (id)handleContinue
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A83F8);
}

- (id)_handleLearnMoreURL
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_threadNetworkRequiredLearnMoreURL](NSURL, "hf_threadNetworkRequiredLearnMoreURL"));
  -[HSPCThreadRouterWarningViewController openURL:](self, "openURL:", v3);

  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8410);
}

@end
