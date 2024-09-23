@implementation LUIUserGridViewLayout

- (void)prepareLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSMutableDictionary *v38;
  id v39;
  void *v40;
  NSMutableDictionary *v41;
  unint64_t i;
  void *v43;
  id v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  id v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  NSMutableDictionary *v69;
  void *v70;
  void *v71;
  id v72;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewLayout collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewLayout collectionView](self, "collectionView"));
  v6 = objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v5, 0);

  v72 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewLayout layoutInfoForItemCount:](self, "layoutInfoForItemCount:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewLayout collectionView](self, "collectionView"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[LUIUserGridViewLayout edgeInsetsForCollectionViewFrame:layoutInfo:](self, "edgeInsetsForCollectionViewFrame:layoutInfo:", v72, v9, v11, v13, v15);
  v17 = v16;
  v19 = v18;
  v20 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](UICollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", UICollectionElementKindSectionHeader, v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[LUICollectionViewStyle sharedStyle](LUICollectionViewStyle, "sharedStyle"));
  objc_msgSend(v22, "headerEdgeInsets");
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewLayout collectionView](self, "collectionView"));
  objc_msgSend(v29, "frame");
  v31 = v30 - (v26 + v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[LUICollectionViewStyle sharedStyle](LUICollectionViewStyle, "sharedStyle"));
  objc_msgSend(v32, "fixedHeaderHeight");
  objc_msgSend(v21, "setFrame:", v26, v24, v31, v33);

  objc_msgSend(v21, "frame");
  v35 = v34;
  objc_msgSend(v21, "frame");
  v37 = v35 + v36;
  v38 = objc_opt_new(NSMutableDictionary);
  v70 = v21;
  v71 = (void *)v20;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v21, v20);
  v69 = v38;
  v39 = -[NSMutableDictionary copy](v38, "copy");
  v40 = (void *)qword_100088F48;
  qword_100088F48 = (uint64_t)v39;

  v41 = objc_opt_new(NSMutableDictionary);
  if (v6)
  {
    for (i = 0; (id)i != v6; ++i)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v44 = objc_msgSend(v43, "userInterfaceLayoutDirection");
      v45 = (unint64_t)objc_msgSend(v72, "columns");
      if (v44 == (id)1)
        v46 = v45 + ~(i % (unint64_t)objc_msgSend(v72, "columns"));
      else
        v46 = i % v45;

      v47 = i / (unint64_t)objc_msgSend(v72, "columns");
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", i, 0));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](UICollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v48));
      if (v17 < v37)
        v17 = v37;
      objc_msgSend(v72, "itemSize");
      v51 = v50;
      objc_msgSend(v72, "itemSpacing");
      v53 = v19 + (double)v46 * (v51 + v52);
      objc_msgSend(v72, "itemSize");
      v55 = v54;
      objc_msgSend(v72, "itemSpacing");
      v57 = v17 + (double)v47 * (v55 + v56);
      objc_msgSend(v72, "itemSize");
      v59 = v58;
      objc_msgSend(v72, "itemSize");
      objc_msgSend(v49, "setFrame:", v53, v57, v59, v60);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v49, v48);

    }
  }
  v61 = -[NSMutableDictionary copy](v41, "copy");
  v62 = (void *)qword_100088F50;
  qword_100088F50 = (uint64_t)v61;

  v63 = (double)(unint64_t)objc_msgSend(v72, "rows");
  objc_msgSend(v72, "itemSize");
  v65 = v64;
  objc_msgSend(v72, "itemSpacing");
  v67 = v37 + v63 * (v65 + v66);
  objc_msgSend(v72, "itemSpacing");
  qword_100088F58 = *(_QWORD *)&v13;
  unk_100088F60 = v68 + v67;

}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)&qword_100088F58;
  v3 = unk_100088F60;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_opt_new(NSMutableArray);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100088F48, "allValues"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "frame");
        v41.origin.x = v14;
        v41.origin.y = v15;
        v41.size.width = v16;
        v41.size.height = v17;
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        if (CGRectIntersectsRect(v39, v41))
          -[NSMutableArray addObject:](v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100088F50, "allValues", 0));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v23, "frame");
        v42.origin.x = v24;
        v42.origin.y = v25;
        v42.size.width = v26;
        v42.size.height = v27;
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        if (CGRectIntersectsRect(v40, v42))
          -[NSMutableArray addObject:](v7, "addObject:", v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v20);
  }

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", UICollectionElementKindSectionHeader))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100088F48, "objectForKeyedSubscript:", v5));
  else
    v6 = 0;

  return v6;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return objc_msgSend((id)qword_100088F50, "objectForKeyedSubscript:", a3);
}

