@implementation SiriMoviesMovieListCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriMoviesMovieListCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
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

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriMoviesMovieListCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_movieTitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "addObject:", v5);
  -[SiriMoviesMovieListCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_showtimeLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("movie.times"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v10);
  }
  -[SiriMoviesMovieListCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tomatoView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
    objc_msgSend(v3, "addObject:", v12);
  -[SiriMoviesMovieListCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ratingView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
    objc_msgSend(v3, "addObject:", v14);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
