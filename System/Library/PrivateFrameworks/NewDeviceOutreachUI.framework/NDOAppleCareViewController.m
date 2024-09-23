@implementation NDOAppleCareViewController

- (NDOAppleCareViewController)initWithWarranty:(id)a3
{
  return -[NDOAppleCareViewController initWithWarranty:presentationType:](self, "initWithWarranty:presentationType:", a3, 0);
}

- (NDOAppleCareViewController)initWithWarranty:(id)a3 presentationType:(unint64_t)a4
{
  return -[NDOAppleCareViewController initWithWarranty:presentationType:serialNumber:](self, "initWithWarranty:presentationType:serialNumber:", a3, a4, 0);
}

- (NDOAppleCareViewController)initWithWarranty:(id)a3 presentationType:(unint64_t)a4 serialNumber:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NDOAppleCareViewController *v17;

  v8 = a5;
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BE6C490];
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = a3;
    objc_msgSend(v10, "stringWithFormat:", CFSTR("DEBUG:%@"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceWithName:serialNumber:activationDate:deviceType:", v12, v8, 0, 0);
  }
  else
  {
    v13 = a3;
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "defaultDevice");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6C498], "deviceInfoWithDevice:warranty:", v14, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NDOAppleCareViewController source](self, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NDOAppleCareViewController initWithDeviceInfo:presentationType:source:deeplinkParams:](self, "initWithDeviceInfo:presentationType:source:deeplinkParams:", v15, a4, v16, 0);

  return v17;
}

- (NDOAppleCareViewController)initWithDeviceInfo:(id)a3 presentationType:(unint64_t)a4
{
  return -[NDOAppleCareViewController initWithDeviceInfo:presentationType:source:deeplinkParams:](self, "initWithDeviceInfo:presentationType:source:deeplinkParams:", a3, a4, CFSTR("UNKNOWN"), 0);
}

