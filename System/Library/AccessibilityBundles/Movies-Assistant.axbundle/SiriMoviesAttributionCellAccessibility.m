@implementation SiriMoviesAttributionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriMoviesAttributionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesAttributionCell"), CFSTR("_titleLabel"), "UILabel");
}

- (BOOL)isBuyTicketsCell
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SiriMoviesAttributionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("BUY_TICKETS_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[SiriMoviesAttributionCellAccessibility isBuyTicketsCell](self, "isBuyTicketsCell"))
  {
    accessibilityLocalizedString(CFSTR("buy.tickets.fandango"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SiriMoviesAttributionCellAccessibility;
    -[SiriMoviesAttributionCellAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
