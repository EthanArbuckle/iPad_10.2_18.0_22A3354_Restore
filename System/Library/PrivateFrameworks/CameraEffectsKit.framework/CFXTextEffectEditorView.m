@implementation CFXTextEffectEditorView

+ (id)viewWithFrame:(CGRect)a3 textEditingProperties:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFrame:textEditingProperties:", v9, x, y, width, height);

  return v10;
}

- (CFXTextEffectEditorView)initWithFrame:(CGRect)a3 textEditingProperties:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CFXTextEffectEditorView *v10;
  void *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CFXTextEffectEditorView;
  v10 = -[CFXTextEffectEditorView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXTextEffectEditorView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[CFXTextEffectEditorView CFX_setupTextField:](v10, "CFX_setupTextField:", v9);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_applicationDidEnterBackground_, *MEMORY[0x24BDF75D8], 0);

  }
  return v10;
}

- (void)CFX_setupTextField:(id)a3
{
  id v4;
  JFXTextEffectEditorView *v5;
  JFXTextEffectEditorView *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = [JFXTextEffectEditorView alloc];
  -[CFXTextEffectEditorView bounds](self, "bounds");
  v6 = -[JFXTextEffectEditorView initWithFrame:textEditingProperties:](v5, "initWithFrame:textEditingProperties:", v4);

  -[CFXTextEffectEditorView setEditorView:](self, "setEditorView:", v6);
  -[CFXTextEffectEditorView editorView](self, "editorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editField");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setPasteDelegate:", self);
  objc_msgSend(v9, "setTextDragDelegate:", self);
  -[CFXTextEffectEditorView editorView](self, "editorView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXTextEffectEditorView addSubview:](self, "addSubview:", v8);

}

- (void)selectAtEnd
{
  void *v2;
  void *v3;
  id v4;

  -[CFXTextEffectEditorView editorView](self, "editorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editField");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "becomeFirstResponder");
  objc_msgSend(v4, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedRange:", objc_msgSend(v3, "length"), 0);

}

- (void)selectAll
{
  id v2;

  -[CFXTextEffectEditorView editorView](self, "editorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectAll");

}

- (void)endTextEditing
{
  id v2;

  -[CFXTextEffectEditorView editorView](self, "editorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing");

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[CFXTextEffectEditorView editorView](self, "editorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)applyTextEditingProperties:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CFXTextEffectEditorView editorView](self, "editorView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyTextEditingProperties:", v4);

}

- (CGRect)textEditingFrameRelativeToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double x;
  double y;
  double width;
  double height;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  v4 = a3;
  -[CFXTextEffectEditorView editorView](self, "editorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "textEditingFrame");
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    if (!CGRectIsNull(v23))
    {
      objc_msgSend(v6, "convertRect:toView:", v4, x, y, width, height);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v4, "bounds");
      v27.origin.x = v12;
      v27.origin.y = v14;
      v27.size.width = v16;
      v27.size.height = v18;
      v25 = CGRectIntersection(v24, v27);
      x = v25.origin.x;
      y = v25.origin.y;
      width = v25.size.width;
      height = v25.size.height;
    }
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)textEffectEditorTextViewDidUnmarkText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CFXTextEffectEditorView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textEffectEditorView:textChanged:shouldUpdateTextEditingProperties:", self, v5, 1);
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "markedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  -[CFXTextEffectEditorView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "textEffectEditorView:textChanged:shouldUpdateTextEditingProperties:", self, v7, v6);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  -[CFXTextEffectEditorView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(length) = objc_msgSend(v9, "textEffectEditorView:shouldChangeTextInRange:replacementText:", self, location, length, v8);

  return length;
}

- (BOOL)textPasteConfigurationSupporting:(id)a3 shouldAnimatePasteOfAttributedString:(id)a4 toRange:(id)a5
{
  return 0;
}

- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (CFXTextEffectEditorViewDelegate)delegate
{
  return (CFXTextEffectEditorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (JFXTextEffectEditorView)editorView
{
  return self->_editorView;
}

- (void)setEditorView:(id)a3
{
  objc_storeStrong((id *)&self->_editorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
