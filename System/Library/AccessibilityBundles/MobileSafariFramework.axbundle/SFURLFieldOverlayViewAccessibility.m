@implementation SFURLFieldOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFURLFieldOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFURLFieldOverlayView"), CFSTR("_buttons"), "NSArray");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)SFURLFieldOverlayViewAccessibility;
  -[SFURLFieldOverlayViewAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SFURLFieldOverlayViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_buttons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        LOBYTE(location) = 0;
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_BYTE)location)
          abort();
        v9 = v8;
        objc_initWeak(&location, v8);
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __80__SFURLFieldOverlayViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v10[3] = &unk_2502968B8;
        objc_copyWeak(&v11, &location);
        objc_msgSend(v9, "setAccessibilityTraitsBlock:", v10);
        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v4);
  }

}

uint64_t __80__SFURLFieldOverlayViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;

  v1 = *MEMORY[0x24BDF73B0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alphaComponent");
  v6 = v5;

  v7 = *MEMORY[0x24BDF73E8];
  if (v6 >= 0.1)
    v7 = 0;
  return v7 | v1;
}

@end
