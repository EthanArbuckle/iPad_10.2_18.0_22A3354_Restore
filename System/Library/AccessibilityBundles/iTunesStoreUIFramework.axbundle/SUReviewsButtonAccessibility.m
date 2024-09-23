@implementation SUReviewsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUReviewsButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUReviewsButtonAccessibility;
  -[SUReviewsButtonAccessibility accessibilityLabel](&v12, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUReviewsButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 < 1)
  {
    v9 = 0;
  }
  else
  {
    -[SUReviewsButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRating"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    starStringForStarCount(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
