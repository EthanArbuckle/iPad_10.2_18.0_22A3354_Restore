@implementation _UIEditMenuListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIEditMenuListView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIEditMenuListView"), CFSTR("_reloadMenuAnimated:"), "v", "B", 0);
  objc_storeStrong(v4, obj);
}

- (void)_reloadMenuAnimated:(BOOL)a3
{
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  _UIEditMenuListViewAccessibility *v8;
  objc_super v9;
  BOOL v10;
  SEL v11;
  _UIEditMenuListViewAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIEditMenuListViewAccessibility;
  -[_UIEditMenuListViewAccessibility _reloadMenuAnimated:](&v9, sel__reloadMenuAnimated_, a3);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __56___UIEditMenuListViewAccessibility__reloadMenuAnimated___block_invoke;
  v7 = &unk_24FF3DA40;
  v8 = v12;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
}

@end
