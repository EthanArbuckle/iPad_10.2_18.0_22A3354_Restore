@implementation ICTableColumnLayoutManager

- (ICTableColumnLayoutManager)initWithTableLayoutManager:(id)a3 columnID:(id)a4
{
  id v6;
  id v7;
  ICTableColumnLayoutManager *v8;
  ICTableColumnLayoutManager *v9;
  double v10;
  double v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  ICTableColumnTextStorage *columnTextStorage;
  ICTableColumnTextContainer *v22;
  NSTextContainer *textContainer;
  void *v24;
  uint64_t v25;
  NSMutableSet *currentlyHiddenSubviews;
  void *v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)ICTableColumnLayoutManager;
  v8 = -[ICLayoutManager init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_tableLayoutManager, v6);
    objc_storeStrong((id *)&v9->_columnID, a4);
    objc_msgSend(v6, "columnWidthManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "widthOfColumn:", v7);
    v11 = v10;
    WeakRetained = objc_loadWeakRetained((id *)&v9->_tableLayoutManager);
    objc_msgSend(WeakRetained, "table");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(v6, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_loadWeakRetained((id *)&v9->_tableLayoutManager);
    objc_msgSend(v16, "table");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v15);

    if (!v14)
    v18 = objc_loadWeakRetained((id *)&v9->_tableLayoutManager);
    objc_msgSend(v18, "table");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textStorageForColumn:", v7);
    v20 = objc_claimAutoreleasedReturnValue();
    columnTextStorage = v9->_columnTextStorage;
    v9->_columnTextStorage = (ICTableColumnTextStorage *)v20;

    -[ICTableColumnLayoutManager setTextStorage:](v9, "setTextStorage:", v9->_columnTextStorage);
    -[ICTableColumnLayoutManager setAllowsNonContiguousLayout:](v9, "setAllowsNonContiguousLayout:", 1);
    v22 = -[ICTableColumnTextContainer initWithSize:]([ICTableColumnTextContainer alloc], "initWithSize:", v11, 1.79769313e308);
    textContainer = v9->_textContainer;
    v9->_textContainer = &v22->super.super;

    -[NSTextContainer setLineFragmentPadding:](v9->_textContainer, "setLineFragmentPadding:", *MEMORY[0x1E0D64A30]);
    -[NSTextContainer setWidthTracksTextView:](v9->_textContainer, "setWidthTracksTextView:", 0);
    -[NSTextContainer setHeightTracksTextView:](v9->_textContainer, "setHeightTracksTextView:", 0);
    -[ICTableColumnLayoutManager addTextContainer:](v9, "addTextContainer:", v9->_textContainer);
    -[NSTextContainer setLayoutManager:](v9->_textContainer, "setLayoutManager:", v9);
    -[ICTableColumnLayoutManager textStorage](v9, "textStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addLayoutManager:", v9);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = objc_claimAutoreleasedReturnValue();
    currentlyHiddenSubviews = v9->_currentlyHiddenSubviews;
    v9->_currentlyHiddenSubviews = (NSMutableSet *)v25;

  }
  return v9;
}

