@implementation MTPodcastPlaylistSheetHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTPodcastPlaylistSheetHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTPodcastPlaylistSheetHeaderView"), CFSTR("_switch"), "UISwitch");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTPodcastPlaylistSheetHeaderView"), CFSTR("_title"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MTPodcastPlaylistSheetHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_title"));
}

- (id)_axSwitch
{
  return (id)-[MTPodcastPlaylistSheetHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switch"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MTPodcastPlaylistSheetHeaderViewAccessibility _axSwitch](self, "_axSwitch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MTPodcastPlaylistSheetHeaderViewAccessibility _axSwitch](self, "_axSwitch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  void *v2;

  -[MTPodcastPlaylistSheetHeaderViewAccessibility _axSwitch](self, "_axSwitch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityTraits");

  return _AXTraitsRemoveTrait();
}

@end
