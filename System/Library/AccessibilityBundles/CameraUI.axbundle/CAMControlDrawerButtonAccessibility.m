@implementation CAMControlDrawerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMControlDrawerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CAMControlDrawerButton"), CFSTR("UIControl"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
