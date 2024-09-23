@implementation _MKNanoPlaceCardHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKNanoPlaceCardHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoPlaceCardHeaderView"), CFSTR("_displayedInfoView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoPlaceCardHeaderView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoPlaceCardHeaderView"), CFSTR("_openClosedLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoPlaceCardHeaderView"), CFSTR("_hoursLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoPlaceCardHeaderView"), CFSTR("_categoryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoPlaceCardHeaderView"), CFSTR("_addressLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoPlaceCardHeaderView"), CFSTR("_mapItem"), "MKMapItem");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKNanoPlaceCardHeaderView"), CFSTR("setMapItem:showsAddress:"), "v", "@", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKNanoPlaceCardHeaderViewAccessibility;
  -[_MKNanoPlaceCardHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[_MKNanoPlaceCardHeaderViewAccessibility _accessibilityUpdateCategoryAXLabel](self, "_accessibilityUpdateCategoryAXLabel");
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[_MKNanoPlaceCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKNanoPlaceCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_displayedInfoView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKNanoPlaceCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_openClosedLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKNanoPlaceCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_hoursLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKNanoPlaceCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_categoryLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKNanoPlaceCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_addressLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 6, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setMapItem:(id)a3 showsAddress:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKNanoPlaceCardHeaderViewAccessibility;
  -[_MKNanoPlaceCardHeaderViewAccessibility setMapItem:showsAddress:](&v5, sel_setMapItem_showsAddress_, a3, a4);
  -[_MKNanoPlaceCardHeaderViewAccessibility _accessibilityUpdateCategoryAXLabel](self, "_accessibilityUpdateCategoryAXLabel");
}

- (void)_accessibilityUpdateCategoryAXLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[_MKNanoPlaceCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "_firstLocalizedCategoryName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_hasPriceRange"))
    {
      objc_msgSend(v4, "_priceRangeString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIAXPriceRangeDescription();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    -[_MKNanoPlaceCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_categoryLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v9, v7, CFSTR("__AXStringForVariablesSentinel"));

  }
}

@end
