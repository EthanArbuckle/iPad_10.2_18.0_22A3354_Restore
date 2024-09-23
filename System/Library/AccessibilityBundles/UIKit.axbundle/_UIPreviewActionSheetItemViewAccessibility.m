@implementation _UIPreviewActionSheetItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPreviewActionSheetItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIPreviewActionSheetItemView"), CFSTR("action"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPreviewMenuItem"), CFSTR("title"), v3, 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  SEL v8;
  _UIPreviewActionSheetItemViewAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  objc_opt_class();
  v4 = (id)-[_UIPreviewActionSheetItemViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("action"));
  v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("title"));
  v6 = (id)__UIAccessibilityCastAsClass();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
