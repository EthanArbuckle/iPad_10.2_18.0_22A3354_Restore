@implementation CNContactGridViewLayout

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  objc_msgSend(v4, "setSectionInset:");
  -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
  objc_msgSend(v4, "setMinimumLineSpacing:");
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  objc_msgSend(v4, "setItemSize:");
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  objc_msgSend(v4, "setMinimumInteritemSpacing:");
  objc_msgSend(v4, "setNumberOfColumns:", -[CNContactGridViewLayout numberOfColumns](self, "numberOfColumns"));
  return v4;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactGridViewLayout;
  -[CNContactGridViewLayout prepareForCollectionViewUpdates:](&v3, sel_prepareForCollectionViewUpdates_, a3);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v4;
  void *v5;
  void *v6;
  NSInteger v7;
  NSInteger v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  CNContactGridViewLayout *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)CNContactGridViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v28, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4;
  if (self->_selectedIndexPath)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CNContactGridViewLayout numberOfColumns](self, "numberOfColumns");
    v7 = -[NSIndexPath section](self->_selectedIndexPath, "section");
    v22 = self;
    v8 = -[NSIndexPath item](self->_selectedIndexPath, "item");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      v13 = v8 / v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v15 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v14);
          objc_msgSend(v15, "indexPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "section");
          v18 = objc_msgSend(v16, "item");
          if (v17 == v7 && v18 / v23 == v13)
          {
            -[CNContactGridViewLayout layoutAttributesForItemAtIndexPath:](v22, "layoutAttributesForItemAtIndexPath:", v16);
            v19 = objc_claimAutoreleasedReturnValue();

            v15 = (id)v19;
          }
          objc_msgSend(v6, "addObject:", v15);

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v11);
    }

    v5 = v21;
  }

  return v6;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSInteger v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v32;
  void *v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CNContactGridViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v34, sel_layoutAttributesForItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (self->_selectedIndexPath)
  {
    v33 = v6;
    if (-[CNContactGridViewLayout needsUpdateLayout](self, "needsUpdateLayout"))
    {
      -[CNContactGridViewLayout _updateLayoutMetrics](self, "_updateLayoutMetrics");
      -[CNContactGridViewLayout setNeedsUpdateLayout:](self, "setNeedsUpdateLayout:", 0);
    }
    v7 = -[NSIndexPath section](self->_selectedIndexPath, "section");
    v8 = objc_msgSend(v4, "section");
    v9 = -[CNContactGridViewLayout numberOfColumns](self, "numberOfColumns");
    v10 = -[NSIndexPath item](self->_selectedIndexPath, "item");
    v11 = objc_msgSend(v4, "item");
    v12 = -[NSIndexPath item](self->_selectedIndexPath, "item");
    v13 = objc_msgSend(v4, "item");
    -[CNContactGridViewLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v14, "_shouldReverseLayoutDirection");

    v15 = v8 == v7;
    v6 = v33;
    if (v15 && v13 / v9 == v12 / v9)
    {
      v16 = v10 % v9;
      v17 = v11 % v9;
      objc_msgSend(v33, "frame");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      if (v17 == v16)
      {
        -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
        v27 = v19 + v26;
        if (v32)
        {
          -[CNContactGridViewLayout selectedItemWidthOffset](self, "selectedItemWidthOffset");
          v27 = v27 - v28;
        }
        -[CNContactGridViewLayout selectedItemWidthOffset](self, "selectedItemWidthOffset");
        v23 = v23 + v29;
      }
      else
      {
        if (v17 < v16)
          -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
        else
          -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
        v27 = v19 + v30;
      }
      objc_msgSend(v33, "setFrame:", v27, v21, v23, v25);
    }
  }

  return v6;
}