- (void)setHiddenRows:(id)a3
{
  id v5;
  NSArray **p_hiddenRows;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  double v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;
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

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_hiddenRows = &self->_hiddenRows;
  if ((-[NSArray isEqual:](self->_hiddenRows, "isEqual:", v5) & 1) == 0)
  {
    v60 = v5;
    if (-[NSArray count](*p_hiddenRows, "count"))
    {
      -[ICTableColumnLayoutManager glyphRangesForRows:](self, "glyphRangesForRows:", *p_hiddenRows);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v78 != v10)
              objc_enumerationMutation(v7);
            v12 = objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "rangeValue");
            if (v13)
              -[ICTableColumnLayoutManager invalidateDisplayForGlyphRange:](self, "invalidateDisplayForGlyphRange:", v12, v13);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        }
        while (v9);
      }
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      -[ICTableColumnLayoutManager currentlyHiddenSubviews](self, "currentlyHiddenSubviews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v74 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v19, "setHidden:", 0);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
        }
        while (v16);
      }

      -[ICTableColumnLayoutManager currentlyHiddenSubviews](self, "currentlyHiddenSubviews");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeAllObjects");

      v5 = v60;
    }
    objc_storeStrong((id *)&self->_hiddenRows, a3);
    if (objc_msgSend(v5, "count"))
    {
      -[ICBaseLayoutManager textView](self, "textView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "containerViewForAttachments");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v26 = v5;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v70;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v70 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k);
            -[ICTableColumnLayoutManager heightOfCellAtRowID:](self, "heightOfCellAtRowID:", v31);
            v33 = v32;
            -[ICTableColumnLayoutManager tableLayoutManager](self, "tableLayoutManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "rowPositions");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", v31);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "doubleValue");
            v38 = v37;
            -[ICTableColumnLayoutManager width](self, "width");
            v40 = v39;

            v87.origin.x = x;
            v87.origin.y = y;
            v87.size.width = width;
            v87.size.height = height;
            if (CGRectIsEmpty(v87))
            {
              height = v33;
              width = v40;
              y = v38;
              x = 0.0;
            }
            else
            {
              v88.origin.x = 0.0;
              v88.origin.y = v38;
              v88.size.width = v40;
              v88.size.height = v33;
              v95.origin.x = x;
              v95.origin.y = y;
              v95.size.width = width;
              v95.size.height = height;
              v89 = CGRectUnion(v88, v95);
              x = v89.origin.x;
              y = v89.origin.y;
              width = v89.size.width;
              height = v89.size.height;
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
        }
        while (v28);
      }

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      objc_msgSend(v21, "subviews");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v66;
        do
        {
          for (m = 0; m != v43; ++m)
          {
            if (*(_QWORD *)v66 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * m);
            objc_msgSend(v46, "frame");
            v96.origin.x = x;
            v96.origin.y = y;
            v96.size.width = width;
            v96.size.height = height;
            if (CGRectIntersectsRect(v90, v96))
            {
              objc_msgSend(v21, "bounds");
              v92 = CGRectIntegral(v91);
              v47 = v92.origin.x;
              v48 = v92.origin.y;
              v49 = v92.size.width;
              v50 = v92.size.height;
              objc_msgSend(v46, "frame");
              v97 = CGRectIntegral(v93);
              v94.origin.x = v47;
              v94.origin.y = v48;
              v94.size.width = v49;
              v94.size.height = v50;
              if (!CGRectEqualToRect(v94, v97))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_msgSend(v46, "setHidden:", 1);
                  -[ICTableColumnLayoutManager currentlyHiddenSubviews](self, "currentlyHiddenSubviews");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "addObject:", v46);

                }
              }
            }
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
        }
        while (v43);
      }

      -[ICTableColumnLayoutManager glyphRangesForRows:](self, "glyphRangesForRows:", *p_hiddenRows);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v62;
        do
        {
          for (n = 0; n != v54; ++n)
          {
            if (*(_QWORD *)v62 != v55)
              objc_enumerationMutation(v52);
            v57 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * n), "rangeValue");
            if (v58)
              -[ICTableColumnLayoutManager invalidateDisplayForGlyphRange:](self, "invalidateDisplayForGlyphRange:", v57, v58);
          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
        }
        while (v54);
      }

      v5 = v60;
    }
  }

}

- (double)width
{
  void *v2;
  double v3;
  double v4;

  -[ICTableColumnLayoutManager textContainer](self, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;

  return v4;
}

- (void)removeRow:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableColumnLayoutManager columnTextStorage](self, "columnTextStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeRow:", v4);

}

- (void)ensureCellExistsAtRowID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableColumnLayoutManager columnTextStorage](self, "columnTextStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characterRangeForRowID:", v4);

}

