@implementation MKStarRatingViewAccessibility_iOS

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKStarRatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MKStarRatingView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKStarRatingView"), CFSTR("rating"), "d", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MKStarRatingView"), CFSTR("ratingAsAttributedString: baseFont: style:theme:"), "d", "@", "q", "@", 0);

}

+ (id)ratingAsAttributedString:(double)a3 baseFont:(id)a4 style:(int64_t)a5 theme:(id)a6
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___MKStarRatingViewAccessibility_iOS;
  objc_msgSendSuper2(&v9, sel_ratingAsAttributedString_baseFont_style_theme_, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXStarRatingStringForRating();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  return v6;
}

- (id)accessibilityLabel
{
  -[MKStarRatingViewAccessibility_iOS safeFloatForKey:](self, "safeFloatForKey:", CFSTR("rating"));
  return (id)UIAXStarRatingStringForRating();
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

@end
