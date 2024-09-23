@implementation SBFLockScreenDateSubtitleDateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFLockScreenDateSubtitleDateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFLockScreenDateSubtitleDateView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBFLockScreenDateSubtitleDateView"), CFSTR("string"), "@");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFLockScreenDateView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFLockScreenDateSubtitleDateView"), CFSTR("alternateDateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFLockScreenAlternateDateLabel"), CFSTR("label"), "@", 0);

}

- (BOOL)_accessibilityViewIsVisible
{
  void *v3;
  double v4;
  double v5;
  objc_super v7;
  char v8;

  v8 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (v5 > 0.0)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)SBFLockScreenDateSubtitleDateViewAccessibility;
  return -[SBFLockScreenDateSubtitleDateViewAccessibility _accessibilityViewIsVisible](&v7, sel__accessibilityViewIsVisible);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  -[SBFLockScreenDateSubtitleDateViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("string"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateSubtitleDateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alternateDateLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBFLockScreenDateSubtitleDateViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("alternateDateLabel.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3)
    {
      v8 = v3;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)SBFLockScreenDateSubtitleDateViewAccessibility;
      -[SBFLockScreenDateSubtitleDateViewAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v8;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7410];
}

- (CGRect)accessibilityFrame
{
  void *v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v14;
  CGRect result;

  -[SBFLockScreenDateSubtitleDateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alternateDateLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE29F60], "frameForElements:", 2);
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x24BE29F60], "frameForElements:", 2);
    v14.origin.x = v9;
    v14.size.width = v11;
    v14.size.height = v13;
    *(CGRect *)&v3 = CGRectInset(v14, -50.0, -5.0);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_accessibilityParentView
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[SBFLockScreenDateSubtitleDateViewAccessibility accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (NSClassFromString(CFSTR("SBFLockScreenDateView")), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFLockScreenDateSubtitleDateViewAccessibility;
    -[SBFLockScreenDateSubtitleDateViewAccessibility _accessibilityParentView](&v7, sel__accessibilityParentView);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
