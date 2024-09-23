@implementation BKUIPearlInstructionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIPearlInstructionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlInstructionView"), CFSTR("setDetail:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlInstructionView"), CFSTR("instruction"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlInstructionView"), CFSTR("instructionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlInstructionView"), CFSTR("detailLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlInstructionView"), CFSTR("_detail"), "NSString");

}

- (id)_axNavigationControllerParent
{
  void *v2;
  void *v3;
  void *v4;

  -[BKUIPearlInstructionViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __70__BKUIPearlInstructionViewAccessibility__axNavigationControllerParent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setDetail:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  UIAccessibilityNotifications v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  -[BKUIPearlInstructionViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_detail"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)BKUIPearlInstructionViewAccessibility;
    -[BKUIPearlInstructionViewAccessibility setDetail:](&v14, sel_setDetail_, v4);
  }
  else
  {
    v6 = objc_msgSend(v4, "length");
    v14.receiver = self;
    v14.super_class = (Class)BKUIPearlInstructionViewAccessibility;
    -[BKUIPearlInstructionViewAccessibility setDetail:](&v14, sel_setDetail_, v4);
    if (v6)
    {
      -[BKUIPearlInstructionViewAccessibility _axNavigationControllerParent](self, "_axNavigationControllerParent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "_isTransitioning"))
      {

      }
      else
      {
        -[BKUIPearlInstructionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("detailLabel"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v4);
      }
    }
  }
  -[BKUIPearlInstructionViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("instruction"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v4 && v5 && v10)
  {
    v12 = *MEMORY[0x24BDF72C8];
    -[BKUIPearlInstructionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("instructionLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v12, v13);

  }
}

@end
