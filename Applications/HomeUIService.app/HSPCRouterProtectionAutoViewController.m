@implementation HSPCRouterProtectionAutoViewController

- (HSPCRouterProtectionAutoViewController)initWithCoordinator:(id)a3 configurationDelegate:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  HSPCRouterProtectionAutoViewController *v19;
  HSPCRouterProtectionAutoViewController *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HSPCRouterProtectionAutoViewController *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  HSPCRouterProtectionAutoViewController *v33;
  void *v34;
  id v35;
  void **v37;
  uint64_t v38;
  id (*v39)(uint64_t);
  void *v40;
  HSPCRouterProtectionAutoViewController *v41;
  _QWORD v42[4];
  HSPCRouterProtectionAutoViewController *v43;
  objc_super v44;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc((Class)UIImageView);
  v10 = HUImageNamed(CFSTR("HUSetupNetworkRouterEnableSecurity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v9, "initWithImage:", v11);

  objc_msgSend(v12, "setContentMode:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image"));
  objc_msgSend(v13, "size");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image"));
  objc_msgSend(v16, "size");
  v18 = v15 / v17;

  v44.receiver = self;
  v44.super_class = (Class)HSPCRouterProtectionAutoViewController;
  v19 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v44, "initWithCenterContentView:size:", v12, 160.0, v18 * 160.0);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_coordinator, a3);
    objc_storeWeak((id *)&v20->_delegate, v8);
    v21 = HULocalizedString(CFSTR("HUSetupNetworkRouterProtectionTitle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[HSPCRouterProtectionAutoViewController setTitle:](v20, "setTitle:", v22);

    v23 = HULocalizedString(CFSTR("HUSetupNetworkRouterProtectionDescription"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[HSPCRouterProtectionAutoViewController setSubtitle:](v20, "setSubtitle:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_learnAboutNetworkProtectionURL](NSURL, "hf_learnAboutNetworkProtectionURL"));
    -[HSPCRouterProtectionAutoViewController addLearnMoreButtonWithURL:](v20, "addLearnMoreButtonWithURL:", v25);

    v26 = HULocalizedString(CFSTR("HUSetupNetworkRouterProtectionButtonDone"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10003D910;
    v42[3] = &unk_1000A2268;
    v28 = v20;
    v43 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v27, 0, v42));
    v30 = -[HSPCRouterProtectionAutoViewController addAction:](v28, "addAction:", v29);

    v31 = HULocalizedString(CFSTR("HUSetupNetworkRouterProtectionButtonDisable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v37 = _NSConcreteStackBlock;
    v38 = 3221225472;
    v39 = sub_10003D920;
    v40 = &unk_1000A2268;
    v33 = v28;
    v41 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v32, 1, &v37));
    v35 = -[HSPCRouterProtectionAutoViewController addAction:](v33, "addAction:", v34, v37, v38, v39, v40);

  }
  return v20;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSPCRouterProtectionAutoViewController;
  -[HSPCRouterProtectionAutoViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRouterProtectionAutoViewController delegate](self, "delegate"));
  objc_msgSend(v4, "viewControllerWillAppear:", self);

}

- (BOOL)_hasNetworkCustomizableAccessories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRouterProtectionAutoViewController coordinator](self, "coordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeTuple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryProtectionGroups"));
  if (objc_msgSend(v6, "count"))
    v7 = objc_msgSend(v5, "hf_isNetworkProtectionSupportedForAccessories");
  else
    v7 = 0;

  return v7;
}

- (void)_updateNetworkProtection:(int64_t)a3 andFinishWithActionResult:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14[2];
  id location;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRouterProtectionAutoViewController coordinator](self, "coordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));

  -[HSPCRouterProtectionAutoViewController showActivityIndicatorWithStatus:](self, "showActivityIndicatorWithStatus:", &stru_1000A3BA0);
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_updateNetworkProtection:", a3));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003DB64;
  v13[3] = &unk_1000A2C48;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a4;
  v12 = objc_msgSend(v11, "addCompletionBlock:", v13);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
