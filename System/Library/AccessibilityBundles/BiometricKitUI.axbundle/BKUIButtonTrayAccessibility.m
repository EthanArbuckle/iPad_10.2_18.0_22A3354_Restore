@implementation BKUIButtonTrayAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIButtonTray");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIButtonTray"), CFSTR("_nextStateButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIButtonTray"), CFSTR("_bottomLinkButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIButtonTray"), CFSTR("initWithFrame:willUseActionDelegate:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "B", 0);

}

- (BKUIButtonTrayAccessibility)initWithFrame:(CGRect)a3 willUseActionDelegate:(BOOL)a4
{
  BKUIButtonTrayAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKUIButtonTrayAccessibility;
  v4 = -[BKUIButtonTrayAccessibility initWithFrame:willUseActionDelegate:](&v6, sel_initWithFrame_willUseActionDelegate_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BKUIButtonTrayAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)BKUIButtonTrayAccessibility;
  -[BKUIButtonTrayAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(&unk_250195FD8, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(&unk_250195FD8);
        -[BKUIButtonTrayAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, v7);
        v8[0] = v5;
        v8[1] = 3221225472;
        v8[2] = __73__BKUIButtonTrayAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v8[3] = &unk_250193BB8;
        objc_copyWeak(&v9, &location);
        objc_msgSend(v7, "_setIsAccessibilityElementBlock:", v8);
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(&unk_250195FD8, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v3);
  }
}

BOOL __73__BKUIButtonTrayAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  double v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "alpha");
  if (v3 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

  }
  return v6;
}

@end
