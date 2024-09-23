@implementation SSSScreenshotsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSSScreenshotsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSSScreenshotsView"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSSScreenshotsView"), CFSTR("numberOfScreenshotImages"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSSScreenshotsView"), CFSTR("currentScreenshotView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSScreenshotView"), CFSTR("_imageCropController"), "SSSCropController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSCropControllerRootView"), CFSTR("_overlayView"), "SSSCropOverlayView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSCropController"), CFSTR("_rootView"), "SSSCropControllerRootView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSCropOverlayView"), CFSTR("_grabberViews"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSCropOverlayView"), CFSTR("_cornerViews"), "NSArray");

}

- (BOOL)isAccessibilityElement
{
  return -[SSSScreenshotsViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("state")) == 0;
}

- (id)accessibilityIdentifier
{
  return CFSTR("SSSScreenshotsView");
}

- (id)accessibilityLabel
{
  if (-[SSSScreenshotsViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("numberOfScreenshotImages")) == 1)return accessibilityLocalizedString(CFSTR("screenshot.title"));
  else
    return accessibilityLocalizedString(CFSTR("screenshots.title"));
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("screenshot.hint"));
}

- (unint64_t)accessibilityTraits
{
  _BOOL4 v2;
  unint64_t *v3;

  v2 = -[SSSScreenshotsViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v3 = (unint64_t *)MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = (unint64_t *)MEMORY[0x24BDF73E0];
  return *v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[SSSScreenshotsViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    -[SSSScreenshotsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentScreenshotView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_imageCropController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_rootView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("_overlayView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeArrayForKey:", CFSTR("_grabberViews"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("_overlayView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeArrayForKey:", CFSTR("_cornerViews"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "axSafelyAddObjectsFromArray:", v7);
    objc_msgSend(v10, "axSafelyAddObjectsFromArray:", v9);
    objc_msgSend(v10, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
