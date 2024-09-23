@implementation CKEntryViewButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKEntryViewButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEntryViewButton"), CFSTR("entryViewButtonType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEntryViewButton"), CFSTR("button"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKEntryViewButtonAccessibility;
  -[CKEntryViewButtonAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[CKEntryViewButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntryViewButtonAccessibility _accessibilityLabel](self, "_accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[CKEntryViewButtonAccessibility _accessibilityHint](self, "_accessibilityHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityHint:", v5);

  objc_initWeak(&location, v3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__CKEntryViewButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_2501B2200;
  objc_copyWeak(&v7, &location);
  -[CKEntryViewButtonAccessibility setAccessibilityTraitsBlock:](self, "setAccessibilityTraitsBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

uint64_t __76__CKEntryViewButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "accessibilityTraits");

  return v2;
}

- (id)_accessibilityLabel
{
  unint64_t v2;
  void *v3;

  v2 = -[CKEntryViewButtonAccessibility _axButtonType](self, "_axButtonType");
  if (v2 > 8)
  {
    v3 = 0;
  }
  else
  {
    accessibilityLocalizedString(off_2501B2220[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilityHint
{
  unint64_t v2;

  v2 = -[CKEntryViewButtonAccessibility _axButtonType](self, "_axButtonType");
  if (v2 > 5 || ((0x2Du >> v2) & 1) == 0)
    return 0;
  accessibilityLocalizedString(off_2501B2268[v2]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityElementHelpForCatalyst
{
  void *v2;

  if (-[CKEntryViewButtonAccessibility _axButtonType](self, "_axButtonType") == 5)
  {
    accessibilityLocalizedString(CFSTR("audio.button.hint.macos"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (int64_t)_axButtonType
{
  return -[CKEntryViewButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("entryViewButtonType"));
}

@end
