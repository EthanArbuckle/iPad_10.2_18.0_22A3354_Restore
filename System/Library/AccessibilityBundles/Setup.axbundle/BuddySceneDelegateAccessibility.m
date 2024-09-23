@implementation BuddySceneDelegateAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddySceneDelegate");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("BuddySceneDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddySceneDelegate"), CFSTR("scene:willConnectToSession:options:"), "v", "@", "@", "@", 0);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BuddySceneDelegateAccessibility;
  -[BuddySceneDelegateAccessibility scene:willConnectToSession:options:](&v13, sel_scene_willConnectToSession_options_, v8, v9, v10);
  objc_opt_class();
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BuddyApplicationAndSceneSharedStorage")), "safeValueForKey:", CFSTR("setupController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_accessibilityLoadAccessibilityInformation");
}

@end