- (void)_updateLayoutMetrics
{
  void *v3;
  int v4;
  double v5;
  uint64_t v6;
  NSInteger v7;
  void *v8;
  double Width;
  double v10;
  NSInteger v11;
  double v12;
  double v13;
  double v14;
  NSIndexPath *selectedIndexPath;
  void *v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double MinX;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double MaxX;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  objc_super v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  -[CNContactGridViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");

  if (v4)
    v5 = -1.0;
  else
    v5 = 1.0;
  v6 = -[CNContactGridViewLayout numberOfColumns](self, "numberOfColumns");
  v7 = -[NSIndexPath item](self->_selectedIndexPath, "item") % v6;
  -[CNContactGridViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  Width = CGRectGetWidth(v98);

  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v11 = v6 - 1;
  v12 = (Width - (double)v6 * v10) / (double)(v6 - 1);
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v14 = v13;
  selectedIndexPath = self->_selectedIndexPath;
  v97.receiver = self;
  v97.super_class = (Class)CNContactGridViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v97, sel_layoutAttributesForItemAtIndexPath_, selectedIndexPath);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  v94 = Width;
  v96 = v14;
  if (v7 >= v11)
  {
    v25 = 0.0;
    if ((v4 & 1) == 0)
    {
      -[CNContactGridViewLayout collectionView](self, "collectionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      v25 = CGRectGetWidth(v99);

    }
  }
  else if (v4)
  {
    v25 = CGRectGetMinX(*(CGRect *)&v17) - v12;
  }
  else
  {
    v25 = v12 + CGRectGetMaxX(*(CGRect *)&v17);
  }
  -[CNContactGridViewLayout collectionView](self, "collectionView", *(_QWORD *)&v94);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "cellForItemAtIndexPath:", self->_selectedIndexPath);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "maximumActionsWidth");
  v30 = v29;
  objc_msgSend((id)objc_opt_class(), "actionsLeftMargin");
  -[CNContactGridViewLayout setSelectedItemWidthOffset:](self, "setSelectedItemWidthOffset:", v30 + v31);
  -[CNContactGridViewLayout selectedItemWidthOffset](self, "selectedItemWidthOffset");
  v33 = v32;
  v34 = v21;
  v35 = v22;
  v36 = v23;
  v37 = v24;
  if (v4)
    v38 = CGRectGetMinX(*(CGRect *)&v34) - v25;
  else
    v38 = v25 - CGRectGetMaxX(*(CGRect *)&v34);
  v39 = v33 - v38;
  if (v39 <= 0.0)
  {
    v66 = 0.0;
    -[CNContactGridViewLayout setOffsetBefore:](self, "setOffsetBefore:", 0.0);
LABEL_32:
    -[CNContactGridViewLayout setOffsetAfter:](self, "setOffsetAfter:", v66);
    goto LABEL_33;
  }
  v40 = v96 + v12;
  -[CNContactGridViewLayout setOffsetBefore:](self, "setOffsetBefore:", -(v5 * v39) * 0.5);
  -[CNContactGridViewLayout setOffsetAfter:](self, "setOffsetAfter:", v5 * v39 * 0.5);
  v41 = v21;
  v42 = v22;
  v43 = v23;
  v44 = v24;
  if (v4)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v41);
    -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
    v47 = MinX + v46;
    -[CNContactGridViewLayout selectedItemWidthOffset](self, "selectedItemWidthOffset");
    v49 = v47 - v48;
    if (v49 < 0.0)
    {
      -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
      -[CNContactGridViewLayout setOffsetBefore:](self, "setOffsetBefore:", v50 - v49);
      -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
      -[CNContactGridViewLayout setOffsetAfter:](self, "setOffsetAfter:", v51 - v49);
    }
    v100.origin.x = v21;
    v100.origin.y = v22;
    v100.size.width = v23;
    v100.size.height = v24;
    MaxX = CGRectGetMaxX(v100);
    -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
    v54 = MaxX + v53 - v95;
    if (v54 > 0.0)
    {
      -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
      -[CNContactGridViewLayout setOffsetBefore:](self, "setOffsetBefore:", v55 - v54);
      -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
      -[CNContactGridViewLayout setOffsetAfter:](self, "setOffsetAfter:", v56 - v54);
    }
    v101.origin.x = v21;
    v101.origin.y = v22;
    v101.size.width = v23;
    v101.size.height = v24;
    v57 = CGRectGetMaxX(v101);
    -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
    v59 = v57 + v58 - v95 - ceil((v57 + v58 - v95) / v40) * v40;
    -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
    -[CNContactGridViewLayout setOffsetBefore:](self, "setOffsetBefore:", v60 - v59);
    -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
    -[CNContactGridViewLayout setOffsetAfter:](self, "setOffsetAfter:", v61 - v59);
    v102.origin.x = v21;
    v102.origin.y = v22;
    v102.size.width = v23;
    v102.size.height = v24;
    v62 = CGRectGetMinX(v102) - v40;
    -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
    v64 = v62 + v63;
    if (v64 <= 0.0)
    {
      -[UICollectionViewFlowLayout itemSize](self, "itemSize");
      v65 = v64 + v88;
    }
    else
    {
      v65 = v64 - floor(v64 / v40) * v40;
    }
    -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
    v66 = v89 - v65;
    goto LABEL_32;
  }
  v67 = CGRectGetMaxX(*(CGRect *)&v41);
  -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
  v69 = v67 + v68;
  -[CNContactGridViewLayout selectedItemWidthOffset](self, "selectedItemWidthOffset");
  v71 = v69 + v70 - v95;
  if (v71 > 0.0)
  {
    -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
    -[CNContactGridViewLayout setOffsetBefore:](self, "setOffsetBefore:", v72 - v71);
    -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
    -[CNContactGridViewLayout setOffsetAfter:](self, "setOffsetAfter:", v73 - v71);
  }
  v103.origin.x = v21;
  v103.origin.y = v22;
  v103.size.width = v23;
  v103.size.height = v24;
  v74 = CGRectGetMinX(v103);
  -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
  v76 = v74 + v75;
  if (v74 + v75 < 0.0)
  {
    -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
    -[CNContactGridViewLayout setOffsetBefore:](self, "setOffsetBefore:", v77 - v76);
    -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
    -[CNContactGridViewLayout setOffsetAfter:](self, "setOffsetAfter:", v78 - v76);
  }
  v104.origin.x = v21;
  v104.origin.y = v22;
  v104.size.width = v23;
  v104.size.height = v24;
  v79 = CGRectGetMinX(v104);
  -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
  v81 = v79 + v80 - floor((v79 + v80) / v40) * v40;
  -[CNContactGridViewLayout offsetBefore](self, "offsetBefore");
  -[CNContactGridViewLayout setOffsetBefore:](self, "setOffsetBefore:", v82 - v81);
  -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
  -[CNContactGridViewLayout setOffsetAfter:](self, "setOffsetAfter:", v83 - v81);
  v105.origin.x = v21;
  v105.origin.y = v22;
  v105.size.width = v23;
  v105.size.height = v24;
  v84 = v40 + CGRectGetMaxX(v105);
  -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
  v86 = v95 - (v84 + v85);
  if (v86 > 0.0)
  {
    -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
    v66 = v86 - floor(v86 / v40) * v40 + v87;
    goto LABEL_32;
  }
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  if (v90 > -v86)
  {
    -[UICollectionViewFlowLayout itemSize](self, "itemSize");
    v92 = v86 + v91;
    -[CNContactGridViewLayout offsetAfter](self, "offsetAfter");
    v66 = v93 + v92;
    goto LABEL_32;
  }
