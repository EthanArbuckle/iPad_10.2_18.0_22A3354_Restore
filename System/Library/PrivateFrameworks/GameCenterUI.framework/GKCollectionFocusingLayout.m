@implementation GKCollectionFocusingLayout

- (GKCollectionFocusingLayout)init
{
  GKCollectionFocusingLayout *v2;
  GKCollectionFocusingLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKCollectionFocusingLayout;
  v2 = -[UICollectionViewFlowLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_focusHeaderOffset = 20.0;
    -[GKCollectionFocusingLayout applyDefaults](v2, "applyDefaults");
  }
  return v3;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKCollectionFocusingLayout;
  -[GKCollectionFocusingLayout awakeFromNib](&v3, sel_awakeFromNib);
  -[GKCollectionFocusingLayout applyDefaults](self, "applyDefaults");
}

- (BOOL)shouldUpdateVisibleCellLayoutAttributes
{
  return 1;
}

- (void)setFocusedIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *focusedIndexPath;
  NSIndexPath *v7;
  void *v8;
  NSIndexPath *v9;
  uint64_t v10;
  uint64_t v11;
  double *(*v12)(uint64_t);
  void *v13;
  GKCollectionFocusingLayout *v14;
  NSIndexPath *v15;

  v5 = (NSIndexPath *)a3;
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath != v5)
  {
    v7 = focusedIndexPath;
    objc_storeStrong((id *)&self->_focusedIndexPath, a3);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __50__GKCollectionFocusingLayout_setFocusedIndexPath___block_invoke;
    v13 = &unk_1E59C4708;
    v14 = self;
    v15 = v7;
    v9 = v7;
    objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 4, &v10, 0, 0.3, 0.0);
    -[GKCollectionFocusingLayout invalidateLayout](self, "invalidateLayout", v10, v11, v12, v13, v14);

  }
}

double *__50__GKCollectionFocusingLayout_setFocusedIndexPath___block_invoke(uint64_t a1)
{
  double *result;

  objc_msgSend(*(id *)(a1 + 32), "_updateFocusOffsetsForSectionHeadersWithAnimationCoordinator:", 0);
  result = *(double **)(a1 + 32);
  if (result[70] != 1.0)
  {
    objc_msgSend(result, "_updateFocusFrameForCellAtIndexPath:", *(_QWORD *)(a1 + 40));
    return (double *)objc_msgSend(*(id *)(a1 + 32), "_updateFocusFrameForCellAtIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568));
  }
  return result;
}

- (void)_updateFocusOffsetsForSectionHeadersWithAnimationCoordinator:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  GKCollectionFocusingLayout *v27;
  unint64_t v28;
  double v29;
  _BOOL8 v30;
  _BOOL8 v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v4 = a3;
  -[GKCollectionFocusingLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = *MEMORY[0x1E0DC48A8];
    v10 = 0x1E0CB3000uLL;
    v32 = *MEMORY[0x1E0DC48A8];
    do
    {
      objc_msgSend(*(id *)(v10 + 1712), "indexPathForItem:inSection:", 0, v8, v32, v33[0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_visibleSupplementaryViewOfKind:atIndexPath:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[GKCollectionFocusingLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v9, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "frame");
        v15 = v14;
        objc_msgSend(v13, "frame");
        if (v15 != v16)
        {
          objc_msgSend(v12, "frame");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend(v13, "frame");
          v24 = v23;
          if (v4)
          {
            objc_msgSend(v12, "frame");
            v33[0] = MEMORY[0x1E0C809B0];
            v25 = v7;
            v26 = v5;
            v27 = self;
            v28 = v10;
            v30 = v29 <= v24;
            v33[1] = 3221225472;
            v33[2] = __91__GKCollectionFocusingLayout__updateFocusOffsetsForSectionHeadersWithAnimationCoordinator___block_invoke;
            v33[3] = &unk_1E59C7E78;
            v34 = v12;
            v35 = v18;
            v36 = v24;
            v37 = v20;
            v38 = v22;
            v31 = v30;
            v10 = v28;
            self = v27;
            v5 = v26;
            v7 = v25;
            v9 = v32;
            objc_msgSend(v4, "addCoordinatedAnimationsForAnimation:animations:completion:", v31, v33, 0);

          }
          else
          {
            objc_msgSend(v12, "setFrame:", v18, v23, v20, v22);
            objc_msgSend(v12, "layoutIfNeeded");
          }
        }

      }
      ++v8;
    }
    while (v7 != v8);
  }

}

uint64_t __91__GKCollectionFocusingLayout__updateFocusOffsetsForSectionHeadersWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateFocusFrameForCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v4 = a3;
  if (v4)
  {
    v20 = v4;
    -[GKCollectionFocusingLayout collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[GKCollectionFocusingLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v20);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v7, "frame");
      v22.origin.x = v16;
      v22.origin.y = v17;
      v22.size.width = v18;
      v22.size.height = v19;
      v21.origin.x = v9;
      v21.origin.y = v11;
      v21.size.width = v13;
      v21.size.height = v15;
      if (!CGRectEqualToRect(v21, v22))
      {
        objc_msgSend(v7, "frame");
        objc_msgSend(v6, "setFrame:");
        objc_msgSend(v6, "layoutIfNeeded");
      }

    }
    v4 = v20;
  }

}

