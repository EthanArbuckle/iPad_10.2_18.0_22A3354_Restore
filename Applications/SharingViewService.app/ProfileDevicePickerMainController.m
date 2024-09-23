@implementation ProfileDevicePickerMainController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSDictionary *v7;
  NSDictionary *userInfo;
  unsigned int Int64Ranged;
  unsigned int v10;
  int v11;

  v6 = (void (**)(_QWORD))a4;
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001A87C0 <= 30 && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 30)))
    LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController configureWithContext:completion:]", 30, "Main configuration: %.64@\n", self->super._userInfo);
  v11 = 0;
  Int64Ranged = CFDictionaryGetInt64Ranged(self->super._userInfo, CFSTR("pickerFlags"), 0, 0xFFFFFFFFLL, &v11);
  if (v11)
    v10 = 2;
  else
    v10 = Int64Ranged;
  self->_pickerFlags = v10;
  if (v6)
    v6[2](v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A87C0 <= 30 && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 30)))
    LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v5.receiver = self;
  v5.super_class = (Class)ProfileDevicePickerMainController;
  -[ProfileDevicePickerMainController viewDidAppear:](&v5, "viewDidAppear:", v3);
  -[ProfileDevicePickerMainController _discoveryStart](self, "_discoveryStart");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A87C0 <= 30 && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 30)))
    LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  -[ProfileDevicePickerMainController _discoveryStop](self, "_discoveryStop");
  if (!self->_dismissed)
  {
    if (dword_1001A87C0 <= 30
      && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 30)))
    {
      LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[ProfileDevicePickerMainController dismiss:](self, "dismiss:", 21);
  }
  v5.receiver = self;
  v5.super_class = (Class)ProfileDevicePickerMainController;
  -[SVSBaseMainController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  void *v4;
  void *v5;
  UIAlertController *alertController;
  _QWORD v7[4];
  id v8;

  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProfileDevicePickerMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", *(_QWORD *)&a3));
    v5 = v4;
    alertController = self->_alertController;
    if (alertController)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000FFA0C;
      v7[3] = &unk_10017E1F0;
      v8 = v4;
      -[UIAlertController dismissViewControllerAnimated:completion:](alertController, "dismissViewControllerAnimated:completion:", 1, v7);

    }
    else
    {
      objc_msgSend(v4, "dismiss");
    }

  }
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "events") & 0x10) != 0)
        {
          if (dword_1001A87C0 <= 30
            && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 30)))
          {
            LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[ProfileDevicePickerMainController dismiss:](self, "dismiss:", 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_discoveryStart
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *deviceDiscovery;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = v3;

  -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 1);
  -[SFDeviceDiscovery setPurpose:](self->_deviceDiscovery, "setPurpose:", CFSTR("ProfileDevicePicker"));
  -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 50);
  -[SFDeviceDiscovery setTimeout:](self->_deviceDiscovery, "setTimeout:", 2.0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000FF924;
  v6[3] = &unk_10017D8E8;
  v6[4] = self;
  -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FF930;
  v5[3] = &unk_10017E1F0;
  v5[4] = self;
  -[SFDeviceDiscovery setTimeoutHandler:](self->_deviceDiscovery, "setTimeoutHandler:", v5);
  -[SFDeviceDiscovery activateWithCompletion:](self->_deviceDiscovery, "activateWithCompletion:", &stru_10017D778);
}

- (void)_discoveryStop
{
  SFDeviceDiscovery *deviceDiscovery;

  -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;

}

