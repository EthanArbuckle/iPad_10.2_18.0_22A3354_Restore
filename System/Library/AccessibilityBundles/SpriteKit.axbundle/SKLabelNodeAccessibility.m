@implementation SKLabelNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKLabelNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKLabelNode"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("alpha"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("isHidden"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  double v4;
  int v5;

  -[SKLabelNodeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length")
    && (-[SKLabelNodeAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("alpha")), v4 > 0.0))
  {
    v5 = -[SKLabelNodeAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isHidden")) ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKLabelNodeAccessibility;
  -[SKLabelNodeAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SKLabelNodeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
