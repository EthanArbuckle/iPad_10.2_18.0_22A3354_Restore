@implementation PKPaletteHostViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteHostView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaletteHostView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteHostView"), CFSTR("_dockPaletteToPosition:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteHostView"), CFSTR("isPaletteVisible"), "B", 0);

}

- (BOOL)accessibilityElementsHidden
{
  return -[PKPaletteHostViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPaletteVisible")) ^ 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = (id *)MEMORY[0x24BDF74F8];
  v8 = (void *)*MEMORY[0x24BDF74F8];
  v9 = a4;
  objc_msgSend(v8, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXIsHitTestingPKPaletteHostViewKey"));
  v12.receiver = self;
  v12.super_class = (Class)PKPaletteHostViewAccessibility;
  -[PKPaletteHostViewAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, v9, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v7, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXIsHitTestingPKPaletteHostViewKey"));
  return v10;
}

- (void)_dockPaletteToPosition:(int64_t)a3 animated:(BOOL)a4
{
  UIAccessibilityNotifications v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaletteHostViewAccessibility;
  -[PKPaletteHostViewAccessibility _dockPaletteToPosition:animated:](&v8, sel__dockPaletteToPosition_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  v6 = *MEMORY[0x24BDF71E8];
  -[PKPaletteHostViewAccessibility _axToolPaletteLocationAlongEdge:](self, "_axToolPaletteLocationAlongEdge:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v6, v7);

}

- (id)_axToolPaletteLocationAlongEdge:(int64_t)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  accessibilityPencilKitLocalizedString(CFSTR("tool.palette.location.edge.format"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a3 - 1) > 7)
    v5 = CFSTR("tool.palette.location.edge.unknown");
  else
    v5 = off_2502F5DB0[a3 - 1];
  accessibilityPencilKitLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_axToolPaletteLocationAtCorner:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  accessibilityPencilKitLocalizedString(CFSTR("tool.palette.location.corner.format"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPencilKitLocalizedString(CFSTR("tool.palette.location.corner.unknown"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
