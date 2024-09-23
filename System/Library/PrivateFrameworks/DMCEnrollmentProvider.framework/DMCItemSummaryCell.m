@implementation DMCItemSummaryCell

- (DMCItemSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DMCItemSummaryCell *v4;
  DMCItemSummaryCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMCItemSummaryCell;
  v4 = -[DMCItemSummaryCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[DMCItemSummaryCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v5->_detailLabelOriginX = -1.0;
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v25 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)DMCItemSummaryCell;
  -[DMCItemSummaryCell layoutSubviews](&v23, sel_layoutSubviews);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[DMCItemSummaryCell detailViews](self, "detailViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    v7 = 12.0;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        -[DMCItemSummaryCell contentView](self, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        v12 = v11;
        v14 = v13;

        objc_msgSend(v9, "sizeThatFits:", v12 + -20.0, v14);
        v16 = v15;
        v18 = v17;
        v26.origin.x = 10.0;
        v26.origin.y = v7;
        v26.size.width = v16;
        v26.size.height = v18;
        v27 = CGRectIntegral(v26);
        objc_msgSend(v9, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
        v28.origin.x = 10.0;
        v28.origin.y = v7;
        v28.size.width = v16;
        v28.size.height = v18;
        v7 = CGRectGetMaxY(v28) + 10.0;
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double detailLabelOriginX;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t j;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;
  CGSize result;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  width = a3.width;
  v37 = *MEMORY[0x24BDAC8D0];
  detailLabelOriginX = self->_detailLabelOriginX;
  if (detailLabelOriginX < 0.0)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[DMCItemSummaryCell detailViews](self, "detailViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "desiredValueLabelOriginXForSize:", width + -20.0, 3.40282347e38);
          if (v12 > v10)
            v10 = v12;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
    }

    +[DMCProfileKeyValueView defaultPreferredValueLabelOriginX](DMCProfileKeyValueView, "defaultPreferredValueLabelOriginX");
    if (v10 > v13)
      detailLabelOriginX = v10;
    else
      detailLabelOriginX = v13;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[DMCItemSummaryCell detailViews](self, "detailViews", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    v18 = 12.0;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v20, "setPreferredValueLabelOriginX:", detailLabelOriginX);
        objc_msgSend(v20, "sizeThatFits:", width + -20.0, 3.40282347e38);
        v22 = v21;
        v24 = v23;
        v39.origin.x = 10.0;
        v39.origin.y = v18;
        v39.size.width = v22;
        v39.size.height = v24;
        v40 = CGRectIntegral(v39);
        objc_msgSend(v20, "setFrame:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
        v41.origin.x = 10.0;
        v41.origin.y = v18;
        v41.size.width = v22;
        v41.size.height = v24;
        v18 = CGRectGetMaxY(v41) + 10.0;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }
  else
  {
    v18 = 12.0;
  }

  v25 = width;
  v26 = v18;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)setDetailLabelOriginX:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_detailLabelOriginX != a3)
  {
    self->_detailLabelOriginX = a3 + -10.0;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[DMCItemSummaryCell detailViews](self, "detailViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPreferredValueLabelOriginX:", self->_detailLabelOriginX);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[DMCItemSummaryCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)createViewWithDescriptors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  void *v18;
  DMCProfileKeyValueView *v19;
  DMCProfileKeyValueView *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[DMCItemSummaryCell detailViews](self, "detailViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "removeFromSuperview");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11 + 1;
      objc_msgSend(v4, "objectAtIndex:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[DMCProfileKeyValueView initWithFrame:]([DMCProfileKeyValueView alloc], "initWithFrame:", v12, v13, v14, v15);
      v20 = v19;
      if (self->_detailLabelOriginX >= 0.0)
        -[DMCProfileKeyValueView setPreferredValueLabelOriginX:](v19, "setPreferredValueLabelOriginX:");
      -[DMCProfileKeyValueView setKey:value:](v20, "setKey:value:", v16, v18);
      -[DMCItemSummaryCell contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v20);

      objc_msgSend(v10, "addObject:", v20);
      v11 = v17 + 1;
    }
    while (v11 < objc_msgSend(v4, "count"));
  }
  -[DMCItemSummaryCell setDetailViews:](self, "setDetailViews:", v10);
  -[DMCItemSummaryCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)createViewWithItemDetailArray:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t j;
  uint64_t v20;
  DMCProfileKeyValueView *v21;
  DMCProfileKeyValueView *v22;
  DMCProfileKeyValueView *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[DMCItemSummaryCell detailViews](self, "detailViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "removeFromSuperview");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        v21 = [DMCProfileKeyValueView alloc];
        v22 = -[DMCProfileKeyValueView initWithFrame:](v21, "initWithFrame:", v15, v16, v17, v18, (_QWORD)v25);
        v23 = v22;
        if (self->_detailLabelOriginX >= 0.0)
          -[DMCProfileKeyValueView setPreferredValueLabelOriginX:](v22, "setPreferredValueLabelOriginX:");
        -[DMCProfileKeyValueView setItemDetail:](v23, "setItemDetail:", v20);
        -[DMCItemSummaryCell contentView](self, "contentView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSubview:", v23);

        objc_msgSend(v10, "addObject:", v23);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v13);
  }

  -[DMCItemSummaryCell setDetailViews:](self, "setDetailViews:", v10);
  -[DMCItemSummaryCell setNeedsLayout](self, "setNeedsLayout");

}

- (NSArray)detailViews
{
  return self->_detailViews;
}

- (void)setDetailViews:(id)a3
{
  objc_storeStrong((id *)&self->_detailViews, a3);
}

- (double)detailLabelOriginX
{
  return self->_detailLabelOriginX;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailViews, 0);
}

@end
