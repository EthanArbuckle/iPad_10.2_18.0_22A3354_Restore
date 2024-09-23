@implementation HPSBatteryStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HPSBatteryStatusView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSBatteryStatusView"), CFSTR("untethered"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSBatteryStatusView"), CFSTR("leftImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSBatteryStatusView"), CFSTR("rightImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSBatteryStatusView"), CFSTR("caseImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSBatteryStatusView"), CFSTR("deviceImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSBatteryStatusView"), CFSTR("currentDevice"), "<BluetoothDeviceProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BTSDevice"), CFSTR("classicDevice"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HPSBatteryStatusView"), CFSTR("setupViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BTSDevice"), CFSTR("name"), "@", 0);

}

- ($FFD8FFF7A5D2C2666551BEB14716E99F)_accessibilityBatteryStatus
{
  void *v4;
  void *v5;
  void *v6;
  $FFD8FFF7A5D2C2666551BEB14716E99F *result;

  *(_QWORD *)&retstr->var8 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  -[HPSBatteryStatusViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("classicDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsProtocol();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "batteryStatus:", retstr);
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;
  void *v34;
  _QWORD v35[5];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)HPSBatteryStatusViewAccessibility;
  -[HPSBatteryStatusViewAccessibility _accessibilityLoadAccessibilityInformation](&v33, sel__accessibilityLoadAccessibilityInformation);
  if (-[HPSBatteryStatusViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("untethered")))
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    accessibilityLocalizedString(CFSTR("Left Earbud"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v4);

    v5 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v30[3] = &unk_25021E998;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v3, "_setAccessibilityValueBlock:", v30);
    v28[0] = v5;
    v28[1] = 3221225472;
    v28[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v28[3] = &unk_25021E9E8;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v3, "_setAccessibilityFrameBlock:", v28);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    accessibilityLocalizedString(CFSTR("Right Earbud"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v7);

    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
    v26[3] = &unk_25021E998;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v6, "_setAccessibilityValueBlock:", v26);
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v24[3] = &unk_25021E9E8;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v6, "_setAccessibilityFrameBlock:", v24);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    accessibilityLocalizedString(CFSTR("Case"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v9);

    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
    v22[3] = &unk_25021E998;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v8, "_setAccessibilityValueBlock:", v22);
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
    v20[3] = &unk_25021E9E8;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v8, "_setAccessibilityFrameBlock:", v20);
    v35[0] = v3;
    v35[1] = v6;
    v35[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryStatusViewAccessibility setAccessibilityElements:](self, "setAccessibilityElements:", v10);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_initWeak(&location, self);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    -[HPSBatteryStatusViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentDevice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityLabel:", v13);

    v14 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
    v18[3] = &unk_25021E998;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v11, "_setAccessibilityValueBlock:", v18);
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
    v16[3] = &unk_25021E9E8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v11, "_setAccessibilityFrameBlock:", v16);
    v34 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryStatusViewAccessibility setAccessibilityElements:](self, "setAccessibilityElements:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
}

id __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_accessibilityBatteryStatus", (unsigned __int128)0, (unsigned __int128)0, 0);

  AXFormatFloatWithPercentage();
  return (id)objc_claimAutoreleasedReturnValue();
}

double __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("leftImageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;

  return v4;
}

id __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_accessibilityBatteryStatus", (unsigned __int128)0, (unsigned __int128)0, 0);

  AXFormatFloatWithPercentage();
  return (id)objc_claimAutoreleasedReturnValue();
}

double __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("rightImageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;

  return v4;
}

id __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  __int128 v5;

  v5 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_accessibilityBatteryStatus", (unsigned __int128)0, 0);
  else
    v5 = 0u;

  if (BYTE8(v5))
  {
    AXFormatFloatWithPercentage();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

double __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("caseImageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;

  return v4;
}

id __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_accessibilityBatteryStatus", (unsigned __int128)0, (unsigned __int128)0, 0);

  AXFormatFloatWithPercentage();
  return (id)objc_claimAutoreleasedReturnValue();
}

double __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("deviceImageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;

  return v4;
}

- (void)setupViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HPSBatteryStatusViewAccessibility;
  -[HPSBatteryStatusViewAccessibility setupViews](&v3, sel_setupViews);
  -[HPSBatteryStatusViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
