@implementation MKPlaceCardHeaderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceCardHeaderViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceCardHeaderViewController"), CFSTR("_setupDatas"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceCardHeaderViewController"), CFSTR("_placeItem"), "<_MKPlaceItem>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceCardHeaderViewController"), CFSTR("_priceToken"), "_MKTokenAttributedString");
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("_MKPlaceItem"), CFSTR("mapItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKTokenAttributedString"), CFSTR("string"), "@", 0);

}

- (void)_updateDirectionsButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCardHeaderViewControllerAccessibility;
  -[MKPlaceCardHeaderViewControllerAccessibility _updateDirectionsButton](&v8, sel__updateDirectionsButton);
  objc_opt_class();
  -[MKPlaceCardHeaderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentAttributedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v7);

}

- (void)_setupDatas
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceCardHeaderViewControllerAccessibility;
  -[MKPlaceCardHeaderViewControllerAccessibility _setupDatas](&v7, sel__setupDatas);
  -[MKPlaceCardHeaderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_priceToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXPriceRangeDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

@end
