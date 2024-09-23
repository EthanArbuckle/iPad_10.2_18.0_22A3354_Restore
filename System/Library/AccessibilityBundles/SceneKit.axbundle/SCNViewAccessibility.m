@implementation SCNViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SCNView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SCNView"), CFSTR("scene"), "@", 0);
}

- (id)accessibilityProjectSCNVector3Points:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id obj;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  LOBYTE(v19) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v19 = 0;
        v20 = &v19;
        v21 = 0x3010000000;
        v22 = &unk_232971375;
        v23 = 0;
        v24 = 0;
        v18 = v5;
        AXPerformSafeBlock();
        v9 = *((_DWORD *)v20 + 8);
        v10 = *((_DWORD *)v20 + 9);
        v11 = *((_DWORD *)v20 + 10);

        _Block_object_dispose(&v19, 8);
        LODWORD(v12) = v9;
        LODWORD(v13) = v10;
        LODWORD(v14) = v11;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  return v4;
}

uint64_t __61__SCNViewAccessibility_accessibilityProjectSCNVector3Points___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  _DWORD *v4;
  int v5;
  int v6;
  int v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "SCNVector3Value");
  result = objc_msgSend(v2, "projectPoint:");
  v4 = *(_DWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v4[8] = v5;
  v4[9] = v6;
  v4[10] = v7;
  return result;
}

- (id)_accessibilitySceneKitScene
{
  return (id)-[SCNViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scene"));
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;
  char v12;

  -[SCNViewAccessibility _accessibilitySceneKitScene](self, "_accessibilitySceneKitScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityContainerIsSet");

  if ((v5 & 1) == 0)
    objc_msgSend(v3, "setAccessibilityContainer:", self);
  v11.receiver = self;
  v11.super_class = (Class)SCNViewAccessibility;
  -[SCNViewAccessibility accessibilityElements](&v11, sel_accessibilityElements);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SCNViewAccessibility _accessibilitySortedElementsWithin](self, "_accessibilitySortedElementsWithin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  return v8;
}

@end