- (id)layoutInfoForItemCount:(unint64_t)a3
{
  _LUILayoutInfo *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = objc_opt_new(_LUILayoutInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUICollectionViewStyle sharedStyle](LUICollectionViewStyle, "sharedStyle"));
  objc_msgSend(v5, "itemSizeForItemCount:", a3);
  v7 = v6;
  v9 = v8;

  -[_LUILayoutInfo setItemSize:](v4, "setItemSize:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUICollectionViewStyle sharedStyle](LUICollectionViewStyle, "sharedStyle"));
  objc_msgSend(v10, "gridInfoForItemCount:", a3);
  v12 = v11;
  v14 = v13;

  -[_LUILayoutInfo setRows:](v4, "setRows:", (unint64_t)v12);
  -[_LUILayoutInfo setColumns:](v4, "setColumns:", (unint64_t)v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[LUICollectionViewStyle sharedStyle](LUICollectionViewStyle, "sharedStyle"));
  objc_msgSend(v15, "itemSpacingForItemCount:", a3);
  v17 = v16;
  v19 = v18;

  -[_LUILayoutInfo setItemSpacing:](v4, "setItemSpacing:", v17, v19);
  return v4;
}

- (UIEdgeInsets)edgeInsetsForCollectionViewFrame:(CGRect)a3 layoutInfo:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v9;
  double left;
  CGFloat top;
  CGFloat bottom;
  double right;
  double v14;
  double v15;
  double v17;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  objc_msgSend(v9, "itemSize");
  if (v15 != CGSizeZero.width || v14 != CGSizeZero.height)
  {
    v34 = x;
    v35 = y;
    v36 = bottom;
    v17 = (double)(unint64_t)objc_msgSend(v9, "columns");
    objc_msgSend(v9, "itemSize");
    v19 = v18;
    v20 = (double)((unint64_t)objc_msgSend(v9, "columns") - 1);
    objc_msgSend(v9, "itemSpacing");
    v22 = v21 * v20 + v17 * v19;
    if (width <= v22)
    {
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
        sub_10003CAF0();
    }
    else
    {
      right = (width - v22) * 0.5;
      left = right;
    }
    v23 = (double)(unint64_t)objc_msgSend(v9, "rows");
    objc_msgSend(v9, "itemSize");
    v25 = v24;
    v26 = (double)((unint64_t)objc_msgSend(v9, "rows") - 1);
    objc_msgSend(v9, "itemSpacing");
    v28 = v27 * v26 + v23 * v25;
    if (height <= v28)
    {
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
        sub_10003CA88();
    }
    else
    {
      -[LUIUserGridViewLayout contentViewTopEdgeInsetForCollectionViewFrame:contentHeight:](self, "contentViewTopEdgeInsetForCollectionViewFrame:contentHeight:", v34, v35, width, height, v28);
      top = v29;
    }
    bottom = v36;
  }

  v30 = top;
  v31 = left;
  v32 = bottom;
  v33 = right;
  result.right = v33;
  result.bottom = v32;
  result.left = v31;
  result.top = v30;
  return result;
}

- (double)contentViewTopEdgeInsetForCollectionViewFrame:(CGRect)a3 contentHeight:(double)a4
{
  double y;
  void *v6;
  double v7;
  double v8;
  double result;

  if (a3.size.height <= a4)
    return 0.0;
  y = a3.origin.y;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", a3.origin.x, a3.origin.y, a3.size.width));
  objc_msgSend(v6, "bounds");
  v8 = v7 * 0.5;

  result = v8 - y - a4 * 0.5;
  if (result <= 0.0)
    return 0.0;
  return result;
}

@end
