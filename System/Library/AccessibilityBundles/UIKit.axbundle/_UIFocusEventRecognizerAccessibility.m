@implementation _UIFocusEventRecognizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusEventRecognizer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "Q", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusEventRecognizer"), CFSTR("owningView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusEventRecognizer"), CFSTR("_moveWithEvent:"), "B", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIEvent"), CFSTR("_focusHeading"), "Q", 0);
  if ((AXProcessIsPineBoard() & 1) != 0)
    objc_msgSend(location[0], "validateClass:", CFSTR("PBSceneLayoutWindow"));
  objc_storeStrong(location, 0);
}

- (BOOL)_moveWithEvent:(id)a3
{
  unsigned __int8 v4;
  objc_super v5;
  id location[2];
  _UIFocusEventRecognizerAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)_UIFocusEventRecognizerAccessibility;
  v4 = -[_UIFocusEventRecognizerAccessibility _moveWithEvent:](&v5, sel__moveWithEvent_, location[0]);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end
