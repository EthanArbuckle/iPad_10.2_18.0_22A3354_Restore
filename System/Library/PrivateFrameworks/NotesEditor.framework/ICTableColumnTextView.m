@implementation ICTableColumnTextView

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pasteCellRange");

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)ICTableColumnTextView;
    -[ICBaseTextView paste:](&v7, sel_paste_, v4);
  }

}

- (ICTableColumnTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  ICTableColumnTextView *v4;
  ICTableColumnTextView *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICTableColumnTextView;
  v4 = -[ICBaseTextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[ICTableColumnTextView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    -[ICTableColumnTextView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    -[ICTableColumnTextView setTextContainerInset:](v5, "setTextContainerInset:", *MEMORY[0x1E0D64A38], 0.0, *MEMORY[0x1E0D64A20], 0.0);
    -[ICTableColumnTextView setWritingToolsBehavior:](v5, "setWritingToolsBehavior:", -1);
    -[ICBaseTextView setupTextViewDragAndDropDelegates](v5, "setupTextViewDragAndDropDelegates");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C08]), "initWithDelegate:", v5);
    -[ICTableColumnTextView addInteraction:](v5, "addInteraction:", v6);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38A0]), "initWithDelegate:", v5);
    -[ICTableColumnTextView addInteraction:](v5, "addInteraction:", v7);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, CFSTR("textView.editable"), &compoundliteral_5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)ICTableColumnTextView;
  -[ICBaseTextView dealloc](&v5, sel_dealloc);
}

- (void)setEditorController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, CFSTR("textView.editable"), &compoundliteral_5);

  v7.receiver = self;
  v7.super_class = (Class)ICTableColumnTextView;
  -[ICBaseTextView setEditorController:](&v7, sel_setEditorController_, v4);

  -[ICBaseTextView editorController](self, "editorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_addObserver:forKeyPath:context:explicitOptions:", self, CFSTR("textView.editable"), &compoundliteral_5, 4);

}

- (ICTableColumnTextStorage)columnTextStorage
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTableColumnTextStorage *)v4;
}

- (CGRect)selectionRect
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  -[ICTableColumnTextView selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmpty");

  if (v4)
  {
    -[ICTableColumnTextView selectedTextRange](self, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView caretRectForPosition:](self, "caretRectForPosition:", v6);
    x = v7;
    y = v9;
    width = v11;
    height = v13;

  }
  else
  {
    -[ICTableColumnTextView layoutManager](self, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
    v17 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v15, v16, 0);
    v19 = v18;
    -[ICTableColumnTextView textContainer](self, "textContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingRectForGlyphRange:inTextContainer:", v17, v19, v20);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    -[ICTableColumnTextView textContainerInset](self, "textContainerInset");
    v30 = v29;
    -[ICTableColumnTextView textContainerInset](self, "textContainerInset");
    v32 = v31;
    v37.origin.x = v22;
    v37.origin.y = v24;
    v37.size.width = v26;
    v37.size.height = v28;
    v38 = CGRectOffset(v37, v30, v32);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
  }

  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (BOOL)becomeFirstResponder
{
  objc_super v4;

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC10C0], self);
  v4.receiver = self;
  v4.super_class = (Class)ICTableColumnTextView;
  return -[ICBaseTextView becomeFirstResponder](&v4, sel_becomeFirstResponder);
}

- (BOOL)resignFirstResponder
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = 1;
  -[ICTableColumnTextView setIsResigningFirstResponder:](self, "setIsResigningFirstResponder:", 1);
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreventScrolling:", 1);

  if (-[ICTableColumnTextView isFirstResponder](self, "isFirstResponder"))
  {
    -[ICBaseTextView editorController](self, "editorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldAvoidBecomingFirstResponder");

    -[ICBaseTextView editorController](self, "editorController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldAvoidBecomingFirstResponder:", 1);

    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), 0);
    v14.receiver = self;
    v14.super_class = (Class)ICTableColumnTextView;
    v3 = -[ICBaseTextView resignFirstResponder](&v14, sel_resignFirstResponder);
    -[ICBaseTextView editorController](self, "editorController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldAvoidBecomingFirstResponder:", v7);

  }
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPreventScrolling:", 0);

  -[ICTableColumnTextView setIsResigningFirstResponder:](self, "setIsResigningFirstResponder:", 0);
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)ICTableColumnTextView;
  if (-[ICBaseTextView canBecomeFirstResponder](&v15, sel_canBecomeFirstResponder))
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containedInNoteSelection");

    if (v4)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      -[ICTableColumnTextView gestureRecognizers](self, "gestureRecognizers", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v12;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v5);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "state") == 3)
            {
              objc_opt_class();
              ICDynamicCast();
              v9 = (void *)objc_claimAutoreleasedReturnValue();

              if (v9)
              {
                LOBYTE(v6) = 1;
                goto LABEL_16;
              }
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_16:

    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICTableColumnTextView;
  v6 = -[ICBaseTextView canPerformAction:withSender:](&v16, sel_canPerformAction_withSender_, a3, a4);
  if (sel_selectAll_ == a3 && v6)
  {
    objc_opt_class();
    -[ICTableColumnTextView textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v11 = (id)objc_msgSend(v10, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange", 0), &v14);
    v12 = v15 != 0;
LABEL_11:

    return v12;
  }
  if (sel_paste_ == a3 && v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "hasStrings");
    goto LABEL_11;
  }
  return sel_shiftReturn_ == a3 || v6;
}

- (void)select:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_opt_class();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = 0;
  v7 = (id)objc_msgSend(v6, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v10);
  if (v11)
  {
    v9.receiver = self;
    v9.super_class = (Class)ICTableColumnTextView;
    -[ICBaseTextView select:](&v9, sel_select_, v4);
  }
  else
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectCell");

  }
}

