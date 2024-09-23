@implementation HSPCPairingViewController

- (HSPCPairingViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCPairingViewController *v9;
  HSPCPairingViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HSPCPairingViewController;
  v9 = -[HSPCCenterIconViewController initWithCoordinator:config:](&v20, "initWithCoordinator:config:", v7, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryCategoryOrPrimaryServiceType"));
    v13 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardPairingCardTitle"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[HSPCPairingViewController setTitle:](v10, "setTitle:", v14);

    v15 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryPairingVCSubtitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[HSPCPairingViewController setSubtitle:](v10, "setSubtitle:", v16);

    v17 = HFLocalizedString(CFSTR("HFSetupPairingControllerStatusDescriptionConnecting"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[HSPCPairingViewController showActivityIndicatorWithStatus:](v10, "showActivityIndicatorWithStatus:", v18);

  }
  return v10;
}

- (id)iconDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPairingViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeTuple"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryCategoryOrPrimaryServiceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:](HFServiceIconFactory, "iconDescriptorForAccessoryCategoryOrServiceType:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPairingViewController coordinator](self, "coordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:](HFServiceIconFactory, "overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:", v9, v6));

  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A83B0);
}

- (void)updatePairingStatus:(id)a3 phase:(unint64_t)a4
{
  id v5;

  if (a4 == 2)
    -[HSPCPairingViewController setSubtitle:](self, "setSubtitle:", a3);
  else
    -[HSPCPairingViewController showActivityIndicatorWithStatus:](self, "showActivityIndicatorWithStatus:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSPCPairingViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
