@implementation GKCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKCollectionViewCell"), CFSTR("editActionsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKEditAction"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKEditAction"), CFSTR("selector"), ":", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplication"), CFSTR("_gkSendAction: viaResponder: withObject:"), "B", ":", "@", "@", 0);

}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[GKCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editActionsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_cell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v4, "safeValueForKey:", CFSTR("editActions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "safeValueForKey:", CFSTR("name"), (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "axSafelyAddObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)accessibilityPerformCustomAction:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  _QWORD v15[4];

  -[GKCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editActionsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("_cell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15[0]) = 0;
  objc_msgSend(v6, "safeValueForKey:", CFSTR("editActions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9 > a3)
  {
    objc_msgSend(v8, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v14 = v11;
    AXPerformSafeBlock();

    _Block_object_dispose(v15, 8);
    v13 = v6;
    AXPerformSafeBlock();

  }
  return v9 > a3;
}

uint64_t __70__GKCollectionViewCellAccessibility_accessibilityPerformCustomAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "selector");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __70__GKCollectionViewCellAccessibility_accessibilityPerformCustomAction___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkSendAction:viaResponder:withObject:", a1[6], a1[4], a1[5]);

}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[GKCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editActionsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_accessibilityViewIsVisible"))
  {
    v5[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
