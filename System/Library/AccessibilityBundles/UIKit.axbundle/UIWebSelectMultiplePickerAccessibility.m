@implementation UIWebSelectMultiplePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebSelectMultiplePicker");
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
