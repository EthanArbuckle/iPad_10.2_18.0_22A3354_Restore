@implementation SPUISearchBarWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SPUISearchBarWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SPUISearchBarWindowAccessibility)init
{
  SPUISearchBarWindowAccessibility *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUISearchBarWindowAccessibility;
  v2 = -[SPUISearchBarWindowAccessibility init](&v4, sel_init);
  -[SPUISearchBarWindowAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPUISearchBarWindowAccessibility;
  -[SPUISearchBarWindowAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_250364B00;
  v5[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_189;
  v4[3] = &unk_250364B28;
  objc_msgSend(v3, "registerSpringBoardActionHandler:withIdentifierCallback:", v5, v4);

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 == 14)
  {
    AXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2329FF000, v6, OS_LOG_TYPE_INFO, "Spotlight visible change: %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isVisible"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilitySetBoolValue:forKey:", objc_msgSend(v8, "BOOLValue"), CFSTR("isSpotlightVisible"));

  }
}

void __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_189(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AXLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2329FF000, v4, OS_LOG_TYPE_INFO, "Spotlight register: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("actionHandlerIdentifier"));
}

void __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_193(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilitySetBoolValue:forKey:", objc_msgSend(v2, "isSpotlightVisible"), CFSTR("isSpotlightVisible"));

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchBarWindowAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("actionHandlerIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeActionHandler:", v4);

  v5.receiver = self;
  v5.super_class = (Class)SPUISearchBarWindowAccessibility;
  -[SPUISearchBarWindowAccessibility dealloc](&v5, sel_dealloc);
}

- (BOOL)_accessibilityIgnoresStatusBarFrame
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  char v3;
  NSObject *v4;
  objc_super v6;

  v3 = -[SPUISearchBarWindowAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("isSpotlightVisible"));
  AXLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SPUISearchBarWindowAccessibility accessibilityElementsHidden].cold.1(v3, v4);

  if ((v3 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)SPUISearchBarWindowAccessibility;
  return -[SPUISearchBarWindowAccessibility accessibilityElementsHidden](&v6, sel_accessibilityElementsHidden);
}

- (void)accessibilityElementsHidden
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_2329FF000, a2, OS_LOG_TYPE_DEBUG, "Spotlight visible status: %d", (uint8_t *)v2, 8u);
}

@end
