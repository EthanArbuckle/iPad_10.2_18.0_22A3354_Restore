@implementation CCUIMenuModuleStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIMenuModuleStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
