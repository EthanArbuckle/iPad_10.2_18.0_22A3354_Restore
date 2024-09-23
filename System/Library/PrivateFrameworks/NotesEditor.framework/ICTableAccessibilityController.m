@implementation ICTableAccessibilityController

- (ICTableAccessibilityController)initWithTableAttachmentViewController:(id)a3
{
  id v4;
  ICTableAccessibilityController *v5;
  ICTableAccessibilityController *v6;
  ICTableAccessibilityElementProvider *v7;
  ICTableAccessibilityElementProvider *elementProvider;
  void *v9;
  void *v10;
  void *v11;
  ICiOSTableAccessibilityElement *v12;
  ICiOSTableAccessibilityElement *tableElement;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICTableAccessibilityController;
  v5 = -[ICTableAccessibilityController init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tableAttachmentViewController, v4);
    v7 = -[ICTableAccessibilityElementProvider initWithTableAccessibilityController:]([ICTableAccessibilityElementProvider alloc], "initWithTableAccessibilityController:", v6);
    elementProvider = v6->_elementProvider;
    v6->_elementProvider = v7;

    objc_opt_class();
    -[ICTableAccessibilityController tableAttachmentViewController](v6, "tableAttachmentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[ICiOSTableAccessibilityElement initWithTableAccessibilityController:parentAttachmentView:]([ICiOSTableAccessibilityElement alloc], "initWithTableAccessibilityController:parentAttachmentView:", v6, v11);
      tableElement = v6->_tableElement;
      v6->_tableElement = v12;

    }
  }

  return v6;
}

- (void)beginEditingCellWithColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginEditingCellWithColumnID:andRowID:location:", v7, v6, 2);

}

- (unint64_t)rowCount
{
  void *v2;
  unint64_t v3;

  -[ICTableAccessibilityController table](self, "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rowCount");

  return v3;
}

- (unint64_t)columnCount
{
  void *v2;
  unint64_t v3;

  -[ICTableAccessibilityController table](self, "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "columnCount");

  return v3;
}

- (UIView)dragProviderView
{
  void *v2;
  void *v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (ICTableAttachmentView)hostingTableAttachmentView
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTableAttachmentView *)v5;
}

- (UIScrollView)tableScrollView
{
  void *v2;
  void *v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (UIScrollView)noteScrollView
{
  void *v2;
  void *v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (BOOL)isTableRightToLeft
{
  void *v2;
  char v3;

  -[ICTableAccessibilityController table](self, "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRightToLeft");

  return v3;
}

- (_NSRange)attachmentRangeInNote
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeInNote");
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (ICTableSelectionKnob)startSelectionKnob
{
  void *v2;
  void *v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTableSelectionKnob *)v3;
}

- (ICTableSelectionKnob)endSelectionKnob
{
  void *v2;
  void *v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTableSelectionKnob *)v3;
}

- (id)cellElementForColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICTableAccessibilityController columnIDForColumnIndex:](self, "columnIDForColumnIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAccessibilityController rowIDForRowIndex:](self, "rowIDForRowIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAccessibilityController elementProvider](self, "elementProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellElementForColumnID:rowID:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)cellElementsForColumnID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICTableAccessibilityController elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellElementsForColumnID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cellElementsForRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICTableAccessibilityController elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellElementsForRowID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)textViewForColumnID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textViewManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textViewForColumn:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)rowIndexForRowID:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[ICTableAccessibilityController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rowIndexForIdentifier:", v4);

  return v6;
}

- (unint64_t)columnIndexForColumnID:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[ICTableAccessibilityController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "columnIndexForIdentifier:", v4);

  return v6;
}

