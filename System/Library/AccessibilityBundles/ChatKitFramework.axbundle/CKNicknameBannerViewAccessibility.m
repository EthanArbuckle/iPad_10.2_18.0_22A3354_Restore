@implementation CKNicknameBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNicknameBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("CKNicknameBannerView"));
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
