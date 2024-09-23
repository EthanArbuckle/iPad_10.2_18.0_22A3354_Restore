@implementation SSSCropOverlayGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSSCropOverlayGrabberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSCropOverlayLineView"), CFSTR("_edge"), "Q");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SSSCropOverlayGrabberView"), CFSTR("SSSCropOverlayLineView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v2;

  v2 = -[SSSCropOverlayGrabberViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_edge")) - 1;
  if (v2 > 7 || ((0x8Bu >> v2) & 1) == 0)
    return 0;
  accessibilityLocalizedString(*(&off_25033B730 + v2));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
