@implementation HSDiscoveredAccessoryPickerViewController

- (HSDiscoveredAccessoryPickerViewController)initWithAccessoryBrowsingManager:(id)a3 entitlementContext:(id)a4 setupAccessoryDescription:(id)a5 matterDeviceSetupRequest:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  HSDiscoveredAccessoryPickerViewController *v16;
  HSDiscoveredAccessoryPickerViewController *v17;
  HSNetworkInterfaceManager *v18;
  HSNetworkInterfaceManager *networkInterfaceManager;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSDiscoveredAccessoryPickerViewController.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryBrowsingManager"));

    if (v13)
      goto LABEL_3;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSDiscoveredAccessoryPickerViewController.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementContext"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  v16 = -[HSDiscoveredAccessoryPickerViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_accessoryBrowsingManager, a3);
    objc_storeStrong((id *)&v17->_entitlementContext, a4);
    objc_storeStrong((id *)&v17->_setupAccessoryDescription, a5);
    objc_storeStrong((id *)&v17->_matterDeviceSetupRequest, a6);
    v18 = -[HSNetworkInterfaceManager initWithAlertHostViewController:]([HSNetworkInterfaceManager alloc], "initWithAlertHostViewController:", v17);
    networkInterfaceManager = v17->_networkInterfaceManager;
    v17->_networkInterfaceManager = v18;

    v20 = HULocalizedString(CFSTR("HUAddAccessory"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[HSDiscoveredAccessoryPickerViewController setTitle:](v17, "setTitle:", v21);

  }
  return v17;
}

