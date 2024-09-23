@implementation _UIPreviewTransitionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPreviewTransitionController");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIPreviewTransitionController"), CFSTR("_layoutForPresentationPhase:"), "v", "Q", 0);
  objc_storeStrong(v4, obj);
}

- (void)_layoutForPresentationPhase:(unint64_t)a3
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  _UIPreviewTransitionControllerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewTransitionControllerAccessibility;
  -[_UIPreviewTransitionControllerAccessibility _layoutForPresentationPhase:](&v3, sel__layoutForPresentationPhase_, a3);
  -[_UIPreviewTransitionControllerAccessibility _axPostNotificationForPhase:]((uint64_t)v6, v4);
}

- (void)_axPostNotificationForPhase:(uint64_t)a1
{
  id location;
  unint64_t v3;
  uint64_t v4;

  v4 = a1;
  v3 = a2;
  if (a1)
  {
    location = 0;
    if (v3 > 1)
    {
      if (v3 - 2 <= 1)
      {
        objc_storeStrong(&location, MEMORY[0x24BDBD1C8]);
      }
      else if (v3 - 4 <= 1)
      {
        objc_storeStrong(&location, MEMORY[0x24BDBD1C0]);
      }
    }
    if (location)
      UIAccessibilityPostNotification(*MEMORY[0x24BEBAFA8], location);
    objc_storeStrong(&location, 0);
  }
}

@end
