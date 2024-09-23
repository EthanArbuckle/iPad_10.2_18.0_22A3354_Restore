@implementation SiriMoviesChevronCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriMoviesChevronCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesChevronCell"), CFSTR("chevronButton"), "@", 0);
}

- (BOOL)chevronButtonIsDimmed
{
  void *v2;
  void *v3;
  char v4;

  -[SiriMoviesChevronCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("chevronButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("userInteractionEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (!-[SiriMoviesChevronCellAccessibility chevronButtonIsDimmed](self, "chevronButtonIsDimmed"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SiriMoviesChevronCellAccessibility;
  return -[SiriMoviesChevronCellAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[SiriMoviesChevronCellAccessibility chevronButtonIsDimmed](self, "chevronButtonIsDimmed"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SiriMoviesChevronCellAccessibility;
    -[SiriMoviesChevronCellAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SiriMoviesChevronCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("chevronButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (id)accessibilityValue
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[SiriMoviesChevronCellAccessibility chevronButtonIsDimmed](self, "chevronButtonIsDimmed"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SiriMoviesChevronCellAccessibility;
    -[SiriMoviesChevronCellAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SiriMoviesChevronCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("chevronButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[SiriMoviesChevronCellAccessibility chevronButtonIsDimmed](self, "chevronButtonIsDimmed"))
  {
    v5.receiver = self;
    v5.super_class = (Class)SiriMoviesChevronCellAccessibility;
    -[SiriMoviesChevronCellAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("chevron.cell.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
