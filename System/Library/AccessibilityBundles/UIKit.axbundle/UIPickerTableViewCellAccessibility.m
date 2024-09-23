@implementation UIPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPickerTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
