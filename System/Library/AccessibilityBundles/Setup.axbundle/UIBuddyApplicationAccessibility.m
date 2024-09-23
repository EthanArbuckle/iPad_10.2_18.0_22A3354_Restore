@implementation UIBuddyApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SetupController"), CFSTR("navigationFlowController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyNavigationFlowController"), CFSTR("buddyControllers"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BuddyFinishedController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyFinishedController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("BFFFlowItemDelegate"), CFSTR("flowItemDone:"), 1, 1);
  objc_msgSend(v3, "validateClass:", CFSTR("BuddyApplicationAndSceneSharedStorage"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BuddyApplicationAndSceneSharedStorage"), CFSTR("setupController"), "@", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.name"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIBuddyApplicationAccessibility;
  -[UIBuddyApplicationAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  if (-[UIBuddyApplicationAccessibility _accessibilityCanRequestSetupControllerSafely](self, "_accessibilityCanRequestSetupControllerSafely"))
  {
    objc_opt_class();
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BuddyApplicationAndSceneSharedStorage")), "safeValueForKey:", CFSTR("setupController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");
  }
}

- (BOOL)_accessibilityFinishSetupIfAppropriate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!-[UIBuddyApplicationAccessibility _accessibilityCanRequestSetupControllerSafely](self, "_accessibilityCanRequestSetupControllerSafely"))return 0;
  LOBYTE(v10) = 0;
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BuddyApplicationAndSceneSharedStorage")), "safeValueForKey:", CFSTR("setupController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("navigationFlowController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("buddyControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("BuddyFinishedController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9 = v6;
    AXPerformSafeBlock();
    v7 = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __73__UIBuddyApplicationAccessibility__accessibilityFinishSetupIfAppropriate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowItemDone:", *(_QWORD *)(a1 + 32));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)_accessibilityCanRequestSetupControllerSafely
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char isKindOfClass;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "connectedScenes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          NSClassFromString(CFSTR("BuddySceneDelegate"));
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v10 = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 4019)
    return -[UIBuddyApplicationAccessibility _accessibilityFinishSetupIfAppropriate](self, "_accessibilityFinishSetupIfAppropriate", *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
  v9 = v5;
  v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)UIBuddyApplicationAccessibility;
  return -[UIBuddyApplicationAccessibility _iosAccessibilityPerformAction:withValue:fencePort:](&v8, sel__iosAccessibilityPerformAction_withValue_fencePort_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

@end
