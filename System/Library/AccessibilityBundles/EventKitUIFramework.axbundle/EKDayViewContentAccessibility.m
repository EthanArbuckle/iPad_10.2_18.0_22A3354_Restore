@implementation EKDayViewContentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayViewContent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewContent"), CFSTR("applyLoadedOccurrencesWithBatching:animated:reverse:completion:"), "v", "B", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewContent"), CFSTR("_itemsByDay"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewContent"), CFSTR("_grid"), "EKDayGridView");

}

- (void)applyLoadedOccurrencesWithBatching:(BOOL)a3 animated:(BOOL)a4 reverse:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  objc_super v12;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  -[EKDayViewContentAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_grid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);

  v12.receiver = self;
  v12.super_class = (Class)EKDayViewContentAccessibility;
  -[EKDayViewContentAccessibility applyLoadedOccurrencesWithBatching:animated:reverse:completion:](&v12, sel_applyLoadedOccurrencesWithBatching_animated_reverse_completion_, v8, v7, v6, v10);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)EKDayViewContentAccessibility;
  -[EKDayViewContentAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EKDayViewContentAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_itemsByDay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v15 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "_accessibilityLoadAccessibilityInformation");
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

}

@end