- (void)selectAll:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t v11;

  objc_opt_class();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = 0;
  v6 = (id)objc_msgSend(v5, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v10);
  -[ICTableColumnTextView selectedRange](self, "selectedRange");
  if (v7 == v11)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectTable");

  }
  else
  {
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v10);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__ICTableColumnTextView_selectAll___block_invoke;
    v9[3] = &unk_1EA7DD2D8;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v9);
  }

}

void __35__ICTableColumnTextView_selectAll___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "selectionRect");
  objc_msgSend(v3, "showMenuFromView:rect:", v2);

}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)ICTableColumnTextView;
  -[ICTableColumnTextView keyCommands](&v45, sel_keyCommands);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if (-[ICTableColumnTextView isFirstResponder](self, "isFirstResponder"))
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "acceptsKeystrokes");

    if (v9)
    {
      -[ICTableColumnTextView selectedRange](self, "selectedRange");
      v10 = (_QWORD *)MEMORY[0x1E0DC4E28];
      v11 = (uint64_t *)MEMORY[0x1E0DC4E10];
      if (v12)
      {
        v13 = *MEMORY[0x1E0DC4E30];
        v14 = *MEMORY[0x1E0DC4D90];
      }
      else
      {
        if (!-[ICTableColumnTextView selectedRange](self, "selectedRange"))
        {
          objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0, sel_moveUp_);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
        v16 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
        -[ICTableColumnTextView textStorage](self, "textStorage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        v14 = *MEMORY[0x1E0DC4D90];
        if (v16 == v18)
        {
          objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0, sel_moveDown_);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v19);

        }
        objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v14, 0x80000, sel_altMoveDown_);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v20);

        v13 = *MEMORY[0x1E0DC4E30];
        objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0x80000, sel_altMoveUp_);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v21);

        objc_opt_class();
        -[ICTableColumnTextView textStorage](self, "textStorage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = 0;
        v24 = (id)objc_msgSend(v23, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange", 0), &v43);
        if (-[ICTableColumnTextView atCellBoundaryForDirection:](self, "atCellBoundaryForDirection:", 0))
        {
          v25 = *v11;
          objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *v11, 0, sel_moveLeft_);
          v26 = v10;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v27);

          v10 = v26;
          v11 = (uint64_t *)MEMORY[0x1E0DC4E10];
          objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v25, 0x80000, sel_moveLeft_);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v28);

        }
        if (-[ICTableColumnTextView atCellBoundaryForDirection:](self, "atCellBoundaryForDirection:", 1))
        {
          v29 = *v10;
          objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *v10, 0, sel_moveRight_);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v30);

          objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v29, 0x80000, sel_moveRight_);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v31);

        }
        if (!v44)
        {
          objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0, sel_moveLeft_);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v32);

        }
      }
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v13, 0x100000, sel_moveToBeginningOfCell_);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v33);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v14, 0x100000, sel_moveToEndOfCell_);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v34);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v13, 1179648, sel_moveToBeginningOfCellAndModifySelection_);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v35);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v14, 1179648, sel_moveToEndOfCellAndModifySelection_);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v36);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v13, 1572864, sel_addRowUp_);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v37);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v14, 1572864, sel_addRowDown_);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v38);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *v11, 1572864, sel_addColumnLeft_);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v39);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *v10, 1572864, sel_addColumnRight_);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v40);

      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x80000, sel_shiftReturn_);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v41);

    }
  }
  return v7;
}

- (void)moveUp:(id)a3
{
  id v3;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveUpCell");

}

- (void)altMoveUp:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ICTableColumnTextView selectedRange](self, "selectedRange"))
  {
    if (-[ICTableColumnTextView atCellBoundaryForDirection:](self, "atCellBoundaryForDirection:", 0))
      -[ICTableColumnTextView moveUp:](self, "moveUp:", v4);
    -[ICTableColumnTextView moveToBeginningOfCell:](self, "moveToBeginningOfCell:", v4);
  }

}

- (void)moveDown:(id)a3
{
  id v3;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveDownCell");

}

- (void)altMoveDown:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4 != v6)
  {
    if (-[ICTableColumnTextView atCellBoundaryForDirection:](self, "atCellBoundaryForDirection:", 1))
      -[ICTableColumnTextView moveDown:](self, "moveDown:", v7);
    -[ICTableColumnTextView moveToEndOfCell:](self, "moveToEndOfCell:", v7);
  }

}

- (void)moveLeft:(id)a3
{
  id v3;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveLeftCell");

}

- (void)moveRight:(id)a3
{
  id v3;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveRightCell");

}

- (void)shiftReturn:(id)a3
{
  -[ICBaseTextView insertText:](self, "insertText:", CFSTR("\u2028"));
}

- (void)addRowUp:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRowAboveSelection:", self);

  }
}

- (void)addRowDown:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRowBelowSelection:", self);

  }
}

- (void)addColumnLeft:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addColumnLeftOfSelection:", self);

  }
}

- (void)addColumnRight:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addColumnRightOfSelection:", self);

  }
}

