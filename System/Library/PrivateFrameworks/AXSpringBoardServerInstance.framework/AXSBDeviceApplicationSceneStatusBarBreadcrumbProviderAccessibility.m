@implementation AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility

+ (BOOL)_shouldAddBreadcrumbToActivatingSceneEntity:(id)a3 sceneHandle:(id)a4 withTransitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned __int8 v31;
  id v33;
  objc_super v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "safeValueForKey:", CFSTR("application"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v47) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BED2688]))
    goto LABEL_12;
  v33 = a1;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = 0;
  v41 = MEMORY[0x24BDAC760];
  v42 = 3221225472;
  v43 = __148__AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext___block_invoke;
  v44 = &unk_24DDE57E0;
  v46 = &v47;
  v14 = v10;
  v45 = v14;
  AXPerformSafeBlock();
  v15 = (id)v48[5];

  _Block_object_dispose(&v47, 8);
  objc_msgSend(v15, "safeValueForKey:", CFSTR("application"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v47) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v18 = objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v47)
    goto LABEL_14;
  v19 = (void *)v18;

  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = 0;
  v35 = MEMORY[0x24BDAC760];
  v36 = 3221225472;
  v37 = __148__AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext___block_invoke_2;
  v38 = &unk_24DDE57E0;
  v40 = &v47;
  v20 = v14;
  v39 = v20;
  AXPerformSafeBlock();
  v21 = (id)v48[5];

  _Block_object_dispose(&v47, 8);
  objc_msgSend(v21, "safeValueForKey:", CFSTR("application"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v47) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v24 = objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v47)
    goto LABEL_14;
  v25 = (void *)v24;

  LOBYTE(v47) = 0;
  objc_msgSend(v20, "safeValueForKey:", CFSTR("request"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v47)
LABEL_14:
    abort();
  v28 = objc_msgSend(v27, "safeIntegerForKey:", CFSTR("source"));
  v29 = objc_msgSend(v25, "length");
  v30 = objc_msgSend(v27, "safeBoolForKey:", CFSTR("isMainWorkspaceTransitionRequest"));
  if (!objc_msgSend(v19, "isEqual:", v13)
    || (v30 & ~objc_msgSend(v25, "isEqual:", v13)) != 1
    || !v29
    || v28 != 18)
  {

    a1 = v33;
LABEL_12:
    v34.receiver = a1;
    v34.super_class = (Class)&OBJC_METACLASS___AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility;
    v31 = objc_msgSendSuper2(&v34, sel__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext_, v8, v9, v10, v33);
    goto LABEL_13;
  }

  v31 = 1;
LABEL_13:

  return v31;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDeviceApplicationSceneStatusBarBreadcrumbProvider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBDeviceApplicationSceneStatusBarBreadcrumbProvider"), CFSTR("_shouldAddBreadcrumbToActivatingSceneEntity:sceneHandle:withTransitionContext:"), "B", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"), CFSTR("applicationSceneEntityForLayoutRole:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"), CFSTR("previousApplicationSceneEntityForLayoutRole:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBWorkspaceTransitionContext"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceTransitionContext"), CFSTR("request"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBMainWorkspaceTransitionRequest"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspaceTransitionRequest"), CFSTR("source"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspaceTransitionRequest"), CFSTR("isMainWorkspaceTransitionRequest"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBApplicationSceneEntity"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationSceneEntity"), CFSTR("application"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBApplication"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("bundleIdentifier"), "@", 0);

}

void __148__AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "applicationSceneEntityForLayoutRole:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __148__AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "previousApplicationSceneEntityForLayoutRole:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
