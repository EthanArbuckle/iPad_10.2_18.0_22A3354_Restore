@implementation ICTableContentView

- (ICTableContentView)initWithFrame:(CGRect)a3
{
  ICTableContentView *v3;
  ICTableContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTableContentView;
  v3 = -[ICTableContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICTableContentView sharedInit](v3, "sharedInit");
  return v4;
}

- (ICTableContentView)initWithCoder:(id)a3
{
  ICTableContentView *v3;
  ICTableContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTableContentView;
  v3 = -[ICTableContentView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICTableContentView sharedInit](v3, "sharedInit");
  return v4;
}

- (void)sharedInit
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *horizontalStrokes;
  NSMutableDictionary *v7;
  NSMutableDictionary *verticalStrokes;
  UIView *v9;
  UIView *topBorder;
  UIView *v11;
  UIView *bottomBorder;
  UIView *v13;
  UIView *leftBorder;
  UIView *v15;
  UIView *rightBorder;
  void *v17;
  UIView *v18;
  void *v19;
  void *v20;
  UIView *v21;
  void *v22;
  void *v23;
  UIView *v24;
  void *v25;
  UIView *v26;
  void *v27;
  id v28;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableContentView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[ICTableContentView registerForTraitChanges](self, "registerForTraitChanges");
  -[ICTableContentView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMasksToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  horizontalStrokes = self->_horizontalStrokes;
  self->_horizontalStrokes = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  verticalStrokes = self->_verticalStrokes;
  self->_verticalStrokes = v7;

  -[ICTableContentView createStroke](self, "createStroke");
  v9 = (UIView *)objc_claimAutoreleasedReturnValue();
  topBorder = self->_topBorder;
  self->_topBorder = v9;

  -[ICTableContentView createStroke](self, "createStroke");
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  bottomBorder = self->_bottomBorder;
  self->_bottomBorder = v11;

  -[ICTableContentView createStroke](self, "createStroke");
  v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  leftBorder = self->_leftBorder;
  self->_leftBorder = v13;

  -[ICTableContentView createStroke](self, "createStroke");
  v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  rightBorder = self->_rightBorder;
  self->_rightBorder = v15;

  -[ICTableContentView horizontalStrokes](self, "horizontalStrokes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_topBorder;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, v19);

  -[ICTableContentView horizontalStrokes](self, "horizontalStrokes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_bottomBorder;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, v22);

  -[ICTableContentView verticalStrokes](self, "verticalStrokes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_leftBorder;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v24, v25);

  -[ICTableContentView verticalStrokes](self, "verticalStrokes");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v26 = self->_rightBorder;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v26, v27);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableContentView;
  -[ICTableContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[ICTableContentView updateLayout](self, "updateLayout");
}

- (void)updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  -[ICTableContentView outerBorderWidth](self, "outerBorderWidth");
  v4 = v3;
  -[ICTableContentView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[ICTableContentView topBorder](self, "topBorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v6, v4);

  -[ICTableContentView alignedPosition:](self, "alignedPosition:", v8 - v4);
  v11 = v10;
  -[ICTableContentView bottomBorder](self, "bottomBorder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, v11, v6, v4);

  -[ICTableContentView leftBorder](self, "leftBorder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v4, v8);

  -[ICTableContentView rightBorder](self, "rightBorder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v6 - v4, 0.0, v4, v8);

  -[ICTableContentView updateColors](self, "updateColors");
}

- (void)setExclusionRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  double MaxX;
  double v21;
  double v22;
  double MaxY;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v57 = *MEMORY[0x1E0C80C00];
  self->_exclusionRect = a3;
  if (CGRectIsEmpty(a3))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[ICTableContentView horizontalStrokes](self, "horizontalStrokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(v9);
          -[ICTableContentView unsplitStroke:](self, "unsplitStroke:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v11);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[ICTableContentView verticalStrokes](self, "verticalStrokes", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          -[ICTableContentView unsplitStroke:](self, "unsplitStroke:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v17);
    }
  }
  else
  {
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    if (CGRectGetMinX(v58) < 2.0)
    {
      width = width + x + 1.0;
      x = -1.0;
    }
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    if (CGRectGetMinY(v59) < 2.0)
    {
      height = height + y + 1.0;
      y = -1.0;
    }
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    MaxX = CGRectGetMaxX(v60);
    -[ICTableContentView bounds](self, "bounds");
    if (MaxX > v21 + -2.0)
    {
      -[ICTableContentView bounds](self, "bounds");
      width = v22 + 1.0 - x;
    }
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    MaxY = CGRectGetMaxY(v61);
    -[ICTableContentView bounds](self, "bounds");
    if (MaxY > v24 + -2.0)
    {
      -[ICTableContentView bounds](self, "bounds");
      height = v25 + 1.0 - y;
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[ICTableContentView horizontalStrokes](self, "horizontalStrokes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v27);
          -[ICTableContentView splitStroke:atRect:](self, "splitStroke:atRect:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k), x, y, width, height);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v29);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[ICTableContentView verticalStrokes](self, "verticalStrokes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v46;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(v15);
          -[ICTableContentView splitStroke:atRect:](self, "splitStroke:atRect:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * m), x, y, width, height);
        }
        v34 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v34);
    }
  }

}

- (UIColor)innerBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "ic_systemGray4Color");
}

- (id)outerBorderColor
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTableContentView innerBorderColor](self, "innerBorderColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableContentView highlightColor](self, "highlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_colorBlendedWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)outerBorderWidth
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v3 = *MEMORY[0x1E0D64900];
  -[ICTableContentView highlightColor](self, "highlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alphaComponent");
  v6 = v5;
  -[ICTableContentView innerBorderWidth](self, "innerBorderWidth");
  v8 = v7;
  -[ICTableContentView highlightColor](self, "highlightColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alphaComponent");
  v11 = v8 * (1.0 - v10) + v3 * v6;

  return v11;
}

- (void)updateColors
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[ICTableContentView innerBorderColor](self, "innerBorderColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");

  -[ICTableContentView outerBorderColor](self, "outerBorderColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[ICTableContentView horizontalStrokes](self, "horizontalStrokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v12), "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableContentView recursivelyUpdateLayer:toColor:ignoreIfClear:](self, "recursivelyUpdateLayer:toColor:ignoreIfClear:", v13, v4, 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ICTableContentView verticalStrokes](self, "verticalStrokes", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v19), "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableContentView recursivelyUpdateLayer:toColor:ignoreIfClear:](self, "recursivelyUpdateLayer:toColor:ignoreIfClear:", v20, v4, 0);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v17);
  }

  -[ICTableContentView topBorder](self, "topBorder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableContentView recursivelyUpdateLayer:toColor:ignoreIfClear:](self, "recursivelyUpdateLayer:toColor:ignoreIfClear:", v22, v6, 1);

  -[ICTableContentView bottomBorder](self, "bottomBorder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableContentView recursivelyUpdateLayer:toColor:ignoreIfClear:](self, "recursivelyUpdateLayer:toColor:ignoreIfClear:", v24, v6, 1);

  -[ICTableContentView rightBorder](self, "rightBorder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableContentView recursivelyUpdateLayer:toColor:ignoreIfClear:](self, "recursivelyUpdateLayer:toColor:ignoreIfClear:", v26, v6, 1);

  -[ICTableContentView leftBorder](self, "leftBorder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableContentView recursivelyUpdateLayer:toColor:ignoreIfClear:](self, "recursivelyUpdateLayer:toColor:ignoreIfClear:", v28, v6, 1);

}

- (void)recursivelyUpdateLayer:(id)a3 toColor:(CGColor *)a4 ignoreIfClear:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CGColor *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  if (!v5 || !CGColorEqualToColor((CGColorRef)objc_msgSend(v8, "backgroundColor"), v10))
    objc_msgSend(v8, "setBackgroundColor:", a4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v8, "sublayers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[ICTableContentView recursivelyUpdateLayer:toColor:ignoreIfClear:](self, "recursivelyUpdateLayer:toColor:ignoreIfClear:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), a4, v5);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (id)createStroke
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[ICTableContentView innerBorderColor](self, "innerBorderColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[ICTableContentView insertSubview:atIndex:](self, "insertSubview:atIndex:", v3, 0);
  return v3;
}

- (void)setVerticalLinePosition:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[ICTableContentView verticalStrokes](self, "verticalStrokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (!v8)
    {
      -[ICTableContentView createStroke](self, "createStroke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAutoresizingMask:", 20);
      -[ICTableContentView verticalStrokes](self, "verticalStrokes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v6);

    }
    -[ICTableContentView innerBorderWidth](self, "innerBorderWidth");
    v11 = v10;
    objc_msgSend(v15, "doubleValue");
    -[ICTableContentView alignedPosition:](self, "alignedPosition:");
    v13 = v12;
    -[ICTableContentView bounds](self, "bounds");
    objc_msgSend(v8, "setFrame:", v13, 0.0, v11);
  }
  else if (v8)
  {
    objc_msgSend(v8, "removeFromSuperview");
    -[ICTableContentView verticalStrokes](self, "verticalStrokes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v6);

  }
}

- (void)setHorizontalLinePosition:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[ICTableContentView horizontalStrokes](self, "horizontalStrokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (!v8)
    {
      -[ICTableContentView createStroke](self, "createStroke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAutoresizingMask:", 34);
      -[ICTableContentView horizontalStrokes](self, "horizontalStrokes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v6);

    }
    -[ICTableContentView innerBorderWidth](self, "innerBorderWidth");
    objc_msgSend(v13, "doubleValue");
    -[ICTableContentView alignedPosition:](self, "alignedPosition:");
    v11 = v10;
    -[ICTableContentView bounds](self, "bounds");
    objc_msgSend(v8, "setFrame:", 0.0, v11);
  }
  else if (v8)
  {
    objc_msgSend(v8, "removeFromSuperview");
    -[ICTableContentView horizontalStrokes](self, "horizontalStrokes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v6);

  }
}

- (id)addSubstrokeWithFrame:(CGRect)a3 toStroke:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "convertRect:fromView:", self, x, y, width, height);
  v10 = v18.origin.x;
  v11 = v18.origin.y;
  v12 = v18.size.width;
  v13 = v18.size.height;
  if (CGRectIsEmpty(v18))
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v14, "setFrame:", v10, v11, v12, v13);
    -[ICTableContentView innerBorderColor](self, "innerBorderColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

    objc_msgSend(v9, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v14);

  }
  return v14;
}

- (BOOL)splitStroke:(id)a3 atRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v22;
  double MinY;
  id v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  double MaxY;
  double v33;
  double v34;
  double v35;
  double v36;
  double MaxX;
  double MinX;
  id v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  BOOL v50;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[ICTableContentView unsplitStroke:](self, "unsplitStroke:", v9);
  objc_msgSend(v9, "frame");
  v63.origin.x = v10;
  v63.origin.y = v11;
  v63.size.width = v12;
  v63.size.height = v13;
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  if (!CGRectIntersectsRect(v52, v63))
    goto LABEL_10;
  objc_msgSend(v9, "bounds");
  v15 = v14;
  objc_msgSend(v9, "bounds");
  v17 = v16;
  objc_msgSend(v9, "frame");
  if (v15 <= v17)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v18);
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    if (MaxX > CGRectGetMinX(v58) + 1.0)
    {
      objc_msgSend(v9, "frame");
      MinX = CGRectGetMinX(v59);
      v60.origin.x = x;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = height;
      if (MinX < CGRectGetMaxX(v60) + -1.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v40 = objc_msgSend(v39, "CGColor");
        objc_msgSend(v9, "layer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setBackgroundColor:", v40);

        objc_msgSend(v9, "frame");
        v43 = v42;
        objc_msgSend(v9, "bounds");
        v44 = -[ICTableContentView addSubstrokeWithFrame:toStroke:](self, "addSubstrokeWithFrame:toStroke:", v9, v43, 0.0);
        objc_msgSend(v9, "frame");
        v30 = v45;
        v61.origin.x = x;
        v61.origin.y = y;
        v61.size.width = width;
        v61.size.height = height;
        MaxY = CGRectGetMaxY(v61);
        objc_msgSend(v9, "bounds");
        v35 = v46;
        -[ICTableContentView bounds](self, "bounds");
        v48 = v47;
        v62.origin.x = x;
        v62.origin.y = y;
        v62.size.width = width;
        v62.size.height = height;
        v36 = v48 - CGRectGetMaxY(v62);
        goto LABEL_9;
      }
    }
