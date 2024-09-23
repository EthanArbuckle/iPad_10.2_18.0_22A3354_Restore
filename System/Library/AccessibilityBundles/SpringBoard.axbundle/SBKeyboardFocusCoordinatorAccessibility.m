@implementation SBKeyboardFocusCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBKeyboardFocusCoordinator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int)_axPrimaryKeyboardFocusOverridePid
{
  return __UIAccessibilityGetAssociatedInt();
}

- (void)_axSetPrimaryKeyboardFocusOverridePid:(int)a3
{
  __UIAccessibilitySetAssociatedInt();
}

- (int)_axSecondaryKeyboardFocusOverridePid
{
  return __UIAccessibilityGetAssociatedInt();
}

- (void)_axSetSecondaryKeyboardFocusOverridePid:(int)a3
{
  __UIAccessibilitySetAssociatedInt();
}

- (id)_axPrimaryKeyboardFocusOverrideSceneID
{
  JUMPOUT(0x23491F7D4);
}

- (void)_axSetPrimaryKeyboardFocusOverrideSceneID:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axSecondaryKeyboardFocusOverrideSceneID
{
  JUMPOUT(0x23491F7D4);
}

- (void)_axSetSecondaryKeyboardFocusOverrideSceneID:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axNativeFocusedApplicationDeferral
{
  JUMPOUT(0x23491F7D4);
}

- (void)_axSetNativeFocusedApplicationDeferral:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axNativeFocusedApplicationDeathWatcher
{
  JUMPOUT(0x23491F7D4);
}

- (void)_axSetNativeFocusedApplicationDeathWatcher:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)_axIsAcquiringSpringBoardDeferral
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsAcquiringSpringBoardDeferral:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_axIsInvalidatingSpringBoardDeferral
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsInvalidatingSpringBoardDeferral:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axSpringBoardDeferral
{
  JUMPOUT(0x23491F7D4);
}

- (void)_axSetSpringBoardDeferral:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBKeyboardFocusCoordinator"), CFSTR("SBKeyboardFocusControlling"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBKeyboardFocusControlling"), CFSTR("userFocusRequestForScene:reason:completion:"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBKeyboardFocusSceneController"), CFSTR("_springBoardFocusLockAssertions"), "BSCompoundAssertion");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBKeyboardFocusCoordinator"), CFSTR("_sceneControllers"), "NSMutableSet");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBKeyboardFocusCoordinator"), CFSTR("focusLockSpringBoardWindowScene:forAccessibilityReason:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBKeyboardFocusCoordinator"), CFSTR("requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBKeyboardFocusCoordinator"), CFSTR("suppressKeyboardFocusEvaluationForReason:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("systemUIScenesCoordinator"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("SBFSceneWorkspaceControlling"), CFSTR("enumerateScenesWithBlock:"), 1, 1);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBSystemUISceneController"), CFSTR("SBFSceneWorkspaceControlling"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBLiveTranscriptionUISceneController"), CFSTR("SBSystemUISceneController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFullKeyboardAccessUISceneController"), CFSTR("SBSystemUISceneController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBAssistiveTouchUISceneController"), CFSTR("SBSystemUISceneController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBAccessibilityUIServerUISceneController"), CFSTR("SBSystemUISceneController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemUIScenesCoordinator"), CFSTR("liveTranscriptionUISceneController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemUIScenesCoordinator"), CFSTR("fullKeyboardAccessUISceneController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemUIScenesCoordinator"), CFSTR("assistiveTouchUISceneController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemUIScenesCoordinator"), CFSTR("accessibilityUIServerUISceneController"), "@", 0);

}

- (void)_accessibilityUserFocusRequestForScene:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformSafeBlock();

}

uint64_t __82__SBKeyboardFocusCoordinatorAccessibility__accessibilityUserFocusRequestForScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userFocusRequestForScene:reason:completion:", *(_QWORD *)(a1 + 40), CFSTR("Accessibility-FKA"), 0);
}

