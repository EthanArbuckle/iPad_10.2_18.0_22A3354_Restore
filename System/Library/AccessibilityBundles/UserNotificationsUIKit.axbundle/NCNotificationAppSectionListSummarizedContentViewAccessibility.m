@implementation NCNotificationAppSectionListSummarizedContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationAppSectionListSummarizedContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationAppSectionListSummarizedContentView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationAppSectionListSummarizedContentView"), CFSTR("count"), "Q", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NCNotificationAppSectionListSummarizedContentViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("digest.notification.count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, -[NCNotificationAppSectionListSummarizedContentViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("count")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("notification.cell.collapsed.hint"));
}

@end
