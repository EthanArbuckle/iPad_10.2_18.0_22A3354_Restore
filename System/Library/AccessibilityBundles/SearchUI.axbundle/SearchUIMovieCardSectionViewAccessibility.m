@implementation SearchUIMovieCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIMovieCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TLKMediaInfoView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKMediaInfoView"), CFSTR("contents"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("TLKDetailsSection"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKDetailsSection"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKDetailsSection"), CFSTR("details"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("TLKMultilineText"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKMultilineText"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIMovieCardSectionView"), CFSTR("initWithRowModel:feedbackDelegate:"), "@", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
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
  float v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)SearchUIMovieCardSectionViewAccessibility;
  -[SearchUIMovieCardSectionViewAccessibility _accessibilityLoadAccessibilityInformation](&v27, sel__accessibilityLoadAccessibilityInformation);
  v21 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v21, "setNumberStyle:", 3);
  v26 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v2;
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v4;
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v26 = 0;
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          abort();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "text");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "numberFromString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "floatValue");
            if (v15 >= 0.6)
              v16 = CFSTR("movie.rotten.tomatoes.fresh");
            else
              v16 = CFSTR("movie.rotten.tomatoes.rotten");
            accessibilityLocalizedString(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), v12, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setAccessibilityLabel:", v18);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[SearchUIMovieCardSectionViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36.receiver = self;
  v36.super_class = (Class)SearchUIMovieCardSectionViewAccessibility;
  -[SearchUIMovieCardSectionViewAccessibility accessibilityLabel](&v36, sel_accessibilityLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v3;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("contents"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v33;
    do
    {
      v5 = 0;
      v6 = v4;
      do
      {
        v27 = v6;
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v5);
        objc_msgSend(v7, "safeValueForKey:", CFSTR("title"), v17, v19, v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safeStringForKey:", CFSTR("text"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "safeValueForKey:", CFSTR("details"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v29;
          v13 = &stru_25033E6B0;
          do
          {
            v14 = 0;
            v15 = v13;
            do
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v14), "safeStringForKey:", CFSTR("text"), v18, v20);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = CFSTR("__AXStringForVariablesSentinel");
              __UIAXStringForVariables();
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

              ++v14;
              v15 = v13;
            }
            while (v11 != v14);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v37, 16, v18, CFSTR("__AXStringForVariablesSentinel"));
          }
          while (v11);
        }
        else
        {
          v13 = &stru_25033E6B0;
        }

        v19 = v13;
        v21 = CFSTR("__AXStringForVariablesSentinel");
        v17 = v26;
        __UIAXStringForVariables();
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v5;
        v6 = v4;
      }
      while (v5 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16, v26, v13, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v25);
  }

  return v4;
}

uint64_t __63__SearchUIMovieCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("TLKMediaInfoView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[SearchUIMovieCardSectionViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_218);
}

uint64_t __83__SearchUIMovieCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  NSClassFromString(CFSTR("SearchUIMovieCardSectionBuyButtonView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

- (SearchUIMovieCardSectionViewAccessibility)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  SearchUIMovieCardSectionViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIMovieCardSectionViewAccessibility;
  v4 = -[SearchUIMovieCardSectionViewAccessibility initWithRowModel:feedbackDelegate:](&v6, sel_initWithRowModel_feedbackDelegate_, a3, a4);
  -[SearchUIMovieCardSectionViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

@end
