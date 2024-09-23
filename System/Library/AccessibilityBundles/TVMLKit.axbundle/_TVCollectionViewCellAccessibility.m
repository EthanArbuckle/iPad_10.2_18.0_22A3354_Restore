@implementation _TVCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_TVCollectionViewCell"), CFSTR("TVContainerCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVContainerCollectionViewCell"), CFSTR("allowsFocus"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_TVCardFloatingContentView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_TVCollectionViewCell"), CFSTR("UICollectionViewCell"));

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVCollectionViewCellAccessibility;
  -[_TVCollectionViewCellAccessibility prepareForReuse](&v3, sel_prepareForReuse);
  -[_TVCollectionViewCellAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("cachedTextForSubhierarchy"));
}

- (BOOL)_accessibilityCellAllowsFocus
{
  return -[_TVCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("allowsFocus"));
}

- (id)_accessibilityAncestorFocusParcel
{
  void *v3;
  char isKindOfClass;
  _TVCollectionViewCellAccessibility *v5;
  objc_super v7;

  if (_accessibilityAncestorFocusParcel_onceToken != -1)
    dispatch_once(&_accessibilityAncestorFocusParcel_onceToken, &__block_literal_global_1);
  if (-[_TVCollectionViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement")
    && (-[_TVCollectionViewCellAccessibility superview](self, "superview"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    v5 = self;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TVCollectionViewCellAccessibility;
    -[_TVCollectionViewCellAccessibility _accessibilityAncestorFocusParcel](&v7, sel__accessibilityAncestorFocusParcel);
    v5 = (_TVCollectionViewCellAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVCollectionViewCellAccessibility;
  v3 = -[_TVCollectionViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[_TVCollectionViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[_TVCollectionViewCellAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length")
    && -[_TVCollectionViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    -[_TVCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("cachedTextForSubhierarchy"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v4, "length"))
    {
      -[_TVCollectionViewCellAccessibility _accessibilityCollectionViewCellContentSubviews](self, "_accessibilityCollectionViewCellContentSubviews");
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
LABEL_6:
        v9 = 0;
        v10 = v4;
        while (1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "accessibilityLabel", (_QWORD)v13);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v4, "length"))
            break;
          ++v9;
          v10 = v4;
          if (v7 == v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            if (v7)
              goto LABEL_6;
            break;
          }
        }
      }

      if (!objc_msgSend(v4, "length"))
      {
        -[_TVCollectionViewCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 0, 0);
        v11 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v11;
      }
      -[_TVCollectionViewCellAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("cachedTextForSubhierarchy"), (_QWORD)v13);

    }
    v3 = v4;
  }
  return v3;
}

- (id)_accessibilityFrameDelegate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  -[_TVCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    objc_msgSend(v4, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVCollectionViewCellAccessibility;
    -[_TVCollectionViewCellAccessibility _accessibilityFrameDelegate](&v10, sel__accessibilityFrameDelegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_atvaccessibilityCollectionViewCellSemanticContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_TVCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "axFilterObjectsUsingBlock:", &__block_literal_global_208);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (void *)MEMORY[0x24BDBD1B8];
  else
    v7 = 0;

  return v7;
}

@end
