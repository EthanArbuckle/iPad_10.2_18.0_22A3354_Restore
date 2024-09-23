@implementation PXGSingleViewContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXGSingleViewContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGSingleViewContainerView"), CFSTR("contentView"), "@", 0);
}

- (id)_axContentView
{
  return (id)-[PXGSingleViewContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
}

- (id)_axContentViewLabel
{
  void *v2;
  void *v3;

  -[PXGSingleViewContainerViewAccessibility _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PXGSingleViewContainerViewAccessibility _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXGSingleViewContainerViewAccessibility _axContentViewLabel](self, "_axContentViewLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "length") != 0;
  else
    v4 = 0;

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[PXGSingleViewContainerViewAccessibility _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySupplementaryFooterViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;

  -[PXGSingleViewContainerViewAccessibility _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomRotors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)automationElements
{
  void *v2;
  void *v3;

  -[PXGSingleViewContainerViewAccessibility _axContentView](self, "_axContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automationElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
