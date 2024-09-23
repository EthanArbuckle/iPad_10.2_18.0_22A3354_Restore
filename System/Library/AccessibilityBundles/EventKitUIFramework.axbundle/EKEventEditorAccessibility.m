@implementation EKEventEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventEditor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventEditor"), CFSTR("_dateItem"), "EKEventDateEditItem");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventEditorAccessibility;
  -[EKEventEditorAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[EKEventEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");
}

@end
