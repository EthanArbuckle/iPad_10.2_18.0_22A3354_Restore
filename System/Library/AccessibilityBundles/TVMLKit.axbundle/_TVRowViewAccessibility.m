@implementation _TVRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("_TVRowView"), CFSTR("components"), "@");
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
