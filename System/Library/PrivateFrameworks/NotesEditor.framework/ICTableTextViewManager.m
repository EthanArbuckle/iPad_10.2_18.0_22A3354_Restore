@implementation ICTableTextViewManager

- (ICTableTextViewManager)init
{
  -[ICTableTextViewManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICTableTextViewManager)initWithTableLayoutManager:(id)a3 view:(id)a4 cachedWidths:(id)a5 cachedRowHeights:(id)a6 cachedCellHeights:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  ICTableTextViewManager *v18;
  uint64_t v19;
  NSMutableArray *columnIdentifiers;
  uint64_t v21;
  NSMutableArray *rowIdentifiers;
  uint64_t v23;
  NSMutableSet *prepopulatedColumns;
  uint64_t v25;
  NSMutableDictionary *columnTextViews;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ICTableTextViewManager;
  v18 = -[ICTableTextViewManager init](&v28, sel_init);
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    columnIdentifiers = v18->_columnIdentifiers;
    v18->_columnIdentifiers = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    rowIdentifiers = v18->_rowIdentifiers;
    v18->_rowIdentifiers = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    prepopulatedColumns = v18->_prepopulatedColumns;
    v18->_prepopulatedColumns = (NSMutableSet *)v23;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    columnTextViews = v18->_columnTextViews;
    v18->_columnTextViews = (NSMutableDictionary *)v25;

    objc_storeStrong((id *)&v18->_tableLayoutManager, a3);
    objc_storeWeak((id *)&v18->_contentView, v14);
    objc_storeStrong((id *)&v18->_cachedColumnWidths, a5);
    objc_storeStrong((id *)&v18->_cachedRowHeights, a6);
    objc_storeStrong((id *)&v18->_cachedCellHeights, a7);
    v18->_anchorColumn = 0;
    v18->_anchorRow = 0;
    v18->_anchorPoint = (CGPoint)*MEMORY[0x1E0C9D538];
  }

  return v18;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
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
  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "removeFromSuperview");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)ICTableTextViewManager;
  -[ICTableTextViewManager dealloc](&v9, sel_dealloc);
}

- (CGPoint)initialScrollPointForViewport:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  void *v17;
  double v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (double *)MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isRightToLeft"))
  {
    -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "table");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "columnWidthManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "columnCount");
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v16 = CGRectGetWidth(v30);
    -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 > 0.0 && v15)
    {
      v18 = 0.0;
      v19 = 1;
      do
      {
        objc_msgSend(v13, "identifierForColumnAtIndex:", v19 - 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "widthOfColumn:", v20);
        v22 = v21;
        objc_msgSend(v17, "setDimension:forKey:", v20);
        v18 = v18 + v22;

      }
      while (v18 < v16 && v19++ < v15);
    }
    objc_msgSend(v17, "sum");
    v25 = v24 - v16;
    if (v25 >= 0.0)
      v26 = v25;
    else
      v26 = 0.0;

  }
  else
  {
    v26 = *v8;
  }

  v27 = v26;
  v28 = v9;
  result.y = v28;
  result.x = v27;
  return result;
}

- (CGRect)boundingRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double MaxX;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
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
  CGRect v31;
  CGRect result;

  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frame");
  MaxX = CGRectGetMaxX(v31);
  -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
  v9 = MaxX - v8;
  if (v9 >= 0.0)
    v10 = v9;
  else
    v10 = 0.0;
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowPositions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dimensionForKey:", v12);
  v20 = v17 + v19;

  -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
  if (v20 - v21 >= 0.0)
    v22 = v20 - v21;
  else
    v22 = 0.0;
  -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
  v24 = v23;
  -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
  v26 = v25;

  v27 = v24;
  v28 = v26;
  v29 = v10;
  v30 = v22;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (NSArray)columnIDs
{
  void *v2;
  void *v3;

  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)rowIDs
{
  void *v2;
  void *v3;

  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)enumerateTextViewsWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unsigned __int8 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  v17 = 0;
  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11, &v17);
      v12 = v17;

      if (v12)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)adjustOnscreenPositions
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double MinY;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v48 = *MEMORY[0x1E0C80C00];
  -[ICTableTextViewManager boundingRect](self, "boundingRect");
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  MinX = CGRectGetMinX(v49);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[ICTableTextViewManager columnIDs](self, "columnIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v12);
        -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((columnTextView) != nil)", "-[ICTableTextViewManager adjustOnscreenPositions]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "columnTextView");
        -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dimensionForKey:", v13);
        v18 = v17;

        objc_msgSend(v15, "frame");
        v20 = v19;
        objc_msgSend(v15, "frame");
        objc_msgSend(v15, "setFrame:", MinX, v20, v18);
        -[ICTableTextViewManager contentView](self, "contentView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", MinX);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setVerticalLinePosition:forKey:", v22, v13);

        MinX = MinX + v18;
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v10);
  }

  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  MinY = CGRectGetMinY(v50);
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
    -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  else
    -[ICTableTextViewManager previousRowIdentifiers](self, "previousRowIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v39;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v30);
        -[ICTableTextViewManager contentView](self, "contentView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", MinY);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setHorizontalLinePosition:forKey:", v33, v31);

        -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setYPosition:forRow:shouldInvalidate:", v31, 1, MinY);

        -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "dimensionForKey:", v31);
        v37 = v36;

        MinY = MinY + v37;
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v28);
  }

}

- (void)validateRowHeightsForColumn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSRange v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  double v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;
  NSRange v52;
  NSRange v53;

  v51 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  else
    -[ICTableTextViewManager previousRowIdentifiers](self, "previousRowIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorageForColumn:", v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "characterRangeForRowID:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v11);
  }

  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "columnLayoutManagerForColumn:", v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "characterRangeForRowID:", v16);
    v20 = v19;
    v53.location = objc_msgSend(v8, "characterRangeForRowID:", v17);
    v53.length = v21;
    v52.location = v18;
    v52.length = v20;
    v22 = NSUnionRange(v52, v53);
    objc_msgSend(v15, "ensureLayoutForCharacterRange:", v22.location, v22.length);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v24)
  {
    v25 = v24;
    v39 = v8;
    v26 = 0;
    v27 = *(_QWORD *)v42;
    v28 = *MEMORY[0x1E0D64A70];
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v23);
        v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
        -[ICTableTextViewManager cachedCellHeights](self, "cachedCellHeights");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((cellHeightsForRow) != nil)", "-[ICTableTextViewManager validateRowHeightsForColumn:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "cellHeightsForRow");
        objc_msgSend(v15, "heightOfCellAtRowID:", v30);
        objc_msgSend(v32, "setDimension:forKey:", v40);
        -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dimensionForKey:", v30);
        v35 = v34;

        objc_msgSend(v32, "max");
        if (v36 >= v28)
          v37 = v36;
        else
          v37 = v28;
        if (v35 != v37)
        {
          -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setDimension:forKey:", v30, v37);

          v26 = 1;
        }

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v25);

    v8 = v39;
    if ((v26 & 1) != 0)
      -[ICTableTextViewManager adjustOnscreenPositions](self, "adjustOnscreenPositions");
  }
  else
  {

  }
}