LABEL_10:
    v50 = 0;
    goto LABEL_11;
  }
  v22 = CGRectGetMaxY(*(CGRect *)&v18);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  if (v22 <= CGRectGetMinY(v53) + 1.0)
    goto LABEL_10;
  objc_msgSend(v9, "frame");
  MinY = CGRectGetMinY(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  if (MinY >= CGRectGetMaxY(v55) + -1.0)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v24, "CGColor");
  objc_msgSend(v9, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v25);

  objc_msgSend(v9, "frame");
  v28 = v27;
  objc_msgSend(v9, "bounds");
  v29 = -[ICTableContentView addSubstrokeWithFrame:toStroke:](self, "addSubstrokeWithFrame:toStroke:", v9, 0.0, v28, x);
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  v30 = CGRectGetMaxX(v56);
  objc_msgSend(v9, "frame");
  MaxY = v31;
  -[ICTableContentView bounds](self, "bounds");
  v34 = v33;
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v35 = v34 - CGRectGetMaxX(v57);
  objc_msgSend(v9, "bounds");
LABEL_9:
  v49 = -[ICTableContentView addSubstrokeWithFrame:toStroke:](self, "addSubstrokeWithFrame:toStroke:", v9, v30, MaxY, v35, v36);
  v50 = 1;
