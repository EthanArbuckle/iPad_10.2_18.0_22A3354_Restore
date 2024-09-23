@implementation HSPCDetectedViewController

+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  HSPCRouterDetectedViewController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTuple"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryCategoryOrPrimaryServiceType"));
  v10 = objc_msgSend(v9, "isEqualToString:", HMAccessoryCategoryTypeWiFiRouter);

  if (v10)
  {
    v11 = -[HSPCRouterDetectedViewController initWithCoordinator:config:]([HSPCRouterDetectedViewController alloc], "initWithCoordinator:config:", v6, v7);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setupDescription"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "setupAccessoryPayload"));

    if (objc_msgSend(v13, "isPaired"))
    {
      v15 = HFLogForCategory(58, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10005E61C(v13, v16);

      v17 = (objc_class *)HSPCDetectedPairedAccessoryViewController;
    }
    else
    {
      v17 = (objc_class *)objc_opt_class(a1, v14);
    }
    v11 = (HSPCRouterDetectedViewController *)objc_msgSend([v17 alloc], "initWithCoordinator:config:", v6, v7);

  }
  return v11;
}

- (HSPCDetectedViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  HSPCDetectedViewController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HSNetworkInterfaceManager *v16;
  HSNetworkInterfaceManager *networkInterfaceManager;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  objc_super v53;

  v6 = a3;
  v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)HSPCDetectedViewController;
  v8 = -[HSPCCenterIconViewController initWithCoordinator:config:](&v53, "initWithCoordinator:config:", v6, v7);
  if (!v8)
    goto LABEL_22;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTuple"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryCategoryOrPrimaryServiceType"));
  v11 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardDetectedCardTitle"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTuple"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "titleForAccessoryWithDefaultValue:", v12));
  -[HSPCDetectedViewController setTitle:](v8, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
  v8->_firstDetectedCard = v15 == 0;

  v16 = -[HSNetworkInterfaceManager initWithAlertHostViewController:]([HSNetworkInterfaceManager alloc], "initWithAlertHostViewController:", v8);
  networkInterfaceManager = v8->_networkInterfaceManager;
  v8->_networkInterfaceManager = v16;

  if (!v8->_firstDetectedCard)
    goto LABEL_11;
  if (objc_msgSend(v6, "isUsingCHIPCommunicationProtocol"))
  {
    if (objc_msgSend(v7, "isSetupInitiatedByOtherMatterEcosystem"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matterDeviceSetupRequest"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ecosystemName"));
      v20 = HULocalizedStringWithFormat(CFSTR("HUProximityCardSetupAccessoryDetectedVCBottomTrayTitleKeychainDisclosureThirdPartyEcosystem"), CFSTR("%@"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      -[HSPCDetectedViewController setBottomTrayTitle:](v8, "setBottomTrayTitle:", v21, v19);

    }
    else
    {
      v22 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryDetectedVCBottomTrayTitleKeychainDisclosureAppleHome"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[HSPCDetectedViewController setBottomTrayTitle:](v8, "setBottomTrayTitle:", v18);
    }

  }
  if (!v8->_firstDetectedCard)
  {
LABEL_11:
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTuple"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "accessoryCategoryOrPrimaryServiceType"));
    v33 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardDetectedCardSubtitle"), v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v34 = v7;
    v35 = v12;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAccessoryTuple"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "titleForAccessory"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v37));
    -[HSPCDetectedViewController setSubtitle:](v8, "setSubtitle:", v38);

    v12 = v35;
    v7 = v34;
    goto LABEL_12;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](v8, "config"));
  v24 = objc_msgSend(v23, "isSetupInitiatedByOtherMatterEcosystem");

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](v8, "coordinator"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "setupAccessoryDescription"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "hf_localizedLaunchingAppName"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](v8, "coordinator"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "matterDeviceSetupRequest"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ecosystemName"));

    v31 = HULocalizedStringWithFormat(CFSTR("HUProximityCardSetupAccessoryDetectedVCSubtitleThirdPartyEcosystem"), CFSTR("%@%@"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[HSPCDetectedViewController setSubtitle:](v8, "setSubtitle:", v32, v27, v30);
LABEL_12:

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDetectedViewController prominentButtonLocalizedTitle](v8, "prominentButtonLocalizedTitle"));
  v40 = -[HSPCDetectedViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v8, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v39, v8, "commitConfiguration");

  if (v8->_firstDetectedCard)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setupDescription"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "hf_installationGuideURL"));

    if (v42)
      v43 = -[HSPCDetectedViewController addOptionalButtonWithTitleKey:target:futureSelector:](v8, "addOptionalButtonWithTitleKey:target:futureSelector:", CFSTR("HUProximityCardSetupAccessoryDetectedVCInstallationGuideTitle"), v8, "handleInstallationGuideURL");
    if (v8->_firstDetectedCard)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setupDescription"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "setupAccessoryPayload"));

      if (v45)
      {
        v46 = objc_alloc((Class)HFSetupAccessoryResult);
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setupDescription"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "setupAccessoryPayload"));
        v49 = objc_msgSend(v46, "initWithPayload:hasAddRequest:", v48, 0);

        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "error"));
        if (v50)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "error"));
          objc_msgSend(v7, "setPairingError:", v51);

        }
      }
    }
  }

