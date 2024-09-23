@implementation ScrollablePillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.ScrollablePillView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.ScrollablePillView"), CFSTR("linkLabel"), "DynamicLabel");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ScrollablePillViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ScrollablePillViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ScrollablePillViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("linkLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end
