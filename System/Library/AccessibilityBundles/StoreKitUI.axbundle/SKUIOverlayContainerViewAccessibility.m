@implementation SKUIOverlayContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIOverlayContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("SKUIOverlayContainerViewController"));
}

- (id)accessibilityElements
{
  StoreBackstopAccessibilityElement *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SKUIOverlayContainerViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("Backstop"));
  v3 = (StoreBackstopAccessibilityElement *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[StoreBackstopAccessibilityElement initWithAccessibilityContainer:]([StoreBackstopAccessibilityElement alloc], "initWithAccessibilityContainer:", self);
    UIKitAccessibilityLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[StoreBackstopAccessibilityElement setAccessibilityLabel:](v3, "setAccessibilityLabel:", v4);

    UIKitAccessibilityLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[StoreBackstopAccessibilityElement setAccessibilityHint:](v3, "setAccessibilityHint:", v5);

    -[SKUIOverlayContainerViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("Backstop"));
  }
  -[SKUIOverlayContainerViewAccessibility subviews](self, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SKUIOverlayContainerViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("OverlayCaptureView"));

  if (!v4)
    goto LABEL_14;
  v23 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "accessibilityIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("FloatingPreview"));

        if (v16)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v8, "count"))
  {

LABEL_14:
    v18.receiver = self;
    v18.super_class = (Class)SKUIOverlayContainerViewAccessibility;
    -[SKUIOverlayContainerViewAccessibility _accessibilityObscuredScreenAllowedViews](&v18, sel__accessibilityObscuredScreenAllowedViews);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }

  return v8;
}

@end
