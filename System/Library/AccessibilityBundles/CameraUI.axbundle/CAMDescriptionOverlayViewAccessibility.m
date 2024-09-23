@implementation CAMDescriptionOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDescriptionOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_descriptionTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_descriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_infoTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_infoLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_primaryVibrancyEffectView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_acknowledgmentButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_detailButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDescriptionOverlayView"), CFSTR("_isVisible"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if ((-[CAMDescriptionOverlayViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isVisible")) & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CAMDescriptionOverlayViewAccessibility;
  return -[CAMDescriptionOverlayViewAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  return (id)-[CAMDescriptionOverlayViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _descriptionTitleLabel, _descriptionLabel, _infoTitleLabel, _infoLabel"));
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CAMDescriptionOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryVibrancyEffectView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)accessibilityViewIsModal
{
  objc_super v4;

  if ((-[CAMDescriptionOverlayViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isVisible")) & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CAMDescriptionOverlayViewAccessibility;
  return -[CAMDescriptionOverlayViewAccessibility accessibilityViewIsModal](&v4, sel_accessibilityViewIsModal);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMDescriptionOverlayViewAccessibility;
  -[CAMDescriptionOverlayViewAccessibility _accessibilitySupplementaryFooterViews](&v12, sel__accessibilitySupplementaryFooterViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
    v4 = (void *)objc_opt_new();
  -[CAMDescriptionOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_accessibilityViewIsVisible");

  if (v7)
    objc_msgSend(v4, "axSafelyAddObject:", v5);
  -[CAMDescriptionOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_acknowledgmentButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_accessibilityViewIsVisible");

  if (v10)
    objc_msgSend(v4, "axSafelyAddObject:", v8);

  return v4;
}

@end
