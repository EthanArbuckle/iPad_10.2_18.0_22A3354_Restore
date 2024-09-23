@implementation HACCStatusView

- (HACCStatusView)initWithFrame:(CGRect)a3
{
  HACCStatusView *v3;
  CBDiscovery *v4;
  CBDiscovery *bluetoothDiscovery;
  void *v6;
  uint64_t v7;
  CBDiscovery *v8;
  NSNumberFormatter *v9;
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIImageView *iconImageView;
  void *v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BCBatteryDeviceController *v25;
  BCBatteryDeviceController *batteryController;
  BCBatteryDeviceController *v27;
  uint64_t v28;
  id v29;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)HACCStatusView;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (CBDiscovery *)objc_alloc_init(MEMORY[0x24BDBB250]);
    bluetoothDiscovery = v3->_bluetoothDiscovery;
    v3->_bluetoothDiscovery = v4;

    +[HACCStatusView _backgroundUpdateQueue](HACCStatusView, "_backgroundUpdateQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBDiscovery setDispatchQueue:](v3->_bluetoothDiscovery, "setDispatchQueue:", v6);

    -[CBDiscovery setDiscoveryFlags:](v3->_bluetoothDiscovery, "setDiscoveryFlags:", 10485760);
    v7 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __32__HACCStatusView_initWithFrame___block_invoke;
    v33[3] = &unk_24DD60EF8;
    objc_copyWeak(&v34, &location);
    -[CBDiscovery setDeviceFoundHandler:](v3->_bluetoothDiscovery, "setDeviceFoundHandler:", v33);
    v8 = v3->_bluetoothDiscovery;
    v31[0] = v7;
    v31[1] = 3221225472;
    v31[2] = __32__HACCStatusView_initWithFrame___block_invoke_3;
    v31[3] = &unk_24DD60F20;
    objc_copyWeak(&v32, &location);
    -[CBDiscovery activateWithCompletion:](v8, "activateWithCompletion:", v31);
    v3->_shouldAutoExpandForAvailableHAs = 0;
    v9 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    numberFormatter = v3->_numberFormatter;
    v3->_numberFormatter = v9;

    -[NSNumberFormatter setNumberStyle:](v3->_numberFormatter, "setNumberStyle:", 3);
    -[NSNumberFormatter setMaximumFractionDigits:](v3->_numberFormatter, "setMaximumFractionDigits:", 0);
    v11 = v3->_numberFormatter;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](v11, "stringFromNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setNotANumberSymbol:](v11, "setNotANumberSymbol:", v13);

    v14 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 4, 23.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "systemImageNamed:withConfiguration:", CFSTR("hearingdevice.ear"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    HUICCImageViewWithImage(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v17;

    -[HUICCCapsuleButton setIconView:](v3, "setIconView:", v3->_iconImageView);
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (uint64_t *)MEMORY[0x24BE64898];
    v37[0] = *MEMORY[0x24BE64898];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAttribute:forKey:error:", v21, *MEMORY[0x24BE64930], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *v20;
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel_updateValue, v23, v24);

    v25 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x24BE0BF88]);
    batteryController = v3->_batteryController;
    v3->_batteryController = v25;

    v27 = v3->_batteryController;
    v28 = MEMORY[0x24BDAC9B8];
    v29 = MEMORY[0x24BDAC9B8];
    -[BCBatteryDeviceController addBatteryDeviceObserver:queue:](v27, "addBatteryDeviceObserver:queue:", v3, v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __32__HACCStatusView_initWithFrame___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HACCStatusView_initWithFrame___block_invoke_2;
  block[3] = &unk_24DD60E18;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __32__HACCStatusView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateValue");

}

void __32__HACCStatusView_initWithFrame___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5[5];

  if (!a2)
  {
    v5[3] = v2;
    v5[4] = v3;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__HACCStatusView_initWithFrame___block_invoke_4;
    block[3] = &unk_24DD60E18;
    objc_copyWeak(v5, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v5);
  }
}

void __32__HACCStatusView_initWithFrame___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateValue");

}

- (void)dealloc
{
  objc_super v3;

  -[CBDiscovery invalidate](self->_bluetoothDiscovery, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HACCStatusView;
  -[HACCStatusView dealloc](&v3, sel_dealloc);
}

- (void)updateConstraints
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HACCStatusView;
  -[HACCStatusView updateConstraints](&v2, sel_updateConstraints);
}

- (id)_productIdentifierFromBluetoothRoute:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("BTHeadphones"), &stru_24DD62430);
}

- (CGSize)liveListenImageSize:(id)a3 forProductID:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a4;
  objc_msgSend(a3, "size");
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("76,8202"));

  v11 = 26.0;
  if (v10)
    v12 = 26.0;
  else
    v12 = v9;
  if (!v10)
    v11 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)liveListenImageNameFromBluetoothRoute:(id)a3
{
  void *v3;
  int v4;
  int v5;
  int v6;
  const __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;

  -[HACCStatusView _productIdentifierFromBluetoothRoute:](self, "_productIdentifierFromBluetoothRoute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("76,8203"));
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("76,8204"));
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("76,8206"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("76,8202")) & 1) != 0)
    goto LABEL_10;
  v7 = CFSTR("hearingDevicesIcon");
  if (v4)
    v7 = CFSTR("b444");
  if (v5)
    v7 = CFSTR("b419");
  v8 = v6 ? CFSTR("b298") : (__CFString *)v7;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE4BE10]))
