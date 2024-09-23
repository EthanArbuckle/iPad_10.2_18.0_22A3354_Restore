@implementation CARSetupPromptPresenter

- (CARSetupPromptPresenter)initWithPresentingViewController:(id)a3
{
  id v4;
  CARSetupPromptPresenter *v5;
  CARSetupPromptPresenter *v6;
  CARSetupPromptDirector *v7;
  CARSetupPromptDirector *promptDirector;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CARSetupPromptPresenter;
  v5 = -[CARSetupPromptPresenter init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
    v7 = -[CARSetupPromptDirector initWithPresenter:]([CARSetupPromptDirector alloc], "initWithPresenter:", v6);
    promptDirector = v6->_promptDirector;
    v6->_promptDirector = v7;

  }
  return v6;
}

- (void)_presentPromptViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter proxNavigationController](self, "proxNavigationController"));

  v6 = CARSetupLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "pushing prox card view controller: %@", (uint8_t *)&v11, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter proxNavigationController](self, "proxNavigationController"));
    objc_msgSend(v9, "pushViewController:animated:", v4, 1);
  }
  else
  {
    if (v8)
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "starting prox card presentation for view controller: %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter presentingViewController](self, "presentingViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentProxCardFlowWithDelegate:initialViewController:", self, v4));

    -[CARSetupPromptPresenter setProxNavigationController:](self, "setProxNavigationController:", v9);
  }

}

- (void)_presentGenericViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  int v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter proxNavigationController](self, "proxNavigationController"));

  if (v5)
  {
    -[CARSetupPromptPresenter setProxNavigationController:](self, "setProxNavigationController:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter presentingViewController](self, "presentingViewController"));
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    v7 = CARSetupLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "dismissing prox card presentation", (uint8_t *)&v15, 2u);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter genericNavigationController](self, "genericNavigationController"));

  v10 = CARSetupLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "pushing prox card view controller: %@", (uint8_t *)&v15, 0xCu);
    }

    v13 = (id)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter genericNavigationController](self, "genericNavigationController"));
    objc_msgSend(v13, "pushViewController:animated:", v4, 1);
  }
  else
  {
    if (v12)
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "starting generic card presentation for view controller: %@", (uint8_t *)&v15, 0xCu);
    }

    v13 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);
    -[CARSetupPromptPresenter setGenericNavigationController:](self, "setGenericNavigationController:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter presentingViewController](self, "presentingViewController"));
    objc_msgSend(v14, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

- (void)promptDirector:(id)a3 wantsToPresentBluetoothConfirmationPromptForVehicleName:(id)a4 numericCode:(id)a5 responseHandler:(id)a6
{
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100001BB0;
  v11[3] = &unk_10000C2A0;
  v12 = a6;
  v9 = v12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts bluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:](CARSetupPrompts, "bluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:", a4, a5, v11));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v10);

}

- (void)promptDirector:(id)a3 wantsToPresentBluetoothContactsSyncPromptWithResponseHandler:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100001D28;
  v7[3] = &unk_10000C2A0;
  v8 = a4;
  v5 = v8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts bluetoothContactsSyncPromptWithResponseHandler:](CARSetupPrompts, "bluetoothContactsSyncPromptWithResponseHandler:", v7));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v6);

}

- (void)promptDirector:(id)a3 wantsToPresentBluetoothFailedPromptForVehicleName:(id)a4 isTimeout:(BOOL)a5 responseHandler:(id)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100001EB8;
  v11[3] = &unk_10000C2C8;
  v12 = a6;
  v9 = v12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts bluetoothFailedPromptForVehicleName:isTimeout:responseHandler:](CARSetupPrompts, "bluetoothFailedPromptForVehicleName:isTimeout:responseHandler:", a4, v6, v11));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v10);

}

- (void)promptDirectorWantsToPresentWaiting:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts waitingPrompt](CARSetupPrompts, "waitingPrompt", a3));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v4);

}

- (void)promptDirector:(id)a3 wantsToPresentAllowWhileLockedPromptForVehicleName:(id)a4 responseHandler:(id)a5
{
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002020;
  v9[3] = &unk_10000C2A0;
  v10 = a5;
  v7 = v10;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts allowWhileLockedPromptForVehicleName:responseHandler:](CARSetupPrompts, "allowWhileLockedPromptForVehicleName:responseHandler:", a4, v9));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v8);

}

- (void)promptDirector:(id)a3 wantsToPresentConnectPromptWithBluetoothOnlyOption:(BOOL)a4 wirelessEnablement:(unint64_t)a5 responseHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000021B0;
  v11[3] = &unk_10000C2A0;
  v12 = a6;
  v9 = v12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts connectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:](CARSetupPrompts, "connectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v7, a5, v11));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v10);

}

- (void)promptDirector:(id)a3 wantsToPresentUseWirelessPromptWithWirelessEnablement:(unint64_t)a4 declineVariant:(unint64_t)a5 responseHandler:(id)a6
{
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002340;
  v11[3] = &unk_10000C2A0;
  v12 = a6;
  v9 = v12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts useWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:](CARSetupPrompts, "useWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:", a4, a5, v11));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v10);

}