- (id)columnIDForColumnIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[ICTableAccessibilityController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifierForColumnAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rowIDForRowIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[ICTableAccessibilityController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifierForRowAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)attributedContentStringForColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[ICTableAccessibilityController table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForColumnID:rowID:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGRect)boundingRectForCellWithColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textViewManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameOfCellAtColumn:row:", v7, v6);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)frameInScreenSpaceForCellWithColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
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
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (-[ICTableAccessibilityController columnIndexForColumnID:](self, "columnIndexForColumnID:", v6) != 0x7FFFFFFFFFFFFFFFLL
    && -[ICTableAccessibilityController rowIndexForRowID:](self, "rowIndexForRowID:", v7) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICTableAccessibilityController boundingRectForCellWithColumnID:rowID:](self, "boundingRectForCellWithColumnID:rowID:", v6, v7);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:toView:", 0, v13, v15, v17, v19);
    v8 = v22;
    v9 = v23;
    v10 = v24;
    v11 = v25;

  }
  v26 = v8;
  v27 = v9;
  v28 = v10;
  v29 = v11;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (id)titleForColumnID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ICTableAccessibilityController rowIDForRowIndex:](self, "rowIDForRowIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICTableAccessibilityController isHeaderCellAtColumnID:rowID:](self, "isHeaderCellAtColumnID:rowID:", v4, v5))
  {
    -[ICTableAccessibilityController attributedContentStringForColumnID:rowID:](self, "attributedContentStringForColumnID:rowID:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "string");
  }
  else
  {
    v7 = -[ICTableAccessibilityController columnIndexForColumnID:](self, "columnIndexForColumnID:", v4);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("column %lu"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, v7 + 1);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)titleForRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ICTableAccessibilityController columnIDForColumnIndex:](self, "columnIDForColumnIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICTableAccessibilityController isHeaderCellAtColumnID:rowID:](self, "isHeaderCellAtColumnID:rowID:", v5, v4))
  {
    -[ICTableAccessibilityController attributedContentStringForColumnID:rowID:](self, "attributedContentStringForColumnID:rowID:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "string");
  }
  else
  {
    v7 = -[ICTableAccessibilityController rowIndexForRowID:](self, "rowIndexForRowID:", v4);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("row %lu"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, v7 + 1);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEditable
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditable");

  return v5;
}

- (BOOL)cellIsEditingAtColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "type");
  objc_msgSend(v9, "columns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "rows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == 1 && objc_msgSend(v6, "isEqual:", v12))
    v15 = objc_msgSend(v7, "isEqual:", v14);
  else
    v15 = 0;

  return v15;
}

- (BOOL)isHeaderCellAtColumnID:(id)a3 rowID:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  -[ICTableAccessibilityController attributedContentStringForColumnID:rowID:](self, "attributedContentStringForColumnID:rowID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (objc_msgSend(v4, "length", 0))
  {
    objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], 0, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5
      && (!objc_msgSend(v5, "style")
       || objc_msgSend(v6, "style") == 1
       || objc_msgSend(v6, "style") == 2))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63918], 0, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && (v10 = v13, v10 == objc_msgSend(v4, "length")))
        v7 = objc_msgSend(v9, "integerValue") & 1;
      else
        v7 = 0;

    }
    v8 = v7 != 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)scrollColumnIDToVisible:(id)a3 rowID:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;

  -[ICTableAccessibilityController frameInScreenSpaceForCellWithColumnID:rowID:](self, "frameInScreenSpaceForCellWithColumnID:rowID:", a3, a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tableContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromView:", 0, v6, v8, v10, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[ICTableAccessibilityController noteScrollView](self, "noteScrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertRect:fromView:", 0, v6, v8, v10, v12);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "scrollRectToVisible:animated:", 1, v16, v18, v20, v22);

  -[ICTableAccessibilityController noteScrollView](self, "noteScrollView");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "scrollRectToVisible:animated:", 1, v25, v27, v29, v31);

}

- (void)moveCurrentColumnOrRow:(BOOL)a3 toIndex:(unint64_t)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moveCurrentColumnOrRow:toIndex:", v5, a4);

}

- (id)selectedCells
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "type") == 1 || objc_msgSend(v4, "type") == 4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "columns");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v18)
    {
      v16 = *(_QWORD *)v24;
      v17 = v4;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v6);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v4, "rows");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v20;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v20 != v11)
                  objc_enumerationMutation(v8);
                -[ICTableAccessibilityController cellElementForColumnIndex:rowIndex:](self, "cellElementForColumnIndex:rowIndex:", -[ICTableAccessibilityController columnIndexForColumnID:](self, "columnIndexForColumnID:", v7), -[ICTableAccessibilityController rowIndexForRowID:](self, "rowIndexForRowID:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12)));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "ic_addNonNilObject:", v13);

                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v10);
          }

          ++v6;
          v4 = v17;
        }
        while (v6 != v18);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v18);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)selectedColumnIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)selectedRowIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)selectCurrentColumn
{
  id v2;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectCurrentColumnForAccessibility");

}

- (void)selectCurrentRow
{
  id v2;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectCurrentRowForAccessibility");

}

- (void)selectColumnWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "selectColumns:", v7);
  }
}

- (void)selectRowWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "selectRows:", v7);
  }
}

