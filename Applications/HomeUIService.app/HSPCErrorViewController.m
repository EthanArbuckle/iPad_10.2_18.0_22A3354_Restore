@implementation HSPCErrorViewController

+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  int v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v9 = HFLogForCategory(58, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingError"));
    v18 = 138412290;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Presenting error card with error %@", (uint8_t *)&v18, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingError"));
  v13 = objc_msgSend(v12, "hf_isThreadNetworkRequiredError");

  if (v13)
    v15 = (objc_class *)HSPCThreadNetworkRequiredViewController;
  else
    v15 = (objc_class *)objc_opt_class(a1, v14);
  v16 = objc_msgSend([v15 alloc], "initWithCoordinator:config:", v6, v7);

  return v16;
}

- (BOOL)_isErrorInPublicHomeDomain:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if ((objc_msgSend(v4, "isEqualToString:", HFErrorDomain) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "hf_isPublicHMError");

  return v5;
}

- (HSPCErrorViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  HSPCErrorViewController *v13;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingError"));
  if (!objc_msgSend(v8, "hf_isAlreadyPairedError"))
  {
    v15.receiver = self;
    v15.super_class = (Class)HSPCErrorViewController;
    v13 = -[HSPCCenterIconViewController initWithCoordinator:config:](&v15, "initWithCoordinator:config:", v6, v7);
    if (!v13)
      goto LABEL_9;
    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCErrorViewController _findAccessoryInHomeForCoordinator:config:](HSPCErrorViewController, "_findAccessoryInHomeForCoordinator:config:", v6, v7));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "category"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "categoryType"));

    v12 = objc_msgSend(objc_alloc((Class)HUHomeAccessoryTileView), "initWithFrame:categoryType:", v11, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v17.receiver = self;
    v17.super_class = (Class)HSPCErrorViewController;
    v13 = -[HSPCCenterIconViewController initWithCoordinator:config:iconView:](&v17, "initWithCoordinator:config:iconView:", v6, v7, v12);

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HSPCErrorViewController;
    v13 = -[HSPCCenterIconViewController initWithCoordinator:config:](&v16, "initWithCoordinator:config:", v6, v7);
  }

  if (v13)
  {
LABEL_8:
    v13->_accessoryAlreadyAdded = 0;
    -[HSPCErrorViewController configureCard](v13, "configureCard");
  }
LABEL_9:

  return v13;
}

+ (id)_findAccessoryInHomeForCoordinator:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessories"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100019354;
  v17[3] = &unk_1000A1810;
  v9 = v5;
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_firstObjectPassingTest:", v17));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingError"));
    v12 = objc_msgSend(v11, "code");

    if (v12 == (id)13)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessories"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000193C4;
      v15[3] = &unk_1000A1810;
      v16 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "na_firstObjectPassingTest:", v15));

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A80B0);
}

