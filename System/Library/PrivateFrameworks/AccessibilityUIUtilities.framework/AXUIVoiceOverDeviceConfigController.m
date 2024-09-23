@implementation AXUIVoiceOverDeviceConfigController

- (AXUIVoiceOverDeviceConfigController)init
{
  AXUIVoiceOverDeviceConfigController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SCROBrailleClient *brailleClient;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXUIVoiceOverDeviceConfigController;
  v2 = -[AXUISettingsSetupCapableListController init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_deviceRemoved_, *MEMORY[0x1E0CF4ED8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_deviceUpdated_, *MEMORY[0x1E0CF4EE0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_deviceConnectedHandler_, *MEMORY[0x1E0CF4ED0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_deviceConnectedHandler_, *MEMORY[0x1E0CF4EC8], 0);

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8BEE0]), "initWithDelegate:", v2);
    brailleClient = v2->_brailleClient;
    v2->_brailleClient = (SCROBrailleClient *)v7;

    -[SCROBrailleClient setKeepConnectionAlive:](v2->_brailleClient, "setKeepConnectionAlive:", 1);
    -[SCROBrailleClient setDisplayDescriptorCallbackEnabled:](v2->_brailleClient, "setDisplayDescriptorCallbackEnabled:", 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXUIVoiceOverDeviceConfigController;
  -[AXUISettingsSetupCapableListController dealloc](&v4, sel_dealloc);
}

- (void)_doReallyForgetDevice
{
  NSObject *v3;
  AXUIBluetoothDevice *device;
  void *v5;
  id v6;
  int v7;
  AXUIBluetoothDevice *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_dismissed = 1;
  -[AXUIBluetoothDevice unpair](self->_device, "unpair");
  AXLogBrailleHW();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    device = self->_device;
    v7 = 138412290;
    v8 = device;
    _os_log_impl(&dword_1BD892000, v3, OS_LOG_TYPE_INFO, "Unpair device: %@", (uint8_t *)&v7, 0xCu);
  }

  -[AXUIVoiceOverDeviceConfigController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)_clearVOUSBRMDisabler
{
  _AXSGetUSBRMDisablers();
  _AXSSetUSBRMDisablers();
}

- (void)_allowUSBRM
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBoolValue:forSetting:", 1, *MEMORY[0x1E0D47198]);

}

