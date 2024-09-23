@implementation PKPerformActionEnterValueViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPerformActionEnterValueView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPerformActionEnterValueView"), CFSTR("_currentAmount"), "NSDecimalNumber");
}

@end
