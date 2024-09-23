@implementation MTATimerPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATimerPickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerPickerCell"), CFSTR("picker"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerPickerCell"), CFSTR("timeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerPickerCell"), CFSTR("setState:animated:"), "v", "Q", "B", 0);

}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTATimerPickerCellAccessibility;
  -[MTATimerPickerCellAccessibility setState:animated:](&v10, sel_setState_animated_, a3, a4);
  -[MTATimerPickerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("picker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTATimerPickerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 1 <= 2)
  {
    v8 = ((_BYTE)a3 - 1) & 7;
    v9 = (6u >> v8) & 1;
    objc_msgSend(v6, "setIsAccessibilityElement:", v8 == 0);
    objc_msgSend(v7, "setIsAccessibilityElement:", v9);
  }
  AXPerformSafeBlock();

}

uint64_t __53__MTATimerPickerCellAccessibility_setState_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityClearChildren");
}

@end
