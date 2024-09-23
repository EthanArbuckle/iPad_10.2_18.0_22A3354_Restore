@implementation MFModernComposeRecipientAtom

- (MFModernComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4
{
  return -[MFModernComposeRecipientAtom initWithFrame:recipient:presentationOptions:](self, "initWithFrame:recipient:presentationOptions:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MFModernComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4 presentationOptions:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  MFModernComposeRecipientAtom *v13;
  MFModernComposeRecipientAtom *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MFModernComposeRecipientAtom;
  v13 = -[MFModernAtomView initWithFrame:presentationOptions:separatorStyle:wrappingSupported:](&v17, sel_initWithFrame_presentationOptions_separatorStyle_wrappingSupported_, a5, 0, 0, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_recipient, a4);
    objc_msgSend(v12, "displayString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomView setTitle:](v14, "setTitle:", v15);

  }
  return v14;
}

- (MFComposeRecipient)recipient
{
  return self->_recipient;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id WeakRetained;

  *((_BYTE *)self + 568) &= ~2u;
  *((_BYTE *)self + 568) &= ~1u;
  if (-[MFModernAtomView isSelected](self, "isSelected", a3, a4))
  {
    *((_BYTE *)self + 568) |= 1u;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "selectComposeRecipientAtom:", self);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", self);
  -[MFModernComposeRecipientAtom hitTest:withEvent:](self, "hitTest:withEvent:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    *((_BYTE *)self + 568) |= 2u;
    if ((*((_BYTE *)self + 568) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "deselectComposeRecipientAtom:", self);

    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id WeakRetained;

  *((_BYTE *)self + 568) |= 2u;
  if ((*((_BYTE *)self + 568) & 1) == 0)
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
  if ((*((_BYTE *)self + 568) & 1) != 0 && (*((_BYTE *)self + 568) & 2) == 0)
    -[MFModernComposeRecipientAtom handleTouchAndHold](self, "handleTouchAndHold");

}

- (void)handleTouchAndHold
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeRecipientAtomShowPersonCard:", self);

}

- (id)keyCommands
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)keyCommands_keyCommands_1;
  if (!keyCommands_keyCommands_1)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E10], 0, sel_moveLeft_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E28], 0, sel_moveRight_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithArray:", v7);

    v13.receiver = self;
    v13.super_class = (Class)MFModernComposeRecipientAtom;
    -[MFModernComposeRecipientAtom keyCommands](&v13, sel_keyCommands);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)keyCommands_keyCommands_1;
    keyCommands_keyCommands_1 = v10;

    v3 = (void *)keyCommands_keyCommands_1;
  }
  return v3;
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

- (MFComposeRecipientAtomDelegate)delegate
{
  return (MFComposeRecipientAtomDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
