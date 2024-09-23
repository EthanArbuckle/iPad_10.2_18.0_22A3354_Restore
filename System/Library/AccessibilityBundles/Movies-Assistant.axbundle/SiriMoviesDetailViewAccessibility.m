@implementation SiriMoviesDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriMoviesDetailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesDetailView"), CFSTR("watchTrailerButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesDetailView"), CFSTR("reviewsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesDetailView"), CFSTR("_movieInfoView"), "SiriMoviesMovieInfoView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesMovieInfoView"), CFSTR("_runtimeValueLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILabel"), CFSTR("text"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SiriMoviesDetailViewAccessibility;
  -[SiriMoviesDetailViewAccessibility _accessibilityLoadAccessibilityInformation](&v25, sel__accessibilityLoadAccessibilityInformation);
  -[SiriMoviesDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("watchTrailerButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("movie.trailer.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[SiriMoviesDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("reviewsButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("movie.rating.freshness.hint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityHint:", v6);

  -[SiriMoviesDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_movieInfoView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_runtimeValueLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("text"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v17 = 0;
    v14 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("hour.label"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v19, objc_msgSend(v14, "integerValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("minute.label"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", v22, objc_msgSend(v17, "integerValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v24, v23, CFSTR("__AXStringForVariablesSentinel"));

}

- (SiriMoviesDetailViewAccessibility)initWithFrame:(CGRect)a3 movieDetailSnippet:(id)a4
{
  SiriMoviesDetailViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriMoviesDetailViewAccessibility;
  v4 = -[SiriMoviesDetailViewAccessibility initWithFrame:movieDetailSnippet:](&v6, sel_initWithFrame_movieDetailSnippet_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SiriMoviesDetailViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
