@implementation SBAppSwitcherPeopleScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppSwitcherPeopleScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppSwitcherPeopleScrollView"), CFSTR("expandedItemWrapper"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppSwitcherPeopleContactContainer"), CFSTR("contactView"), "@", 0);

}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityIsFirstElementForFocus
{
  return 0;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("people.scroll.view.container"));
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  return 1;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (id)_accessibilitySortedElementsWithin
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  id v23;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)SBAppSwitcherPeopleScrollViewAccessibility;
  -[SBAppSwitcherPeopleScrollViewAccessibility _accessibilitySortedElementsWithin](&v31, sel__accessibilitySortedElementsWithin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherPeopleScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_expandedItemWrapper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBAppSwitcherPeopleScrollViewAccessibility subviews](self, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count") + objc_msgSend(v5, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = CFSTR("_contactView");
      v10 = *(_QWORD *)v28;
      v11 = CFSTR("SBAppSwitcherPeopleContactContainer");
      v26 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v13, "safeValueForKey:", v9, v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          NSClassFromString(&v11->isa);
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "indexOfObject:", v14) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v13, "subviews");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "count") == 1)
            {
              objc_msgSend(v15, "firstObject");
              v16 = v11;
              v17 = v9;
              v18 = v6;
              v19 = v3;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              NSClassFromString(CFSTR("SBAppSwitcherPeopleContactView"));
              isKindOfClass = objc_opt_isKindOfClass();

              v3 = v19;
              v6 = v18;
              v9 = v17;
              v11 = v16;
              v10 = v26;
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v15, "firstObject");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addObject:", v22);

              }
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }

    objc_msgSend(v25, "addObjectsFromArray:", v3);
    objc_msgSend(v25, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v3;
  }

  return v23;
}

@end
