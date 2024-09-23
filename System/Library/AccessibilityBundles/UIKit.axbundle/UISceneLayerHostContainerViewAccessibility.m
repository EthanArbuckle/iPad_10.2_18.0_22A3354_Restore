@implementation UISceneLayerHostContainerViewAccessibility

void __81___UISceneLayerHostContainerViewAccessibility__rebuildLayersForReason_withFence___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  v5 = a1;
  v4 = a1;
  v3 = 0;
  objc_opt_class();
  v2 = (id)__UIAccessibilityCastAsSafeCategory();
  v1 = v2;
  objc_storeStrong(&v2, 0);
  -[_UIScenePresentationViewAccessibility _accessibilityResetRemoteElementArray](v1);

}

@end
