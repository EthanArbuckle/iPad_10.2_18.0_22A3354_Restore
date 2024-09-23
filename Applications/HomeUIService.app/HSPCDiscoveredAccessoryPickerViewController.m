@implementation HSPCDiscoveredAccessoryPickerViewController

- (HSPCDiscoveredAccessoryPickerViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSDiscoveredAccessoryPickerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HSDiscoveredAccessoryPickerViewController *v14;
  HSPCDiscoveredAccessoryPickerViewController *v15;
  HSPCDiscoveredAccessoryPickerViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v9 = [HSDiscoveredAccessoryPickerViewController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryBrowser"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entitlementContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setupAccessoryDescription"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "matterDeviceSetupRequest"));
  v14 = -[HSDiscoveredAccessoryPickerViewController initWithAccessoryBrowsingManager:entitlementContext:setupAccessoryDescription:matterDeviceSetupRequest:](v9, "initWithAccessoryBrowsingManager:entitlementContext:setupAccessoryDescription:matterDeviceSetupRequest:", v10, v11, v12, v13);

  v27.receiver = self;
  v27.super_class = (Class)HSPCDiscoveredAccessoryPickerViewController;
  v15 = -[HSPCDiscoveredAccessoryPickerViewController initWithContentView:](&v27, "initWithContentView:", 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_coordinator, a3);
    objc_storeStrong((id *)&v16->_config, a4);
    if ((objc_msgSend(v8, "isSetupInitiatedByOtherMatterEcosystem") & 1) != 0
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home")), v17, !v17))
    {
      v22 = HULocalizedString(CFSTR("HUProximityCardSelectNearbyAccessoryTitle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[HSPCDiscoveredAccessoryPickerViewController setTitle:](v16, "setTitle:", v18);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
      v20 = HULocalizedStringWithFormat(CFSTR("HUProximityCardSelectNearbyAccessoryTitle_withHomeName"), CFSTR("%@"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      -[HSPCDiscoveredAccessoryPickerViewController setTitle:](v16, "setTitle:", v21, v19);

    }
    v23 = sub_1000593D8(CFSTR("HSSetupCodeSubtitlePickAccessory"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[HSPCDiscoveredAccessoryPickerViewController setSubtitle:](v16, "setSubtitle:", v24);

    -[HSDiscoveredAccessoryPickerViewController setDiscoveredAccessoryPickerViewControllerDelegate:](v14, "setDiscoveredAccessoryPickerViewControllerDelegate:", v16);
    objc_storeStrong((id *)&v16->_contentVC, v14);
    v25 = -[HSPCDiscoveredAccessoryPickerViewController addProminentButtonWithTitleKey:target:futureSelector:](v16, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HSDiscoveredAccessoryGridNotListedButton"), v16, "onAccessoryNotListedButton");
  }

  return v16;
}

- (id)onAccessoryNotListedButton
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "didReceiveDiscoveredAccessory:", 0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002AA24;
  v7[3] = &unk_1000A1620;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flatMap:", v7));

  return v5;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8278);
}

- (void)configureNextViewController:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = objc_opt_class(HSPCTroubleshootingTipsViewController, v4);
  v8 = v3;
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setPage:", 0);
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  _QWORD v61[5];
  objc_super v62;
  _QWORD v63[4];
  _QWORD v64[4];

  v62.receiver = self;
  v62.super_class = (Class)HSPCDiscoveredAccessoryPickerViewController;
  -[HSPCDiscoveredAccessoryPickerViewController viewDidLoad](&v62, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  -[HSPCDiscoveredAccessoryPickerViewController addChildViewController:](self, "addChildViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v4, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  objc_msgSend(v7, "didMoveToParentViewController:", self);

  v59 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentView](self, "contentView"));
  objc_msgSend(v8, "addSubview:", v59);

  objc_msgSend(v59, "startAnimating");
  -[HSPCDiscoveredAccessoryPickerViewController setSpinnerView:](self, "setSpinnerView:", v59);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainContentGuide"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leftAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leftAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v51));
  v64[0] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v42));
  v64[1] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "rightAnchor"));
  v60 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v64[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v64[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController spinnerView](self, "spinnerView"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController spinnerView](self, "spinnerView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "centerXAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "centerXAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v54));
  v63[0] = v52;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController spinnerView](self, "spinnerView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "centerYAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "centerYAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v46));
  v63[1] = v43;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController spinnerView](self, "spinnerView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v25));
  v63[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController spinnerView](self, "spinnerView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v29));
  v63[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  v33 = objc_opt_class(HSDiscoveredAccessoryPickerViewController, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController contentVC](self, "contentVC"));
  if ((objc_opt_isKindOfClass(v34, v33) & 1) != 0)
    v35 = v34;
  else
    v35 = 0;
  v36 = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "hu_preloadContent"));
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10002B0D8;
  v61[3] = &unk_1000A22E0;
  v61[4] = self;
  v38 = objc_msgSend(v37, "addCompletionBlock:", v61);

}