- (void)viewDidLoad
{
  id v3;
  id v4;
  void *v5;
  HSDiscoveredAccessoryFilter *v6;
  void *v7;
  void *v8;
  void *v9;
  HSDiscoveredAccessoryFilter *v10;
  HSDiscoveredAccessoryGridContentViewController *v11;
  void *v12;
  HSDiscoveredAccessoryGridContentViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  -[HSDiscoveredAccessoryPickerViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  objc_msgSend(v3, "startAnimating");
  v6 = [HSDiscoveredAccessoryFilter alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController entitlementContext](self, "entitlementContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController setupAccessoryDescription](self, "setupAccessoryDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController matterDeviceSetupRequest](self, "matterDeviceSetupRequest"));
  v10 = -[HSDiscoveredAccessoryFilter initWithEntitlementContext:setupAccessoryDescription:matterDeviceSetupRequest:](v6, "initWithEntitlementContext:setupAccessoryDescription:matterDeviceSetupRequest:", v7, v8, v9);

  v11 = [HSDiscoveredAccessoryGridContentViewController alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController accessoryBrowsingManager](self, "accessoryBrowsingManager"));
  v13 = -[HSDiscoveredAccessoryGridContentViewController initWithAccessoryBrowsingManager:discoveredAccessoryFilter:](v11, "initWithAccessoryBrowsingManager:discoveredAccessoryFilter:", v12, v10);
  -[HSDiscoveredAccessoryPickerViewController setGridViewController:](self, "setGridViewController:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  objc_msgSend(v15, "setCellContentViewBackgroundColor:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  objc_msgSend(v16, "setDelegate:", self);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  objc_msgSend(v17, "setContentMargins:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  objc_msgSend(v18, "setWantsPreferredContentSize:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  -[HSDiscoveredAccessoryPickerViewController addChildViewController:](self, "addChildViewController:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
  objc_msgSend(v22, "addSubview:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  objc_msgSend(v25, "didMoveToParentViewController:", self);

  -[HSDiscoveredAccessoryPickerViewController _setupConstraints](self, "_setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  -[HSDiscoveredAccessoryPickerViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  -[HSDiscoveredAccessoryPickerViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController networkInterfaceManager](self, "networkInterfaceManager"));
  objc_msgSend(v4, "checkNetworkStatusAndShowAlertIfNeededForBluetooth:Wifi:", 1, 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  -[HSDiscoveredAccessoryPickerViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  id v30;

  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  objc_msgSend(v30, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  objc_msgSend(v30, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  objc_msgSend(v30, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  objc_msgSend(v30, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  objc_msgSend(v24, "preferredContentSize");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToConstant:", v25));
  -[HSDiscoveredAccessoryPickerViewController setGridHeightConstraint:](self, "setGridHeightConstraint:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridHeightConstraint](self, "gridHeightConstraint"));
  LODWORD(v28) = 1144750080;
  objc_msgSend(v27, "setPriority:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridHeightConstraint](self, "gridHeightConstraint"));
  objc_msgSend(v30, "addObject:", v29);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
    objc_msgSend(v7, "preferredContentSize");
    v9 = v8 + 30.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridHeightConstraint](self, "gridHeightConstraint"));
    objc_msgSend(v10, "setConstant:", v9);

    v12 = (id)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    objc_msgSend(v11, "layoutIfNeeded");

  }
}

- (void)discoveredAccessoryGrid:(id)a3 didSelectDiscoveredAccessory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!v6)
    NSLog(CFSTR("No discovered accessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController discoveredAccessoryPickerViewControllerDelegate](self, "discoveredAccessoryPickerViewControllerDelegate"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController discoveredAccessoryPickerViewControllerDelegate](self, "discoveredAccessoryPickerViewControllerDelegate"));
    objc_msgSend(v8, "didSelectDiscoveredAccessory:", v6);

  }
}

- (void)discoveredAccessoryGrid:(id)a3 didUpdateNumberOfDiscoveredAccessories:(unint64_t)a4
{
  void *v6;
  char v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController discoveredAccessoryPickerViewControllerDelegate](self, "discoveredAccessoryPickerViewControllerDelegate", a3));
  v7 = objc_opt_respondsToSelector(v6, "didUpdateNumberOfDiscoveredAccessories:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController discoveredAccessoryPickerViewControllerDelegate](self, "discoveredAccessoryPickerViewControllerDelegate"));
    objc_msgSend(v8, "didUpdateNumberOfDiscoveredAccessories:", a4);

  }
}

- (id)hu_preloadContent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryPickerViewController gridViewController](self, "gridViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hu_preloadContent"));

  return v3;
}

- (HFAccessoryBrowsingManager)accessoryBrowsingManager
{
  return self->_accessoryBrowsingManager;
}

- (HSEntitlementContext)entitlementContext
{
  return self->_entitlementContext;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  return self->_matterDeviceSetupRequest;
}

- (HSDiscoveredAccessoryGridContentViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
  objc_storeStrong((id *)&self->_gridViewController, a3);
}

- (HSNetworkInterfaceManager)networkInterfaceManager
{
  return self->_networkInterfaceManager;
}

- (void)setNetworkInterfaceManager:(id)a3
{
  objc_storeStrong((id *)&self->_networkInterfaceManager, a3);
}

- (NSLayoutConstraint)gridHeightConstraint
{
  return self->_gridHeightConstraint;
}

- (void)setGridHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_gridHeightConstraint, a3);
}

- (HSDiscoveredAccessoryPickerViewControllerDelegate)discoveredAccessoryPickerViewControllerDelegate
{
  return (HSDiscoveredAccessoryPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_discoveredAccessoryPickerViewControllerDelegate);
}

- (void)setDiscoveredAccessoryPickerViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_discoveredAccessoryPickerViewControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_discoveredAccessoryPickerViewControllerDelegate);
  objc_storeStrong((id *)&self->_gridHeightConstraint, 0);
  objc_storeStrong((id *)&self->_networkInterfaceManager, 0);
  objc_storeStrong((id *)&self->_gridViewController, 0);
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_storeStrong((id *)&self->_entitlementContext, 0);
  objc_storeStrong((id *)&self->_accessoryBrowsingManager, 0);
}

@end
