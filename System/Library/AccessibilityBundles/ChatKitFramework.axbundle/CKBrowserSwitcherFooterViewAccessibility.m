@implementation CKBrowserSwitcherFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKBrowserSwitcherFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserSwitcherFooterView"), CFSTR("adjustMagnificationAtPoint:minifyImmediately:"), "v", "{CGPoint=dd}", "B", 0);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.store.collection.view.text"));
}

- (void)adjustMagnificationAtPoint:(CGPoint)a3 minifyImmediately:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  objc_super v8;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v8.receiver = self;
    v8.super_class = (Class)CKBrowserSwitcherFooterViewAccessibility;
    -[CKBrowserSwitcherFooterViewAccessibility adjustMagnificationAtPoint:minifyImmediately:](&v8, sel_adjustMagnificationAtPoint_minifyImmediately_, v4, x, y);
  }
}

@end
