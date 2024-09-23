@implementation UITextEffectsWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextEffectsWindow");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextEffectsWindow"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v4, obj);
}

- (UITextEffectsWindowAccessibility)initWithFrame:(CGRect)a3
{
  UITextEffectsWindowAccessibility *v4;
  id v5;
  id v6;
  char v7;
  objc_super v8;
  SEL v9;
  UITextEffectsWindowAccessibility *v10;
  CGRect v11;

  v11 = a3;
  v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)UITextEffectsWindowAccessibility;
  v10 = -[UITextEffectsWindowAccessibility initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v7 = 0;
    objc_opt_class();
    v6 = (id)__UIAccessibilityCastAsSafeCategory();
    v5 = v6;
    objc_storeStrong(&v6, 0);
    -[UIWindowAccessibility _axListenForRemoteElement](v5);

  }
  v4 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v4;
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  return -[UITextEffectsWindowAccessibility _axHasModalView](self, "_axHasModalView", a2, self);
}

- (BOOL)accessibilityViewIsModal
{
  return -[UITextEffectsWindowAccessibility _axHasModalView](self, "_axHasModalView", a2, self);
}

- (BOOL)_axHasModalView
{
  id v3;
  id v4;
  BOOL v5;

  v4 = (id)-[UITextEffectsWindowAccessibility subviews](self, "subviews");
  v3 = (id)objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_44);
  v5 = objc_msgSend(v3, "count") != 0;

  return v5;
}

uint64_t __51__UITextEffectsWindowAccessibility__axHasModalView__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "accessibilityViewIsModal");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (CGRect)_axConvertRect:(CGRect)a3 toWindow:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id location[2];
  UITextEffectsWindowAccessibility *v13;
  CGRect v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v14 = a3;
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ((-[UITextEffectsWindowAccessibility safeBoolForKey:](v13, "safeBoolForKey:", CFSTR("_isHostedInAnotherProcess")) & 1) != 0)
    -[UITextEffectsWindowAccessibility convertRect:toWindow:](v13, "convertRect:toWindow:", v13, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  else
    -[UITextEffectsWindowAccessibility convertRect:toWindow:](v13, "convertRect:toWindow:", 0, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  v15 = v4;
  v16 = v5;
  v17 = v6;
  v18 = v7;
  objc_storeStrong(location, 0);
  v8 = v15;
  v9 = v16;
  v10 = v17;
  v11 = v18;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end
