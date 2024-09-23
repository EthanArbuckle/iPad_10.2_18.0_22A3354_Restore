@implementation AMSUIOnboardingViewController

- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 secondaryButtonText:(id)a7 privacyLinkController:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AMSUIOnboardingViewController *v20;
  AMSUIOnboardingViewController *v21;
  uint64_t v22;
  OBWelcomeController *welcomeController;
  void *v24;
  id obj;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  obj = a7;
  v18 = a7;
  v28.receiver = self;
  v28.super_class = (Class)AMSUIOnboardingViewController;
  v19 = a8;
  v20 = -[AMSUIOnboardingViewController initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_titleText, a4);
    objc_storeStrong((id *)&v21->_descriptionText, a5);
    objc_storeStrong((id *)&v21->_primaryButtonText, a6);
    objc_storeStrong((id *)&v21->_secondaryButtonText, obj);
    objc_storeStrong((id *)&v21->_image, a3);
    v22 = objc_msgSend(objc_alloc((Class)getOBWelcomeControllerClass()), "initWithTitle:detailText:icon:", v15, v16, v14);
    welcomeController = v21->_welcomeController;
    v21->_welcomeController = (OBWelcomeController *)v22;

    +[AMSUIOnboardingViewController privacyLinkIdentifiersFromController:](AMSUIOnboardingViewController, "privacyLinkIdentifiersFromController:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingViewController commonSetupWithPrimaryButtonText:secondaryButtonText:privacyLinkBundleIdentifiers:](v21, "commonSetupWithPrimaryButtonText:secondaryButtonText:privacyLinkBundleIdentifiers:", v17, v18, v24);

  }
  return v21;
}

- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AMSUIOnboardingViewController *v17;
  AMSUIOnboardingViewController *v18;
  uint64_t v19;
  OBWelcomeController *welcomeController;
  void *v21;
  id v23;
  objc_super v24;

  v23 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AMSUIOnboardingViewController;
  v17 = -[AMSUIOnboardingViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_titleText, a4);
    objc_storeStrong((id *)&v18->_descriptionText, a5);
    objc_storeStrong((id *)&v18->_primaryButtonText, a6);
    objc_storeStrong((id *)&v18->_image, a3);
    v19 = objc_msgSend(objc_alloc((Class)getOBWelcomeControllerClass()), "initWithTitle:detailText:icon:", v13, v14, v23);
    welcomeController = v18->_welcomeController;
    v18->_welcomeController = (OBWelcomeController *)v19;

    +[AMSUIOnboardingViewController privacyLinkIdentifiersFromController:](AMSUIOnboardingViewController, "privacyLinkIdentifiersFromController:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingViewController commonSetupWithPrimaryButtonText:privacyLinkBundleIdentifiers:](v18, "commonSetupWithPrimaryButtonText:privacyLinkBundleIdentifiers:", v15, v21);

  }
  return v18;
}

- (AMSUIOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSUIOnboardingViewController *v15;
  AMSUIOnboardingViewController *v16;
  uint64_t v17;
  OBWelcomeController *welcomeController;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  OBWelcomeController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)AMSUIOnboardingViewController;
  v15 = -[AMSUIOnboardingViewController initWithNibName:bundle:](&v38, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    v31 = v14;
    objc_storeStrong((id *)&v15->_titleText, a3);
    objc_storeStrong((id *)&v16->_primaryButtonText, a5);
    v33 = v11;
    v17 = objc_msgSend(objc_alloc((Class)getOBWelcomeControllerClass()), "initWithTitle:detailText:icon:", v11, 0, 0);
    welcomeController = v16->_welcomeController;
    v16->_welcomeController = (OBWelcomeController *)v17;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = v12;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v25 = v16->_welcomeController;
          objc_msgSend(v24, "titleText", v31);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "descriptionText");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "image");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBWelcomeController addBulletedListItemWithTitle:description:image:](v25, "addBulletedListItemWithTitle:description:image:", v26, v27, v28);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v21);
    }

    v14 = v31;
    +[AMSUIOnboardingViewController privacyLinkIdentifiersFromController:](AMSUIOnboardingViewController, "privacyLinkIdentifiersFromController:", v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingViewController commonSetupWithPrimaryButtonText:privacyLinkBundleIdentifiers:](v16, "commonSetupWithPrimaryButtonText:privacyLinkBundleIdentifiers:", v13, v29);

    v12 = v32;
    v11 = v33;
  }

  return v16;
}

- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkBundleIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AMSUIOnboardingViewController *v17;
  AMSUIOnboardingViewController *v18;
  uint64_t v19;
  OBWelcomeController *welcomeController;
  void *v21;
  id v23;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AMSUIOnboardingViewController;
  v17 = -[AMSUIOnboardingViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_titleText, a4);
    objc_storeStrong((id *)&v18->_descriptionText, a5);
    objc_storeStrong((id *)&v18->_primaryButtonText, a6);
    objc_storeStrong((id *)&v18->_image, a3);
    v19 = objc_msgSend(objc_alloc((Class)getOBWelcomeControllerClass()), "initWithTitle:detailText:icon:", v13, v14, v23);
    welcomeController = v18->_welcomeController;
    v18->_welcomeController = (OBWelcomeController *)v19;

    v25[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingViewController commonSetupWithPrimaryButtonText:privacyLinkBundleIdentifiers:](v18, "commonSetupWithPrimaryButtonText:privacyLinkBundleIdentifiers:", v15, v21);

  }
  return v18;
}

- (AMSUIOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 features:(id)a5 primaryButtonText:(id)a6 privacyLinkBundleIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AMSUIOnboardingViewController *v18;
  AMSUIOnboardingViewController *v19;
  uint64_t v20;
  OBWelcomeController *welcomeController;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  OBWelcomeController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v42.receiver = self;
  v42.super_class = (Class)AMSUIOnboardingViewController;
  v18 = -[AMSUIOnboardingViewController initWithNibName:bundle:](&v42, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    v34 = v17;
    objc_storeStrong((id *)&v18->_titleText, a4);
    objc_storeStrong((id *)&v19->_primaryButtonText, a6);
    objc_storeStrong((id *)&v19->_image, a3);
    v36 = v14;
    v37 = v13;
    v20 = objc_msgSend(objc_alloc((Class)getOBWelcomeControllerClass()), "initWithTitle:detailText:icon:", v14, 0, v13);
    welcomeController = v19->_welcomeController;
    v19->_welcomeController = (OBWelcomeController *)v20;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v35 = v15;
    v22 = v15;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v28 = v19->_welcomeController;
          objc_msgSend(v27, "titleText");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "descriptionText");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "image");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBWelcomeController addBulletedListItemWithTitle:description:image:](v28, "addBulletedListItemWithTitle:description:image:", v29, v30, v31);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v24);
    }

    v17 = v34;
    v43 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingViewController commonSetupWithPrimaryButtonText:privacyLinkBundleIdentifiers:](v19, "commonSetupWithPrimaryButtonText:privacyLinkBundleIdentifiers:", v16, v32);

    v14 = v36;
    v13 = v37;
    v15 = v35;
  }

  return v19;
}

