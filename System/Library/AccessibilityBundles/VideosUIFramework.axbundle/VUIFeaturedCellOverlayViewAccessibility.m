@implementation VUIFeaturedCellOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIFeaturedCellOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIFeaturedCellOverlayView"), CFSTR("appleTVChannelLogoView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIFeaturedCellOverlayView"), CFSTR("titleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIFeaturedCellOverlayView"), CFSTR("subtitleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIFeaturedCellOverlayView"), CFSTR("buttons"), "@");

}

- (BOOL)isAccessibilityElement
{
  return -[VUIFeaturedCellOverlayViewAccessibility _accessibilityIsFocusForHoverTextRunningForFocusItem](self, "_accessibilityIsFocusForHoverTextRunningForFocusItem") ^ 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[VUIFeaturedCellOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("appleTVChannelLogoView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFeaturedCellOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFeaturedCellOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXLabelForElements();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[VUIFeaturedCellOverlayViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("buttons"));
}

@end
