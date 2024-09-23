@implementation PXGPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXGPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXGPageControl"), CFSTR("_pageControl"), "UIPageControl");
}

- (id)_axPageControl
{
  return (id)-[PXGPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pageControl"));
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[PXGPageControlAccessibility _axPageControl](self, "_axPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (int64_t)_accessibilityPageCount
{
  void *v2;
  int64_t v3;

  -[PXGPageControlAccessibility _axPageControl](self, "_axPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityPageCount");

  return v3;
}

- (int64_t)_accessibilityPageIndex
{
  void *v2;
  int64_t v3;

  -[PXGPageControlAccessibility _axPageControl](self, "_axPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityPageIndex");

  return v3;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[PXGPageControlAccessibility _axPageControl](self, "_axPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccessibilityElement");

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PXGPageControlAccessibility _axPageControl](self, "_axPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PXGPageControlAccessibility _axPageControl](self, "_axPageControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessibilityIncrement
{
  id v2;

  -[PXGPageControlAccessibility _axPageControl](self, "_axPageControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

}

- (void)accessibilityDecrement
{
  id v2;

  -[PXGPageControlAccessibility _axPageControl](self, "_axPageControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

}

@end
