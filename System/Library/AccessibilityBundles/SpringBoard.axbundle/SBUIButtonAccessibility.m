@implementation SBUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)SBUIButtonAccessibility;
  -[SBUIButtonAccessibility accessibilityFrame](&v16, sel_accessibilityFrame);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[SBUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AppSwitcherPlay")) & 1) != 0
    || (objc_msgSend(v11, "isEqualToString:", CFSTR("AppSwitcherPrev")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("AppSwitcherNext")))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v18 = CGRectInset(v17, 0.0, -10.0);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
  }

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end