- (void)deleteBackward
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  objc_super v10;
  unint64_t v11;
  uint64_t v12;

  objc_opt_class();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = 0;
  v5 = (id)objc_msgSend(v4, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v11);
  if (v12
    || (-[ICTableColumnTextView cellDelegate](self, "cellDelegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "acceptsKeystrokes"),
        v6,
        !v7))
  {
    v8 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
    if (v8 > v11 || (-[ICTableColumnTextView selectedRange](self, "selectedRange"), v9))
    {
      v10.receiver = self;
      v10.super_class = (Class)ICTableColumnTextView;
      -[ICBaseTextView deleteBackward](&v10, sel_deleteBackward);
    }
  }
  else if (-[ICTableColumnTextView isProcessingDelete](self, "isProcessingDelete"))
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_moveLeftCellAfterDelete, 0);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_finishProcessingDelete, 0);
    -[ICTableColumnTextView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_finishProcessingDelete, 0, 0.5);
  }
  else
  {
    -[ICTableColumnTextView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_moveLeftCellAfterDelete, 0, 0.5);
    -[ICTableColumnTextView setIsProcessingDelete:](self, "setIsProcessingDelete:", 1);
  }

}

- (void)moveLeftCellAfterDelete
{
  id v3;

  -[ICTableColumnTextView finishProcessingDelete](self, "finishProcessingDelete");
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveLeftCell");

}

- (void)finishProcessingDelete
{
  -[ICTableColumnTextView setIsProcessingDelete:](self, "setIsProcessingDelete:", 0);
}

- (int64_t)returnKeyType
{
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isLargeiPad"))
    return 0;
  else
    return 4;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  int64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "_modifierFlags");
  objc_msgSend(v7, "_modifiedInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") != 1)
    goto LABEL_12;
  if ((v8 & 0x180000) != 0)
    goto LABEL_12;
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "acceptsKeystrokes");

  if (!v11)
    goto LABEL_12;
  v12 = objc_msgSend(v9, "characterAtIndex:", 0);
  v13 = v12;
  if (v12 == 13 || v12 == 10)
  {
    -[ICTableColumnTextView markedTextRange](self, "markedTextRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

      goto LABEL_12;
    }
    if ((objc_msgSend(MEMORY[0x1E0DC3938], "ic_isShiftKeyPressed") & 1) != 0)
      goto LABEL_12;
    if ((v8 & 0x20000) != 0)
    {
      -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "moveShiftReturnCell");
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
      if (v13 == 13 && v30)
      {
        -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v31;
LABEL_39:
        objc_msgSend(v31, "moveReturnCell");
        goto LABEL_40;
      }
      v32 = -[ICTableColumnTextView returnKeyType](self, "returnKeyType");
      -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v31;
      if (v32 != 4)
        goto LABEL_39;
      objc_msgSend(v31, "moveNextCell");
    }
LABEL_40:

    goto LABEL_28;
  }
  if (v12 == 9)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v8 & 0x20000) != 0)
      objc_msgSend(v14, "movePrevCell");
    else
      objc_msgSend(v14, "moveTabCell");
    goto LABEL_40;
  }
LABEL_12:
  v17 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
  v19 = v18;
  v36.receiver = self;
  v36.super_class = (Class)ICTableColumnTextView;
  v20 = v6;
  -[ICTableColumnTextView pressesBegan:withEvent:](&v36, sel_pressesBegan_withEvent_, v6, v7);
  objc_msgSend(v7, "_unmodifiedInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0DC4E10]);
  v23 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0DC4E28]);
  if (!objc_msgSend(v7, "_isKeyDown") || !(v22 | v23))
    goto LABEL_27;
  if (v8 == 0x80000)
  {
    v33 = v19;
    objc_opt_class();
    -[ICTableColumnTextView textStorage](self, "textStorage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = 0;
    v35[1] = 0;
    v27 = (id)objc_msgSend(v25, "rowAtIndex:rowRange:", v17, v35);
    v34[0] = 0;
    v34[1] = 0;
    v28 = (id)objc_msgSend(v25, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), v34);
    if (v35[0] != v34[0])
    {
      -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v17, v33);
      if (v22)
      {
        -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "moveLeftCell");
      }
      else
      {
        if (!v23)
          goto LABEL_26;
        -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "moveRightCell");
      }

    }
  }
  else
  {
    if (v8 != 0x100000)
      goto LABEL_27;
    if (-[ICTableColumnTextView selectedRange](self, "selectedRange") != v17)
      goto LABEL_27;
    -[ICTableColumnTextView selectedRange](self, "selectedRange");
    if (v24 != v19)
      goto LABEL_27;
    if (v22)
    {
      -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "moveLeftCell");
    }
    else
    {
      if (!v23)
        goto LABEL_27;
      -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "moveRightCell");
    }
  }
LABEL_26:

LABEL_27:
  v6 = v20;
