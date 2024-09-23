@implementation EKEventDetailURLCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventDetailURLCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailURLCell"), CFSTR("_URLView"), "UITextView");
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[EKEventDetailURLCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  return v3;
}

@end