- (void)selectCellForColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tableSelection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectCellAtColumn:row:", v7, v6);

    }
  }
}

- (void)selectCellRangeForCurrentCell
{
  id v2;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectCell");

}

- (BOOL)isTableTextRangeSelected
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v11;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedRange");
  v7 = v6;
  -[ICTableAccessibilityController hostingTableAttachmentView](self, "hostingTableAttachmentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5 == objc_msgSend(v8, "textRangeInNote") && v7 == v9;

  return v11;
}

- (void)selectTableTextRange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteTextView");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAccessibilityController hostingTableAttachmentView](self, "hostingTableAttachmentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "textRangeInNote");
  v9 = v8;

  _UIAccessibilityBlockPostingOfAllNotifications();
  objc_msgSend(v16, "select:", v16);
  objc_msgSend(v16, "setSelectedRange:", v7, v9);
  objc_msgSend(v16, "scrollRangeToVisible:", v7, v9);
  _UIAccessibilityUnblockPostingOfAllNotifications();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Selected %@. Use the actions rotor to start dragging."), &stru_1EA7E9860, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3940];
    -[ICTableAccessibilityController hostingTableAttachmentView](self, "hostingTableAttachmentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], v15);
  }

}

- (void)speakCellRangeSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  if (objc_msgSend(v30, "type") == 4)
  {
    -[ICTableAccessibilityController table](self, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "columns");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "columnIndexForIdentifier:", v6);

    -[ICTableAccessibilityController table](self, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "rowIndexForIdentifier:", v10);

    -[ICTableAccessibilityController table](self, "table");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "columns");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "columnIndexForIdentifier:", v14);

    -[ICTableAccessibilityController table](self, "table");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rows");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "rowIndexForIdentifier:", v18);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v7 == v15 && v11 == v19)
    {
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Selected column %lu, row %lu"), &stru_1EA7E9860, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = v7 + 1;
      v25 = v11 + 1;
    }
    else
    {
      if (v7 == v15)
      {
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Selected column %lu, rows %lu to %lu"), &stru_1EA7E9860, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v22, v7 + 1, v11 + 1, v19 + 1, v29);
LABEL_12:
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
        UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], v27);

        goto LABEL_13;
      }
      v26 = v15 + 1;
      if (v11 == v19)
      {
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Selected row %lu, columns %lu to %lu"), &stru_1EA7E9860, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = v11 + 1;
        v25 = v7 + 1;
      }
      else
      {
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Selected column %lu, row %lu, to column %lu, row %lu"), &stru_1EA7E9860, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = v7 + 1;
        v25 = v11 + 1;
        v29 = v19 + 1;
      }
      v28 = v26;
    }
    objc_msgSend(v23, "localizedStringWithFormat:", v22, v24, v25, v28, v29);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)tableRowOrColumnSelectionDidChange
{
  void *v2;
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icaxClearCachedChildrenForReparenting");

}

- (void)addColumnBefore
{
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addColumnBeforeSelection:", self);

}

- (void)addColumnAfter
{
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addColumnAfterSelection:", self);

}

- (void)deleteSelectedColumns
{
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteSelectedColumns:", self);

}

- (void)addRowAbove
{
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addRowAboveSelection:", self);

}

- (void)addRowBelow
{
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addRowBelowSelection:", self);

}

- (void)deleteSelectedRows
{
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteSelectedRows:", self);

}

- (void)reverseTableDirection
{
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseTableColumnDirection:", self);

}

- (void)convertTableToText
{
  id v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertTableToText:", self);

}

- (void)invalidateAXElementsForColumnID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableAccessibilityController elementProvider](self, "elementProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeElementsForColumnID:", v4);

}

- (void)invalidateAXElementsForRowID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableAccessibilityController elementProvider](self, "elementProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeElementsForRowID:", v4);

}

- (id)table
{
  void *v2;
  void *v3;

  -[ICTableAccessibilityController tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICTableAccessibilityElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (ICiOSTableAccessibilityElement)tableElement
{
  return self->_tableElement;
}

- (void)setTableElement:(id)a3
{
  objc_storeStrong((id *)&self->_tableElement, a3);
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  return (ICTableAttachmentViewController *)objc_loadWeakRetained((id *)&self->_tableAttachmentViewController);
}

- (void)setTableAttachmentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_tableAttachmentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableAttachmentViewController);
  objc_storeStrong((id *)&self->_tableElement, 0);
  objc_storeStrong((id *)&self->_elementProvider, 0);
}

@end
