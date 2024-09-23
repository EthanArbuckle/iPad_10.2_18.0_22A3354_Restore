@implementation VideosUI_UnifiedOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.UnifiedOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("selectionView"), "Optional<VUIImageView>");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("accessibilityTextLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("accessibilitySubtitleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("accessibilityAppImageView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("accessibilityLogoImageView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("accessibilityProgressView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.StyledProgressBarView"), CFSTR("accessibilityProgress"), "d");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("accessibilityBadgeView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("accessibilityTextBadge"), "@");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("scorecardView"), "Optional<_UIHostingView<ScoreboardImageWrapper>>");
  objc_msgSend(v3, "validateClass:", CFSTR("VUIScorecardView"));

}

- (id)_axScorecard
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_opt_class();
  -[VideosUI_UnifiedOverlayViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("scorecardView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[VideosUI_UnifiedOverlayViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x2349244BC](CFSTR("VUIScorecardView")));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  -[VideosUI_UnifiedOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_UnifiedOverlayViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityAppImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_UnifiedOverlayViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityLogoImageView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_UnifiedOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityProgressView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeCGFloatForKey:", CFSTR("accessibilityProgress"));
  v6 = v5;

  if (fabs(v6) < 0.000001)
  {
    v10 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("content.percentage.complete"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[VideosUI_UnifiedOverlayViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityBadgeView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_UnifiedOverlayViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityTextBadge"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_UnifiedOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTextLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityExpandTVEpisodeNumber(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "accessibilityLabel");
  v23 = v3;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_UnifiedOverlayViewAccessibility _axScorecard](self, "_axScorecard");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessibilityLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  -[VideosUI_UnifiedOverlayViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("selectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("content.selected"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VideosUI_UnifiedOverlayViewAccessibility;
    -[VideosUI_UnifiedOverlayViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