- (double)addColumn:(id)a3 atEnd:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double MaxX;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  CGRect v41;

  v4 = a4;
  v6 = a3;
  -[ICTableTextViewManager validateRowHeightsForColumn:](self, "validateRowHeightsForColumn:", v6);
  -[ICTableTextViewManager boundingRect](self, "boundingRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v4)
  {
    -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertObject:atIndex:", v6, objc_msgSend(v17, "count"));

  }
  else
  {
    objc_msgSend(v15, "insertObject:atIndex:", v6, 0);
  }

  -[ICTableTextViewManager prepopulatedColumns](self, "prepopulatedColumns");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v6);

  if (v19)
  {
    -[ICTableTextViewManager prepopulatedColumns](self, "prepopulatedColumns");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObject:", v6);

  }
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "columnWidthManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "widthOfColumn:", v6);
  v24 = v23;

  if (v4)
  {
    v41.origin.x = v8;
    v41.origin.y = v10;
    v41.size.width = v12;
    v41.size.height = v14;
    MaxX = CGRectGetMaxX(v41);
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    if (MaxX < v26)
      MaxX = v26;
  }
  else
  {
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    MaxX = v27 - v24;
  }
  -[ICTableTextViewManager contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;

  -[ICTableTextViewManager textViewForColumn:createIfNeeded:](self, "textViewForColumn:createIfNeeded:", v6, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", MaxX, 0.0, v24, v30);
  -[ICTableTextViewManager contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v31);

  -[ICTableTextViewManager columnsNeedingRestyle](self, "columnsNeedingRestyle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "containsObject:", v6);

  if (v34)
    -[ICTableTextViewManager restyleTextView:](self, "restyleTextView:", v31);
  -[ICTableTextViewManager updateAuthorHighlights](self, "updateAuthorHighlights");
  -[ICTableTextViewManager contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", MaxX);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setVerticalLinePosition:forKey:", v36, v6);

  if (!v4)
  {
    -[ICTableTextViewManager setAnchorColumn:](self, "setAnchorColumn:", -[ICTableTextViewManager anchorColumn](self, "anchorColumn") - 1);
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    v38 = v37 - v24;
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    -[ICTableTextViewManager setAnchorPoint:](self, "setAnchorPoint:", v38);
  }
  -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDimension:forKey:", v6, v24);

  -[ICTableTextViewManager validateRowHeightsForColumn:](self, "validateRowHeightsForColumn:", v6);
  return v24;
}

- (double)ensureChunkOfPopulatedColumnsForColumn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;

  v4 = a3;
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnLayoutManagerForColumn:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "columnTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "populatedRows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "columnIndexForIdentifier:", v4);
    v13 = *MEMORY[0x1E0D64A40] + v12;
    v14 = objc_msgSend(v11, "columnCount");
    if (v13 >= v14)
      v15 = v14;
    else
      v15 = v13;
    if (v12 < v15)
    {
      do
      {
        objc_msgSend(v11, "identifierForColumnAtIndex:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableTextViewManager preAddColumn:](self, "preAddColumn:", v16);

        ++v12;
      }
      while (v15 != v12);
    }

  }
  -[ICTableTextViewManager addColumn:atEnd:](self, "addColumn:atEnd:", v4, 1);
  v18 = v17;

  return v18;
}

- (double)preAddColumn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[ICTableTextViewManager validateRowHeightsForColumn:](self, "validateRowHeightsForColumn:", v4);
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnWidthManager");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "widthOfColumn:", v4);
  v8 = v7;

  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    -[ICTableTextViewManager prepopulatedColumns](self, "prepopulatedColumns");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);

  }
  -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDimension:forKey:", v4, v8);

  return v8;
}

- (double)addRow:(id)a3 atEnd:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  char v31;
  double MaxY;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  ICTableTextViewManager *v51;
  id obj;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  v4 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICTableTextViewManager boundingRect](self, "boundingRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v4)
  {
    -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertObject:atIndex:", v6, objc_msgSend(v17, "count"));

  }
  else
  {
    objc_msgSend(v15, "insertObject:atIndex:", v6, 0);
  }

  -[ICTableTextViewManager cachedCellHeights](self, "cachedCellHeights");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63AE0]), "initWithComparator:", &__block_literal_global_31);
    -[ICTableTextViewManager cachedCellHeights](self, "cachedCellHeights");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v19, v6);

  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v55;
    v51 = self;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v25;
        objc_msgSend(v26, "columnLayoutManagerForColumn:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          objc_msgSend(v27, "columnTextStorage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "populatedRows");
          v29 = v4;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "containsObject:", v6);

          v4 = v29;
          self = v51;

          if ((v31 & 1) == 0)
          {
            v60.origin.x = v8;
            v60.origin.y = v10;
            v60.size.width = v12;
            v60.size.height = v14;
            MaxY = CGRectGetMaxY(v60);
            -[ICTableTextViewManager anchorPoint](v51, "anchorPoint");
            if (MaxY < v33)
              MaxY = v33;
            -[ICTableTextViewManager tableLayoutManager](v51, "tableLayoutManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setYPosition:forRow:shouldInvalidate:", v6, 0, MaxY);

          }
        }
        objc_msgSend(v27, "heightOfCellAtRowID:", v6);
        objc_msgSend(v19, "setDimension:forKey:", v53);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v22);
  }

  objc_msgSend(v19, "max");
  v36 = v35;
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "emptyCellHeight");
  v39 = v38;

  if (v36 < v39)
    v36 = v39;
  if (v4)
  {
    v61.origin.x = v8;
    v61.origin.y = v10;
    v61.size.width = v12;
    v61.size.height = v14;
    v40 = CGRectGetMaxY(v61);
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    if (v40 < v41)
      v40 = v41;
  }
  else
  {
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    v40 = v42 - v36;
  }
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setYPosition:forRow:shouldInvalidate:", v6, 1, v40);

  -[ICTableTextViewManager contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setHorizontalLinePosition:forKey:", v45, v6);

  if (!v4)
  {
    -[ICTableTextViewManager setAnchorRow:](self, "setAnchorRow:", -[ICTableTextViewManager anchorRow](self, "anchorRow") - 1);
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    v47 = v46;
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    -[ICTableTextViewManager setAnchorPoint:](self, "setAnchorPoint:", v47, v48 - v36);
  }
  -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setDimension:forKey:", v6, v36);

  return v36;
}

