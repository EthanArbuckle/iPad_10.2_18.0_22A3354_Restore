@implementation SUUIShelfCollectionViewLayout

+ (double)snapToBoundariesDecelerationRate
{
  return 0.8;
}

+ (BOOL)collectionViewCanClipToBounds
{
  return 1;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SUUIShelfLayoutData totalContentSize](self->_layoutData, "totalContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int ShouldReverseLayoutDirection;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  SUUIShelfLayoutData *layoutData;
  uint64_t v25;
  SUUIShelfLayoutData *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t *v32;
  int64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  double v38;
  double v39;
  double y;
  int64_t v41;
  id v42;
  _QWORD v43[10];
  _QWORD v44[4];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[11];
  char v52;
  _QWORD v53[3];
  double v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfLayoutData contentInset](self->_layoutData, "contentInset");
  v8 = v7;
  v10 = v9;
  v39 = v11;
  v13 = v12;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v55 = 0;
  v56 = &v55;
  v57 = 0x3010000000;
  v59 = 0;
  v60 = 0;
  v58 = "";
  -[SUUIShelfLayoutData columnSpacing](self->_layoutData, "columnSpacing");
  v16 = v15;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0.0;
  v17 = v10;
  if (ShouldReverseLayoutDirection)
  {
    v38 = v13;
    v18 = x;
    v19 = height;
    v20 = v16;
    -[SUUIShelfLayoutData totalContentSize](self->_layoutData, "totalContentSize", v10);
    v17 = v21 - v10;
    v16 = v20;
    height = v19;
    x = v18;
    v13 = v38;
  }
  v22 = x + v10;
  v23 = width - (v10 + v13);
  v54 = v17;
  layoutData = self->_layoutData;
  v25 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __67__SUUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v51[3] = &unk_2511FB900;
  v52 = ShouldReverseLayoutDirection ^ 1;
  *(double *)&v51[6] = v22;
  *(double *)&v51[7] = y + v8;
  *(double *)&v51[8] = v23;
  *(double *)&v51[9] = height - (v8 + v39);
  v51[4] = v53;
  v51[5] = &v55;
  v51[10] = v16;
  -[SUUIShelfLayoutData enumerateColumnsUsingBlock:](layoutData, "enumerateColumnsUsingBlock:", v51);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3010000000;
  v49 = 0;
  v50 = 0;
  v48 = "";
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  *(double *)&v44[3] = v8;
  v26 = self->_layoutData;
  v43[0] = v25;
  v43[1] = 3221225472;
  v43[2] = __67__SUUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v43[3] = &unk_2511FB928;
  *(double *)&v43[6] = v22;
  *(double *)&v43[7] = y + v8;
  *(double *)&v43[8] = v23;
  *(double *)&v43[9] = height - (v8 + v39);
  v43[4] = v44;
  v43[5] = &v45;
  -[SUUIShelfLayoutData enumerateRowsUsingBlock:](v26, "enumerateRowsUsingBlock:", v43);
  -[SUUIShelfCollectionViewLayout collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v28 = 0;
  }
  v29 = objc_msgSend(v27, "numberOfItemsInSection:", 0);
  v41 = -[SUUIShelfLayoutData numberOfRows](self->_layoutData, "numberOfRows");
  v30 = v56;
  v31 = v56[4];
  if (v31 < v56[5] + v31)
  {
    v32 = v46;
    v33 = v31 * v41;
    do
    {
      v34 = v32[4];
      if (v34 < v32[5] + v34)
      {
        do
        {
          if ((uint64_t)(v33 + v34) < v29)
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUUIShelfCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "collectionView:layout:willApplyLayoutAttributes:", v27, self, v36);
            objc_msgSend(v42, "addObject:", v36);

            v32 = v46;
          }
          ++v34;
        }
        while (v34 < v32[5] + v32[4]);
        v30 = v56;
      }
      ++v31;
      v33 += v41;
    }
    while (v31 < v30[5] + v30[4]);
  }

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v55, 8);
  return v42;
}

double __67__SUUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3, double a4)
{
  double MaxX;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  double v16;
  uint64_t v17;
  double result;

  if (*(_BYTE *)(a1 + 88))
  {
    MaxX = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v9 = *(double *)(a1 + 48);
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 48));
    v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  if (MaxX <= v9)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2
                                                              - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 32)
                                                              + 1;
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 72);
  if (*(_BYTE *)(a1 + 88))
    v15 = v10 >= CGRectGetMaxX(*(CGRect *)&v11) - a4;
  else
    v15 = v10 <= CGRectGetMinX(*(CGRect *)&v11) + a4;
  *a3 = v15;
  v16 = *(double *)(a1 + 80) + a4;
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(a1 + 88))
    v16 = -v16;
  result = *(double *)(v17 + 24) + v16;
  *(double *)(v17 + 24) = result;
  return result;
}

