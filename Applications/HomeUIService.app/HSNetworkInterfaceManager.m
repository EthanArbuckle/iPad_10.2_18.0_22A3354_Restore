@implementation HSNetworkInterfaceManager

- (HSNetworkInterfaceManager)initWithAlertHostViewController:(id)a3
{
  id v4;
  HSNetworkInterfaceManager *v5;
  HSNetworkInterfaceManager *v6;
  CBController *v7;
  CBController *bluetoothController;
  CWFInterface *v9;
  CWFInterface *wifiInterface;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HSNetworkInterfaceManager;
  v5 = -[HSNetworkInterfaceManager init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    v5->_bluetoothInterfaceStatus = 0;
    v7 = (CBController *)objc_alloc_init((Class)CBController);
    bluetoothController = v6->_bluetoothController;
    v6->_bluetoothController = v7;

    v9 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
    wifiInterface = v6->_wifiInterface;
    v6->_wifiInterface = v9;

    objc_storeWeak((id *)&v6->_alertHostViewController, v4);
  }

  return v6;
}

- (void)checkNetworkStatusAndShowAlertIfNeededForBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  v4 = a4;
  v5 = a3;
  if (a3 || a4)
  {
    if (a4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager wifiInterface](self, "wifiInterface"));
      objc_msgSend(v7, "activate");

    }
    if (v5)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100040AC4;
      v8[3] = &unk_1000A2D28;
      v8[4] = self;
      v9 = v5;
      v10 = v4;
      -[HSNetworkInterfaceManager _updateBluetoothInterfaceStatusWithCompletion:](self, "_updateBluetoothInterfaceStatusWithCompletion:", v8);
    }
    else
    {
      -[HSNetworkInterfaceManager _updateAlertForBluetooth:Wifi:](self, "_updateAlertForBluetooth:Wifi:", 0, v4);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CWFInterface invalidate](self->_wifiInterface, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HSNetworkInterfaceManager;
  -[HSNetworkInterfaceManager dealloc](&v3, "dealloc");
}

- (void)setNetworkInterfacePowerState:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = a3;
  if (a3)
    v5 = 2;
  else
    v5 = 1;
  v6 = -[HSNetworkInterfaceManager bluetoothInterfaceStatus](self, "bluetoothInterfaceStatus");
  v7 = -[HSNetworkInterfaceManager _wiFiInterfaceStatus](self, "_wiFiInterfaceStatus");
  if (v6 && v6 != v5)
    -[HSNetworkInterfaceManager _setBluetoothPowerState:](self, "_setBluetoothPowerState:", v3);
  if (v7)
  {
    if (v7 != v5)
      -[HSNetworkInterfaceManager _setWiFiPowerState:autoJoinDisabled:](self, "_setWiFiPowerState:autoJoinDisabled:", v3, v3 ^ 1);
  }
}

- (void)_updateBluetoothInterfaceStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager bluetoothController](self, "bluetoothController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100040C4C;
  v7[3] = &unk_1000A2D50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getPowerStateWithCompletion:", v7);

}

- (void)_setBluetoothPowerState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager bluetoothController](self, "bluetoothController"));
  v6 = v4;
  if (v3)
    v5 = 5;
  else
    v5 = 4;
  objc_msgSend(v4, "setPowerState:completion:", v5, &stru_1000A2D90);

}

- (unint64_t)_wiFiInterfaceStatus
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager wifiInterface](self, "wifiInterface"));
  if (objc_msgSend(v3, "powerOn"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager wifiInterface](self, "wifiInterface"));
    if (objc_msgSend(v4, "userAutoJoinDisabled"))
      v5 = 1;
    else
      v5 = 2;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)_setWiFiPowerState:(BOOL)a3 autoJoinDisabled:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager wifiInterface](self, "wifiInterface"));
  v16 = 0;
  objc_msgSend(v7, "setPower:error:", v5, &v16);
  v8 = v16;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager wifiInterface](self, "wifiInterface"));
  v15 = 0;
  objc_msgSend(v9, "setUserAutoJoinDisabled:error:", v4, &v15);
  v10 = v15;

  if (v8)
  {
    v11 = HFLogForCategory(58);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100060214();

  }
  if (v10)
  {
    v13 = HFLogForCategory(58);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000601A4();

  }
}

