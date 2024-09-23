@implementation CCUIConnectivityBluetoothViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIConnectivityBluetoothViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIConnectivityBluetoothViewController"), CFSTR("buttonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIConnectivityBluetoothViewController"), CFSTR("_currentState"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIConnectivityBluetoothViewController"), CFSTR("_stateWithOverridesApplied:"), "i", "i", 0);

}

- (void)buttonTapped:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];
  id v27;
  CCUIConnectivityBluetoothViewControllerAccessibility *v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  CCUIConnectivityBluetoothViewControllerAccessibility *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;

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
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v9 = MEMORY[0x24BDAC760];
  v31 = MEMORY[0x24BDAC760];
  v32 = 3221225472;
  v33 = __69__CCUIConnectivityBluetoothViewControllerAccessibility_buttonTapped___block_invoke;
  v34 = &unk_2501D43D8;
  v35 = self;
  v36 = &v37;
  AXPerformSafeBlock();
  v10 = *((_DWORD *)v38 + 6);
  _Block_object_dispose(&v37, 8);
  if (UIAccessibilityIsSwitchControlRunning() || v6)
  {
    if (v10 != 3)
    {
LABEL_9:
      v25.receiver = self;
      v25.super_class = (Class)CCUIConnectivityBluetoothViewControllerAccessibility;
      -[CCUIConnectivityBluetoothViewControllerAccessibility buttonTapped:](&v25, sel_buttonTapped_, v4);
      goto LABEL_16;
    }
  }
  else
  {
    if (v10 == 3)
      v11 = v8;
    else
      v11 = 0;
    if ((v11 & 1) == 0)
      goto LABEL_9;
  }
  LOBYTE(v37) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v12 = objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v37)
    abort();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x24BDF67F0];
  accessibilityLocalizedString(CFSTR("control.center.bluetooth.disable.alert.title"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("control.center.bluetooth.devices.disconnect.message"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF67E8];
  accessibilityLocalizedString(CFSTR("control.center.alert.cancel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __69__CCUIConnectivityBluetoothViewControllerAccessibility_buttonTapped___block_invoke_2;
  v29[3] = &unk_2501D4388;
  v30 = v13;
  v20 = v13;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDF67E8];
  accessibilityLocalizedString(CFSTR("control.center.bluetooth.alert.confirm"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __69__CCUIConnectivityBluetoothViewControllerAccessibility_buttonTapped___block_invoke_3;
  v26[3] = &unk_2501D43B0;
  v27 = v4;
  v28 = self;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 0, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAction:", v21);
  objc_msgSend(v17, "addAction:", v24);
  objc_msgSend(v17, "setPreferredAction:", v21);
  objc_msgSend(v20, "presentViewController:animated:completion:", v17, 1, 0);

LABEL_16:
}

uint64_t __69__CCUIConnectivityBluetoothViewControllerAccessibility_buttonTapped___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_stateWithOverridesApplied:", objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntForKey:", CFSTR("_currentState")));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __69__CCUIConnectivityBluetoothViewControllerAccessibility_buttonTapped___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

id __69__CCUIConnectivityBluetoothViewControllerAccessibility_buttonTapped___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)CCUIConnectivityBluetoothViewControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_buttonTapped_, v1);
}

@end
