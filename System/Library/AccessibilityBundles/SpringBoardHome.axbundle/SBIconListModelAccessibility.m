@implementation SBIconListModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconListModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("icons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_iconLocation"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("_axIconView"), "@", 0);

}

- (void)dealloc
{
  objc_super v3;

  -[SBIconListModelAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)SBIconListModelAccessibility;
  -[SBIconListModelAccessibility dealloc](&v3, sel_dealloc);
}

- (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 44;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  objc_opt_class();
  -[SBIconListModelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "safeValueForKey:", CFSTR("_axIconView"), (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "safeStringForKey:", CFSTR("_iconLocation"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (SBAXIsIconViewIgnoreLocation(v13))
        {

          v12 = 0;
        }
        if (v12)
          v14 = v12;
        else
          v14 = v11;
        objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_accessibilityIsVisibleByCompleteHitTest
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[SBIconListModelAccessibility automationElements](self, "automationElements");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "_accessibilityParentView", (_QWORD)v9);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v3) = objc_msgSend(v7, "_accessibilityIsVisibleByCompleteHitTest");

          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB130];
}

@end