double __67__SUUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3, double a4)
{
  double v6;
  uint64_t v7;
  double result;

  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) <= *(double *)(a1 + 56))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2
                                                              - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 32)
                                                              + 1;
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *a3 = v6 >= CGRectGetMaxY(*(CGRect *)(a1 + 48)) - a4;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v7 + 24) + a4;
  *(double *)(v7 + 24) = result;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t i;
  double v16;
  double v17;
  double v18;
  uint64_t j;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t k;
  double v25;
  double v26;
  double v27;
  double v28;

  v4 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfCollectionViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

  -[SUUIShelfLayoutData contentInset](self->_layoutData, "contentInset");
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v4, "item");
  v13 = -[SUUIShelfLayoutData numberOfRows](self->_layoutData, "numberOfRows");
  v14 = v12 / v13;
  if ((storeShouldReverseLayoutDirection() & 1) != 0)
  {
    for (i = -[SUUIShelfLayoutData numberOfColumns](self->_layoutData, "numberOfColumns") - 1; i > v14; --i)
    {
      -[SUUIShelfLayoutData columnWidthForIndex:](self->_layoutData, "columnWidthForIndex:", i);
      v17 = v16;
      -[SUUIShelfLayoutData columnSpacing](self->_layoutData, "columnSpacing");
      v11 = v11 + v17 + v18;
    }
  }
  else if (v14 >= 1)
  {
    for (j = 0; j != v14; ++j)
    {
      -[SUUIShelfLayoutData columnWidthForIndex:](self->_layoutData, "columnWidthForIndex:", j);
      v21 = v20;
      -[SUUIShelfLayoutData columnSpacing](self->_layoutData, "columnSpacing");
      v11 = v11 + v21 + v22;
    }
  }
  v23 = v12 % v13;
  if (v23 >= 1)
  {
    for (k = 0; k != v23; ++k)
    {
      -[SUUIShelfLayoutData rowHeightForIndex:](self->_layoutData, "rowHeightForIndex:", k);
      v9 = v9 + v25;
    }
  }
  -[SUUIShelfLayoutData rowHeightForIndex:](self->_layoutData, "rowHeightForIndex:", v23);
  v27 = v26;
  -[SUUIShelfLayoutData columnWidthForIndex:](self->_layoutData, "columnWidthForIndex:", v14);
  objc_msgSend(v5, "setFrame:", v11, v9, v28, v27);

  return v5;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  uint64_t v8;
  SUUIShelfLayoutData *layoutData;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[10];
  _QWORD v16[4];
  objc_super v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v22 = 0;
  v23 = 0;
  v21 = "";
  v17.receiver = self;
  v17.super_class = (Class)SUUIShelfCollectionViewLayout;
  -[SUUIShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v17, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x);
  v22 = v7;
  v23 = v8;
  -[SUUIShelfLayoutData columnSpacing](self->_layoutData, "columnSpacing");
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  layoutData = self->_layoutData;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __99__SUUIShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke;
  v15[3] = &unk_2511FB950;
  v15[5] = &v18;
  v15[6] = v16;
  *(CGFloat *)&v15[7] = x;
  *(CGFloat *)&v15[8] = y;
  v15[9] = v10;
  v15[4] = self;
  -[SUUIShelfLayoutData enumerateColumnsUsingBlock:](layoutData, "enumerateColumnsUsingBlock:", v15);
  v11 = v19[4];
  v12 = v19[5];
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  v13 = v11;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

double __99__SUUIShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke(uint64_t a1, double a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double result;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(double *)(v6 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(double *)(v8 + 24);
  v10 = v9 + a2;
  if (v7 > v9 && v7 < v10)
  {
    v13 = *(double *)(a1 + 56);
    if (v13 > 0.0 || v13 >= 0.0 && v7 - v9 >= a2 * 0.5)
      v9 = v10 + *(double *)(a1 + 72);
    *(double *)(v6 + 32) = v9;
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    objc_msgSend(v14, "contentSize");
    v17 = v16;
    objc_msgSend(v14, "bounds");
    v19 = v17 - v18;
    if (v15 < v17 - v18)
      v19 = v15;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v19;
    *a4 = 1;

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(double *)(v8 + 24);
  }
  result = *(double *)(a1 + 72) + a2 + v9;
  *(double *)(v8 + 24) = result;
  return result;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 1;
}

- (SUUIShelfLayoutData)layoutData
{
  return self->_layoutData;
}

- (void)setLayoutData:(id)a3
{
  objc_storeStrong((id *)&self->_layoutData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutData, 0);
}

@end
