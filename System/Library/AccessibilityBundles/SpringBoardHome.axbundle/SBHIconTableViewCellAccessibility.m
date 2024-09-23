@implementation SBHIconTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHIconTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconTableViewCell"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconTableViewCell"), CFSTR("iconNameLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SBHIconTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  return (id)-[SBHIconTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("iconNameLabel"));
}

- (id)accessibilityDragSourceDescriptors
{
  void *v2;
  void *v3;

  -[SBHIconTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDragSourceDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
