@implementation ICTableLayoutManager

- (ICTableLayoutManager)initWithTable:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  ICTableLayoutManager *v8;
  ICTableLayoutManager *v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  ICTableColumnWidthManager *columnWidthManager;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *columnLayoutManagers;
  uint64_t v18;
  NSMutableDictionary *rowPositions;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ICTableLayoutManager;
  v8 = -[ICTableLayoutManager init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_table, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = objc_alloc(MEMORY[0x1E0D64D80]);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_table);
    v12 = objc_msgSend(v10, "initWithTable:delegate:", WeakRetained, v9);
    columnWidthManager = v9->_columnWidthManager;
    v9->_columnWidthManager = (ICTableColumnWidthManager *)v12;

    v14 = objc_loadWeakRetained((id *)&v9->_table);
    v15 = objc_msgSend(v14, "columnCount");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    columnLayoutManagers = v9->_columnLayoutManagers;
    v9->_columnLayoutManagers = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    rowPositions = v9->_rowPositions;
    v9->_rowPositions = (NSMutableDictionary *)v18;

  }
  return v9;
}

- (double)emptyCellHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  -[ICTableLayoutManager columnLayoutManagers](self, "columnLayoutManagers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v5, "columnTextStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D64DB0]);
  }
  -[ICTableLayoutManager emptyCellLineHeight](self, "emptyCellLineHeight");
  if (v9 == 0.0)
  {
    objc_msgSend(v8, "bodyAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC1138]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lineHeight");
    -[ICTableLayoutManager setEmptyCellLineHeight:](self, "setEmptyCellLineHeight:");
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC1178]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineSpacing");
    -[ICTableLayoutManager setEmptyCellLineSpacing:](self, "setEmptyCellLineSpacing:");

  }
  objc_msgSend(v8, "zoomController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoomFactor");
  if (v14 == 0.0)
    v15 = 1.0;
  else
    v15 = v14;

  v16 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_pointSizeForBodyTextWithContentSizeCategory:", 0);
  objc_msgSend(v16, "systemFontOfSize:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_fontWithSingleLineA");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "lineHeight");
  v20 = v19;
  -[ICTableLayoutManager emptyCellLineSpacing](self, "emptyCellLineSpacing");
  v22 = round(v21 + v20 * v15 + *MEMORY[0x1E0D64A38] + *MEMORY[0x1E0D64A20]);

  return v22;
}

- (id)columnLayoutManagerForColumn:(id)a3
{
  id v4;
  void *v5;
  ICTableColumnLayoutManager *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ICTableLayoutManager columnLayoutManagers](self, "columnLayoutManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (ICTableColumnLayoutManager *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = -[ICTableColumnLayoutManager initWithTableLayoutManager:columnID:]([ICTableColumnLayoutManager alloc], "initWithTableLayoutManager:columnID:", self, v4);
    -[ICTableLayoutManager columnLayoutManagers](self, "columnLayoutManagers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

    -[ICTableLayoutManager highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager setHighlightPatternRegexFinder:](v6, "setHighlightPatternRegexFinder:", v8);

  }
  return v6;
}

- (void)removeColumnLayoutManagerForColumn:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableLayoutManager columnLayoutManagers](self, "columnLayoutManagers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)updateForMovedRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSRange v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  NSRange v27;
  NSRange v28;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ICTableLayoutManager columnLayoutManagers](self, "columnLayoutManagers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        -[ICTableLayoutManager columnLayoutManagers](self, "columnLayoutManagers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "columnTextStorage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "characterRangeForRowID:", v4);
        v17 = v16;
        objc_msgSend(v14, "updateStorageForMovedRow:", v4);
        v28.location = objc_msgSend(v14, "characterRangeForRowID:", v4);
        v28.length = v18;
        v27.location = v15;
        v27.length = v17;
        v19 = NSUnionRange(v27, v28);
        objc_msgSend(v13, "invalidateLayoutForCharacterRange:actualCharacterRange:", v19.location, v19.length, 0);
        -[ICTableLayoutManager highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setHighlightPatternRegexFinder:", v20);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

}

- (void)setYPosition:(double)a3 forRow:(id)a4 shouldInvalidate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[ICTableLayoutManager rowPositions](self, "rowPositions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_msgSend(v10, "doubleValue"), v11 != a3))
  {
    -[ICTableLayoutManager rowPositions](self, "rowPositions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v8);

    if (v5)
    {
      v28 = v10;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[ICTableLayoutManager columnLayoutManagers](self, "columnLayoutManagers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v20, "columnTextStorage");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "characterRangeForRowID:", v8);
            if (v22 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v23 = v22;
              if (v22 <= objc_msgSend(v21, "length"))
              {
                v24 = objc_msgSend(v21, "length");
                v25 = v23 - 1;
                if (!v23)
                  v25 = 0;
                v26 = v23 != 0;
                if (v23 < v24)
                {
                  v27 = 1;
                }
                else
                {
                  v23 = v25;
                  v27 = v26;
                }
                objc_msgSend(v20, "invalidateLayoutForCharacterRange:actualCharacterRange:", v23, v27, 0);
                objc_msgSend(v20, "locationForGlyphAtIndex:", objc_msgSend(v20, "glyphRangeForCharacterRange:actualCharacterRange:", v23, v27, 0));
              }
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v17);
      }

      v10 = v28;
    }
  }

}

- (double)availableWidth
{
  void *v2;
  double v3;
  double v4;

  -[ICTableLayoutManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableWidth");
  v4 = v3;

  return v4;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v5;
  ICSearchResultRegexMatchFinder **p_highlightPatternRegexFinder;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_highlightPatternRegexFinder = &self->_highlightPatternRegexFinder;
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICTableLayoutManager columnLayoutManagers](self, "columnLayoutManagers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setHighlightPatternRegexFinder:", *p_highlightPatternRegexFinder);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (ICTable)table
{
  return (ICTable *)objc_loadWeakRetained((id *)&self->_table);
}

- (ICAvailableTableWidthProviding)delegate
{
  return (ICAvailableTableWidthProviding *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ICTableColumnWidthManager)columnWidthManager
{
  return (ICTableColumnWidthManager *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)rowPositions
{
  return self->_rowPositions;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (NSMutableDictionary)columnLayoutManagers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (double)emptyCellLineHeight
{
  return self->_emptyCellLineHeight;
}

- (void)setEmptyCellLineHeight:(double)a3
{
  self->_emptyCellLineHeight = a3;
}

- (double)emptyCellLineSpacing
{
  return self->_emptyCellLineSpacing;
}

- (void)setEmptyCellLineSpacing:(double)a3
{
  self->_emptyCellLineSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnLayoutManagers, 0);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_rowPositions, 0);
  objc_storeStrong((id *)&self->_columnWidthManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_table);
}

@end
