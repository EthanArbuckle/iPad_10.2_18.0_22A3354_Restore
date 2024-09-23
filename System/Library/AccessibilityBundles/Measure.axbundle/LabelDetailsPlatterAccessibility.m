@implementation LabelDetailsPlatterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.LabelDetailsPlatter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Measure.LabelDetailsPlatter"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Measure.LabelDetailsPlatter"), CFSTR("Measure.GenericPlatter"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("setAlpha:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("didMoveToWindow"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.GenericPlatter"), CFSTR("close"), "v", 0);

}

- (void)_axAnnotateCloseButton
{
  void *v2;
  id v3;

  -[LabelDetailsPlatterAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global_0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  accessibilityLocalizedString(CFSTR("CLOSE_BUTTON"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

uint64_t __58__LabelDetailsPlatterAccessibility__axAnnotateCloseButton__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    objc_msgSend(v2, "gestureRecognizers", 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4 = 1;
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_axDidInitializeZeroAlpha
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetDidInitializeZeroAlpha:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LabelDetailsPlatterAccessibility;
  -[LabelDetailsPlatterAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[LabelDetailsPlatterAccessibility _axAnnotateCloseButton](self, "_axAnnotateCloseButton");
  -[LabelDetailsPlatterAccessibility _axSetDidInitializeZeroAlpha:](self, "_axSetDidInitializeZeroAlpha:", 1);
}

- (BOOL)accessibilityViewIsModal
{
  void *v2;
  double v3;
  BOOL v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 >= 1.0;

  return v4;
}

- (BOOL)accessibilityPerformEscape
{
  id v3;
  objc_super v5;

  if (-[LabelDetailsPlatterAccessibility accessibilityViewIsModal](self, "accessibilityViewIsModal"))
  {
    v3 = (id)-[LabelDetailsPlatterAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("close"));
    return 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)LabelDetailsPlatterAccessibility;
    return -[LabelDetailsPlatterAccessibility accessibilityPerformEscape](&v5, sel_accessibilityPerformEscape);
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LabelDetailsPlatterAccessibility;
  -[LabelDetailsPlatterAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[LabelDetailsPlatterAccessibility _axAnnotateCloseButton](self, "_axAnnotateCloseButton");
}

- (void)setAlpha:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  char v10;

  v10 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;
  v9.receiver = self;
  v9.super_class = (Class)LabelDetailsPlatterAccessibility;
  -[LabelDetailsPlatterAccessibility setAlpha:](&v9, sel_setAlpha_, a3);
  objc_msgSend(v5, "alpha");
  if (vabdd_f64(v7, v8) >= 2.22044605e-16)
  {
    if (-[LabelDetailsPlatterAccessibility _axDidInitializeZeroAlpha](self, "_axDidInitializeZeroAlpha"))
      UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
    else
      -[LabelDetailsPlatterAccessibility _axSetDidInitializeZeroAlpha:](self, "_axSetDidInitializeZeroAlpha:", 1);
  }

}

@end
