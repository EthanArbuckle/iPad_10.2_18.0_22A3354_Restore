@implementation SiriMoviesRottenTomatoesRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriMoviesRottenTomatoesRatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesRottenTomatoesRatingView"), CFSTR("_isFresh"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesRottenTomatoesRatingView"), CFSTR("_percentageLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;

  -[SiriMoviesRottenTomatoesRatingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_percentageLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if ((objc_msgSend(v5, "scanInteger:", &v13) & 1) != 0)
  {
    v6 = -[SiriMoviesRottenTomatoesRatingViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isFresh"));
    v7 = (void *)MEMORY[0x24BDD17C8];
    if (v6)
      v8 = CFSTR("rotten.tomatoes.fresh");
    else
      v8 = CFSTR("rotten.tomatoes.rotten");
    accessibilityLocalizedString(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v10, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