- (void)_accessibilitySetPrimaryKeyboardFocusOverridePid:(int)a3 sceneID:(id)a4
{
  -[SBKeyboardFocusCoordinatorAccessibility _axSetKeyboardFocusPid:sceneID:forPrimaryOverride:](self, "_axSetKeyboardFocusPid:sceneID:forPrimaryOverride:", *(_QWORD *)&a3, a4, 1);
}

- (void)_accessibilitySetSecondaryKeyboardFocusOverridePid:(int)a3 sceneID:(id)a4
{
  -[SBKeyboardFocusCoordinatorAccessibility _axSetKeyboardFocusPid:sceneID:forPrimaryOverride:](self, "_axSetKeyboardFocusPid:sceneID:forPrimaryOverride:", *(_QWORD *)&a3, a4, 0);
}

- (BOOL)_accessibilityIsFocusLockedToSpringBoard
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[SBKeyboardFocusCoordinatorAccessibility safeSetForKey:](self, "safeSetForKey:", CFSTR("_sceneControllers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityIsFocusLockedToSpringBoard__block_invoke;
  v5[3] = &unk_2503682D0;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityIsFocusLockedToSpringBoard__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_springBoardFocusLockAssertions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "reasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ax_filteredSetUsingBlock:", &__block_literal_global_13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "count") != 0;

}

uint64_t __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityIsFocusLockedToSpringBoard__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("Accessibility-FKA")) ^ 1;
}

- (void)_axDeferKeyboardFocusToPid:(int)a3 sceneID:(id)a4 forPrimaryOverride:(BOOL)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  SBKeyboardFocusCoordinatorAccessibility *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  -[SBKeyboardFocusCoordinatorAccessibility _accessibilityTokenStringForPid:sceneID:](self, "_accessibilityTokenStringForPid:sceneID:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__6;
    v29 = __Block_byref_object_dispose__6;
    v30 = 0;
    v11 = MEMORY[0x24BDAC760];
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __97__SBKeyboardFocusCoordinatorAccessibility__axDeferKeyboardFocusToPid_sceneID_forPrimaryOverride___block_invoke;
    v21 = &unk_250367BF0;
    v24 = &v25;
    v22 = self;
    v23 = v9;
    AXPerformSafeBlock();
    v12 = (id)v26[5];

    _Block_object_dispose(&v25, 8);
    -[SBKeyboardFocusCoordinatorAccessibility _axSetNativeFocusedApplicationDeferral:](self, "_axSetNativeFocusedApplicationDeferral:", v12);
    v13 = objc_alloc(MEMORY[0x24BE0BE78]);
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __97__SBKeyboardFocusCoordinatorAccessibility__axDeferKeyboardFocusToPid_sceneID_forPrimaryOverride___block_invoke_2;
    v15[3] = &unk_2503682F8;
    v17 = a5;
    v16 = v6;
    v15[4] = self;
    v14 = (void *)objc_msgSend(v13, "initWithPID:queue:deathHandler:", v6, MEMORY[0x24BDAC9B8], v15);
    -[SBKeyboardFocusCoordinatorAccessibility _axSetNativeFocusedApplicationDeathWatcher:](self, "_axSetNativeFocusedApplicationDeathWatcher:", v14);

  }
  else
  {
    FKALogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SBKeyboardFocusCoordinatorAccessibility _axDeferKeyboardFocusToPid:sceneID:forPrimaryOverride:].cold.1(v6, (uint64_t)v8, v12);
  }

}

