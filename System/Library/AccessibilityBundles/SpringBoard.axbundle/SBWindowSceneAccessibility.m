@implementation SBWindowSceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBWindowScene");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityTraversalWindows
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_visibleWindows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "mutableCopy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "windowScene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_focusSystemSceneComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "conformsToProtocol:", &unk_255FF49D0))
        {
          objc_msgSend(v12, "parentFocusEnvironment");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "_focusSystemSceneComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v14)
            objc_msgSend(v16, "addObject:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

  return v16;
}

@end