- (void)_discoveryFoundDevice:(id)a3
{
  void *v4;
  void *v5;
  unsigned int pickerFlags;
  void *v7;
  NSMutableDictionary *devices;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
  v5 = v4;
  pickerFlags = self->_pickerFlags;
  if ((pickerFlags & 1) != 0)
  {
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0)
    {
LABEL_10:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      if (v7)
      {
        if (dword_1001A87C0 <= 30
          && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 30)))
        {
          LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController _discoveryFoundDevice:]", 30, "Discovery found: %@\n", v11);
        }
        devices = self->_devices;
        if (!devices)
        {
          v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v10 = self->_devices;
          self->_devices = v9;

          devices = self->_devices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v11, v7);
      }
      else if (dword_1001A87C0 <= 60
             && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 60)))
      {
        LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController _discoveryFoundDevice:]", 60, "### Discovery ignoring without identifier: %@\n", v11);
      }

      goto LABEL_24;
    }
    pickerFlags = self->_pickerFlags;
  }
  if ((pickerFlags & 2) != 0
    && ((objc_msgSend(v5, "hasPrefix:", CFSTR("AudioAccessory")) & 1) != 0
     || (objc_msgSend(v5, "hasPrefix:", CFSTR("HomePod1,")) & 1) != 0))
  {
    goto LABEL_10;
  }
  if (dword_1001A87C0 <= 9 && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 9)))
    LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController _discoveryFoundDevice:]", 9, "Discovery ignoring mismatch: %@\n", v11);
LABEL_24:

}

- (void)_discoveryTimeout
{
  if (dword_1001A87C0 <= 30 && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 30)))
    LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController _discoveryTimeout]", 30, "Discovery timeout. Showing picker with %ld devices\n", -[NSMutableDictionary count](self->_devices, "count"));
  -[ProfileDevicePickerMainController _discoveryStop](self, "_discoveryStop");
  -[ProfileDevicePickerMainController _pickerAlertShow](self, "_pickerAlertShow");
}

- (void)_pickerAlertShow
{
  unsigned int pickerFlags;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  UIAlertController *v12;
  UIAlertController *alertController;
  id v14;
  NSMutableDictionary *devices;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  _QWORD v32[5];
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];

  if (!-[NSMutableDictionary count](self->_devices, "count"))
  {
    -[ProfileDevicePickerMainController _pickerAlertShowNoDevices](self, "_pickerAlertShowNoDevices");
    return;
  }
  pickerFlags = self->_pickerFlags;
  if ((~pickerFlags & 3) != 0)
  {
    if ((pickerFlags & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CHOOSE_APPLETV_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("CHOOSE_APPLETV_INFO");
    }
    else
    {
      if ((pickerFlags & 2) == 0)
      {
        v9 = 0;
        goto LABEL_23;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CHOOSE_TITLE_HOMEPOD"), &stru_10017E3D8, CFSTR("Localizable")));

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("CHOOSE_INFO_HOMEPOD");
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CHOOSE_DEVICE_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("CHOOSE_DEVICE_INFO");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_10017E3D8, CFSTR("Localizable")));

  if (!v5)
  {
LABEL_23:
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CHOOSE_DEVICE_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

    if (v9)
      goto LABEL_12;
LABEL_24:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CHOOSE_DEVICE_INFO"), &stru_10017E3D8, CFSTR("Localizable")));

    goto LABEL_12;
  }
  if (!v9)
    goto LABEL_24;
LABEL_12:
  v30 = (void *)v5;
  v12 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v9, 1));
  alertController = self->_alertController;
  self->_alertController = v12;

  v14 = objc_alloc_init((Class)NSMutableArray);
  devices = self->_devices;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000FF7DC;
  v38[3] = &unk_10017D7E0;
  v16 = v14;
  v39 = v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devices, "enumerateKeysAndObjectsUsingBlock:", v38);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v16;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        if (v22)
          v23 = (__CFString *)v22;
        else
          v23 = CFSTR("?");
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000FF848;
        v33[3] = &unk_10017D808;
        v33[4] = self;
        v33[5] = v21;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 0, v33));
        -[UIAlertController addAction:](self->_alertController, "addAction:", v24);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v18);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10017E3D8, CFSTR("Localizable")));

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000FF880;
  v32[3] = &unk_10017D830;
  v32[4] = self;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v26, 1, v32));
  -[UIAlertController addAction:](self->_alertController, "addAction:", v27);
  -[ProfileDevicePickerMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alertController, 1, 0);

}

