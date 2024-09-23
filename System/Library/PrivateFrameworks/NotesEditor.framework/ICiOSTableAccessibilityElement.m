@implementation ICiOSTableAccessibilityElement

- (int64_t)accessibilityContainerType
{
  return 1;
}

- (ICiOSTableAccessibilityElement)initWithTableAccessibilityController:(id)a3 parentAttachmentView:(id)a4
{
  id v6;
  id v7;
  ICiOSTableAccessibilityElement *v8;
  ICiOSTableAccessibilityElement *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICiOSTableAccessibilityElement;
  v8 = -[ICiOSTableAccessibilityElement initWithAccessibilityContainer:](&v11, sel_initWithAccessibilityContainer_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_tableAXController, v6);
    objc_storeWeak((id *)&v9->_parentAttachmentView, v7);
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[ICiOSTableAccessibilityElement parentAttachmentView](self, "parentAttachmentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v51;
  void *v52;
  _BOOL4 v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedColumnIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedRowIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    v8 = objc_msgSend(v5, "count") == 0;
  else
    v8 = 0;
  if (objc_msgSend(v7, "count"))
    v53 = 0;
  else
    v53 = objc_msgSend(v5, "count") != 0;
  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v9, "columnIndexForColumnID:", v10);

  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v11, "rowIndexForRowID:", v12);

  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v5;
  objc_msgSend(v5, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v13, "columnIndexForColumnID:", v14);

  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v7;
  objc_msgSend(v7, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v15, "rowIndexForRowID:", v16);

  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "rowCount");

  if (v18)
  {
    v19 = 0;
    v54 = v8;
    do
    {
      if (v19 == v56 && v8)
      {
        -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "startSelectionKnob");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "ic_addNonNilObject:", v22);

      }
      -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "columnCount");

      if (v24)
      {
        v25 = 0;
        v26 = v19 == v56 || v53;
        v27 = v19 == v55 || v53;
        do
        {
          if (v58 == v25)
            v28 = v26;
          else
            v28 = 0;
          if (v28 == 1)
          {
            -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "startSelectionKnob");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v3, "containsObject:", v30);

            if ((v31 & 1) == 0)
            {
              -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "startSelectionKnob");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "ic_addNonNilObject:", v33);

            }
          }
          -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "cellElementForColumnIndex:rowIndex:", v25, v19);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "addObject:", v35);
          if (v57 == v25)
            v36 = v27;
          else
            v36 = 0;
          if (v36 == 1)
          {
            -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "endSelectionKnob");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v3, "containsObject:", v38);

            if ((v39 & 1) == 0)
            {
              -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "endSelectionKnob");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "ic_addNonNilObject:", v41);

            }
          }

          ++v25;
          -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "columnCount");

        }
        while (v25 < v43);
      }
      v8 = v54;
      if (v19 == v55 && v54)
      {
        -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "endSelectionKnob");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "ic_addNonNilObject:", v46);

      }
      ++v19;
      -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "rowCount");

    }
    while (v19 < v48);
  }
  v49 = (void *)objc_msgSend(v3, "copy");

  return v49;
}

- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4
{
  void *v6;
  void *v7;

  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellElementForColumnIndex:rowIndex:", a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityRowCount
{
  void *v2;
  unint64_t v3;

  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rowCount");

  return v3;
}

- (unint64_t)accessibilityColumnCount
{
  void *v2;
  unint64_t v3;

  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "columnCount");

  return v3;
}

- (id)accessibilityHeaderElementsForRow:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "rowCount") <= a3)
  {

    v7 = 0;
  }
  else
  {
    -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "columnCount");

    if (v7)
    {
      -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "columnIDForColumnIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rowIDForRowIndex:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isHeaderCellAtColumnID:rowID:", v9, v11);

      v7 = 0;
      if (v13)
      {
        -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cellElementForColumnIndex:rowIndex:", 0, a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v7;
}

- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "columnCount") <= a3)
  {

    v7 = 0;
  }
  else
  {
    -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "rowCount");

    if (v7)
    {
      -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rowIDForRowIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "columnIDForColumnIndex:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isHeaderCellAtColumnID:rowID:", v11, v9);

      v7 = 0;
      if (v13)
      {
        -[ICiOSTableAccessibilityElement tableAXController](self, "tableAXController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cellElementForColumnIndex:rowIndex:", a3, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v7;
}

- (ICTableAccessibilityController)tableAXController
{
  return (ICTableAccessibilityController *)objc_loadWeakRetained((id *)&self->_tableAXController);
}

- (void)setTableAXController:(id)a3
{
  objc_storeWeak((id *)&self->_tableAXController, a3);
}

- (ICiOSTableAttachmentView)parentAttachmentView
{
  return (ICiOSTableAttachmentView *)objc_loadWeakRetained((id *)&self->_parentAttachmentView);
}

- (void)setParentAttachmentView:(id)a3
{
  objc_storeWeak((id *)&self->_parentAttachmentView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentAttachmentView);
  objc_destroyWeak((id *)&self->_tableAXController);
}

@end
