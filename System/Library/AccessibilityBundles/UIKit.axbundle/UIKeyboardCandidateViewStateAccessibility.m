@implementation UIKeyboardCandidateViewStateAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardCandidateViewState");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardCandidateViewState"), CFSTR("setArrowButtonPosition:"), "v", "q", 0);
  objc_storeStrong(v4, obj);
}

- (void)setArrowButtonPosition:(int64_t)a3
{
  id v3;
  char IsPad;
  objc_super v5;
  int64_t v6;
  SEL v7;
  UIKeyboardCandidateViewStateAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v3 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  IsPad = 0;
  if ((objc_msgSend(v3, "accessibilityUsesExtendedKeyboardPredictionsEnabled") & 1) != 0)
    IsPad = AXDeviceIsPad();

  if ((IsPad & 1) != 0)
    v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UIKeyboardCandidateViewStateAccessibility;
  -[UIKeyboardCandidateViewStateAccessibility setArrowButtonPosition:](&v5, sel_setArrowButtonPosition_, v6);
}

@end
