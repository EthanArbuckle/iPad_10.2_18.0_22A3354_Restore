@implementation SKUIRatingStarsCacheAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIRatingStarsCache");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)ratingStarsImageForRating:(double)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIRatingStarsCacheAccessibility;
  -[SKUIRatingStarsCacheAccessibility ratingStarsImageForRating:](&v6, sel_ratingStarsImageForRating_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXStarRatingStringForRating();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  return v3;
}

@end
