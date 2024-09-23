@implementation PXZoomableInlineHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXZoomableInlineHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXZoomableInlineHeaderView"), CFSTR("userData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXZoomableInlineHeaderViewConfiguration"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXZoomableInlineHeaderViewConfiguration"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXZoomableInlineHeaderView"), CFSTR("UIView"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  -[PXZoomableInlineHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXZoomableInlineHeaderViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PXZoomableInlineHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73C0];
}

@end
