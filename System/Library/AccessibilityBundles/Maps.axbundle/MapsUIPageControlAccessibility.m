@implementation MapsUIPageControlAccessibility

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
  objc_msgSend(v3, "validateClass:", CFSTR("SteppingPageViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SteppingPageViewController"), CFSTR("setSignIndex: animated:"), "v", "q", "B", 0);

}

- (BOOL)_axScrollSteppingPageViewForward:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v3 = a3;
  -[MapsUIPageControlAccessibility superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349135AC](CFSTR("SteppingPageViewController"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v8 = -[MapsUIPageControlAccessibility currentPage](self, "currentPage");
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceLayoutDirection") == 1)
      v10 = -1;
    else
      v10 = 1;

    if (v3)
      v11 = v10;
    else
      v11 = -v10;
    if (v11 + v8 >= 0 && v11 + v8 < -[MapsUIPageControlAccessibility numberOfPages](self, "numberOfPages"))
    {
      v13 = v6;
      AXPerformSafeBlock();
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);

    }
  }

  return isKindOfClass & 1;
}

uint64_t __67__MapsUIPageControlAccessibility__axScrollSteppingPageViewForward___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSignIndex:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (void)accessibilityIncrement
{
  objc_super v3;

  if (!-[MapsUIPageControlAccessibility _axScrollSteppingPageViewForward:](self, "_axScrollSteppingPageViewForward:", 1))
  {
    v3.receiver = self;
    v3.super_class = (Class)MapsUIPageControlAccessibility;
    -[MapsUIPageControlAccessibility accessibilityIncrement](&v3, sel_accessibilityIncrement);
  }
}

- (void)accessibilityDecrement
{
  objc_super v3;

  if (!-[MapsUIPageControlAccessibility _axScrollSteppingPageViewForward:](self, "_axScrollSteppingPageViewForward:", 0))
  {
    v3.receiver = self;
    v3.super_class = (Class)MapsUIPageControlAccessibility;
    -[MapsUIPageControlAccessibility accessibilityDecrement](&v3, sel_accessibilityDecrement);
  }
}

@end
