@implementation UIEditingOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIEditingOverlayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIEditingOverlayViewController"), CFSTR("undoInteraction"), "@", 0);
  v4 = "B";
  v3 = CFSTR("UIUndoGestureInteraction");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("currentInteractiveHUDVisible"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)accessibilityPerformEscape
{
  char v3;
  id v4;
  char v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UIEditingOverlayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("undoInteraction"));
  v5 = objc_msgSend(v6[0], "safeBoolForKey:", CFSTR("currentInteractiveHUDVisible")) & 1;
  if (v5)
  {
    v4 = v6[0];
    AXPerformSafeBlock();
    objc_storeStrong(&v4, 0);
  }
  v3 = v5;
  objc_storeStrong(v6, 0);
  return v3 & 1;
}

uint64_t __73__UIEditingOverlayViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUndoInteractiveHUDVisibility:", 0, a1, a1);
}

@end
