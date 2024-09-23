@implementation HSPCNameInputSourcesViewController

- (id)servicesToPreload
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addedAccessory"));

  v6 = objc_msgSend((id)objc_opt_class(self, v5), "inputSourceServicesForAccessory:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)characteristicTypesToPreload
{
  NSSet *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[3];

  v9.receiver = self;
  v9.super_class = (Class)HSPCNameInputSourcesViewController;
  v2 = -[HSPCNameServicesViewController characteristicTypesToPreload](&v9, "characteristicTypesToPreload");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");

  v10[0] = HMCharacteristicTypeIsConfigured;
  v10[1] = HMCharacteristicTypeCurrentVisibilityState;
  v10[2] = HMCharacteristicTypeTargetVisibilityState;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  objc_msgSend(v4, "unionSet:", v6);

  v7 = objc_msgSend(v4, "copy");
  return v7;
}

- (id)shouldSkip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicableServicesForAccessory:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "count") == 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v7));

  return v8;
}

- (void)viewDidLoad
{
  unsigned int v3;
  __objc2_class **v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCNameInputSourcesViewController;
  -[HSPCNameServicesViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = -[HSPCNameInputSourcesViewController areAllServicesFrozen](self, "areAllServicesFrozen");
  v4 = off_1000A0628;
  if (!v3)
    v4 = off_1000A0638;
  -[__objc2_class leadingSeparatorMargin](*v4, "leadingSeparatorMargin");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setSeparatorInset:", 0.0, v6, 0.0, 0.0);

}

+ (id)inputSourceServicesForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_primaryService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_visibleServices"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_childServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromSet:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_filter:", &stru_1000A2098));
  return v8;
}

+ (id)applicableServicesForAccessory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "inputSourceServicesForAccessory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_filter:", &stru_1000A20B8));

  return v4;
}

- (id)serviceComparator
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100027D98;
  v3[3] = &unk_1000A2108;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (HSPCNameInputSourcesViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  HSPCNameInputSourcesViewController *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCNameInputSourcesViewController;
  v4 = -[HSPCNameServicesViewController initWithCoordinator:config:](&v8, "initWithCoordinator:config:", a3, a4);
  if (v4)
  {
    v5 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryNameInputsTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[HSPCNameInputSourcesViewController setTitle:](v4, "setTitle:", v6);

    -[HSPCNameInputSourcesViewController setSubtitle:](v4, "setSubtitle:", 0);
  }
  return v4;
}

- (BOOL)shouldServiceStartEnabled:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hf_characteristicOfType:", HMCharacteristicTypeCurrentVisibilityState));
  v5 = objc_opt_class(NSNumber, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    v9 = objc_msgSend(v8, "integerValue") != (id)1;
  else
    v9 = 1;

  return v9;
}

- (BOOL)shouldServiceBeFrozen:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hf_characteristicOfType:", HMCharacteristicTypeTargetVisibilityState));
  v4 = objc_msgSend(v3, "hf_isWritable") ^ 1;

  return v4;
}

- (id)cellReuseIdentifierForService:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  __objc2_class **v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController frozenServices](self, "frozenServices", a3));
  v5 = objc_msgSend(v4, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
  v7 = objc_msgSend(v6, "count");

  v8 = off_1000A0628;
  if (v5 != v7)
    v8 = off_1000A0638;
  return (id)objc_claimAutoreleasedReturnValue(-[__objc2_class _reuseIdentifier](*v8, "_reuseIdentifier"));
}

- (BOOL)areAllServicesFrozen
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController frozenServices](self, "frozenServices"));
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
  LOBYTE(v4) = v4 == objc_msgSend(v5, "count");

  return (char)v4;
}

@end
