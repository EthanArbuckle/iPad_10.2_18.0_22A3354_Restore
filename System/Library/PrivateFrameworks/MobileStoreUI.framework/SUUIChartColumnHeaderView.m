@implementation SUUIChartColumnHeaderView

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
  v3 = self->_buttons;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUUIChartColumnHeaderView;
  -[SUUIChartColumnHeaderView dealloc](&v8, sel_dealloc);
}

- (void)setSelectedTitleIndex:(int64_t)a3
{
  if (self->_selectedTitleIndex != a3)
  {
    self->_selectedTitleIndex = a3;
    -[SUUIChartColumnHeaderView _reloadSelectedButton](self, "_reloadSelectedButton");
  }
}

- (void)setTitles:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSArray *v23;
  NSArray *buttons;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIChartColumnHeaderView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v12 = objc_alloc_init(MEMORY[0x24BEBD430]);
        objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
        -[SUUIChartColumnHeaderView backgroundColor](self, "backgroundColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundColor:", v13);

        objc_msgSend(v12, "setTitle:forState:", v11, 0);
        objc_msgSend(v12, "setTitleColor:forState:", v6, 1);
        objc_msgSend(v12, "setTitleColor:forState:", v6, 4);
        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTitleColor:forState:", v14, 0);

        objc_msgSend(v12, "titleLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFont:", v16);

        objc_msgSend(v12, "sizeToFit");
        objc_msgSend(v5, "addObject:", v12);
        -[SUUIChartColumnHeaderView addSubview:](self, "addSubview:", v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = self->_buttons;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v22, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
        objc_msgSend(v22, "removeFromSuperview");
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  v23 = (NSArray *)objc_msgSend(v5, "copy");
  buttons = self->_buttons;
  self->_buttons = v23;

  -[SUUIChartColumnHeaderView _reloadSelectedButton](self, "_reloadSelectedButton");
}

- (NSArray)titles
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_buttons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "titleForState:", 0, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  NSArray *buttons;
  _QWORD v18[12];
  _QWORD v19[3];
  uint64_t v20;

  -[SUUIChartColumnHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[NSArray count](self->_buttons, "count");
  v12 = v11 - 1;
  if (v11 >= 1)
  {
    v13 = v11;
    -[SUUIChartColumnHeaderView edgePadding](self, "edgePadding");
    v19[0] = 0;
    v19[1] = v19;
    v15 = (v8 + v14 * -2.0 + (float)((float)v12 * -25.0)) / (double)v13;
    v19[2] = 0x2020000000;
    v20 = 0;
    -[SUUIChartColumnHeaderView edgePadding](self, "edgePadding");
    v20 = v16;
    buttons = self->_buttons;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__SUUIChartColumnHeaderView_layoutSubviews__block_invoke;
    v18[3] = &unk_2511FA820;
    v18[6] = v4;
    v18[7] = v6;
    *(double *)&v18[8] = v8;
    v18[9] = v10;
    *(double *)&v18[10] = v15;
    v18[11] = v13;
    v18[4] = self;
    v18[5] = v19;
    -[NSArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v18);
    _Block_object_dispose(v19, 8);
  }
}

CGFloat __43__SUUIChartColumnHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  CGFloat v8;
  uint64_t v9;
  CGFloat v10;
  double v11;
  float v12;
  double v13;
  double v14;
  _BOOL8 v15;
  CGFloat result;
  CGRect v17;

  v5 = a2;
  objc_msgSend(v5, "frame");
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(double *)(v9 + 24);
  v11 = *(double *)(a1 + 72);
  v12 = (v11 - v7) * 0.5;
  v13 = floorf(v12);
  if (v6 >= *(double *)(a1 + 80))
    v14 = *(double *)(a1 + 80);
  else
    v14 = v6;
  objc_msgSend(v5, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(*(CGFloat *)(v9 + 24), v13, v14, v7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), v11));
  v15 = *(uint64_t *)(a1 + 88) >= 2 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472) == a3;
  objc_msgSend(v5, "setSelected:", v15);

  v17.origin.x = v10;
  v17.origin.y = v13;
  v17.size.width = v14;
  v17.size.height = v8;
  result = CGRectGetMaxX(v17) + 25.0;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  NSArray *buttons;
  id v5;
  objc_super v6;

  buttons = self->_buttons;
  v5 = a3;
  -[NSArray makeObjectsPerformSelector:withObject:](buttons, "makeObjectsPerformSelector:withObject:", sel_setBackgroundColor_, v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIChartColumnHeaderView;
  -[SUUIChartColumnHeaderView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SUUIChartColumnHeaderView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[SUUIChartColumnHeaderView edgePadding](self, "edgePadding");
  v8 = v7 + v7;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_buttons;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "sizeToFit", (_QWORD)v18);
        objc_msgSend(v14, "frame");
        v8 = v8 + v15;
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = -[NSArray count](self->_buttons, "count");
  v17 = (float)((float)v16 * 25.0);
  if (v16 <= 1)
    v17 = -0.0;
  -[SUUIChartColumnHeaderView setFrame:](self, "setFrame:", v4, v6, v8 + v17, 44.0, (_QWORD)v18);
}

- (void)_buttonAction:(id)a3
{
  int64_t v4;

  v4 = -[NSArray indexOfObjectIdenticalTo:](self->_buttons, "indexOfObjectIdenticalTo:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_selectedTitleIndex = v4;
    -[SUUIChartColumnHeaderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    -[SUUIChartColumnHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)edgePadding
{
  double v2;
  BOOL v3;
  double result;

  -[SUUIChartColumnHeaderView size](self, "size");
  v3 = v2 <= 341.0;
  result = 15.0;
  if (!v3)
    return 20.0;
  return result;
}

- (void)_reloadSelectedButton
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = -[NSArray count](self->_buttons, "count");
  if (v3 >= 1)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSArray objectAtIndex:](self->_buttons, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = v4 != 1 && i == self->_selectedTitleIndex;
      objc_msgSend(v6, "setSelected:", v8);

    }
  }
}

- (int64_t)selectedTitleIndex
{
  return self->_selectedTitleIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
