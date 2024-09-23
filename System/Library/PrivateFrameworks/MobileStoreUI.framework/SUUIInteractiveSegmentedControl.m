@implementation SUUIInteractiveSegmentedControl

- (SUUIInteractiveSegmentedControl)initWithFrame:(CGRect)a3
{
  SUUIInteractiveSegmentedControl *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIInteractiveSegmentedControl;
  result = -[SUUIInteractiveSegmentedControl initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_dividerWidth = 1.0;
  return result;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_segments;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[SUUIInteractiveSegmentedControl _unregisterForObservationOfSegment:](self, "_unregisterForObservationOfSegment:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUUIInteractiveSegmentedControl;
  -[SUUIInteractiveSegmentedControl dealloc](&v8, sel_dealloc);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SUUIInteractiveSegmentedControl *v8;
  int v9;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  SUUIInteractiveSegmentedControl *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  SUUIInteractiveSegmentedControl *v21;
  SUUIInteractiveSegmentedControl *v22;
  SUUIInteractiveSegmentedControl *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  y = a3.y;
  x = a3.x;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SUUIInteractiveSegmentedControl;
  -[SUUIInteractiveSegmentedControl hitTest:withEvent:](&v29, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SUUIInteractiveSegmentedControl *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSMutableArray containsObject:](self->_dividerViews, "containsObject:", v8);
  if (v8 == self || v9 != 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_segments;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v26;
      v16 = 1.79769313e308;
LABEL_7:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
        if (objc_msgSend(v18, "isEnabled", (_QWORD)v25))
        {
          if (objc_msgSend(v18, "isUserInteractionEnabled"))
          {
            objc_msgSend(v18, "frame");
            UIDistanceBetweenPointAndRect();
            v20 = v19;
            if (v19 - v16 <= 0.00000011920929)
            {
              v21 = v18;

              v14 = v21;
              v16 = v20;
              if (v20 <= 0.00000011920929)
                break;
            }
          }
        }
        if (v13 == ++v17)
        {
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          v21 = v14;
          if (v13)
            goto LABEL_7;
          break;
        }
      }
    }
    else
    {
      v21 = 0;
    }

    if (v21)
      v22 = v21;
    else
      v22 = self;
    v23 = v22;

    v8 = v23;
  }

  return v8;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  NSArray *segments;
  uint64_t v21;
  double v22;
  void *v23;
  NSArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t *v38;
  _QWORD *v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  _QWORD v48[13];
  _QWORD v49[4];
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  _QWORD v59[4];
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;

  v62 = *MEMORY[0x24BDAC8D0];
  v60.receiver = self;
  v60.super_class = (Class)SUUIInteractiveSegmentedControl;
  -[SUUIInteractiveSegmentedControl layoutSubviews](&v60, sel_layoutSubviews);
  -[SUUIInteractiveSegmentedControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIInteractiveSegmentedControl traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  if (v13 < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v13 = v15;

  }
  v16 = -[NSArray count](self->_segments, "count");
  v63.origin.x = v4;
  v63.origin.y = v6;
  v63.size.width = v8;
  v63.size.height = v10;
  v17 = CGRectGetWidth(v63) - (double)(v16 - 1) * self->_dividerWidth;
  UIFloorToViewScale();
  v19 = v18;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = llround(v13 * (v17 - v18 * (double)v16));
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  v54 = 0;
  v55 = (double *)&v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  segments = self->_segments;
  v21 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __49__SUUIInteractiveSegmentedControl_layoutSubviews__block_invoke;
  v48[3] = &unk_2511FBD28;
  *(double *)&v48[7] = v17;
  *(CGFloat *)&v48[8] = v4;
  *(CGFloat *)&v48[9] = v6;
  *(CGFloat *)&v48[10] = v8;
  *(CGFloat *)&v48[11] = v10;
  *(double *)&v48[12] = v18;
  v48[4] = &v50;
  v48[5] = &v54;
  v48[6] = v49;
  -[NSArray enumerateObjectsUsingBlock:](segments, "enumerateObjectsUsingBlock:", v48);
  v22 = v51[3] - v17;
  if (v22 > 0.0)
    v55[3] = v55[3] - v22;
  v23 = (void *)-[NSMutableArray mutableCopy](self->_dividerViews, "mutableCopy");
  v24 = self->_segments;
  v34[0] = v21;
  v34[1] = 3221225472;
  v34[2] = __49__SUUIInteractiveSegmentedControl_layoutSubviews__block_invoke_2;
  v34[3] = &unk_2511FBD50;
  v40 = v17;
  v41 = v4;
  v42 = v6;
  v43 = v8;
  v44 = v10;
  v45 = v19;
  v36 = v58;
  v37 = v49;
  v34[4] = self;
  v38 = &v54;
  v39 = v59;
  v46 = v22;
  v47 = v13;
  v25 = v23;
  v35 = v25;
  -[NSArray enumerateObjectsUsingBlock:](v24, "enumerateObjectsUsingBlock:", v34);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v30, v61, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "removeFromSuperview");
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v30, v61, 16);
    }
    while (v27);
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v59, 8);
}

