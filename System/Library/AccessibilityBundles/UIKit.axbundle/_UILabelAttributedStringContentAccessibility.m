@implementation _UILabelAttributedStringContentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UILabelAttributedStringContent");
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
  v3 = CFSTR("_UILabelAttributedStringContent");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_attributedString"), "NSAttributedString");
  objc_storeStrong(v5, obj);
}

- (_UILabelAttributedStringContentAccessibility)initWithAttributedString:(id)a3 defaultAttributes:(id)a4
{
  _UILabelAttributedStringContentAccessibility *v4;
  id v7;
  id v8;
  _UILabelAttributedStringContentAccessibility *v9;
  objc_super v10;
  _UILabelAttributedStringContentAccessibility *v11;
  id v12;
  id location[2];
  _UILabelAttributedStringContentAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v4 = v14;
  v14 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)_UILabelAttributedStringContentAccessibility;
  v14 = -[_UILabelAttributedStringContentAccessibility initWithAttributedString:defaultAttributes:](&v10, sel_initWithAttributedString_defaultAttributes_, location[0], v12);
  v11 = v14;
  v8 = (id)-[_UILabelAttributedStringContentAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_attributedString"));
  v7 = (id)objc_msgSend(location[0], "accessibilityLabel");
  objc_msgSend(v8, "setAccessibilityLabel:");

  v9 = v11;
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v9;
}

@end
