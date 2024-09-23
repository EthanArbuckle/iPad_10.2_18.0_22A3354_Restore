@implementation LoggingCardCarouselCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.LoggingCardCarouselCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MenstrualCyclesAppPlugin.LoggingCardCarouselCollectionViewCell"), CFSTR("UICollectionViewCell"));
}

- (BOOL)accessibilityElementsHidden
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint v31;
  CGPoint v32;
  CGRect v33;
  CGRect v34;

  v30 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  AX_CGRectGetCenter();
  v5 = v4;
  v7 = v6;
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", v2);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v3, "indexPathsForVisibleItems", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bounds");
        objc_msgSend(v3, "convertRect:fromView:", v21);
        v31.x = v5;
        v31.y = v7;
        if (CGRectContainsPoint(v33, v31))
        {
          v34.origin.x = v9;
          v34.origin.y = v11;
          v34.size.width = v13;
          v34.size.height = v15;
          v32.x = v5;
          v32.y = v7;
          if (CGRectContainsPoint(v34, v32))
          {

            v22 = 0;
            goto LABEL_12;
          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v18)
        continue;
      break;
    }
  }
  v22 = 1;
LABEL_12:

  return v22;
}

@end
