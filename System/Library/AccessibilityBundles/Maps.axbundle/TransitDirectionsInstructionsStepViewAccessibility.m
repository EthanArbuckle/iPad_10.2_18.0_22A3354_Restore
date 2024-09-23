@implementation TransitDirectionsInstructionsStepViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TransitDirectionsInstructionsStepView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TransitDirectionsInstructionsStepView"), CFSTR("_detailButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TransitDirectionsInstructionsStepView"), CFSTR("_primaryLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TransitDirectionsInstructionsStepView"), CFSTR("_secondaryLabel"), "MKMultiPartLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TransitDirectionsInstructionsStepView"), CFSTR("_primaryAccessoryLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TransitDirectionsInstructionsStepView"), CFSTR("_secondaryAccessoryLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TransitDirectionsInstructionsStepView"), CFSTR("_tertiaryLabel"), "MKMultiPartLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TransitDirectionsInstructionsStepView"), CFSTR("_platformArtworkImageView"), "MKArtworkImageView");

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[TransitDirectionsInstructionsStepViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)accessibilityLabel
{
  return (id)-[TransitDirectionsInstructionsStepViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_primaryLabel, _secondaryLabel, _primaryAccessoryLabel, _secondaryAccessoryLabel, _tertiaryLabel, _platformArtworkImageView"));
}

@end
