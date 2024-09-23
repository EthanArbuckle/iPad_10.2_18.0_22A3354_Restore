@implementation SafariUIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SafariUIPageControlAccessibility;
  return *MEMORY[0x24BDF73A0] | -[SafariUIPageControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)_accessibilityAdjustInDirection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a3;
  -[SafariUIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentPage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[SafariUIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberOfPages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = 0;
  v10 = v6 - 1;
  if (v3)
    v10 = v6 + 1;
  if ((v10 & 0x8000000000000000) == 0 && v10 < v8)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    AXPerformSafeBlock();
    LastIncrementTime = CFAbsoluteTimeGetCurrent();
    v9 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  return v9;
}

void __68__SafariUIPageControlAccessibility__accessibilityAdjustInDirection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PagedTabExposeView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_scrollView"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  MEMORY[0x234915C7C](*MEMORY[0x24BDF7328]);
  if (*(_BYTE *)(a1 + 48))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v4, "accessibilityScroll:", v3);

}

- (id)accessibilityValue
{
  objc_super v4;

  if (CFAbsoluteTimeGetCurrent() - *(double *)&LastIncrementTime < 0.1)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SafariUIPageControlAccessibility;
  -[SafariUIPageControlAccessibility accessibilityValue](&v4, sel_accessibilityValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)accessibilityIncrement
{
  objc_super v3;

  if (!-[SafariUIPageControlAccessibility _accessibilityAdjustInDirection:](self, "_accessibilityAdjustInDirection:", 1))
  {
    v3.receiver = self;
    v3.super_class = (Class)SafariUIPageControlAccessibility;
    -[SafariUIPageControlAccessibility accessibilityIncrement](&v3, sel_accessibilityIncrement);
  }
}

- (void)accessibilityDecrement
{
  objc_super v3;

  if (!-[SafariUIPageControlAccessibility _accessibilityAdjustInDirection:](self, "_accessibilityAdjustInDirection:", 0))
  {
    v3.receiver = self;
    v3.super_class = (Class)SafariUIPageControlAccessibility;
    -[SafariUIPageControlAccessibility accessibilityDecrement](&v3, sel_accessibilityDecrement);
  }
}

@end
