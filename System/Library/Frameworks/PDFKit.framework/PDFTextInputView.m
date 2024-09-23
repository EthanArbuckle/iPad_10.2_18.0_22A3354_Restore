@implementation PDFTextInputView

- (PDFTextInputView)initWithDelegate:(id)a3
{
  id v4;
  PDFTextInputView *v5;
  PDFTextInputView *v6;
  uint64_t v7;
  UITextInputTokenizer *textInputTokenizer;
  uint64_t v9;
  UITextInteraction *textInteraction;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDFTextInputView;
  v5 = -[PDFTextInputView init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6EC0]), "initWithTextInput:", v6);
    textInputTokenizer = v6->_textInputTokenizer;
    v6->_textInputTokenizer = (UITextInputTokenizer *)v7;

    objc_msgSend(MEMORY[0x24BDF6ED0], "textInteractionsForSet:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    textInteraction = v6->_textInteraction;
    v6->_textInteraction = (UITextInteraction *)v9;

    -[UITextInteraction setDelegate:](v6->_textInteraction, "setDelegate:", v6);
    -[UITextInteraction setTextInput:](v6->_textInteraction, "setTextInput:", v6);
    -[PDFTextInputView addInteraction:](v6, "addInteraction:", v6->_textInteraction);
  }

  return v6;
}

- (void)updateTextSelectionGraphics
{
  -[UITextInputDelegate selectionWillChange:](self->_textInputDelegate, "selectionWillChange:", self);
  -[UITextInputDelegate selectionDidChange:](self->_textInputDelegate, "selectionDidChange:", self);
}

- (void)setSelection:(id)a3
{
  void *v4;
  UITextRange *v5;
  _BOOL4 v6;
  int v7;
  int v8;
  UITextRange *textSelectionRange;
  id obj;

  if (!a3)
  {
    -[UITextInputDelegate textWillChange:](self->_textInputDelegate, "textWillChange:", self);
    textSelectionRange = self->_textSelectionRange;
    self->_textSelectionRange = 0;

    -[UITextInputDelegate textDidChange:](self->_textInputDelegate, "textDidChange:", self);
    return;
  }
  +[PDFTextRange textRangeFromSelection:](PDFTextRange, "textRangeFromSelection:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_textSelectionRange;
  obj = v4;
  if (!v5)
  {
    v7 = 0;
    if (v4)
      goto LABEL_4;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v6 = -[UITextRange isEmpty](v5, "isEmpty");
  v4 = obj;
  v7 = !v6;
  if (!obj)
    goto LABEL_7;
LABEL_4:
  v8 = objc_msgSend(v4, "isEmpty") ^ 1;
LABEL_8:
  if ((v7 | v8) == 1)
  {
    -[UITextInputDelegate textWillChange:](self->_textInputDelegate, "textWillChange:", self);
    objc_storeStrong((id *)&self->_textSelectionRange, obj);
    -[UITextInputDelegate textDidChange:](self->_textInputDelegate, "textDidChange:", self);
  }

}

- (id)selection
{
  return -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", self->_textSelectionRange);
}

- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7
{
  uint64_t v8;
  uint64_t v9;

  v8 = 1;
  switch(a3)
  {
    case 0uLL:
      break;
    case 1uLL:
      v8 = 2;
      break;
    case 2uLL:
      v8 = 3;
      break;
    case 3uLL:
      if (a7)
        v8 = 3;
      else
        v8 = 4;
      break;
    default:
      v8 = 0;
      break;
  }
  if (a7)
    v9 = 3;
  else
    v9 = 0;
  -[UITextInteraction _performGestureType:state:location:locationOfFirstTouch:forTouchType:](self->_textInteraction, "_performGestureType:state:location:locationOfFirstTouch:forTouchType:", v8, a4, v9, a5.x, a5.y, a6.x, a6.y);
}

- (void)updateGestureRecognizerDependencies
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id obj;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[PDFTextInputView gestureRecognizers](self, "gestureRecognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gestureRecognizers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v18 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v19;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_17;
LABEL_16:
                objc_msgSend(v9, "requireGestureRecognizerToFail:", v15);
                goto LABEL_17;
              }
              v16 = objc_msgSend(v9, "numberOfTapsRequired");
              if (v16 == objc_msgSend(v15, "numberOfTapsRequired"))
                goto LABEL_16;
LABEL_17:
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

}

- (id)_selectionForTextRange:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pdfView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "isLocked") & 1) == 0)
    {
      objc_msgSend(v4, "start");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "end");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "page");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "offset");
      objc_msgSend(v11, "page");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectionFromPage:atCharacterIndex:toPage:atCharacterIndex:", v12, v13, v14, objc_msgSend(v11, "offset") - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)textInRange:(id)a3
{
  void *v3;
  void *v4;

  -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UITextRange)selectedTextRange
{
  return self->_textSelectionRange;
}