LABEL_22:
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupAccessoryDescription"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setupAccessoryPayload"));

  if ((objc_msgSend(v9, "supportsBTLE") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
    v6 = objc_msgSend(v7, "accessoryCommunicationProtocol") == (id)2;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDetectedViewController networkInterfaceManager](self, "networkInterfaceManager"));
  objc_msgSend(v8, "checkNetworkStatusAndShowAlertIfNeededForBluetooth:Wifi:", v6, 1);

}

- (HSPCDetectedViewController)initWithCenterContentView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCDetectedViewController;
  return -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:](&v4, "initWithCenterContentView:", a3);
}

- (id)handleInstallationGuideURL
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setupDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_installationGuideURL"));
  -[HSPCDetectedViewController openURL:](self, "openURL:", v5);

  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8020);
}

- (id)iconDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeTuple"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryCategoryOrPrimaryServiceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:](HFServiceIconFactory, "iconDescriptorForAccessoryCategoryOrServiceType:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:](HFServiceIconFactory, "overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:", v9, v6));

  return v10;
}

- (NSString)prominentButtonLocalizedTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v16;

  v3 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryDetectedVCButtonAppleEcosystem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
  v6 = objc_msgSend(v5, "isSetupInitiatedByOtherMatterEcosystem");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "matterDeviceSetupRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ecosystemName"));

    v16 = v9;
    v10 = HULocalizedStringWithFormat(CFSTR("HUProximityCardSetupAccessoryDetectedVCButtonThirdPartyEcosystem"), CFSTR("%@"));
    v11 = objc_claimAutoreleasedReturnValue(v10);

    v4 = (void *)v11;
  }
  if (-[HSPCDetectedViewController isFirstDetectedCard](self, "isFirstDetectedCard", v16))
  {
    v12 = v4;
  }
  else
  {
    v13 = HULocalizedString(CFSTR("HUContinueTitle"));
    v12 = (id)objc_claimAutoreleasedReturnValue(v13);
  }
  v14 = v12;

  return (NSString *)v14;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matterDeviceSetupRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupPayload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "manualEntryCode"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "matterDeviceSetupRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "setupPayload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "qrCodeString:", 0));

  if (objc_msgSend(v6, "length"))
    v11 = objc_msgSend(v10, "length") == 0;
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "didReceiveSetupCode:fromViewController:", v6, self));

    v12 = (void *)v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
  v16 = objc_msgSend(v15, "isSetupInitiatedByOtherMatterEcosystem");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "matterDeviceSetupRequest"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topology"));

    v21 = HFLogForCategory(58, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "homes"));
      *(_DWORD *)buf = 136315394;
      v31 = "-[HSPCDetectedViewController commitConfiguration]";
      v32 = 2112;
      v33 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s topology homes %@", buf, 0x16u);

    }
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100014548;
  v29[3] = &unk_1000A1620;
  v29[4] = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flatMap:", v29));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "flatMap:", &stru_1000A1660));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100014664;
  v28[3] = &unk_1000A10D0;
  v28[4] = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recover:", v28));

  return v26;
}

- (BOOL)isFirstDetectedCard
{
  return self->_firstDetectedCard;
}

- (HSNetworkInterfaceManager)networkInterfaceManager
{
  return self->_networkInterfaceManager;
}

- (void)setNetworkInterfaceManager:(id)a3
{
  objc_storeStrong((id *)&self->_networkInterfaceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkInterfaceManager, 0);
}

@end