void __97__SBKeyboardFocusCoordinatorAccessibility__axDeferKeyboardFocusToPid_sceneID_forPrimaryOverride___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:", *(_QWORD *)(a1 + 40), CFSTR("Accessibility-FKA"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __97__SBKeyboardFocusCoordinatorAccessibility__axDeferKeyboardFocusToPid_sceneID_forPrimaryOverride___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const __CFString *v4;
  void *v5;
  int v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  FKALogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 44))
      v4 = CFSTR("primary");
    else
      v4 = CFSTR("secondary");
    v7 = 138412546;
    v8 = v4;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_232A0A000, v2, OS_LOG_TYPE_INFO, "Reset %@ override for dead native focused application with pid: %i", (uint8_t *)&v7, 0x12u);
  }

  v5 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 44))
    return objc_msgSend(v5, "_accessibilitySetPrimaryKeyboardFocusOverridePid:sceneID:", 0, 0);
  else
    return objc_msgSend(v5, "_accessibilitySetSecondaryKeyboardFocusOverridePid:sceneID:", 0, 0);
}

- (void)_axSetKeyboardFocusPid:(int)a3 sceneID:(id)a4 forPrimaryOverride:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[SBKeyboardFocusCoordinatorAccessibility _axSpringBoardDeferral](self, "_axSpringBoardDeferral");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[SBKeyboardFocusCoordinatorAccessibility _axSetSpringBoardDeferral:](self, "_axSetSpringBoardDeferral:", 0);
  FKALogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("secondary");
    if (v5)
      v11 = CFSTR("primary");
    v13 = 138412546;
    v14 = v11;
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_232A0A000, v10, OS_LOG_TYPE_INFO, "Set %@ keyboard focus override pid: %i", (uint8_t *)&v13, 0x12u);
  }

  if (v5)
  {
    -[SBKeyboardFocusCoordinatorAccessibility _axSetPrimaryKeyboardFocusOverridePid:](self, "_axSetPrimaryKeyboardFocusOverridePid:", v6);
    -[SBKeyboardFocusCoordinatorAccessibility _axSetPrimaryKeyboardFocusOverrideSceneID:](self, "_axSetPrimaryKeyboardFocusOverrideSceneID:", v8);
    goto LABEL_11;
  }
  -[SBKeyboardFocusCoordinatorAccessibility _axSetSecondaryKeyboardFocusOverridePid:](self, "_axSetSecondaryKeyboardFocusOverridePid:", v6);
  -[SBKeyboardFocusCoordinatorAccessibility _axSetSecondaryKeyboardFocusOverrideSceneID:](self, "_axSetSecondaryKeyboardFocusOverrideSceneID:", v8);
  if (!-[SBKeyboardFocusCoordinatorAccessibility _axPrimaryKeyboardFocusOverridePid](self, "_axPrimaryKeyboardFocusOverridePid"))
  {
LABEL_11:
    -[SBKeyboardFocusCoordinatorAccessibility _axClearKeyboardFocusOverrideDeferral](self, "_axClearKeyboardFocusOverrideDeferral");
    if ((_DWORD)v6)
      -[SBKeyboardFocusCoordinatorAccessibility _axDeferKeyboardFocusToPid:sceneID:forPrimaryOverride:](self, "_axDeferKeyboardFocusToPid:sceneID:forPrimaryOverride:", v6, v8, v5);
    goto LABEL_13;
  }
  FKALogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_232A0A000, v12, OS_LOG_TYPE_INFO, "Not updating deferral, because the primary keyboard focus override was in effect.", (uint8_t *)&v13, 2u);
  }

LABEL_13:
}