LABEL_28:

}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  double MidX;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  double MidY;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[2];
  objc_super v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[ICTableColumnTextView beginningOfDocument](self, "beginningOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICTableColumnTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v9, v8);

    v43.receiver = self;
    v43.super_class = (Class)ICTableColumnTextView;
    -[ICTableColumnTextView positionFromPosition:inDirection:offset:](&v43, sel_positionFromPosition_inDirection_offset_, v8, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnTextView beginningOfDocument](self, "beginningOfDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICTableColumnTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v12, v11);

    if (v13 == v10 && v13 >= 1)
    {
      v13 = v10 - 1;
      -[ICTableColumnTextView beginningOfDocument](self, "beginningOfDocument");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableColumnTextView positionFromPosition:offset:](self, "positionFromPosition:offset:", v15, v10 - 1);
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v16;
    }
    objc_opt_class();
    -[ICTableColumnTextView textStorage](self, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v42[0] = 0;
    v42[1] = 0;
    v19 = (id)objc_msgSend(v18, "rowAtIndex:rowRange:", v10, v42);
    v41[0] = 0;
    v41[1] = 0;
    v20 = (id)objc_msgSend(v18, "rowAtIndex:rowRange:", v13, v41);
    if (v42[0] != v41[0])
    {
      -[ICBaseTextView caretRectForPosition:](self, "caretRectForPosition:", v8);
      MidX = CGRectGetMidX(v44);
      -[ICTableColumnTextView layoutManager](self, "layoutManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "glyphIndexForCharacterAtIndex:", v13);

      -[ICTableColumnTextView layoutManager](self, "layoutManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v23, 0, 1);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      v45.origin.x = v26;
      v45.origin.y = v28;
      v45.size.width = v30;
      v45.size.height = v32;
      if (!CGRectIsEmpty(v45))
      {
        -[ICTableColumnTextView layoutManager](self, "layoutManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v46.origin.x = v26;
        v46.origin.y = v28;
        v46.size.width = v30;
        v46.size.height = v32;
        MidY = CGRectGetMidY(v46);
        -[ICTableColumnTextView textContainer](self, "textContainer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v33, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v35, 0, MidX, MidY);

        if (v13 != v36)
        {
          -[ICTableColumnTextView beginningOfDocument](self, "beginningOfDocument");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableColumnTextView positionFromPosition:offset:](self, "positionFromPosition:offset:", v37, v36);
          v38 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v38;
        }
      }
    }

  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)ICTableColumnTextView;
    -[ICTableColumnTextView positionFromPosition:inDirection:offset:](&v40, sel_positionFromPosition_inDirection_offset_, v8, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  y = a3.y;
  x = a3.x;
  v40 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[ICTableColumnTextView layoutManager](self, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "populatedRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v36;
    while (2)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
        objc_msgSend(v8, "rowPositions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        if (y <= v21)
        {
          v13 = v16;
          goto LABEL_12;
        }
        v13 = v17;

        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_12:

  v34.receiver = self;
  v34.super_class = (Class)ICTableColumnTextView;
  -[ICTableColumnTextView closestPositionToPoint:](&v34, sel_closestPositionToPoint_, x, y);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "characterRangeForRowID:", v13);
    v26 = v25;

    -[ICTableColumnTextView beginningOfDocument](self, "beginningOfDocument");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[ICTableColumnTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v27, v22);

    v29 = v24 + v26;
    if (v28 < v24 + v26)
      v29 = v28;
    if (v24 <= v29)
      v30 = v29;
    else
      v30 = v24;
    if (v28 != v30)
    {
      -[ICTableColumnTextView beginningOfDocument](self, "beginningOfDocument");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableColumnTextView positionFromPosition:offset:](self, "positionFromPosition:offset:", v31, v30);
      v32 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v32;
    }
  }

  return v22;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3;
  unsigned __int8 v4;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICTableColumnTextView;
  v3 = a3;
  v4 = -[ICBaseTextView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, v3);
  NSClassFromString(CFSTR("_UITextSelectionForceGesture"));
  isKindOfClass = objc_opt_isKindOfClass();

  return v4 & ~isKindOfClass;
}

- (void)startEditingForTapGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  -[ICTableColumnTextView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tappedTableAtLocation:", v7, v9);

}

- (void)didPasteOrDropText:(id)a3 toRange:(id)a4
{
  id v5;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didPasteOrDropTextForTableColumnTextView:", self);

}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  objc_msgSend(v5, "dropSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICBaseTextView shouldAcceptDropSession:](self, "shouldAcceptDropSession:", v6);

  if (v7)
  {
    if (objc_msgSend(v5, "isSameView"))
    {
      v8 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
      -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logicalRangeForLocation:", v8);

      -[ICTableColumnTextView beginningOfDocument](self, "beginningOfDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dropPosition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableColumnTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v10, v11);

      v12 = 3;
    }
    else
    {
      v12 = 2;
    }
  }
  else
  {
    v12 = 1;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DA8]), "initWithDropOperation:", v12);

  return v13;
}

- (void)toggleBoldface:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextView;
  -[ICBaseTextView toggleBoldface:](&v3, sel_toggleBoldface_, a3);
}

- (void)toggleItalics:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextView;
  -[ICBaseTextView toggleItalics:](&v3, sel_toggleItalics_, a3);
}

- (void)toggleUnderline:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextView;
  -[ICBaseTextView toggleUnderline:](&v3, sel_toggleUnderline_, a3);
}