- (void)didSelectDiscoveredAccessory:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HSPCSetupNetworkRouterAppPunchoutViewController *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  HSPCDiscoveredAccessoryPickerViewController *v29;
  uint8_t buf[4];
  id v31;

  v4 = a3;
  if (!-[HSPCDiscoveredAccessoryPickerViewController shouldIgnoreFutureAccessorySelection](self, "shouldIgnoreFutureAccessorySelection"))
  {
    -[HSPCDiscoveredAccessoryPickerViewController setShouldIgnoreFutureAccessorySelection:](self, "setShouldIgnoreFutureAccessorySelection:", 1);
    v6 = HFLogForCategory(58, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didSelectDiscoveredAccessory, discoveredAccessory %@", buf, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharingDevice"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController coordinator](self, "coordinator"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10002B3D0;
      v27[3] = &unk_1000A15F8;
      v28 = v4;
      v29 = self;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v27));
      objc_msgSend(v9, "dismissProxCardFlowAfterExecuting:", v10);

    }
    else if (objc_msgSend(v4, "requiresSoftwareUpdate")
           && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory")),
               v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "category")),
               v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "categoryType")),
               v14 = objc_msgSend(v13, "isEqualToString:", HMAccessoryCategoryTypeAirPort),
               v13,
               v12,
               v11,
               v14))
    {
      -[HSPCDiscoveredAccessoryPickerViewController _presentSoftwareUpdateAlertForAirportExpress](self, "_presentSoftwareUpdateAlertForAirportExpress");
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "category"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "categoryType"));
      v18 = objc_msgSend(v17, "isEqualToString:", HMAccessoryCategoryTypeWiFiRouter);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController coordinator](self, "coordinator"));
      v20 = v19;
      if (v18)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "setupAccessoryDescription"));

        objc_msgSend(v21, "hf_updateWithDiscoveredAccessory:", v4);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController navigationController](self, "navigationController"));
        v23 = -[HSPCSetupNetworkRouterAppPunchoutViewController initWithPopupDelegate:setupAccessoryDescription:]([HSPCSetupNetworkRouterAppPunchoutViewController alloc], "initWithPopupDelegate:setupAccessoryDescription:", 0, v21);
        objc_msgSend(v22, "pushViewController:animated:", v23, 1);

      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "didReceiveDiscoveredAccessory:", v4));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10002B5F0;
        v26[3] = &unk_1000A22E0;
        v26[4] = self;
        v25 = objc_msgSend(v24, "addCompletionBlock:", v26);

      }
    }
  }

}

- (void)didUpdateNumberOfDiscoveredAccessories:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDiscoveredAccessoryPickerViewController spinnerView](self, "spinnerView"));
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "stopAnimating");
  else
    objc_msgSend(v4, "startAnimating");

}

- (void)_presentSoftwareUpdateAlertForAirportExpress
{
  void *v3;
  void *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id (*v16)(uint64_t);
  void ***v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void **v22;
  void **v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", CFSTR("com.apple.airport.mobileairportutility")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appState"));
  v5 = objc_msgSend(v4, "isInstalled");

  if (v5)
    v6 = CFSTR("HSTroubleshootingTipOpenAirPortUtilityTitle");
  else
    v6 = CFSTR("HSTroubleshootingTipInstallAirPortUtilityTitle");
  if (v5)
    v7 = CFSTR("HSTroubleshootingTipOpenAirPortUtilityDescription");
  else
    v7 = CFSTR("HSTroubleshootingTipInstallAirPortUtilityDescription");
  if (v5)
    v8 = CFSTR("HSTroubleshootingTipOpenAirPortUtilityAction");
  else
    v8 = CFSTR("HSTroubleshootingTipInstallAirPortUtilityAction");
  v9 = sub_1000593D8(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_1000593D8(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = sub_1000593D8(v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1));
  if (v5)
  {
    v23 = _NSConcreteStackBlock;
    v16 = sub_10002B860;
    v17 = &v23;
  }
  else
  {
    v22 = _NSConcreteStackBlock;
    v16 = sub_10002B868;
    v17 = &v22;
  }
  v17[1] = (void **)3221225472;
  v17[2] = (void **)v16;
  v17[3] = (void **)&unk_1000A14A0;
  v17[4] = (void **)self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v22));
  objc_msgSend(v15, "addAction:", v18);

  v19 = HULocalizedString(CFSTR("HUCancelTitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, &stru_1000A2320));
  objc_msgSend(v15, "addAction:", v21);

  -[HSPCDiscoveredAccessoryPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
}

- (void)_launchAirportUtility
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openApplicationWithBundleID:", CFSTR("com.apple.airport.mobileairportutility"));

}

- (void)_launchAppStore
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLookup bagSubProfile](AMSLookup, "bagSubProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLookup bagSubProfileVersion](AMSLookup, "bagSubProfileVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3));

  v5 = objc_alloc((Class)AMSLookup);
  v6 = objc_msgSend(v5, "initWithBag:caller:keyProfile:", v4, HFHomeDomain, AMSLookupKeyProfileLockup);
  v9 = CFSTR("com.apple.airport.mobileairportutility");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "performLookupWithBundleIdentifiers:itemIdentifiers:", v7, 0));

  objc_msgSend(v8, "addFinishBlock:", &stru_1000A2360);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UIViewController)contentVC
{
  return self->_contentVC;
}

- (void)setContentVC:(id)a3
{
  objc_storeStrong((id *)&self->_contentVC, a3);
}

- (UIActivityIndicatorView)spinnerView
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_spinnerView);
}

- (void)setSpinnerView:(id)a3
{
  objc_storeWeak((id *)&self->_spinnerView, a3);
}

- (BOOL)shouldIgnoreFutureAccessorySelection
{
  return self->_shouldIgnoreFutureAccessorySelection;
}

- (void)setShouldIgnoreFutureAccessorySelection:(BOOL)a3
{
  self->_shouldIgnoreFutureAccessorySelection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spinnerView);
  objc_storeStrong((id *)&self->_contentVC, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