- (id)_accessibilityTokenStringForPid:(int)a3 sceneID:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v19 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  v30 = 0;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("systemUIScenesCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v4, "safeValueForKey:", CFSTR("liveTranscriptionUISceneController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("fullKeyboardAccessUISceneController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("assistiveTouchUISceneController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityUIServerUISceneController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v22;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v13)
        objc_enumerationMutation(v11);
      v20 = v19;
      AXPerformSafeBlock();
      v15 = v26[5] == 0;

      if (!v15)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

  v16 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityTokenStringForPid_sceneID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  int v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityTokenStringForPid_sceneID___block_invoke_2;
  v5[3] = &unk_250368320;
  v8 = *(_DWORD *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateScenesWithBlock:", v5);

}

void __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityTokenStringForPid_sceneID___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "clientHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "pid") == *(_DWORD *)(a1 + 48))
  {
    objc_msgSend(v14, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    v9 = v14;
    if (v8)
    {
      objc_msgSend(v14, "identityToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringRepresentation");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v9 = v14;
      *a3 = 1;
    }
  }
  else
  {

    v9 = v14;
  }

}

- (void)_axClearKeyboardFocusOverrideDeferral
{
  void *v3;
  void *v4;

  -[SBKeyboardFocusCoordinatorAccessibility _axNativeFocusedApplicationDeferral](self, "_axNativeFocusedApplicationDeferral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBKeyboardFocusCoordinatorAccessibility _axSetNativeFocusedApplicationDeferral:](self, "_axSetNativeFocusedApplicationDeferral:", 0);
  -[SBKeyboardFocusCoordinatorAccessibility _axNativeFocusedApplicationDeathWatcher](self, "_axNativeFocusedApplicationDeathWatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SBKeyboardFocusCoordinatorAccessibility _axSetNativeFocusedApplicationDeathWatcher:](self, "_axSetNativeFocusedApplicationDeathWatcher:", 0);
}

- (void)_accessibilityFocusOnSpringBoardWithSceneID:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[12];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  -[SBKeyboardFocusCoordinatorAccessibility _axClearKeyboardFocusOverrideDeferral](self, "_axClearKeyboardFocusOverrideDeferral");
  -[SBKeyboardFocusCoordinatorAccessibility _axSpringBoardDeferral](self, "_axSpringBoardDeferral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[SBKeyboardFocusCoordinatorAccessibility _axSetSpringBoardDeferral:](self, "_axSetSpringBoardDeferral:", 0);
  v6 = (id *)MEMORY[0x24BDF74F8];
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityMainWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  v9 = v8;
  v32 = v9;
  v10 = objc_msgSend(v4, "length");
  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    objc_msgSend(*v6, "safeArrayForKey:", CFSTR("_accessibilityFocusableScenes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke;
    v24[3] = &unk_250367D50;
    v25 = v4;
    v26 = &v27;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v24);

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v17[5] = v11;
  v17[6] = 3221225472;
  v17[7] = __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke_2;
  v17[8] = &unk_250368370;
  v17[9] = self;
  v17[10] = &v18;
  v17[11] = &v27;
  AXPerformSafeBlock();
  v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  -[SBKeyboardFocusCoordinatorAccessibility _axSetSpringBoardDeferral:](self, "_axSetSpringBoardDeferral:", v13);
  v14 = (id)v28[5];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  LOBYTE(v21) = 0;
  AXFrontBoardRunningAppProcesses();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke_3;
  v17[3] = &unk_250368398;
  v17[4] = &v18;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v17);
  if (!*((_BYTE *)v19 + 24) && v9 == v14)
  {
    -[SBKeyboardFocusCoordinatorAccessibility _axSpringBoardDeferral](self, "_axSpringBoardDeferral");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    -[SBKeyboardFocusCoordinatorAccessibility _axSetSpringBoardDeferral:](self, "_axSetSpringBoardDeferral:", 0);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v27, 8);

}

void __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;

  v7 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_sceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "focusLockSpringBoardWindowScene:forAccessibilityReason:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("Accessibility-FKA"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isSystemApplicationProcess") & 1) == 0)
  {
    if (objc_msgSend(v5, "isApplicationProcess"))
    {
      if (objc_msgSend(v5, "isForeground"))
      {
        objc_msgSend(v5, "state");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "taskState");

        if (v4 == 2)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      }
    }
  }

}

- (void)_accessibilityFocusOnAppWithPid:(int)a3 bundleIdentifier:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  FKALogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 1024;
    v17 = a3;
    _os_log_impl(&dword_232A0A000, v10, OS_LOG_TYPE_INFO, "Focusing on app with bundle identifier: %@, pid: %i", (uint8_t *)&v14, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BE38100], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneWithIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SBKeyboardFocusCoordinatorAccessibility _accessibilityUserFocusRequestForScene:](self, "_accessibilityUserFocusRequestForScene:", v12);
  }
  else
  {
    FKALogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoordinatorAccessibility _accessibilityFocusOnAppWithPid:bundleIdentifier:identifier:].cold.1((uint64_t)v9, v13);

  }
}

