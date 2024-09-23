@implementation HKElectrocardiogramAxisViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKElectrocardiogramAxisView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
