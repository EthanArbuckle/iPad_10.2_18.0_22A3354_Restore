@implementation SKUIImageCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIImageCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIViewReuseCollectionViewCell"), CFSTR("allExistingViews"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SKUIImageView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  _QWORD *v7;
  objc_super *v8;
  unint64_t v9;
  objc_super v11;
  SKUIImageCollectionViewCellAccessibility *v12;
  char v13;

  v13 = 0;
  objc_opt_class();
  -[SKUIImageCollectionViewCellAccessibility superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SKUICarouselCollectionViewLayout"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v12 = self;
    v7 = (_QWORD *)MEMORY[0x24BDF73B0];
    v8 = (objc_super *)&v12;
  }
  else
  {
    v11.receiver = self;
    v7 = (_QWORD *)MEMORY[0x24BDF73C8];
    v8 = &v11;
  }
  v8->super_class = (Class)SKUIImageCollectionViewCellAccessibility;
  v9 = *v7 | (unint64_t)-[objc_super accessibilityTraits](v8, sel_accessibilityTraits);

  return v9;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char v35;
  _QWORD v36[5];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __62__SKUIImageCollectionViewCellAccessibility_accessibilityLabel__block_invoke;
  v36[3] = &unk_24FF2BF08;
  v36[4] = self;
  -[SKUIImageCollectionViewCellAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", v36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v35 = 0;
    objc_opt_class();
    -[SKUIImageCollectionViewCellAccessibility superview](self, "superview");
    v5 = objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SKUIStorePageCollectionViewLayout"));
    LOBYTE(v5) = objc_opt_isKindOfClass();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "subviews");
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            NSClassFromString(CFSTR("SKUIProductLockupCollectionViewCell"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v13;
              goto LABEL_13;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
          if (v10)
            continue;
          break;
        }
      }
      v14 = 0;
LABEL_13:

      objc_msgSend(v14, "safeValueForKey:", CFSTR("allExistingViews"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        while (2)
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
            NSClassFromString(CFSTR("SKUIImageView"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = (void *)MEMORY[0x24BDD17C8];
              accessibilitySKUILocalizedString(CFSTR("cover.photo.of.artist"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "accessibilityLabel");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringWithFormat:", v25, v26);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_24;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v18)
            continue;
          break;
        }
      }

    }
  }
  objc_msgSend(v3, "accessibilityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v22;
}

BOOL __62__SKUIImageCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  if (*(void **)(a1 + 32) == a2)
    return 0;
  objc_msgSend(a2, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

@end
