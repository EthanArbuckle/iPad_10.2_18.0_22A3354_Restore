@implementation BuddyAppleIDServiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyAppleIDServiceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyAppleIDServiceView"), CFSTR("label"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[BuddyAppleIDServiceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
