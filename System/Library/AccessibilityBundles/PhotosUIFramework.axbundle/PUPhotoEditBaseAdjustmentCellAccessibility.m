@implementation PUPhotoEditBaseAdjustmentCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoEditBaseAdjustmentCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditBaseAdjustmentCell"), CFSTR("maxValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditBaseAdjustmentCell"), CFSTR("minValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditBaseAdjustmentCell"), CFSTR("value"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditBaseAdjustmentCell"), CFSTR("identityValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditBaseAdjustmentCell"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUPhotoEditBaseAdjustmentCell"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_isEligibleForFocusInteraction"), "B", 0);

}

- (id)accessibilityLabel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[PUPhotoEditBaseAdjustmentCellAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("maxValue"));
  v4 = v3;
  -[PUPhotoEditBaseAdjustmentCellAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("minValue"));
  v6 = v5;
  -[PUPhotoEditBaseAdjustmentCellAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  v8 = v7;
  -[PUPhotoEditBaseAdjustmentCellAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("identityValue"));
  AXScaledSliderValues(v8, v6, v4, v9);
  return (id)AXFormatFloatWithPercentage();
}

- (id)accessibilityValue
{
  if ((-[PUPhotoEditBaseAdjustmentCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled")) & 1) != 0)
    return 0;
  accessibilityPULocalizedString(CFSTR("adjustments.tool.off"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isEligibleForFocusInteraction
{
  objc_super v4;

  if ((-[PUPhotoEditBaseAdjustmentCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditBaseAdjustmentCellAccessibility;
  return -[PUPhotoEditBaseAdjustmentCellAccessibility _isEligibleForFocusInteraction](&v4, sel__isEligibleForFocusInteraction);
}

@end
