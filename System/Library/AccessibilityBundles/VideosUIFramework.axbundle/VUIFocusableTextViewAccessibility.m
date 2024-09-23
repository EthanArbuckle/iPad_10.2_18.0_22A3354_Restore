@implementation VUIFocusableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIFocusableTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VUIFocusableTextView"), CFSTR("TVFocusableTextView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("TVFocusableTextView"), CFSTR("moreLabel"), "@");

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

  if (-[VUIFocusableTextViewAccessibility _accessibilityIsMoreLabelVisible](self, "_accessibilityIsMoreLabelVisible"))
  {
    -[VUIFocusableTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("moreLabel"));
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
    v10.super_class = (Class)VUIFocusableTextViewAccessibility;
    -[VUIFocusableTextViewAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[VUIFocusableTextViewAccessibility _accessibilityIsMoreLabelVisible](self, "_accessibilityIsMoreLabelVisible"))
  {
    accessibilityLocalizedString(CFSTR("more.label.details.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VUIFocusableTextViewAccessibility;
    -[VUIFocusableTextViewAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_accessibilityIsMoreLabelVisible
{
  void *v3;
  void *v4;
  int v5;

  objc_opt_class();
  -[VUIFocusableTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("moreLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "isHidden") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

@end
