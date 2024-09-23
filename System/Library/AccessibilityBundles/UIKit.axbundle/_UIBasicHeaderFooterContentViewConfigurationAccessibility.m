@implementation _UIBasicHeaderFooterContentViewConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBasicHeaderFooterContentViewConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIBasicHeaderFooterContentViewConfiguration");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_defaultStyle"), "q");
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  objc_super v7;
  id v8[2];
  _UIBasicHeaderFooterContentViewConfigurationAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIBasicHeaderFooterContentViewConfigurationAccessibility;
  v8[0] = -[_UIBasicHeaderFooterContentViewConfigurationAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  if (!objc_msgSend(v8[0], "length"))
  {
    v6 = (id)-[_UIBasicHeaderFooterContentViewConfigurationAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("textLabel"));
    v2 = (id)objc_msgSend(v6, "accessibilityLabel");
    v3 = v8[0];
    v8[0] = v2;

  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  unint64_t v4;
  objc_super v5;
  uint64_t v6;
  SEL v7;
  _UIBasicHeaderFooterContentViewConfigurationAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = -[_UIBasicHeaderFooterContentViewConfigurationAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_defaultStyle"));
  v5.receiver = v8;
  v5.super_class = (Class)_UIBasicHeaderFooterContentViewConfigurationAccessibility;
  v4 = -[_UIBasicHeaderFooterContentViewConfigurationAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if (v6 && v6 != 2)
    v3 = 0;
  else
    v3 = *MEMORY[0x24BDF73C0];
  return v4 | v3;
}

@end