- (NDOAppleCareViewController)initWithDeviceInfo:(id)a3 presentationType:(unint64_t)a4 source:(id)a5 deeplinkParams:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NDOAppleCareViewController *v14;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)NDOAppleCareViewController;
  v14 = -[NDOAppleCareViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, CFSTR("NDOAppleCareView"), v13);

  if (v14)
  {
    -[NDOAppleCareViewController setDeviceInfo:](v14, "setDeviceInfo:", v10);
    -[NDOAppleCareViewController setPresentationType:](v14, "setPresentationType:", a4);
    -[NDOAppleCareViewController setSource:](v14, "setSource:", v11);
    -[NDOAppleCareViewController setDeeplinkParams:](v14, "setDeeplinkParams:", v12);
  }

  return v14;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 6)
  {

    return 30;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    return 30;
  return 2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NDOAppleCareViewController;
  -[NDOAppleCareViewController loadView](&v5, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPressed_);
  -[NDOAppleCareViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NDOAppleCareViewController;
  -[NDOAppleCareViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[NDOAppleCareViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BEBD790]);
  objc_msgSend(v5, "configureWithTransparentBackground");
  objc_msgSend(v4, "setScrollEdgeAppearance:", v5);
  objc_msgSend(v4, "setStandardAppearance:", v5);
  objc_msgSend(v4, "setCompactAppearance:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD block[5];
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)NDOAppleCareViewController;
  -[NDOAppleCareViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  if (objc_msgSend(MEMORY[0x24BE6C4B0], "isInternal"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("NDOAppleCareViewControllerTestPurchase"));

    if (v5)
    {
      _NDOLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[NDOAppleCareViewController viewDidAppear:]";
        _os_log_impl(&dword_229EC7000, v6, OS_LOG_TYPE_DEFAULT, "%s: Testing kNDOAppleCareViewControllerTestPurchase", buf, 0xCu);
      }

      v7 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__NDOAppleCareViewController_viewDidAppear___block_invoke;
      block[3] = &unk_24F334938;
      block[4] = self;
      dispatch_after(v7, MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __44__NDOAppleCareViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeWithStatus:", 2);
}

- (void)updatePromotionLabelWithWarranty:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "acOfferPromoFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v24, "acOfferPromoNew");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v8 = objc_alloc(MEMORY[0x24BDD1688]);
    if (v7)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v24, "acOfferPromoFormat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "acOfferPromoNew");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "initWithString:", v12);

      objc_msgSend(v13, "mutableString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "acOfferPromoNew");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "rangeOfString:options:", v15, 1);
      v18 = v17;

      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_8:
        -[NDOAppleCareViewController promoTextLabel](self, "promoTextLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAttributedText:", v13);

        goto LABEL_9;
      }
      v19 = *MEMORY[0x24BEBB368];
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttribute:value:range:", v19, v20, v16, v18);
    }
    else
    {
      objc_msgSend(v24, "acOfferPromoFormat");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "initWithString:", v20);
    }

    goto LABEL_8;
  }
  -[NDOAppleCareViewController comboStackView](self, "comboStackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppleCareViewController promoTextLabel](self, "promoTextLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeArrangedSubview:", v22);

  -[NDOAppleCareViewController promoTextLabel](self, "promoTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);
LABEL_9:

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
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
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v60;
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];

  v63[2] = *MEMORY[0x24BDAC8D0];
  v60.receiver = self;
  v60.super_class = (Class)NDOAppleCareViewController;
  -[NDOAppleCareViewController viewDidLoad](&v60, sel_viewDidLoad);
  if (!-[NDOAppleCareViewController presentationType](self, "presentationType"))
  {
    -[NDOAppleCareViewController buttonStackView](self, "buttonStackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOAppleCareViewController notNowButton](self, "notNowButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeArrangedSubview:", v4);

    -[NDOAppleCareViewController notNowButton](self, "notNowButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

  }
  -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "warranty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NDOAppleCareViewController updatePromotionLabelWithWarranty:](self, "updatePromotionLabelWithWarranty:", v7);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom") == 6)
  {
    v9 = -[NDOAppleCareViewController presentationType](self, "presentationType");

    if (v9 == 1)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "acLocalizedOfferDetails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOAppleCareViewController detailsTextLabel](self, "detailsTextLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "acLocalizedOfferDetailsEligibility");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOAppleCareViewController detailsText2Label](self, "detailsText2Label");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      -[NDOAppleCareViewController comboStackView](self, "comboStackView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSpacing:", 15.0);
      goto LABEL_8;
    }
  }
  else
  {

  }
  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "acLocalizedOfferDetails");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppleCareViewController detailsTextLabel](self, "detailsTextLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  v23 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "acLocalizedOfferDetailsEligibility");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@"), v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppleCareViewController detailsText2Label](self, "detailsText2Label");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v24);

LABEL_8:
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "userInterfaceIdiom") == 1)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceIdiom");

    if (v28 != 6)
      goto LABEL_14;
  }
  v29 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppleCareViewController trailingConstraint](self, "trailingConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v30;
  -[NDOAppleCareViewController leadingConstraint](self, "leadingConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "deactivateConstraints:", v32);

  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = (void *)MEMORY[0x24BDD1628];
  -[NDOAppleCareViewController continueButton](self, "continueButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 7, 0, 0, 7, 1.0, 360.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "addObject:", v36);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v33);
  -[NDOAppleCareViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNeedsUpdateConstraints");

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "userInterfaceIdiom");

  if (v39 == 6)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 30.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOAppleCareViewController acHeaderLabel](self, "acHeaderLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFont:", v40);

    v42 = *MEMORY[0x24BEBE220];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOAppleCareViewController promoTextLabel](self, "promoTextLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFont:", v43);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOAppleCareViewController detailsTextLabel](self, "detailsTextLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFont:", v45);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v42);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOAppleCareViewController detailsText2Label](self, "detailsText2Label");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFont:", v47);

    -[NDOAppleCareViewController setPreferredContentSize:](self, "setPreferredContentSize:", 520.0, 420.0);
  }

