@implementation SBCommandTabViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBCommandTabViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBCommandTabViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBCommandTabViewController"), CFSTR("_iconViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBCommandTabViewController"), CFSTR("_selectedIconView"), "SBIconView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCommandTabViewController"), CFSTR("_moveSelectionSquareToIconAtIndex:"), "v", "Q", 0);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCommandTabViewControllerAccessibility;
  -[SBCommandTabViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SBCommandTabViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)SBCommandTabViewControllerAccessibility;
  -[SBCommandTabViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[SBCommandTabViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_accessibilitySetValue:forKey:storageMode:", v11, CFSTR("AXIsInCmdTabSwitcher"), 0);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (void)_moveSelectionSquareToIconAtIndex:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCommandTabViewControllerAccessibility;
  -[SBCommandTabViewControllerAccessibility _moveSelectionSquareToIconAtIndex:](&v4, sel__moveSelectionSquareToIconAtIndex_, a3);
  -[SBCommandTabViewControllerAccessibility accessibilityAnnounceSelectedIcon](self, "accessibilityAnnounceSelectedIcon");
}

- (void)accessibilityAnnounceSelectedIcon
{
  void *v3;
  char v4;
  UIAccessibilityNotifications v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScreenLockedWithPasscode:", 0);

  if ((v4 & 1) == 0)
  {
    -[SBCommandTabViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_selectedIconView"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BDF71E8];
    objc_msgSend(v7, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v5, v6);

  }
}

@end