- (void)setSelectedTextRange:(id)a3
{
  void *v5;
  void *v6;
  UITextRange **p_textSelectionRange;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_textSelectionRange = &self->_textSelectionRange;
  -[UITextRange start](self->_textSelectionRange, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "page");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v9)
  {
    objc_msgSend(v26, "start");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "offset");
    -[UITextRange start](*p_textSelectionRange, "start");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == objc_msgSend(v12, "offset"))
    {
      objc_msgSend(v26, "end");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "page");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextRange end](*p_textSelectionRange, "end");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "page");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v15)
      {
        objc_msgSend(v26, "end");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "offset");
        -[UITextRange end](*p_textSelectionRange, "end");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "offset");

        if (v24 == v23)
          goto LABEL_11;
        goto LABEL_7;
      }

    }
    v9 = v6;
  }

LABEL_7:
  objc_storeStrong((id *)&self->_textSelectionRange, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "document");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && (objc_msgSend(v18, "isLocked") & 1) == 0)
  {
    -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCurrentSelection:updateTextInput:", v20, 0);

  }
LABEL_11:

}

- (UITextPosition)beginningOfDocument
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  PDFTextPosition *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "isLocked") & 1) != 0)
    goto LABEL_10;
  v6 = (PDFTextPosition *)objc_msgSend(v5, "pageCount");
  if (v6)
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v5, "pageAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectionForAll");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfTextRangesOnPage:", v8);

      if (v10)
        break;

      if (v6 == (PDFTextPosition *)++v7)
        goto LABEL_10;
    }
    if (v8)
    {
      v6 = -[PDFTextPosition initWithOffset:onPage:]([PDFTextPosition alloc], "initWithOffset:onPage:", 0, v8);

      goto LABEL_11;
    }
LABEL_10:
    v6 = 0;
  }
LABEL_11:

  return (UITextPosition *)v6;
}

