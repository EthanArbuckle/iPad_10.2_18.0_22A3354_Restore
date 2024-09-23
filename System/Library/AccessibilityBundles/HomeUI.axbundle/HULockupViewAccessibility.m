@implementation HULockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HULockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULockupView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULockupView"), CFSTR("downloadControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDownloadControl"), CFSTR("controlStatus"), "{HUDownloadControlStatus=qd}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HULockupViewAccessibility *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HULockupViewAccessibility;
  -[HULockupViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[HULockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(location) = 0;
  objc_opt_class();
  -[HULockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("downloadControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v5);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HULockupViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_250234A60;
  objc_copyWeak(&v10, &location);
  v6 = v3;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "setAccessibilityLabelBlock:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

id __71__HULockupViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = objc_msgSend(WeakRetained, "controlStatus");

  if ((unint64_t)(v3 - 3) > 1)
  {
    v9.receiver = a1[5];
    v9.super_class = (Class)HULockupViewAccessibility;
    objc_msgSendSuper2(&v9, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityHomeLocalizedString(CFSTR("item.updating"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

@end
