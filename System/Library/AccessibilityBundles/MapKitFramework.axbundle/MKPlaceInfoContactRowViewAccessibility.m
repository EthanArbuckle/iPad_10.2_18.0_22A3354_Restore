@implementation MKPlaceInfoContactRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceInfoContactRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceInfoContactRowView"), CFSTR("_titleLabel"), "MKVibrantLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKVibrantLabel"), CFSTR("_label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceInfoContactRowView"), CFSTR("_valueLabel"), "_MKUILabel");

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
  uint64_t v7;

  -[MKPlaceInfoContactRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[MKPlaceInfoContactRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MKPlaceInfoContactRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_valueLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
