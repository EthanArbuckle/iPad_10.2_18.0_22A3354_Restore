@implementation SocialProfilesAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.SocialProfilesAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.PromotionalImageryView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_isTransparentFocusRegion"), "B", 0);

}

- (BOOL)_isTransparentFocusRegion
{
  objc_super v4;

  if ((-[SocialProfilesAccessoryViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 1;
  v4.receiver = self;
  v4.super_class = (Class)SocialProfilesAccessoryViewAccessibility;
  return -[SocialProfilesAccessoryViewAccessibility _isTransparentFocusRegion](&v4, sel__isTransparentFocusRegion);
}

@end