uint64_t __39__ICTableTextViewManager_addRow_atEnd___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (double)ensureChunkOfPopulatedRowsForRow:(id)a3 shouldForce:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  double MaxY;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
LABEL_12:
    -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v7, "rowIndexForIdentifier:", v6);
    v20 = *MEMORY[0x1E0D64A78] + v19;
    v21 = objc_msgSend(v7, "rowCount");
    if (v20 >= v21)
      v22 = v21;
    else
      v22 = v20;
    -[ICTableTextViewManager boundingRect](self, "boundingRect");
    MaxY = CGRectGetMaxY(v36);
    -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
    if (v19 < v22)
    {
      if (MaxY < v24)
        MaxY = v24;
      do
      {
        objc_msgSend(v7, "identifierForRowAtIndex:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableTextViewManager preAddRow:atYPosition:](self, "preAddRow:atYPosition:", v25, MaxY);
        MaxY = MaxY + v26;

        ++v19;
      }
      while (v22 != v19);
    }
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "columnLayoutManagerForColumn:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "columnTextStorage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "populatedRows");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v6);

          if (!v17)
          {

            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v9)
          continue;
        break;
      }
    }
  }

  -[ICTableTextViewManager addRow:atEnd:](self, "addRow:atEnd:", v6, 1);
  v28 = v27;

  return v28;
}

- (double)preAddRow:(id)a3 atYPosition:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  id obj;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICTableTextViewManager cachedCellHeights](self, "cachedCellHeights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();

  v42 = (void *)v8;
  if (!v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D63AE0]), "initWithComparator:", &__block_literal_global_21_0);
    -[ICTableTextViewManager cachedCellHeights](self, "cachedCellHeights");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v9;
    objc_msgSend(v10, "setObject:forKey:", v9, v6);

  }
  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableTextViewManager prepopulatedColumns](self, "prepopulatedColumns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "columnLayoutManagerForColumn:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "columnTextStorage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "populatedRows");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsObject:", v6);

        if ((v24 & 1) == 0)
        {
          -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "rowPositions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", v6);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v27, "doubleValue");
            v29 = v28 != a4;
          }
          else
          {
            v29 = 0;
          }
          -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setYPosition:forRow:shouldInvalidate:", v6, v29, a4);

        }
        objc_msgSend(v21, "heightOfCellAtRowID:", v6);
        objc_msgSend(v42, "setDimension:forKey:", v19);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v16);
  }

  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setYPosition:forRow:shouldInvalidate:", v6, 1, a4);

  -[ICTableTextViewManager contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHorizontalLinePosition:forKey:", v33, v6);

  objc_msgSend(v42, "max");
  v35 = v34;
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "emptyCellHeight");
  v38 = v37;

  if (v35 < v38)
    v35 = v38;
  -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDimension:forKey:", v6, v35);

  return v35;
}

uint64_t __48__ICTableTextViewManager_preAddRow_atYPosition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)ensureCellPositionForColumn:(id)a3 andRow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  double MaxX;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  uint64_t v41;
  double v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  ICTableTextViewManager *v49;
  uint64_t *v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;

  v6 = a3;
  v7 = a4;
  -[ICTableTextViewManager textViewForColumn:createIfNeeded:](self, "textViewForColumn:createIfNeeded:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[ICTableTextViewManager contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v8);

    -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "table");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "columnIndexForIdentifier:", v6);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_42:

      goto LABEL_43;
    }
    v14 = v13;
    -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "columnWidthManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthOfColumn:", v6);
    v18 = v17;

    if (!v14 && (objc_msgSend(v12, "isLeftToRight") & 1) != 0)
    {
      v19 = 0;
      v20 = 1;
LABEL_25:
      MaxX = 0.0;
      goto LABEL_28;
    }
    if (v14 != objc_msgSend(v12, "columnCount") - 1 || (MaxX = 0.0, (objc_msgSend(v12, "isRightToLeft") & 1) == 0))
    {
      if (v14 != objc_msgSend(v12, "columnCount") - 1 || (objc_msgSend(v12, "isLeftToRight") & 1) == 0)
      {
        if (v14)
        {
          v20 = 0;
          MaxX = 0.0;
LABEL_17:
          objc_msgSend(v12, "identifierForColumnAtIndex:", v14 - 1);
          v24 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v24;
          if ((v20 & 1) == 0 && v24)
          {
            -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "allKeys");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "containsObject:", v19);

            if (v27)
            {
              -[ICTableTextViewManager textViewForColumn:](self, "textViewForColumn:", v19);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v12, "isLeftToRight");
              objc_msgSend(v28, "frame");
              if (v29)
                MaxX = CGRectGetMaxX(*(CGRect *)&v30);
              else
                MaxX = CGRectGetMinX(*(CGRect *)&v30) - v18;

              v20 = 1;
            }
            else
            {
              v20 = 0;
            }
          }
LABEL_28:
          if (v14 >= objc_msgSend(v12, "columnCount") - 1)
          {
            v34 = 0;
          }
          else
          {
            objc_msgSend(v12, "identifierForColumnAtIndex:", v14 + 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              v35 = v20;
            else
              v35 = 1;
            if (v35 != 1)
            {
              -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "allKeys");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "containsObject:", v34);

              if (v38)
              {
                -[ICTableTextViewManager textViewForColumn:](self, "textViewForColumn:", v34);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v12, "isLeftToRight");
                objc_msgSend(v39, "frame");
                if (v40)
                  MaxX = CGRectGetMinX(*(CGRect *)&v41) - v18;
                else
                  MaxX = CGRectGetMaxX(*(CGRect *)&v41);

                goto LABEL_41;
              }
              goto LABEL_38;
            }
          }
          if ((v20 & 1) != 0)
          {
LABEL_41:
            -[ICTableTextViewManager contentView](self, "contentView");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "bounds");
            objc_msgSend(v8, "setFrame:", MaxX, 0.0, v18);

            goto LABEL_42;
          }
LABEL_38:
          -[ICTableTextViewManager frameOfCellAtColumn:row:](self, "frameOfCellAtColumn:row:", v6, v7);
          MaxX = v45;
          goto LABEL_41;
        }
        if (!objc_msgSend(v12, "isRightToLeft"))
        {
          v19 = 0;
          v20 = 0;
          goto LABEL_25;
        }
      }
      if (objc_msgSend(v12, "isLeftToRight"))
      {
        v51 = 0;
        v52 = (double *)&v51;
        v53 = 0x2020000000;
        v54 = 0;
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __61__ICTableTextViewManager_ensureCellPositionForColumn_andRow___block_invoke;
        v47[3] = &unk_1EA7E15D8;
        v48 = v6;
        v49 = self;
        v50 = &v51;
        objc_msgSend(v12, "enumerateColumnsWithBlock:", v47);
        MaxX = v52[3];

        _Block_object_dispose(&v51, 8);
      }
      else
      {
        -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sum");
        MaxX = v23 - v18;

      }
    }
    v20 = 1;
    if (!v14)
    {
      v19 = 0;
      goto LABEL_28;
    }
    goto LABEL_17;
  }
LABEL_43:

}

