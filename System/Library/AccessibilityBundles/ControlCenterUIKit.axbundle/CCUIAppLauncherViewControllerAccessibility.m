@implementation CCUIAppLauncherViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIAppLauncherViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIAppLauncherViewController"), CFSTR("CCUIMenuModuleViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIMenuModuleViewController"), CFSTR("CCUIButtonModuleViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIAppLauncherViewController"), CFSTR("module"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIAppLauncherModule"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIAppLauncherModule"), CFSTR("applicationIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIAppLauncherModule"), CFSTR("_application"), "SBFApplication");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIAppLauncherModule"), CFSTR("supportsApplicationShortcuts"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFApplication"), CFSTR("staticApplicationShortcutItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFApplication"), CFSTR("dynamicApplicationShortcutItems"), "@", 0);

}

- (BOOL)_accessibilityControlCenterShouldExpandContentModule
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  -[CCUIAppLauncherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("module"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("supportsApplicationShortcuts"));

  -[CCUIAppLauncherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("module"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeArrayForKey:", CFSTR("staticApplicationShortcutItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 1;
  }
  else
  {
    -[CCUIAppLauncherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_application"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeArrayForKey:", CFSTR("dynamicApplicationShortcutItems"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "count") != 0;

  }
  return v4 & v8;
}

- (id)_accessibilityControlCenterButtonLabel
{
  void *v2;
  void *v3;

  -[CCUIAppLauncherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("module"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("displayName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  void *v2;
  void *v3;

  -[CCUIAppLauncherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("module"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("applicationIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
