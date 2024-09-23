@implementation BCUIAvocadoViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BCUIAvocadoViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BCUIAvocadoViewController"), CFSTR("invalidateBatteryDeviceState"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BCUIAvocadoViewController"), CFSTR("_configureBatteryDeviceView:withBatteryDevice:transitionCoordinator:"), "v", "@", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BCUIAvocadoViewControllerAccessibility;
  -[BCUIAvocadoViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  AXPerformSafeBlock();
}

uint64_t __84__BCUIAvocadoViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateBatteryDeviceState");
}

- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BCUIAvocadoViewControllerAccessibility;
  -[BCUIAvocadoViewControllerAccessibility _configureBatteryDeviceView:withBatteryDevice:transitionCoordinator:](&v22, sel__configureBatteryDeviceView_withBatteryDevice_transitionCoordinator_, v8, v9, v10);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCUIAvocadoViewControllerAccessibility _axLabelForBatteryDevice:](self, "_axLabelForBatteryDevice:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("battery.center.device.percent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "percentCharge");
  AXFormatFloatWithPercentage();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  if (objc_msgSend(v11, "isCharging"))
  {
    accessibilityLocalizedString(CFSTR("battery.center.device.charging"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v11, "isLowBattery"))
  {
    accessibilityLocalizedString(CFSTR("battery.center.low.battery"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  if (objc_msgSend(v11, "isLowPowerModeActive"))
  {
    accessibilityLocalizedString(CFSTR("battery.center.low.power.mode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  __UIAXStringForVariables();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v21, v13, v17, v18, v19, v20, CFSTR("__AXStringForVariablesSentinel"));

  objc_msgSend(v8, "setIsAccessibilityElement:", v11 != 0);
  objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF7410]);

}

- (id)_axLabelForBatteryDevice:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  __CFString **v18;
  void *v20;
  void *v21;
  void *v23;
  id v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "vendor");
  v6 = objc_msgSend(v4, "accessoryCategory");
  v7 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("transportType"));
  if (v5 == 2)
  {
    v16 = CFSTR("battery.center.beats");
  }
  else
  {
    if (v5 != 1)
    {
      v17 = v6 - 1;
      if ((unint64_t)(v6 - 1) < 0xA)
      {
        v18 = off_250190D40;
LABEL_30:
        v16 = v18[v17];
        goto LABEL_32;
      }
LABEL_31:
      v16 = 0;
      goto LABEL_32;
    }
    v8 = v7;
    v9 = objc_msgSend(v4, "productIdentifier");
    v10 = objc_msgSend(v4, "parts");
    if (v8 == 2)
    {
      if (v9 != *MEMORY[0x24BE0BFA0] && v9 != *MEMORY[0x24BE0BFF0])
        goto LABEL_28;
      v16 = CFSTR("battery.center.case");
    }
    else
    {
      if (v8 != 3)
        goto LABEL_28;
      v11 = v10;
      v12 = *MEMORY[0x24BE0BFB8];
      if (v9 != *MEMORY[0x24BE0BF98] && v9 != *MEMORY[0x24BE0BFB0] && v9 != v12)
      {
        if (v9 == *MEMORY[0x24BE0BFA8])
        {
          v16 = CFSTR("battery.center.beats.x");
          goto LABEL_32;
        }
        if (v9 == *MEMORY[0x24BE0BFC0])
        {
          v16 = CFSTR("battery.center.powerbeats");
          goto LABEL_32;
        }
        if (v9 == *MEMORY[0x24BE0BFC8])
        {
          v16 = CFSTR("battery.center.beats.solo");
          goto LABEL_32;
        }
        if (v9 == *MEMORY[0x24BE0BFD0])
        {
          v16 = CFSTR("battery.center.powerbeats.4");
          goto LABEL_32;
        }
        if (v9 == *MEMORY[0x24BE0BFD8])
        {
          v16 = CFSTR("battery.center.beats.solo.pro");
          goto LABEL_32;
        }
        if (v9 == *MEMORY[0x24BE0BFE0])
        {
          v16 = CFSTR("battery.center.beats.studio");
          goto LABEL_32;
        }
        if (v9 == *MEMORY[0x24BE0BFE8])
        {
          -[BCUIAvocadoViewControllerAccessibility _axKeySuffixForParts:](self, "_axKeySuffixForParts:", v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = CFSTR("battery.center.beats.powerbeats.pro");
          v24 = (id)objc_msgSend(CFSTR("battery.center.beats.powerbeats.pro"), "stringByAppendingString:", v23);

          goto LABEL_32;
        }
        if (v9 == *MEMORY[0x24BE0BF90])
        {
          v16 = CFSTR("battery.center.magic.mouse");
          goto LABEL_32;
        }
LABEL_28:
        v17 = v6 - 1;
        if ((unint64_t)(v6 - 1) < 0xA)
        {
          v18 = off_250190CF0;
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      if (v9 == v12)
      {
        objc_msgSend(CFSTR("battery.center.airpods"), "stringByAppendingString:", CFSTR(".pro"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = CFSTR("battery.center.airpods");
      }
      -[BCUIAvocadoViewControllerAccessibility _axKeySuffixForParts:](self, "_axKeySuffixForParts:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v20);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_28;
    }
  }
LABEL_32:
  accessibilityLocalizedString(v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_axKeySuffixForParts:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  unint64_t v5;

  v3 = CFSTR(".left");
  v4 = CFSTR(".case");
  v5 = a3 & 3;
  if ((a3 & 4) == 0)
    v4 = &stru_250190EF0;
  if (v5 == 2)
    v4 = CFSTR(".right");
  if (v5 != 1)
    v3 = v4;
  if (a3)
    return (id)v3;
  else
    return &stru_250190EF0;
}

@end
