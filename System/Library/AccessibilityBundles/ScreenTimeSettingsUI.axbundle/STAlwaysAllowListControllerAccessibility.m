@implementation STAlwaysAllowListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STAlwaysAllowListController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STAlwaysAllowListController"), CFSTR("specifiers"), "@", 0);
}

- (id)specifiers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)STAlwaysAllowListControllerAccessibility;
  -[STAlwaysAllowListControllerAccessibility specifiers](&v13, sel_specifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "accessibilitySetIdentification:", CFSTR("AXAlwaysAllowSpecifierIdentification"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STAlwaysAllowListControllerAccessibility;
  -[STAlwaysAllowListControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v3 = (id)-[STAlwaysAllowListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("specifiers"));
}

@end
