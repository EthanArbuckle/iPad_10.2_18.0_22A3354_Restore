@implementation _HKAnnotationColumnLayout

- (_HKAnnotationColumnLayout)initWithContext:(int64_t)a3
{
  _HKAnnotationColumnLayout *v4;
  _HKAnnotationColumnLayout *v5;
  NSMutableArray *v6;
  NSMutableArray *columnViews;
  NSMutableArray *v8;
  NSMutableArray *separatorViews;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_HKAnnotationColumnLayout;
  v4 = -[_HKAnnotationColumnLayout initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_context = a3;
    v4->_includeSeparators = 0;
    v4->_reverseColumnsInRightToLeftLayoutDirection = 1;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    columnViews = v5->_columnViews;
    v5->_columnViews = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    separatorViews = v5->_separatorViews;
    v5->_separatorViews = v8;

  }
  return v5;
}

- (void)setIncludeSeparators:(BOOL)a3
{
  if (self->_includeSeparators)
  {
    if (!a3)
    {
      -[_HKAnnotationColumnLayout _clearSeparatorViews](self, "_clearSeparatorViews");
LABEL_6:
      -[_HKAnnotationColumnLayout _invalidateLayout](self, "_invalidateLayout");
    }
  }
  else if (a3)
  {
    -[_HKAnnotationColumnLayout _addSeparatorViews](self, "_addSeparatorViews");
    goto LABEL_6;
  }
  self->_includeSeparators = a3;
}

- (void)setReverseColumnsInRightToLeftLayoutDirection:(BOOL)a3
{
  if (self->_reverseColumnsInRightToLeftLayoutDirection != a3)
  {
    self->_reverseColumnsInRightToLeftLayoutDirection = a3;
    -[_HKAnnotationColumnLayout _invalidateLayout](self, "_invalidateLayout");
  }
}

- (void)addColumnView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[_HKAnnotationColumnLayout includeSeparators](self, "includeSeparators"))
  {
    -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[_HKAnnotationColumnLayout _makeSeparatorView](self, "_makeSeparatorView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKAnnotationColumnLayout separatorViews](self, "separatorViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

      -[_HKAnnotationColumnLayout addSubview:](self, "addSubview:", v7);
    }
  }
  -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v4);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[_HKAnnotationColumnLayout addSubview:](self, "addSubview:", v4);

  -[_HKAnnotationColumnLayout _invalidateLayout](self, "_invalidateLayout");
}

- (void)setColumnView:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    -[_HKAnnotationColumnLayout addColumnView:](self, "addColumnView:", v11);
  }
  else
  {
    -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isEqual:", v11) & 1) == 0)
    {
      objc_msgSend(v9, "removeFromSuperview");
      -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v11, a4);

      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      -[_HKAnnotationColumnLayout addSubview:](self, "addSubview:", v11);
      -[_HKAnnotationColumnLayout _invalidateLayout](self, "_invalidateLayout");
    }

  }
}

- (void)clearViews
{
  -[_HKAnnotationColumnLayout _clearColumnViews](self, "_clearColumnViews");
  -[_HKAnnotationColumnLayout _clearSeparatorViews](self, "_clearSeparatorViews");
}

