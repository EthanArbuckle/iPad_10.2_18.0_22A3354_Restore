@implementation HSPCSetupNetworkRouterAppPunchoutViewController

- (HSPCSetupNetworkRouterAppPunchoutViewController)initWithPopupDelegate:(id)a3 setupAccessoryDescription:(id)a4
{
  id v6;
  id v7;
  HSPCSetupNetworkRouterAppPunchoutViewController *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HULinkedApplicationItem *linkedApplicationItem;
  uint64_t v14;
  void *v15;
  HSPCSetupNetworkRouterAppPunchoutViewController *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  HSPCSetupNetworkRouterAppPunchoutViewController *v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HSPCSetupNetworkRouterAppPunchoutViewController;
  v8 = -[HSPCSetupNetworkRouterAppPunchoutViewController initWithContentView:](&v22, "initWithContentView:", 0);
  if (v8)
  {
    v9 = HULocalizedWiFiString(CFSTR("HUSetupNetworkRouterAppPunchoutTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[HSPCSetupNetworkRouterAppPunchoutViewController setTitle:](v8, "setTitle:", v10);

    v11 = HULocalizedString(CFSTR("HUSetupNetworkRouterAppPunchoutDescription_Loading"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCSetupNetworkRouterAppPunchoutViewController setSubtitle:](v8, "setSubtitle:", v12);

    objc_storeWeak((id *)&v8->_popupDelegate, v6);
    objc_storeStrong((id *)&v8->_setupAccessoryDescription, a4);
    linkedApplicationItem = v8->_linkedApplicationItem;
    v8->_linkedApplicationItem = 0;

    if (v6)
    {
      -[HSPCSetupNetworkRouterAppPunchoutViewController setDismissalType:](v8, "setDismissalType:", 1);
    }
    else
    {
      v14 = HULocalizedString(CFSTR("HUOkTitle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100029B14;
      v20[3] = &unk_1000A2268;
      v16 = v8;
      v21 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v15, 0, v20));
      v18 = -[HSPCSetupNetworkRouterAppPunchoutViewController addAction:](v16, "addAction:", v17);

    }
  }

  return v8;
}

- (unint64_t)popupType
{
  return 2;
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCSetupNetworkRouterAppPunchoutViewController;
  -[HSPCSetupNetworkRouterAppPunchoutViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = -[HSPCSetupNetworkRouterAppPunchoutViewController _lookUpSoftwareAndUpdateUI](self, "_lookUpSoftwareAndUpdateUI");
}

- (id)_lookUpSoftwareAndUpdateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSetupNetworkRouterAppPunchoutViewController setupAccessoryDescription](self, "setupAccessoryDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSetupNetworkRouterAppPunchoutViewController setupAccessoryDescription](self, "setupAccessoryDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));

  v8 = HFLogForCategory(58, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v4;
    v25 = 2112;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to resolve linked application for bundleID %@ storeID %@", buf, 0x16u);
  }

  v10 = objc_msgSend(objc_alloc((Class)HUSoftwareLibraryLookupRequest), "initWithBundleID:storeID:", v4, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HUSoftwareLibraryLookupResult resultForRequests:](HUSoftwareLibraryLookupResult, "resultForRequests:", v11));

  objc_initWeak((id *)buf, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reschedule:", v13));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100029DE0;
  v19[3] = &unk_1000A22B8;
  v19[4] = self;
  v15 = v6;
  v20 = v15;
  v16 = v4;
  v21 = v16;
  objc_copyWeak(&v22, (id *)buf);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flatMap:", v19));
  objc_destroyWeak(&v22);

  objc_destroyWeak((id *)buf);
  return v17;
}

- (void)_cancelPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HSPCSetupNetworkRouterAppPunchoutViewController popupDelegate](self, "popupDelegate", a3));
  objc_msgSend(v4, "pairingPopupDidCancel:", self);

}

- (HFSetupPairingPopupDelegate)popupDelegate
{
  return (HFSetupPairingPopupDelegate *)objc_loadWeakRetained((id *)&self->_popupDelegate);
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (HFAppPunchoutRequest)punchoutRequest
{
  return self->_punchoutRequest;
}

- (void)setPunchoutRequest:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutRequest, a3);
}

- (HULinkedApplicationItem)linkedApplicationItem
{
  return self->_linkedApplicationItem;
}

- (void)setLinkedApplicationItem:(id)a3
{
  objc_storeStrong((id *)&self->_linkedApplicationItem, a3);
}

- (PRXAction)punchOutAction
{
  return self->_punchOutAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchOutAction, 0);
  objc_storeStrong((id *)&self->_linkedApplicationItem, 0);
  objc_storeStrong((id *)&self->_punchoutRequest, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_destroyWeak((id *)&self->_popupDelegate);
}

@end
