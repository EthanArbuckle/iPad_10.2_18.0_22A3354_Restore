@implementation TPDialerNumberPadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPDialerNumberPad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsSoftwareKeyboardMimic
{
  return 1;
}

@end
