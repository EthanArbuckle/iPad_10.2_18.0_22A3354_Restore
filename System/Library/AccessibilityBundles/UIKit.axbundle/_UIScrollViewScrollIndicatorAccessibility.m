@implementation _UIScrollViewScrollIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIScrollViewScrollIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityScrollIndicatorDelegate
{
  if (a1)
    return (id)__UIAccessibilityGetAssociatedNonRetainedObject();
  else
    return 0;
}

- (void)setAccessibilityScrollIndicatorDelegate:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedNonRetainedObject();
  objc_storeStrong(&location, 0);
}

- (uint64_t)accessibilityScrollDirection
{
  if (a1)
    return __UIAccessibilityGetAssociatedLong();
  else
    return 0;
}

- (uint64_t)setAccessibilityScrollDirection:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedLong();
  return result;
}

- (uint64_t)accessibilityScrollIndicatorIsFocused
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)setAccessibilityScrollIndicatorIsFocused:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  id v3;
  char v4;

  v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  v4 = objc_msgSend(v3, "accessibilityShouldEnableScrollIndicator:", self);

  return v4 & 1;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (id)_axBasicDescription
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v8 = a1;
  if (a1)
  {
    v7 = 0;
    v6 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection](v8);
    if (v6 == 1)
    {
      v1 = accessibilityLocalizedString(CFSTR("scroll.bar.vertical"));
      v2 = v7;
      v7 = v1;

    }
    else if (v6 == 2)
    {
      v3 = accessibilityLocalizedString(CFSTR("scroll.bar.horizontal"));
      v4 = v7;
      v7 = v3;

    }
    v9 = v7;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11[2];
  _UIScrollViewScrollIndicatorAccessibility *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = -[_UIScrollViewScrollIndicatorAccessibility _axBasicDescription]((uint64_t)self);
  v6 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)v12);
  v7 = objc_msgSend(v6, "accessibilityNumberOfPagesForScrollIndicator:", v12);

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = accessibilityLocalizedString(CFSTR("page.count"));
  v5 = (id)objc_msgSend(v8, "localizedStringWithFormat:", v7);
  v2 = (id)__UIAXStringForVariables();
  v3 = v11[0];
  v11[0] = v2;

  v10 = v11[0];
  objc_storeStrong(v11, 0);
  return v10;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  id v4;

  v3 = -[_UIScrollViewScrollIndicatorAccessibility _axBasicDescription]((uint64_t)self);
  v4 = (id)MEMORY[0x2348C3560]();

  return v4;
}

- (id)accessibilityValue
{
  id v3;
  id v4;

  v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  objc_msgSend(v3, "accessibilityProgressForScrollIndicator:", self);
  v4 = (id)AXFormatFloatWithPercentage();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
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
  id v10;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v10 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  objc_msgSend(v10, "accessibilityFrameForScrollIndicator:", self);
  v12 = v2;
  v13 = v3;
  v14 = v4;
  v15 = v5;

  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SEL v21;
  _UIScrollViewScrollIndicatorAccessibility *v22;
  double v23;
  double v24;
  CGPoint result;

  v22 = self;
  v21 = a2;
  v14 = 0;
  objc_opt_class();
  v13 = (id)__UIAccessibilityCastAsClass();
  v12 = v13;
  objc_storeStrong(&v13, 0);
  objc_msgSend(v12, "bounds");
  v15 = v2;
  v16 = v3;
  v17 = v4;
  v18 = v5;
  AX_CGRectGetCenter();
  v19 = v6;
  v20 = v7;
  UIAccessibilityPointForPoint();
  v23 = v8;
  v24 = v9;

  v10 = v23;
  v11 = v24;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)accessibilityIncrement
{
  id v2;

  v2 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  objc_msgSend(v2, "accessibilityScrollIndicator:addProgress:", self, -0.1);

}

- (void)accessibilityDecrement
{
  id v2;

  v2 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  objc_msgSend(v2, "accessibilityScrollIndicator:addProgress:", self, 0.1);

}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v2;

  -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollIndicatorIsFocused:]((uint64_t)self);
  v2 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  objc_msgSend(v2, "accessibilityScrollIndicator:didBecomeFocused:", self, 1);

}

- (void)accessibilityElementDidLoseFocus
{
  id v2;

  -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollIndicatorIsFocused:]((uint64_t)self);
  v2 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  objc_msgSend(v2, "accessibilityScrollIndicator:didBecomeFocused:", self, 0);

}

- (int64_t)_accessibilitySortPriority
{
  return -100;
}

- (BOOL)_accessibilityCanAppearInContextMenuPreview
{
  return 0;
}

@end