LABEL_10:
    v8 = CFSTR("b515");
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("76,8205")))
    v8 = CFSTR("b364");
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("76,8210")))
    v8 = CFSTR("B494");
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("76,8211")))
    v9 = CFSTR("B688");
  else
    v9 = v8;
  v10 = objc_msgSend(v3, "isEqualToString:", CFSTR("76,8212"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("76,8228")) | v10)
    v11 = CFSTR("b298");
  else
    v11 = v9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("76,8215")))
    v11 = CFSTR("beats.headphones");
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("76,8230")))
    v11 = CFSTR("beats.studiobuds");
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("76,8229")))
    v11 = CFSTR("beats.headphones");
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("76,8214")))
    v11 = CFSTR("beats.studiobuds");

  return (id)v11;
}

+ (id)_backgroundUpdateQueue
{
  if (_backgroundUpdateQueue_onceToken != -1)
    dispatch_once(&_backgroundUpdateQueue_onceToken, &__block_literal_global_0);
  return (id)_backgroundUpdateQueue__backgroundUpdateQueue;
}

void __40__HACCStatusView__backgroundUpdateQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("hacc.background.queue", v0);
  v2 = (void *)_backgroundUpdateQueue__backgroundUpdateQueue;
  _backgroundUpdateQueue__backgroundUpdateQueue = (uint64_t)v1;

}

- (void)updateValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  CBDiscovery *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CBDiscovery *v22;
  NSObject *v23;
  _QWORD block[4];
  CBDiscovery *v25;
  HACCStatusView *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)HACCStatusView;
  -[HUICCCapsuleButton updateValue](&v34, sel_updateValue);
  -[HACCStatusView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_255118100);

  if (v4)
  {
    -[HACCStatusView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentHearingDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (objc_msgSend(v6, "propertyIsAvailable:forEar:", 4, objc_msgSend(v6, "availableEars")))
      {
        -[HACCStatusView _updateBatterySubtitleLabelForDevice:](self, "_updateBatterySubtitleLabelForDevice:", v6);
      }
      else
      {
        -[HUICCCapsuleButton subtitleLabel](self, "subtitleLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", 0);

      }
      v7 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 1;
LABEL_9:
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  accessibilityHearingAidImageNamed(CFSTR("hearingDevicesIcon"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v29[5];
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_flatImageWithColor:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v29[5];
  v29[5] = v11;

  if ((v7 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hearingAidReachable") & 1) == 0)
  {

    goto LABEL_16;
  }
  -[HACCStatusView delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "shouldDisplayOtherDevice");

  if (v15)
  {
LABEL_16:
    v22 = self->_bluetoothDiscovery;
    +[HACCStatusView _backgroundUpdateQueue](HACCStatusView, "_backgroundUpdateQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__HACCStatusView_updateValue__block_invoke;
    block[3] = &unk_24DD61000;
    v26 = self;
    v27 = &v28;
    v25 = v22;
    v16 = v22;
    dispatch_async(v23, block);

    goto LABEL_17;
  }
  objc_msgSend(v6, "name");
  v16 = (CBDiscovery *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[HUICCCapsuleButton titleLabel](self, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

  }
  v18 = (void *)v29[5];
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_flatImageWithColor:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v29[5];
  v29[5] = v20;

  -[UIImageView setImage:](self->_iconImageView, "setImage:", v29[5]);
  -[HACCStatusView setBatteryDevice:](self, "setBatteryDevice:", 0);
  -[HACCStatusView setShouldAutoExpandForAvailableHAs:](self, "setShouldAutoExpandForAvailableHAs:", 1);
LABEL_17:

  _Block_object_dispose(&v28, 8);
}

void __29__HACCStatusView_updateValue__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD v25[4];
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPickableAudioRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("AXSHARoutePicked"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE648F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE648C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  objc_msgSend(*(id *)(a1 + 32), "discoveredDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __29__HACCStatusView_updateValue__block_invoke_2;
  v26[3] = &unk_24DD60F88;
  v9 = v5;
  v27 = v9;
  v28 = &v29;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v26);

  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (*((_BYTE *)v30 + 24) && objc_msgSend(v6, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "liveListenImageNameFromBluetoothRoute:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityHearingAidImageNamed(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_flatImageWithColor:", v13);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  objc_msgSend(*(id *)(a1 + 40), "setBatteryDevice:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 640), "connectedDevices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __29__HACCStatusView_updateValue__block_invoke_3;
  v21[3] = &unk_24DD60FB0;
  v15 = v9;
  v16 = *(_QWORD *)(a1 + 40);
  v22 = v15;
  v23 = v16;
  v24 = v25;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE647C0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  v19 = v6;
  v20 = v17;
  AXPerformBlockOnMainThread();

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v29, 8);

}

void __29__HACCStatusView_updateValue__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE v11[18];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "btAddressData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(objc_retainAutorelease(v7), "bytes");
    HardwareAddressToCString();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "localizedCaseInsensitiveContainsString:", v10);

    if ((_DWORD)v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (objc_msgSend(v6, "gapaFlags") & 2) == 0;
      *a4 = 1;
    }
  }

}

void __29__HACCStatusView_updateValue__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "accessoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "containsString:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "setBatteryDevice:", v7);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (double)objc_msgSend(v7, "percentCharge") / 100.0;
    *a4 = 1;
  }

}

void __29__HACCStatusView_updateValue__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "liveListenImageSize:forProductID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "frame");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setFrame:");
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setText:", *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 32), "batteryDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(v4, "_updateBatterySubtitleLabelForLeft:right:andAvailableEars:", 6, v5, v5);
  }
  else
  {
    objc_msgSend(v4, "subtitleLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", 0);

  }
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (void)_updateBatterySubtitleLabelForDevice:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "leftBatteryLevel");
  v6 = v5;
  objc_msgSend(v4, "rightBatteryLevel");
  v8 = v7;
  v9 = objc_msgSend(v4, "availableEars");

  -[HACCStatusView _updateBatterySubtitleLabelForLeft:right:andAvailableEars:](self, "_updateBatterySubtitleLabelForLeft:right:andAvailableEars:", v9, v6, v8);
}

