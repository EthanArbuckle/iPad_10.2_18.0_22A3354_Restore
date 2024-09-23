@implementation HSPCRouterReplaceViewController

- (HSPCRouterReplaceViewController)initWithCoordinator:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HSPCRouterReplaceViewController *v10;
  HSPCRouterReplaceViewController *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  HSPCRouterReplaceViewController *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  HSPCRouterReplaceViewController *v36;
  objc_super v37;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)HUIconView), "initWithFrame:contentMode:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v6, "setIconSize:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeTuple"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryCategoryOrPrimaryServiceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:](HFServiceIconFactory, "iconDescriptorForAccessoryCategoryOrServiceType:", v8));

  objc_msgSend(v6, "updateWithIconDescriptor:displayStyle:animated:", v9, 1, 1);
  v37.receiver = self;
  v37.super_class = (Class)HSPCRouterReplaceViewController;
  v10 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:](&v37, "initWithCenterContentView:", v6);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v12 = HULocalizedWiFiString(CFSTR("HUSetupNetworkRouterReplaceTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[HSPCRouterReplaceViewController setTitle:](v11, "setTitle:", v13);

    v14 = HULocalizedString(CFSTR("HUSetupNetworkRouterReplaceDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[HSPCRouterReplaceViewController setSubtitle:](v11, "setSubtitle:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeTuple"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "home"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setupAccessoryDescription"));
    v20 = HULocalizedString(CFSTR("HUSetupNetworkRouterReplaceButtonReplace"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000073EC;
    v33[3] = &unk_1000A0EF0;
    v22 = v18;
    v34 = v22;
    v23 = v19;
    v35 = v23;
    v24 = v11;
    v36 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v21, 0, v33));
    v26 = -[HSPCRouterReplaceViewController addAction:](v24, "addAction:", v25);

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100007444;
    v30[3] = &unk_1000A0F18;
    v31 = v22;
    v32 = v23;
    v27 = v23;
    v28 = v22;
    -[HSPCRouterReplaceViewController addDismissButtonWithCoordinator:dismissAfterExecuting:](v24, "addDismissButtonWithCoordinator:dismissAfterExecuting:", v5, v30);

  }
  return v11;
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
