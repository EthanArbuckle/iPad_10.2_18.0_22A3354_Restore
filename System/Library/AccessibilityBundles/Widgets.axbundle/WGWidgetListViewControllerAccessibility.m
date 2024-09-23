@implementation WGWidgetListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGWidgetListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetListViewController"), CFSTR("_invokeBlockWithPlatterViewsVisibleInBounds:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetListViewController"), CFSTR("_invokeBlockWithPlatterViewsVisibleInRect: block:"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetListViewController"), CFSTR("_scrollViewIfLoaded"), "@", 0);

}

- (void)_invokeBlockWithPlatterViewsVisibleInBounds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  WGWidgetListViewControllerAccessibility *v17;
  id v18;
  uint64_t *v19;
  CGRect v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v21 = 0;
    objc_opt_class();
    -[WGWidgetListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrollViewIfLoaded"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "bounds");
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
      if (!CGRectIsEmpty(v26))
      {
        v27.origin.x = x;
        v27.origin.y = y;
        v27.size.width = width;
        v27.size.height = height;
        v11 = CGRectGetHeight(v27) * -0.5;
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        v29 = CGRectInset(v28, 0.0, v11);
        v13 = MEMORY[0x24BDAC760];
        v14 = 3221225472;
        v15 = __87__WGWidgetListViewControllerAccessibility__invokeBlockWithPlatterViewsVisibleInBounds___block_invoke;
        v16 = &unk_2503E7F38;
        v17 = self;
        v20 = v29;
        v18 = v4;
        v19 = &v22;
        AXPerformSafeBlock();

      }
    }

  }
  if (!*((_BYTE *)v23 + 24))
  {
    v12.receiver = self;
    v12.super_class = (Class)WGWidgetListViewControllerAccessibility;
    -[WGWidgetListViewControllerAccessibility _invokeBlockWithPlatterViewsVisibleInBounds:](&v12, sel__invokeBlockWithPlatterViewsVisibleInBounds_, v4);
  }
  _Block_object_dispose(&v22, 8);

}

uint64_t __87__WGWidgetListViewControllerAccessibility__invokeBlockWithPlatterViewsVisibleInBounds___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_invokeBlockWithPlatterViewsVisibleInRect:block:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

@end
