@implementation SKUIBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIBannerView"), CFSTR("itemOffer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIBannerView"), CFSTR("closeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIBannerView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIBannerView"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIBannerView"), CFSTR("userRating"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIBannerView"), CFSTR("_itemStateLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIBannerView"), CFSTR("_itemOfferButton"), "UIButton");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[SKUIBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artistName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingStarImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_itemStateLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[SKUIBannerViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBannerViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, *v3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_msgSend(v5, "setAccessibilityDelegate:", self);
    objc_msgSend(v4, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  -[SKUIBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("closeButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    accessibilitySKUILocalizedString(CFSTR("close.button.for.website.app.download"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v8);

    objc_msgSend(v6, "insertObject:atIndex:", v7, 0);
  }
  -[SKUIBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_itemOfferButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axSafelyAddObject:", v9);

  return v6;
}

@end
