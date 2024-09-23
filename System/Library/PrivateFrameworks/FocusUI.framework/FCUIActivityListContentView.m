@implementation FCUIActivityListContentView

- (void)setHeaderView:(id)a3
{
  char v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v7 = a3;
  v5 = BSEqualObjects();
  v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      -[UIView removeFromSuperview](self->_headerView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_headerView, a3);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __45__FCUIActivityListContentView_setHeaderView___block_invoke;
      v9[3] = &unk_24D20A9C0;
      v9[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v9);
      self->_headerViewValid = 1;
    }
    else
    {
      self->_headerViewValid = 0;
    }
    -[FCUIActivityListContentView setNeedsLayout](self, "setNeedsLayout", v7);
    v6 = v8;
  }

}

uint64_t __45__FCUIActivityListContentView_setHeaderView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
}

- (void)setFooterView:(id)a3
{
  char v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v7 = a3;
  v5 = BSEqualObjects();
  v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      -[UIView removeFromSuperview](self->_footerView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_footerView, a3);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __45__FCUIActivityListContentView_setFooterView___block_invoke;
      v9[3] = &unk_24D20A9C0;
      v9[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v9);
      self->_footerViewValid = 1;
    }
    else
    {
      self->_footerViewValid = 0;
    }
    -[FCUIActivityListContentView setNeedsLayout](self, "setNeedsLayout", v7);
    v6 = v8;
  }

}

uint64_t __45__FCUIActivityListContentView_setFooterView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

- (void)setActivityViews:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FCUIActivityListContentView *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSMutableArray *outgoingActivityViews;
  NSMutableArray *v18;
  NSMutableArray *v19;
  NSArray **p_activityViews;
  id v21;
  id v22;
  id obj;
  uint64_t v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    p_activityViews = &self->_activityViews;
    v21 = a3;
    v6 = (void *)-[NSArray mutableCopy](self->_activityViews, "mutableCopy");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v24 = *(_QWORD *)v27;
      do
      {
        v9 = 0;
        do
        {
          v10 = self;
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
          if (objc_msgSend(v6, "count"))
          {
            v12 = 0;
            while (1)
            {
              objc_msgSend(v6, "objectAtIndex:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "activityUniqueIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "activityUniqueIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = BSEqualObjects();

              if (v16)
                break;

              if (++v12 >= (unint64_t)objc_msgSend(v6, "count"))
                goto LABEL_11;
            }
            objc_msgSend(v6, "removeObjectAtIndex:", v12);

            self = v10;
          }
          else
          {
LABEL_11:
            v25[0] = MEMORY[0x24BDAC760];
            v25[1] = 3221225472;
            v25[2] = __48__FCUIActivityListContentView_setActivityViews___block_invoke;
            v25[3] = &unk_24D20A9C0;
            v25[4] = v11;
            objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v25);
            self = v10;
            -[FCUIActivityListContentView addSubview:](v10, "addSubview:", v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", v10->_adjustsFontForContentSizeCategory);
          }
          ++v9;
        }
        while (v9 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }

    objc_storeStrong((id *)p_activityViews, v21);
    outgoingActivityViews = self->_outgoingActivityViews;
    if (!outgoingActivityViews)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19 = self->_outgoingActivityViews;
      self->_outgoingActivityViews = v18;

      outgoingActivityViews = self->_outgoingActivityViews;
    }
    -[NSMutableArray addObjectsFromArray:](outgoingActivityViews, "addObjectsFromArray:", v6);
    -[FCUIActivityListContentView setNeedsLayout](self, "setNeedsLayout");

    v5 = v22;
  }

}

uint64_t __48__FCUIActivityListContentView_setActivityViews___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)setCompactActivityView:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSArray containsObject:](self->_activityViews, "containsObject:"))
    -[FCUIActivityListContentView bringSubviewToFront:](self, "bringSubviewToFront:", v4);

}

