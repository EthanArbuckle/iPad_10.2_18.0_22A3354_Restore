@implementation ICTableCellAccessibilityElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityContainer
{
  void *v2;
  void *v3;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[ICTableCellAccessibilityElement accessibilityValue](self, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("cell");
  else
    v7 = CFSTR("empty cell");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("column %lu, row %lu"), &stru_1EA7E9860, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v10, -[ICTableCellAccessibilityElement columnIndex](self, "columnIndex") + 1, -[ICTableCellAccessibilityElement rowIndex](self, "rowIndex") + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)accessibilityValue
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[ICTableCellAccessibilityElement attributedContentString](self, "attributedContentString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAttributedString:", v4);

  v6 = *MEMORY[0x1E0DC10F8];
  v7 = objc_msgSend(v5, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__ICTableCellAccessibilityElement_iOS__accessibilityValue__block_invoke;
  v11[3] = &unk_1EA7DDC18;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v11);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

void __58__ICTableCellAccessibilityElement_iOS__accessibilityValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inlineAttachmentInContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "altText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "icaxLowPitchAttributedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", a3, a4, v12);
  }

}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  if (-[ICTableCellAccessibilityElement isEditing](self, "isEditing")
    || (-[ICTableCellAccessibilityElement tableAXController](self, "tableAXController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEditable"),
        v3,
        !v4))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Double tap to edit cell."), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("column %lu, row %lu"), &stru_1EA7E9860, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v4, -[ICTableCellAccessibilityElement columnIndex](self, "columnIndex") + 1, -[ICTableCellAccessibilityElement rowIndex](self, "rowIndex") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement attributedContentString](self, "attributedContentString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v12[0] = v5;
    -[ICTableCellAccessibilityElement attributedContentString](self, "attributedContentString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICTableCellAccessibilityElement;
  v3 = -[ICTableCellAccessibilityElement accessibilityTraits](&v8, sel_accessibilityTraits);
  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", self);

  if (v6)
  {
    v3 |= *MEMORY[0x1E0DC46B0];
    if (-[ICTableCellAccessibilityElement isEditing](self, "isEditing"))
      v3 |= *MEMORY[0x1E0DC10A0];
  }
  return v3;
}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rowIndexForRowID:", v4);

  v6 = v5;
  v7 = 1;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)accessibilityColumnRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "columnIndexForColumnID:", v4);

  v6 = v5;
  v7 = 1;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)accessibilityElementForRow:(int64_t)a3 andColumn:(int64_t)a4
{
  void *v5;
  void *v9;
  void *v10;
  unint64_t v11;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "rowCount") <= (unint64_t)a3)
    {
      v5 = 0;
      goto LABEL_11;
    }
    -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "columnCount");

    if (v11 > a4)
    {
      -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cellElementForColumnIndex:rowIndex:", a4, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      return v5;
    }
  }
  v5 = 0;
  return v5;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  if (v4)
  {
    -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableCellAccessibilityElement columnID](self, "columnID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableCellAccessibilityElement rowID](self, "rowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginEditingCellWithColumnID:rowID:", v6, v7);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Editing %@"), &stru_1EA7E9860, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3940];
    -[ICTableCellAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], v12);
  }
  return v4;
}