- (void)_pickerAlertHandlePickedDevice:(id)a3
{
  id v4;
  NSDictionary *userInfo;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v8;
  SFSystemSession *v9;
  SFSystemSession *systemSession;
  SFSystemSession *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *installTimeoutTimer;
  NSObject *v14;
  NSString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  _QWORD handler[5];
  _QWORD v22[5];
  NSErrorUserInfoKey v23;
  const __CFString *v24;

  v4 = a3;
  userInfo = self->super._userInfo;
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(userInfo, CFSTR("profileData"), TypeID, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v8)
  {
    v9 = (SFSystemSession *)objc_alloc_init((Class)SFSystemSession);
    systemSession = self->_systemSession;
    self->_systemSession = v9;

    -[SFSystemSession setPeerDevice:](self->_systemSession, "setPeerDevice:", v4);
    -[SFSystemSession activate](self->_systemSession, "activate");
    v11 = self->_systemSession;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000FF6E8;
    v22[3] = &unk_10017D858;
    v22[4] = self;
    -[SFSystemSession installProfileWithData:completion:](v11, "installProfileWithData:completion:", v8, v22);
    v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    installTimeoutTimer = self->_installTimeoutTimer;
    self->_installTimeoutTimer = v12;

    v14 = self->_installTimeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000FF7A0;
    handler[3] = &unk_10017E1F0;
    handler[4] = self;
    dispatch_source_set_event_handler(v14, handler);
    SFDispatchTimerSet(self->_installTimeoutTimer, 30.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_installTimeoutTimer);
  }
  else
  {
    v23 = NSLocalizedDescriptionKey;
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960551, 0, 0));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)v16;
    v18 = CFSTR("?");
    if (v16)
      v18 = (const __CFString *)v16;
    v24 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6745, v19));
    -[ProfileDevicePickerMainController _pickerAlertShowError:](self, "_pickerAlertShowError:", v20);

  }
}

- (void)_pickerAlertShowNoDevices
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
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CHOOSE_NO_DEVICES_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CHOOSE_NO_DEVICES_INFO"), &stru_10017E3D8, CFSTR("Localizable")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000FF6DC;
  v12[3] = &unk_10017D830;
  v12[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, v12));
  objc_msgSend(v7, "addAction:", v10);
  -[ProfileDevicePickerMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.sharing.DeviceProfile"), CFSTR("com.apple.sharingd"), &off_100183620, 1);

}

- (void)_pickerAlertShowError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  const __CFString *v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CHOOSE_INSTALL_FAILED_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

  v7 = objc_msgSend(v4, "code");
  v15 = sub_1001173A4(CFSTR("CHOOSE_INSTALL_FAILED_INFO_FORMAT"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v16, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000FF6D0;
  v25[3] = &unk_10017D830;
  v25[4] = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, v25));
  objc_msgSend(v17, "addAction:", v20);
  -[ProfileDevicePickerMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
  v26 = CFSTR("errorCode");
  v21 = objc_msgSend(v4, "code");

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
  v27 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.sharing.DeviceProfile"), CFSTR("com.apple.sharingd"), v23, 1);

}

- (void)_pickerAlertShowSuccess
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CHOOSE_SUCCESS_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FF6C4;
  v10[3] = &unk_10017D830;
  v10[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v10));
  objc_msgSend(v5, "addAction:", v8);
  -[ProfileDevicePickerMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.sharing.DeviceProfile"), CFSTR("com.apple.sharingd"), &off_100183648, 1);

}

- (void)_pickerAlertCanceled
{
  UIAlertController *alertController;
  id v4;

  alertController = self->_alertController;
  self->_alertController = 0;

  if (dword_1001A87C0 <= 30 && (dword_1001A87C0 != -1 || _LogCategory_Initialize(&dword_1001A87C0, 30)))
    LogPrintF(&dword_1001A87C0, "-[ProfileDevicePickerMainController _pickerAlertCanceled]", 30, "Cancel\n");
  -[ProfileDevicePickerMainController dismiss:](self, "dismiss:", 8);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.sharing.DeviceProfile"), CFSTR("com.apple.sharingd"), &off_100183670, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSession, 0);
  objc_storeStrong((id *)&self->_installTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
