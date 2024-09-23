@implementation AppStoreApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.AppStoreApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("BridgeStoreExtension.ActivityViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BridgeStoreExtension.ActivityViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("BridgeStoreExtension.AppDelegate"), CFSTR("tabBarController"), "Optional<FlowTabBarController>");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BridgeStoreExtension.FlowTabBarController"), CFSTR("UITabBarController"));

}

- (id)_accessibilityFirstElementForFocus
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;

  accessibilityAppStorePrefixForTarget();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppStoreApplicationAccessibility _axVisibleViewController](self, "_axVisibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".ActivityViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490950C]();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "safeUIViewForKey:", CFSTR("view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityFirstDescendant");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppStoreApplicationAccessibility _accessibilityFirstElementForFocusWithOptions:](self, "_accessibilityFirstElementForFocusWithOptions:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_axVisibleViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("tabBarController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("selectedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "presentedViewController"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_msgSend(v7, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
