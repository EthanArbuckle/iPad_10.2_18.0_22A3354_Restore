@implementation PXCMMPosterHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCMMPosterHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXCMMPosterHeaderView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXCMMPosterHeaderView"), CFSTR("_subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXCMMPosterHeaderView"), CFSTR("_statusLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  return (id)-[PXCMMPosterHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _subtitleLabel, _statusLabel"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