void __61__ICTableTextViewManager_ensureCellPositionForColumn_andRow___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "tableLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "columnWidthManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widthOfColumn:", v10);
    v9 = v8;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
  }

}

- (void)clearColumn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "ic_isFirstResponder") & 1) == 0)
    objc_msgSend(v5, "removeFromSuperview");
  -[ICTableTextViewManager contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVerticalLinePosition:forKey:", 0, v8);

  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

}

- (void)clearRow:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if (v5)
  {
    -[ICTableTextViewManager contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHorizontalLinePosition:forKey:", 0, v8);

    -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

  }
}

- (void)clearColumnsOutsideFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v50 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[ICTableTextViewManager columnIDs](self, "columnIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "frame");
        v17 = v16;
        objc_msgSend(v15, "frame");
        v53.size.width = v18;
        v51.origin.x = x;
        v51.origin.y = y;
        v51.size.width = width;
        v51.size.height = height;
        v53.origin.x = v17;
        v53.origin.y = y;
        v53.size.height = height;
        if (CGRectIntersectsRect(v51, v53)
          || (-[ICTableTextViewManager draggedColumns](self, "draggedColumns"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20 = objc_msgSend(v19, "containsObject:", v13),
              v19,
              v20))
        {

          goto LABEL_12;
        }
        -[ICTableTextViewManager clearColumn:](self, "clearColumn:", v13);
        -[ICTableTextViewManager setAnchorColumn:](self, "setAnchorColumn:", -[ICTableTextViewManager anchorColumn](self, "anchorColumn") + 1);
        -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dimensionForKey:", v13);
        v23 = v22;

        -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
        v25 = v23 + v24;
        -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
        -[ICTableTextViewManager setAnchorPoint:](self, "setAnchorPoint:", v25);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[ICTableTextViewManager columnIDs](self, "columnIDs", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "reverseObjectEnumerator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v41;
    while (2)
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
        -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "frame");
        v36 = v35;
        objc_msgSend(v34, "frame");
        v54.size.width = v37;
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = height;
        v54.origin.x = v36;
        v54.origin.y = y;
        v54.size.height = height;
        if (CGRectIntersectsRect(v52, v54)
          || (-[ICTableTextViewManager draggedColumns](self, "draggedColumns"),
              v38 = (void *)objc_claimAutoreleasedReturnValue(),
              v39 = objc_msgSend(v38, "containsObject:", v32),
              v38,
              v39))
        {

          goto LABEL_23;
        }
        -[ICTableTextViewManager clearColumn:](self, "clearColumn:", v32);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v29)
        continue;
      break;
    }
  }
LABEL_23:

}

- (void)clearRowsOutsideFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  char v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  CGFloat v43;
  void *v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v56 = *MEMORY[0x1E0C80C00];
  -[ICTableTextViewManager columnIDs](self, "columnIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[ICTableTextViewManager rowIDs](self, "rowIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v51;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v51 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v14);
        -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "rowPositions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;

        -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dimensionForKey:", v15);
        v23 = v22;

        v57.origin.x = x;
        v57.origin.y = y;
        v57.size.width = width;
        v57.size.height = height;
        v59.origin.x = x;
        v59.origin.y = v20;
        v59.size.width = width;
        v59.size.height = v23;
        if (CGRectIntersectsRect(v57, v59))
          break;
        -[ICTableTextViewManager draggedRows](self, "draggedRows");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "containsObject:", v15);

        if ((v25 & 1) != 0)
          break;
        -[ICTableTextViewManager clearRow:](self, "clearRow:", v15);
        -[ICTableTextViewManager setAnchorRow:](self, "setAnchorRow:", -[ICTableTextViewManager anchorRow](self, "anchorRow") + 1);
        -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
        v27 = v26;
        -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
        -[ICTableTextViewManager setAnchorPoint:](self, "setAnchorPoint:", v27, v23 + v28);
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[ICTableTextViewManager rowIDs](self, "rowIDs", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "reverseObjectEnumerator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v47;
LABEL_13:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v34);
        -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "rowPositions");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKey:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v40 = v39;

        -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "dimensionForKey:", v35);
        v43 = v42;

        v58.origin.x = x;
        v58.origin.y = y;
        v58.size.width = width;
        v58.size.height = height;
        v60.origin.x = x;
        v60.origin.y = v40;
        v60.size.width = width;
        v60.size.height = v43;
        if (CGRectIntersectsRect(v58, v60))
          break;
        -[ICTableTextViewManager draggedRows](self, "draggedRows");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "containsObject:", v35);

        if ((v45 & 1) != 0)
          break;
        -[ICTableTextViewManager clearRow:](self, "clearRow:", v35);
        if (v32 == ++v34)
        {
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          if (v32)
            goto LABEL_13;
          break;
        }
      }
    }

  }
}