- (id)accessibilityCustomActions
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_COLUMN_MENU_ACTION"), CFSTR("Add Column"), CFSTR("Localizable"));
    v7 = objc_claimAutoreleasedReturnValue();

    v48 = (void *)v7;
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33F0]), "initWithName:target:selector:", v7, self, sel_addColumnAfter);
    objc_msgSend(v5, "addObject:");
    v8 = objc_alloc(MEMORY[0x1E0DC33F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Add Row"), &stru_1EA7E9860, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithName:target:selector:", v10, self, sel_addRowBelow);

    v46 = (void *)v11;
    objc_msgSend(v5, "addObject:", v11);
    -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "columnCount");

    if (v13 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Delete %lu Column"), &stru_1EA7E9860, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33F0]), "initWithName:target:selector:", v16, self, sel_deleteColumn);
      objc_msgSend(v5, "addObject:", v17);

    }
    -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "rowCount");

    if (v19 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Delete %lu Row"), &stru_1EA7E9860, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33F0]), "initWithName:target:selector:", v22, self, sel_deleteRow);
      objc_msgSend(v5, "addObject:", v23);

    }
    v24 = objc_alloc(MEMORY[0x1E0DC33F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Select Column"), &stru_1EA7E9860, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithName:target:selector:", v26, self, sel_selectCurrentColumn);

    objc_msgSend(v5, "addObject:", v27);
    v28 = objc_alloc(MEMORY[0x1E0DC33F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Select Row"), &stru_1EA7E9860, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v28, "initWithName:target:selector:", v30, self, sel_selectCurrentRow);

    objc_msgSend(v5, "addObject:", v31);
    v32 = objc_alloc(MEMORY[0x1E0DC33F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Select cell range"), &stru_1EA7E9860, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v32, "initWithName:target:selector:", v34, self, sel_selectCellRange);

    objc_msgSend(v5, "addObject:", v35);
    v36 = objc_alloc(MEMORY[0x1E0DC33F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Select table"), &stru_1EA7E9860, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v36, "initWithName:target:selector:", v38, self, sel_selectTable);

    objc_msgSend(v5, "addObject:", v39);
    if (objc_msgSend(MEMORY[0x1E0D64C80], "supportsRTL"))
    {
      v40 = objc_alloc(MEMORY[0x1E0DC33F0]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Reverse Table Direction"), &stru_1EA7E9860, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v40, "initWithName:target:selector:", v42, self, sel_reverseTableDirection);

      objc_msgSend(v5, "addObject:", v43);
    }
    v44 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v44 = 0;
  }
  return v44;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  char v11;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 1:
      v7 = objc_msgSend(v6, "accessibilityScrollRightPage");
      goto LABEL_5;
    case 2:
      v7 = objc_msgSend(v6, "accessibilityScrollLeftPage");
LABEL_5:
      v8 = v7;
      break;
    case 3:
      -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "noteScrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "accessibilityScrollUpPage");
      goto LABEL_8;
    case 4:
      -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "noteScrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "accessibilityScrollDownPage");
LABEL_8:
      v8 = v11;

      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (void)accessibilityElementDidBecomeFocused
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTableCellAccessibilityElement;
  -[ICTableCellAccessibilityElement accessibilityElementDidBecomeFocused](&v6, sel_accessibilityElementDidBecomeFocused);
  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollColumnIDToVisible:rowID:", v4, v5);

}

- (id)_accessibilityTextInputElement
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textViewForColumnID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textViewForColumnID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICTableCellAccessibilityElement noteEditorController](self, "noteEditorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNoteEditorViewController:", v2);

  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedTextViewRotors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTableTextRangeSelected");

  if (v4)
  {
    -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dragProviderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityDragSourceDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSArray)supportedRotorTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ICAccessibilityRotorTypeTables");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeInNote
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "attachmentRangeInNote");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)addColumnAfter
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectColumnWithID:", v4);

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addColumnAfter");

  -[ICTableCellAccessibilityElement moveFocusToFirstSelectedCell](self, "moveFocusToFirstSelectedCell");
  return 1;
}

- (BOOL)addRowBelow
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectRowWithID:", v4);

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addRowBelow");

  -[ICTableCellAccessibilityElement moveFocusToFirstSelectedCell](self, "moveFocusToFirstSelectedCell");
  return 1;
}

- (BOOL)deleteColumn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginEditingCellWithColumnID:rowID:", v4, v5);

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectColumnWithID:", v7);

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteSelectedColumns");

  -[ICTableCellAccessibilityElement moveFocusToFirstSelectedCell](self, "moveFocusToFirstSelectedCell");
  return 1;
}

- (BOOL)deleteRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginEditingCellWithColumnID:rowID:", v4, v5);

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectRowWithID:", v7);

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteSelectedRows");

  -[ICTableCellAccessibilityElement moveFocusToFirstSelectedCell](self, "moveFocusToFirstSelectedCell");
  return 1;
}