void __49__SUUIInteractiveSegmentedControl_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;

  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  v6 = *(double *)(a1 + 80);
  v7 = *(double *)(a1 + 88);
  v8 = a2;
  v12.origin.x = v4;
  v12.origin.y = v5;
  v12.size.width = v6;
  v12.size.height = v7;
  objc_msgSend(v8, "sizeThatFits:", v3, CGRectGetHeight(v12));
  v10 = v9;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  v11 = *(double *)(a1 + 96);
  if (v10 > v11)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10
                                                                - v11
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
}

void __49__SUUIInteractiveSegmentedControl_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat Height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  CGFloat Width;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v29 = a2;
  v3 = objc_msgSend(v29, "segmentPosition");
  objc_msgSend(v29, "frame");
  objc_msgSend(v29, "sizeThatFits:", *(double *)(a1 + 80), CGRectGetHeight(*(CGRect *)(a1 + 88)));
  v5 = v4;
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  Height = CGRectGetHeight(*(CGRect *)(a1 + 88));
  v8 = *(double *)(a1 + 120);
  v9 = 0.0;
  v30.origin.y = 0.0;
  v30.origin.x = v6;
  v30.size.width = v8;
  v30.size.height = Height;
  if (v5 <= CGRectGetWidth(v30))
  {
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) > 0.0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "count");
      UIFloorToViewScale();
      v12 = v11;
      v31.origin.y = 0.0;
      v31.origin.x = v6;
      v31.size.width = v8;
      v31.size.height = Height;
      v13 = CGRectGetWidth(v31) - v5;
      if (v12 < v13)
        v13 = v12;
      v8 = v8 - v13;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  - v13;
    }
  }
  else
  {
    if (*(double *)(a1 + 128) > 0.0)
    {
      UIFloorToViewScale();
      v9 = v10;
    }
    v8 = v5 - v9;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v15 = *(_QWORD *)(v14 + 24);
  v16 = v15 < 1;
  v17 = v15 - 1;
  if (!v16)
  {
    v8 = v8 + 1.0 / *(double *)(a1 + 136);
    *(_QWORD *)(v14 + 24) = v17;
  }
  objc_msgSend(v29, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v6, 0.0, v8, Height, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112)));
  v32.origin.y = 0.0;
  v32.origin.x = v6;
  v32.size.width = v8;
  v32.size.height = Height;
  Width = CGRectGetWidth(v32);
  v19 = v29;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = Width
                                                               + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                           + 24);
  if ((unint64_t)(v3 - 1) <= 1)
  {
    v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v21 = *(double *)(*(_QWORD *)(a1 + 32) + 480);
    v22 = CGRectGetHeight(*(CGRect *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
      objc_msgSend(v24, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v20, 0.0, v21, v22, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112)));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_createDividerViewWithFrame:", v20, 0.0, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", v24);
      v25 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
      if (!v25)
      {
        v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
        v27 = *(_QWORD *)(a1 + 32);
        v28 = *(void **)(v27 + 464);
        *(_QWORD *)(v27 + 464) = v26;

        v25 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
      }
      objc_msgSend(v25, "addObject:", v24);
    }
    v33.origin.x = v20;
    v33.origin.y = 0.0;
    v33.size.width = v21;
    v33.size.height = v22;
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGRectGetWidth(v33)
                                                                 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                             + 24);

    v19 = v29;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x24BDAC8D0];
  -[NSArray count](self->_segments, "count");
  UIFloorToViewScale();
  v7 = v6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_segments;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v10 = 0.0;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "sizeThatFits:", v7, height, (_QWORD)v17);
        if (v14 >= v7)
          v14 = v7;
        if (v10 < v14)
          v10 = v14;
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  UICeilToViewScale();
  if (width < v15)
    v15 = width;
  v16 = height;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setDividerCreationBlock:(id)a3
{
  void *v4;
  id dividerCreationBlock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *dividerViews;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_dividerCreationBlock != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    dividerCreationBlock = self->_dividerCreationBlock;
    self->_dividerCreationBlock = v4;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_dividerViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "removeFromSuperview", (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    dividerViews = self->_dividerViews;
    self->_dividerViews = 0;

    -[SUUIInteractiveSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDividerWidth:(double)a3
{
  if (vabdd_f64(self->_dividerWidth, a3) > 0.00000011920929)
  {
    self->_dividerWidth = a3;
    -[SUUIInteractiveSegmentedControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSegments:(id)a3
{
  NSArray *v4;
  NSArray *segments;
  int64_t v6;
  double v7;
  int64_t v8;
  double v9;
  NSArray *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSUInteger v26;
  NSArray *v27;
  void *v28;
  NSArray *v29;
  double v30;
  uint64_t v31;
  double v32;
  _BOOL4 v33;
  uint64_t v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  segments = self->_segments;
  if (segments != v4 && !-[NSArray isEqualToArray:](segments, "isEqualToArray:", v4))
  {
    v6 = -[SUUIInteractiveSegmentedControl selectedSegmentIndexForSelectionProgress:](self, "selectedSegmentIndexForSelectionProgress:", self->_selectionProgress);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v34 = 0;
      v7 = 0.0;
    }
    else
    {
      v8 = v6;
      -[NSArray objectAtIndex:](self->_segments, "objectAtIndex:", v6);
      v34 = objc_claimAutoreleasedReturnValue();
      -[SUUIInteractiveSegmentedControl relativeSelectionProgressForSelectionProgress:segmentIndex:](self, "relativeSelectionProgressForSelectionProgress:segmentIndex:", v8, self->_selectionProgress);
      v7 = v9;
    }
    v10 = self->_segments;
    v11 = (void *)-[NSArray mutableCopy](v10, "mutableCopy");
    v12 = (NSArray *)-[NSArray copy](v4, "copy");
    v13 = self->_segments;
    self->_segments = v12;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v14 = self->_segments;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v11, "removeObject:", v19, v34);
          if (!-[NSArray containsObject:](v10, "containsObject:", v19))
          {
            -[SUUIInteractiveSegmentedControl _registerForObservationOfSegment:](self, "_registerForObservationOfSegment:", v19);
            -[SUUIInteractiveSegmentedControl addSubview:](self, "addSubview:", v19);
          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v16);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = v11;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          -[SUUIInteractiveSegmentedControl _unregisterForObservationOfSegment:](self, "_unregisterForObservationOfSegment:", v25, v34);
          if (objc_msgSend(v25, "isDescendantOfView:", self))
            objc_msgSend(v25, "removeFromSuperview");
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v22);
    }

    v26 = -[NSArray count](self->_segments, "count");
    v27 = self->_segments;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __47__SUUIInteractiveSegmentedControl_setSegments___block_invoke;
    v35[3] = &__block_descriptor_40_e53_v32__0__UIControl_SUUIInteractiveSegmenting__8Q16_B24l;
    v35[4] = v26;
    -[NSArray enumerateObjectsUsingBlock:](v27, "enumerateObjectsUsingBlock:", v35);
    v28 = (void *)v34;
    if (v34)
    {
      v29 = self->_segments;
      v30 = 0.0;
      if (v29)
      {
        v31 = -[NSArray indexOfObject:](v29, "indexOfObject:", v34);
        if (v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[SUUIInteractiveSegmentedControl selectionProgressForRelativeSectionProgress:segmentIndex:](self, "selectionProgressForRelativeSectionProgress:segmentIndex:", v31, v7);
          v30 = v32;
        }
      }
      v33 = -[SUUIInteractiveSegmentedControl _setSelectionProgress:](self, "_setSelectionProgress:", v30, v34);
      -[SUUIInteractiveSegmentedControl _applySelectionProgressToSegments](self, "_applySelectionProgressToSegments");
      if (v33)
        -[SUUIInteractiveSegmentedControl _notifyClientsOfSelectionProgressChange](self, "_notifyClientsOfSelectionProgressChange");
    }
    -[SUUIInteractiveSegmentedControl setNeedsLayout](self, "setNeedsLayout", v34);

  }
}

uint64_t __47__SUUIInteractiveSegmentedControl_setSegments___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3 < 2)
  {
    v6 = 0;
  }
  else
  {
    v4 = v3 - 1 == a3;
    v5 = 2;
    if (v4)
      v5 = 3;
    if (a3)
      v6 = v5;
    else
      v6 = 1;
  }
  return objc_msgSend(a2, "setSegmentPosition:", v6);
}

