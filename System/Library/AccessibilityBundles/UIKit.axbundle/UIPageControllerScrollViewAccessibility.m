@implementation UIPageControllerScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageControllerScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityScrollAnimationDurationDelay
{
  return 0.449999988;
}

- (void)_accessibilitySendScrollStatus
{
  id argument;
  id v3[3];

  v3[2] = self;
  v3[1] = (id)a2;
  v3[0] = -[UIPageControllerScrollViewAccessibility _accessibilityScrollStatus](self, "_accessibilityScrollStatus");
  argument = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v3[0]);
  objc_msgSend(argument, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEF18]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(v3, 0);
}

- (double)_accessibilityScrollWidthDistance
{
  double v2;

  -[UIPageControllerScrollViewAccessibility visibleBounds](self, "visibleBounds", 0, 0, 0, 0, a2, self);
  return v2;
}

- (double)_accessibilityScrollHeightDistance
{
  double v2;

  -[UIPageControllerScrollViewAccessibility visibleBounds](self, "visibleBounds", 0, 0, 0, 0, a2, self);
  return v2;
}

- (id)_accessibilityScrollStatus
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  objc_super v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id location[2];
  UIPageControllerScrollViewAccessibility *v16;
  id v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIPageControllerScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pageController"));
  if (location[0])
  {
    v3 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("visibleIndex"));
    v4 = objc_msgSend(v3, "integerValue");

    v14 = v4;
    v5 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("pageCount"));
    v6 = objc_msgSend(v5, "integerValue");

    v13 = v6;
    v7 = (void *)MEMORY[0x24BDD17C8];
    v10 = accessibilityLocalizedString(CFSTR("scroll.page.summary"));
    v9 = (id)AXFormatInteger();
    v8 = (id)AXFormatInteger();
    v17 = (id)objc_msgSend(v7, "stringWithFormat:", v10, v9, v8);

  }
  else
  {
    v11.receiver = v16;
    v11.super_class = (Class)UIPageControllerScrollViewAccessibility;
    v17 = -[UIPageControllerScrollViewAccessibility _accessibilityScrollStatus](&v11, sel__accessibilityScrollStatus);
  }
  v12 = 1;
  objc_storeStrong(location, 0);
  return v17;
}

@end