- (void)promptDirector:(id)a3 wantsToPresentEnhancedIntegrationPromptForVehicleName:(id)a4 responseHandler:(id)a5
{
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000024C0;
  v9[3] = &unk_10000C2A0;
  v10 = a5;
  v7 = v10;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts enhancedIntegrationPromptForVehicleName:responseHandler:](CARSetupPrompts, "enhancedIntegrationPromptForVehicleName:responseHandler:", a4, v9));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v8);

}

- (void)promptDirector:(id)a3 wantsToPresentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a4 wirelessEnablement:(unint64_t)a5 responseHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002650;
  v11[3] = &unk_10000C2A0;
  v12 = a6;
  v9 = v12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts assetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:](CARSetupPrompts, "assetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v7, a5, v11));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v10);

}

- (void)promptDirector:(id)a3 wantsToPresentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a4 declineVariant:(unint64_t)a5 responseHandler:(id)a6
{
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000027E0;
  v11[3] = &unk_10000C2A0;
  v12 = a6;
  v9 = v12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARSetupPrompts assetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:](CARSetupPrompts, "assetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:", a4, a5, v11));
  -[CARSetupPromptPresenter _presentPromptViewController:](self, "_presentPromptViewController:", v10);

}

- (void)promptDirector:(id)a3 wantsToPresentAssetProgressPromptForVehicleName:(id)a4 progressReporter:(id)a5 cancelHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t, char);
  void *v16;
  CARSetupPromptPresenter *v17;
  id v18;

  v8 = a6;
  v9 = a5;
  v10 = objc_alloc((Class)CARSetupAssetProgressViewController);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100002978;
  v16 = &unk_10000C2F0;
  v17 = self;
  v18 = v8;
  v11 = v8;
  v12 = objc_msgSend(v10, "initWithProgressReporter:cancelHandler:", v9, &v13);

  -[CARSetupPromptPresenter _presentGenericViewController:](self, "_presentGenericViewController:", v12, v13, v14, v15, v16, v17);
}

- (void)promptDirector:(id)a3 wantsToPresentAssetReadyPromptForVehicleName:(id)a4 confirmationHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a5;
  v7 = objc_alloc((Class)CARSetupAssetReadyViewController);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002A60;
  v10[3] = &unk_10000C2C8;
  v11 = v6;
  v8 = v6;
  v9 = objc_msgSend(v7, "initWithDoneHandler:", v10);
  -[CARSetupPromptPresenter _presentGenericViewController:](self, "_presentGenericViewController:", v9);

}

- (void)promptDirector:(id)a3 wantsToPresentAssetReadySoonPromptForVehicleName:(id)a4 confirmationHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a5;
  v7 = objc_alloc((Class)CARSetupAssetReadySoonViewController);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002B80;
  v10[3] = &unk_10000C2C8;
  v11 = v6;
  v8 = v6;
  v9 = objc_msgSend(v7, "initWithDoneHandler:", v10);
  -[CARSetupPromptPresenter _presentGenericViewController:](self, "_presentGenericViewController:", v9);

}

- (void)promptDirector:(id)a3 wantsToPresentSetupCarKeysPromptForVehicleName:(id)a4 carKeyInfo:(id)a5 cancelHandler:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter _passConfigurationFromDigitalCarKeyInfo:vehicleName:](self, "_passConfigurationFromDigitalCarKeyInfo:vehicleName:", a5, a4));
  v11 = objc_alloc_init((Class)PKPaymentService);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100002CCC;
  v13[3] = &unk_10000C340;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  +[PKVehicleInitiatedPairingViewController vehicleInitiatedPairingViewControllerForConfiguration:paymentService:completion:](PKVehicleInitiatedPairingViewController, "vehicleInitiatedPairingViewControllerForConfiguration:paymentService:completion:", v10, v11, v13);

}

- (void)proxCardFlowWillPresent
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "prox card flow will present", v4, 2u);
  }

}

- (void)proxCardFlowDidDismiss
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "prox card flow did dismiss", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter proxNavigationController](self, "proxNavigationController"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter promptDirector](self, "promptDirector"));
    objc_msgSend(v6, "presenterDidDismiss");

    -[CARSetupPromptPresenter setProxNavigationController:](self, "setProxNavigationController:", 0);
  }
}

- (void)_dismissFromGenericFlow
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "generic flow did dismiss", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter genericNavigationController](self, "genericNavigationController"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptPresenter promptDirector](self, "promptDirector"));
    objc_msgSend(v6, "presenterDidDismiss");

    -[CARSetupPromptPresenter setGenericNavigationController:](self, "setGenericNavigationController:", 0);
  }
}

