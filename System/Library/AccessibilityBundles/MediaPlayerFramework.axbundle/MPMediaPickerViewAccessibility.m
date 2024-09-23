@implementation MPMediaPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPMediaPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
