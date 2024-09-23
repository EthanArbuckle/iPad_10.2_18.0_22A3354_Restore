@implementation SBBannerWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBBannerWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBBannerWindow"), CFSTR("_keyWindowStack"), "_SBFKeyWindowStack");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SBFKeyWindowStack"), CFSTR("_expectedKeyWindow"), "SBFWindow");
  objc_msgSend(v3, "validateClass:", CFSTR("SBTransientOverlayWindow"));

}

- (BOOL)accessibilityViewIsModal
{
  void *v2;
  void *v3;
  char isKindOfClass;

  -[SBBannerWindowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_keyWindowStack"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_expectedKeyWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBTransientOverlayWindow"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
