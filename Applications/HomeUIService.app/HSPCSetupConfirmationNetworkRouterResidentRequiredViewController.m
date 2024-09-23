@implementation HSPCSetupConfirmationNetworkRouterResidentRequiredViewController

- (HSPCSetupConfirmationNetworkRouterResidentRequiredViewController)initWithPopupDelegate:(id)a3 setupAccessoryDescription:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HSPCSetupConfirmationNetworkRouterResidentRequiredViewController *v16;
  HSPCSetupConfirmationNetworkRouterResidentRequiredViewController *v17;
  uint64_t v18;
  void *v19;
  HSPCSetupConfirmationNetworkRouterResidentRequiredViewController *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  HSPCSetupConfirmationNetworkRouterResidentRequiredViewController *v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000593D8(CFSTR("HSSetupConfirmationNetworkRouterResidentRequiredViewControllerTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = HFLocalizedWiFiStringKeyForKey(CFSTR("HSSetupConfirmationNetworkRouterResidentRequiredViewControllerDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_1000593D8(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = HUImageNamed(CFSTR("HUSetupNetworkRouterEnableSecurity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v27.receiver = self;
  v27.super_class = (Class)HSPCSetupConfirmationNetworkRouterResidentRequiredViewController;
  v16 = -[HSPCSetupConfirmationNetworkRouterResidentRequiredViewController initWithTitle:detailText:contentImage:](&v27, "initWithTitle:detailText:contentImage:", v9, v13, v15);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_popupDelegate, v6);
    objc_storeStrong((id *)&v17->_setupAccessoryDescription, a4);
    v18 = HULocalizedString(CFSTR("HUDoneTitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100031DC4;
    v25[3] = &unk_1000A2268;
    v20 = v17;
    v26 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v19, 0, v25));
    v22 = -[HSPCSetupConfirmationNetworkRouterResidentRequiredViewController addAction:](v20, "addAction:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_learnAboutNetworkProtectionURL](NSURL, "hf_learnAboutNetworkProtectionURL"));
    -[HSPCSetupConfirmationNetworkRouterResidentRequiredViewController addLearnMoreButtonWithURL:](v20, "addLearnMoreButtonWithURL:", v23);

  }
  return v17;
}

- (HSPCSetupConfirmationNetworkRouterResidentRequiredViewController)initWithSetupAccessoryDescription:(id)a3
{
  return -[HSPCSetupConfirmationNetworkRouterResidentRequiredViewController initWithPopupDelegate:setupAccessoryDescription:](self, "initWithPopupDelegate:setupAccessoryDescription:", 0, a3);
}

- (unint64_t)popupType
{
  return 0;
}

- (HFSetupPairingPopupDelegate)popupDelegate
{
  return (HFSetupPairingPopupDelegate *)objc_loadWeakRetained((id *)&self->_popupDelegate);
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_destroyWeak((id *)&self->_popupDelegate);
}

@end
