@implementation BuddyAccessibilityUtilitiesAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyAccessibilityUtilities");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BuddyAccessibilityUtilities"), CFSTR("navigationBarButton"), "@", 0);
}

+ (id)navigationBarButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___BuddyAccessibilityUtilitiesAccessibility;
  objc_msgSendSuper2(&v5, sel_navigationBarButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("accessibility.button.title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
