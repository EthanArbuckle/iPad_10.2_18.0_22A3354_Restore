@implementation CCUIConnectivityAirplaneViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIConnectivityAirplaneViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIConnectivityAirplaneViewController"), CFSTR("buttonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIConnectivityAirplaneViewController"), CFSTR("_isAirplaneModeEnabled"), "B", 0);

}

- (void)buttonTapped:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  CCUIConnectivityAirplaneViewControllerAccessibility *v26;
  _QWORD v27[4];
  id v28;
  char v29;

  v4 = a3;
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    objc_msgSend(MEMORY[0x24BE005E8], "bluetoothKeyboardDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x24BE00770], "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isBluetoothBrailleDisplayConnected");

  }
  else
  {
    v8 = 0;
  }
  v9 = -[CCUIConnectivityAirplaneViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isAirplaneModeEnabled"));
  if ((UIAccessibilityIsSwitchControlRunning() | v6 | v8) != 1 || (v9 & 1) != 0)
  {
    v23.receiver = self;
    v23.super_class = (Class)CCUIConnectivityAirplaneViewControllerAccessibility;
    -[CCUIConnectivityAirplaneViewControllerAccessibility buttonTapped:](&v23, sel_buttonTapped_, v4);
  }
  else
  {
    v29 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDF67F0];
    accessibilityLocalizedString(CFSTR("control.center.airplane.mode.enable.alert.title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("control.center.bluetooth.devices.disconnect.message"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDF67E8];
    accessibilityLocalizedString(CFSTR("control.center.alert.cancel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __68__CCUIConnectivityAirplaneViewControllerAccessibility_buttonTapped___block_invoke;
    v27[3] = &unk_2501D4388;
    v28 = v10;
    v18 = v10;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDF67E8];
    accessibilityLocalizedString(CFSTR("control.center.airplane.mode.alert.confirm"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __68__CCUIConnectivityAirplaneViewControllerAccessibility_buttonTapped___block_invoke_2;
    v24[3] = &unk_2501D43B0;
    v25 = v4;
    v26 = self;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addAction:", v19);
    objc_msgSend(v14, "addAction:", v22);
    objc_msgSend(v14, "setPreferredAction:", v19);
    objc_msgSend(v18, "presentViewController:animated:completion:", v14, 1, 0);

  }
}

uint64_t __68__CCUIConnectivityAirplaneViewControllerAccessibility_buttonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

id __68__CCUIConnectivityAirplaneViewControllerAccessibility_buttonTapped___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)CCUIConnectivityAirplaneViewControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_buttonTapped_, v1);
}

@end
