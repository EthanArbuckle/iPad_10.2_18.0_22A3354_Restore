@implementation CEKWheelScrubberCollectionViewLayout

- (CEKWheelScrubberCollectionViewLayout)init
{
  CEKWheelScrubberCollectionViewLayout *v2;
  CEKWheelScrubberCollectionViewLayout *v3;
  CEKWheelScrubberCollectionViewLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEKWheelScrubberCollectionViewLayout;
  v2 = -[CEKWheelScrubberCollectionViewLayout init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_layoutDirection = 0;
    v2->_layoutOrder = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    -[CEKWheelScrubberCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)prepareLayout
{
  double v3;
  double MaxY;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double MaxX;
  void *v48;
  uint64_t v49;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat MidY;
  double v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  BOOL v62;
  uint64_t v63;
  void *v64;
  void *v65;
  int64_t v66;
  _QWORD v67[8];
  BOOL v68;
  objc_super v69;
  CGRect v70;
  CGRect v71;

  v69.receiver = self;
  v69.super_class = (Class)CEKWheelScrubberCollectionViewLayout;
  -[CEKWheelScrubberCollectionViewLayout prepareLayout](&v69, sel_prepareLayout);
  -[CEKWheelScrubberCollectionViewLayout contentInsets](self, "contentInsets");
  MaxY = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CEKWheelScrubberCollectionViewLayout collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CEKWheelScrubberCollectionViewLayout layoutDirection](self, "layoutDirection");
  v14 = -[CEKWheelScrubberCollectionViewLayout layoutOrder](self, "layoutOrder");
  v65 = v12;
  v15 = objc_msgSend(v12, "collectionView:numberOfItemsInSection:", v11, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "numberOfSections") + objc_msgSend(v11, "numberOfSections") * v15 - 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v13 == 0;
  v60 = v10;
  if (objc_msgSend(v11, "numberOfSections"))
  {
    v17 = 0;
    v63 = *MEMORY[0x1E0DC48A8];
    v64 = v11;
    if (v14 == 1)
      v18 = -1;
    else
      v18 = 1;
    v19 = 0.0;
    v66 = v14;
    while (1)
    {
      if (v17)
      {
        v20 = (void *)MEMORY[0x1E0DC3628];
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v63, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        WeakRetained = objc_loadWeakRetained((id *)&self->_wheelScrubberDelegate);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "wheelScrubberCollectionViewLayout:sizeForItemAtIndexPath:", self, v24);
        v26 = v25;

        +[CEKWheelScrubberSectionDividerView dividerViewWidth](CEKWheelScrubberSectionDividerView, "dividerViewWidth");
        if (v13)
          v28 = v26;
        else
          v28 = v27;
        if (v13)
          v29 = v27;
        else
          v29 = v26;
        objc_msgSend(v22, "setFrame:", v6, MaxY, v28, v29, v60);
        objc_msgSend(v16, "addObject:", v22);
        +[CEKWheelScrubberSectionDividerView dividerViewWidth](CEKWheelScrubberSectionDividerView, "dividerViewWidth");
        if (v13)
          v31 = v30;
        else
          v31 = -0.0;
        v32 = MaxY + v31;
        if (v13)
          v30 = -0.0;
        v33 = v6 + v30;

        v14 = v66;
      }
      else
      {
        v32 = MaxY;
        v33 = v6;
      }
      v34 = objc_msgSend(v65, "collectionView:numberOfItemsInSection:", v11, v17, v60);
      if (!v34)
        break;
      v35 = v34 - 1;
      if (v14 == 1)
        v36 = v34 - 1;
      else
        v36 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v36, v17);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_loadWeakRetained((id *)&self->_wheelScrubberDelegate);
        objc_msgSend(v38, "wheelScrubberCollectionViewLayout:sizeForItemAtIndexPath:", self, v37);
        v40 = v39;
        v42 = v41;

        v43 = v33;
        v44 = v32;
        v45 = v40;
        v46 = v42;
        if (v13)
        {
          MaxY = CGRectGetMaxY(*(CGRect *)&v43);
          v70.origin.x = v33;
          v70.origin.y = v32;
          v70.size.width = v40;
          v70.size.height = v42;
          MaxX = CGRectGetMaxX(v70);
          v6 = v33;
        }
        else
        {
          v6 = CGRectGetMaxX(*(CGRect *)&v43);
          v71.origin.x = v33;
          v71.origin.y = v32;
          v71.size.width = v40;
          v71.size.height = v42;
          MaxX = CGRectGetMaxY(v71);
          MaxY = v32;
        }
        if (v19 < MaxX)
          v19 = MaxX;
        objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v37);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setFrame:", v33, v32, v40, v42);
        objc_msgSend(v16, "addObject:", v48);
        v36 += v18;

        v33 = v6;
        v32 = MaxY;
      }
      while (v36 <= v35);
      ++v17;
      v11 = v64;
      v14 = v66;
      if (v17 >= objc_msgSend(v64, "numberOfSections"))
        goto LABEL_33;
    }
  }
  else
  {
    v19 = 0.0;
LABEL_33:
    objc_msgSend(v11, "bounds", v60);
    v53 = v51;
    v54 = v52;
    if (v13)
    {
      MidY = CGRectGetMidY(*(CGRect *)&v49);
      v6 = v19;
      v19 = MaxY;
      v53 = v54;
    }
    else
    {
      MidY = CGRectGetMidX(*(CGRect *)&v49);
    }
    v56 = v8 + v19;
    objc_msgSend(v11, "traitCollection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "displayScale");
    v59 = v58;

    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __53__CEKWheelScrubberCollectionViewLayout_prepareLayout__block_invoke;
    v67[3] = &unk_1E70A5210;
    v68 = v62;
    v67[4] = self;
    *(CGFloat *)&v67[5] = MidY;
    *(double *)&v67[6] = v53 * 0.5;
    v67[7] = v59;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v67);
    -[CEKWheelScrubberCollectionViewLayout _setCachedContentSize:](self, "_setCachedContentSize:", v61 + v6, v56);
    -[CEKWheelScrubberCollectionViewLayout _setCachedLayoutAttributesCells:](self, "_setCachedLayoutAttributesCells:", v16);
  }

}