- (UITextPosition)endOfDocument
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  PDFTextPosition *v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if ((objc_msgSend(v4, "isLocked") & 1) != 0)
    goto LABEL_10;
  v6 = objc_msgSend(v5, "pageCount");
  if (v6 < 1)
    goto LABEL_10;
  v7 = v6 + 1;
  while (1)
  {
    objc_msgSend(v5, "pageAtIndex:", v7 - 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectionForAll");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfTextRangesOnPage:", v8);

    if (v10)
      break;

    if ((unint64_t)--v7 <= 1)
      goto LABEL_10;
  }
  if (v8)
  {
    objc_msgSend(v8, "selectionForAll");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeAtIndex:onPage:", objc_msgSend(v11, "numberOfTextRangesOnPage:", v8) - 1, v8);
    v14 = -[PDFTextPosition initWithOffset:onPage:]([PDFTextPosition alloc], "initWithOffset:onPage:", v12 + v13, v8);

  }
  else
  {
LABEL_10:
    v14 = 0;
  }

  return (UITextPosition *)v14;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PDFTextRange initFromPos:toPos:]([PDFTextRange alloc], "initFromPos:toPos:", v6, v5);

  return v7;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return -[PDFTextInputView positionFromPosition:inDirection:offset:](self, "positionFromPosition:inDirection:offset:", a3, 2, a4);
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  PDFTextPosition *v12;
  PDFTextPosition *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  PDFTextPosition *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  v7 = a3;
  if (a5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pdfView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (objc_msgSend(v10, "isLocked") & 1) == 0)
    {
      objc_msgSend(v7, "page");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "offset");
      objc_msgSend(v7, "page");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectionFromPage:atCharacterIndex:toPage:atCharacterIndex:", v15, v16, v17, objc_msgSend(v7, "offset"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (a5 < 0)
      {
        objc_msgSend(v18, "extendSelectionAtStart:", -a5);
        objc_msgSend(v18, "pages");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v18, "rangeAtIndex:onPage:", 0, v20);
        v24 = [PDFTextPosition alloc];
        v25 = v27;
      }
      else
      {
        objc_msgSend(v18, "extendSelectionAtEnd:", a5);
        objc_msgSend(v18, "pages");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v18, "rangeAtIndex:onPage:", objc_msgSend(v18, "numberOfTextRangesOnPage:", v20) - 1, v20);
        v23 = v22;
        v24 = [PDFTextPosition alloc];
        v25 = v23 + v21 - 1;
      }
      v12 = -[PDFTextPosition initWithOffset:onPage:](v24, "initWithOffset:onPage:", v25, v20);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v13 = [PDFTextPosition alloc];
    v14 = objc_msgSend(v7, "offset");
    objc_msgSend(v7, "page");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PDFTextPosition initWithOffset:onPage:](v13, "initWithOffset:onPage:", v14, v9);
  }

  return v12;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v7, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexForPage:", v8);

  v11 = v6;
  objc_msgSend(v11, "page");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexForPage:", v12);

  if (v10 < v14)
  {
LABEL_5:
    v15 = -1;
    goto LABEL_6;
  }
  if (v10 <= v14)
  {
    v16 = objc_msgSend(v7, "offset");
    if (v16 >= objc_msgSend(v11, "offset"))
    {
      v18 = objc_msgSend(v7, "offset");
      v15 = v18 > objc_msgSend(v11, "offset");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v15 = 1;
LABEL_6:

  return v15;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isLocked") & 1) == 0)
  {
    v13 = v6;
    if (v7)
    {
      v14 = v7;
    }
    else
    {
      -[PDFTextInputView endOfDocument](self, "endOfDocument");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    objc_msgSend(v13, "page");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "offset");
    objc_msgSend(v15, "page");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v15;
    objc_msgSend(v11, "selectionFromPage:atCharacterIndex:toPage:atCharacterIndex:", v16, v17, v18, objc_msgSend(v15, "offset"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v19, "pages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v21)
    {
      v22 = v21;
      v34 = v13;
      v35 = v9;
      v36 = v7;
      v37 = v6;
      v23 = 0;
      v24 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v27 = objc_msgSend(v19, "numberOfTextRangesOnPage:", v26);
          if (v27)
          {
            v28 = v27;
            for (j = 0; j != v28; ++j)
            {
              objc_msgSend(v19, "rangeAtIndex:onPage:", j, v26);
              v23 += v30;
            }
          }
          objc_msgSend(v19, "pages");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 != v32)
            ++v23;
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v22);
      v12 = v23 - 1;
      v7 = v36;
      v6 = v37;
      v13 = v34;
      v9 = v35;
    }
    else
    {
      v12 = -1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (UITextInputDelegate)inputDelegate
{
  return self->_textInputDelegate;
}

- (void)setInputDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_textInputDelegate, a3);
}

- (UITextInputTokenizer)tokenizer
{
  return self->_textInputTokenizer;
}

- (void)setTokenizer:(id)a3
{
  objc_storeStrong((id *)&self->_textInputTokenizer, a3);
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    objc_msgSend(v5, "start");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 2)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "end");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PDFTextInputView positionFromPosition:inDirection:offset:](self, "positionFromPosition:inDirection:offset:", v6, a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFTextInputView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)firstRectForRange:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "isLocked"))
  {
    -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "pages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "firstSpanBoundsForPage:", v16);
      objc_msgSend(v6, "convertRect:fromPage:", v16);
      objc_msgSend(v6, "convertRect:toView:", self);
      v9 = v17;
      v10 = v18;
      v11 = v19;
      v12 = v20;

    }
    else
    {
      v9 = *MEMORY[0x24BDBF070];
      v10 = *(double *)(MEMORY[0x24BDBF070] + 8);
      v11 = *(double *)(MEMORY[0x24BDBF070] + 16);
      v12 = *(double *)(MEMORY[0x24BDBF070] + 24);
    }

  }
  else
  {
    v9 = *MEMORY[0x24BDBF070];
    v10 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "isLocked"))
  {
    v13 = v4;
    objc_msgSend(v13, "page");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "offset");

    objc_msgSend(v8, "selectionFromPage:atCharacterIndex:toPage:atCharacterIndex:", v14, v15, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "boundsForPage:", v14);
    objc_msgSend(v6, "convertRect:fromPage:", v14);
    objc_msgSend(v6, "convertRect:toView:", self);
    v9 = v17;
    v10 = v18;
    v11 = v19;
    v12 = v20;

  }
  else
  {
    v9 = *MEMORY[0x24BDBF070];
    v10 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PDFTextSelectionRect *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  PDFTextInputView *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isLocked") & 1) == 0)
  {
    -[PDFTextInputView _selectionForTextRange:](v31, "_selectionForTextRange:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v29 = v8;
      v30 = v4;
      v28 = v10;
      objc_msgSend(v10, "selectionsByLine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v17, "pages");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "boundsForPage:", v19);
            objc_msgSend(v6, "convertRect:fromPage:", v19);
            objc_msgSend(v6, "convertRect:toView:", v31);
            v24 = -[PDFTextSelectionRect initWithRect:onPage:]([PDFTextSelectionRect alloc], "initWithRect:onPage:", v19, v20, v21, v22, v23);
            objc_msgSend(v12, "firstObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17 == v25)
              -[PDFTextSelectionRect setIsStartingRect:](v24, "setIsStartingRect:", 1);
            objc_msgSend(v12, "lastObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17 == v26)
              -[PDFTextSelectionRect setIsEndingRect:](v24, "setIsEndingRect:", 1);
            objc_msgSend(v9, "addObject:", v24);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v14);
      }

      v8 = v29;
      v4 = v30;
      v10 = v28;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  PDFTextPosition *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isLocked") & 1) == 0)
  {
    -[PDFTextInputView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
    v14 = v13;
    v16 = v15;
    objc_msgSend(v9, "pageForPoint:nearest:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v7, "start");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "end");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v18, "page");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v11, "indexForPage:", v20);

      objc_msgSend(v19, "page");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v11, "indexForPage:", v22);

      v24 = objc_msgSend(v11, "indexForPage:", v17);
      v12 = 0;
      if (v24 < v21 || v24 > v23)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    objc_msgSend(v9, "convertPoint:toPage:", v17, v14, v16);
    v26 = v25;
    v28 = v27;
    objc_msgSend(v17, "selectionForCharacterAtPoint:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = objc_msgSend(v29, "rangeAtIndex:onPage:", 0, v17);
    }
    else
    {
      v31 = objc_msgSend(v17, "characterIndexNearestPoint:", v26, v28);
      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    v12 = -[PDFTextPosition initWithOffset:onPage:]([PDFTextPosition alloc], "initWithOffset:onPage:", v31, v17);
    goto LABEL_14;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return -[PDFTextInputView _closestPositionToPoint:withinRange:](self, "_closestPositionToPoint:withinRange:", 0, a3.x, a3.y);
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PDFTextInputView _closestPositionToPoint:withinRange:](self, "_closestPositionToPoint:withinRange:", 0, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFTextInputView positionFromPosition:offset:](self, "positionFromPosition:offset:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PDFTextRange initFromPos:toPos:]([PDFTextRange alloc], "initFromPos:toPos:", v4, v5);

  return v6;
}

- (BOOL)_allowAnimatedUpdateSelectionRectViews
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -1;
}

- (BOOL)isSecureTextEntry
{
  return 0;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2, a3, a4);
}

- (UITextRange)markedTextRange
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2);
  return 0;
}

- (NSDictionary)markedTextStyle
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2);
  return 0;
}

