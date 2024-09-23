@implementation _UISceneLayerHostContainerViewAccessibility

- (void)_rebuildLayersForReason:(id)a3 withFence:(id)a4
{
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  objc_super v12;
  id v13;
  id location[2];
  _UISceneLayerHostContainerViewAccessibility *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12.receiver = v15;
  v12.super_class = (Class)_UISceneLayerHostContainerViewAccessibility;
  -[_UISceneLayerHostContainerViewAccessibility _rebuildLayersForReason:withFence:](&v12, sel__rebuildLayersForReason_withFence_, location[0], v13);
  v11 = (id)-[_UISceneLayerHostContainerViewAccessibility _accessibilityAncestorIsKindOf:](v15, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIScenePresentationView")));
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __81___UISceneLayerHostContainerViewAccessibility__rebuildLayersForReason_withFence___block_invoke;
  v9 = &unk_24FF3DA40;
  v10 = v11;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISceneLayerHostContainerView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISceneLayerHostContainerView"), CFSTR("_rebuildLayersForReason:withFence:"), "v", "@", "@", 0);
  objc_storeStrong(v4, obj);
}

@end