- (AMSUIOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkBundleIdentifier:(id)a6
{
  return -[AMSUIOnboardingViewController initWithHeaderImage:titleText:features:primaryButtonText:privacyLinkBundleIdentifier:](self, "initWithHeaderImage:titleText:features:primaryButtonText:privacyLinkBundleIdentifier:", 0, a3, a4, a5, a6);
}

- (void)commonSetupWithPrimaryButtonText:(id)a3 privacyLinkBundleIdentifiers:(id)a4
{
  -[AMSUIOnboardingViewController commonSetupWithPrimaryButtonText:secondaryButtonText:privacyLinkBundleIdentifiers:](self, "commonSetupWithPrimaryButtonText:secondaryButtonText:privacyLinkBundleIdentifiers:", a3, 0, a4);
}

- (void)commonSetupWithPrimaryButtonText:(id)a3 secondaryButtonText:(id)a4 privacyLinkBundleIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *metricsQueue;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  Class (*v27)(uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AppleMediaServicesUI.onboardingMetrics", 0);
  metricsQueue = self->_metricsQueue;
  self->_metricsQueue = v11;

  if (v10)
  {
    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buttonTray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addPrivacyLinkForBundles:", v10);

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v15 = (void *)getOBBoldTrayButtonClass_softClass;
  v33 = getOBBoldTrayButtonClass_softClass;
  if (!getOBBoldTrayButtonClass_softClass)
  {
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __getOBBoldTrayButtonClass_block_invoke;
    v28 = &unk_24CB4F3E8;
    v29 = &v30;
    __getOBBoldTrayButtonClass_block_invoke((uint64_t)&v25);
    v15 = (void *)v31[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v30, 8);
  objc_msgSend(v16, "boldButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:forState:", v8, 0);
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("amsui.onboarding.primaryButton"));
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_didTapPrimaryButton_, 64);
  -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "buttonTray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addButton:", v17);

  if (v9)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v20 = (void *)getOBLinkTrayButtonClass_softClass;
    v33 = getOBLinkTrayButtonClass_softClass;
    if (!getOBLinkTrayButtonClass_softClass)
    {
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = __getOBLinkTrayButtonClass_block_invoke;
      v28 = &unk_24CB4F3E8;
      v29 = &v30;
      __getOBLinkTrayButtonClass_block_invoke((uint64_t)&v25);
      v20 = (void *)v31[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v30, 8);
    objc_msgSend(v21, "linkButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:forState:", v9, 0);
    objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("amsui.onboarding.secondaryButton"));
    objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_didTapSecondaryButton_, 64);
    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "buttonTray");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addButton:", v22);

  }
}

- (void)commonInitWithPrimaryButtonText:(id)a3 privacyLinkBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(getOBPrivacyLinkControllerClass(), "linkWithBundleIdentifier:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AMSUIOnboardingViewController commonInitWithPrimaryButtonText:privacyLinkController:](self, "commonInitWithPrimaryButtonText:privacyLinkController:", v7, v8);
}

