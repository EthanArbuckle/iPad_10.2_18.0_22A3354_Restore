@implementation CKGroupAcknowledgmentVotingLayout

- (CKGroupAcknowledgmentVotingLayout)init
{
  CKGroupAcknowledgmentVotingLayout *v2;
  CKGroupAcknowledgmentVotingLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKGroupAcknowledgmentVotingLayout;
  v2 = -[CKGroupAcknowledgmentVotingLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKGroupAcknowledgmentVotingLayout setLayoutMode:](v2, "setLayoutMode:", 1);
  return v3;
}

- (void)preapareForLayoutAnimationAroundSection:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  -[CKGroupAcknowledgmentVotingLayout setIsAnimatedLayoutChange:](self, "setIsAnimatedLayoutChange:", 1);
  -[CKGroupAcknowledgmentVotingLayout setExpandedSection:](self, "setExpandedSection:", a3);
  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  -[CKGroupAcknowledgmentVotingLayout setFromContentSize:](self, "setFromContentSize:");

  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  -[CKGroupAcknowledgmentVotingLayout setFromContentOffset:](self, "setFromContentOffset:");

  v7 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v9, 1);
  -[CKGroupAcknowledgmentVotingLayout setFromBallotItems:](self, "setFromBallotItems:", v8);

}

- (void)cleanupAnimationCache
{
  -[CKGroupAcknowledgmentVotingLayout setFromBallotItems:](self, "setFromBallotItems:", 0);
  -[CKGroupAcknowledgmentVotingLayout setIsAnimatedLayoutChange:](self, "setIsAnimatedLayoutChange:", 0);
  -[CKGroupAcknowledgmentVotingLayout setFromContentSize:](self, "setFromContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[CKGroupAcknowledgmentVotingLayout setFromContentOffset:](self, "setFromContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)setLayoutMode:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_layoutMode = a3;
  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  -[CKGroupAcknowledgmentVotingLayout setFromContentSize:](self, "setFromContentSize:");

  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  -[CKGroupAcknowledgmentVotingLayout setFromContentOffset:](self, "setFromContentOffset:");

}

- (int64_t)_numberOfBallots
{
  void *v2;
  int64_t v3;

  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (BOOL)_shouldFillInFromCenter
{
  CGFloat v3;
  void *v4;
  BOOL v5;
  CGRect v7;

  v3 = (double)-[CKGroupAcknowledgmentVotingLayout _numberOfBallots](self, "_numberOfBallots") * 80.0;
  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = v3 < CGRectGetWidth(v7);

  return v5;
}

- (double)_totalBallotContainersWidth
{
  return (double)-[CKGroupAcknowledgmentVotingLayout _numberOfBallots](self, "_numberOfBallots") * 80.0;
}

- (CGSize)collectionViewContentSize
{
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
  double v13;
  void *v14;
  double Width;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CGSize result;
  CGRect v27;
  CGRect v28;

  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (-[CKGroupAcknowledgmentVotingLayout isAnimatedLayoutChange](self, "isAnimatedLayoutChange"))
  {
    -[CKGroupAcknowledgmentVotingLayout fromContentSize](self, "fromContentSize");
  }
  else if (-[CKGroupAcknowledgmentVotingLayout layoutMode](self, "layoutMode") == 1)
  {
    v13 = (double)-[CKGroupAcknowledgmentVotingLayout _numberOfBallots](self, "_numberOfBallots") * 80.0;
    -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    Width = CGRectGetWidth(v27);

    if (v13 >= Width)
      v12 = v13;
    else
      v12 = Width;
  }
  else
  {
    v16 = -[CKGroupAcknowledgmentVotingLayout layoutMode](self, "layoutMode");
    v12 = 0.0;
    if (!v16)
    {
      -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView", 0.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "numberOfItemsInSection:", -[CKGroupAcknowledgmentVotingLayout expandedSection](self, "expandedSection"));

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "messageAcknowledgmentVotingAvatarSize");
      v21 = v20;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "avatarSpacingMargin");
      v24 = v23 * (double)(v18 - 1) + v21 * (double)v18;

      v28.origin.x = v5;
      v28.origin.y = v7;
      v28.size.width = v9;
      v28.size.height = v11;
      v12 = CGRectGetWidth(v28);
      if (v24 >= v12)
        v12 = v24;
    }
  }
  v25 = v11;
  result.height = v25;
  result.width = v12;
  return result;
}