- (UIEdgeInsets)sectionInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  UIEdgeInsets result;

  v22.receiver = self;
  v22.super_class = (Class)GKCollectionFocusingLayout;
  -[UICollectionViewFlowLayout sectionInset](&v22, sel_sectionInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[GKCollectionFocusingLayout collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionFocusingLayout collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionView:layout:insetForSectionAtIndex:", v13, self, 0);
    v4 = v14;
    v6 = v15;
    v8 = v16;
    v10 = v17;

  }
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (double)minimumInteritemSpacingForSectionAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKCollectionFocusingLayout;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](&v12, sel_minimumInteritemSpacing);
  v6 = v5;
  -[GKCollectionFocusingLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionFocusingLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:layout:minimumInteritemSpacingForSectionAtIndex:", v9, self, a3);
    v6 = v10;

  }
  return v6;
}

- (double)minimumLineSpacingForSectionAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKCollectionFocusingLayout;
  -[UICollectionViewFlowLayout minimumLineSpacing](&v12, sel_minimumLineSpacing);
  v6 = v5;
  -[GKCollectionFocusingLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionFocusingLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:layout:minimumLineSpacingForSectionAtIndex:", v9, self, a3);
    v6 = v10;

  }
  return v6;
}

- (CGSize)sizeForItemAtIndexPath:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v4 = a3;
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v6 = v5;
  v8 = v7;
  -[GKCollectionFocusingLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionFocusingLayout collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:layout:sizeForItemAtIndexPath:", v11, self, v4);
    v6 = v12;
    v8 = v13;

  }
  v14 = v6;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)sizeForHeaderInSection:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[UICollectionViewFlowLayout headerReferenceSize](self, "headerReferenceSize");
  v6 = v5;
  v8 = v7;
  -[GKCollectionFocusingLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionFocusingLayout collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:layout:referenceSizeForHeaderInSection:", v11, self, a3);
    v6 = v12;
    v8 = v13;

  }
  v14 = v6;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)sizeForFooterInSection:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[UICollectionViewFlowLayout footerReferenceSize](self, "footerReferenceSize");
  v6 = v5;
  v8 = v7;
  -[GKCollectionFocusingLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionFocusingLayout collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:layout:referenceSizeForFooterInSection:", v11, self, a3);
    v6 = v12;
    v8 = v13;

  }
  v14 = v6;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)focusAdjustedAttributesForItemAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = v4;
  if (self->_focusScaleFactor != 1.0)
  {
    objc_msgSend(v4, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionFocusingLayout focusedIndexPath](self, "focusedIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      v9 = (void *)objc_msgSend(v5, "copy");

      objc_msgSend(v9, "frame");
      objc_msgSend(v9, "setFrame:", v12 - (self->_focusScaleFactor * v10 - v10) * 0.5, v13 - (self->_focusScaleFactor * v11 - v11) * 0.5, self->_focusScaleFactor * v10, self->_focusScaleFactor * v11);
      v5 = v9;
    }
  }
  return v5;
}

