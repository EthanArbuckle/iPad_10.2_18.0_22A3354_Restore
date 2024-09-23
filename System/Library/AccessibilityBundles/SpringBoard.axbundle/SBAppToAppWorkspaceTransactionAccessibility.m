@implementation SBAppToAppWorkspaceTransactionAccessibility

void __62__SBAppToAppWorkspaceTransactionAccessibility__setupAnimation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "safeValueForKey:", CFSTR("application"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_setupAnimation
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v26;
  id v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  char v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)SBAppToAppWorkspaceTransactionAccessibility;
  -[SBAppToAppWorkspaceTransactionAccessibility _setupAnimation](&v37, sel__setupAnimation);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = 0;
  objc_opt_class();
  -[SBAppToAppWorkspaceTransactionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toApplicationSceneEntities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __62__SBAppToAppWorkspaceTransactionAccessibility__setupAnimation__block_invoke;
  v34[3] = &unk_250367DE0;
  v6 = v3;
  v35 = v6;
  v26 = v5;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v34);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SBAppToAppWorkspaceTransactionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("fromApplicationSceneEntities"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = CFSTR("SBApplicationSceneEntity");
    v10 = *(_QWORD *)v31;
    v11 = CFSTR("application");
    v12 = CFSTR("SBApplication");
    do
    {
      v13 = 0;
      v28 = v8;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v36 = 0;
        __UIAccessibilitySafeClass();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36
          || (v15 = v14,
              v36 = 0,
              objc_msgSend(v14, "safeValueForKey:", v11),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v16,
              v36))
        {
          abort();
        }
        if ((objc_msgSend(v6, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(v17, "safeValueForKey:", CFSTR("processState"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "safeValueForKey:", CFSTR("pid"));
          v19 = v10;
          v20 = v6;
          v21 = v12;
          v22 = v11;
          v23 = v9;
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "intValue");
          AXTentativePidSuspend();

          v9 = v23;
          v11 = v22;
          v12 = v21;
          v6 = v20;
          v10 = v19;
          v8 = v28;
        }

        ++v13;
      }
      while (v8 != v13);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v8);
  }

  return v27;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppToAppWorkspaceTransaction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBToAppsWorkspaceTransaction"), CFSTR("fromApplicationSceneEntities"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBToAppsWorkspaceTransaction"), CFSTR("toApplicationSceneEntities"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBAppToAppWorkspaceTransaction"), CFSTR("SBToAppsWorkspaceTransaction"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationSceneEntity"), CFSTR("application"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("processState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationProcessState"), CFSTR("pid"), "i", 0);

}

@end