- (void)_updateBatterySubtitleLabelForLeft:(double)a3 right:(double)a4 andAvailableEars:(int)a5
{
  double v6;
  void *v8;
  void *v9;
  NSNumberFormatter *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSNumberFormatter *numberFormatter;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSNumberFormatter *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;

  if (a5)
  {
    v6 = a4;
    if (a5 == 6 && vabdd_f64(a3, a4) >= 0.05)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      numberFormatter = self->_numberFormatter;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v14, v15, v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      hearingLocString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self->_numberFormatter;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](v22, "stringFromNumber:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v20, v21, v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", v12, v9, v11);
    }
    else
    {
      if (a5 == 2)
        v6 = a3;
      v8 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_numberFormatter;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](v10, "stringFromNumber:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v12, v28);
    }
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  -[HUICCCapsuleButton subtitleLabel](self, "subtitleLabel", a3, a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v29);

  -[HACCStatusView delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "updateHeight");

}

- (BOOL)shouldAutoExpandForView:(id)a3
{
  return 0;
}

- (BOOL)shouldAddSeparatorForView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HACCStatusView module](self, "module") || (objc_opt_respondsToSelector() & 1) == 0)
      LOBYTE(v9) = 1;
    else
      v9 = objc_msgSend(v8, "providesOwnSeparator") ^ 1;

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUICCCapsuleButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSNumberFormatter *numberFormatter;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  NSNumberFormatter *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSNumberFormatter *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  objc_super v27;

  -[HACCStatusView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentHearingDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isConnected"))
  {
    if (objc_msgSend(v4, "leftAvailable"))
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      numberFormatter = self->_numberFormatter;
      v8 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "leftBatteryLevel");
      objc_msgSend(v8, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v4, "rightAvailable"))
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_numberFormatter;
      v22 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "rightBatteryLevel");
      objc_msgSend(v22, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](v21, "stringFromNumber:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v15, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  -[HACCStatusView batteryDevice](self, "batteryDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_10;
  -[HACCStatusView batteryDevice](self, "batteryDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (double)objc_msgSend(v12, "percentCharge") / 100.0;

  v14 = (void *)MEMORY[0x24BDD17C8];
  hearingLocString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_numberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v16, "stringFromNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
LABEL_9:

LABEL_11:
  if (objc_msgSend(v11, "length") || objc_msgSend(v19, "length"))
  {
    v27.receiver = self;
    v27.super_class = (Class)HACCStatusView;
    -[HUICCCapsuleButton accessibilityValue](&v27, sel_accessibilityValue);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    hearingLocString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    hearingLocString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (HACCContentModuleDelegate)delegate
{
  return (HACCContentModuleDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (BCBatteryDevice)batteryDevice
{
  return (BCBatteryDevice *)objc_getProperty(self, a2, 632, 1);
}

- (void)setBatteryDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 632);
}

- (BCBatteryDeviceController)batteryController
{
  return self->_batteryController;
}

- (void)setBatteryController:(id)a3
{
  objc_storeStrong((id *)&self->_batteryController, a3);
}

- (CBDiscovery)bluetoothDiscovery
{
  return (CBDiscovery *)objc_getProperty(self, a2, 648, 1);
}

- (void)setBluetoothDiscovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (BOOL)shouldAutoExpandForAvailableHAs
{
  return self->_shouldAutoExpandForAvailableHAs;
}

- (void)setShouldAutoExpandForAvailableHAs:(BOOL)a3
{
  self->_shouldAutoExpandForAvailableHAs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDiscovery, 0);
  objc_storeStrong((id *)&self->_batteryController, 0);
  objc_storeStrong((id *)&self->_batteryDevice, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end
