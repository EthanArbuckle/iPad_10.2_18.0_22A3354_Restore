@implementation CNComposeRecipientAtom

- (CNComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4
{
  return -[CNComposeRecipientAtom initWithFrame:recipient:presentationOptions:](self, "initWithFrame:recipient:presentationOptions:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CNComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4 presentationOptions:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  CNComposeRecipientAtom *v13;
  CNComposeRecipientAtom *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNComposeRecipientAtom;
  v13 = -[CNAtomView initWithFrame:presentationOptions:separatorStyle:wrappingSupported:](&v17, sel_initWithFrame_presentationOptions_separatorStyle_wrappingSupported_, a5, 0, 0, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_recipient, a4);
    objc_msgSend(v12, "compositeName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomView setTitle:](v14, "setTitle:", v15);

  }
  return v14;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  unsigned int v6;
  id WeakRetained;
  id v8;

  v5 = a4;
  *((_BYTE *)self + 592) = *((_BYTE *)self + 592) & 0xFE | -[CNAtomView isSelected](self, "isSelected");
  *((_BYTE *)self + 592) &= ~2u;
  v6 = objc_msgSend(v5, "modifierFlags");

  *((_BYTE *)self + 592) = *((_BYTE *)self + 592) & 0xFB | (v6 >> 15) & 4;
  if ((*((_BYTE *)self + 592) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = WeakRetained;
    if (((v6 >> 15) & 4) != 0)
      objc_msgSend(WeakRetained, "shiftSelectComposeRecipientAtom:", self);
    else
      objc_msgSend(WeakRetained, "selectComposeRecipientAtom:", self);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((*((_BYTE *)self + 592) & 2) == 0 && (*((_BYTE *)self + 592) & 4) == 0)
  {
    objc_msgSend(v10, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", self);
    -[CNComposeRecipientAtom hitTest:withEvent:](self, "hitTest:withEvent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      *((_BYTE *)self + 592) |= 2u;
      if ((*((_BYTE *)self + 592) & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "deselectComposeRecipientAtom:", self);

      }
    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id WeakRetained;

  *((_BYTE *)self + 592) |= 2u;
  if ((*((_BYTE *)self + 592) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deselectComposeRecipientAtom:", self);

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((*((_BYTE *)self + 592) & 2) == 0)
  {
    if ((*((_BYTE *)self + 592) & 1) != 0)
      -[CNComposeRecipientAtom handleTouchAndHold](self, "handleTouchAndHold");
    else
      -[CNComposeRecipientAtom handleFirstTap](self, "handleFirstTap");
  }

}

- (void)handleTouchAndHold
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeRecipientAtomDisambiguate:", self);

}

- (void)handleFirstTap
{
  void *v3;
  char v4;
  id WeakRetained;

  -[CNComposeRecipientAtom delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "composeRecipientAtomStopDisambiguating");

  }
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB7B0], 0, sel_moveLeft_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB7C8], 0, sel_moveRight_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)CNComposeRecipientAtom;
  -[CNComposeRecipientAtom keyCommands](&v9, sel_keyCommands);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)moveLeft:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeRecipientAtomSelectPrevious:", self);

}

- (void)moveRight:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeRecipientAtomSelectNext:", self);

}

- (id)menuConfigurationForChevronButton
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "menuConfigurationForAtomView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNComposeRecipientAtomDelegate)delegate
{
  return (CNComposeRecipientAtomDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNComposeRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
