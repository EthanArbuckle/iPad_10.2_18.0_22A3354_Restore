@implementation GKLeaderboardCollectionDataSource

- (void)setupCollectionView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    +[NSObject _gkNib](GKLeaderboardCell, "_gkNib");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[NSObject _gkNib](GKLeaderboardSectionHeaderView, "_gkNib");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v10, CFSTR("leaderboardCollectionCell"));
  v6 = *MEMORY[0x1E0DC48A8];
  objc_msgSend(v4, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v5, *MEMORY[0x1E0DC48A8], CFSTR("leaderboardListMetadataView"));
  v7 = (void *)MEMORY[0x1E0DC3A50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nibWithNibName:bundle:", CFSTR("GKLeaderboardCellAX_iOS"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v9, CFSTR("leaderboardCollectionCellAX"));

  objc_msgSend(v4, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v5, v6, CFSTR("leaderboardListMetadataViewAX"));
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);

}

- (int64_t)allowedColumnCount:(int64_t)a3
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;

  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    if (a3 >= 4)
      v5 = 4;
    else
      v5 = a3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    v8 = 6;
    if (a3 < 6)
      v8 = a3;
    v9 = 4;
    v10 = 2;
    if (v8 != 3)
      v10 = v8;
    if (v8 != 5)
      v9 = v10;
    if (v7 == 1)
      v5 = v8;
    else
      v5 = v9;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);
  if (v12 == 1 || IsAccessibilityCategory)
    v17 = 1;
  else
    v17 = 2;
  v18 = -[GKGameLayerCollectionDataSource itemCount](self, "itemCount");
  if (v18 >= v5)
    v19 = v5;
  else
    v19 = v18;
  if (v17 <= v19)
    v20 = v19;
  else
    v20 = v17;

  return v20;
}

- (double)preferredCollectionHeight
{
  return 95.0;
}

- (double)cellSpacing
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;

  v2 = 16.0;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "statusBarOrientation") - 1;

      if (v6 <= 1)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bounds");
        if (v8 > 320.0)
          v2 = 16.0;
        else
          v2 = 10.0;

      }
    }
  }
  return v2;
}

- (double)headerSpacing
{
  double result;
  void *v3;
  uint64_t v4;

  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) != 0)
    return 32.0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  result = 32.0;
  if (v4 != 1)
    return 16.0;
  return result;
}

- (double)topMargin
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = 8.0;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 1)
      return 42.0;
    else
      return 26.0;
  }
  return v2;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  const __CFString *v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0DC48A8];
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (IsAccessibilityCategory)
      v14 = CFSTR("leaderboardListMetadataViewAX");
    else
      v14 = CFSTR("leaderboardListMetadataView");
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v14, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardCollectionDataSource updateHighlightsInSectionHeader:](self, "updateHighlightsInSectionHeader:", v15);
    -[GKLeaderboardCollectionDataSource collectionView:updateLayoutForSectionHeader:](self, "collectionView:updateLayoutForSectionHeader:", v8, v15);
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0DC35B0]);
  }

  return v15;
}

