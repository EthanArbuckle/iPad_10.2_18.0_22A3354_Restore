@implementation BTSDevicesControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BTSDevicesController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BTSDevicesController"), CFSTR("setBluetoothEnabled:specifier:"), "v", "@", "@", 0);
}

- (void)setBluetoothEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  BTSDevicesControllerAccessibility *v30;
  _QWORD v31[5];
  id v32;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enabled");

  v10 = objc_msgSend(v6, "BOOLValue");
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    objc_msgSend(MEMORY[0x24BE005E8], "bluetoothKeyboardDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") != 0;

  }
  else
  {
    v12 = 0;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x24BE00770], "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isBluetoothBrailleDisplayConnected");

  }
  else
  {
    v14 = 0;
  }
  if ((((UIAccessibilityIsSwitchControlRunning() | v12 | v14) & (v9 ^ v10) ^ 1 | v10) & 1) != 0)
  {
    v27.receiver = self;
    v27.super_class = (Class)BTSDevicesControllerAccessibility;
    -[BTSDevicesControllerAccessibility setBluetoothEnabled:specifier:](&v27, sel_setBluetoothEnabled_specifier_, v6, v7);
  }
  else
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDF67F0];
    accessibilityLocalizedString(CFSTR("bluetooth.disable.alert.title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("bluetooth.disable.alert.message"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v15);
    v20 = (void *)MEMORY[0x24BDF67E8];
    accessibilityLocalizedString(CFSTR("alert.cancel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __67__BTSDevicesControllerAccessibility_setBluetoothEnabled_specifier___block_invoke;
    v31[3] = &unk_250196308;
    objc_copyWeak(&v32, &location);
    v31[4] = self;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDF67E8];
    accessibilityLocalizedString(CFSTR("bluetooth.alert.confirm"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __67__BTSDevicesControllerAccessibility_setBluetoothEnabled_specifier___block_invoke_2;
    v28[3] = &unk_250196330;
    v29 = v7;
    v30 = self;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 0, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addAction:", v23);
    objc_msgSend(v19, "addAction:", v26);
    objc_msgSend(v15, "presentViewController:animated:completion:", v19, 1, 0);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

void __67__BTSDevicesControllerAccessibility_setBluetoothEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSpecifiers");

}

id __67__BTSDevicesControllerAccessibility_setBluetoothEnabled_specifier___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BTSDevicesControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_setBluetoothEnabled_specifier_, MEMORY[0x24BDBD1C0], v1);
}

@end