- (CGPoint)updateTilesWithViewport:(CGRect)a3 redrawAll:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  ICTableTextViewManager *v37;
  double v38;
  double v39;
  double MinX;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double MaxX;
  double v53;
  double v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  void *v61;
  char v62;
  double v63;
  double v64;
  double v65;
  double MinY;
  uint64_t v67;
  BOOL v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v77;
  double v78;
  double MaxY;
  double v80;
  double v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  void *v87;
  char v88;
  double v89;
  void *v90;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t j;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  double v125;
  CGFloat rect;
  double obj;
  id obja;
  ICTableTextViewManager *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;
  CGPoint result;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v140 = *MEMORY[0x1E0C80C00];
  v10 = -[ICTableTextViewManager isUpdatingTiles](self, "isUpdatingTiles");
  v11 = (double *)MEMORY[0x1E0C9D538];
  if (v10)
  {
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[ICTableTextViewManager setUpdatingTiles:](self, "setUpdatingTiles:", 1);
    -[ICTableTextViewManager boundingRect](self, "boundingRect");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v129 = self;
    -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "table");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v152.size.width = width;
    v152.origin.y = y;
    v125 = *v11;
    obj = v11[1];
    v142.origin.x = v15;
    v142.origin.y = v17;
    v142.size.width = v19;
    v142.size.height = v21;
    v152.origin.x = x;
    v152.size.height = height;
    if (CGRectContainsRect(v142, v152)
      && (v143.origin.x = v15, v143.origin.y = v17, v143.size.width = v19, v143.size.height = v21, !CGRectIsEmpty(v143)))
    {
      v13 = obj;
      v12 = v125;
      v37 = self;
    }
    else
    {
      v121 = v21;
      v122 = v19;
      -[ICTableTextViewManager clearColumnsOutsideFrame:](self, "clearColumnsOutsideFrame:", x, y, width, height);
      -[ICTableTextViewManager clearRowsOutsideFrame:](self, "clearRowsOutsideFrame:", x, y, width, height);
      -[ICTableTextViewManager draggedColumns](self, "draggedColumns");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25)
      {
        v26 = objc_alloc(MEMORY[0x1E0C99E20]);
        -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v26, "initWithArray:", v27);

        -[ICTableTextViewManager draggedColumns](self, "draggedColumns");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "intersectSet:", v29);

        v25 = objc_msgSend(v28, "count");
      }
      -[ICTableTextViewManager draggedRows](self, "draggedRows");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      v123 = v17;
      v124 = v15;
      if (v31)
      {
        v32 = objc_alloc(MEMORY[0x1E0C99E20]);
        -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v32, "initWithArray:", v33);

        -[ICTableTextViewManager draggedRows](self, "draggedRows");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "intersectSet:", v35);

        v36 = objc_msgSend(v34, "count");
      }
      else
      {
        v36 = 0;
      }
      v37 = self;
      -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
      v39 = v38;
      v144.origin.x = x;
      v144.origin.y = y;
      v144.size.width = width;
      rect = height;
      v144.size.height = height;
      MinX = CGRectGetMinX(v144);
      v41 = -[ICTableTextViewManager anchorColumn](self, "anchorColumn");
      v12 = v125;
      if (v39 > MinX)
      {
        v42 = v41 + v25;
        v12 = v125;
        if ((uint64_t)(v41 + v25) >= 1)
        {
          v12 = v125;
          do
          {
            if ((objc_msgSend(v23, "isLeftToRight") & 1) == 0)
              objc_msgSend(v23, "columnCount");
            --v42;
            objc_msgSend(v23, "identifierForColumnAtIndex:");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "containsObject:", v43);

              if ((v45 & 1) == 0)
              {
                -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "dimensionForKey:", v43);
                v48 = v47;

                -[ICTableTextViewManager addColumn:atEnd:](self, "addColumn:atEnd:", v43, 0);
                v39 = v39 - v49;
                v12 = v12 + v49 - v48;
              }
            }

          }
          while (v39 > MinX && v42 > 0);
        }
      }
      -[ICTableTextViewManager anchorPoint](self, "anchorPoint");
      v51 = v50;
      v145.origin.y = v123;
      v145.origin.x = v124;
      v145.size.height = v21;
      v145.size.width = v122;
      MaxX = CGRectGetMaxX(v145);
      if (v51 >= MaxX)
        v53 = v51;
      else
        v53 = MaxX;
      v146.origin.x = x;
      v146.origin.y = y;
      v146.size.width = width;
      v146.size.height = rect;
      v54 = CGRectGetMaxX(v146);
      v55 = -[ICTableTextViewManager anchorColumn](self, "anchorColumn");
      -[ICTableTextViewManager columnIDs](self, "columnIDs");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "count");

      if (v53 < v54)
      {
        v58 = v55 - v25 + v57;
        do
        {
          if (v58 >= objc_msgSend(v23, "columnCount"))
            break;
          if ((objc_msgSend(v23, "isLeftToRight") & 1) != 0)
          {
            v59 = v58++;
          }
          else
          {
            ++v58;
            v59 = objc_msgSend(v23, "columnCount") - v58;
          }
          objc_msgSend(v23, "identifierForColumnAtIndex:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v60)
          {
            -[ICTableTextViewManager columnIdentifiers](v129, "columnIdentifiers");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "containsObject:", v60);

            if ((v62 & 1) == 0)
            {
              -[ICTableTextViewManager ensureChunkOfPopulatedColumnsForColumn:](v129, "ensureChunkOfPopulatedColumnsForColumn:", v60);
              v53 = v53 + v63;
            }
          }

        }
        while (v53 < v54);
      }
      -[ICTableTextViewManager anchorPoint](v129, "anchorPoint");
      v65 = v64;
      v147.origin.x = x;
      v147.origin.y = y;
      v147.size.width = width;
      v147.size.height = rect;
      MinY = CGRectGetMinY(v147);
      v67 = -[ICTableTextViewManager anchorRow](v129, "anchorRow") + v36;
      v68 = v65 <= MinY || v67 < 1;
      v13 = obj;
      if (!v68)
      {
        v13 = obj;
        do
        {
          objc_msgSend(v23, "identifierForRowAtIndex:", v67 - 1);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (v69)
          {
            -[ICTableTextViewManager rowIdentifiers](v129, "rowIdentifiers");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "containsObject:", v69);

            if ((v71 & 1) == 0)
            {
              -[ICTableTextViewManager cachedRowHeights](v129, "cachedRowHeights");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "dimensionForKey:", v69);
              v74 = v73;

              -[ICTableTextViewManager addRow:atEnd:](v129, "addRow:atEnd:", v69, 0);
              v65 = v65 - v75;
              v13 = v13 + v75 - v74;
            }
          }

        }
        while (v65 > MinY && (unint64_t)v67-- > 1);
      }
      -[ICTableTextViewManager anchorPoint](v129, "anchorPoint");
      v78 = v77;
      v148.origin.y = v123;
      v148.origin.x = v124;
      v148.size.height = v121;
      v148.size.width = v122;
      MaxY = CGRectGetMaxY(v148);
      if (v78 >= MaxY)
        v80 = v78;
      else
        v80 = MaxY;
      v149.origin.x = x;
      v149.origin.y = y;
      v149.size.width = width;
      v149.size.height = rect;
      v81 = CGRectGetMaxY(v149);
      v82 = -[ICTableTextViewManager anchorRow](v129, "anchorRow");
      -[ICTableTextViewManager rowIDs](v129, "rowIDs");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "count");

      if (v80 < v81)
      {
        v85 = v82 - v36 + v84;
        do
        {
          if (v85 >= objc_msgSend(v23, "rowCount"))
            break;
          objc_msgSend(v23, "identifierForRowAtIndex:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (v86)
          {
            -[ICTableTextViewManager rowIdentifiers](v129, "rowIdentifiers");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "containsObject:", v86);

            if ((v88 & 1) == 0)
            {
              -[ICTableTextViewManager ensureChunkOfPopulatedRowsForRow:shouldForce:](v129, "ensureChunkOfPopulatedRowsForRow:shouldForce:", v86, v4);
              v80 = v80 + v89;
            }
          }

          ++v85;
        }
        while (v80 < v81);
      }
      -[ICTableTextViewManager contentView](v129, "contentView");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v125 || v13 != obj)
      {
        v120 = v23;
        if (v12 != 0.0)
        {
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          -[ICTableTextViewManager columnIdentifiers](v129, "columnIdentifiers");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v134, v139, 16);
          if (v93)
          {
            v94 = v93;
            v95 = *(_QWORD *)v135;
            do
            {
              for (i = 0; i != v94; ++i)
              {
                if (*(_QWORD *)v135 != v95)
                  objc_enumerationMutation(v92);
                v97 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * i);
                -[ICTableTextViewManager columnTextViews](v129, "columnTextViews", v120);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "objectForKeyedSubscript:", v97);
                v99 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v99, "frame");
                v151 = CGRectOffset(v150, v12, 0.0);
                objc_msgSend(v99, "setFrame:", v151.origin.x, v151.origin.y, v151.size.width, v151.size.height);
                v100 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v99, "frame");
                objc_msgSend(v100, "numberWithDouble:");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "setVerticalLinePosition:forKey:", v101, v97);

              }
              v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v134, v139, 16);
            }
            while (v94);
          }

          v23 = v120;
        }
        if (v13 != 0.0)
        {
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          -[ICTableTextViewManager rowIdentifiers](v129, "rowIdentifiers");
          obja = (id)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v130, v138, 16);
          if (v102)
          {
            v103 = v102;
            v104 = *(_QWORD *)v131;
            do
            {
              for (j = 0; j != v103; ++j)
              {
                if (*(_QWORD *)v131 != v104)
                  objc_enumerationMutation(obja);
                v106 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * j);
                -[ICTableTextViewManager tableLayoutManager](v129, "tableLayoutManager", v120);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "rowPositions");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "objectForKey:", v106);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "doubleValue");
                v111 = v110;

                v112 = v13 + v111;
                -[ICTableTextViewManager tableLayoutManager](v129, "tableLayoutManager");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "setYPosition:forRow:shouldInvalidate:", v106, 1, v112);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v112);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "setHorizontalLinePosition:forKey:", v114, v106);

              }
              v103 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v130, v138, 16);
            }
            while (v103);
          }

          v37 = v129;
          v23 = v120;
        }
        -[ICTableTextViewManager anchorPoint](v37, "anchorPoint", v120);
        v116 = v12 + v115;
        -[ICTableTextViewManager anchorPoint](v37, "anchorPoint");
        -[ICTableTextViewManager setAnchorPoint:](v37, "setAnchorPoint:", v116, v13 + v117);
      }

    }
    -[ICTableTextViewManager setUpdatingTiles:](v37, "setUpdatingTiles:", 0);

  }
  v118 = v12;
  v119 = v13;
  result.y = v119;
  result.x = v118;
  return result;
}