- (void)_updateAlertForBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id location;
  _QWORD v36[4];
  id v37;
  HSNetworkInterfaceManager *v38;
  id v39;

  v4 = a4;
  v5 = a3;
  v7 = (id)-[HSNetworkInterfaceManager bluetoothInterfaceStatus](self, "bluetoothInterfaceStatus") == (id)1 && v5;
  v8 = (id)-[HSNetworkInterfaceManager _wiFiInterfaceStatus](self, "_wiFiInterfaceStatus") == (id)1 && v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager _alertLocalizedTitleForRequestBluetooth:Wifi:](self, "_alertLocalizedTitleForRequestBluetooth:Wifi:", v7, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager _alertLocalizedDescriptionForRequestBluetooth:Wifi:](self, "_alertLocalizedDescriptionForRequestBluetooth:Wifi:", v7, v8));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000412BC;
  v36[3] = &unk_1000A1558;
  v11 = v9;
  v37 = v11;
  v38 = self;
  v12 = v10;
  v39 = v12;
  v13 = objc_retainBlock(v36);
  v14 = objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager enableBluetoothAndWiFiAlertController](self, "enableBluetoothAndWiFiAlertController"));
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager alertHostViewController](self, "alertHostViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presentedViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager enableBluetoothAndWiFiAlertController](self, "enableBluetoothAndWiFiAlertController"));

    if (v17 == v18)
    {
      if (v7 || v8)
      {
        if (!v8 && !v7)
          goto LABEL_22;
        ((void (*)(_QWORD *))v13[2])(v13);
        if (!v11 || !v12)
          goto LABEL_22;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager enableBluetoothAndWiFiAlertController](self, "enableBluetoothAndWiFiAlertController"));
        objc_msgSend(v31, "setTitle:", v11);

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager enableBluetoothAndWiFiAlertController](self, "enableBluetoothAndWiFiAlertController"));
        objc_msgSend(v32, "setMessage:", v12);
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager alertHostViewController](self, "alertHostViewController"));
        objc_msgSend(v32, "dismissViewControllerAnimated:completion:", 1, 0);
      }

      goto LABEL_22;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager enableBluetoothAndWiFiAlertController](self, "enableBluetoothAndWiFiAlertController"));
  if (v19)
  {

  }
  else if (v7 || v8)
  {
    ((void (*)(_QWORD *))v13[2])(v13);
    if (v11)
    {
      if (v12)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1));
        -[HSNetworkInterfaceManager setEnableBluetoothAndWiFiAlertController:](self, "setEnableBluetoothAndWiFiAlertController:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager enableBluetoothAndWiFiAlertController](self, "enableBluetoothAndWiFiAlertController"));
        v22 = sub_1000593D8(CFSTR("HSBluetoothAndWiFiAlertDontTurnOnAction"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 1, &stru_1000A2DB0));
        objc_msgSend(v21, "addAction:", v24);

        objc_initWeak(&location, self);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager enableBluetoothAndWiFiAlertController](self, "enableBluetoothAndWiFiAlertController"));
        v26 = sub_1000593D8(CFSTR("HSBluetoothAndWiFiAlertTurnOnAction"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10004133C;
        v33[3] = &unk_1000A2DD8;
        objc_copyWeak(&v34, &location);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 0, v33));
        objc_msgSend(v25, "addAction:", v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager alertHostViewController](self, "alertHostViewController"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager enableBluetoothAndWiFiAlertController](self, "enableBluetoothAndWiFiAlertController"));
        objc_msgSend(v29, "presentViewController:animated:completion:", v30, 1, 0);

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_22:

}

- (id)_alertLocalizedTitleForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager _alertBaseLocalizationKeyForRequestBluetooth:Wifi:](self, "_alertBaseLocalizationKeyForRequestBluetooth:Wifi:", a3, a4));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_Title"), v4));
    v6 = sub_1000593D8(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_alertLocalizedDescriptionForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSNetworkInterfaceManager _alertBaseLocalizationKeyForRequestBluetooth:Wifi:](self, "_alertBaseLocalizationKeyForRequestBluetooth:Wifi:", a3, a4));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_Description"), v4));
    v6 = sub_1000593D8(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_alertBaseLocalizationKeyForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned int v6;
  __CFString *v7;
  const __CFString *v8;

  v4 = a4;
  v5 = a3;
  v6 = +[HFUtilities useWLANInsteadOfWiFi](HFUtilities, "useWLANInsteadOfWiFi");
  if (v5 && v4)
  {
    v7 = CFSTR("HSBluetoothAndWiFiAlertTurnOnWiFiAndBluetooth");
    v8 = CFSTR("HSBluetoothAndWiFiAlertTurnOnWLANAndBluetooth");
  }
  else
  {
    if (!v4)
    {
      if (v5)
        return CFSTR("HSBluetoothAndWiFiAlertTurnOnBluetooth");
      else
        return 0;
    }
    v7 = CFSTR("HSBluetoothAndWiFiAlertTurnOnWiFi");
    v8 = CFSTR("HSBluetoothAndWiFiAlertTurnOnWLAN");
  }
  if (v6)
    v7 = (__CFString *)v8;
  return v7;
}

- (unint64_t)bluetoothInterfaceStatus
{
  return self->_bluetoothInterfaceStatus;
}

- (void)setBluetoothInterfaceStatus:(unint64_t)a3
{
  self->_bluetoothInterfaceStatus = a3;
}

- (unint64_t)wiFiInterfaceStatus
{
  return self->_wiFiInterfaceStatus;
}

- (CBController)bluetoothController
{
  return self->_bluetoothController;
}

- (void)setBluetoothController:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothController, a3);
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInterface, a3);
}

- (UIViewController)alertHostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_alertHostViewController);
}

- (void)setAlertHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_alertHostViewController, a3);
}

- (UIAlertController)enableBluetoothAndWiFiAlertController
{
  return self->_enableBluetoothAndWiFiAlertController;
}

- (void)setEnableBluetoothAndWiFiAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_enableBluetoothAndWiFiAlertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableBluetoothAndWiFiAlertController, 0);
  objc_destroyWeak((id *)&self->_alertHostViewController);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
}

@end
