@implementation _UILegibilityLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UILegibilityLabel");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UILegibilityLabel"), CFSTR("string"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  return (id)-[_UILegibilityLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("string"), a2, self);
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[_UILegibilityLabelAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return -[_UILegibilityLabelAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible") & 1;
  v4 = (id)-[_UILegibilityLabelAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  _UILegibilityLabelAccessibility *v9;

  v9 = self;
  v8 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)_UILegibilityLabelAccessibility;
  v5 = -[_UILegibilityLabelAccessibility description](&v7, sel_description);
  v4 = -[_UILegibilityLabelAccessibility accessibilityLabel](v9, "accessibilityLabel");
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v4);

  return v6;
}

@end