- (id)_passConfigurationFromDigitalCarKeyInfo:(id)a3 vehicleName:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *i;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)PKAddCarKeyPassConfiguration);
  objc_msgSend(v7, "setReferralSource:", 3);
  if (v6)
    objc_msgSend(v7, "setVehicleName:", v6);
  v65 = v6;
  v8 = kCFACCProperties_Endpoint_DigitalCarKey_VehicleIdentifier;
  v9 = objc_opt_class(NSString);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v8));
  v11 = v10;
  if (v10 && (objc_opt_isKindOfClass(v10, v9) & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (v12)
    objc_msgSend(v7, "setPairedReaderIdentifier:", v12);
  v64 = v12;
  v13 = objc_opt_class(NSString);
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kACCProperties_Endpoint_DigitalCarKey_CCCManufacturer));
  v15 = v14;
  if (v14 && (objc_opt_isKindOfClass(v14, v13) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  if (v16)
    objc_msgSend(v7, "setManufacturerIdentifier:", v16);
  v63 = v16;
  v17 = objc_opt_class(NSString);
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kACCProperties_Endpoint_DigitalCarKey_CCCBrand));
  v19 = v18;
  if (v18 && (objc_opt_isKindOfClass(v18, v17) & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  if (v20)
    objc_msgSend(v7, "setIssuerIdentifier:", v20);
  v62 = v20;
  v21 = objc_opt_class(NSString);
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kACCProperties_Endpoint_DigitalCarKey_ProductPlanUID));
  v23 = v22;
  if (v22 && (objc_opt_isKindOfClass(v22, v21) & 1) != 0)
    v24 = v23;
  else
    v24 = 0;

  if (v24)
    objc_msgSend(v7, "setProductPlanIdentifier:", v24);
  v61 = v24;
  v25 = objc_opt_class(NSSet);
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kACCProperties_Endpoint_DigitalCarKey_SupportedRadioTechnologies));
  v27 = v26;
  if (v26 && (objc_opt_isKindOfClass(v26, v25) & 1) != 0)
    v28 = v27;
  else
    v28 = 0;
  v66 = v7;
  v67 = v5;

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v29 = v28;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v30)
  {
    v31 = v30;
    v32 = 0;
    v33 = *(_QWORD *)v69;
    v34 = (id)kACCProperties_Endpoint_DigitalCarKey_RadioTechnology_NearFieldCommunication;
    v35 = (id)kACCProperties_Endpoint_DigitalCarKey_RadioTechnology_Bluetooth;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v33)
          objc_enumerationMutation(v29);
        v37 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v38 = objc_opt_class(NSNumber);
        v39 = v37;
        if (v39)
        {
          v40 = v39;
          if ((objc_opt_isKindOfClass(v39, v38) & 1) != 0)
            v41 = v40;
          else
            v41 = 0;

          v42 = objc_msgSend(v41, "integerValue");
          v43 = v32 | 2;
          if (v42 != v35)
            v43 = v32;
          if (v42 == v34)
            v32 |= 1uLL;
          else
            v32 = v43;

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    }
    while (v31);
  }
  else
  {
    v32 = 0;
  }

  objc_msgSend(v66, "setSupportedRadioTechnologies:", v32);
  v44 = objc_opt_class(NSString);
  v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKey:", kACCProperties_Endpoint_DigitalCarKey_ProvisioningTemplate));
  v46 = v45;
  if (v45 && (objc_opt_isKindOfClass(v45, v44) & 1) != 0)
    v47 = v46;
  else
    v47 = 0;

  if (v47)
    objc_msgSend(v66, "setProvisioningTemplateIdentifier:", v47);
  v48 = objc_opt_class(NSNumber);
  v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKey:", kACCProperties_Endpoint_DigitalCarKey_OwnerKeyPairingAvailable));
  v50 = v49;
  if (v49 && (objc_opt_isKindOfClass(v49, v48) & 1) != 0)
    v51 = v50;
  else
    v51 = 0;

  if (v51)
    objc_msgSend(v66, "setOwnerKeyPairingAvailable:", objc_msgSend(v51, "BOOLValue"));
  v52 = objc_opt_class(NSNumber);
  v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKey:", kACCProperties_Endpoint_DigitalCarKey_OnlineServicesActivated));
  v54 = v53;
  if (v53 && (objc_opt_isKindOfClass(v53, v52) & 1) != 0)
    v55 = v54;
  else
    v55 = 0;

  if (v55)
    objc_msgSend(v66, "setOnlineServicesActivated:", objc_msgSend(v55, "BOOLValue"));
  v56 = objc_opt_class(NSNumber);
  v57 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKey:", kACCProperties_Endpoint_DigitalCarKey_ProofOfOwnershipPresent));
  v58 = v57;
  if (v57 && (objc_opt_isKindOfClass(v57, v56) & 1) != 0)
    v59 = v58;
  else
    v59 = 0;

  if (v59)
    objc_msgSend(v66, "setProofOfOwnershipPresent:", objc_msgSend(v59, "BOOLValue"));

  return v66;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (CARSetupPromptDirector)promptDirector
{
  return self->_promptDirector;
}

- (UINavigationController)proxNavigationController
{
  return self->_proxNavigationController;
}

- (void)setProxNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_proxNavigationController, a3);
}

- (UINavigationController)genericNavigationController
{
  return self->_genericNavigationController;
}

- (void)setGenericNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_genericNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericNavigationController, 0);
  objc_storeStrong((id *)&self->_proxNavigationController, 0);
  objc_storeStrong((id *)&self->_promptDirector, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