- (CGSize)sizeThatFitsCollapsedToPill:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 1, 1, 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)subviewFramesInBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  _BOOL4 footerPinnedToBottom;
  CGFloat v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double MinY;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  void *v48;
  NSArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  double v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  _BOOL4 v70;
  double v71;
  CGFloat rect;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  _QWORD v77[4];
  _QWORD v78[4];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  _BYTE v84[128];
  uint64_t v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v85 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, !self->_footerPinnedToBottom, 0, width, height);
  v86.origin.x = x;
  v86.origin.y = y;
  v86.size.width = width;
  v86.size.height = height;
  CGRectGetWidth(v86);
  BSRectWithSize();
  footerPinnedToBottom = self->_footerPinnedToBottom;
  v71 = *MEMORY[0x24BDBF148];
  v69 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v10 = v87.origin.x;
  rect = v87.origin.y;
  v74 = v87.size.width;
  v11 = v87.size.height;
  v12 = CGRectGetHeight(v87);
  v88.origin.x = x;
  v88.origin.y = y;
  v88.size.width = width;
  v76 = height;
  v88.size.height = height;
  if (v12 >= CGRectGetHeight(v88))
  {
    v70 = 1;
    v26 = v74;
    v28 = height;
    v25 = rect;
    v27 = v10;
  }
  else
  {
    v13 = !footerPinnedToBottom;
    if (self->_footerViewValid && self->_footerPinnedToBottom)
    {
      -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
      v71 = v14;
      v16 = v15;
      v89.size.height = v11 + v15 + 48.0;
      v89.origin.x = v10;
      v89.origin.y = rect;
      v89.size.width = v74;
      v17 = CGRectGetHeight(v89);
      v90.origin.x = x;
      v73 = y;
      v90.origin.y = y;
      v90.size.width = width;
      v90.size.height = height;
      v69 = v16;
      if (v17 >= CGRectGetHeight(v90))
        goto LABEL_9;
      UIRectCenteredYInRectScale();
      v19 = v18;
      v21 = v20;
      v67 = v23;
      v68 = v22;
      v91.origin.x = x;
      v91.origin.y = v73;
      v91.size.width = width;
      v91.size.height = height;
      v92.origin.y = CGRectGetMaxY(v91) + -48.0 - v16;
      v92.origin.x = 0.0;
      v92.size.width = v71;
      v92.size.height = v16;
      MinY = CGRectGetMinY(v92);
      v66 = v19;
      v93.origin.x = v19;
      v93.origin.y = v21;
      v11 = v67;
      v93.size.width = v68;
      v93.size.height = v67;
      if (MinY <= CGRectGetMaxY(v93) + 48.0)
      {
LABEL_9:
        y = v73;
        UIRectCenteredYInRectScale();
        v27 = v31;
        v11 = v32;
        v13 = 1;
        v28 = height;
      }
      else
      {
        v25 = v21;
        v26 = v68;
        v27 = v66;
        v28 = height;
        y = v73;
      }
    }
    else
    {
      v28 = height;
      UIRectCenteredYInRectScale();
      v27 = v29;
      v11 = v30;
    }
    v70 = v13 != 0;
  }
  v33 = v27;
  v34 = v25;
  v75 = v26;
  v35 = v11;
  v36 = v11;
  v37 = CGRectGetMinY(*(CGRect *)(&v25 - 1));
  v94.origin.x = x;
  v94.origin.y = y;
  v94.size.width = width;
  v94.size.height = v28;
  v38 = CGRectGetWidth(v94);
  v39 = width;
  if (self->_headerViewValid)
  {
    -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", width, v28);
    BSRectWithSize();
    v95.origin.x = v27;
    v95.origin.y = v34;
    v95.size.width = v75;
    v95.size.height = v35;
    CGRectGetMinY(v95);
    v28 = v76;
    v40 = width;
    UIRectCenteredXInRectScale();
    v42 = v41;
    v44 = v43;
    v46 = v45;
    *(double *)v83 = v41;
    *(double *)&v83[1] = v47;
    v37 = v47 + 24.0;
    *(double *)&v83[2] = v43;
    *(double *)&v83[3] = v45;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v83, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v48, self->_headerView);

  }
  else
  {
    v44 = v38;
    v40 = v39;
    v42 = 0.0;
    v46 = 0.0;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v49 = self->_activityViews;
  v50 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v80 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v96.origin.x = v42;
        v96.origin.y = v37;
        v96.size.width = v44;
        v96.size.height = v46;
        CGRectGetMaxY(v96);
        objc_msgSend(v54, "sizeThatFits:", v40, v28);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v54, "isContracted");
        v28 = v76;
        UIRectCenteredXInRectScale();
        v42 = v55;
        v44 = v56;
        v46 = v57;
        v37 = v58 + 12.0;
        *(double *)v78 = v55;
        *(double *)&v78[1] = v58;
        *(double *)&v78[2] = v56;
        *(double *)&v78[3] = v57;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v78, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v59, v54);

      }
      v51 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    }
    while (v51);
  }

  if (self->_footerViewValid)
  {
    if (v70)
    {
      if (v71 == 0.0 && v69 == 0.0)
        -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", v40, v28);
      BSRectWithSize();
      v97.origin.x = v42;
      v97.origin.y = v37;
      v97.size.width = v44;
      v97.size.height = v46;
      CGRectGetMaxY(v97);
    }
    UIRectCenteredXInRectScale();
    v77[0] = v60;
    v77[1] = v61;
    v77[2] = v62;
    v77[3] = v63;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v77, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v64, self->_footerView);

  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, 1, 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, 1, 1, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
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
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void (**v17)(void *, UIView *);
  int v18;
  UIView *headerView;
  UIView *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  id *p_purgeableActivityViews;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  NSMutableArray *outgoingActivityViews;
  id v49;
  void (**v50)(void *, UIView *);
  int v51;
  UIView *footerView;
  UIView *v53;
  uint64_t v54;
  void (**v55)(void *, UIView *);
  FCUIActivityListContentView *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[9];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD aBlock[4];
  id v71;
  FCUIActivityListContentView *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  objc_super v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v77.receiver = self;
  v77.super_class = (Class)FCUIActivityListContentView;
  -[FCUIActivityListContentView layoutSubviews](&v77, sel_layoutSubviews);
  if (!self->_contentDetached)
  {
    -[FCUIActivityListContentView bounds](self, "bounds");
    if (self->_collapsedSize.width == 0.0 && self->_collapsedSize.height == 0.0)
    {
      v7 = *MEMORY[0x24BDBF090];
      v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
      -[FCUIActivityListContentView subviewFramesInBounds:](self, "subviewFramesInBounds:", v3, v4, v5, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BSRectWithSize();
      v54 = 0;
      UIRectCenteredXInRectScale();
      v7 = v12;
      v8 = v13;
      v9 = v14;
      v10 = v15;
      v11 = 0;
    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__FCUIActivityListContentView_layoutSubviews__block_invoke;
    aBlock[3] = &unk_24D20AF00;
    v16 = v11;
    v73 = v7;
    v74 = v8;
    v75 = v9;
    v76 = v10;
    v71 = v16;
    v72 = self;
    v17 = (void (**)(void *, UIView *))_Block_copy(aBlock);
    v55 = v17;
    if (self->_headerViewValid)
    {
      v17[2](v17, self->_headerView);
    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x24BEBDB00], "_isInAnimationBlockWithAnimationsEnabled");
      headerView = self->_headerView;
      if (v18)
      {
        -[UIView setAlpha:](headerView, "setAlpha:", 0.0);
      }
      else
      {
        -[UIView removeFromSuperview](headerView, "removeFromSuperview");
        v20 = self->_headerView;
        self->_headerView = 0;

      }
    }
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v56 = self;
    v21 = self->_activityViews;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v67 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v27 = v10;
          v28 = v9;
          v29 = v8;
          v30 = v7;
          if (v16)
          {
            objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "CGRectValue");
            v30 = v32;
            v29 = v33;
            v28 = v34;
            v27 = v35;

          }
          objc_msgSend(v26, "alpha", v54);
          if (v36 == 0.0)
          {
            v65[0] = MEMORY[0x24BDAC760];
            v65[1] = 3221225472;
            v65[2] = __45__FCUIActivityListContentView_layoutSubviews__block_invoke_3;
            v65[3] = &unk_24D20AC88;
            v65[4] = v26;
            *(double *)&v65[5] = v30;
            *(double *)&v65[6] = v29;
            *(double *)&v65[7] = v28;
            *(double *)&v65[8] = v27;
            objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v65);
          }
          else
          {
            objc_msgSend(v26, "setFrame:", v30, v29, v28, v27);
          }
          objc_msgSend(v26, "setAlpha:", 1.0);
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      }
      while (v23);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v37 = self->_outgoingActivityViews;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v62 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "setAlpha:", 0.0, v54);
        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
      }
      while (v39);
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    p_purgeableActivityViews = (id *)&v56->_purgeableActivityViews;
    v43 = v56->_purgeableActivityViews;
    v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v58;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v58 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * k), "removeFromSuperview", v54);
        }
        v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
      }
      while (v45);
    }

    objc_storeStrong((id *)&v56->_purgeableActivityViews, v56->_outgoingActivityViews);
    outgoingActivityViews = v56->_outgoingActivityViews;
    v56->_outgoingActivityViews = 0;

    if (!objc_msgSend(*p_purgeableActivityViews, "count"))
    {
      v49 = *p_purgeableActivityViews;
      *p_purgeableActivityViews = 0;

    }
    if (v56->_footerViewValid)
    {
      v50 = v55;
      v55[2](v55, v56->_footerView);
    }
    else
    {
      v51 = objc_msgSend(MEMORY[0x24BEBDB00], "_isInAnimationBlockWithAnimationsEnabled");
      footerView = v56->_footerView;
      v50 = v55;
      if (v51)
      {
        -[UIView setAlpha:](footerView, "setAlpha:", 0.0);
      }
      else
      {
        -[UIView removeFromSuperview](footerView, "removeFromSuperview");
        v53 = v56->_footerView;
        v56->_footerView = 0;

      }
    }

  }
}

