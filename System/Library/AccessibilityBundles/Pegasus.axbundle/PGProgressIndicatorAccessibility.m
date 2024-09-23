@implementation PGProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PGProgressIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGProgressIndicator"), CFSTR("progress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGProgressIndicator"), CFSTR("_elapsedTrack"), "PGVibrantFillView");
  objc_msgSend(v3, "validateClass:", CFSTR("PGMaterialView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGProgressIndicator"), CFSTR("_completeTrack"), "PGVibrantFillView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGProgressIndicatorAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("progress"));
  accessibilityLocalizedString(CFSTR("pip.playback.progress"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  AXFormatFloatWithPercentage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PGProgressIndicatorAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_elapsedTrack"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGRectForKey:", CFSTR("bounds"));

  UIAccessibilityFrameForBounds();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
