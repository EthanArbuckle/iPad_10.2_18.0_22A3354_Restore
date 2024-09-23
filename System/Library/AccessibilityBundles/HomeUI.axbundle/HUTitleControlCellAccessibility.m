@implementation HUTitleControlCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUTitleControlCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTitleControlCell"), CFSTR("controlView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTitleControlCell"), CFSTR("controlTitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUTitleControlCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("controlTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HUTitleControlCellAccessibility _axControlElement](self, "_axControlElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

  -[HUTitleControlCellAccessibility _axControlElement](self, "_axControlElement");
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

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[HUTitleControlCellAccessibility _axControlElement](self, "_axControlElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)_axControlElement
{
  void *v2;
  void *v3;

  -[HUTitleControlCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("controlView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __52__HUTitleControlCellAccessibility__axControlElement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

@end
