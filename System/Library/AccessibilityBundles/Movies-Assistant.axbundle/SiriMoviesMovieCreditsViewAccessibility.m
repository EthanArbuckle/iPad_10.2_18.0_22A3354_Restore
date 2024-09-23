@implementation SiriMoviesMovieCreditsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriMoviesMovieCreditsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesMovieCreditsView"), CFSTR("_directorLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesMovieCreditsView"), CFSTR("_starringLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesMovieCreditsView"), CFSTR("initWithFrame: movieDetailSnippet:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);

}

- (SiriMoviesMovieCreditsViewAccessibility)initWithFrame:(CGRect)a3 movieDetailSnippet:(id)a4
{
  SiriMoviesMovieCreditsViewAccessibility *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriMoviesMovieCreditsViewAccessibility;
  v4 = -[SiriMoviesMovieCreditsViewAccessibility initWithFrame:movieDetailSnippet:](&v9, sel_initWithFrame_movieDetailSnippet_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SiriMoviesMovieCreditsViewAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("_directorLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF73C0];
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  -[SiriMoviesMovieCreditsViewAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("_starringLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityTraits:", v6);

  return v4;
}

@end
