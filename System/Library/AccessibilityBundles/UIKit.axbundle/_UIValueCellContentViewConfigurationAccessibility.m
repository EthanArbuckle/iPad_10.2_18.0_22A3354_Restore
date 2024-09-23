@implementation _UIValueCellContentViewConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIValueCellContentViewConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIValueCellContentViewConfiguration");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("valueLabel"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  objc_super v7;
  id v8[2];
  _UIValueCellContentViewConfigurationAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIValueCellContentViewConfigurationAccessibility;
  v8[0] = -[_UIValueCellContentViewConfigurationAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  if (!objc_msgSend(v8[0], "length"))
  {
    v6 = (id)-[_UIValueCellContentViewConfigurationAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("textLabel"));
    v2 = (id)objc_msgSend(v6, "accessibilityLabel");
    v3 = v8[0];
    v8[0] = v2;

  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v5;
  id v6;
  objc_super v7;
  id v8[2];
  _UIValueCellContentViewConfigurationAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIValueCellContentViewConfigurationAccessibility;
  v8[0] = -[_UIValueCellContentViewConfigurationAccessibility accessibilityValue](&v7, sel_accessibilityValue);
  if (!objc_msgSend(v8[0], "length"))
  {
    v6 = (id)-[_UIValueCellContentViewConfigurationAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("valueLabel"));
    v2 = (id)objc_msgSend(v6, "accessibilityLabel");
    v3 = v8[0];
    v8[0] = v2;

  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

@end
