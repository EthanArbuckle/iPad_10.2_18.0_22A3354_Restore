@implementation _UIActionSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIActionSlider");
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
  v4 = CFSTR("_UIActionSlider");
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("trackMaskPath"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_knobView"), "_UIActionSliderKnob");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_trackBackgroundView"), "UIView");
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  BOOL v4;
  objc_super v5;
  int v6;
  id location[2];
  _UIActionSliderAccessibility *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  v2 = (id)-[_UIActionSliderAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v4 = v2 == 0;

  if (v4)
  {
    location[0] = (id)-[_UIActionSliderAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("trackText"));
    if (objc_msgSend(location[0], "length"))
    {
      v9 = location[0];
    }
    else
    {
      v5.receiver = v8;
      v5.super_class = (Class)_UIActionSliderAccessibility;
      v9 = -[_UIActionSliderAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    }
    v6 = 1;
    objc_storeStrong(location, 0);
  }
  else
  {
    v9 = (id)-[_UIActionSliderAccessibility accessibilityUserDefinedLabel](v8, "accessibilityUserDefinedLabel");
  }
  return v9;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  _UIActionSliderAccessibility *v9;
  id v10[2];
  _UIActionSliderAccessibility *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = (id)-[_UIActionSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __53___UIActionSliderAccessibility_accessibilityActivate__block_invoke;
  v7 = &unk_24FF3E050;
  v8 = v10[0];
  v9 = v11;
  AXPerformSafeBlock();
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v10, 0);
  return 1;
}

- (id)accessibilityPath
{
  UIView *v3;
  UIBezierPath *v4;
  id v5;
  UIBezierPath *v6;
  id v7;
  char v8;
  id v9[2];
  _UIActionSliderAccessibility *v10;

  v10 = self;
  v9[1] = (id)a2;
  v8 = 0;
  v5 = (id)-[_UIActionSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trackMaskPath"));
  v7 = (id)__UIAccessibilitySafeClass();

  v6 = (UIBezierPath *)v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  v3 = (UIView *)(id)-[_UIActionSliderAccessibility safeUIViewForKey:](v10, "safeUIViewForKey:", CFSTR("_trackBackgroundView"));
  v4 = UIAccessibilityConvertPathToScreenCoordinates(v6, v3);

  objc_storeStrong(v9, 0);
  return v4;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  id location[2];
  _UIActionSliderAccessibility *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v12 = self;
  location[1] = (id)a2;
  location[0] = -[_UIActionSliderAccessibility accessibilityPath](self, "accessibilityPath");
  if (location[0])
  {
    *(CGRect *)&v2 = CGPathGetBoundingBox((CGPathRef)objc_msgSend(objc_retainAutorelease(location[0]), "CGPath"));
  }
  else
  {
    v10.receiver = v12;
    v10.super_class = (Class)_UIActionSliderAccessibility;
    -[_UIActionSliderAccessibility accessibilityFrame](&v10, sel_accessibilityFrame);
  }
  v13 = v2;
  v14 = v3;
  v15 = v4;
  v16 = v5;
  objc_storeStrong(location, 0);
  v6 = v13;
  v7 = v14;
  v8 = v15;
  v9 = v16;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  CGPoint result;

  v6 = (id)-[_UIActionSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_knobView"));
  objc_msgSend(v6, "accessibilityActivationPoint");
  v7 = v2;
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityHint
{
  id v2;
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;
  void *v10;

  v4 = (id)-[_UIActionSliderAccessibility accessibilityUserDefinedHint](self, "accessibilityUserDefinedHint");
  v7 = 0;
  v5 = 0;
  if (v4)
  {
    v6 = (id)-[_UIActionSliderAccessibility accessibilityUserDefinedHint](self, "accessibilityUserDefinedHint");
    v5 = 1;
    v2 = v6;
  }
  else
  {
    v8 = (id)UIKitAccessibilityLocalizedString();
    v7 = 1;
    v2 = v8;
  }
  v10 = v2;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v10;
}

@end
