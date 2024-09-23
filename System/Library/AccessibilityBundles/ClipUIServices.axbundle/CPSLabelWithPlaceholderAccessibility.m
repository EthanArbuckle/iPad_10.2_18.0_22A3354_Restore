@implementation CPSLabelWithPlaceholderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CPSLabelWithPlaceholder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSLabelWithPlaceholder"), CFSTR("_text"), "NSString");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[CPSLabelWithPlaceholderAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_text"));
}

@end
