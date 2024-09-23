@implementation MFMailboxFilterBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFMailboxFilterBarButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailboxFilterBarButtonItem"), CFSTR("initWithTarget:action:"), "@", "@", ":", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailboxFilterBarButtonItem"), CFSTR("isFilterEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFMailboxFilterBarButtonItem"), CFSTR("UIBarButtonItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIBarButtonItem"), CFSTR("view"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6[2];
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFMailboxFilterBarButtonItemAccessibility;
  -[MFMailboxFilterBarButtonItemAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[MFMailboxFilterBarButtonItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[MFMailboxFilterBarButtonItemAccessibility accessibilityTraits](self, "accessibilityTraits");
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__MFMailboxFilterBarButtonItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_250285BA8;
  objc_copyWeak(v6, &location);
  v6[1] = v4;
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);

}

uint64_t __87__MFMailboxFilterBarButtonItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isFilterEnabled"));

  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return *(_QWORD *)(a1 + 40) | v4;
}

- (MFMailboxFilterBarButtonItemAccessibility)initWithTarget:(id)a3 action:(SEL)a4
{
  MFMailboxFilterBarButtonItemAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilterBarButtonItemAccessibility;
  v4 = -[MFMailboxFilterBarButtonItemAccessibility initWithTarget:action:](&v6, sel_initWithTarget_action_, a3, a4);
  -[MFMailboxFilterBarButtonItemAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

@end