LABEL_33:

}

- (void)setSelectedIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *v6;

  v5 = (NSIndexPath *)a3;
  if (self->_selectedIndexPath != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    -[CNContactGridViewLayout setNeedsUpdateLayout:](self, "setNeedsUpdateLayout:", 1);
    v5 = v6;
  }

}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CNContactGridViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
  v13[3] = &unk_1E204D588;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(v13);
  v11 = _Block_copy(v10);

  return v11;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (BOOL)needsUpdateLayout
{
  return self->_needsUpdateLayout;
}

- (void)setNeedsUpdateLayout:(BOOL)a3
{
  self->_needsUpdateLayout = a3;
}

- (double)offsetBefore
{
  return self->_offsetBefore;
}

- (void)setOffsetBefore:(double)a3
{
  self->_offsetBefore = a3;
}

- (double)offsetAfter
{
  return self->_offsetAfter;
}

- (void)setOffsetAfter:(double)a3
{
  self->_offsetAfter = a3;
}

- (double)selectedItemWidthOffset
{
  return self->_selectedItemWidthOffset;
}

- (void)setSelectedItemWidthOffset:(double)a3
{
  self->_selectedItemWidthOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
}

void __77__CNContactGridViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, uint64_t);

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v4[2](v4, 1);

}

@end
