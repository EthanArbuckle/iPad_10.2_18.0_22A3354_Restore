@implementation _MKPlaceActionButtonController

- (_MKPlaceActionButtonController)initWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5
{
  return -[_MKPlaceActionButtonController initWithTitle:subTitle:analyticsAction:selectedBlock:disabled:symbolName:](self, "initWithTitle:subTitle:analyticsAction:selectedBlock:disabled:symbolName:", a3, a4, 0, a5, 0, 0);
}

- (_MKPlaceActionButtonController)initWithTitle:(id)a3 subTitle:(id)a4 analyticsAction:(int)a5 selectedBlock:(id)a6 disabled:(BOOL)a7 symbolName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _MKPlaceActionButtonController *v19;
  _MKPlaceActionButtonController *v20;
  uint64_t v21;
  NSString *buttonTitle;
  uint64_t v23;
  NSString *buttonSubTitle;
  uint64_t v25;
  id buttonSelectedBlock;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  if (v14)
  {
    v18 = objc_msgSend(v14, "length");
    v19 = 0;
    if (v16 && v18)
    {
      v28.receiver = self;
      v28.super_class = (Class)_MKPlaceActionButtonController;
      v20 = -[_MKPlaceActionButtonController init](&v28, sel_init);
      if (v20)
      {
        v21 = objc_msgSend(v14, "copy");
        buttonTitle = v20->_buttonTitle;
        v20->_buttonTitle = (NSString *)v21;

        v23 = objc_msgSend(v15, "copy");
        buttonSubTitle = v20->_buttonSubTitle;
        v20->_buttonSubTitle = (NSString *)v23;

        v25 = objc_msgSend(v16, "copy");
        buttonSelectedBlock = v20->_buttonSelectedBlock;
        v20->_buttonSelectedBlock = (id)v25;

        v20->_analyticsAction = a5;
        v20->_disabled = a7;
        objc_storeStrong((id *)&v20->_symbolName, a8);
      }
      self = v20;
      v19 = self;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (_MKPlaceActionButtonController)actionButtonControllerWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5
{
  return (_MKPlaceActionButtonController *)objc_msgSend(a1, "actionButtonControllerWithTitle:subTitle:selectedBlock:disabled:symbolName:", a3, a4, a5, 0, 0);
}

+ (_MKPlaceActionButtonController)actionButtonControllerWithTitle:(id)a3 subTitle:(id)a4 selectedBlock:(id)a5 disabled:(BOOL)a6 symbolName:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:subTitle:analyticsAction:selectedBlock:disabled:symbolName:", v15, v14, 0, v13, v7, v12);

  return (_MKPlaceActionButtonController *)v16;
}

- (void)buttonTextChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "placeActionButtonControllerTextDidChange:", self);

}

- (id)infoCardChildPossibleActions
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[_MKPlaceActionButtonController analyticsAction](self, "analyticsAction"))
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_MKPlaceActionButtonController analyticsAction](self, "analyticsAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)buttonSubTitle
{
  return self->_buttonSubTitle;
}

- (id)buttonSelectedBlock
{
  return self->_buttonSelectedBlock;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (_MKPlaceActionControlledButton)delegate
{
  return (_MKPlaceActionControlledButton *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (int)analyticsAction
{
  return self->_analyticsAction;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong(&self->_buttonSelectedBlock, 0);
  objc_storeStrong((id *)&self->_buttonSubTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end
