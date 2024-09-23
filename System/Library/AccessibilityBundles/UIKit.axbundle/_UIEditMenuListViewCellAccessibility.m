@implementation _UIEditMenuListViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIEditMenuListViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIEditMenuListViewCell"), CFSTR("titleLabel"), "@");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIEditMenuListViewCell"), CFSTR("imageView"), "@");
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB140];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id location[2];
  _UIEditMenuListViewCellAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  v4 = (id)-[_UIEditMenuListViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  location[0] = (id)objc_msgSend(v4, "accessibilityLabel");

  if (objc_msgSend(location[0], "length"))
  {
    v7 = location[0];
  }
  else
  {
    v3 = (id)-[_UIEditMenuListViewCellAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("imageView"));
    v7 = (id)objc_msgSend(v3, "accessibilityLabel");

  }
  objc_storeStrong(location, 0);
  return v7;
}

- (id)automationElements
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = (id)-[_UIEditMenuListViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentStackView"));
  v5 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

@end
