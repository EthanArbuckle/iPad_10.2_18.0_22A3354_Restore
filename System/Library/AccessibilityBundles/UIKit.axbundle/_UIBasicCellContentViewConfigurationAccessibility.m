@implementation _UIBasicCellContentViewConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBasicCellContentViewConfiguration");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIBasicCellContentViewConfiguration"), CFSTR("textLabel"), "@", 0);
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
  _UIBasicCellContentViewConfigurationAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIBasicCellContentViewConfigurationAccessibility;
  v8[0] = -[_UIBasicCellContentViewConfigurationAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  if (!objc_msgSend(v8[0], "length"))
  {
    v6 = (id)-[_UIBasicCellContentViewConfigurationAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("textLabel"));
    v2 = (id)objc_msgSend(v6, "accessibilityLabel");
    v3 = v8[0];
    v8[0] = v2;

  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

@end
