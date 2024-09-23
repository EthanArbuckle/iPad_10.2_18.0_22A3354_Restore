@implementation MFTiltedTabViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFTiltedTabView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFTiltedTabView"), CFSTR("_visibleItems"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:", CFSTR("_MFTiltedTabItemView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MFTiltedTabItemView"), CFSTR("borrowedContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFTiltedTabView"), CFSTR("_presented"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MFTiltedTabItemView"), CFSTR("closeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("popToRootViewControllerAnimated:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFTiltedTabViewAccessibility;
  -[MFTiltedTabViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[MFTiltedTabViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visibleItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  v5 = v4;
  AXPerformSafeBlock();

}

void __74__MFTiltedTabViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v14 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "safeValueForKey:", CFSTR("borrowedContentView"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("close.draft.format"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accessibilityValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "safeValueForKey:", CFSTR("closeButton"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAccessibilityLabel:", v10);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v2);
  }

}

- (void)setPresented:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFTiltedTabViewAccessibility;
  -[MFTiltedTabViewAccessibility setPresented:animated:](&v5, sel_setPresented_animated_, a3, a4);
  -[MFTiltedTabViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)accessibilityElements
{
  void *v3;
  objc_super v5;

  if (-[MFTiltedTabViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_presented")))
  {
    v5.receiver = self;
    v5.super_class = (Class)MFTiltedTabViewAccessibility;
    -[MFTiltedTabViewAccessibility accessibilityElements](&v5, sel_accessibilityElements);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  UIView *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect result;

  if (-[MFTiltedTabViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_presented")))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v2 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](v2, "bounds");
    v12 = UIAccessibilityConvertFrameToScreenCoordinates(v11, v2);
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    height = v12.size.height;

  }
  else
  {
    x = *MEMORY[0x24BDBF090];
    y = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

@end
