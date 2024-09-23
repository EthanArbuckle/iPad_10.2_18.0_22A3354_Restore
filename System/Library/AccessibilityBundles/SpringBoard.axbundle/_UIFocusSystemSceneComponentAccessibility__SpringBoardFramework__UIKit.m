@implementation _UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit

- (id)focusSystem
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem")&& -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit _axIsSystemApertureSceneComponent](self, "_axIsSystemApertureSceneComponent"))
  {
    -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit _axSpringBoardMainWindowScene](self, "_axSpringBoardMainWindowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit;
    -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit focusSystem](&v6, sel_focusSystem);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  void *v2;
  char v3;

  -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("_windowScene"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsFKARunningForFocusItem");

  return v3;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusSystemSceneComponent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusSystemSceneComponent"), CFSTR("focusItemsInRect:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusSystemSceneComponent"), CFSTR("_windowScene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusSystemSceneComponent"), CFSTR("focusSystem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_preferredFocusedWindowScene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplicationAccessibility"), CFSTR("_accessibilityActiveScenes"), "@", 0);

}

- (id)focusItemsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit;
  -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit focusItemsInRect:](&v12, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem")&& -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit _axIsSpringBoardMainSceneComponent](self, "_axIsSpringBoardMainSceneComponent"))
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeArrayForKey:", CFSTR("_accessibilityActiveScenes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axFirstObjectsUsingBlock:", &__block_literal_global_7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_accessibilityTraversalWindows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayWithPossiblyNilArrays:", 2, v4, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (id)_axSpringBoardMainWindowScene
{
  void *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeArrayForKey:", CFSTR("_accessibilityActiveScenes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axFirstObjectsUsingBlock:", &__block_literal_global_206);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsSpringBoardMainSceneComponent
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("_windowScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.springboard"));

  return (char)v3;
}

- (BOOL)_axIsSystemApertureSceneComponent
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("_windowScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isEqualToString:", CFSTR("SystemAperture"));

  return (char)v3;
}

@end