- (void)_initializeBallotItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void **p_cache;
  uint64_t i;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v34;
  CKBallotLayoutAttributesCollection *v35;
  void *v36;
  void *v37;

  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  v32 = v3;
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = 0x1E0CB3000uLL;
    v6 = 0x1E0CEA000uLL;
    do
    {
      v35 = objc_alloc_init(CKBallotLayoutAttributesCollection);
      -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfItemsInSection:", v4);

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      p_cache = CKExpandedAppViewController.cache;
      if (v8 >= 1)
      {
        for (i = 0; i != v8; ++i)
        {
          objc_msgSend(*(id *)(v5 + 1712), "indexPathForItem:inSection:", i, v4, v32);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v6 + 1120), "layoutAttributesForCellWithIndexPath:", v12);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v37);
          v13 = *(void **)(v6 + 1120);
          objc_msgSend(p_cache + 68, "supplementaryViewKind");
          v14 = p_cache;
          v15 = v4;
          v16 = v9;
          v17 = v6;
          v18 = v5;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v19, v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v18;
          v6 = v17;
          v9 = v16;
          v4 = v15;
          p_cache = v14;
          objc_msgSend(v36, "addObject:", v20);

        }
      }
      v21 = *(void **)(v6 + 1120);
      objc_msgSend(*(id *)(v5 + 1712), "indexPathForItem:inSection:", 0, v4, v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layoutAttributesForCellWithIndexPath:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBallotLayoutAttributesCollection setContainerAttributes:](v35, "setContainerAttributes:", v23);

      v24 = *(void **)(v6 + 1120);
      +[CKAcknowledgmentVoteCountCollectionReusableView supplementaryViewKind](CKAcknowledgmentVoteCountCollectionReusableView, "supplementaryViewKind");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v5 + 1712), "indexPathForItem:inSection:", 0, v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBallotLayoutAttributesCollection setVoteCountAttributes:](v35, "setVoteCountAttributes:", v27);

      v28 = *(void **)(v6 + 1120);
      +[CKAcknowledgmentIconCollectionReusableView supplementaryViewKind](CKAcknowledgmentIconCollectionReusableView, "supplementaryViewKind");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v5 + 1712), "indexPathForItem:inSection:", 0, v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBallotLayoutAttributesCollection setAckIconAttributes:](v35, "setAckIconAttributes:", v31);

      -[CKBallotLayoutAttributesCollection setAvatarAttributesCollection:](v35, "setAvatarAttributesCollection:", v9);
      -[CKBallotLayoutAttributesCollection setNameAttributesCollection:](v35, "setNameAttributesCollection:", v36);
      objc_msgSend(v34, "addObject:", v35);

      ++v4;
    }
    while (v4 != v32);
  }
  -[CKGroupAcknowledgmentVotingLayout setBallotItems:](self, "setBallotItems:", v34, v32);

}

