@implementation SessionRingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SessionRingsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.SessionRingsView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionRingsView"), CFSTR("ringsPlatter"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionRingsView"), CFSTR("displayHighlightWithDuration:"), "v", "d", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("activity.rings"));
}

- (id)accessibilityValue
{
  return (id)-[SessionRingsViewAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SessionRingsViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[SessionRingsViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (CGRect)accessibilityFrame
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  UIView *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  -[SessionRingsViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("ringsPlatter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "superview"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v3, "superview");
    v13 = (UIView *)objc_claimAutoreleasedReturnValue();
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    v23 = UIAccessibilityConvertFrameToScreenCoordinates(v22, v13);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;

  }
  else
  {
    x = *MEMORY[0x24BDBF090];
    y = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (void)displayHighlightWithDuration:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SessionRingsViewAccessibility;
  -[SessionRingsViewAccessibility displayHighlightWithDuration:](&v3, sel_displayHighlightWithDuration_);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __62__SessionRingsViewAccessibility_displayHighlightWithDuration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, MEMORY[0x23491D424](CFSTR("ARUIRingsView")));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:", 0, 1, 0, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v2);

}

@end
