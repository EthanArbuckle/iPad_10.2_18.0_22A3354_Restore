@implementation TUICandidateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUICandidateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TUICandidateCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("TUICandidateArrowButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUICandidateView"), CFSTR("finalizeLayoutChange"), "v", 0);

}

- (void)finalizeLayoutChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TUICandidateViewAccessibility;
  -[TUICandidateViewAccessibility finalizeLayoutChange](&v2, sel_finalizeLayoutChange);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (id)_accessibilityScannerGroupElements
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBADC8], "defaultSwitchControlOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v38 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  objc_msgSend(v4, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "_accessibilityLeafDescendantsWithOptions:", v2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v14 = v3;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (!v15)
        goto LABEL_19;
      v16 = v15;
      v17 = *(_QWORD *)v35;
LABEL_13:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
        MEMORY[0x2349226DC](CFSTR("TUICandidateArrowButton"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (!v16)
          {
LABEL_19:
            v20 = v14;
            goto LABEL_29;
          }
          goto LABEL_13;
        }
      }
      v20 = v19;

      if (v20)
      {
        v38 = 0;
        objc_opt_class();
        objc_msgSend(v14, "firstObject", (_QWORD)v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("GroupElements"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
        {
          if (objc_msgSend(v23, "count") != 1)
            goto LABEL_28;
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v25 = objc_opt_isKindOfClass();

          if ((v25 & 1) == 0)
            goto LABEL_28;
          v38 = 0;
          objc_opt_class();
          objc_msgSend(v23, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("GroupElements"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v38)
          {
            v29 = (void *)objc_msgSend(v28, "mutableCopy");

            objc_msgSend(v29, "firstObject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            MEMORY[0x2349226DC](CFSTR("TUICandidateCell"));
            v31 = objc_opt_isKindOfClass();

            if ((v31 & 1) != 0)
            {
              objc_msgSend(v14, "removeObject:", v20);
              objc_msgSend(v29, "addObject:", v20);
              objc_msgSend(v23, "firstObject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKeyedSubscript:", v29, CFSTR("GroupElements"));

            }
LABEL_28:

LABEL_29:
            goto LABEL_30;
          }
        }
        abort();
      }
    }
  }
LABEL_30:

  return v3;
}

@end
