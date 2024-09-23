@implementation BKUIPearlEnrollControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIPearlEnrollController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlInstructionView"), CFSTR("instructionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollController"), CFSTR("coachingController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlCoachingController"), CFSTR("instructionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollController"), CFSTR("enrollViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("_instructionView"), "BKUIPearlInstructionView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollController"), CFSTR("setCoachingHidden:animated:"), "v", "B", "B", 0);

}

- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlEnrollControllerAccessibility;
  -[BKUIPearlEnrollControllerAccessibility setCoachingHidden:animated:](&v11, sel_setCoachingHidden_animated_, a3, a4);
  objc_opt_class();
  -[BKUIPearlEnrollControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("enrollViewController.view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(v7, "setAccessibilityElementsHidden:", 0);
    objc_opt_class();
    v8 = CFSTR("enrollViewController.instructionView.instructionLabel");
  }
  else
  {
    objc_msgSend(v7, "setAccessibilityElementsHidden:", 1);
    objc_opt_class();
    v8 = CFSTR("coachingController.instructionView.instructionLabel");
  }
  -[BKUIPearlEnrollControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v10);

}

@end
