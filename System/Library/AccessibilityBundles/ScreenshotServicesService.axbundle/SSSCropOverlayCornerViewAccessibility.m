@implementation SSSCropOverlayCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSSCropOverlayCornerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSCropOverlayCornerView"), CFSTR("_corner"), "Q");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v2;

  v2 = -[SSSCropOverlayCornerViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_corner")) - 1;
  if (v2 > 7 || ((0x8Bu >> v2) & 1) == 0)
    return 0;
  accessibilityLocalizedString(off_25033B678[v2]);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
