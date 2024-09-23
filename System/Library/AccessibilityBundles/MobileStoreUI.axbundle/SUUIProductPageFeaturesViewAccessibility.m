@implementation SUUIProductPageFeaturesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIProductPageFeaturesView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageFeaturesView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageFeaturesView"), CFSTR("_featureViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageFeaturesView"), CFSTR("_titleLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  SUUIProductPageFeaturesViewAccessibility *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[SUUIProductPageFeaturesViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageFeaturesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
    v14 = v4;
    objc_msgSend(v3, "axSafelyAddObject:", v4);
    v15 = self;
    -[SUUIProductPageFeaturesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_featureViews"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "safeValueForKey:", CFSTR("title"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "safeValueForKey:", CFSTR("subtitle"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setIsAccessibilityElement:", 1, v11, CFSTR("__AXStringForVariablesSentinel"));
          objc_msgSend(v9, "setAccessibilityLabel:", v12);
          objc_msgSend(v3, "addObject:", v9);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }
    -[SUUIProductPageFeaturesViewAccessibility _accessibilitySetRetainedValue:forKey:](v15, "_accessibilitySetRetainedValue:forKey:", v3, *MEMORY[0x24BEBB308]);

  }
  return v3;
}

@end
