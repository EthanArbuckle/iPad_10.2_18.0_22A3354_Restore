@implementation UIWebSelectSinglePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebSelectSinglePicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

@end