- (void)setMarkedTextStyle:(id)a3
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2, a3);
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2, a3, a4.location, a4.length);
}

- (void)unmarkText
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2);
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2, a3, a4);
}

- (BOOL)hasText
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2);
  return 0;
}

- (void)insertText:(id)a3
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2, a3);
}

- (void)deleteBackward
{
  NSLog(CFSTR("PDFKit UITextInput Delegate method should never be called: not an interactive text view"), a2);
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  y = a4.y;
  x = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "isLocked") & 1) != 0
    || objc_msgSend(v8, "isInMarkupMode") && !objc_msgSend(v8, "isTextSelectionEnabled"))
  {
    LOBYTE(v18) = 0;
  }
  else
  {
    -[PDFTextInputView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    v12 = v11;
    v14 = v13;
    objc_msgSend(v8, "pageForPoint:nearest:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v8, "convertPoint:toPage:", v15, v12, v14);
      objc_msgSend(v15, "annotationAtPoint:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForAnnotationKey:", CFSTR("/FT"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("/Tx")) & 1) != 0)
        LOBYTE(v18) = 0;
      else
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/Ch")) ^ 1;

    }
    else
    {
      LOBYTE(v18) = 0;
    }

  }
  return v18;
}

- (id)linkRegionsConstrainedToLineAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  double width;
  double height;
  void *v34;
  void *v36;
  void *v37;
  PDFTextInputView *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;

  y = a3.y;
  x = a3.x;
  v45 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = self;
  -[PDFTextInputView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "pageForPoint:nearest:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "convertPoint:toPage:", v12, v9, v11);
    objc_msgSend(v12, "selectionForLineAtPoint:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v36 = v13;
      objc_msgSend(v13, "boundsForPage:", v12);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v39 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v37 = v12;
      objc_msgSend(v12, "annotations");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v41 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v27, "valueForAnnotationKey:", CFSTR("/Subtype"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("/Link"));

            if (v29)
            {
              objc_msgSend(v27, "bounds");
              v30 = v46.origin.x;
              v31 = v46.origin.y;
              width = v46.size.width;
              height = v46.size.height;
              v47.origin.x = v15;
              v47.origin.y = v17;
              v47.size.width = v19;
              v47.size.height = v21;
              if (PDFRectIntersectsRect(v46, v47))
              {
                objc_msgSend(v7, "convertRect:fromPage:", v37, v30, v31, width, height);
                objc_msgSend(v7, "convertRect:toView:", v38);
                objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "addObject:", v34);

              }
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v24);
      }

      v13 = v36;
      v12 = v37;
    }
    else
    {
      v39 = 0;
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (void)_setDimmingViewVisible:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 dimmingViewVisible;
  id WeakRetained;
  void *v7;
  void *v8;
  UITextSearchingDimmingView *searchDimmingView;
  id v11;
  UITextSearchingDimmingView *v12;
  UITextSearchingDimmingView *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = a3;
  dimmingViewVisible = self->_dimmingViewVisible;
  self->_dimmingViewVisible = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (dimmingViewVisible || !v3)
  {
    if (dimmingViewVisible && !v3)
    {
      v15[4] = self;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __43__PDFTextInputView__setDimmingViewVisible___block_invoke_2;
      v16[3] = &unk_24C25C350;
      v16[4] = self;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __43__PDFTextInputView__setDimmingViewVisible___block_invoke_3;
      v15[3] = &unk_24C25C8E8;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v16, v15, 0.2);
    }
  }
  else
  {
    searchDimmingView = self->_searchDimmingView;
    if (!searchDimmingView)
    {
      v11 = objc_alloc(MEMORY[0x24BDF6EE8]);
      objc_msgSend(v8, "bounds");
      v12 = (UITextSearchingDimmingView *)objc_msgSend(v11, "initWithFrame:");
      v13 = self->_searchDimmingView;
      self->_searchDimmingView = v12;

      searchDimmingView = self->_searchDimmingView;
    }
    -[UITextSearchingDimmingView superview](searchDimmingView, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      objc_msgSend(v8, "addSubview:", self->_searchDimmingView);
    -[UITextSearchingDimmingView setAlpha:](self->_searchDimmingView, "setAlpha:", 0.0);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __43__PDFTextInputView__setDimmingViewVisible___block_invoke;
    v17[3] = &unk_24C25C350;
    v17[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v17, 0, 0.2, 0.0);
  }
  if (v3)
    objc_msgSend(v8, "bringSubviewToFront:", self->_searchDimmingView);

}

