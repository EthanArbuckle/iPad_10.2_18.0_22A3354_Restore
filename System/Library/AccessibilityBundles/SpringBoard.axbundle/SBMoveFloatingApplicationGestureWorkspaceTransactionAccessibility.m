@implementation SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBMoveFloatingApplicationGestureWorkspaceTransaction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMoveFloatingApplicationGestureWorkspaceTransaction"), CFSTR("SBFluidSwitcherGestureWorkspaceTransaction"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherGestureWorkspaceTransaction"), CFSTR("handleTransitionRequestForGestureComplete:fromGestureManager:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBSwitcherTransitionRequest"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherTransitionRequest"), CFSTR("floatingConfiguration"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBWorkspaceTransaction"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMoveFloatingApplicationGestureWorkspaceTransaction"), CFSTR("SBWorkspaceTransaction"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceTransaction"), CFSTR("transitionRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBWorkspaceTransitionRequest"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceTransitionRequest"), CFSTR("applicationContext"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"), CFSTR("applicationSceneEntities"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBApplicationSceneEntity"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationSceneEntity"), CFSTR("application"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBApplication"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);

}

- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility;
  v6 = a3;
  -[SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility handleTransitionRequestForGestureComplete:fromGestureManager:](&v16, sel_handleTransitionRequestForGestureComplete_fromGestureManager_, v6, a4);
  v7 = -[SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL");
  v8 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("floatingConfiguration"));

  -[SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility _axDestinationAppName](self, "_axDestinationAppName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v8)
  {
    case 1:
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = CFSTR("app.pip.nib.action.moved.app.left");
      v12 = CFSTR("app.pip.nib.action.moved.app.right");
      goto LABEL_5;
    case 2:
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = CFSTR("app.pip.nib.action.moved.app.right");
      v12 = CFSTR("app.pip.nib.action.moved.app.left");
LABEL_5:
      if (v7)
        v14 = (__CFString *)v12;
      else
        v14 = (__CFString *)v11;
      goto LABEL_10;
    case 3:
      v10 = (void *)MEMORY[0x24BDD17C8];
      v14 = CFSTR("app.pip.nib.action.moved.app.stashed.left");
      goto LABEL_10;
    case 4:
      v10 = (void *)MEMORY[0x24BDD17C8];
      v14 = CFSTR("app.pip.nib.action.moved.app.stashed.right");
LABEL_10:
      accessibilityLocalizedString(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v15, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v13 = 0;
      break;
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v13);

}

- (id)_axDestinationAppName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("transitionRequest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("applicationContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("applicationSceneEntities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v3;
  v19 = v2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v10 = &stru_25036C388;
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "safeValueForKey:", CFSTR("application"), v16, v17, v18, v19, (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "safeStringForKey:", CFSTR("displayName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v14;
        v17 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v10;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16, v14, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v8);
  }
  else
  {
    v10 = &stru_25036C388;
  }

  return v10;
}

@end
