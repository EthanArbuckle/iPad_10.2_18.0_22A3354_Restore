@implementation TLKTextAreaViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKTextAreaView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKTextAreaView"), CFSTR("titleContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKTextAreaView"), CFSTR("detailsFields"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKTextAreaView"), CFSTR("footnoteLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKTitleContainerView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKTitleContainerView"), CFSTR("secondaryLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[TLKTextAreaViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("secondaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextAreaViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("footnoteLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = 0;
  objc_opt_class();
  -[TLKTextAreaViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailsFields"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v14, "_accessibilityViewIsVisible"))
          objc_msgSend(v6, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }

  v25 = v3;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("titleLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "_accessibilityViewIsVisible");
  v24 = v4;
  if (v17)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  MEMORY[0x23492252C](v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  if ((objc_msgSend(v5, "_accessibilityViewIsVisible") & 1) != 0)
  {
    objc_msgSend(v5, "accessibilityLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v17)
  return v21;
}

@end
