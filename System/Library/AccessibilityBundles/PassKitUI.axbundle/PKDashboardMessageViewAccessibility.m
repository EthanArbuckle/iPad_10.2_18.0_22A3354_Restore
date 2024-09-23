@implementation PKDashboardMessageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKDashboardMessageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardMessageView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardMessageView"), CFSTR("message"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardMessageView"), CFSTR("dismissButtonPressed:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PKDashboardMessageViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("title, message"));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKDashboardMessageViewAccessibility;
  -[PKDashboardMessageViewAccessibility accessibilityCustomActions](&v9, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("dismiss.message"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__axDismiss_);
  objc_msgSend(v4, "addObject:", v7);

  return v4;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(CFSTR("message.role"));
}

- (BOOL)_axDismiss:(id)a3
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __50__PKDashboardMessageViewAccessibility__axDismiss___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissButtonPressed:", 0);
}

@end
