@implementation CNPropertySimpleTransportCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertySimpleTransportCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertySimpleTransportCell"), CFSTR("shouldShowStar"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertySimpleTransportCell"), CFSTR("shouldShowBadge"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  const __CFString *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNPropertySimpleTransportCellAccessibility;
  -[CNPropertySimpleTransportCellAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNPropertySimpleTransportCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldShowStar")))
  {
    accessibilityLocalizedString(CFSTR("vip.badge"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (-[CNPropertySimpleTransportCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldShowBadge"), v7, v9))
  {
    accessibilityLocalizedString(CFSTR("recent.badge"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

@end
