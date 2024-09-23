@implementation HSPCMatterAccessoryDoneViewController

- (HSPCMatterAccessoryDoneViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  HSPCMatterAccessoryDoneViewController *v10;
  HSPCMatterAccessoryDoneViewController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v24;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)HUIconView), "initWithFrame:contentMode:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v9, "setIconSize:", 5);
  v25.receiver = self;
  v25.super_class = (Class)HSPCMatterAccessoryDoneViewController;
  v10 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:](&v25, "initWithCenterContentView:", v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a4);
    objc_storeStrong((id *)&v11->_coordinator, a3);
    objc_storeStrong((id *)&v11->_iconView, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
    v13 = objc_msgSend(v7, "numberOfAccessoriesInSameCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "matterDeviceSetupRequest"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ecosystemName"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessoryCategoryOrPrimaryServiceType"));
    if (v13 == (id)1)
    {
      v17 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardMatterDoneCardTitleSingular"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v15, v24);
    }
    else
    {
      v20 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HFProximityCardMatterDoneCardTitle"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v13, v15);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[HSPCMatterAccessoryDoneViewController setTitle:](v11, "setTitle:", v21);

    v22 = -[HSPCMatterAccessoryDoneViewController addProminentDismissButtonWithTitleKey:](v11, "addProminentDismissButtonWithTitleKey:", CFSTR("HUDoneTitle"));
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSPCMatterAccessoryDoneViewController;
  -[HSPCFixedSizeCenterContentViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMatterAccessoryDoneViewController iconDescriptor](self, "iconDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMatterAccessoryDoneViewController iconView](self, "iconView"));
  objc_msgSend(v4, "updateWithIconDescriptor:displayStyle:animated:", v3, 1, 0);

}

- (HFIconDescriptor)iconDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMatterAccessoryDoneViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeTuple"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryCategoryOrPrimaryServiceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:](HFServiceIconFactory, "iconDescriptorForAccessoryCategoryOrServiceType:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMatterAccessoryDoneViewController coordinator](self, "coordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:](HFServiceIconFactory, "overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:", v9, v6));

  return (HFIconDescriptor *)v10;
}

- (id)commitConfiguration
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMatterAccessoryDoneViewController coordinator](self, "coordinator"));
  v3 = objc_msgSend(v2, "requiresDismissalConfirmation") ^ 1;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v4));

  return v5;
}

- (id)config
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)coordinator
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
