@implementation _UISubtitleCellContentViewConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISubtitleCellContentViewConfiguration");
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
  v3 = CFSTR("_UISubtitleCellContentViewConfiguration");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("subtitleLabel"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  id v11[2];
  _UISubtitleCellContentViewConfigurationAccessibility *v12;

  v12 = self;
  v11[1] = (id)a2;
  v10.receiver = self;
  v10.super_class = (Class)_UISubtitleCellContentViewConfigurationAccessibility;
  v11[0] = -[_UISubtitleCellContentViewConfigurationAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
  if (!objc_msgSend(v11[0], "length"))
  {
    v9 = (id)-[_UISubtitleCellContentViewConfigurationAccessibility safeValueForKey:](v12, "safeValueForKey:", CFSTR("textLabel"));
    v8 = (id)objc_msgSend(v9, "accessibilityLabel");
    v7 = (id)-[_UISubtitleCellContentViewConfigurationAccessibility safeValueForKey:](v12, "safeValueForKey:", CFSTR("subtitleLabel"));
    v5 = (id)objc_msgSend(v7, "accessibilityLabel");
    v2 = (id)__UIAXStringForVariables();
    v3 = v11[0];
    v11[0] = v2;

  }
  v6 = v11[0];
  objc_storeStrong(v11, 0);
  return v6;
}

@end
