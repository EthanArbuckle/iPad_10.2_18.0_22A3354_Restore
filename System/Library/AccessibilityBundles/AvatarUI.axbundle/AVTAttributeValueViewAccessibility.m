@implementation AVTAttributeValueViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTAttributeValueView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAttributeValueView"), CFSTR("selectionLayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CALayer"), CFSTR("opacity"), "f", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTAttributeValueViewAccessibility;
  -[AVTAttributeValueViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "rangeOfString:", CFSTR("EARRINGS_")))
  {
    accessibilityLocalizedString(v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  float v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTAttributeValueViewAccessibility;
  v3 = -[AVTAttributeValueViewAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  -[AVTAttributeValueViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectionLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeFloatForKey:", CFSTR("opacity"));
  v5 = *MEMORY[0x24BDF7400];
  if (v6 <= 0.0)
    v5 = 0;
  v7 = v5 | v3;

  return v7;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end
