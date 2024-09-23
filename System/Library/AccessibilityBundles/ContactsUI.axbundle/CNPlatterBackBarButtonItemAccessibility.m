@implementation CNPlatterBackBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPlatterBackBarButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB100];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("back.button"));
}

@end