- (void)clearViewsFromIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  if (a3)
  {
    if (-[NSMutableArray count](self->_columnViews, "count") > a3)
    {
      if (-[NSMutableArray count](self->_columnViews, "count") > a3)
      {
        v5 = a3;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_columnViews, "objectAtIndexedSubscript:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "removeFromSuperview");

          ++v5;
        }
        while (v5 < -[NSMutableArray count](self->_columnViews, "count"));
      }
      -[NSMutableArray removeObjectsInRange:](self->_columnViews, "removeObjectsInRange:", a3, -[NSMutableArray count](self->_columnViews, "count") - a3);
      if (self->_includeSeparators && -[NSMutableArray count](self->_separatorViews, "count"))
      {
        v7 = a3 - 1;
        if (v7 < -[NSMutableArray count](self->_separatorViews, "count"))
        {
          v8 = v7;
          do
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_separatorViews, "objectAtIndexedSubscript:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "removeFromSuperview");

            ++v8;
          }
          while (v8 < -[NSMutableArray count](self->_separatorViews, "count"));
        }
        -[NSMutableArray removeObjectsInRange:](self->_separatorViews, "removeObjectsInRange:", v7, -[NSMutableArray count](self->_separatorViews, "count") - v7);
      }
    }
  }
  else
  {
    -[_HKAnnotationColumnLayout clearViews](self, "clearViews");
  }
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = -[_HKAnnotationColumnLayout context](self, "context");
    if ((unint64_t)(v5 - 1) >= 2)
    {
      if (!v5)
        -[_HKAnnotationColumnLayout _layoutColumnsEqually](self, "_layoutColumnsEqually");
    }
    else
    {
      -[_HKAnnotationColumnLayout _layoutColumnsPacked](self, "_layoutColumnsPacked");
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[_HKAnnotationColumnLayout _minimumWidth](self, "_minimumWidth");
  v4 = v3;
  -[_HKAnnotationColumnLayout _minimumHeight](self, "_minimumHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)_invalidateLayout
{
  -[_HKAnnotationColumnLayout invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[_HKAnnotationColumnLayout setNeedsLayout](self, "setNeedsLayout");
}

- (void)_clearColumnViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_HKAnnotationColumnLayout columnViews](self, "columnViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)_clearSeparatorViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_HKAnnotationColumnLayout separatorViews](self, "separatorViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[_HKAnnotationColumnLayout separatorViews](self, "separatorViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)_addSeparatorViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    v5 = v4 - 1;
    do
    {
      -[_HKAnnotationColumnLayout _makeSeparatorView](self, "_makeSeparatorView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKAnnotationColumnLayout separatorViews](self, "separatorViews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v6);

      -[_HKAnnotationColumnLayout addSubview:](self, "addSubview:", v6);
      --v5;
    }
    while (v5);
  }
}

- (void)_layoutColumnsEqually
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "count");

  -[_HKAnnotationColumnLayout frame](self, "frame");
  v6 = v5;
  v8 = v7;
  -[_HKAnnotationColumnLayout _columnSeparation](self, "_columnSeparation");
  -[_HKAnnotationColumnLayout _layoutColumnsWithWidth:columnSeparation:currentSize:](self, "_layoutColumnsWithWidth:columnSeparation:currentSize:", (v6 - v9 * (v4 + -1.0)) / v4, v9, v6, v8);
}

- (void)_layoutColumnsPacked
{
  double v3;
  double v4;

  -[_HKAnnotationColumnLayout _columnSeparation](self, "_columnSeparation");
  v4 = v3;
  -[_HKAnnotationColumnLayout frame](self, "frame");
  -[_HKAnnotationColumnLayout _layoutColumnsWithWidth:columnSeparation:currentSize:](self, "_layoutColumnsWithWidth:columnSeparation:currentSize:", 0.0, v4);
}

- (void)_layoutColumnsWithWidth:(double)a3 columnSeparation:(double)a4 currentSize:(CGSize)a5
{
  double height;
  double width;
  double v8;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  _QWORD v51[7];
  _QWORD v52[8];
  uint64_t v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  if (a3 == 0.0)
  {
    -[_HKAnnotationColumnLayout _minimumWidthForPackedLayout](self, "_minimumWidthForPackedLayout");
    v11 = v10 - width;
    -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11 / (double)(unint64_t)objc_msgSend(v12, "count");

    v14 = fmax(v13, 0.0);
  }
  else
  {
    v14 = 0.0;
  }
  v15 = 0;
  v50 = a4 * 0.5;
  v53 = 0;
  v54 = (double *)&v53;
  v55 = 0x2020000000;
  v56 = 0;
  v16 = 1.79769313e308;
  v49 = v8;
  while (1)
  {
    -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v15 >= v18)
      break;
    -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "systemLayoutSizeFittingSize:", width, v16);
    v22 = v21;
    v24 = v23;
    if (v15)
    {
      if (-[_HKAnnotationColumnLayout includeSeparators](self, "includeSeparators"))
      {
        v25 = v16;
        v26 = v14;
        v27 = width;
        v28 = a4;
        v29 = v54[3];
        -[_HKAnnotationColumnLayout separatorViews](self, "separatorViews");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", v15 - 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "setFrame:", v50 + v29, 0.0, 1.0, height);
        a4 = v28;
        width = v27;
        v14 = v26;
        v16 = v25;
        v8 = v49;
      }
      v54[3] = v54[3] + a4;
      if (v8 <= 0.0)
        v32 = v22;
      else
        v32 = v8;
      v33 = v32 - v14;
    }
    else
    {
      if (v8 > 0.0)
        v22 = v8;
      -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");
      v33 = v22 - v14;

      if (v35 == 1)
      {
        -[_HKAnnotationColumnLayout frame](self, "frame");
        if (v33 < v36)
          v33 = v36;
      }
    }
    if (height >= v24)
      v37 = v24;
    else
      v37 = height;
    objc_msgSend(v20, "setFrame:", v54[3], height - v37, v33);
    v54[3] = v33 + v54[3];

    ++v15;
  }
  if (-[_HKAnnotationColumnLayout effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (v39)
    {
      -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", objc_msgSend(v41, "count") - 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "frame");
      v44 = v43;
      objc_msgSend(v42, "frame");
      v46 = 0.0;
      if (v44 + v45 >= width)
        v47 = 0.0;
      else
        v47 = width - (v44 + v45);
      if (v47 > 0.0)
        v46 = v47 + 0.0;
      v54[3] = v46;
      if (-[_HKAnnotationColumnLayout reverseColumnsInRightToLeftLayoutDirection](self, "reverseColumnsInRightToLeftLayoutDirection"))
      {
        -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __82___HKAnnotationColumnLayout__layoutColumnsWithWidth_columnSeparation_currentSize___block_invoke;
        v52[3] = &unk_1E9C41B88;
        v52[4] = self;
        v52[5] = &v53;
        *(double *)&v52[6] = v50;
        *(double *)&v52[7] = a4;
        objc_msgSend(v48, "enumerateObjectsWithOptions:usingBlock:", 2, v52);
      }
      else
      {
        -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __82___HKAnnotationColumnLayout__layoutColumnsWithWidth_columnSeparation_currentSize___block_invoke_2;
        v51[3] = &unk_1E9C41BB0;
        v51[4] = self;
        *(double *)&v51[5] = v47;
        *(double *)&v51[6] = v50;
        objc_msgSend(v48, "enumerateObjectsWithOptions:usingBlock:", 2, v51);
      }

    }
  }
  _Block_object_dispose(&v53, 8);
}

