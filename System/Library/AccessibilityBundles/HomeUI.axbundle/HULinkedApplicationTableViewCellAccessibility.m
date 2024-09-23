@implementation HULinkedApplicationTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HULinkedApplicationTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULinkedApplicationTableViewCell"), CFSTR("linkedApplicationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULinkedApplicationView"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULinkedApplicationView"), CFSTR("publisherLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULinkedApplicationView"), CFSTR("ratingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULinkedApplicationRatingView"), CFSTR("starViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULinkedApplicationRatingView"), CFSTR("rating"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HULinkedApplicationView"), CFSTR("priceLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HULinkedApplicationTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("linkedApplicationView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("publisherLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("ratingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeFloatForKey:", CFSTR("rating"));
  v7 = v6;
  objc_msgSend(v2, "safeValueForKey:", CFSTR("priceLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("starViews"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = (void *)MEMORY[0x24BDD17C8];
  accessibilityHomeUILocalizedString(CFSTR("manufacturer.app.store.star.rating"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v13, v7, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 4, v3, v4, v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HULinkedApplicationTableViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HULinkedApplicationTableViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(CFSTR("manufacturer.app.store.open.hint"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