- (BOOL)_accessibilitySwitchNativeFocusedApplicationWithPID:(int)a3 identifier:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  int v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SBKeyboardFocusCoordinatorAccessibility suppressKeyboardFocusEvaluationForReason:](self, "suppressKeyboardFocusEvaluationForReason:", CFSTR("Accessibility-FKA"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXFrontBoardRunningAppProcesses();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __106__SBKeyboardFocusCoordinatorAccessibility__accessibilitySwitchNativeFocusedApplicationWithPID_identifier___block_invoke;
  v16[3] = &__block_descriptor_36_e19_B16__0__FBProcess_8l;
  v17 = v4;
  objc_msgSend(v8, "ax_firstObjectUsingBlock:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isSystemApplicationProcess"))
  {
    FKALogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232A0A000, v10, OS_LOG_TYPE_INFO, "Switching to system application", buf, 2u);
    }

    -[SBKeyboardFocusCoordinatorAccessibility _accessibilitySetSecondaryKeyboardFocusOverridePid:sceneID:](self, "_accessibilitySetSecondaryKeyboardFocusOverridePid:sceneID:", 0, 0);
    -[SBKeyboardFocusCoordinatorAccessibility _accessibilityFocusOnSpringBoardWithSceneID:](self, "_accessibilityFocusOnSpringBoardWithSceneID:", v6);
LABEL_14:
    v11 = 1;
    goto LABEL_15;
  }
  if (!objc_msgSend(v9, "isApplicationProcess"))
  {
    FKALogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v4;
      _os_log_impl(&dword_232A0A000, v12, OS_LOG_TYPE_INFO, "Switching to non-application %i", buf, 8u);
    }

    -[SBKeyboardFocusCoordinatorAccessibility _accessibilitySetSecondaryKeyboardFocusOverridePid:sceneID:](self, "_accessibilitySetSecondaryKeyboardFocusOverridePid:sceneID:", v4, v6);
    goto LABEL_14;
  }
  if (!-[SBKeyboardFocusCoordinatorAccessibility _accessibilityIsFocusLockedToSpringBoard](self, "_accessibilityIsFocusLockedToSpringBoard"))
  {
    FKALogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_232A0A000, v13, OS_LOG_TYPE_INFO, "Switching to regular application %@", buf, 0xCu);
    }

    -[SBKeyboardFocusCoordinatorAccessibility _accessibilitySetSecondaryKeyboardFocusOverridePid:sceneID:](self, "_accessibilitySetSecondaryKeyboardFocusOverridePid:sceneID:", 0, 0);
    objc_msgSend(v9, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoordinatorAccessibility _accessibilityFocusOnAppWithPid:bundleIdentifier:identifier:](self, "_accessibilityFocusOnAppWithPid:bundleIdentifier:identifier:", v4, v14, v6);

    goto LABEL_14;
  }
  v11 = 0;
LABEL_15:
  objc_msgSend(v7, "invalidate");

  return v11;
}

BOOL __106__SBKeyboardFocusCoordinatorAccessibility__accessibilitySwitchNativeFocusedApplicationWithPID_identifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pid") == *(_DWORD *)(a1 + 32);
}

- (void)_axDeferKeyboardFocusToPid:(uint64_t)a1 sceneID:(uint64_t)a2 forPrimaryOverride:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_232A0A000, a3, OS_LOG_TYPE_DEBUG, "Found nil tokenString for pid: %@ sceneID: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_accessibilityFocusOnAppWithPid:(uint64_t)a1 bundleIdentifier:(NSObject *)a2 identifier:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232A0A000, a2, OS_LOG_TYPE_ERROR, "No scene available, can't focus on app %@", (uint8_t *)&v2, 0xCu);
}

@end