- (id)inputAssistantItem
{
  void *v2;
  void *v3;
  void *v4;

  -[ICBaseTextView editorController](self, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputAssistantItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((-[ICTableColumnTextView ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/ICTableColumnTextView_iOS.m") & 1) != 0)
  {
    v13 = -[ICTableColumnTextView ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v12, v11, v10);

    if ((v13 & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v11)
      {
        v15 = objc_msgSend(v10, "isEqual:", CFSTR("textView.editable"));

        if (v15)
        {
          -[ICBaseTextView editorController](self, "editorController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "textView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEditable");

          if ((_DWORD)v18 != -[ICTableColumnTextView isEditable](self, "isEditable"))
          {
            -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setShouldPreventUndoCommands:", 1);

            -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "beginPreventEditingUpdates");

            -[ICTableColumnTextView setEditable:](self, "setEditable:", v18);
            -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "endPreventEditingUpdates");

            -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setShouldPreventUndoCommands:", 0);

          }
        }
      }
      else
      {

      }
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)ICTableColumnTextView;
    -[ICTableColumnTextView observeValueForKeyPath:ofObject:change:context:](&v23, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);

  }
}

- (BOOL)isAccessibilityTableTextView
{
  return 1;
}

- (id)baseAttributedStringForAccessibility
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  objc_opt_class();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = 0;
  v5 = (id)objc_msgSend(v4, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v9);
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedSubstringFromRange:", v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  NSUInteger location;
  NSUInteger length;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;

  location = a3->location;
  length = a3->length;
  -[ICTableColumnTextView baseAttributedStringForAccessibility](self, "baseAttributedStringForAccessibility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnTextView _icaxAccessibilityAttributedStringFromOriginalString:](self, "_icaxAccessibilityAttributedStringFromOriginalString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (location <= objc_msgSend(v7, "length"))
  {
    v9 = objc_msgSend(v7, "length");
    if (v9 - location >= length)
      v10 = length;
    else
      v10 = v9 - location;
    objc_msgSend(v7, "attributedSubstringFromRange:", location, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_icaxAccessibilityAttributedStringFromOriginalString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, uint64_t);
  void *v17;
  ICTableColumnTextView *v18;
  id v19;

  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  v9 = *MEMORY[0x1E0DC10F8];
  v10 = objc_msgSend(v5, "length");
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __78__ICTableColumnTextView__icaxAccessibilityAttributedStringFromOriginalString___block_invoke;
  v17 = &unk_1EA7DDF00;
  v18 = self;
  v19 = v8;
  v11 = v8;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v10, 0, &v14);

  v12 = (void *)objc_msgSend(v11, "copy", v14, v15, v16, v17, v18);
  return v12;
}

void __78__ICTableColumnTextView__icaxAccessibilityAttributedStringFromOriginalString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewForLayoutManager:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0CF4138], v9, a3, a4);

}

- (_NSRange)_accessibilitySelectedTextRange
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
  v5 = -[ICTableColumnTextView rangeInSelectedCellFromRangeInTextView:](self, "rangeInSelectedCellFromRangeInTextView:", v3, v4);
  result.length = v6;
  result.location = v5;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  length = a3.length;
  location = a3.location;
  v6 = a3.location + a3.length;
  -[ICTableColumnTextView baseAttributedStringForAccessibility](self, "baseAttributedStringForAccessibility");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v6 <= v8)
  {
    v9 = -[ICTableColumnTextView rangeInTextViewFromRangeInSelectedCell:](self, "rangeInTextViewFromRangeInSelectedCell:", location, length);
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v9, v10);
  }
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  v4 = -[ICTableColumnTextView rangeInTextViewFromRangeInSelectedCell:](self, "rangeInTextViewFromRangeInSelectedCell:", a3.location, a3.length);
  v10.receiver = self;
  v10.super_class = (Class)ICTableColumnTextView;
  -[ICBaseTextView _accessibilityBoundsForRange:](&v10, sel__accessibilityBoundsForRange_, v4, v5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (_NSRange)rangeInSelectedCellFromRangeInTextView:(_NSRange)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  uint64_t v15;
  _NSRange result;

  v14 = 0;
  v15 = 0;
  objc_opt_class();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
    if (v7 >= v14)
      v8 = v7 - v14;
    else
      v8 = 0;
    v9 = v15 - v8;
    -[ICTableColumnTextView selectedRange](self, "selectedRange", v14);
    if (v9 >= v10)
      v11 = v10;
    else
      v11 = v9;
  }
  else
  {
    v11 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v12 = v8;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)rangeInTextViewFromRangeInSelectedCell:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v12 = 0;
  v13 = 0;
  objc_opt_class();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v12 + location;
    if (v13 - location < length)
      length = v13 - location;
  }
  else
  {
    length = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v10 = v9;
  v11 = length;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)accessibilityLabel
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  CGRect result;

  objc_opt_class();
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tableAXController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_accessibilityScrollToVisible
{
  return 0;
}

- (BOOL)_accessibilityCanDrag
{
  return 0;
}

- (id)accessibilityDragSourceDescriptors
{
  return 0;
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  void *v5;
  BOOL v6;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isNoteEditable"))
    v6 = -[ICTableColumnTextView canBecomeFirstResponder](self, "canBecomeFirstResponder");
  else
    v6 = 0;

  return v6;
}

- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v5;

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditingSelectedRangeInTextView:", self);

}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a5;
  -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "populatedRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v6, "populatedRows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v9);

  }
  else
  {
    v10[2](v10, (void *)MEMORY[0x1E0C9AA60]);
  }

}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  id v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = -[ICTableColumnTextView isFirstResponder](self, "isFirstResponder");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[elementIdentifier isKindOfClass:[NSUUID class]]", "-[ICTableColumnTextView indirectScribbleInteraction:isElementFocused:]", 1, 0, CFSTR("Expected NSUUID in indirectScribbleInteraction:isElementFocused:"));
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = v6;
  else
    v8 = 0;
  if (v8 == 1)
  {
    -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v10, "isEqual:", v7);

  }
  return v6;
}

- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v5;
  void *v6;
  void *v7;
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
  CGRect result;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[elementIdentifier isKindOfClass:[NSUUID class]]", "-[ICTableColumnTextView indirectScribbleInteraction:frameForElement:]", 1, 0, CFSTR("Expected NSUUID in indirectScribbleInteraction:frameForElement:"));
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frameOfCellForColumnTextView:row:", self, v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  double y;
  double x;
  void (**v10)(id, ICTableColumnTextView *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSRange v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSRange v25;

  y = a5.y;
  x = a5.x;
  v24 = a4;
  v10 = (void (**)(id, ICTableColumnTextView *))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[elementIdentifier isKindOfClass:[NSUUID class]]", "-[ICTableColumnTextView indirectScribbleInteraction:focusElementIfNeeded:referencePoint:completion:]", 1, 0, CFSTR("Expected NSUUID in indirectScribbleInteraction:focusElementIfNeeded:..."));
  objc_opt_class();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11
    && (objc_msgSend(v12, "populatedRows"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "containsObject:", v11),
        v14,
        v15))
  {
    -[ICTableColumnTextView becomeFirstResponder](self, "becomeFirstResponder");
    v16 = objc_msgSend(v13, "characterRangeForRowID:", v11);
    v18 = v17;
    v20.location = -[ICTableColumnTextView selectedRange](self, "selectedRange");
    if (v19 <= 1)
      v20.length = 1;
    else
      v20.length = v19;
    v25.length = v18 + 1;
    v25.location = v16;
    if (!NSIntersectionRange(v25, v20).length)
    {
      -[ICTableColumnTextView closestPositionToPoint:](self, "closestPositionToPoint:", x, y);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[ICTableColumnTextView beginningOfDocument](self, "beginningOfDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[ICTableColumnTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v22, v21);

        -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v23, 0);
      }

    }
  }
  else
  {
    self = 0;
  }
  v10[2](v10, self);

}

- (void)setupMenuController
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (ICDebugModeEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39E8]), "initWithTitle:action:", CFSTR("Tags"), sel_openExperimentalHashtagUI_);
    v5[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ic_addMenuItemsIfNecessary:", v4);

  }
}

- (void)openExperimentalHashtagUI:(id)a3
{
  void *v4;
  void *v5;
  ICHashtagViewController *v6;

  if (ICDebugModeEnabled())
  {
    v6 = objc_alloc_init(ICHashtagViewController);
    -[ICHashtagViewController setDelegate:](v6, "setDelegate:", self);
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (void)hashtagViewController:(id)a3 insertHashtagWithText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63B20], "hashtagWithDisplayText:account:createIfNecessary:", v5, v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((hashtag) != nil)", "-[ICTableColumnTextView hashtagViewController:insertHashtagWithText:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "hashtag");
  v12 = (void *)MEMORY[0x1E0D63B40];
  objc_msgSend(v11, "displayText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createHashtagAttachmentIfApplicableWithHashtagText:forHashtag:note:parentAttachment:", v13, v11, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:](self, "insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:", v14, v10, v8);

}

- (void)hashtagViewController:(id)a3 insertUnknownInlineAttachmentWithText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D63B40];
  objc_msgSend((id)*MEMORY[0x1E0D63870], "stringByAppendingString:", CFSTR(".unknown"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createInlineAttachmentIfApplicableWithTypeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v10, v5, v5, v12, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:](self, "insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:", v11, v8, v12);

}

- (void)hashtagViewController:(id)a3 insertFutureHashtagWithText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63B20], "hashtagWithDisplayText:account:createIfNecessary:", v5, v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((hashtag) != nil)", "-[ICTableColumnTextView hashtagViewController:insertFutureHashtagWithText:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "hashtag");
  v12 = (void *)MEMORY[0x1E0D63B40];
  objc_msgSend(v11, "displayText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createHashtagAttachmentIfApplicableWithHashtagText:forHashtag:note:parentAttachment:", v13, v11, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "requireMinimumSupportedVersionAndPropagateToChildObjects:", objc_msgSend(MEMORY[0x1E0D63A90], "currentNotesVersion") + 1);
    -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:](self, "insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:", v14, v10, v8);
  }

}

- (void)insertInlineAttachment:(id)a3 saveAndResumeEditingForAttachment:(id)a4 inNote:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  v10 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
  -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:](self, "insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:", v12, v9, v8, v10, v11);

}

- (void)insertInlineAttachment:(id)a3 saveAndResumeEditingForAttachment:(id)a4 inNote:(id)a5 forRange:(_NSRange)a6
{
  NSUInteger length;
  unint64_t location;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSRange v21;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (location > objc_msgSend(v15, "length"))
    {
      v16 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v21.location = location;
        v21.length = length;
        -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:].cold.1(v21, v15, v16);
      }

      location = objc_msgSend(v15, "length");
    }
    objc_msgSend(MEMORY[0x1E0D64C48], "textAttachmentWithAttachment:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v17, 0, objc_msgSend(v19, "length"));
    objc_msgSend(v15, "replaceCharactersInRange:withAttributedString:", location, length, v19);
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", location + length, 0);
    objc_msgSend(v15, "fixupAfterEditing");
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNeedsSave");

    objc_msgSend(v11, "updateChangeCountWithReason:", CFSTR("Inserted inline attachment in table"));
    objc_msgSend(v12, "updateChangeCountWithReason:", CFSTR("Inserted inline attachment in table"));
    objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Inserted inline attachment in table"));
    objc_msgSend(v13, "save");

  }
}

