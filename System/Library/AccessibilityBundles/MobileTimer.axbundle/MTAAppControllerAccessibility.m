@implementation MTAAppControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAAppController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTAAppControllerAccessibility;
  -[MTAAppControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

@end