- (CGPoint)redrawAllWithViewport:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v41 = *MEMORY[0x1E0C80C00];
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v9, "rowsIntersectingWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableTextViewManager setPreviousRowIdentifiers:](self, "setPreviousRowIdentifiers:", v12);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        -[ICTableTextViewManager clearRow:](self, "clearRow:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v16);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        -[ICTableTextViewManager clearColumn:](self, "clearColumn:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v24++));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

  -[ICTableTextViewManager updateTilesWithViewport:redrawAll:](self, "updateTilesWithViewport:redrawAll:", 1, x, y, width, height);
  v26 = v25;
  v28 = v27;
  -[ICTableTextViewManager setPreviousRowIdentifiers:](self, "setPreviousRowIdentifiers:", 0);
  v29 = v26;
  v30 = v28;
  result.y = v30;
  result.x = v29;
  return result;
}

- (void)heightChangedForRow:(id)a3 by:(double)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  if (a4 != 0.0)
  {
    -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v21);

    -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = v7 + 1;
    if (v10 < v9)
    {
      do
      {
        -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "rowPositions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16 + a4;

        -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setYPosition:forRow:shouldInvalidate:", v12, 1, v17);

        -[ICTableTextViewManager contentView](self, "contentView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHorizontalLinePosition:forKey:", v20, v12);

        ++v10;
      }
      while (v9 != v10);
    }
  }

}

- (void)removeColumn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeFromSuperview");
  if (v5)
  {
    -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

- (void)moveColumnAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", a3);

  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v10, a4);

}

- (void)moveRowAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", a3);

  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v10, a4);

}

- (BOOL)cellContainingPoint:(CGPoint)a3 columnID:(id *)a4 rowID:(id *)a5
{
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  BOOL v30;
  int v31;
  id *v33;
  id *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  y = a3.y;
  x = a3.x;
  v42 = *MEMORY[0x1E0C80C00];
  -[ICTableTextViewManager contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hitTest:withEvent:", 0, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "columnID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v15)
      {
        v16 = v15;
        v35 = v12;
        v36 = v13;
        v33 = a4;
        v34 = a5;
        v17 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v38 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager", v33);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "rowPositions");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValue");
            v24 = v23;

            -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "dimensionForKey:", v19);
            v27 = v26;

            v28 = v24 + v27;
            if (v24 <= y && v28 >= y)
            {
              v13 = v36;
              *v33 = objc_retainAutorelease(v36);
              *v34 = objc_retainAutorelease(v19);
              v31 = 1;
              goto LABEL_17;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16, v28);
        }
        while (v16);
        v31 = 0;
        v13 = v36;
LABEL_17:
        v12 = v35;
      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }

    v30 = v31 != 0;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)columnContainingX:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGRect v20;
  CGRect v21;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[ICTableTextViewManager textViewForColumn:](self, "textViewForColumn:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frame");
        if (CGRectGetMinX(v20) <= a3)
        {
          objc_msgSend(v11, "frame");
          if (CGRectGetMaxX(v21) >= a3)
          {
            v12 = v10;

            goto LABEL_12;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)rowContainingY:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "rowPositions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dimensionForKey:", v10);
        v18 = v17;

        v19 = v15 + v18;
        if (v15 <= a3 && v19 >= a3)
        {
          v21 = v10;
          goto LABEL_14;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v19);
    }
    while (v7);
  }
  v21 = 0;
LABEL_14:

  return v21;
}

- (id)textViewForColumn:(id)a3
{
  return -[ICTableTextViewManager textViewForColumn:createIfNeeded:](self, "textViewForColumn:createIfNeeded:", a3, 0);
}

