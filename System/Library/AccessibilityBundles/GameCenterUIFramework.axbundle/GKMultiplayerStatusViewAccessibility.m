@implementation GKMultiplayerStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.GKMultiplayerStatusView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.GKMultiplayerStatusView"), CFSTR("accessibilityStatusLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[GKMultiplayerStatusViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityStatusLabel"));
}

@end
