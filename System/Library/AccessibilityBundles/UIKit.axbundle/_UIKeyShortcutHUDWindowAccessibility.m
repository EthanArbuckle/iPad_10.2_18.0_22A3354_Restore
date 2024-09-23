@implementation _UIKeyShortcutHUDWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDWindow");
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
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)makeKeyAndVisible
{
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(uint64_t);
  void *v6;
  _UIKeyShortcutHUDWindowAccessibility *v7;
  objc_super v8;
  SEL v9;
  _UIKeyShortcutHUDWindowAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyShortcutHUDWindowAccessibility;
  -[_UIKeyShortcutHUDWindowAccessibility makeKeyAndVisible](&v8, sel_makeKeyAndVisible);
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __57___UIKeyShortcutHUDWindowAccessibility_makeKeyAndVisible__block_invoke;
  v6 = &unk_24FF3DA40;
  v7 = v10;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v7, 0);
}

@end