LABEL_11:

  return v50;
}

- (void)unsplitStroke:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICTableContentView innerBorderColor](self, "innerBorderColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "layer", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sublayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "removeFromSuperlayer");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (double)alignedPosition:(double)a3
{
  double v4;

  -[ICTableContentView ic_backingScaleFactor](self, "ic_backingScaleFactor");
  return round(v4 * a3) / v4;
}

- (void)registerForTraitChanges
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)-[ICTableContentView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel_updateColors);

}

- (CGRect)exclusionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_exclusionRect.origin.x;
  y = self->_exclusionRect.origin.y;
  width = self->_exclusionRect.size.width;
  height = self->_exclusionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSMutableDictionary)horizontalStrokes
{
  return self->_horizontalStrokes;
}

- (void)setHorizontalStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStrokes, a3);
}

- (NSMutableDictionary)verticalStrokes
{
  return self->_verticalStrokes;
}

- (void)setVerticalStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStrokes, a3);
}

- (UIView)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
  objc_storeStrong((id *)&self->_topBorder, a3);
}

- (UIView)bottomBorder
{
  return self->_bottomBorder;
}

- (void)setBottomBorder:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBorder, a3);
}

- (UIView)leftBorder
{
  return self->_leftBorder;
}

- (void)setLeftBorder:(id)a3
{
  objc_storeStrong((id *)&self->_leftBorder, a3);
}

- (UIView)rightBorder
{
  return self->_rightBorder;
}

- (void)setRightBorder:(id)a3
{
  objc_storeStrong((id *)&self->_rightBorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBorder, 0);
  objc_storeStrong((id *)&self->_leftBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_verticalStrokes, 0);
  objc_storeStrong((id *)&self->_horizontalStrokes, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
