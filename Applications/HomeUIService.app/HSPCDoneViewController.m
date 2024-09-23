@implementation HSPCDoneViewController

+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "isSetupInitiatedByOtherMatterEcosystem"))
    v9 = (objc_class *)HSPCMatterAccessoryDoneViewController;
  else
    v9 = (objc_class *)objc_opt_class(a1, v8);
  v10 = objc_msgSend([v9 alloc], "initWithCoordinator:config:", v7, v6);

  return v10;
}

- (HSPCDoneViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  HSPCDoneViewController *v12;
  HSPCDoneViewController *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v41;
  id v42;
  _QWORD v43[4];
  HSPCDoneViewController *v44;
  id v45;
  objc_super v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  HSPCDoneViewController *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc((Class)HUHomeAccessoryTileView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedAccessoryItem"));
  v11 = objc_msgSend(v9, "initWithFrame:item:iconOnlyTile:", v10, 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  v46.receiver = self;
  v46.super_class = (Class)HSPCDoneViewController;
  v12 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:](&v46, "initWithCenterContentView:", v11);
  v13 = v12;
  if (v12)
  {
    v42 = v8;
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
    v15 = objc_msgSend(v7, "numberOfAccessoriesInSameCategory");
    v41 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessoryCategoryOrPrimaryServiceType"));
    v17 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardDoneCardTitle"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController config](v13, "config"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "home"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v15, v21));
    -[HSPCDoneViewController setTitle:](v13, "setTitle:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController coordinator](v13, "coordinator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAccessoryTuple"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accessory"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController config](v13, "config"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "home"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hf_walletKeyAccessories"));
    if (objc_msgSend(v28, "containsObject:", v25))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hf_hasWalletKey"));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10001F330;
      v43[3] = &unk_1000A1B70;
      v44 = v13;
      v45 = v25;
      v31 = objc_msgSend(v30, "addSuccessBlock:", v43);

      v32 = v44;
    }
    else
    {
      v33 = HFLogForCategory(66, v29);
      v32 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v50 = v13;
        v51 = 2080;
        v52 = "-[HSPCDoneViewController initWithCoordinator:config:]";
        v53 = 2112;
        v54 = v28;
        v55 = 2112;
        v56 = v25;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding subtitle. walletKeyAccessories: %@, addedAccessory: %@", buf, 0x2Au);
      }
    }

    if ((objc_msgSend(v7, "requiresDismissalConfirmation") & 1) != 0)
    {
      v34 = -[HSPCDoneViewController addProminentButtonWithTitleKey:target:futureSelector:](v13, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v13, "commitConfiguration");
    }
    else
    {
      if (objc_msgSend(v7, "launchReason") == (id)1)
      {
        v48[0] = &off_1000A8140;
        v47[0] = HFAnalyticsResumeSetupSelectedOptionKey;
        v47[1] = HFAnalyticsDataAccessoryCategoryTypeKey;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "category"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "categoryType"));
        v48[1] = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));

        +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 29, v37);
      }
      v38 = -[HSPCDoneViewController addProminentDismissButtonWithTitleKey:](v13, "addProminentDismissButtonWithTitleKey:", CFSTR("HUDoneTitle"));
      if (-[HSPCDoneViewController shouldShowButtonLinkToHomeApp](v13, "shouldShowButtonLinkToHomeApp"))
        v39 = -[HSPCDoneViewController addOptionalButtonWithTitleKey:target:futureSelector:](v13, "addOptionalButtonWithTitleKey:target:futureSelector:", CFSTR("HUProximityCardSetupAccessoryDoneVCAdditionalSettingsButton"), v13, "launchAdditionalSettings");
    }

    v8 = v42;
  }

  return v13;
}

- (id)commitConfiguration
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController coordinator](self, "coordinator"));
  v3 = objc_msgSend(v2, "requiresDismissalConfirmation") ^ 1;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v4));

  return v5;
}

- (id)launchAdditionalSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAccessoryTuple"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController config](self, "config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities urlComponentHomeSettingsForAccessory:forHome:](HFSetupPairingControllerUtilities, "urlComponentHomeSettingsForAccessory:forHome:", v5, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController commitConfiguration](self, "commitConfiguration"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001F5C4;
  v13[3] = &unk_1000A0D90;
  v14 = v8;
  v10 = v8;
  v11 = objc_msgSend(v9, "addCompletionBlock:", v13);

  return v9;
}

- (BOOL)shouldShowButtonLinkToHomeApp
{
  void *v3;
  id v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeAppInstallController sharedInstance](HFHomeAppInstallController, "sharedInstance"));
  v4 = objc_msgSend(v3, "status");

  if (v4)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController coordinator](self, "coordinator"));
  v7 = objc_msgSend(v6, "launchReason");

  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDoneViewController coordinator](self, "coordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allAccessories"));
    v5 = objc_msgSend(v9, "count") == (id)1;

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
    v5 = objc_msgSend(v8, "isHUISLaunchedByFirstParty");
  }

  return v5;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
