@implementation AVTouchIgnoringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTouchIgnoringView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityObscuresScreen
{
  return 0;
}

@end
