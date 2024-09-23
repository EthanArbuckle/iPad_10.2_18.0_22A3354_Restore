@implementation HUGridHeadlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUGridHeadlineCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridHeadlineCell"), CFSTR("headlineLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUGridHeadlineCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headlineLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  -[HUGridHeadlineCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headlineLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HUGridHeadlineCellAccessibility;
    -[HUGridHeadlineCellAccessibility accessibilityFrame](&v17, sel_accessibilityFrame);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
