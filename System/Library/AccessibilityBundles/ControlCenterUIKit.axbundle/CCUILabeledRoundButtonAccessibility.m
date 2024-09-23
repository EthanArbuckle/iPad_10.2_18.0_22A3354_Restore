@implementation CCUILabeledRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUILabeledRoundButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButton"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButton"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButton"), CFSTR("buttonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButton"), CFSTR("initWithGlyphImage:highlightColor:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButton"), CFSTR("labelsVisible"), "B", 0);

}

- (BOOL)_axLabelsVisible
{
  return -[CCUILabeledRoundButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("labelsVisible"));
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[CCUILabeledRoundButtonAccessibility _axLabelsVisible](self, "_axLabelsVisible"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CCUILabeledRoundButtonAccessibility;
  return -[CCUILabeledRoundButtonAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[CCUILabeledRoundButtonAccessibility _axLabelsVisible](self, "_axLabelsVisible"))
  {
    -[CCUILabeledRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    -[CCUILabeledRoundButtonAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[CCUILabeledRoundButtonAccessibility _axLabelsVisible](self, "_axLabelsVisible"))
  {
    -[CCUILabeledRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityHint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    -[CCUILabeledRoundButtonAccessibility accessibilityHint](&v6, sel_accessibilityHint);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[CCUILabeledRoundButtonAccessibility _axLabelsVisible](self, "_axLabelsVisible"))
  {
    -[CCUILabeledRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    -[CCUILabeledRoundButtonAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;
  objc_super v6;

  if (-[CCUILabeledRoundButtonAccessibility _axLabelsVisible](self, "_axLabelsVisible"))
  {
    -[CCUILabeledRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "accessibilityTraits");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    return -[CCUILabeledRoundButtonAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[CCUILabeledRoundButtonAccessibility _axLabelsVisible](self, "_axLabelsVisible"))
  {
    -[CCUILabeledRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityActivationPoint");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    -[CCUILabeledRoundButtonAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUILabeledRoundButtonAccessibility;
  -[CCUILabeledRoundButtonAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CCUILabeledRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[CCUILabeledRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (CCUILabeledRoundButtonAccessibility)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  CCUILabeledRoundButtonAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
  v4 = -[CCUILabeledRoundButtonAccessibility initWithGlyphImage:highlightColor:](&v6, sel_initWithGlyphImage_highlightColor_, a3, a4);
  -[CCUILabeledRoundButtonAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