- (double)_minimumWidth
{
  int64_t v3;
  double result;

  v3 = -[_HKAnnotationColumnLayout context](self, "context");
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (!v3)
      -[_HKAnnotationColumnLayout _minimumWithForEqualLayout](self, "_minimumWithForEqualLayout");
  }
  else
  {
    -[_HKAnnotationColumnLayout _minimumWidthForPackedLayout](self, "_minimumWidthForPackedLayout");
  }
  return result;
}

- (double)_minimumWithForEqualLayout
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[_HKAnnotationColumnLayout _columnSeparation](self, "_columnSeparation");
  v6 = v5;
  -[_HKAnnotationColumnLayout _largestColumnWidth](self, "_largestColumnWidth");
  return v6 * (double)(v4 - 1) + v7 * (double)v4;
}

- (double)_minimumWidthForPackedLayout
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  -[_HKAnnotationColumnLayout columnViews](self, "columnViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[_HKAnnotationColumnLayout _columnSeparation](self, "_columnSeparation");
  v6 = v5;
  -[_HKAnnotationColumnLayout _totalColumnWidth](self, "_totalColumnWidth");
  return v7 + v6 * (double)(v4 - 1);
}

- (double)_largestColumnWidth
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_HKAnnotationColumnLayout columnViews](self, "columnViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
        if (v6 < v8)
          v6 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)_columnSeparation
{
  int64_t v2;
  double result;

  v2 = -[_HKAnnotationColumnLayout context](self, "context");
  result = 10.0;
  if (v2 == 2)
    return 20.0;
  return result;
}

- (double)_totalColumnWidth
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_HKAnnotationColumnLayout columnViews](self, "columnViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
        v6 = v6 + v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)_minimumHeight
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_HKAnnotationColumnLayout columnViews](self, "columnViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
        if (v6 < v8)
          v6 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)_makeSeparatorView
{
  id v3;
  int64_t context;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  context = self->_context;
  if (context)
    v5 = context == 2;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_activitySeparatorDefaultColor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = (void *)v6;
    objc_msgSend(v3, "setBackgroundColor:", v6);

    return v3;
  }
  if (context == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_activitySeparatorLollipopColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  return v3;
}

- (BOOL)includeSeparators
{
  return self->_includeSeparators;
}

- (BOOL)reverseColumnsInRightToLeftLayoutDirection
{
  return self->_reverseColumnsInRightToLeftLayoutDirection;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (NSMutableArray)columnViews
{
  return self->_columnViews;
}

- (void)setColumnViews:(id)a3
{
  objc_storeStrong((id *)&self->_columnViews, a3);
}

- (NSMutableArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
  objc_storeStrong((id *)&self->_separatorViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);
}

@end
