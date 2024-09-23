@implementation PlayerProfileHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.PlayerProfileHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.PlayerProfileHeaderView"), CFSTR("accessibilityFriendStatusLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.PlayerProfileHeaderView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PlayerProfileHeaderViewAccessibility;
  -[PlayerProfileHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PlayerProfileHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityFriendStatusLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_7);

}

id __82__PlayerProfileHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return AXGameCenterUIFrameworkLocString(CFSTR("FRIEND"));
}

- (PlayerProfileHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  PlayerProfileHeaderViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PlayerProfileHeaderViewAccessibility;
  v3 = -[PlayerProfileHeaderViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PlayerProfileHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
