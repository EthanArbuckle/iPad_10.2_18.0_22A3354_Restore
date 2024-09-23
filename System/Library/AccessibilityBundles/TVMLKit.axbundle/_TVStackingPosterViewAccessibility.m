@implementation _TVStackingPosterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVStackingPosterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("_TVShelfView"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[_TVStackingPosterViewAccessibility _accessibleSubviews](self, "_accessibleSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axFilterObjectsUsingBlock:", &__block_literal_global_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityShouldReverseComponents:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  if (_accessibilityShouldReverseComponents__onceToken != -1)
    dispatch_once(&_accessibilityShouldReverseComponents__onceToken, &__block_literal_global_187);
  if ((unint64_t)objc_msgSend(v3, "count") >= 2
    && objc_msgSend(v3, "ax_containsObjectUsingBlock:", &__block_literal_global_191))
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_accessibilityLabelIncludingFallbackPlaceholder:(BOOL)a3 usesSubviewsForComponents:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _TVStackingPosterViewAccessibility *v29;
  void *v30;
  _BOOL4 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v5 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)_TVStackingPosterViewAccessibility;
  -[_TVStackingPosterViewAccessibility accessibilityLabel](&v36, sel_accessibilityLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    v31 = v5;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v9 = CFSTR("subviews");
    else
      v9 = CFSTR("components");
    -[_TVStackingPosterViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = self;
    v30 = v7;
    if (-[_TVStackingPosterViewAccessibility _accessibilityShouldReverseComponents:](self, "_accessibilityShouldReverseComponents:", v10))
    {
      objc_msgSend(v10, "reverseObjectEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v18, "accessibilityLabel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v21);

          }
          else
          {
            objc_msgSend(v18, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(", "));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              objc_msgSend(v8, "addObjectsFromArray:", v20);
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v15);
    }

    objc_msgSend(v8, "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234921D50]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, NSClassFromString(CFSTR("_TVProgressView")));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVStackingPosterViewAccessibility safeValueForKey:](v29, "safeValueForKey:", CFSTR("overlayView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:", 1, 0, 0, v24);
      v26 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v26;
    }
    if (v31 && !objc_msgSend(v7, "length"))
    {
      accessibilityLocalizedString(CFSTR("tvml.generic.poster"));
      v27 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v27;
    }

  }
  return v7;
}

- (id)accessibilityLabel
{
  return -[_TVStackingPosterViewAccessibility _accessibilityLabelIncludingFallbackPlaceholder:usesSubviewsForComponents:](self, "_accessibilityLabelIncludingFallbackPlaceholder:usesSubviewsForComponents:", 1, 0);
}

- (id)_accessibilityFrameDelegate
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (_accessibilityFrameDelegate_onceToken != -1)
    dispatch_once(&_accessibilityFrameDelegate_onceToken, &__block_literal_global_206);
  v26 = 0;
  objc_opt_class();
  -[_TVStackingPosterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v4;
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
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = (id)_accessibilityFrameDelegate_FrameDelegateClasses;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
LABEL_10:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
              if (v13)
                goto LABEL_10;
              goto LABEL_16;
            }
          }
          v16 = v10;

          if (v16)
            goto LABEL_21;
        }
        else
        {
LABEL_16:

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[_TVStackingPosterViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "_accessibilityScanningBehaviorTraits");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVStackingPosterViewAccessibility;
    v5 = -[_TVStackingPosterViewAccessibility _accessibilityScanningBehaviorTraits](&v8, sel__accessibilityScanningBehaviorTraits);
  }
  v6 = (unint64_t)v5;

  return v6;
}

@end