uint64_t __43__PDFTextInputView__setDimmingViewVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 1.0);
}

uint64_t __43__PDFTextInputView__setDimmingViewVisible___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 0.0);
}

uint64_t __43__PDFTextInputView__setDimmingViewVisible___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 472), "removeFromSuperview");
  return result;
}

- (id)_targetedPreviewForRange:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v7;
  objc_msgSend(v7, "boundsForPage:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v6, "convertRect:fromPage:", v9);
  v46 = v18;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = PDFScreenGetBackingScaleFactor() * (v21 / v15);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", v22, v24);
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __45__PDFTextInputView__targetedPreviewForRange___block_invoke;
  v52[3] = &unk_24C25C910;
  v43 = v9;
  v44 = v26;
  v53 = v43;
  v54 = v11;
  v55 = v13;
  v56 = v15;
  v57 = v17;
  v58 = v25;
  objc_msgSend(v26, "imageWithActions:", v52);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v27);
  objc_msgSend(v28, "setFrame:", v46, v20, v22, v24);
  objc_msgSend(v28, "setClipsToBounds:", 1);
  v47 = v4;
  -[PDFTextInputView selectionRectsForRange:](self, "selectionRectsForRange:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v31 = v29;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v49;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v49 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)MEMORY[0x24BDD1968];
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v35), "rect");
        objc_msgSend(v36, "valueWithCGRect:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v37);

        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x24BDF6EB0], "preferredPreviewParametersForTextLineRects:", v30);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc(MEMORY[0x24BDF6CD0]);
  objc_msgSend(v6, "frame");
  UIRectGetCenter();
  v40 = (void *)objc_msgSend(v39, "initWithContainer:center:", v6);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E90]), "initWithView:parameters:target:", v28, v38, v40);

  return v41;
}

