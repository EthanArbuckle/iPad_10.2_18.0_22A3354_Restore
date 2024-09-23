@implementation SUUIViewElementHorizontalLayout

- (id)layoutViewElements:(id)a3 usingSizingBlock:(id)a4
{
  id v6;
  double (**v7)(id, void *);
  double layoutWidth;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  int64_t maximumLines;
  id v18;
  id v19;
  id v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (double (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  layoutWidth = self->_layoutWidth;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    v22 = v10;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v16 = v7[2](v7, v15);
        if (objc_msgSend(v15, "elementType") == 127)
        {
          objc_msgSend(v9, "addObject:", v15);
        }
        else if (v16 > 0.00000011920929)
        {
          if (v16 <= layoutWidth
            || (maximumLines = self->_maximumLines, maximumLines >= 1)
            && maximumLines >= (unint64_t)objc_msgSend(v23, "count"))
          {
            layoutWidth = layoutWidth - (v16 + self->_elementSpacing);
            objc_msgSend(v9, "addObject:", v15, v22);
          }
          else if (objc_msgSend(v9, "count", v22))
          {
            objc_msgSend(v23, "addObject:", v9);
            v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

            layoutWidth = self->_layoutWidth - v16 - self->_elementSpacing;
            objc_msgSend(v18, "addObject:", v15);
            if (layoutWidth >= 0.00000011920929)
            {
              v9 = v18;
            }
            else
            {
              layoutWidth = self->_layoutWidth;
              objc_msgSend(v23, "addObject:", v18);
              v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

            }
            v10 = v22;
          }
          else
          {
            objc_msgSend(v9, "addObject:", v15);
            objc_msgSend(v23, "addObject:", v9);
            v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

            v9 = v19;
          }
          if (self->_maximumElementsPerLine >= 1 && objc_msgSend(v9, "count") == self->_maximumElementsPerLine)
          {
            layoutWidth = self->_layoutWidth;
            objc_msgSend(v23, "addObject:", v9);
            v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

            v9 = v20;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v23, "addObject:", v9);

  return v23;
}

- (double)elementSpacing
{
  return self->_elementSpacing;
}

- (void)setElementSpacing:(double)a3
{
  self->_elementSpacing = a3;
}

- (double)layoutWidth
{
  return self->_layoutWidth;
}

- (void)setLayoutWidth:(double)a3
{
  self->_layoutWidth = a3;
}

- (int64_t)maximumElementsPerLine
{
  return self->_maximumElementsPerLine;
}

- (void)setMaximumElementsPerLine:(int64_t)a3
{
  self->_maximumElementsPerLine = a3;
}

- (int64_t)maximumLines
{
  return self->_maximumLines;
}

- (void)setMaximumLines:(int64_t)a3
{
  self->_maximumLines = a3;
}

@end
