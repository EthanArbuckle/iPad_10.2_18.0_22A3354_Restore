@implementation PXPeopleZeroKeywordCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleZeroKeywordCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPeopleNames
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAXPeopleNames:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleZeroKeywordCollectionViewCell"), CFSTR("setPeople:withThumbnailSize:"), "v", "@", "{CGSize=dd}", 0);
}

- (id)accessibilityLabel
{
  void *v2;

  -[PXPeopleZeroKeywordCollectionViewCellAccessibility _axPeopleNames](self, "_axPeopleNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("people.name.unknown"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setPeople:(id)a3 withThumbnailSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  height = a4.height;
  width = a4.width;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXPeopleZeroKeywordCollectionViewCellAccessibility;
  -[PXPeopleZeroKeywordCollectionViewCellAccessibility setPeople:withThumbnailSize:](&v24, sel_setPeople_withThumbnailSize_, v7, width, height);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "name", v18, v19, (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          objc_msgSend(v14, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v17 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v17;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  -[PXPeopleZeroKeywordCollectionViewCellAccessibility _setAXPeopleNames:](self, "_setAXPeopleNames:", v11);
}

@end
