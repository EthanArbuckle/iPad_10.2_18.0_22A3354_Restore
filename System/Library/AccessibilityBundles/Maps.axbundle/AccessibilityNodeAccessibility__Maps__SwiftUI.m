@implementation AccessibilityNodeAccessibility__Maps__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.AccessibilityNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  char v4;
  double v5;
  double v6;
  objc_super v7;
  CGPoint result;

  -[AccessibilityNodeAccessibility__Maps__SwiftUI accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PlaceSummaryAccessoryViewImageView-PlaceSummaryTitleLabel-PlaceSummaryLabel-PlaceSummaryLabel-UserGeneratedGuideButton-PlaceSummaryActionButtonsGrid"));

  v5 = 5.0;
  v6 = 5.0;
  if ((v4 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility__Maps__SwiftUI;
    -[AccessibilityNodeAccessibility__Maps__SwiftUI accessibilityActivationPoint](&v7, sel_accessibilityActivationPoint, 5.0, 5.0);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

@end