- (void)openLinkEditor:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D639E0];
  -[ICTableColumnTextView textStorage](self, "textStorage", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
  objc_msgSend(v4, "URLForAttributedString:range:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableColumnTextView selectedText](self, "selectedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], -[ICTableColumnTextView selectedRange](self, "selectedRange"), 0);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = xmmword_1DD9E6F90;
  v29 = (void *)v11;
  if (!v8)
    goto LABEL_5;
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1160];
  v15 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v13, "attribute:atIndex:longestEffectiveRange:inRange:", v14, v15, &v30, 0, objc_msgSend(v16, "length"));

  if ((_QWORD)v30 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  if (*((_QWORD *)&v30 + 1))
  {
    -[ICTableColumnTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnTextView textInRange:](self, "textInRange:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v19;
  }
  else
  {
LABEL_5:
    *(_QWORD *)&v30 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
    *((_QWORD *)&v30 + 1) = v20;
  }
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "note");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mergeableString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "selectionForCharacterRanges:selectionAffinity:", v25, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICBaseTextView editorController](self, "editorController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = +[ICLinkEditorViewControllerHelper presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:](ICLinkEditorViewControllerHelper, "presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:", v27, self, v9, v8, v12, v26, v30, 3);

}

- (void)createLink:(id)a3 title:(id)a4 textSelection:(id)a5 range:(_NSRange)a6 addApproach:(int64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  length = a6.length;
  location = a6.location;
  v12 = a4;
  v13 = a3;
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributesAtIndex:effectiveRange:", location, 0);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v12);
  v16 = objc_msgSend(v15, "ic_range");
  objc_msgSend(v15, "addAttributes:range:", v37, v16, v17);
  v18 = *MEMORY[0x1E0DC1160];
  v19 = objc_msgSend(v15, "ic_range");
  objc_msgSend(v15, "addAttribute:value:range:", v18, v13, v19, v20);
  v21 = *MEMORY[0x1E0D1CF60];
  v22 = objc_msgSend(v15, "ic_range");
  objc_msgSend(v15, "removeAttribute:range:", v21, v22, v23);
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v24, "replaceCharactersInRange:withAttributedString:", location, length, v25);

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNeedsSave");

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "attachment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "updateChangeCountWithReason:", CFSTR("Created link in table"));

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "note");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "updateChangeCountWithReason:", CFSTR("Created link in table"));

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "note");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "save");

  -[ICTableColumnTextView eventReporter](self, "eventReporter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "note");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "submitAddLinkEvent:addApproach:url:", v35, a7, v13);

  -[ICBaseTextView editorController](self, "editorController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "startEditing");

  -[ICTableColumnTextView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)createNoteLinkAttachment:(id)a3 textSelection:(id)a4 range:(_NSRange)a5 addApproach:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  id v11;
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
  void *v26;
  void *v27;
  NSObject *v28;
  uint8_t v29[16];

  length = a5.length;
  location = a5.location;
  v10 = (void *)MEMORY[0x1E0D63BB8];
  v11 = a3;
  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "noteWithIdentifier:context:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0D63B40];
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "note");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "newLinkAttachmentToNote:fromNote:parentAttachment:", v15, v18, 0);

    if (v19)
    {
      -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "attachment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "note");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:](self, "insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:", v19, v21, v23, location, length);

      -[ICTableColumnTextView eventReporter](self, "eventReporter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "note");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "submitAddLinkEvent:addApproach:contentType:isTokenized:", v26, a6, 1, 1);

      -[ICBaseTextView editorController](self, "editorController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startEditing");

      -[ICTableColumnTextView becomeFirstResponder](self, "becomeFirstResponder");
    }

  }
  else
  {
    v28 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1DD7B0000, v28, OS_LOG_TYPE_DEFAULT, "Attempted to create Note Link Attachment to nil Note", v29, 2u);
    }

  }
}

- (void)removeLinksFromTextSelection:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  length = a4.length;
  location = a4.location;
  -[ICTableColumnTextView textStorage](self, "textStorage", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAttribute:range:", *MEMORY[0x1E0DC1160], location, length);

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsSave");

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateChangeCountWithReason:", CFSTR("Removed link from table"));

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateChangeCountWithReason:", CFSTR("Removed link from table"));

  -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "save");

}

- (void)removeLinksFromCurrentSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  -[ICTableColumnTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
  v6 = v5;
  objc_msgSend(v3, "removeAttribute:range:", *MEMORY[0x1E0DC1160], v4, v5);
  v7 = *MEMORY[0x1E0DC10F8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ICTableColumnTextView_removeLinksFromCurrentSelection__block_invoke;
  v9[3] = &unk_1EA7DDC18;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v7, v4, v6, 0, v9);

}

void __56__ICTableColumnTextView_removeLinksFromCurrentSelection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "typeUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D63878]);

  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v14, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v13);

  }
}

- (BOOL)shouldShowFloatingSuggestions
{
  void *v2;
  char v3;

  -[ICTableColumnTextView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "ic_hasCompactSize"))
    v3 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  else
    v3 = 1;

  return v3;
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  void *v5;
  ICNAEventReporter *v6;
  ICNAEventReporter *eventReporter;
  void *v8;

  if (!self->_eventReporter && objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D62A30]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:view:", v5, self);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, *MEMORY[0x1E0D62A18], self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D62A18];
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (NSUUID)columnID
{
  return self->_columnID;
}

