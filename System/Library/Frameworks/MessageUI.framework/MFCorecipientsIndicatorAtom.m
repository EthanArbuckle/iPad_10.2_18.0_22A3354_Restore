@implementation MFCorecipientsIndicatorAtom

- (MFCorecipientsIndicatorAtom)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFCorecipientsIndicatorAtom;
  return -[MFModernAtomView initWithFrame:presentationOptions:separatorStyle:wrappingSupported:](&v3, sel_initWithFrame_presentationOptions_separatorStyle_wrappingSupported_, 0, 2, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (MFCorecipientsIndicatorAtom)initWithRecipients:(id)a3
{
  id v4;
  MFCorecipientsIndicatorAtom *v5;
  MFCorecipientsIndicatorAtom *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFCorecipientsIndicatorAtom;
  v5 = -[MFModernAtomView initWithFrame:presentationOptions:separatorStyle:wrappingSupported:](&v8, sel_initWithFrame_presentationOptions_separatorStyle_wrappingSupported_, 0, 2, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[MFCorecipientsIndicatorAtom setRecipients:](v5, "setRecipients:", v4);

  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[MFModernAtomView setSelected:](self, "setSelected:", 1, a4);
  self->_touchesWereCancelled = 0;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", self);
  -[MFCorecipientsIndicatorAtom hitTest:withEvent:](self, "hitTest:withEvent:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    self->_touchesWereCancelled = 1;

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[MFModernAtomView setSelected:](self, "setSelected:", 0, a4);
  self->_touchesWereCancelled = 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!self->_touchesWereCancelled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[MFCorecipientsIndicatorAtom recipients](self, "recipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "didTapShowCorecipientsForIndicatorAtom:recipients:", self, v8);

  }
  -[MFModernAtomView setSelected:](self, "setSelected:", 0);

}

- (MFCorecipientsIndicatorAtomDelegate)delegate
{
  return (MFCorecipientsIndicatorAtomDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