void __53__CEKWheelScrubberCollectionViewLayout_prepareLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double MinX;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double MaxX;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MidX;
  double MidY;
  double v26;
  double v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGRect v30;
  CGRect v31;

  v3 = a2;
  objc_msgSend(v3, "frame");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  if (*(_BYTE *)(a1 + 64))
    MinX = CGRectGetMinX(*(CGRect *)&v4);
  else
    MinX = CGRectGetMinY(*(CGRect *)&v4);
  v13 = MinX;
  v14 = v8;
  v15 = v9;
  v16 = v10;
  v17 = v11;
  if (*(_BYTE *)(a1 + 64))
    MaxX = CGRectGetMaxX(*(CGRect *)&v14);
  else
    MaxX = CGRectGetMaxY(*(CGRect *)&v14);
  v19 = MaxX;
  objc_msgSend(*(id *)(a1 + 32), "_circularlyWrapped:forCenter:radius:scale:", v13, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v21 = v20;
  objc_msgSend(*(id *)(a1 + 32), "_circularlyWrapped:forCenter:radius:scale:", v19, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v23 = v22;
  if (*(_BYTE *)(a1 + 64))
  {
    MidX = (v21 + v22) * 0.5;
    v30.origin.x = v8;
    v30.origin.y = v9;
    v30.size.width = v10;
    v30.size.height = v11;
    MidY = CGRectGetMidY(v30);
    v26 = 1.0;
    v27 = 0.0;
    if (v10 > 0.0)
      v27 = (v23 - v21) / v10;
  }
  else
  {
    v31.origin.x = v8;
    v31.origin.y = v9;
    v31.size.width = v10;
    v31.size.height = v11;
    MidX = CGRectGetMidX(v31);
    MidY = (v21 + v23) * 0.5;
    v26 = 0.0;
    v27 = 1.0;
    if (v11 > 0.0)
      v26 = (v23 - v21) / v11;
  }
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v10, v11);
  objc_msgSend(v3, "setCenter:", MidX, MidY);
  CGAffineTransformMakeScale(&v29, v27, v26);
  v28 = v29;
  objc_msgSend(v3, "setTransform:", &v28);

}

- (double)_circularlyWrapped:(double)a3 forCenter:(double)a4 radius:(double)a5 scale:(double)a6
{
  double v6;
  long double v7;
  double result;

  v6 = (a3 - a4) / a5;
  v7 = -1.57079633;
  if (v6 >= -1.57079633)
  {
    v7 = v6;
    if (v6 > 1.57079633)
      v7 = 1.57079633;
  }
  sin(v7);
  UIRoundToScale();
  return result;
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->__cachedContentSize.width;
  height = self->__cachedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLayoutDirection:(int64_t)a3
{
  if (self->_layoutDirection != a3)
  {
    self->_layoutDirection = a3;
    -[CEKWheelScrubberCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setLayoutOrder:(int64_t)a3
{
  if (self->_layoutOrder != a3)
  {
    self->_layoutOrder = a3;
    -[CEKWheelScrubberCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CEKWheelScrubberCollectionViewLayout _cachedLayoutAttributesCells](self, "_cachedLayoutAttributesCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__CEKWheelScrubberCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v11[3] = &unk_1E70A5238;
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  v9 = v8;
  v12 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  return v9;
}

void __74__CEKWheelScrubberCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGRect v4;

  v3 = a2;
  objc_msgSend(v3, "frame");
  if (CGRectIntersectsRect(v4, *(CGRect *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_msgSend(a3, "item");
  -[CEKWheelScrubberCollectionViewLayout _cachedLayoutAttributesCells](self, "_cachedLayoutAttributesCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 0x8000000000000000) != 0 || v4 >= objc_msgSend(v5, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", *MEMORY[0x1E0DC48A8], a4);
}

- (CEKWheelScrubberCollectionViewLayoutDelegate)wheelScrubberDelegate
{
  return (CEKWheelScrubberCollectionViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_wheelScrubberDelegate);
}

- (void)setWheelScrubberDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wheelScrubberDelegate, a3);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)layoutOrder
{
  return self->_layoutOrder;
}

- (CGSize)_cachedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->__cachedContentSize.width;
  height = self->__cachedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setCachedContentSize:(CGSize)a3
{
  self->__cachedContentSize = a3;
}

- (NSArray)_cachedLayoutAttributesCells
{
  return self->__cachedLayoutAttributesCells;
}

- (void)_setCachedLayoutAttributesCells:(id)a3
{
  objc_storeStrong((id *)&self->__cachedLayoutAttributesCells, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedLayoutAttributesCells, 0);
  objc_destroyWeak((id *)&self->_wheelScrubberDelegate);
}

@end
