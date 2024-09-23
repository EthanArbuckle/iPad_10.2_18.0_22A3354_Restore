@implementation _UIKeyShortcutHUDViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIKeyShortcutHUDViewController");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("toolbarVC"), v4, 0);
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("setHidden:completionHandler:"), "B", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIKeyShortcutHUDToolbarViewController"), CFSTR("searchButton"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIKeyShortcutHUDServer"), CFSTR("_dismissHUD"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (BOOL)accessibilityPerformEscape
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v7 = 0;
  v3 = (id)-[_UIKeyShortcutHUDViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v6 = (id)__UIAccessibilitySafeClass();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  v4 = v5;
  AXPerformSafeBlock();
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v8, 0);
  return 1;
}

- (void)setHidden:(BOOL)a3 completionHandler:(id)a4
{
  _UIKeyShortcutHUDViewControllerAccessibility *v4;
  BOOL v5;
  objc_super v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  BOOL v13;
  id location;
  BOOL v15;
  SEL v16;
  _UIKeyShortcutHUDViewControllerAccessibility *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v17;
  v5 = v15;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __76___UIKeyShortcutHUDViewControllerAccessibility_setHidden_completionHandler___block_invoke;
  v11 = &unk_24FF3DD98;
  v12 = location;
  v13 = v15;
  v6.receiver = v4;
  v6.super_class = (Class)_UIKeyShortcutHUDViewControllerAccessibility;
  -[_UIKeyShortcutHUDViewControllerAccessibility setHidden:completionHandler:](&v6, sel_setHidden_completionHandler_, v5);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

@end
