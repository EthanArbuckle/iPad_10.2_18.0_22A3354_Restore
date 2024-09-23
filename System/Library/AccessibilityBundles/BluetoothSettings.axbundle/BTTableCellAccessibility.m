@implementation BTTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BTTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("BTTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTTableCell"), CFSTR("_spinner"), "UIActivityIndicatorView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BTTableCell"), CFSTR("UITableViewCell"));

}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[BTTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_spinner"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "isAnimating"))
  {
    accessibilityLocalizedString(CFSTR("connecting"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BTTableCellAccessibility;
    -[BTTableCellAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

@end