- (_NSRange)glyphRangeForRowID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  -[ICTableColumnLayoutManager columnTextStorage](self, "columnTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "characterRangeForRowID:", v4);
  v8 = v7;

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0;
  }
  else
  {
    v9 = -[ICTableColumnLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v6, v8, 0);
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (double)heightOfCellAtRowID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  unint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double height;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = -[ICTableColumnLayoutManager glyphRangeForRowID:](self, "glyphRangeForRowID:", a3);
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    -[ICTableColumnLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", v4, v5);
    -[ICTableColumnLayoutManager textContainer](self, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager boundingRectForGlyphRange:inTextContainer:](self, "boundingRectForGlyphRange:inTextContainer:", v6, v7, v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = v6 + v7;
    if (v17 >= -[ICTableColumnLayoutManager numberOfGlyphs](self, "numberOfGlyphs"))
    {
      -[ICTableColumnLayoutManager textStorage](self, "textStorage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], v17 - 1, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "lineSpacing");
      height = v16 + v28;

    }
    else
    {
      -[ICLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v17, 0);
      v32.origin.x = v18;
      v32.origin.y = v19;
      v32.size.width = v20;
      v32.size.height = v21;
      v30.origin.x = v10;
      v30.origin.y = v12;
      v30.size.width = v14;
      v30.size.height = v16;
      v31 = CGRectUnion(v30, v32);
      height = v31.size.height;
    }
    v25 = height + *MEMORY[0x1E0D64A38] + *MEMORY[0x1E0D64A20];
  }
  else
  {
    -[ICTableColumnLayoutManager tableLayoutManager](self, "tableLayoutManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "emptyCellHeight");
    v25 = v24;

  }
  return round(v25);
}

- (id)glyphRangesForRows:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = -[ICTableColumnLayoutManager glyphRangeForRowID:](self, "glyphRangeForRowID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  BOOL v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  objc_super v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;
  NSRange v45;
  NSRange v46;

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  v44 = *MEMORY[0x1E0C80C00];
  -[ICTableColumnLayoutManager hiddenRows](self, "hiddenRows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[ICTableColumnLayoutManager hiddenRows](self, "hiddenRows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnLayoutManager glyphRangesForRows:](self, "glyphRangesForRows:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v14);
          v45.location = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "rangeValue");
          v19 = v45.location;
          v20 = v45.length;
          v46.location = location;
          v46.length = length;
          if (NSIntersectionRange(v45, v46).length)
          {
            if (v19 > location)
            {
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, v19 - location);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObject:", v21);

            }
            v22 = location + length > v19 + v20;
            if (location + length >= v19 + v20)
              length = location + length - (v19 + v20);
            else
              length = 0;
            if (v22)
              location = v19 + v20;
            else
              location = 0;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v16);
    }

    if (length)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v23);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = v31;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v24);
          v29 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "rangeValue");
          v33.receiver = self;
          v33.super_class = (Class)ICTableColumnLayoutManager;
          -[ICLayoutManager drawGlyphsForGlyphRange:atPoint:](&v33, sel_drawGlyphsForGlyphRange_atPoint_, v29, v30, x, y);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v26);
    }

  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)ICTableColumnLayoutManager;
    -[ICLayoutManager drawGlyphsForGlyphRange:atPoint:](&v32, sel_drawGlyphsForGlyphRange_atPoint_, location, length, x, y);
  }
}

uint64_t __62__ICTableColumnLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

