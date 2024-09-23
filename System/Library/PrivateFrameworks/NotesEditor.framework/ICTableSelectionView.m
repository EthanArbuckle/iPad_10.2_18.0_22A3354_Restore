@implementation ICTableSelectionView

- (ICTableSelectionView)initWithFrame:(CGRect)a3
{
  ICTableSelectionView *v3;
  ICTableSelectionView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICTableSelectionView;
  v3 = -[ICTableSelectionView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ICTableSelectionView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderWidth:", 2.0);

    v6 = *MEMORY[0x1E0CD2A68];
    -[ICTableSelectionView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerCurve:", v6);

    -[ICTableSelectionView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 2.0);

    -[ICTableSelectionView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)layoutSubviews
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTableSelectionView;
  -[ICTableSelectionView layoutSubviews](&v6, sel_layoutSubviews);
  -[ICTableSelectionView tintColor](self, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[ICTableSelectionView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (void)toggleBoldface:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICTableSelectionView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auxiliaryStylingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleBoldface:", v4);

}

- (void)toggleItalics:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICTableSelectionView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auxiliaryStylingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleItalics:", v4);

}

- (void)toggleUnderline:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICTableSelectionView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auxiliaryStylingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleUnderline:", v4);

}

- (void)strikethrough:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICTableSelectionView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auxiliaryStylingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleStrikethrough:", v4);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  objc_super v5;

  -[ICTableSelectionView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionWillBecomeFirstResponder:", self);

  v5.receiver = self;
  v5.super_class = (Class)ICTableSelectionView;
  return -[ICTableSelectionView becomeFirstResponder](&v5, sel_becomeFirstResponder);
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  if (-[ICTableSelectionView shouldAvoidResigningFirstResponder](self, "shouldAvoidResigningFirstResponder"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICTableSelectionView;
    v3 = -[ICTableSelectionView resignFirstResponder](&v6, sel_resignFirstResponder);
    if (v3)
    {
      -[ICTableSelectionView delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "selectionDidResignFirstResponder:", self);

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v6;
  void *v7;
  int v8;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICTableSelectionView;
  v6 = -[ICTableSelectionView canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, a4);
  -[ICTableSelectionView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isShowingTextStyleOptions");

  if (v8)
    return sel_toggleBoldface_ == a3 || sel_toggleItalics_ == a3 || sel_toggleUnderline_ == a3;
  return v6;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 1572864, sel_addRowUp_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 1572864, sel_addRowDown_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E10], 1572864, sel_addColumnLeft_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E28], 1572864, sel_addColumnRight_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("c"), 0x100000, sel_copy_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0, sel_deletePressed_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addRowUp:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICTableSelectionView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICTableSelectionView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRowAboveSelection:", self);

  }
}

- (void)addRowDown:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICTableSelectionView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICTableSelectionView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRowBelowSelection:", self);

  }
}

- (void)addColumnLeft:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICTableSelectionView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICTableSelectionView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addColumnLeftOfSelection:", self);

  }
}

- (void)addColumnRight:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICTableSelectionView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICTableSelectionView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addColumnRightOfSelection:", self);

  }
}

- (void)deletePressed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableSelectionView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteSelection:", v4);

}

- (ICTableSelectionDelegate)delegate
{
  return (ICTableSelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAvoidResigningFirstResponder
{
  return self->_shouldAvoidResigningFirstResponder;
}

- (void)setShouldAvoidResigningFirstResponder:(BOOL)a3
{
  self->_shouldAvoidResigningFirstResponder = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
