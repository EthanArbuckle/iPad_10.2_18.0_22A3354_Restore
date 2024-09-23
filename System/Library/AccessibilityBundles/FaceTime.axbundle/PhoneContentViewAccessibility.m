@implementation PhoneContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PhoneContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  objc_super v4;

  if ((-[PhoneContentViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PhoneContentViewAccessibility;
  return -[PhoneContentViewAccessibility accessibilityViewIsModal](&v4, sel_accessibilityViewIsModal);
}

@end