- (_NSRange)glyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger length;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t i;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  NSUInteger v28;
  NSRange v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  NSUInteger v42;
  NSRange v43;
  NSUInteger v44;
  NSUInteger v45;
  unint64_t v46;
  uint64_t v47;
  objc_super v48;
  NSRange v49;
  NSRange v50;
  _NSRange result;
  NSRange v52;
  NSRange v53;
  CGRect v54;
  CGRect v55;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v48.receiver = self;
  v48.super_class = (Class)ICTableColumnLayoutManager;
  location = (NSUInteger)-[ICTableColumnLayoutManager glyphRangeForBoundingRect:inTextContainer:](&v48, sel_glyphRangeForBoundingRect_inTextContainer_, a4);
  length = v10;
  -[ICTableColumnLayoutManager hiddenRows](self, "hiddenRows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v46 = -[ICTableColumnLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    v47 = v14;
    for (i = v46 + v14; ; i = v46 + v47)
    {
      v16 = i + 1;
      -[ICTableColumnLayoutManager textStorage](self, "textStorage", v46);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v16 >= v18)
        break;
      -[ICTableColumnLayoutManager columnTextStorage](self, "columnTextStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rowAtIndex:rowRange:", v46 + v47 + 1, &v46);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableColumnLayoutManager hiddenRows](self, "hiddenRows");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", v20);

      if ((v22 & 1) == 0)
      {
        -[ICTableColumnLayoutManager tableLayoutManager](self, "tableLayoutManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "rowPositions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;

        v54.origin.x = x;
        v54.origin.y = y;
        v54.size.width = width;
        v54.size.height = height;
        if (v27 > CGRectGetMaxY(v54))
        {

          break;
        }
        v52.location = -[ICTableColumnLayoutManager glyphRangeForRowID:](self, "glyphRangeForRowID:", v20);
        v52.length = v28;
        v49.location = location;
        v49.length = length;
        v29 = NSUnionRange(v49, v52);
        location = v29.location;
        length = v29.length;
      }

    }
    v46 = -[ICTableColumnLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    v47 = v30;
    while (v46 >= 2)
    {
      -[ICTableColumnLayoutManager columnTextStorage](self, "columnTextStorage", v46, v47);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "rowAtIndex:rowRange:", v46 - 1, &v46);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableColumnLayoutManager hiddenRows](self, "hiddenRows");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "containsObject:", v32);

      if ((v34 & 1) == 0)
      {
        -[ICTableColumnLayoutManager tableLayoutManager](self, "tableLayoutManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "rowPositions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        v39 = v38;
        -[ICTableColumnLayoutManager heightOfCellAtRowID:](self, "heightOfCellAtRowID:", v32);
        v41 = v39 + v40;

        v55.origin.x = x;
        v55.origin.y = y;
        v55.size.width = width;
        v55.size.height = height;
        if (v41 < CGRectGetMinY(v55))
        {

          break;
        }
        v53.location = -[ICTableColumnLayoutManager glyphRangeForRowID:](self, "glyphRangeForRowID:", v32);
        v53.length = v42;
        v50.location = location;
        v50.length = length;
        v43 = NSUnionRange(v50, v53);
        location = v43.location;
        length = v43.length;
      }

    }
  }
  v44 = location;
  v45 = length;
  result.length = v45;
  result.location = v44;
  return result;
}

- (id)rectsForGlyphRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", location, length);
  -[ICTableColumnLayoutManager textContainer](self, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__ICTableColumnLayoutManager_rectsForGlyphRange___block_invoke;
  v12[3] = &unk_1EA7DF118;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  -[ICTableColumnLayoutManager enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:](self, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", location, length, 0x7FFFFFFFFFFFFFFFLL, 0, v7, v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __49__ICTableColumnLayoutManager_rectsForGlyphRange___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  void *v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  void *v20;
  id v21;
  CGRect v22;
  CGRect v23;

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textContainerInset");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textContainerInset");
  v15 = v14;
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  v23 = CGRectOffset(v22, v12, v15);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;

  v20 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v21);

}

- (void)filterAttachmentsInTextStorage:(id)a3 range:(_NSRange)a4 targetAttachment:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  v9 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICCheckedDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v13, "parentAttachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filterInlineAttachmentsInTableColumnTextStorage:range:", v10, location, length);

  }
}

- (ICTableLayoutManager)tableLayoutManager
{
  return (ICTableLayoutManager *)objc_loadWeakRetained((id *)&self->_tableLayoutManager);
}

- (NSUUID)columnID
{
  return (NSUUID *)objc_getProperty(self, a2, 480, 1);
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (NSArray)hiddenRows
{
  return self->_hiddenRows;
}

- (NSMutableSet)currentlyHiddenSubviews
{
  return self->_currentlyHiddenSubviews;
}

- (ICTableColumnTextStorage)columnTextStorage
{
  return self->_columnTextStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnTextStorage, 0);
  objc_storeStrong((id *)&self->_currentlyHiddenSubviews, 0);
  objc_storeStrong((id *)&self->_hiddenRows, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_columnID, 0);
  objc_destroyWeak((id *)&self->_tableLayoutManager);
}

@end