- (BOOL)selectCurrentColumn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginEditingCellWithColumnID:rowID:", v4, v5);

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectCurrentColumn");

  return 1;
}

- (BOOL)selectCurrentRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginEditingCellWithColumnID:rowID:", v4, v5);

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectCurrentRow");

  return 1;
}

- (BOOL)selectCellRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[ICTableCellAccessibilityElement isEditing](self, "isEditing"))
  {
    -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableCellAccessibilityElement columnID](self, "columnID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableCellAccessibilityElement rowID](self, "rowID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginEditingCellWithColumnID:rowID:", v4, v5);

  }
  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectCellRangeForCurrentCell");

  LODWORD(v6) = *MEMORY[0x1E0DC1068];
  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endSelectionKnob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v8);

  return 1;
}

- (BOOL)selectTable
{
  void *v2;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectTableTextRange:", 1);

  return 1;
}

- (void)moveFocusToFirstSelectedCell
{
  void *v2;
  void *v3;
  id argument;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  argument = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], argument);
}

- (void)reverseTableDirection
{
  void *v3;
  void *v4;
  UIAccessibilityNotifications v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseTableDirection");

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "isTableRightToLeft");

  v5 = *MEMORY[0x1E0DC44C8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if ((_DWORD)v3)
    v7 = CFSTR("Right to left");
  else
    v7 = CFSTR("Left to right");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v5, v8);

}

- (id)noteEditorController
{
  void *v2;
  id v3;
  uint64_t v4;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteScrollView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "nextResponder");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v3;
  }
LABEL_6:

  return v3;
}

- (ICTableCellAccessibilityElement)initWithTableAccessibilityController:(id)a3 columnID:(id)a4 rowID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICTableCellAccessibilityElement *v12;
  uint64_t v13;
  NSUUID *rowID;
  uint64_t v15;
  NSUUID *columnID;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "tableElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)ICTableCellAccessibilityElement;
  v12 = -[ICTableCellAccessibilityElement initWithAccessibilityContainer:](&v18, sel_initWithAccessibilityContainer_, v11);

  if (v12)
  {
    objc_storeWeak((id *)&v12->_tableAXController, v8);
    v13 = objc_msgSend(v10, "copy");
    rowID = v12->_rowID;
    v12->_rowID = (NSUUID *)v13;

    v15 = objc_msgSend(v9, "copy");
    columnID = v12->_columnID;
    v12->_columnID = (NSUUID *)v15;

  }
  return v12;
}

- (unint64_t)rowIndex
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rowIndexForRowID:", v4);

  return v5;
}

- (unint64_t)columnIndex
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "columnIndexForColumnID:", v4);

  return v5;
}

- (NSAttributedString)attributedContentString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedContentStringForColumnID:rowID:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v6;
}

- (CGRect)frameInScreenSpace
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  CGRect result;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameInScreenSpaceForCellWithColumnID:rowID:", v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)isEditing
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ICTableCellAccessibilityElement tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement columnID](self, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement rowID](self, "rowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "cellIsEditingAtColumnID:rowID:", v4, v5);

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGRect v12;

  -[ICTableCellAccessibilityElement frameInScreenSpace](self, "frameInScreenSpace");
  NSStringFromCGRect(v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICTableCellAccessibilityElement rowIndex](self, "rowIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICTableCellAccessibilityElement columnIndex](self, "columnIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellAccessibilityElement attributedContentString](self, "attributedContentString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p row=%@ col=%@ axframe=%@ content=\"%@\">"), v5, self, v6, v7, v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (ICTableAccessibilityController)tableAXController
{
  return (ICTableAccessibilityController *)objc_loadWeakRetained((id *)&self->_tableAXController);
}

- (void)setTableAXController:(id)a3
{
  objc_storeWeak((id *)&self->_tableAXController, a3);
}

- (NSUUID)rowID
{
  return self->_rowID;
}

- (NSUUID)columnID
{
  return self->_columnID;
}

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnID, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
  objc_destroyWeak((id *)&self->_tableAXController);
}

@end
