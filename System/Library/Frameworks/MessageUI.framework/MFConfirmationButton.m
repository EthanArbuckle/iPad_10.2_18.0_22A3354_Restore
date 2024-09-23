@implementation MFConfirmationButton

+ (MFConfirmationButton)confirmationButtonWithMessage:(id)a3 confirmationLabel:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "buttonWithType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConfirmationType:", 0);
  objc_msgSend(v11, "setConfirmationSelectionMode:", 0);
  objc_msgSend(v11, "setConfirmationMessage:", v8);
  objc_msgSend(v11, "setConfirmationLabel:", v9);
  objc_msgSend(v11, "setHandlerBlock:", v10);
  objc_msgSend(v11, "_confirmationMenu");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMenu:", v12);

  return (MFConfirmationButton *)v11;
}

- (void)setConfirmationType:(unint64_t)a3
{
  self->_confirmationType = a3;
  -[MFConfirmationButton _updateButtonAction](self, "_updateButtonAction");
}

- (void)setConfirmationSelectionMode:(unint64_t)a3
{
  self->_confirmationSelectionMode = a3;
  -[MFConfirmationButton _updateButtonAction](self, "_updateButtonAction");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFConfirmationButton;
  -[MFDimmableButton setSelected:](&v4, sel_setSelected_, a3);
  -[MFConfirmationButton _updateButtonAction](self, "_updateButtonAction");
}

- (void)setConfirmationIcon:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_confirmationIcon, a3);
  -[MFConfirmationButton _confirmationMenu](self, "_confirmationMenu");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFConfirmationButton setMenu:](self, "setMenu:");

}

- (void)_updateButtonAction
{
  _BOOL8 v3;

  v3 = -[MFConfirmationButton _isInConfirmableState](self, "_isInConfirmableState");
  -[MFConfirmationButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", v3);
  -[MFConfirmationButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", v3);
  if (v3)
    -[MFConfirmationButton removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", self, sel__didConfirm, 64);
  else
    -[MFConfirmationButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__didConfirm, 64);
}

- (BOOL)_isInConfirmableState
{
  unint64_t v4;

  if (-[MFConfirmationButton confirmationType](self, "confirmationType") == 1
    && -[MFConfirmationButton hasPresentedConfirmation](self, "hasPresentedConfirmation"))
  {
    return 0;
  }
  v4 = -[MFConfirmationButton confirmationSelectionMode](self, "confirmationSelectionMode");
  if (v4 == 2)
    return -[MFConfirmationButton isSelected](self, "isSelected");
  if (v4 == 1)
    return -[MFConfirmationButton isSelected](self, "isSelected") ^ 1;
  return 1;
}

- (void)reset
{
  -[MFConfirmationButton setSelected:](self, "setSelected:", 0);
  -[MFConfirmationButton setHasPresentedConfirmation:](self, "setHasPresentedConfirmation:", 0);
  -[MFConfirmationButton _updateButtonAction](self, "_updateButtonAction");
}

- (id)_confirmationMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  -[MFConfirmationButton confirmationLabel](self, "confirmationLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConfirmationButton confirmationIcon](self, "confirmationIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __41__MFConfirmationButton__confirmationMenu__block_invoke;
  v15 = &unk_1E5A666D8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC39D0];
  -[MFConfirmationButton confirmationMessage](self, "confirmationMessage", v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithTitle:children:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v10;
}

void __41__MFConfirmationButton__confirmationMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didConfirm");

}

- (void)_didConfirm
{
  void *v3;
  void (**v4)(void);

  if (-[MFConfirmationButton confirmationSelectionMode](self, "confirmationSelectionMode"))
    -[MFConfirmationButton setSelected:](self, "setSelected:", -[MFConfirmationButton isSelected](self, "isSelected") ^ 1);
  -[MFConfirmationButton handlerBlock](self, "handlerBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MFConfirmationButton handlerBlock](self, "handlerBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__MFConfirmationButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v12[3] = &unk_1E5A66CB8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v10, "addCompletion:", v12);
  v11.receiver = self;
  v11.super_class = (Class)MFConfirmationButton;
  -[MFConfirmationButton contextMenuInteraction:willEndForConfiguration:animator:](&v11, sel_contextMenuInteraction_willEndForConfiguration_animator_, v8, v9, v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __80__MFConfirmationButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasPresentedConfirmation:", 1);

}

- (unint64_t)confirmationType
{
  return self->_confirmationType;
}

- (unint64_t)confirmationSelectionMode
{
  return self->_confirmationSelectionMode;
}

- (NSString)confirmationMessage
{
  return self->_confirmationMessage;
}

- (void)setConfirmationMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 784);
}

- (NSString)confirmationLabel
{
  return self->_confirmationLabel;
}

- (void)setConfirmationLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 792);
}

- (UIImage)confirmationIcon
{
  return self->_confirmationIcon;
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (BOOL)hasPresentedConfirmation
{
  return self->_hasPresentedConfirmation;
}

- (void)setHasPresentedConfirmation:(BOOL)a3
{
  self->_hasPresentedConfirmation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_confirmationIcon, 0);
  objc_storeStrong((id *)&self->_confirmationLabel, 0);
  objc_storeStrong((id *)&self->_confirmationMessage, 0);
}

@end