- (void)forgetDevice:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  _QWORD v31[5];
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[SCROBrailleClient driverConfiguration](self->_brailleClient, "driverConfiguration", a3);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v4)
  {
    _AXSGetUSBRMDisablers();
LABEL_17:
    -[AXUIVoiceOverDeviceConfigController _doReallyForgetDevice](self, "_doReallyForgetDevice");
    goto LABEL_18;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v34 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D8BEF0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      v13 = v12 == 4;
      if (v12 == 4)
        ++v7;
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D8BEE8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIBluetoothDevice identifier](self->_device, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (v16)
        v6 = v13;
    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v5);
  v17 = _AXSGetUSBRMDisablers();
  if (!v6 || (v17 & 1) == 0 || v7 != 1)
    goto LABEL_17;
  v18 = (void *)MEMORY[0x1E0DC3450];
  AXUILocalizedStringForKey(CFSTR("BRAILLE_USBRM_QUERY_TITLE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocStringKeyForModel();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  AXUILocalizedStringForKey(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0DC3448];
  AXUILocalizedStringForKey(CFSTR("BRAILLE_USBRM_TURN_OFF"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __52__AXUIVoiceOverDeviceConfigController_forgetDevice___block_invoke;
  v32[3] = &unk_1E76AB990;
  v32[4] = self;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 0, v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v26);

  v27 = (void *)MEMORY[0x1E0DC3448];
  AXUILocalizedStringForKey(CFSTR("BRAILLE_USBRM_ALLOW_CONNECTIONS"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v31[1] = 3221225472;
  v31[2] = __52__AXUIVoiceOverDeviceConfigController_forgetDevice___block_invoke_2;
  v31[3] = &unk_1E76AB990;
  v31[4] = self;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 0, v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v29);

  -[AXUIVoiceOverDeviceConfigController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
LABEL_18:

}

uint64_t __52__AXUIVoiceOverDeviceConfigController_forgetDevice___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_allowUSBRM");
  objc_msgSend(*(id *)(a1 + 32), "_clearVOUSBRMDisabler");
  return objc_msgSend(*(id *)(a1 + 32), "_doReallyForgetDevice");
}

uint64_t __52__AXUIVoiceOverDeviceConfigController_forgetDevice___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearVOUSBRMDisabler");
  return objc_msgSend(*(id *)(a1 + 32), "_doReallyForgetDevice");
}

- (void)deviceConnectedHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 dismissed;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF39B0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ignoreLogging");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39B0], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      AXColorizeFormatLog();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v21 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v13;
      _AXStringForArgs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_impl(&dword_1BD892000, v10, v11, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v6, "identifier", v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIBluetoothDevice identifier](self->_device, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", v17))
  {

LABEL_12:
    goto LABEL_13;
  }
  dismissed = self->_dismissed;

  if (!dismissed)
  {
    -[NSArray objectAtIndex:](self->_deviceSpecifiers, "objectAtIndex:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v19;
    if (v19)
    {
      objc_msgSend(v19, "setProperty:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0D80808]);
      -[AXUIVoiceOverDeviceConfigController reloadSpecifier:](self, "reloadSpecifier:", v16);
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)deviceUpdated:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 dismissed;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIBluetoothDevice identifier](self->_device, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", v5))
  {

    goto LABEL_5;
  }
  dismissed = self->_dismissed;

  if (!dismissed)
  {
    -[AXUIBluetoothDevice name](self->_device, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverDeviceConfigController setTitle:](self, "setTitle:", v4);
LABEL_5:

  }
}

- (void)deviceRemoved:(id)a3
{
  void *v4;
  NSObject *v5;
  AXUIBluetoothDevice *device;
  void *v7;
  void *v8;
  _BOOL4 dismissed;
  int v10;
  void *v11;
  __int16 v12;
  AXUIBluetoothDevice *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogBrailleHW();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = device;
    _os_log_impl(&dword_1BD892000, v5, OS_LOG_TYPE_DEFAULT, "Device removed: %@, current device: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIBluetoothDevice identifier](self->_device, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    dismissed = self->_dismissed;

    if (!dismissed)
    {
      self->_dismissed = 1;
      -[AXUIVoiceOverDeviceConfigController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }
  else
  {

  }
}

- (int64_t)axDeviceControllerType
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[AXUIVoiceOverDeviceConfigController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("axDeviceControllerType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  return v5;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  AXUIBluetoothDevice *v6;
  AXUIBluetoothDevice *device;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *deviceSpecifiers;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (!self->_device)
  {
    buf[0] = 0;
    objc_opt_class();
    -[AXUIVoiceOverDeviceConfigController specifier](self, "specifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", CFSTR("bt-device"));
    v6 = (AXUIBluetoothDevice *)objc_claimAutoreleasedReturnValue();
    device = self->_device;
    self->_device = v6;

  }
  AXLogBrailleHW();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AXUIVoiceOverDeviceConfigController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverDeviceConfigController specifier](self, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v67 = v9;
    v68 = 2112;
    v69 = v11;
    _os_log_impl(&dword_1BD892000, v8, OS_LOG_TYPE_DEFAULT, "SPEC: %@ / %@", buf, 0x16u);

  }
  v12 = (int)*MEMORY[0x1E0D80590];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v12))
  {
    v64 = (int)*MEMORY[0x1E0D80590];
    v13 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIVoiceOverDeviceConfigController loadSpecifiersFromPlistName:target:bundle:](self, "loadSpecifiersFromPlistName:target:bundle:", CFSTR("BluetoothDeviceConfig"), self, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithArray:", v15);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    deviceSpecifiers = self->_deviceSpecifiers;
    self->_deviceSpecifiers = v16;

    -[NSArray objectAtIndex:](self->_deviceSpecifiers, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AXLocStringKeyForModel();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    AXUILocalizedStringForKey(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v18;
    objc_msgSend(v18, "setProperty:forKey:", v20, *MEMORY[0x1E0D80848]);

    -[NSArray objectAtIndex:](self->_deviceSpecifiers, "objectAtIndex:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AXUILocalizedStringForKey(CFSTR("DISCONNECT_ON_SLEEP_BRAILLE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D80978];
    objc_msgSend(v21, "setProperty:forKey:", v22, *MEMORY[0x1E0D80978]);

    AXUILocalizedStringForKey(CFSTR("DISCONNECT_ON_SLEEP_BRAILLE"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v21;
    objc_msgSend(v21, "setName:", v24);

    v60 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
    -[NSArray objectAtIndex:](self->_deviceSpecifiers, "objectAtIndex:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0D807A0];
    objc_msgSend(v25, "propertyForKey:", *MEMORY[0x1E0D807A0]);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    AXUILocalizedStringForKey(CFSTR("FORGET_BUTTON"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setProperty:forKey:", v27, v23);

    AXUILocalizedStringForKey(CFSTR("FORGET_BUTTON"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v25;
    objc_msgSend(v25, "setName:", v28);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "userInterfaceIdiom");

    if (v30 == 1)
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      AXUILocalizedStringForKey(CFSTR("FORGET_ALERT_TITLE"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIBluetoothDevice name](self->_device, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x1E0C99D80];
      v36 = *MEMORY[0x1E0D807B8];
      AXUILocalizedStringForKey(CFSTR("FORGET_ALERT_BODY"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *MEMORY[0x1E0D807B0];
      AXUILocalizedStringForKey(CFSTR("CANCEL"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v34, v36, v37, v38, v39, *MEMORY[0x1E0D80790], 0);
    }
    else
    {
      v40 = (void *)MEMORY[0x1E0C99D80];
      AXUILocalizedStringForKey(CFSTR("FORGET_SHEET_TITLE"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *MEMORY[0x1E0D807B8];
      AXUILocalizedStringForKey(CFSTR("CANCEL"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x1E0D80790];
      AXUILocalizedStringForKey(CFSTR("OK"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "dictionaryWithObjectsAndKeys:", v34, v41, v37, v42, v39, *MEMORY[0x1E0D807A8], 0);
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addEntriesFromDictionary:", v43);

    -[NSArray objectAtIndex:](self->_deviceSpecifiers, "objectAtIndex:", 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setProperty:forKey:", v65, v26);

    -[NSArray objectAtIndex:](self->_deviceSpecifiers, "objectAtIndex:", 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setupWithDictionary:", v65);

    -[AXUIVoiceOverDeviceConfigController parentController](self, "parentController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_opt_respondsToSelector();

    v12 = v64;
    if ((v47 & 1) != 0)
    {
      -[AXUIVoiceOverDeviceConfigController parentController](self, "parentController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "detailSpecifiersForDevice:withTarget:", self->_device, self);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v49, "count"))
        objc_msgSend(v60, "addObjectsFromArray:", v49);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v50 = (void *)-[NSArray mutableCopy](self->_deviceSpecifiers, "mutableCopy");
      if (-[AXUIVoiceOverDeviceConfigController axDeviceControllerType](self, "axDeviceControllerType") != 1)
        objc_msgSend(v50, "removeObjectsInRange:", 0, 2);
      objc_msgSend(v60, "addObjectsFromArray:", v50);

    }
    -[AXUIVoiceOverDeviceConfigController parentController](self, "parentController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_23;
    -[AXUIVoiceOverDeviceConfigController parentController](self, "parentController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_opt_respondsToSelector();

    if ((v53 & 1) != 0)
    {
      -[AXUIVoiceOverDeviceConfigController parentController](self, "parentController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v51, "bluetoothIsBusy")
        || (-[AXUIBluetoothDevice isBTLEDevice](self->_device, "isBTLEDevice") & 1) != 0)
      {
        goto LABEL_23;
      }
      -[AXUIVoiceOverDeviceConfigController parentController](self, "parentController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "currentSpecifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIVoiceOverDeviceConfigController specifier](self, "specifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55 == v56)
      {
        -[NSArray objectAtIndex:](self->_deviceSpecifiers, "objectAtIndex:", 3);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setProperty:forKey:", *MEMORY[0x1E0C9AE40], *MEMORY[0x1E0D80808]);
LABEL_23:

      }
    }
    v57 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v64);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v64) = (Class)v60;

  }
  -[AXUIBluetoothDevice name](self->_device, "name");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIVoiceOverDeviceConfigController setTitle:](self, "setTitle:", v58);

  return *(id *)((char *)&self->super.super.super.super.super.super.isa + v12);
}

- (id)disconnectOnSleep:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceOverBrailleDisconnectOnSleep");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIBluetoothDevice address](self->_device, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[SCROBrailleClient driverConfiguration](self->_brailleClient, "driverConfiguration");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v21 = 0;
      v11 = *(_QWORD *)v24;
      v12 = (_QWORD *)MEMORY[0x1E0D8BEE8];
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKey:", *v12, v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXUIBluetoothDevice identifier](self->_device, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v17)
          {
            objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D8BEF0]);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntegerValue");

            if (v19 == 8)
            {
              v7 = v21;
              v8 = (id)MEMORY[0x1E0C9AAA0];
              goto LABEL_15;
            }
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
          continue;
        break;
      }
      v8 = (id)MEMORY[0x1E0C9AAB0];
      v7 = v21;
    }
    else
    {
      v8 = (id)MEMORY[0x1E0C9AAB0];
    }
LABEL_15:

  }
  return v8;
}

- (void)setDisconnectOnSleep:(id)a3 specifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CF4E98];
  v6 = a3;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "voiceOverBrailleDisconnectOnSleep");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v11)
    v11 = (id)objc_opt_new();
  -[AXUIBluetoothDevice address](self->_device, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v9);

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVoiceOverBrailleDisconnectOnSleep:", v11);

}

- (AXUIBluetoothDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_brailleClient, 0);
  objc_storeStrong((id *)&self->_deviceSpecifiers, 0);
}

@end