LABEL_14:
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bundleIdentifier");
  v50 = objc_claimAutoreleasedReturnValue();

  if (v50)
    v51 = (__CFString *)v50;
  else
    v51 = CFSTR("No identifier");
  v61[0] = CFSTR("devicetype");
  -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "device");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "deviceTypeString");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v54;
  v61[1] = CFSTR("remainingdays");
  v55 = (void *)MEMORY[0x24BDD16E0];
  -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "warranty");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "numberWithUnsignedInt:", objc_msgSend(v57, "daysEligible"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = CFSTR("entrypoint");
  v62[1] = v58;
  v62[2] = v51;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6C4A0], "postCAEventFor:eventDict:", CFSTR("com.apple.newdeviceoutreach.purchaseflow.viewload"), v59);
}

- (void)getAppleCarePressed:(id)a3
{
  NSObject *v4;
  NDOAppleCareAMSUIViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NDOAppleCareAMSUIViewController *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[NDOAppleCareViewController getAppleCarePressed:]";
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  v5 = [NDOAppleCareAMSUIViewController alloc];
  -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "warranty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppleCareViewController source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOAppleCareViewController deeplinkParams](self, "deeplinkParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NDOAppleCareAMSUIViewController initWithWarranty:serialNumber:source:deeplinkParams:](v5, "initWithWarranty:serialNumber:source:deeplinkParams:", v7, v10, v11, v12);

  -[NDOAppleCareAMSUIViewController setPresenter:](v13, "setPresenter:", self);
  -[NDOAppleCareAMSUIViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 3);
  -[NDOAppleCareViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v13, 1);

}

- (void)completeWithStatus:(unint64_t)a3
{
  -[NDOAppleCareViewController completeWithStatus:params:](self, "completeWithStatus:params:", a3, 0);
}

- (void)completeWithStatus:(unint64_t)a3 params:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NDOAppleCareWebViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NDOAppleCareWebViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NDOAppleCareWebViewController *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[NDOAppleCareViewController presentor](self, "presentor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136315906;
    v24 = "-[NDOAppleCareViewController completeWithStatus:params:]";
    v25 = 2048;
    v26 = a3;
    v27 = 2112;
    v28 = v6;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "%s: status: %ld, params: %@, presentor: %@", (uint8_t *)&v23, 0x2Au);

  }
  if (a3 != 3)
  {
    if (a3 == 4)
    {
      v9 = [NDOAppleCareWebViewController alloc];
      -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "warranty");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serialNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[NDOAppleCareWebViewController initWithWarranty:serialNumber:params:](v9, "initWithWarranty:serialNumber:params:", v11, v14, v6);

      -[NDOAppleCareWebViewController setPresenter:](v15, "setPresenter:", self);
      -[NDOAppleCareWebViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 3);
      -[NDOAppleCareViewController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[NDOAppleCareViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, &__block_literal_global);
        goto LABEL_12;
      }
      -[NDOAppleCareViewController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pushViewController:animated:", v15, 1);
    }
    else
    {
      -[NDOAppleCareViewController presentor](self, "presentor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      -[NDOAppleCareViewController presentor](self, "presentor");
      v20 = (NDOAppleCareWebViewController *)objc_claimAutoreleasedReturnValue();
      v15 = v20;
      if ((v19 & 1) != 0)
      {
        -[NDOAppleCareWebViewController outreachFinishedWithCompletion:](v20, "outreachFinishedWithCompletion:", a3);
LABEL_12:

        goto LABEL_13;
      }
      -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serialNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOAppleCareWebViewController outreachFinishedForDeviceWithSerialNumber:withCompletion:](v15, "outreachFinishedForDeviceWithSerialNumber:withCompletion:", v22, a3);

    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)notNowPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  NDOAppleCareViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[NDOAppleCareViewController notNowPressed:]";
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom") == 6)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "userInterfaceIdiom") == 1;

  }
  -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "deviceType");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 == 1)
    v13 = CFSTR("ALERT_MSG_WATCH");
  else
    v13 = CFSTR("ALERT_MSG_DEFAULT");
  v14 = self;
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24F3352F8, CFSTR("Localizable"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ALERT_TITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v17, v32, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Remind Me Later"), &stru_24F3352F8, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __44__NDOAppleCareViewController_notNowPressed___block_invoke;
  v35[3] = &unk_24F3349A0;
  v35[4] = self;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Don't Show Again"), &stru_24F3352F8, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v22;
  v34[1] = 3221225472;
  v34[2] = __44__NDOAppleCareViewController_notNowPressed___block_invoke_2;
  v34[3] = &unk_24F3349A0;
  v34[4] = self;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 2, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F3352F8, CFSTR("Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v22;
  v33[1] = 3221225472;
  v33[2] = __44__NDOAppleCareViewController_notNowPressed___block_invoke_4;
  v33[3] = &unk_24F3349A0;
  v33[4] = v14;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 1, v33);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAction:", v23);
  objc_msgSend(v18, "addAction:", v27);
  objc_msgSend(v18, "addAction:", v31);
  -[NDOAppleCareViewController presentViewController:animated:completion:](v14, "presentViewController:animated:completion:", v18, 1, 0);

}

