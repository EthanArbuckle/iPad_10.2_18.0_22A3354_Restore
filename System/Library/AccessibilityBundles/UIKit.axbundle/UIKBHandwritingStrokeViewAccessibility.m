@implementation UIKBHandwritingStrokeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKBHandwritingStrokeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("UIHandwritingAssistantView"));
  objc_msgSend(location[0], "validateClass:", CFSTR("UIKBKeyplaneView"));
  objc_storeStrong(location, 0);
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v2 = *MEMORY[0x24BDBEFB0];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)accessibilityFrame
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double x;
  double y;
  double width;
  double height;
  id v12;
  id v13;
  CGRect v14;
  SEL v15;
  UIView *v16;
  CGRect v17;
  CGRect result;

  v16 = (UIView *)self;
  v15 = a2;
  -[UIKBHandwritingStrokeViewAccessibility bounds](self, "bounds");
  v14.origin.x = v2;
  v14.origin.y = v3;
  v14.size.width = v4;
  v14.size.height = v5;
  v13 = (id)-[UIView _accessibilityFindAncestor:startWithSelf:](v16, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_21, 0);
  if ((AXDeviceIsPhoneIdiom() & 1) != 0)
  {
    v12 = (id)objc_msgSend(v13, "_accessibilityFindSubviewDescendant:", &__block_literal_global_201);
    objc_msgSend(v12, "frame");
    v14.origin.y = v14.origin.y + v6;
    objc_msgSend(v12, "frame");
    v14.size.height = v14.size.height - v7;
    objc_storeStrong(&v12, 0);
  }
  v17 = UIAccessibilityConvertFrameToScreenCoordinates(v14, v16);
  objc_storeStrong(&v13, 0);
  y = v17.origin.y;
  x = v17.origin.x;
  height = v17.size.height;
  width = v17.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

uint64_t __60__UIKBHandwritingStrokeViewAccessibility_accessibilityFrame__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UIKBKeyplaneView"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __60__UIKBHandwritingStrokeViewAccessibility_accessibilityFrame__block_invoke_2(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UIHandwritingAssistantView"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("handwriting.input.area"));
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("handwriting.input.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