- (void)configureCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  const __CFString *v41;
  char **v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pairingError"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:"));

  if (-[HSPCErrorViewController _isErrorInPublicHomeDomain:](self, "_isErrorInPublicHomeDomain:", v6))
  {
    v7 = v6;

    v4 = v7;
  }
  if (!v4)
  {
    NSLog(CFSTR("HSPCErrorViewController introduced into flow without an error object.  In production this will recover with a generic error"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 69));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = HFErrorUserInfoOptionsKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", HFErrorUserInfoOptionsKey));
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairingError"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v9));

  }
  v16 = HFLocalizedString(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryNotFound"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (objc_msgSend(v4, "hf_isHMErrorWithCode:", 52))
  {
    v18 = HFLocalizedString(CFSTR("HFSetupPairingControllerStatusDescriptionFailureGeneric"));
    v19 = objc_claimAutoreleasedReturnValue(v18);

    v17 = (void *)v19;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", HFErrorUserInfoOptionTitleKey));
  if (v20)
  {
    -[HSPCErrorViewController setTitle:](self, "setTitle:", v20);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
    if (objc_msgSend(v21, "launchReason"))
      v22 = HULocalizedString(CFSTR("HUAlertError"));
    else
      v22 = HFLocalizedString(CFSTR("HFSetupPairingControllerStatusTitleFailureGeneric_withoutName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[HSPCErrorViewController setTitle:](self, "setTitle:", v23);

  }
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", HFErrorUserInfoOptionDescriptionKey));
  v25 = (void *)v24;
  if (v24)
    v26 = (void *)v24;
  else
    v26 = v17;
  -[HSPCErrorViewController setSubtitle:](self, "setSubtitle:", v26);

  if (objc_msgSend(v4, "hf_isAlreadyPairedError"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCErrorViewController _findAccessoryInHomeForCoordinator:config:](HSPCErrorViewController, "_findAccessoryInHomeForCoordinator:config:", v27, v28));

    if (v29)
    {
      -[HSPCErrorViewController setAccessoryAlreadyAdded:](self, "setAccessoryAlreadyAdded:", 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
      v30 = HFLocalizedStringWithFormat(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAlreadyPaired"), CFSTR("%@"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      -[HSPCErrorViewController setSubtitle:](self, "setSubtitle:", v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCErrorViewController subtitle](self, "subtitle"));
      v33 = objc_msgSend(v29, "isReachable");
      if ((v33 & 1) != 0)
      {
        v34 = &stru_1000A3BA0;
      }
      else
      {
        v38 = HFLocalizedString(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAlreadyPairedButUnreachable"));
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue(v38);
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingString:", v34));
      -[HSPCErrorViewController setSubtitle:](self, "setSubtitle:", v39);

      if ((v33 & 1) == 0)
    }
    else
    {
      v35 = HFLocalizedString(CFSTR("HFSetupPairingControllerStatusTitleFailureAlreadyPairedInAnotherHome"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      -[HSPCErrorViewController setTitle:](self, "setTitle:", v36);

      v37 = HFLocalizedString(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAlreadyPairedInAnotherHome"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v37);
      -[HSPCErrorViewController setSubtitle:](self, "setSubtitle:", v32);
    }

  }
  if (objc_msgSend(v4, "hf_isHMErrorWithCodePrivate:", 2015))
  {
    v40 = -[HSPCErrorViewController addProminentButtonWithTitleKey:target:futureSelector:](self, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUProximityCardSetupAccessoryErrorRetryButton"), self, "retry");
    v41 = CFSTR("HUProximityCardSetupAccessoryErrorSetupLaterLink");
    v42 = &selRef_dismissFuture;
  }
  else
  {
    v43 = -[HSPCErrorViewController addProminentDismissButtonWithTitleKey:](self, "addProminentDismissButtonWithTitleKey:", CFSTR("HUOkTitle"));
    if (!-[HSPCErrorViewController accessoryAlreadyAdded](self, "accessoryAlreadyAdded"))
      goto LABEL_33;
    v41 = CFSTR("HUProximityCardSetupAccessoryErrorVCAdditionalSettingsButton");
    v42 = &selRef_launchAdditionalSettings;
  }
  v45 = -[HSPCErrorViewController addOptionalButtonWithTitleKey:target:futureSelector:](self, "addOptionalButtonWithTitleKey:target:futureSelector:", v41, self, *v42);
LABEL_33:
  v46 = HFLogForCategory(58, v44);
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v59 = v4;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCErrorViewController title](self, "title"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCErrorViewController subtitle](self, "subtitle"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "pairingError"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
    v60 = v6;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "pairingError"));
    v53 = v12;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userInfo"));
    v55 = v17;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
    *(_DWORD *)buf = 138413314;
    v62 = v48;
    v63 = 2112;
    v64 = v49;
    v65 = 2112;
    v66 = v50;
    v67 = 2112;
    v68 = v56;
    v69 = 2112;
    v70 = v55;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Presenting error screen w/ title %@, subtitle %@, pairing error %@, underlyingError %@, errorLocalizedDescription %@", buf, 0x34u);

    v17 = v55;
    v12 = v53;

    v6 = v60;
    v4 = v59;
  }

}

- (id)retry
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v14;
  HSPCErrorViewController *v15;
  __int16 v16;
  void *v17;

  v4 = HFLogForCategory(68, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v14, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
  objc_msgSend(v8, "resetForRetry");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "setupCode"));
  v12 = objc_msgSend(v9, "didReceiveSetupCode:fromViewController:", v11, self);

  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A80C8));
}

- (id)dismissFuture
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A80B0);
}

- (id)iconDescriptor
{
  id v2;
  void *v3;
  void *v4;

  if (-[HSPCErrorViewController accessoryAlreadyAdded](self, "accessoryAlreadyAdded"))
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v3));

    v2 = objc_msgSend(objc_alloc((Class)HFImageIconDescriptor), "initWithSystemImageNamed:configuration:", CFSTR("exclamationmark.triangle.fill"), v4);
  }
  return v2;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController coordinator](self, "coordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController config](self, "config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCErrorViewController _findAccessoryInHomeForCoordinator:config:](HSPCErrorViewController, "_findAccessoryInHomeForCoordinator:config:", v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities urlComponentHomeSettingsForAccessory:forHome:](HFSetupPairingControllerUtilities, "urlComponentHomeSettingsForAccessory:forHome:", v7, v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCErrorViewController commitConfiguration](self, "commitConfiguration"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100019D1C;
  v13[3] = &unk_1000A0D90;
  v14 = v8;
  v10 = v8;
  v11 = objc_msgSend(v9, "addCompletionBlock:", v13);

  return v9;
}

- (BOOL)accessoryAlreadyAdded
{
  return self->_accessoryAlreadyAdded;
}

- (void)setAccessoryAlreadyAdded:(BOOL)a3
{
  self->_accessoryAlreadyAdded = a3;
}

@end