uint64_t __45__PDFTextInputView__targetedPreviewForRange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "boundsForBox:", 0);
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v12, v5 - *(double *)(a1 + 40), v6 - *(double *)(a1 + 48));
  CGAffineTransformMakeScale(&t2, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 72));
  v9 = v12;
  CGAffineTransformConcat(&v11, &v9, &t2);
  v12 = v11;
  v7 = objc_msgSend(v4, "CGContext");

  v11 = v12;
  CGContextSetCTM();
  return objc_msgSend(*(id *)(a1 + 32), "drawWithBox:toContext:", 0, v7);
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v7 = a4;
  -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "compare:", v9);
  return v10;
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  PDFTextInputDelegate **p_delegate;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  PDFTextSearchAggregator *v15;
  PDFTextSearchAggregator *activeSearch;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  p_delegate = &self->_delegate;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "document");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFTextSearchAggregator invalidate](self->_activeSearch, "invalidate");
  v15 = -[PDFTextSearchAggregator initWithSearchString:aggregator:]([PDFTextSearchAggregator alloc], "initWithSearchString:aggregator:", v11, v9);

  activeSearch = self->_activeSearch;
  self->_activeSearch = v15;

  v19[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "stringCompareOptions");

  objc_msgSend(v14, "asyncFindStrings:withOptions:withDelegate:onQueue:", v17, v18, self->_activeSearch, MEMORY[0x24BDAC9B8]);
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UITextHighlightView *searchHighlightView;
  uint64_t v18;
  id v19;
  UITextHighlightView *v20;
  UITextHighlightView *v21;
  NSMutableArray *foundTextRanges;
  NSMutableArray *v23;
  NSMutableArray *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  id location;

  v9 = a3;
  v10 = a4;
  if (a5 == 1)
  {
    foundTextRanges = self->_foundTextRanges;
    if (!foundTextRanges)
    {
      v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v24 = self->_foundTextRanges;
      self->_foundTextRanges = v23;

      foundTextRanges = self->_foundTextRanges;
    }
    -[NSMutableArray addObject:](foundTextRanges, "addObject:", v9);
  }
  else if (a5 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pdfView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_highlightedTextRange, a3);
    -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "pages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "boundsForPage:", v16);
      objc_msgSend(v12, "goToRect:onPage:", v16);

    }
    searchHighlightView = self->_searchHighlightView;
    v18 = MEMORY[0x24BDAC760];
    if (!searchHighlightView)
    {
      objc_initWeak(&location, self);
      v19 = objc_alloc(MEMORY[0x24BDF6EB0]);
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __65__PDFTextInputView_decorateFoundTextRange_inDocument_usingStyle___block_invoke;
      v26[3] = &unk_24C25C938;
      objc_copyWeak(&v27, &location);
      v20 = (UITextHighlightView *)objc_msgSend(v19, "initWithPreviewProvider:", v26);
      v21 = self->_searchHighlightView;
      self->_searchHighlightView = v20;

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
      searchHighlightView = self->_searchHighlightView;
    }
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __65__PDFTextInputView_decorateFoundTextRange_inDocument_usingStyle___block_invoke_2;
    v25[3] = &unk_24C25C350;
    v25[4] = self;
    -[UITextHighlightView animateWithCompletion:](searchHighlightView, "animateWithCompletion:", v25);

  }
  -[PDFTextInputView setNeedsLayout](self, "setNeedsLayout");

}

