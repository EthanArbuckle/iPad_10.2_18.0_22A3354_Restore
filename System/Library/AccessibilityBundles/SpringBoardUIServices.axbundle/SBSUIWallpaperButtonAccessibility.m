@implementation SBSUIWallpaperButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSUIWallpaperButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SBSUIWallpaperButton"), CFSTR("UIView"));
}

- (id)_viewToAddFocusLayer
{
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
