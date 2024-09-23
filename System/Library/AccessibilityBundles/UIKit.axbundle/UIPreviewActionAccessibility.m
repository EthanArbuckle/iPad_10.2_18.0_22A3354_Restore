@implementation UIPreviewActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPreviewAction");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPreviewAction"), CFSTR("copyWithZone:"), "@", "^{_NSZone=}", 0);
  objc_storeStrong(v4, obj);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;
  id v8;
  _NSZone *v9;
  SEL v10;
  UIPreviewActionAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIPreviewActionAccessibility;
  v8 = -[UIPreviewActionAccessibility copyWithZone:](&v7, sel_copyWithZone_, a3);
  v6 = (id)-[UIPreviewActionAccessibility accessibilityLabel](v11, "accessibilityLabel");
  if (v6)
  {
    v5 = (id)objc_msgSend(v6, "copyWithZone:", v9);
    objc_msgSend(v8, "setAccessibilityLabel:", v5);
    objc_storeStrong(&v5, 0);
  }
  v4 = v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

@end
