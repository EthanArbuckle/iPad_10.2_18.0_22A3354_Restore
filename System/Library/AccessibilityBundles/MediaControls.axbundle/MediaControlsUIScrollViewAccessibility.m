@implementation MediaControlsUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollViewAccessibility"), CFSTR("_accessibilityContentInset"), "{UIEdgeInsets=dddd}", 0);
}

- (UIEdgeInsets)_accessibilityContentInset
{
  void *v3;
  double v4;
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
  objc_super v16;
  UIEdgeInsets result;

  -[MediaControlsUIScrollViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXMediaControlsScrollViewIdentifier"))
    && (UIAccessibilityIsSwitchControlRunning() || _AXSCommandAndControlEnabled()))
  {
    v4 = *MEMORY[0x24BDF7718];
    v5 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v6 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v7 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MediaControlsUIScrollViewAccessibility;
    -[MediaControlsUIScrollViewAccessibility _accessibilityContentInset](&v16, sel__accessibilityContentInset);
    v4 = v8;
    v5 = v9;
    v6 = v10;
    v7 = v11;
  }

  v12 = v4;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

@end