- (void)collectionView:(id)a3 updateLayoutForSectionHeader:(id)a4
{
  id v5;
  double v6;
  double v7;
  id v8;

  v5 = a4;
  -[GKLeaderboardCollectionDataSource cellSpacing](self, "cellSpacing");
  v7 = v6;
  objc_msgSend(v5, "container");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSpacing:", v7);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  const __CFString *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0DC3E88];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  if (IsAccessibilityCategory)
    v12 = CFSTR("leaderboardCollectionCellAX");
  else
    v12 = CFSTR("leaderboardCollectionCell");
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKGameLayerCollectionDataSource prepareCell:forItemAtIndexPath:](self, "prepareCell:forItemAtIndexPath:", v13, v7);
  return v13;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6;
  void *v7;
  GameLayerPageGrid *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  GameLayerPageGrid *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  UIEdgeInsets result;

  v6 = a3;
  objc_msgSend(v6, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [GameLayerPageGrid alloc];
  objc_msgSend(v6, "bounds");
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[GameLayerPageGrid initWithSize:traitCollection:](v8, "initWithSize:traitCollection:", v13, v10, v12);

  -[GKGameLayerCollectionDataSource standardCellSizeForCollectionView:](self, "standardCellSizeForCollectionView:", v6);
  v16 = v15;
  v18 = v17;
  -[GKLeaderboardCollectionDataSource cellSpacing](self, "cellSpacing");
  v20 = v19;
  if (objc_msgSend(v7, "scrollDirection") == 1)
  {
    objc_msgSend(v6, "frame");
    v22 = v21;
    objc_msgSend(v6, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safeAreaInsets");
    v25 = v22 - v24;
    objc_msgSend(v6, "superview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeAreaInsets");
    v28 = v25 - v27;

    v29 = (v28 - v18) * 0.5;
    objc_msgSend(v6, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "safeAreaInsets");
    v32 = v29 + v31;

    objc_msgSend(v6, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "safeAreaInsets");
    v35 = v29 + v34;

    -[GKLeaderboardCollectionDataSource headerSpacing](self, "headerSpacing");
    v37 = v36;
    objc_msgSend(v6, "superview");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "safeAreaInsets");
    v40 = v39 + 24.0;

    objc_msgSend(v6, "superview");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "safeAreaInsets");
    v43 = v20 + v42;

    v44 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "bounds");
    v46 = v45 / (v16 + v20);
    v47 = vcvtmd_s64_f64(v46);
    if (v16 * (double)(uint64_t)(v47 + 1) + (double)(uint64_t)floor(v46) * v20 >= v45)
      v48 = v47;
    else
      v48 = v47 + 1;
    -[GKLeaderboardCollectionDataSource allowedColumnCount:](self, "allowedColumnCount:", v48);
    objc_msgSend(v6, "superview");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "safeAreaInsets");
    v51 = v50;
    -[GKLeaderboardCollectionDataSource topMargin](self, "topMargin");
    v32 = v51 + v52;

    -[GKLeaderboardCollectionDataSource headerSpacing](self, "headerSpacing");
    v44 = v53 - v20;
    objc_msgSend(v6, "superview");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "safeAreaInsets");
    v35 = v20 + v55;

    -[GameLayerPageGrid centeringInsets](v14, "centeringInsets");
    v40 = v56;
    -[GameLayerPageGrid centeringInsets](v14, "centeringInsets");
    v43 = v57;
    v37 = 0.0;
  }
  objc_msgSend(v6, "setContentInset:", v32, v40, v35, v43);

  v58 = 0.0;
  v59 = 0.0;
  v60 = v44;
  v61 = v37;
  result.right = v59;
  result.bottom = v58;
  result.left = v61;
  result.top = v60;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGSize result;

  v8 = a3;
  v9 = a4;
  -[GKLeaderboardCollectionDataSource headerSpacing](self, "headerSpacing");
  v11 = v10;
  -[GKLeaderboardCollectionDataSource collectionView:layout:insetForSectionAtIndex:](self, "collectionView:layout:insetForSectionAtIndex:", v8, v9, a5);
  v13 = v12;
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferredContentSizeCategory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v17))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "horizontalSizeClass") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "verticalSizeClass") == 2;

    }
    else
    {
      v20 = 0;
    }

    objc_msgSend(v8, "bounds");
    v22 = v24 - v13 - v15;
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DC48B8]))
    {
      v25 = 504.0;
LABEL_14:
      v30 = v11 + v25;
      goto LABEL_15;
    }
    if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
    {
      if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DC48C8]))
      {
        v25 = 424.0;
      }
      else
      {
        if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DC48D0]))
        {
          v25 = 182.0;
          v35 = 364.0;
        }
        else
        {
          v25 = 162.0;
          v35 = 324.0;
        }
        if (v20)
          v25 = v35;
      }
      goto LABEL_14;
    }
    *(double *)&v23 = 464.0;
LABEL_13:
    v25 = *(double *)&v23;
    goto LABEL_14;
  }
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    objc_msgSend(v8, "bounds");
    v22 = v21 - v13 - v15;
    *(double *)&v23 = 50.0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "userInterfaceIdiom");

  objc_msgSend(v8, "bounds");
  v29 = v28;
  if (v27 == 1)
  {
    v22 = v28 - v13 - v15;
    *(double *)&v23 = 60.0;
    goto LABEL_13;
  }
  objc_msgSend(v8, "bounds");
  if (v29 < v33)
  {
    objc_msgSend(v8, "bounds");
    v22 = v34 - v13 - v15;
    v25 = 125.0;
    goto LABEL_14;
  }
  v30 = 262.0;
  if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DC48F8]) & 1) != 0)
  {
    v22 = 210.0;
  }
  else if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DC48F0]))
  {
    v22 = 210.0;
  }
  else
  {
    v22 = 162.0;
  }
LABEL_15:

  v31 = v22;
  v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v5;
  GameLayerPageGrid *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  GameLayerPageGrid *v12;
  double v13;
  double v14;

  v5 = a3;
  v6 = [GameLayerPageGrid alloc];
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GameLayerPageGrid initWithSize:traitCollection:](v6, "initWithSize:traitCollection:", v11, v8, v10);

  -[GameLayerPageGrid interColumnSpacing](v12, "interColumnSpacing");
  v14 = v13;

  return v14;
}

@end
