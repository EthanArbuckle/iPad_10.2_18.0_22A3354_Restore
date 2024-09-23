@implementation VehicleColorPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VehicleColorPicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VehicleColorPicker"), CFSTR("colors"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VehicleColorPickerAccessibility;
  -[VehicleColorPickerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  block[3] = &unk_250258E30;
  block[4] = self;
  if (_accessibilityLoadAccessibilityInformation_onceToken != -1)
    dispatch_once(&_accessibilityLoadAccessibilityInformation_onceToken, block);
}

void __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeArrayForKey:", CFSTR("colors"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 12)
  {
    AXLogAppAccessibility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_cold_2(v4);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          AXMapsStringForVehicleColor(v10);
          v11 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v2, "containsObject:", v11))
          {
            AXLogAppAccessibility();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
              __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_cold_1((uint64_t)v11, v14);

            goto LABEL_21;
          }
          objc_msgSend(v2, "addObject:", v11);
        }
        else
        {
          AXLogAppAccessibility();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v20 = v10;
            v21 = 2112;
            v22 = v13;
            _os_log_fault_impl(&dword_232703000, v11, OS_LOG_TYPE_FAULT, "Unexpected format for vehicle colors array. Found %@ of type %@.", buf, 0x16u);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_21:

}

void __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_232703000, a2, OS_LOG_TYPE_FAULT, "Found two vehicle colors with the same description: %@", (uint8_t *)&v2, 0xCu);
}

void __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_232703000, log, OS_LOG_TYPE_FAULT, "Expected 12 vehicle colors.", v1, 2u);
}

@end
