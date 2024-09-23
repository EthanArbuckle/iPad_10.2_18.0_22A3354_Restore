@implementation AVTEdgeDisappearingCollectionViewLayout

- (BOOL)isRTL
{
  void *v2;
  char v3;

  -[AVTEdgeDisappearingCollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldReverseLayoutDirection");

  return v3;
}

- (void)prepareLayout
{
  objc_super v3;

  -[AVTEdgeDisappearingCollectionViewLayout setFixedHeaderLayoutAttributes:](self, "setFixedHeaderLayoutAttributes:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVTEdgeDisappearingCollectionViewLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v3, sel_prepareLayout);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AVTEdgeDisappearingCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v20, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (-[AVTEdgeDisappearingCollectionViewLayout pinHeaderToVisible](self, "pinHeaderToVisible"))
  {
    v6 = *MEMORY[0x1E0CEB3B8];
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)AVTEdgeDisappearingCollectionViewLayout;
    -[UICollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v19, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "addObject:", v8);
      -[AVTEdgeDisappearingCollectionViewLayout modifyLayoutAttributes:](self, "modifyLayoutAttributes:", v8);
      -[AVTEdgeDisappearingCollectionViewLayout setFixedHeaderLayoutAttributes:](self, "setFixedHeaderLayoutAttributes:", v8);
    }

  }
  if (-[AVTEdgeDisappearingCollectionViewLayout enableEdgeDisappearing](self, "enableEdgeDisappearing"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          -[AVTEdgeDisappearingCollectionViewLayout modifyLayoutAttributes:](self, "modifyLayoutAttributes:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v11);
    }

  }
  return v5;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTEdgeDisappearingCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v6, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVTEdgeDisappearingCollectionViewLayout enableEdgeDisappearing](self, "enableEdgeDisappearing"))
    -[AVTEdgeDisappearingCollectionViewLayout modifyLayoutAttributes:](self, "modifyLayoutAttributes:", v4);
  return v4;
}

- (void)modifyLayoutAttributes:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double MaxX;
  double v39;
  double v40;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double MinX;
  CGFloat rect;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v4 = a3;
  v5 = -[AVTEdgeDisappearingCollectionViewLayout isRTL](self, "isRTL");
  if (objc_msgSend(v4, "representedElementCategory"))
  {
    if (-[AVTEdgeDisappearingCollectionViewLayout pinHeaderToVisible](self, "pinHeaderToVisible"))
    {
      objc_msgSend(v4, "representedElementKind");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)*MEMORY[0x1E0CEB3B8];

      if (v6 == v7)
      {
        -[AVTEdgeDisappearingCollectionViewLayout collectionView](self, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bounds");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        -[AVTEdgeDisappearingCollectionViewLayout collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_effectiveContentInset");
        v19 = v10 + v18;
        v21 = v12 + v20;
        v23 = v14 - (v18 + v22);
        v25 = v16 - (v20 + v24);

        objc_msgSend(v4, "frame");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        rect = v21;
        v34 = v19;
        v35 = v21;
        v36 = v23;
        v37 = v25;
        if (v5)
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v34);
          v68.origin.x = v27;
          v68.origin.y = v29;
          v68.size.width = v31;
          v68.size.height = v33;
          if (MaxX < CGRectGetMaxX(v68))
          {
            v69.origin.x = v19;
            v69.origin.y = rect;
            v69.size.width = v23;
            v69.size.height = v25;
            v39 = CGRectGetMaxX(v69);
            v70.origin.x = v27;
            v70.origin.y = v29;
            v70.size.width = v31;
            v70.size.height = v33;
            v27 = v39 - CGRectGetWidth(v70);
          }
        }
        else
        {
          MinX = CGRectGetMinX(*(CGRect *)&v34);
          v73.origin.x = v27;
          v73.origin.y = v29;
          v73.size.width = v31;
          v73.size.height = v33;
          if (MinX > CGRectGetMinX(v73))
          {
            v74.origin.x = v19;
            v74.origin.y = rect;
            v74.size.width = v23;
            v74.size.height = v25;
            v27 = CGRectGetMinX(v74);
          }
        }
        objc_msgSend(v4, "setFrame:", v27, v29, v31, v33);
      }
    }
  }
  else
  {
    objc_msgSend(v4, "frame");
    v44 = v40;
    if (v5)
    {
      v45 = CGRectGetMaxX(*(CGRect *)&v40);
      -[AVTEdgeDisappearingCollectionViewLayout collectionView](self, "collectionView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "contentOffset");
      v48 = v47;

      if (-[AVTEdgeDisappearingCollectionViewLayout pinHeaderToVisible](self, "pinHeaderToVisible"))
      {
        -[AVTEdgeDisappearingCollectionViewLayout fixedHeaderLayoutAttributes](self, "fixedHeaderLayoutAttributes");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          -[AVTEdgeDisappearingCollectionViewLayout fixedHeaderLayoutAttributes](self, "fixedHeaderLayoutAttributes");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "frame");
          v48 = CGRectGetMinX(v71);

        }
      }
      v51 = v45 - v48;
      v52 = -1.0;
    }
    else
    {
      -[AVTEdgeDisappearingCollectionViewLayout collectionView](self, "collectionView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "contentOffset");
      v55 = v54;

      if (-[AVTEdgeDisappearingCollectionViewLayout pinHeaderToVisible](self, "pinHeaderToVisible"))
      {
        -[AVTEdgeDisappearingCollectionViewLayout fixedHeaderLayoutAttributes](self, "fixedHeaderLayoutAttributes");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          -[AVTEdgeDisappearingCollectionViewLayout fixedHeaderLayoutAttributes](self, "fixedHeaderLayoutAttributes");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "frame");
          v55 = CGRectGetMaxX(v72);

        }
      }
      v51 = -(v44 - v55);
      v52 = 1.0;
    }
    objc_msgSend(v4, "size");
    v59 = v51 / v58;
    if (v59 > 1.0)
      v59 = 1.0;
    v60 = fmax(v59, 0.0);
    objc_msgSend(v4, "size");
    memset(&v67, 0, sizeof(v67));
    CGAffineTransformMakeTranslation(&v67, v52 * (v61 * (v60 * 0.5)), 0.0);
    v65 = v67;
    CGAffineTransformScale(&v66, &v65, 1.0 - v60, 1.0 - v60);
    v67 = v66;
    v64 = v66;
    objc_msgSend(v4, "setTransform:", &v64);
  }

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)enableEdgeDisappearing
{
  return self->_enableEdgeDisappearing;
}

- (void)setEnableEdgeDisappearing:(BOOL)a3
{
  self->_enableEdgeDisappearing = a3;
}

- (BOOL)pinHeaderToVisible
{
  return self->_pinHeaderToVisible;
}

- (void)setPinHeaderToVisible:(BOOL)a3
{
  self->_pinHeaderToVisible = a3;
}

- (UICollectionViewLayoutAttributes)fixedHeaderLayoutAttributes
{
  return self->_fixedHeaderLayoutAttributes;
}

- (void)setFixedHeaderLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_fixedHeaderLayoutAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedHeaderLayoutAttributes, 0);
}

@end
