@implementation SKUITabularLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUITabularLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUITabularLockupView"), CFSTR("_layout"), "SKUITabularLockupLayout");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUITabularLockupView"), CFSTR("_viewElementViews"), "NSMapTable");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUITabularLockupLayout"), CFSTR("columns"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUITabularLockupColumn"), CFSTR("childViewElements"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  const __CFString *v33;
  id obj;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int16 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v49 = 0;
  -[SKUITabularLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("columns"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUITabularLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewElementViews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v10)
  {
    v11 = v10;
    v35 = *(id *)v46;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(id *)v46 != v35)
          objc_enumerationMutation(obj);
        v49 = 0;
        __UIAccessibilitySafeClass();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_BYTE)v49
          || (v14 = v13,
              objc_msgSend(v13, "safeValueForKey:", CFSTR("childViewElements")),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v14,
              HIBYTE(v49)))
        {
          abort();
        }
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v42;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v42 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              NSClassFromString(CFSTR("SKUIAttributedStringView"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v9, "addObject:", v22);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
          }
          while (v19);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v11);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v36 = v9;
  v23 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v38;
    do
    {
      v27 = 0;
      v28 = v25;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v27), "accessibilityLabel", v32, v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("•"), CFSTR(","));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v30;
        v33 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        ++v27;
        v28 = v25;
      }
      while (v24 != v27);
      v24 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v37, v50, 16, v30, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v24);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end
