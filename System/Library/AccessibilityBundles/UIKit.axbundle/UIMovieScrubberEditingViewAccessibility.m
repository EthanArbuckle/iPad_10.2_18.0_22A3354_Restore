@implementation UIMovieScrubberEditingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIMovieScrubberEditingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIMovieScrubberEditingView");
  v3 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("setEnabled:"), "v", v3, 0);
  objc_storeStrong(v6, obj);
}

- (void)setEnabled:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  char v6;
  objc_super v7;
  BOOL v8;
  BOOL v9;
  SEL v10;
  UIMovieScrubberEditingViewAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = (-[UIMovieScrubberEditingViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled")) & 1) != a3;
  v7.receiver = v11;
  v7.super_class = (Class)UIMovieScrubberEditingViewAccessibility;
  -[UIMovieScrubberEditingViewAccessibility setEnabled:](&v7, sel_setEnabled_, v9);
  if (v8)
  {
    v6 = 0;
    objc_opt_class();
    v3 = (id)-[UIMovieScrubberEditingViewAccessibility _accessibilityAncestorIsKindOf:](v11, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIMovieScrubber")));
    v5 = (id)__UIAccessibilityCastAsSafeCategory();

    v4 = v5;
    objc_storeStrong(&v5, 0);
    -[UIMovieScrubberAccessibility _accessibilityClearChildren](v4);

  }
}

@end