- (void)setColumnID:(id)a3
{
  objc_storeStrong((id *)&self->_columnID, a3);
}

- (ICTableColumnTextViewDelegate)cellDelegate
{
  return (ICTableColumnTextViewDelegate *)objc_loadWeakRetained((id *)&self->_cellDelegate);
}

- (void)setCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cellDelegate, a3);
}

- (ICTableSelectionDelegate)selectionDelegate
{
  return (ICTableSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (BOOL)isChangingFont
{
  return self->_isChangingFont;
}

- (void)setIsChangingFont:(BOOL)a3
{
  self->_isChangingFont = a3;
}

- (BOOL)isResigningFirstResponder
{
  return self->_isResigningFirstResponder;
}

- (void)setIsResigningFirstResponder:(BOOL)a3
{
  self->_isResigningFirstResponder = a3;
}

- (_NSRange)previousSelectedRange
{
  _NSRange *p_previousSelectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_previousSelectedRange = &self->_previousSelectedRange;
  location = self->_previousSelectedRange.location;
  length = p_previousSelectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPreviousSelectedRange:(_NSRange)a3
{
  self->_previousSelectedRange = a3;
}

- (ICHashtagController)hashtagController
{
  return (ICHashtagController *)objc_loadWeakRetained((id *)&self->_hashtagController);
}

- (void)setHashtagController:(id)a3
{
  objc_storeWeak((id *)&self->_hashtagController, a3);
}

- (ICMentionsController)mentionsController
{
  return (ICMentionsController *)objc_loadWeakRetained((id *)&self->_mentionsController);
}

- (void)setMentionsController:(id)a3
{
  objc_storeWeak((id *)&self->_mentionsController, a3);
}

- (BOOL)isProcessingDelete
{
  return self->_isProcessingDelete;
}

- (void)setIsProcessingDelete:(BOOL)a3
{
  self->_isProcessingDelete = a3;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_mentionsController);
  objc_destroyWeak((id *)&self->_hashtagController);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_cellDelegate);
  objc_storeStrong((id *)&self->_columnID, 0);
}

- (void)moveToBeginningOfCell:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = -[ICTableColumnTextView selectedRange](self, "selectedRange", a3);
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "logicalRangeForLocation:", v4);

  if (v4 == v6)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "moveUpCell");

  }
  else
  {
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v6, 0);
  }
}

- (void)moveToEndOfCell:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v4 = -[ICTableColumnTextView selectedRange](self, "selectedRange", a3);
  v6 = v4 + v5;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "logicalRangeForLocation:", v6);
  v10 = v9;

  if (v6 == v8 + v10)
  {
    -[ICTableColumnTextView cellDelegate](self, "cellDelegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "moveDownCell");

  }
  else
  {
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:");
  }
}

- (void)moveToBeginningOfCellAndModifySelection:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  NSUInteger v8;
  NSRange v9;
  NSRange v10;
  NSRange v11;

  v4 = -[ICTableColumnTextView selectedRange](self, "selectedRange", a3);
  v6 = v5;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "logicalRangeForLocation:", v4);

  v10.location = v8;
  v10.length = 0;
  v11.location = v4;
  v11.length = v6;
  v9 = NSUnionRange(v10, v11);
  -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v9.location, v9.length);
}

- (void)moveToEndOfCellAndModifySelection:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSRange v11;
  NSRange v12;
  NSRange v13;

  v4 = -[ICTableColumnTextView selectedRange](self, "selectedRange", a3);
  v6 = v5;
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "logicalRangeForLocation:", v4);
  v10 = v9;

  v12.location = v8 + v10;
  v12.length = 0;
  v13.location = v4;
  v13.length = v6;
  v11 = NSUnionRange(v12, v13);
  -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v11.location, v11.length);
}

- (BOOL)atCellBoundaryForDirection:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;

  v5 = -[ICTableColumnTextView selectedRange](self, "selectedRange");
  v7 = v6;
  v20 = 0;
  v21 = 0;
  -[ICTableColumnTextView columnTextStorage](self, "columnTextStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "rowAtIndex:rowRange:", v5, &v20);
  v10 = v20;
  v11 = v21;
  if (v21)
    v12 = v5 == v20;
  else
    v12 = 0;
  if (v12)
  {
    -[ICTableColumnTextView textStorage](self, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "ic_writingDirectionAtIndex:", v5);

    if (!(a3 | v14) || a3 == 1 && v14 == 1)
      goto LABEL_16;
    v10 = v20;
    v11 = v21;
  }
  else if (!v21)
  {
LABEL_16:
    v18 = 1;
    goto LABEL_18;
  }
  v15 = v5 + v7;
  if (v15 != v11 + v10)
  {
    v18 = 0;
    goto LABEL_18;
  }
  -[ICTableColumnTextView textStorage](self, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "ic_writingDirectionAtIndex:", v15 - 1);

  if (!a3 && v17 == 1)
    goto LABEL_16;
  v18 = 0;
  if (a3 == 1 && !v17)
    goto LABEL_16;
LABEL_18:

  return v18;
}

- (void)insertInlineAttachment:(NSObject *)a3 saveAndResumeEditingForAttachment:inNote:forRange:.cold.1(NSRange a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2048;
  v9 = objc_msgSend(a2, "length");
  _os_log_error_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_ERROR, "Attempted to addInlineAttachment:atTextRange: with an out of bound range: %@. Adding inline attachment to the end of text storage instead, %lu.", (uint8_t *)&v6, 0x16u);

}

@end