void __44__NDOAppleCareViewController_notNowPressed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("devicetype");
  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("remainingdays");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "warranty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInt:", objc_msgSend(v7, "daysEligible"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = CFSTR("actionorigin");
  v11[1] = v8;
  v11[2] = CFSTR("RemindMeLater");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6C4A0], "postCAEventFor:eventDict:", CFSTR("com.apple.newdeviceoutreach.purchaseflow.viewcancel"), v9);
  objc_msgSend(*(id *)(a1 + 32), "completeWithStatus:", 0);

}

void __44__NDOAppleCareViewController_notNowPressed___block_invoke_2(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v19[0] = CFSTR("devicetype");
  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("remainingdays");
  v20[0] = v6;
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "warranty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v9, "daysEligible"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6C4A0], "postCAEventFor:eventDict:", CFSTR("com.apple.newdeviceoutreach.purchaseflow.viewnotnow"), v11);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v12 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __44__NDOAppleCareViewController_notNowPressed___block_invoke_3;
  v16[3] = &unk_24F3349C8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v12, "storeUserInitiatedFollowUpDismissalForSerialNumber:withReply:", v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __44__NDOAppleCareViewController_notNowPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeWithStatus:", 1);

}

void __44__NDOAppleCareViewController_notNowPressed___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("devicetype");
  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("remainingdays");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "warranty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInt:", objc_msgSend(v7, "daysEligible"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = CFSTR("actionorigin");
  v11[1] = v8;
  v11[2] = CFSTR("AlertCancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6C4A0], "postCAEventFor:eventDict:", CFSTR("com.apple.newdeviceoutreach.purchaseflow.viewcancel"), v9);
}

- (void)cancelPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[NDOAppleCareViewController cancelPressed:]";
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[NDOAppleCareViewController deviceInfo](self, "deviceInfo", CFSTR("devicetype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceTypeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v13[1] = CFSTR("remainingdays");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[NDOAppleCareViewController deviceInfo](self, "deviceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "warranty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v10, "daysEligible"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = CFSTR("actionorigin");
  v14[1] = v11;
  v14[2] = CFSTR("NavigationCancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6C4A0], "postCAEventFor:eventDict:", CFSTR("com.apple.newdeviceoutreach.purchaseflow.viewcancel"), v12);
  -[NDOAppleCareViewController completeWithStatus:](self, "completeWithStatus:", 0);

}

- (void)okButtonPressed
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[NDOAppleCareViewController okButtonPressed]";
    _os_log_impl(&dword_229EC7000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[NDOAppleCareViewController completeWithStatus:](self, "completeWithStatus:", 0);
}

- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3 params:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[NDOAppleCareViewController amsUIViewFinishedWithCompletion:params:]";
    v11 = 2048;
    v12 = a3;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "%s: status: %ld, params: %@", (uint8_t *)&v9, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("paramString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[NDOAppleCareViewController completeWithStatus:params:](self, "completeWithStatus:params:", a3, v8);

}

- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[NDOAppleCareViewController amsUIViewFinishedWithCompletion:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_229EC7000, v5, OS_LOG_TYPE_DEFAULT, "%s: status: %ld", (uint8_t *)&v7, 0x16u);
  }

  -[NDOAppleCareViewController completeWithStatus:](self, "completeWithStatus:", a3);
  -[NDOAppleCareViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[NDOAppleCareViewController cancelPressed:](self, "cancelPressed:", 0);
}

- (void)webviewFinishedWithCompletion:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[NDOAppleCareViewController webviewFinishedWithCompletion:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_229EC7000, v5, OS_LOG_TYPE_DEFAULT, "%s: status: %ld", (uint8_t *)&v6, 0x16u);
  }

  -[NDOAppleCareViewController completeWithStatus:](self, "completeWithStatus:", a3);
}