- (void)commonInitWithPrimaryButtonText:(id)a3 privacyLinkController:(id)a4
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *metricsQueue;

  v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AppleMediaServicesUI.onboardingMetrics", 0);
  metricsQueue = self->_metricsQueue;
  self->_metricsQueue = v5;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)AMSUIOnboardingViewController;
  -[AMSUIOnboardingViewController viewDidLoad](&v27, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingViewController addChildViewController:](self, "addChildViewController:", v6);

    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModalPresentationStyle:", 2);

    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutoresizingMask:", 18);

    -[AMSUIOnboardingViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v12, v14, v16, v18);

    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("amsui.onboarding"));

    -[AMSUIOnboardingViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v25);

    -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "didMoveToParentViewController:", self);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIOnboardingViewController;
  -[AMSUIOnboardingViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[AMSUIOnboardingViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingViewController setWasNavigationBarHidden:](self, "setWasNavigationBarHidden:", objc_msgSend(v5, "isNavigationBarHidden"));

  -[AMSUIOnboardingViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNavigationBarHidden:animated:", 1, v3);

  -[AMSUIOnboardingViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalInPresentation:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AMSUIOnboardingViewController;
  -[AMSUIOnboardingViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[AMSUIOnboardingViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", -[AMSUIOnboardingViewController wasNavigationBarHidden](self, "wasNavigationBarHidden"), v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIOnboardingViewController;
  -[AMSUIOnboardingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AMSUIOnboardingViewController viewHasAppeared](self, "viewHasAppeared");
  -[AMSUIOnboardingViewController setViewHasAppeared:](self, "setViewHasAppeared:", 1);
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AMSUIOnboardingViewController;
  -[AMSUIOnboardingViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AMSUIOnboardingViewController welcomeController](self, "welcomeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  -[AMSUIOnboardingViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (UITraitCollection)cappedTraitCollection
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
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (cappedTraitCollection_onceToken != -1)
    dispatch_once(&cappedTraitCollection_onceToken, &__block_literal_global_10);
  -[AMSUIOnboardingViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {

    goto LABEL_7;
  }
  v5 = (void *)cappedTraitCollection_cappedSizes;
  -[AMSUIOnboardingViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v7);

  if (!(_DWORD)v5)
  {
LABEL_7:
    v12 = 0;
    return (UITraitCollection *)v12;
  }
  v8 = (void *)MEMORY[0x24BEBDAB0];
  -[AMSUIOnboardingViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE070]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollectionWithTraitsFromCollections:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v12;
}

void __54__AMSUIOnboardingViewController_cappedTraitCollection__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEBE060];
  v3[0] = *MEMORY[0x24BEBE068];
  v3[1] = v0;
  v3[2] = *MEMORY[0x24BEBE058];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cappedTraitCollection_cappedSizes;
  cappedTraitCollection_cappedSizes = v1;

}

- (id)childTraitCollectionForViewController:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;

  v4 = a3;
  getOBPrivacyLinkControllerClass();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AMSUIOnboardingViewController cappedTraitCollection](self, "cappedTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)updateOverrideTraits
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AMSUIOnboardingViewController childViewControllers](self, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[AMSUIOnboardingViewController childTraitCollectionForViewController:](self, "childTraitCollectionForViewController:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIOnboardingViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v9, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)keyCommands
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_didTapPrimaryButton_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingViewController primaryButtonText](self, "primaryButtonText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v11.receiver = self;
  v11.super_class = (Class)AMSUIOnboardingViewController;
  -[AMSUIOnboardingViewController keyCommands](&v11, sel_keyCommands);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x24BDBD1A8];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v8, "arrayByAddingObject:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)didTapSecondaryButton:(id)a3
{
  void *v4;
  void (**v5)(id, AMSUIOnboardingViewController *);

  -[AMSUIOnboardingViewController secondaryButtonCallback](self, "secondaryButtonCallback", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIOnboardingViewController secondaryButtonCallback](self, "secondaryButtonCallback");
    v5 = (void (**)(id, AMSUIOnboardingViewController *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
}

- (void)didTapPrimaryButton:(id)a3
{
  void *v4;
  void (**v5)(id, AMSUIOnboardingViewController *);

  -[AMSUIOnboardingViewController primaryButtonCallback](self, "primaryButtonCallback", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIOnboardingViewController primaryButtonCallback](self, "primaryButtonCallback");
    v5 = (void (**)(id, AMSUIOnboardingViewController *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
}

- (BOOL)isPresentedInFormSheet
{
  uint64_t v3;
  void *v4;
  AMSUIOnboardingViewController *v5;
  AMSUIOnboardingViewController *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[AMSUIOnboardingViewController navigationController](self, "navigationController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (AMSUIOnboardingViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  -[AMSUIOnboardingViewController presentationController](v6, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_activePresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "presentationStyle") == 2;

  return v9;
}

+ (id)privacyLinkIdentifiersFromController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "bundles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (UIImage)rightImage
{
  return self->_rightImage;
}

- (void)setRightImage:(id)a3
{
  objc_storeStrong((id *)&self->_rightImage, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
}

- (NSString)primaryButtonText
{
  return self->_primaryButtonText;
}

- (void)setPrimaryButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButtonText, a3);
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (void)setPrivacyLinkController:(id)a3
{
  objc_storeStrong((id *)&self->_privacyLinkController, a3);
}

- (id)primaryButtonCallback
{
  return self->_primaryButtonCallback;
}

- (void)setPrimaryButtonCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (id)secondaryButtonCallback
{
  return self->_secondaryButtonCallback;
}

- (void)setSecondaryButtonCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (OBWelcomeController)welcomeController
{
  return self->_welcomeController;
}

- (void)setWelcomeController:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeController, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)secondaryButtonText
{
  return self->_secondaryButtonText;
}

- (void)setSecondaryButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButtonText, a3);
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metricsQueue, a3);
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (BOOL)wasNavigationBarHidden
{
  return self->_wasNavigationBarHidden;
}

- (void)setWasNavigationBarHidden:(BOOL)a3
{
  self->_wasNavigationBarHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_secondaryButtonText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong(&self->_secondaryButtonCallback, 0);
  objc_storeStrong(&self->_primaryButtonCallback, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_primaryButtonText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_rightImage, 0);
}

@end
