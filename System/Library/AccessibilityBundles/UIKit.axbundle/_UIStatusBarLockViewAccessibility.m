@implementation _UIStatusBarLockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarLockView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarLockView"), CFSTR("animateUnlockWithCompletionBlock:"), "v", "@?", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("status.icon.lock"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  _UIStatusBarLockViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarLockViewAccessibility;
  return -[_UIStatusBarLockViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180] | *MEMORY[0x24BEBB0F8];
}

- (void)animateUnlockWithCompletionBlock:(id)a3
{
  _UIStatusBarLockViewAccessibility *v3;
  objc_super v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, char);
  void *v9;
  id v10;
  id location[2];
  _UIStatusBarLockViewAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __70___UIStatusBarLockViewAccessibility_animateUnlockWithCompletionBlock___block_invoke;
  v9 = &unk_24FF40200;
  v10 = location[0];
  v4.receiver = v3;
  v4.super_class = (Class)_UIStatusBarLockViewAccessibility;
  -[_UIStatusBarLockViewAccessibility animateUnlockWithCompletionBlock:](&v4, sel_animateUnlockWithCompletionBlock_);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

@end
