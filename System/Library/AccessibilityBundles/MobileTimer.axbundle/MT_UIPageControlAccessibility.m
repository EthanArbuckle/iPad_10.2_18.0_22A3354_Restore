@implementation MT_UIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("pagingViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchPagingViewController"), CFSTR("currentPage"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchPagingViewController"), CFSTR("pages"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchPagingViewController"), CFSTR("setCurrentPage:"), "v", "Q", 0);

}

- (id)_axPagingController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MT_UIPageControlAccessibility superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("pagingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_axStopWatchAdjustPage:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[MT_UIPageControlAccessibility _axPagingController](self, "_axPagingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("currentPage"));
  objc_msgSend(v3, "safeValueForKey:", CFSTR("pages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "count");
  v7 = v3;
  v6 = v3;
  AXPerformSafeBlock();

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MT_UIPageControlAccessibility;
  -[MT_UIPageControlAccessibility accessibilityValue](&v11, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MT_UIPageControlAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("StopWatchPageControl"));

  if (v5)
  {
    -[MT_UIPageControlAccessibility _axPagingController](self, "_axPagingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("currentPage")))
      v7 = CFSTR("analog.stopwatch.description");
    else
      v7 = CFSTR("digital.stopwatch.description");
    accessibilityLocalizedString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  return v3;
}

- (void)accessibilityDecrement
{
  void *v3;
  int v4;
  objc_super v5;

  -[MT_UIPageControlAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("StopWatchPageControl"));

  if (v4)
    -[MT_UIPageControlAccessibility _axStopWatchAdjustPage:](self, "_axStopWatchAdjustPage:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MT_UIPageControlAccessibility;
  -[MT_UIPageControlAccessibility accessibilityDecrement](&v5, sel_accessibilityDecrement);
}

- (void)accessibilityIncrement
{
  void *v3;
  int v4;
  objc_super v5;

  -[MT_UIPageControlAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("StopWatchPageControl"));

  if (v4)
    -[MT_UIPageControlAccessibility _axStopWatchAdjustPage:](self, "_axStopWatchAdjustPage:", 1);
  v5.receiver = self;
  v5.super_class = (Class)MT_UIPageControlAccessibility;
  -[MT_UIPageControlAccessibility accessibilityIncrement](&v5, sel_accessibilityIncrement);
}

@end
