@implementation CNContactHeaderDisplayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNContactHeaderDisplayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactHeaderDisplayView"), CFSTR("copy:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNContactHeaderDisplayView"), CFSTR("CNContactHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactHeaderView"), CFSTR("nameLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CNContactHeaderDisplayViewAccessibility;
  -[CNContactHeaderDisplayViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[CNContactHeaderDisplayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
  v4 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("copy.name.action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:target:selector:", v5, self, sel__accessibilityPerformCopyAction_);

  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityCustomActions:", v7);

}

- (BOOL)_accessibilityPerformCopyAction:(id)a3
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __75__CNContactHeaderDisplayViewAccessibility__accessibilityPerformCopyAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "copy:", 0);
}

@end