void __45__FCUIActivityListContentView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v18 = v3;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v3 = v18;
  }
  else
  {
    v7 = *(double *)(a1 + 48);
    v9 = *(double *)(a1 + 56);
    v11 = *(double *)(a1 + 64);
    v13 = *(double *)(a1 + 72);
  }
  objc_msgSend(v3, "superview", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);

  if (v14 == v15)
  {
    objc_msgSend(v19, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addSubview:", v19);
    v16 = (void *)MEMORY[0x24BEBDB00];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __45__FCUIActivityListContentView_layoutSubviews__block_invoke_2;
    v20[3] = &unk_24D20AC88;
    v17 = v19;
    v21 = v17;
    v22 = v7;
    v23 = v9;
    v24 = v11;
    v25 = v13;
    objc_msgSend(v16, "performWithoutAnimation:", v20);
    objc_msgSend(v17, "setAlpha:", 1.0);

  }
}

uint64_t __45__FCUIActivityListContentView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __45__FCUIActivityListContentView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[FCUIActivityListContentView _contentSizeCategoryAdjustingViews](self, "_contentSizeCategoryAdjustingViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[FCUIActivityListContentView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[FCUIActivityListContentView _contentSizeCategoryAdjustingViews](self, "_contentSizeCategoryAdjustingViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v7 = (objc_msgSend(v10, "adjustForContentSizeCategoryChange") | v7) & 1;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      LOBYTE(v7) = 0;
    }

    LOBYTE(v3) = v7 & 1;
  }
  return v3;
}

