@implementation SiriAcousticIdHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriAcousticIdHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriAcousticIdHeaderView"), CFSTR("_openButton"), "SKUIItemOfferButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriAcousticIdHeaderView"), CFSTR("songTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriAcousticIdHeaderView"), CFSTR("artistString"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[SiriAcousticIdHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("songTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriAcousticIdHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artistString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[SiriAcousticIdHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_openButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("buy.button.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SiriAcousticIdHeaderViewAccessibility;
    -[SiriAcousticIdHeaderViewAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  void *v3;
  unint64_t *v4;

  -[SiriAcousticIdHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_openButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (unint64_t *)MEMORY[0x24BDF73E0];
  if (v3)
    v4 = (unint64_t *)MEMORY[0x24BDF73B0];
  return *v4;
}

@end
