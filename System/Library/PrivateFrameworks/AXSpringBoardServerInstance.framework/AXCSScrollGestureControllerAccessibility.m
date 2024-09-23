@implementation AXCSScrollGestureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSScrollGestureController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSScrollGestureController"), CFSTR("setScrollingStrategy:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSScrollGestureController"), CFSTR("scrollingStrategy"), "q", 0);

}

- (id)_accessibilitySavedScrollingStrategy
{
  return objc_getAssociatedObject(self, &__CSScrollGestureController___accessibilitySavedScrollingStrategy);
}

- (void)_accessibilitySetSavedScrollingStrategy:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityForcedScrollingStrategy
{
  return objc_getAssociatedObject(self, &__CSScrollGestureController___accessibilityForcedScrollingStrategy);
}

- (void)_accessibilitySetForcedScrollingStrategy:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)setScrollingStrategy:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCSScrollGestureControllerAccessibility _accessibilitySetSavedScrollingStrategy:](self, "_accessibilitySetSavedScrollingStrategy:", v5);

  -[AXCSScrollGestureControllerAccessibility _accessibilityForcedScrollingStrategy](self, "_accessibilityForcedScrollingStrategy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)AXCSScrollGestureControllerAccessibility;
    -[AXCSScrollGestureControllerAccessibility setScrollingStrategy:](&v7, sel_setScrollingStrategy_, a3);
  }

}

- (void)accessibilitySetSystemDashBoardGesturesEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a3;
  -[AXCSScrollGestureControllerAccessibility _accessibilitySavedScrollingStrategy](self, "_accessibilitySavedScrollingStrategy");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    -[AXCSScrollGestureControllerAccessibility _accessibilitySetForcedScrollingStrategy:](self, "_accessibilitySetForcedScrollingStrategy:", 0);
    if (v6)
    {
      v9 = v6;
      AXPerformSafeBlock();

    }
    -[AXCSScrollGestureControllerAccessibility _accessibilitySetSavedScrollingStrategy:](self, "_accessibilitySetSavedScrollingStrategy:", 0);
  }
  else
  {
    if (!v5)
    {
      v7 = -[AXCSScrollGestureControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("scrollingStrategy"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXCSScrollGestureControllerAccessibility _accessibilitySetSavedScrollingStrategy:](self, "_accessibilitySetSavedScrollingStrategy:", v8);

    }
    AXPerformSafeBlock();
    -[AXCSScrollGestureControllerAccessibility _accessibilitySetForcedScrollingStrategy:](self, "_accessibilitySetForcedScrollingStrategy:", &unk_24DDF4EB0);
  }

}

id __91__AXCSScrollGestureControllerAccessibility_accessibilitySetSystemDashBoardGesturesEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(void **)(a1 + 40);
  v2 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  v4.receiver = v1;
  v4.super_class = (Class)AXCSScrollGestureControllerAccessibility;
  return objc_msgSendSuper2(&v4, sel_setScrollingStrategy_, v2);
}

id __91__AXCSScrollGestureControllerAccessibility_accessibilitySetSystemDashBoardGesturesEnabled___block_invoke_2(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)AXCSScrollGestureControllerAccessibility;
  return objc_msgSendSuper2(&v2, sel_setScrollingStrategy_, 3);
}

@end
