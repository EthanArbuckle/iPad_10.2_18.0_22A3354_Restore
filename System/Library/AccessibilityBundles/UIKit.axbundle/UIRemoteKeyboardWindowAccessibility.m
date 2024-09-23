@implementation UIRemoteKeyboardWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIRemoteKeyboardWindow");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputWindowController"), CFSTR("visibleInputViewFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v4, obj);
}

- (CGPoint)accessibilityActivationPoint
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  char v13;
  CGRect v14;
  id v15;
  id v16;
  char v17;
  id v18[3];
  double v19;
  double v20;
  CGPoint result;

  v18[2] = self;
  v18[1] = (id)a2;
  v17 = 0;
  v16 = (id)__UIAccessibilitySafeClass();
  v15 = v16;
  objc_storeStrong(&v16, 0);
  v18[0] = v15;
  memset(&v14, 0, sizeof(v14));
  v13 = 0;
  v10 = (id)objc_msgSend(v15, "rootViewController");
  v12 = (id)__UIAccessibilitySafeClass();

  v11 = v12;
  objc_storeStrong(&v12, 0);
  objc_msgSend(v11, "safeCGRectForKey:", CFSTR("visibleInputViewFrame"));
  v14.origin.x = v2;
  v14.origin.y = v3;
  v14.size.width = v4;
  v14.size.height = v5;

  UIAccessibilityConvertFrameToScreenCoordinates(v14, (UIView *)v18[0]);
  AX_CGRectGetCenter();
  v19 = v6;
  v20 = v7;
  objc_storeStrong(v18, 0);
  v8 = v19;
  v9 = v20;
  result.y = v9;
  result.x = v8;
  return result;
}

@end
