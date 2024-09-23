@implementation UIKeyShortcutHUDServiceAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyShortcutHUDService");
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
  v3 = CFSTR("UIKeyShortcutHUDService");
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("handleKeyboardEvent:"), v4, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("cancelScheduledHUDPresentationIfNeeded"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPhysicalKeyboardEvent"), CFSTR("modifierFlags"), "q", 0);
  objc_storeStrong(v6, obj);
}

- (void)_requestHUDDismissal
{
  objc_super v2;
  SEL v3;
  UIKeyShortcutHUDServiceAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyShortcutHUDServiceAccessibility;
  -[UIKeyShortcutHUDServiceAccessibility _requestHUDDismissal](&v2, sel__requestHUDDismissal);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)handleKeyboardEvent:(id)a3
{
  BOOL v3;
  UIKeyShortcutHUDServiceAccessibility *v4;
  BOOL v5;
  uint64_t v6;
  objc_super v7;
  id location[2];
  UIKeyShortcutHUDServiceAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)UIKeyShortcutHUDServiceAccessibility;
  -[UIKeyShortcutHUDServiceAccessibility handleKeyboardEvent:](&v7, sel_handleKeyboardEvent_, location[0]);
  v6 = objc_msgSend(location[0], "safeIntegerForKey:", CFSTR("modifierFlags"));
  v5 = 0;
  v3 = 1;
  if ((v6 & 0x40000) == 0)
    v3 = (v6 & 0x80000) != 0;
  v5 = v3;
  if ((UIAccessibilityIsVoiceOverRunning() || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0) && v5)
  {
    v4 = v9;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v4, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __60__UIKeyShortcutHUDServiceAccessibility_handleKeyboardEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelScheduledHUDPresentationIfNeeded", a1, a1);
}

@end