- (double)relativeSelectionProgressForSelectionProgress:(double)a3 segmentIndex:(int64_t)a4
{
  NSUInteger v7;
  unint64_t v8;
  double v9;
  double result;

  v7 = -[NSArray count](self->_segments, "count");
  if (!v7)
    return 0.0;
  v8 = v7;
  -[SUUIInteractiveSegmentedControl selectionProgressForSelectedSegmentAtIndex:](self, "selectionProgressForSelectedSegmentAtIndex:", a4);
  result = fmax((a3 - v9) / (1.0 / (double)v8), -1.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (double)selectionProgressForRelativeSectionProgress:(double)a3 segmentIndex:(int64_t)a4
{
  unint64_t v7;
  double v8;
  double v9;
  double v10;

  v7 = -[NSArray count](self->_segments, "count");
  if (!v7)
    return 0.0;
  v8 = fmax(a3, -1.0);
  if (v8 > 1.0)
    v8 = 1.0;
  v9 = v8 * (1.0 / (double)v7);
  -[SUUIInteractiveSegmentedControl selectionProgressForSelectedSegmentAtIndex:](self, "selectionProgressForSelectedSegmentAtIndex:", a4);
  return v9 + v10;
}

- (double)selectionProgressForSelectedSegmentAtIndex:(int64_t)a3
{
  unint64_t v4;

  v4 = -[NSArray count](self->_segments, "count");
  if (v4)
    return 1.0 / (double)v4 * 0.5 + (double)a3 * (1.0 / (double)v4);
  else
    return 0.0;
}

- (int64_t)selectedSegmentIndexForSelectionProgress:(double)a3
{
  unint64_t v4;

  v4 = -[NSArray count](self->_segments, "count");
  if (v4)
    return llround((a3 + -1.0 / (double)v4 * 0.5) * (double)(v4 - 1));
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_segmentControlTouchUpInsideAction:(id)a3
{
  id v4;
  NSArray *segments;
  uint64_t v6;
  _BOOL4 v7;
  id v8;

  v4 = a3;
  segments = self->_segments;
  if (segments)
  {
    v8 = v4;
    v6 = -[NSArray indexOfObject:](segments, "indexOfObject:", v4);
    v4 = v8;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SUUIInteractiveSegmentedControl selectionProgressForSelectedSegmentAtIndex:](self, "selectionProgressForSelectedSegmentAtIndex:", v6);
      v7 = -[SUUIInteractiveSegmentedControl _setSelectionProgress:](self, "_setSelectionProgress:");
      v4 = v8;
      if (v7)
      {
        -[SUUIInteractiveSegmentedControl _notifyClientsOfSelectionProgressChange](self, "_notifyClientsOfSelectionProgressChange");
        v4 = v8;
      }
    }
  }

}

- (void)_applySelectionProgressToSegments
{
  NSArray *segments;
  _QWORD v3[5];

  segments = self->_segments;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__SUUIInteractiveSegmentedControl__applySelectionProgressToSegments__block_invoke;
  v3[3] = &unk_2511FBD98;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](segments, "enumerateObjectsUsingBlock:", v3);
}