- (id)focusAdjustedAttributesForSupplementaryViewAttributes:(id)a3
{
  id v4;
  NSIndexPath *focusedIndexPath;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MaxX;
  double MinY;
  double v29;
  double v30;
  double rect;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v4 = a3;
  focusedIndexPath = self->_focusedIndexPath;
  v6 = v4;
  if (focusedIndexPath)
  {
    v7 = -[NSIndexPath section](focusedIndexPath, "section");
    objc_msgSend(v4, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 < objc_msgSend(v8, "section"))
      goto LABEL_9;
    objc_msgSend(v4, "representedElementKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0DC48A8]);

    v6 = v4;
    if (v10)
    {
      -[GKCollectionFocusingLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", self->_focusedIndexPath);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v8, "frame");
      v23 = v19;
      v24 = v20;
      v25 = v21;
      v26 = v22;
      if (self->_focusScaleFactor == 1.0)
      {
        v23 = v19 - (v21 * 1.208 - v21) * 0.5;
        v24 = v20 - (v22 * 1.208 - v22) * 0.5;
        v26 = v22 * 1.208;
        v25 = v21 * 1.208;
      }
      v33.origin.x = v12;
      v33.origin.y = v14;
      v33.size.width = v16;
      v33.size.height = v18;
      rect = v18;
      MaxX = CGRectGetMaxX(v33);
      v34.origin.x = v23;
      v34.origin.y = v24;
      v34.size.width = v25;
      v34.size.height = v26;
      if (MaxX >= CGRectGetMinX(v34))
      {
        v35.origin.x = v23;
        v35.origin.y = v24;
        v35.size.width = v25;
        v35.size.height = v26;
        MinY = CGRectGetMinY(v35);
        v36.origin.x = v12;
        v36.origin.y = v14;
        v36.size.width = v16;
        v36.size.height = rect;
        v29 = MinY - CGRectGetMaxY(v36);
        v37.origin.x = v23;
        v37.origin.y = v24;
        v37.size.width = v25;
        v37.size.height = v26;
        if (v29 < CGRectGetHeight(v37) * 0.5)
        {
          v30 = v14 - self->_focusHeaderOffset;
          v6 = (void *)objc_msgSend(v4, "copy");

          objc_msgSend(v6, "setFrame:", v12, v30, v16, rect);
LABEL_10:

          goto LABEL_11;
        }
      }
LABEL_9:
      v6 = v4;
      goto LABEL_10;
    }
  }
LABEL_11:

  return v6;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKCollectionFocusingLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v7, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionFocusingLayout focusAdjustedAttributesForItemAttributes:](self, "focusAdjustedAttributesForItemAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKCollectionFocusingLayout;
  -[UICollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v8, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionFocusingLayout focusAdjustedAttributesForSupplementaryViewAttributes:](self, "focusAdjustedAttributesForSupplementaryViewAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)topHeaderHeight
{
  return self->_topHeaderHeight;
}

- (void)setTopHeaderHeight:(double)a3
{
  self->_topHeaderHeight = a3;
}

- (double)focusScaleFactor
{
  return self->_focusScaleFactor;
}

- (void)setFocusScaleFactor:(double)a3
{
  self->_focusScaleFactor = a3;
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (double)focusHeaderOffset
{
  return self->_focusHeaderOffset;
}

- (void)setFocusHeaderOffset:(double)a3
{
  self->_focusHeaderOffset = a3;
}

- (double)headerToItemSpacing
{
  return self->_headerToItemSpacing;
}

- (void)setHeaderToItemSpacing:(double)a3
{
  self->_headerToItemSpacing = a3;
}

- (UICollectionViewLayoutAttributes)topHeaderAttributes
{
  return self->_topHeaderAttributes;
}

- (void)setTopHeaderAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_topHeaderAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topHeaderAttributes, 0);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
}

@end
