@implementation SBCommandTabControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBCommandTabController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBSceneManagerCoordinator"));
  objc_msgSend(v3, "validateClass:", CFSTR("FBDisplayManager"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSceneManagerCoordinator"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("FBDisplayManager"), CFSTR("mainIdentity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManagerCoordinator"), CFSTR("sceneManagerForDisplayIdentity:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("externalForegroundApplicationSceneHandles"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCommandTabController"), CFSTR("_activateWithForwardDirection:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBCommandTabController"), CFSTR("_commandTabViewController"), "SBCommandTabViewController");

}

- (void)_activateWithForwardDirection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  objc_super v21;

  v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBCommandTabControllerAccessibility;
  -[SBCommandTabControllerAccessibility _activateWithForwardDirection:](&v21, sel__activateWithForwardDirection_);
  if (v3)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSceneManagerCoordinator")), "safeValueForKey:", CFSTR("sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("FBDisplayManager")), "safeValueForKey:", CFSTR("mainIdentity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    v20 = 0;
    v7 = v5;
    v8 = v6;
    AXPerformSafeBlock();
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    LOBYTE(v15) = 0;
    objc_opt_class();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("externalForegroundApplicationSceneHandles"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!(_BYTE)v15)
    {
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
LABEL_6:

        return;
      }
      LOBYTE(v15) = 0;
      objc_opt_class();
      -[SBCommandTabControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_commandTabViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsSafeCategory();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!(_BYTE)v15)
      {
        objc_msgSend(v14, "accessibilityAnnounceSelectedIcon");

        goto LABEL_6;
      }
    }
    abort();
  }
}

void __69__SBCommandTabControllerAccessibility__activateWithForwardDirection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "sceneManagerForDisplayIdentity:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