void __68__SUUIInteractiveSegmentedControl__applySelectionProgressToSegments__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double *v4;
  double v5;
  id v6;

  v4 = *(double **)(a1 + 32);
  v5 = v4[62];
  v6 = a2;
  objc_msgSend(v4, "relativeSelectionProgressForSelectionProgress:segmentIndex:", a3, v5);
  objc_msgSend(v6, "setRelativeSelectionProgress:");

}

- (id)_createDividerViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void (**dividerCreationBlock)(id, SUUIInteractiveSegmentedControl *, __n128, __n128, __n128, __n128);
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  dividerCreationBlock = (void (**)(id, SUUIInteractiveSegmentedControl *, __n128, __n128, __n128, __n128))self->_dividerCreationBlock;
  if (!dividerCreationBlock
    || (dividerCreationBlock[2](dividerCreationBlock, self, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", x, y, width, height);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

  }
  return v9;
}

- (void)_notifyClientsOfSelectionProgressChange
{
  -[SUUIInteractiveSegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_registerForObservationOfSegment:(id)a3
{
  if (a3)
    objc_msgSend(a3, "addTarget:action:forControlEvents:", self, sel__segmentControlTouchUpInsideAction_, 64);
}

- (BOOL)_setSelectionProgress:(double)a3
{
  double v3;

  v3 = vabdd_f64(self->_selectionProgress, a3);
  if (v3 > 0.00000011920929)
  {
    self->_selectionProgress = a3;
    -[SUUIInteractiveSegmentedControl _applySelectionProgressToSegments](self, "_applySelectionProgressToSegments");
  }
  return v3 > 0.00000011920929;
}

- (void)_unregisterForObservationOfSegment:(id)a3
{
  if (a3)
    objc_msgSend(a3, "removeTarget:action:forControlEvents:", self, sel__segmentControlTouchUpInsideAction_, 64);
}

- (id)dividerCreationBlock
{
  return self->_dividerCreationBlock;
}

- (double)dividerWidth
{
  return self->_dividerWidth;
}

- (NSArray)segments
{
  return self->_segments;
}

- (double)selectionProgress
{
  return self->_selectionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong(&self->_dividerCreationBlock, 0);
  objc_storeStrong((id *)&self->_dividerViews, 0);
}

@end