- (void)_setupCollapsedLayout
{
  void *v3;
  _QWORD v4[5];

  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CKGroupAcknowledgmentVotingLayout__setupCollapsedLayout__block_invoke;
  v4[3] = &unk_1E274A018;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __58__CKGroupAcknowledgmentVotingLayout__setupCollapsedLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double Height;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double MaxX;
  void *v13;
  double MinX;
  double v15;
  double MidX;
  double v17;
  void *v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v20 = a2;
  objc_msgSend(v20, "containerAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Height = CGRectGetHeight(v21);

  v8 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v8, "ballotItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "frame");
    MaxX = CGRectGetMaxX(v22);
LABEL_7:

    goto LABEL_8;
  }
  MaxX = 0.0;
  if (objc_msgSend(v8, "isAnimatedLayoutChange"))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    MinX = CGRectGetMinX(v23);
    objc_msgSend(*(id *)(a1 + 32), "previousCollapsedContentOffset");
    MaxX = MinX - v15;

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldFillInFromCenter"))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    MidX = CGRectGetMidX(v24);
    objc_msgSend(*(id *)(a1 + 32), "_totalBallotContainersWidth");
    MaxX = MidX + v17 * -0.5;
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v5, "setFrame:", MaxX, 0.0, 80.0, Height);
  objc_msgSend(v5, "setAlpha:", 1.0);
  if (objc_msgSend(*(id *)(a1 + 32), "isAnimatedLayoutChange")
    && objc_msgSend(*(id *)(a1 + 32), "expandedSection") != a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "fromBallotItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "_setContainerAttributes:forLayoutMode:", v5, 1);
    objc_msgSend(v20, "_setContainerAttributes:forLayoutMode:", v5, 1);

  }
  else
  {
    objc_msgSend(v20, "_setContainerAttributes:forLayoutMode:", v5, 1);
  }

}

- (void)_setupAnimatedCollapsedLayout
{
  double v3;
  void *v4;
  double MinX;
  double v6;
  void *v7;
  double MidX;
  double v9;
  void *v10;
  _QWORD v11[6];
  CGRect v12;
  CGRect v13;

  v3 = 0.0;
  if (-[CKGroupAcknowledgmentVotingLayout isAnimatedLayoutChange](self, "isAnimatedLayoutChange"))
  {
    -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    MinX = CGRectGetMinX(v12);
    -[CKGroupAcknowledgmentVotingLayout previousCollapsedContentOffset](self, "previousCollapsedContentOffset");
    v3 = MinX - v6;

  }
  if (-[CKGroupAcknowledgmentVotingLayout _shouldFillInFromCenter](self, "_shouldFillInFromCenter"))
  {
    -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    MidX = CGRectGetMidX(v13);
    -[CKGroupAcknowledgmentVotingLayout _totalBallotContainersWidth](self, "_totalBallotContainersWidth");
    v3 = MidX + v9 * -0.5;

  }
  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__CKGroupAcknowledgmentVotingLayout__setupAnimatedCollapsedLayout__block_invoke;
  v11[3] = &unk_1E274A040;
  v11[4] = self;
  *(double *)&v11[5] = v3;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __66__CKGroupAcknowledgmentVotingLayout__setupAnimatedCollapsedLayout__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  double Height;
  id v8;
  CGRect v9;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "expandedSection") != a3)
  {
    objc_msgSend(v8, "containerAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    Height = CGRectGetHeight(v9);

    objc_msgSend(v5, "setFrame:", *(double *)(a1 + 40) + (double)a3 * 80.0, 0.0, 80.0, Height);
    objc_msgSend(v5, "setAlpha:", 1.0);
    objc_msgSend(v8, "_setContainerAttributes:forLayoutMode:", v5, 1);

  }
}

- (void)_setupExpandedLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[9];

  -[CKGroupAcknowledgmentVotingLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__CKGroupAcknowledgmentVotingLayout__setupExpandedLayout__block_invoke;
  v13[3] = &unk_1E274A068;
  v13[4] = self;
  v13[5] = v5;
  v13[6] = v7;
  v13[7] = v9;
  v13[8] = v11;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

}

