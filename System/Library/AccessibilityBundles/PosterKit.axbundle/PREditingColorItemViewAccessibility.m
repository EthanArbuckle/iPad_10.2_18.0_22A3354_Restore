@implementation PREditingColorItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingColorItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingColorItemView"), CFSTR("colorItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingColorItemView"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingColorItem"), CFSTR("displayColor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRPosterColor"), CFSTR("color"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  -[PREditingColorItemViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("localizedName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PREditingColorItemViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("colorItem.displayColor.color"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      AXColorStringForColor();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)PREditingColorItemViewAccessibility;
      -[PREditingColorItemViewAccessibility accessibilityValue](&v9, sel_accessibilityValue);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v7;

  }
  return v5;
}

@end
