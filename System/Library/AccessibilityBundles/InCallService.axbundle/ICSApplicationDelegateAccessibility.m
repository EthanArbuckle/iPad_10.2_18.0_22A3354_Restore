@implementation ICSApplicationDelegateAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ICSApplicationDelegate");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ICSApplicationDelegate"), CFSTR("bannerPresentationManager"), "@", 0);
}

@end
