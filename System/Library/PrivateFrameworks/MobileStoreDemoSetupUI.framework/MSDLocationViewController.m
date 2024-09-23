@implementation MSDLocationViewController

- (MSDLocationViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  MSDLocationViewController *v6;
  id v7;
  void *v8;
  objc_super v10;

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("LOCATION_SERVICES_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("LOCATION_SERVICES_DESCRIPTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)MSDLocationViewController;
  v6 = -[MSDLocationViewController initWithTitle:detailText:icon:](&v10, sel_initWithTitle_detailText_icon_, v3, v4, v5);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBFA88]);
    -[MSDLocationViewController setLocationManager:](v6, "setLocationManager:", v7);

    -[MSDLocationViewController locationManager](v6, "locationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v6);

  }
  return v6;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  int v30;
  _QWORD v31[6];

  v31[5] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)MSDLocationViewController;
  -[OBBaseWelcomeController viewDidLoad](&v28, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x24BDBFB78]);
  objc_msgSend(v3, "setLabel:", 4);
  objc_msgSend(v3, "setIcon:", 0);
  objc_msgSend(v3, "setCornerRadius:", 14.0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__locationButtonTapped_, 64);
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", CFSTR("placeholder"), 0);
  -[MSDLocationViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton:", v4);

  -[MSDLocationViewController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v3);

  objc_msgSend(v3, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  objc_msgSend(v3, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v22;
  objc_msgSend(v3, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v8;
  objc_msgSend(v3, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v11;
  objc_msgSend(v3, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v12, "constraintEqualToConstant:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v15);
  defaultLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v30 = 2;
    _os_log_impl(&dword_22A6E6000, v16, OS_LOG_TYPE_DEFAULT, "Setting location button use mode to %d...", buf, 8u);
  }

  v17 = (void *)MEMORY[0x24BDBFA88];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLocationButtonUseMode:forBundleIdentifier:", 2, v19);

  +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "enableLocationServices");

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  MSDStoreSearchViewController *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    v12 = 138543874;
    v13 = v5;
    v14 = 1024;
    v15 = objc_msgSend(v3, "authorizationStatus");
    v16 = 2048;
    v17 = objc_msgSend(v3, "accuracyAuthorization");
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: location authorization status changed to %d; accuracy authorization %ld",
      (uint8_t *)&v12,
      0x1Cu);

  }
  if ((int)objc_msgSend(v3, "authorizationStatus") >= 3)
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v12 = 138543362;
      v13 = v8;
      v9 = v8;
      _os_log_impl(&dword_22A6E6000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: location authorized; moving to store search view controller",
        (uint8_t *)&v12,
        0xCu);

    }
    v10 = objc_alloc_init(MSDStoreSearchViewController);
    +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:andRemoveTopmostView:", v10, 1);

  }
}

- (void)_locationButtonTapped:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Location button tapped from: %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
