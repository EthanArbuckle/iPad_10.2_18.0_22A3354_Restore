@implementation _UICollectionViewListHeaderFooterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UICollectionViewListHeaderFooter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UICollectionViewListHeaderFooter"), CFSTR("_contentViewConfiguration"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  objc_super v7;
  id v8[2];
  _UICollectionViewListHeaderFooterAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListHeaderFooterAccessibility;
  v8[0] = -[_UICollectionViewListHeaderFooterAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  if (!objc_msgSend(v8[0], "length"))
  {
    v6 = (id)-[_UICollectionViewListHeaderFooterAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_contentViewConfiguration"));
    v2 = (id)objc_msgSend(v6, "accessibilityLabel");
    v3 = v8[0];
    v8[0] = v2;

  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

- (BOOL)isAccessibilityElement
{
  id v3;
  BOOL v4;

  v3 = -[_UICollectionViewListHeaderFooterAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  id v4;
  unint64_t v5;
  objc_super v6;
  SEL v7;
  _UICollectionViewListHeaderFooterAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListHeaderFooterAccessibility;
  v3 = -[_UICollectionViewListHeaderFooterAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  v4 = (id)-[_UICollectionViewListHeaderFooterAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_contentViewConfiguration"));
  v5 = v3 | objc_msgSend(v4, "accessibilityTraits");

  return v5;
}

@end