- (id)textViewForColumn:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  ICTableColumnTextView *v8;
  void *v9;
  void *v10;
  ICTableColumnTextView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a4;
  v6 = a3;
  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (ICTableColumnTextView *)objc_claimAutoreleasedReturnValue();

  if (!v8 && v4)
  {
    -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "columnLayoutManagerForColumn:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [ICTableColumnTextView alloc];
    objc_msgSend(v10, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICTableColumnTextView initWithFrame:textContainer:](v11, "initWithFrame:textContainer:", v12, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

    -[ICTableColumnTextView setAutoresizingMask:](v8, "setAutoresizingMask:", 20);
    objc_msgSend(v10, "setTextView:", v8);
    -[ICTableColumnTextView setDataDetectorTypes:](v8, "setDataDetectorTypes:", -1);
    -[ICTableTextViewManager delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "noteTextView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnTextView _setDataOwnerForCopy:](v8, "_setDataOwnerForCopy:", objc_msgSend(v14, "_dataOwnerForCopy"));

    -[ICTableTextViewManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "noteTextView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnTextView _setDataOwnerForPaste:](v8, "_setDataOwnerForPaste:", objc_msgSend(v16, "_dataOwnerForPaste"));

    -[ICTableTextViewManager delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "noteTextView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "editorController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnTextView setEditorController:](v8, "setEditorController:", v19);

    -[ICTableColumnTextView textContainer](v8, "textContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWidthTracksTextView:", 1);

    -[ICTableColumnTextView textContainer](v8, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHeightTracksTextView:", 0);

    -[ICTableColumnTextView setSelectable:](v8, "setSelectable:", 1);
    -[ICTableColumnTextView setColumnID:](v8, "setColumnID:", v6);
    objc_msgSend(v10, "textContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "replaceLayoutManager:", v10);

    -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v8, v6);

    -[ICTableTextViewManager delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[ICTableTextViewManager delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setupTableTextView:", v8);

    }
  }

  return v8;
}

- (void)parentViewDidChange
{
  void *v3;
  _QWORD v4[5];

  -[ICTableTextViewManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__ICTableTextViewManager_parentViewDidChange__block_invoke;
    v4[3] = &unk_1EA7DDD30;
    v4[4] = self;
    -[ICTableTextViewManager enumerateTextViewsWithBlock:](self, "enumerateTextViewsWithBlock:", v4);
  }
}

void __45__ICTableTextViewManager_parentViewDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditorController:", v5);

}

- (void)restyleCells
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[ICTableTextViewManager columnsNeedingRestyle](self, "columnsNeedingRestyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E20];
    -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableTextViewManager setColumnsNeedingRestyle:](self, "setColumnsNeedingRestyle:", v6);

  }
  -[ICTableTextViewManager columnsNeedingRestyle](self, "columnsNeedingRestyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableTextViewManager prepopulatedColumns](self, "prepopulatedColumns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        -[ICTableTextViewManager columnsNeedingRestyle](self, "columnsNeedingRestyle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __38__ICTableTextViewManager_restyleCells__block_invoke;
  v17[3] = &unk_1EA7DDD30;
  v17[4] = self;
  -[ICTableTextViewManager enumerateTextViewsWithBlock:](self, "enumerateTextViewsWithBlock:", v17);
}

uint64_t __38__ICTableTextViewManager_restyleCells__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "restyleTextView:", a2);
}

- (void)restyleTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "columnTextStorage");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldPreventUndoCommands:", 1);
  objc_msgSend(v14, "beginPreventEditingUpdates");
  -[ICTableTextViewManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "TTTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoomController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "styler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setZoomController:", v9);

  objc_msgSend(v14, "styler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "styleText:inRange:fixModelAttributes:", v14, 0, objc_msgSend(v14, "length"), 0);

  objc_msgSend(v14, "endPreventEditingUpdates");
  objc_msgSend(v14, "setShouldPreventUndoCommands:", 0);
  -[ICTableTextViewManager columnsNeedingRestyle](self, "columnsNeedingRestyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "removeObject:", v13);
}

- (void)updateAuthorHighlights
{
  -[ICTableTextViewManager enumerateTextViewsWithBlock:](self, "enumerateTextViewsWithBlock:", &__block_literal_global_28);
}

void __48__ICTableTextViewManager_updateAuthorHighlights__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a2, "columnTextStorage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v7, "styler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "authorHighlightsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "ic_range");
  objc_msgSend(v4, "performHighlightUpdatesForRange:inTextStorage:updates:", v5, v6, v7, 0);

}

- (CGRect)frameOfCellAtColumn:(id)a3 row:(id)a4
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  CGFloat v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  CGFloat MinX;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  CGFloat v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  CGFloat MinY;
  CGFloat v51;
  CGFloat v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat MaxX;
  void *v67;
  unint64_t v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  CGFloat MaxY;
  CGFloat v74;
  CGFloat v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  double v80;
  CGFloat v81;
  CGFloat rect;
  CGFloat recta;
  void *rect_8;
  CGRect v85;
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
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect result;

  v6 = a3;
  v7 = a4;
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "columnWidthManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ICTableTextViewManager anchorColumn](self, "anchorColumn");
  v17 = -[ICTableTextViewManager anchorRow](self, "anchorRow");
  -[ICTableTextViewManager boundingRect](self, "boundingRect");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  rect_8 = v27;
  rect = v19;
  if (v27
    && (-[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "containsObject:", v6),
        v28,
        v29))
  {
    objc_msgSend(v27, "frame");
    v31 = v30;
    v85.origin.x = x;
    v85.origin.y = y;
    v85.size.width = width;
    v85.size.height = height;
    v86 = CGRectOffset(v85, v31, 0.0);
    x = v86.origin.x;
    y = v86.origin.y;
    width = v86.size.width;
    height = v86.size.height;
  }
  else if (objc_msgSend(v15, "containsColumn:", v6, *(_QWORD *)&v19, v27))
  {
    v32 = objc_msgSend(v15, "columnIndexForIdentifier:", v6);
    -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count") + v16;

    if (v32 >= v34)
    {
      v99.origin.x = v19;
      v99.origin.y = v21;
      v99.size.width = v23;
      v99.size.height = v25;
      MaxX = CGRectGetMaxX(v99);
      v100.origin.x = x;
      v100.origin.y = y;
      v100.size.width = width;
      v100.size.height = height;
      v101 = CGRectOffset(v100, MaxX, 0.0);
      x = v101.origin.x;
      y = v101.origin.y;
      width = v101.size.width;
      height = v101.size.height;
      -[ICTableTextViewManager columnIdentifiers](self, "columnIdentifiers");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "count") + v16;

      while (v68 < v32)
      {
        objc_msgSend(v15, "identifierForColumnAtIndex:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "widthOfColumn:", v69);
        v71 = v70;
        -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setDimension:forKey:", v69, v71);

        v102.origin.x = x;
        v102.origin.y = y;
        v102.size.width = width;
        v102.size.height = height;
        v103 = CGRectOffset(v102, v71, 0.0);
        x = v103.origin.x;
        y = v103.origin.y;
        width = v103.size.width;
        height = v103.size.height;

        ++v68;
      }
    }
    else
    {
      if (v32 >= v16)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "columnIndex < origColumn", "-[ICTableTextViewManager frameOfCellAtColumn:row:]", 1, 0, CFSTR("Expected column to be outside current cells"));
      v87.origin.x = v19;
      v87.origin.y = v21;
      v87.size.width = v23;
      v87.size.height = v25;
      MinX = CGRectGetMinX(v87);
      v88.origin.x = x;
      v88.origin.y = y;
      v88.size.width = width;
      v88.size.height = height;
      v89 = CGRectOffset(v88, MinX, 0.0);
      x = v89.origin.x;
      y = v89.origin.y;
      width = v89.size.width;
      height = v89.size.height;
      while (v16 > v32)
      {
        objc_msgSend(v15, "identifierForColumnAtIndex:", --v16);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "widthOfColumn:", v36);
        v38 = v37;
        -[ICTableTextViewManager cachedColumnWidths](self, "cachedColumnWidths");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setDimension:forKey:", v36, v38);

        v90.origin.x = x;
        v90.origin.y = y;
        v90.size.width = width;
        v90.size.height = height;
        v91 = CGRectOffset(v90, -v38, 0.0);
        x = v91.origin.x;
        y = v91.origin.y;
        width = v91.size.width;
        height = v91.size.height;

      }
    }
  }
  -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers", *(_QWORD *)&rect);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "containsObject:", v7);

  if (v41)
  {
    -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "rowPositions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKey:", v7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v46 = v45;

    v92.origin.x = x;
    v92.origin.y = y;
    v92.size.width = width;
    v92.size.height = height;
    v93 = CGRectOffset(v92, 0.0, v46);
    x = v93.origin.x;
    y = v93.origin.y;
  }
  else if (objc_msgSend(v15, "containsRow:", v7))
  {
    v47 = objc_msgSend(v15, "rowIndexForIdentifier:", v7);
    -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count") + v17;

    if (v47 >= v49)
    {
      v104.origin.x = recta;
      v104.origin.y = v21;
      v104.size.width = v23;
      v104.size.height = v25;
      MaxY = CGRectGetMaxY(v104);
      v105.origin.x = x;
      v105.origin.y = y;
      v105.size.width = width;
      v105.size.height = height;
      v106 = CGRectOffset(v105, 0.0, MaxY);
      x = v106.origin.x;
      y = v106.origin.y;
      v74 = v106.size.width;
      v75 = v106.size.height;
      -[ICTableTextViewManager rowIdentifiers](self, "rowIdentifiers");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "count") + v17;

      while (v77 < v47)
      {
        objc_msgSend(v15, "identifierForRowAtIndex:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "dimensionForKey:", v78);
        v81 = v80;

        v107.origin.x = x;
        v107.origin.y = y;
        v107.size.width = v74;
        v107.size.height = v75;
        v108 = CGRectOffset(v107, 0.0, v81);
        x = v108.origin.x;
        y = v108.origin.y;
        v74 = v108.size.width;
        v75 = v108.size.height;

        ++v77;
      }
    }
    else
    {
      if (v47 >= v17)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "rowIndex < origRow", "-[ICTableTextViewManager frameOfCellAtColumn:row:]", 1, 0, CFSTR("Expected row to be outside current cells"));
      v94.origin.x = recta;
      v94.origin.y = v21;
      v94.size.width = v23;
      v94.size.height = v25;
      MinY = CGRectGetMinY(v94);
      v95.origin.x = x;
      v95.origin.y = y;
      v95.size.width = width;
      v95.size.height = height;
      v96 = CGRectOffset(v95, 0.0, MinY);
      x = v96.origin.x;
      y = v96.origin.y;
      if (v47 < v17)
      {
        v51 = v96.size.width;
        v52 = v96.size.height;
        do
        {
          objc_msgSend(v15, "identifierForRowAtIndex:", --v17);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "dimensionForKey:", v53);
          v56 = v55;

          v97.origin.x = x;
          v97.origin.y = y;
          v97.size.width = v51;
          v97.size.height = v52;
          v98 = CGRectOffset(v97, 0.0, -v56);
          x = v98.origin.x;
          y = v98.origin.y;
          v51 = v98.size.width;
          v52 = v98.size.height;

        }
        while (v17 > v47);
      }
    }
  }
  objc_msgSend(v13, "widthOfColumn:", v6);
  v58 = v57;
  -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "dimensionForKey:", v7);
  v61 = v60;

  v62 = x;
  v63 = y;
  v64 = v58;
  v65 = v61;
  result.size.height = v65;
  result.size.width = v64;
  result.origin.y = v63;
  result.origin.x = v62;
  return result;
}

