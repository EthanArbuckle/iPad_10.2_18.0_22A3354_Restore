@implementation NCNotificationSummarizedSectionListAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationSummarizedSectionList");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSummarizedSectionList"), CFSTR("_collapseSection"), "v", 0);
}

- (void)_collapseSection
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NCNotificationSummarizedSectionListAccessibility;
  -[NCNotificationSummarizedSectionListAccessibility _collapseSection](&v2, sel__collapseSection);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
