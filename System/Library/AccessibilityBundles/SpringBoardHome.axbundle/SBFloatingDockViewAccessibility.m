@implementation SBFloatingDockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFloatingDockView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockView"), CFSTR("userIconListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockView"), CFSTR("recentIconListView"), "@", 0);

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  int v3;
  id v5;

  AXSBFloatingDockControllerFromActiveDisplayWindowScene();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("_allowGestureRecognizers"));
  if (v3)
  {
    v5 = v2;
    AXPerformSafeBlock();

  }
  return v3;
}

uint64_t __61__SBFloatingDockViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);
}

- (BOOL)accessibilityElementsHidden
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenLockedWithPasscode:", 0);

  return v3;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("GroupTraits");
  v30[1] = CFSTR("GroupElements");
  v31[0] = &unk_25038F668;
  v31[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v3;
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)MEMORY[0x24BDBCE30];
  -[SBFloatingDockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userIconListView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recentIconListView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 2, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    v14 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "_accessibilityScannerGroupElements");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v14;
        v19 = v18;

        v27[0] = CFSTR("GroupTraits");
        v27[1] = CFSTR("GroupElements");
        v28[0] = &unk_25038F668;
        v28[1] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v20);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v12);
  }

  return v22;
}

@end