- (CGRect)frameOfColumn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
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
  CGRect result;

  v4 = a3;
  -[ICTableTextViewManager columnTextViews](self, "columnTextViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameOfRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  -[ICTableTextViewManager tableLayoutManager](self, "tableLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowPositions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  -[ICTableTextViewManager cachedRowHeights](self, "cachedRowHeights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dimensionForKey:", v4);
  v12 = v11;

  -[ICTableTextViewManager contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;

  v16 = 0.0;
  v17 = v9;
  v18 = v15;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (ICTableTextViewManagerDelegate)delegate
{
  return (ICTableTextViewManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)columnIdentifiers
{
  return self->_columnIdentifiers;
}

- (NSMutableArray)rowIdentifiers
{
  return self->_rowIdentifiers;
}

- (NSMutableSet)prepopulatedColumns
{
  return self->_prepopulatedColumns;
}

- (NSMutableDictionary)columnTextViews
{
  return self->_columnTextViews;
}

- (ICTableLayoutManager)tableLayoutManager
{
  return self->_tableLayoutManager;
}

- (ICTableContentView)contentView
{
  return (ICTableContentView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (ICDimensionSumCache)cachedColumnWidths
{
  return self->_cachedColumnWidths;
}

- (ICDimensionSumCache)cachedRowHeights
{
  return self->_cachedRowHeights;
}

- (NSMutableDictionary)cachedCellHeights
{
  return self->_cachedCellHeights;
}

- (NSArray)previousRowIdentifiers
{
  return self->_previousRowIdentifiers;
}

- (void)setPreviousRowIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_previousRowIdentifiers, a3);
}

- (NSMutableSet)columnsNeedingRestyle
{
  return self->_columnsNeedingRestyle;
}

- (void)setColumnsNeedingRestyle:(id)a3
{
  objc_storeStrong((id *)&self->_columnsNeedingRestyle, a3);
}

- (BOOL)isUpdatingTiles
{
  return self->_updatingTiles;
}

- (void)setUpdatingTiles:(BOOL)a3
{
  self->_updatingTiles = a3;
}

- (unint64_t)anchorColumn
{
  return self->_anchorColumn;
}

- (void)setAnchorColumn:(unint64_t)a3
{
  self->_anchorColumn = a3;
}

- (unint64_t)anchorRow
{
  return self->_anchorRow;
}

- (void)setAnchorRow:(unint64_t)a3
{
  self->_anchorRow = a3;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (NSSet)draggedColumns
{
  return self->_draggedColumns;
}

- (void)setDraggedColumns:(id)a3
{
  objc_storeStrong((id *)&self->_draggedColumns, a3);
}

- (NSSet)draggedRows
{
  return self->_draggedRows;
}

- (void)setDraggedRows:(id)a3
{
  objc_storeStrong((id *)&self->_draggedRows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedRows, 0);
  objc_storeStrong((id *)&self->_draggedColumns, 0);
  objc_storeStrong((id *)&self->_columnsNeedingRestyle, 0);
  objc_storeStrong((id *)&self->_previousRowIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedCellHeights, 0);
  objc_storeStrong((id *)&self->_cachedRowHeights, 0);
  objc_storeStrong((id *)&self->_cachedColumnWidths, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_tableLayoutManager, 0);
  objc_storeStrong((id *)&self->_columnTextViews, 0);
  objc_storeStrong((id *)&self->_prepopulatedColumns, 0);
  objc_storeStrong((id *)&self->_rowIdentifiers, 0);
  objc_storeStrong((id *)&self->_columnIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