id __65__PDFTextInputView_decorateFoundTextRange_inDocument_usingStyle___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_targetedPreviewForRange:", WeakRetained[60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __65__PDFTextInputView_decorateFoundTextRange_inDocument_usingStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 416));
  objc_msgSend(WeakRetained, "pdfView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFindNavigatorVisible");

  if ((v5 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "fadeAwayWithCompletion:", 0);
}

- (void)clearAllDecoratedFoundText
{
  UITextRange *highlightedTextRange;

  highlightedTextRange = self->_highlightedTextRange;
  self->_highlightedTextRange = 0;

  -[NSMutableArray removeAllObjects](self->_foundTextRanges, "removeAllObjects");
  -[PDFTextInputView _setDimmingViewVisible:](self, "_setDimmingViewVisible:", 0);
  -[PDFTextInputView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UITextHighlightView *searchHighlightView;
  void *v26;
  void *v27;
  double y;
  double x;
  double height;
  double width;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  NSMutableArray *obj;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v71 = *MEMORY[0x24BDAC8D0];
  v67.receiver = self;
  v67.super_class = (Class)PDFTextInputView;
  -[PDFTextInputView layoutSubviews](&v67, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "documentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v6;
  v51 = v4;
  if (-[NSMutableArray count](self->_foundTextRanges, "count")
    && (objc_msgSend(v4, "findInteraction"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isFindNavigatorVisible"),
        v7,
        v8))
  {
    -[PDFTextInputView _setDimmingViewVisible:](self, "_setDimmingViewVisible:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = self->_foundTextRanges;
    v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v54)
    {
      v53 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v64 != v53)
            objc_enumerationMutation(obj);
          -[PDFTextInputView selectionRectsForRange:](self, "selectionRectsForRange:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v60;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v60 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "rect");
                objc_msgSend(v5, "convertRect:fromView:", self);
                objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v16);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
            }
            while (v13);
          }

        }
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      }
      while (v54);
    }

    v6 = v50;
    objc_msgSend(v50, "contentSize");
    v18 = v17;
    objc_msgSend(v5, "bounds");
    if (v18 >= v19)
      v20 = v18;
    else
      v20 = v19;
    objc_msgSend(v50, "contentSize");
    v22 = v21;
    objc_msgSend(v5, "bounds");
    if (v22 >= v23)
      v24 = v22;
    else
      v24 = v23;
    -[UITextSearchingDimmingView setFrame:](self->_searchDimmingView, "setFrame:", -800.0, -800.0, v20 + 1600.0, v24 + 1600.0);
    -[UITextSearchingDimmingView setTextRects:](self->_searchDimmingView, "setTextRects:", v9);
    -[UITextSearchingDimmingView setContentInset:](self->_searchDimmingView, "setContentInset:", -800.0, -800.0, -800.0, -800.0);

    v4 = v51;
  }
  else
  {
    -[PDFTextInputView _setDimmingViewVisible:](self, "_setDimmingViewVisible:", 0);
  }
  searchHighlightView = self->_searchHighlightView;
  if (self->_highlightedTextRange)
  {
    -[UITextHighlightView superview](searchHighlightView, "superview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      objc_msgSend(v5, "addSubview:", self->_searchHighlightView);
    -[PDFTextInputView selectionRectsForRange:](self, "selectionRectsForRange:", self->_highlightedTextRange);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v33 = v27;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v56 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
          objc_msgSend(v38, "rect");
          v74.origin.x = v39;
          v74.origin.y = v40;
          v74.size.width = v41;
          v74.size.height = v42;
          v72.origin.x = x;
          v72.origin.y = y;
          v72.size.width = width;
          v72.size.height = height;
          v73 = CGRectUnion(v72, v74);
          x = v73.origin.x;
          y = v73.origin.y;
          width = v73.size.width;
          height = v73.size.height;
          v43 = (void *)MEMORY[0x24BDD1968];
          objc_msgSend(v38, "rect");
          objc_msgSend(v43, "valueWithCGRect:");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v44);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v35);
    }

    objc_msgSend(MEMORY[0x24BDF6EB0], "preferredPreviewParametersForTextLineRects:", v32);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_textPathInsets");
    objc_msgSend(v5, "convertRect:fromView:", self, x + v49, y + v46, width - (v49 + v47), height - (v46 + v48));
    -[UITextHighlightView setFrame:](self->_searchHighlightView, "setFrame:");
    -[UITextHighlightView invalidateContentView](self->_searchHighlightView, "invalidateContentView");
    objc_msgSend(v5, "bringSubviewToFront:", self->_searchHighlightView);

    v6 = v50;
    v4 = v51;
  }
  else
  {
    -[UITextHighlightView removeFromSuperview](searchHighlightView, "removeFromSuperview");
  }

}

- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pdfView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFTextInputView _selectionForTextRange:](self, "_selectionForTextRange:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "renderingProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isUsingPDFExtensionView");

  if (v12)
  {
    if (v10 && (objc_msgSend(v10, "isEmpty") & 1) == 0)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v10, "pages", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v51;
LABEL_6:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v51 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v17);
          objc_msgSend(v9, "document");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "indexForPage:", v18);

          objc_msgSend(v9, "pageViewForPageAtIndex:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isVisible") & 1) != 0)
            break;

          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
            if (v15)
              goto LABEL_6;
            goto LABEL_12;
          }
        }

        if (!v21)
          goto LABEL_21;
        objc_msgSend(v21, "page");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "boundsForPage:", v28);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;

        objc_msgSend(v21, "page");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "convertRect:fromPage:", v37, v30, v32, v34, v36);
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = CFSTR("visible");
        v54[1] = CFSTR("selectionRect");
        v55[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v39, v41, v43, v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v47;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "postNotificationName:object:userInfo:", CFSTR("PDFTextSelectionShowTextSelectionMenu"), v9, v48);

      }
      else
      {
LABEL_12:
        v21 = v13;
      }

    }
LABEL_21:
    objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithChildren:", MEMORY[0x24BDBD1A8]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "controller");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "additionalEditMenuElementsForSelection:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      v25 = objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_2);
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
        v25 = objc_msgSend(v7, "count") - 1;
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v25 + 1, objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "insertObjects:atIndexes:", v24, v26);

    }
    objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithChildren:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v27;
}

uint64_t __58__PDFTextInputView_editMenuForTextRange_suggestedActions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDF7BD0]);
    if ((_DWORD)v7)
      *a4 = 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSearch, 0);
  objc_storeStrong((id *)&self->_foundTextRanges, 0);
  objc_storeStrong((id *)&self->_highlightedTextRange, 0);
  objc_storeStrong((id *)&self->_searchDimmingView, 0);
  objc_storeStrong((id *)&self->_searchHighlightView, 0);
  objc_storeStrong((id *)&self->_textInputTokenizer, 0);
  objc_storeStrong((id *)&self->_textInputDelegate, 0);
  objc_storeStrong((id *)&self->_textInteraction, 0);
  objc_storeStrong((id *)&self->_textSelectionRange, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