void __57__CKGroupAcknowledgmentVotingLayout__setupExpandedLayout__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  uint64_t v6;
  double v7;
  double Width;
  void *v9;
  void *v10;
  double Height;
  void *v12;
  double MinX;
  id v14;
  CGRect v15;
  CGRect v16;

  v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "expandedSection") <= a3
    && objc_msgSend(*(id *)(a1 + 32), "expandedSection") >= a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(*(id *)(a1 + 32), "expandedSection"));

    v7 = (double)v6 * 80.0;
    Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
    if (v7 < Width)
      v7 = Width;
    objc_msgSend(v14, "containerAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    Height = CGRectGetHeight(v15);

    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    MinX = CGRectGetMinX(v16);

    objc_msgSend(v9, "setFrame:", MinX, 0.0, v7, Height);
    objc_msgSend(v9, "setAlpha:", 1.0);
    objc_msgSend(v14, "_setContainerAttributes:forLayoutMode:", v9, 0);

  }
  else
  {
    objc_msgSend(v14, "_applyAlphaToAllAttributesAlpha:", 0.0);
  }

}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (-[CKGroupAcknowledgmentVotingLayout isAnimatedLayoutChange](self, "isAnimatedLayoutChange"))
  {
    -[CKGroupAcknowledgmentVotingLayout fromContentOffset](self, "fromContentOffset");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKGroupAcknowledgmentVotingLayout;
    -[CKGroupAcknowledgmentVotingLayout targetContentOffsetForProposedContentOffset:](&v8, sel_targetContentOffsetForProposedContentOffset_, x, y);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)prepareLayout
{
  void *v3;

  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CKGroupAcknowledgmentVotingLayout _initializeBallotItems](self, "_initializeBallotItems");
  if (-[CKGroupAcknowledgmentVotingLayout layoutMode](self, "layoutMode") == 1)
  {
    -[CKGroupAcknowledgmentVotingLayout _setupCollapsedLayout](self, "_setupCollapsedLayout");
  }
  else if (!-[CKGroupAcknowledgmentVotingLayout layoutMode](self, "layoutMode"))
  {
    -[CKGroupAcknowledgmentVotingLayout _setupExpandedLayout](self, "_setupExpandedLayout");
  }
}

- (void)finalizeAnimatedBoundsChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKGroupAcknowledgmentVotingLayout;
  -[CKGroupAcknowledgmentVotingLayout finalizeAnimatedBoundsChange](&v3, sel_finalizeAnimatedBoundsChange);
  if (-[CKGroupAcknowledgmentVotingLayout layoutMode](self, "layoutMode") == 1)
    -[CKGroupAcknowledgmentVotingLayout setExpandedSection:](self, "setExpandedSection:", 0x7FFFFFFFFFFFFFFFLL);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "avatarAttributesCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "item");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (-[CKGroupAcknowledgmentVotingLayout isAnimatedLayoutChange](self, "isAnimatedLayoutChange"))
    -[CKGroupAcknowledgmentVotingLayout fromBallotItems](self, "fromBallotItems");
  else
    -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarAttributesCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "item");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarAttributesCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "item");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;

  v7 = a3;
  v8 = a4;
  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKAcknowledgmentVoteCountCollectionReusableView supplementaryViewKind](CKAcknowledgmentVoteCountCollectionReusableView, "supplementaryViewKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  if (v12)
  {
    objc_msgSend(v10, "voteCountAttributes");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v17 = (void *)v13;
    goto LABEL_8;
  }
  +[CKAvatarContactNameCollectionReusableView supplementaryViewKind](CKAvatarContactNameCollectionReusableView, "supplementaryViewKind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isEqualToString:", v14);

  if (!v15)
  {
    +[CKAcknowledgmentIconCollectionReusableView supplementaryViewKind](CKAcknowledgmentIconCollectionReusableView, "supplementaryViewKind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "isEqualToString:", v18);

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKGroupAcknowledgmentVotingLayout.m"), 447, CFSTR("Trying to return an unsupported supplementaryView"));

      v17 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v10, "ackIconAttributes");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v10, "nameAttributesCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v8, "item"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v17;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;

  v7 = a3;
  v8 = a4;
  if (-[CKGroupAcknowledgmentVotingLayout isAnimatedLayoutChange](self, "isAnimatedLayoutChange"))
    -[CKGroupAcknowledgmentVotingLayout fromBallotItems](self, "fromBallotItems");
  else
    -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAcknowledgmentVoteCountCollectionReusableView supplementaryViewKind](CKAcknowledgmentVoteCountCollectionReusableView, "supplementaryViewKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  if (v12)
  {
    objc_msgSend(v10, "voteCountAttributes");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v17 = (void *)v13;
    goto LABEL_11;
  }
  +[CKAvatarContactNameCollectionReusableView supplementaryViewKind](CKAvatarContactNameCollectionReusableView, "supplementaryViewKind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isEqualToString:", v14);

  if (!v15)
  {
    +[CKAcknowledgmentIconCollectionReusableView supplementaryViewKind](CKAcknowledgmentIconCollectionReusableView, "supplementaryViewKind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "isEqualToString:", v18);

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKGroupAcknowledgmentVotingLayout.m"), 470, CFSTR("Trying to return an unsupported supplementaryView"));

      v17 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v10, "ackIconAttributes");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v10, "nameAttributesCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v8, "item"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v17;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;

  v7 = a3;
  v8 = a4;
  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAcknowledgmentVoteCountCollectionReusableView supplementaryViewKind](CKAcknowledgmentVoteCountCollectionReusableView, "supplementaryViewKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  if (v12)
  {
    objc_msgSend(v10, "voteCountAttributes");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v17 = (void *)v13;
    goto LABEL_8;
  }
  +[CKAvatarContactNameCollectionReusableView supplementaryViewKind](CKAvatarContactNameCollectionReusableView, "supplementaryViewKind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isEqualToString:", v14);

  if (!v15)
  {
    +[CKAcknowledgmentIconCollectionReusableView supplementaryViewKind](CKAcknowledgmentIconCollectionReusableView, "supplementaryViewKind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "isEqualToString:", v18);

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKGroupAcknowledgmentVotingLayout.m"), 493, CFSTR("Trying to return an unsupported supplementaryView"));

      v17 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v10, "ackIconAttributes");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v10, "nameAttributesCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v8, "item"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v17;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CKGroupAcknowledgmentVotingLayout ballotItems](self, "ballotItems", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "containerAttributes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        if (CGRectIntersectsRect(v29, v30))
        {
          objc_msgSend(v16, "ackIconAttributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v18);

          objc_msgSend(v16, "voteCountAttributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v19);

          objc_msgSend(v16, "avatarAttributesCollection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v20);

          objc_msgSend(v16, "nameAttributesCollection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v21);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  return v10;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)expandedSection
{
  return self->_expandedSection;
}

- (void)setExpandedSection:(int64_t)a3
{
  self->_expandedSection = a3;
}

- (CGPoint)previousCollapsedContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousCollapsedContentOffset.x;
  y = self->_previousCollapsedContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousCollapsedContentOffset:(CGPoint)a3
{
  self->_previousCollapsedContentOffset = a3;
}

- (NSArray)ballotItems
{
  return self->_ballotItems;
}

- (void)setBallotItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)isAnimatedLayoutChange
{
  return self->_isAnimatedLayoutChange;
}

- (void)setIsAnimatedLayoutChange:(BOOL)a3
{
  self->_isAnimatedLayoutChange = a3;
}

- (NSArray)fromBallotItems
{
  return self->_fromBallotItems;
}

- (void)setFromBallotItems:(id)a3
{
  objc_storeStrong((id *)&self->_fromBallotItems, a3);
}

- (CGSize)fromContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fromContentSize.width;
  height = self->_fromContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFromContentSize:(CGSize)a3
{
  self->_fromContentSize = a3;
}

- (CGPoint)fromContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_fromContentOffset.x;
  y = self->_fromContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFromContentOffset:(CGPoint)a3
{
  self->_fromContentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromBallotItems, 0);
  objc_storeStrong((id *)&self->_ballotItems, 0);
}

@end