- (CGSize)_sizeThatFits:(CGSize)a3 collapsedToPill:(BOOL)a4 includingFooter:(BOOL)a5 forceMeasurement:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double height;
  double width;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGSize result;

  v6 = a5;
  v7 = a4;
  height = a3.height;
  width = a3.width;
  v32 = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDBF148];
  v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (a3.width != 0.0 || (a3.height == 0.0 ? (v13 = !a6) : (v13 = 0), !v13))
  {
    if (!a4)
    {
      if (self->_headerViewValid)
      {
        -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, a3.height);
        v12 = v12 + v14;
        if (-[NSArray count](self->_activityViews, "count"))
          v12 = v12 + 24.0;
      }
      if (v6 && self->_footerViewValid)
      {
        -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
        v12 = v12 + v15 + 48.0;
      }
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = self->_activityViews;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v21, "sizeThatFits:", width, height, (_QWORD)v27);
          if (v11 < v22)
            v11 = v22;
          if (v7)
          {
            if (v12 < v23)
              v12 = v23;
          }
          else
          {
            v12 = v12 + v23;
            -[NSArray lastObject](self->_activityViews, "lastObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21 != v24)
              v12 = v12 + 12.0;
          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

  }
  v25 = v11;
  v26 = v12;
  result.height = v26;
  result.width = v25;
  return result;
}

- (id)_contentSizeCategoryAdjustingViews
{
  void *v3;
  void *v4;

  v3 = (void *)-[NSArray mutableCopy](self->_activityViews, "mutableCopy");
  v4 = v3;
  if (self->_headerView)
    objc_msgSend(v3, "addObject:");
  if (self->_footerView)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (BOOL)isFooterPinnedToBottom
{
  return self->_footerPinnedToBottom;
}

- (void)setFooterPinnedToBottom:(BOOL)a3
{
  self->_footerPinnedToBottom = a3;
}

- (NSArray)activityViews
{
  return self->_activityViews;
}

- (FCUIActivityDisplaying)compactActivityView
{
  return self->_compactActivityView;
}

- (CGSize)collapsedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_collapsedSize.width;
  height = self->_collapsedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCollapsedSize:(CGSize)a3
{
  self->_collapsedSize = a3;
}

- (BOOL)isContentDetached
{
  return self->_contentDetached;
}

- (void)setContentDetached:(BOOL)a3
{
  self->_contentDetached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactActivityView, 0);
  objc_storeStrong((id *)&self->_activityViews, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_purgeableActivityViews, 0);
  objc_storeStrong((id *)&self->_outgoingActivityViews, 0);
}

@end
