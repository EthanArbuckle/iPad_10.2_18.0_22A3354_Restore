@implementation UICollectionViewLayout(AVTCollectionViewLayout)

- (double)frameForElementAtIndex:()AVTCollectionViewLayout visibleBounds:
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;

  return v7;
}

- (id)indexesForElementsInRect:()AVTCollectionViewLayout visibleBounds:numberOfItems:
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "layoutAttributesForElementsInRect:", a2, a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v16, "indexPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "section");

        if (!v18)
        {
          objc_msgSend(v16, "indexPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addIndex:", objc_msgSend(v19, "row"));

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }
  v20 = (void *)objc_msgSend(v10, "copy");

  return v20;
}

- (double)centerForCenteringElementAtIndex:()AVTCollectionViewLayout visibleBoundsSize:proposedOrigin:
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "frame");
  UIRectGetCenter();
  v7 = v6;

  return v7;
}

- (double)initialFrameForAppearingElementAtOriginForVisibleBounds:()AVTCollectionViewLayout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "initialLayoutAttributesForAppearingItemAtIndexPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "frame");
  v5 = v4;

  return v5;
}

- (double)finalFrameForDisappearingElementAtOriginForVisibleBounds:()AVTCollectionViewLayout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "finalLayoutAttributesForDisappearingItemAtIndexPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "frame");
  v5 = v4;

  return v5;
}

@end