- (NDOAppleCareFlowDelegate)presentor
{
  return (NDOAppleCareFlowDelegate *)objc_loadWeakRetained((id *)&self->_presentor);
}

- (void)setPresentor:(id)a3
{
  objc_storeWeak((id *)&self->_presentor, a3);
}

- (NDODeviceInfo)deviceInfo
{
  return (NDODeviceInfo *)objc_getProperty(self, a2, 976, 1);
}

- (void)setDeviceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (unint64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unint64_t)a3
{
  self->_presentationType = a3;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 992, 1);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (NSString)deeplinkParams
{
  return (NSString *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setDeeplinkParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (NSLayoutConstraint)leadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_leadingConstraint);
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_trailingConstraint);
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_trailingConstraint, a3);
}

- (UIStackView)comboStackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_comboStackView);
}

- (void)setComboStackView:(id)a3
{
  objc_storeWeak((id *)&self->_comboStackView, a3);
}

- (UILabel)acHeaderLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_acHeaderLabel);
}

- (void)setAcHeaderLabel:(id)a3
{
  objc_storeWeak((id *)&self->_acHeaderLabel, a3);
}

- (UILabel)promoTextLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_promoTextLabel);
}

- (void)setPromoTextLabel:(id)a3
{
  objc_storeWeak((id *)&self->_promoTextLabel, a3);
}

- (UILabel)detailsTextLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_detailsTextLabel);
}

- (void)setDetailsTextLabel:(id)a3
{
  objc_storeWeak((id *)&self->_detailsTextLabel, a3);
}

- (UILabel)detailsText2Label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_detailsText2Label);
}

- (void)setDetailsText2Label:(id)a3
{
  objc_storeWeak((id *)&self->_detailsText2Label, a3);
}

- (UIStackView)buttonStackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_buttonStackView);
}

- (void)setButtonStackView:(id)a3
{
  objc_storeWeak((id *)&self->_buttonStackView, a3);
}

- (UIButton)notNowButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_notNowButton);
}

- (void)setNotNowButton:(id)a3
{
  objc_storeWeak((id *)&self->_notNowButton, a3);
}

- (UIButton)continueButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_continueButton);
}

- (void)setContinueButton:(id)a3
{
  objc_storeWeak((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_continueButton);
  objc_destroyWeak((id *)&self->_notNowButton);
  objc_destroyWeak((id *)&self->_buttonStackView);
  objc_destroyWeak((id *)&self->_detailsText2Label);
  objc_destroyWeak((id *)&self->_detailsTextLabel);
  objc_destroyWeak((id *)&self->_promoTextLabel);
  objc_destroyWeak((id *)&self->_acHeaderLabel);
  objc_destroyWeak((id *)&self->_comboStackView);
  objc_destroyWeak((id *)&self->_trailingConstraint);
  objc_destroyWeak((id *)&self->_leadingConstraint);
  objc_storeStrong((id *)&self->_deeplinkParams, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_destroyWeak((id *)&self->_presentor);
}

@end
