@implementation PKTextInputKeyboardAssistantItem

- (PKTextInputKeyboardAssistantItem)init
{
  id v2;
  void *v3;
  PKPaletteFloatingKeyboardController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKTextInputKeyboardAssistantItem;
  v2 = -[UIBarItem init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "pk_keyboardButtonImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setImage:", v3);

    objc_msgSend(v2, "setTarget:", v2);
    objc_msgSend(v2, "setAction:", sel_didAction_);
    v4 = objc_alloc_init(PKPaletteFloatingKeyboardController);
    v5 = (void *)*((_QWORD *)v2 + 54);
    *((_QWORD *)v2 + 54) = v4;

    -[PKPaletteFloatingKeyboardController setDelegate:](*((_QWORD *)v2 + 54), v2);
    objc_initWeak(&location, v2);
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__PKTextInputKeyboardAssistantItem_init__block_invoke;
    v13[3] = &unk_1E777CAC0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v2, "_setSecondaryActionsProvider:", v13);
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __40__PKTextInputKeyboardAssistantItem_init__block_invoke_2;
    v11[3] = &unk_1E7778F90;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "registerObserver:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v2 + 52);
    *((_QWORD *)v2 + 52) = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return (PKTextInputKeyboardAssistantItem *)v2;
}

id __40__PKTextInputKeyboardAssistantItem_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageSelectionMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "floatingKeyboardController");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKPaletteKeyboardUtilities combinedMenuFromKeyboardMenu:withLanguageMenu:](PKPaletteKeyboardUtilities, "combinedMenuFromKeyboardMenu:withLanguageMenu:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __40__PKTextInputKeyboardAssistantItem_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *WeakRetained;
  id *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "floatingKeyboardController");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKPaletteKeyboardUtilities combinedMenuFromKeyboardMenu:withLanguageMenu:](PKPaletteKeyboardUtilities, "combinedMenuFromKeyboardMenu:withLanguageMenu:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setMenu:", v10);
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 51, a2);
    objc_msgSend(WeakRetained, "_updateImageAndNotify");
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PKTextInputLanguageSelectionToken invalidate](self->_observerToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKTextInputKeyboardAssistantItem;
  -[PKTextInputKeyboardAssistantItem dealloc](&v3, sel_dealloc);
}

- (void)didAction:(id)a3
{
  id v3;

  -[PKTextInputKeyboardAssistantItem floatingKeyboardController](self, "floatingKeyboardController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]((uint64_t)v3);

}

- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4
{
  self->_floatingKeyboardType = a4;
  -[PKTextInputKeyboardAssistantItem _updateImageAndNotify](self, "_updateImageAndNotify", a3);
}

- (void)_updateImageAndNotify
{
  UIImage *indicatorImage;
  UIImage *v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  UIImage *v12;

  indicatorImage = self->_indicatorImage;
  if (indicatorImage)
  {
    v4 = indicatorImage;
  }
  else
  {
    if (self->_floatingKeyboardType == 1)
      objc_msgSend(MEMORY[0x1E0DC3870], "pk_emojiButtonImage");
    else
      objc_msgSend(MEMORY[0x1E0DC3870], "pk_keyboardButtonImage");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v4;
  -[PKTextInputKeyboardAssistantItem setImage:](self, "setImage:", v4);
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
  {
    -[PKTextInputKeyboardAssistantItem delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration");
      v8 = v7;
      -[PKTextInputKeyboardAssistantItem delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "keyboardAssistantItemAnimateUpdateSymbolDisplay:withDuration:", self, v8);
LABEL_12:

      goto LABEL_13;
    }
  }
  -[PKTextInputKeyboardAssistantItem delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[PKTextInputKeyboardAssistantItem delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyboardAssistantItemUpdateSymbolDisplay:", self);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)didDisplayAssistantItem
{
  id v2;

  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyLanguageDidChange");

}

- (id)responderForFloatingKeyboardController:(id)a3
{
  return +[PKPaletteKeyboardUtilities textInputResponderForEditing](PKPaletteKeyboardUtilities, "textInputResponderForEditing", a3);
}

- (void)floatingKeyboardControllerWillShow:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[PKTextInputKeyboardAssistantItem delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PKTextInputKeyboardAssistantItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyboardAssistantItemWillShowKeyboard:", self);

  }
  -[PKTextInputKeyboardAssistantItem _currentInteraction](self, "_currentInteraction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "textInputPaletteControllerFloatingKeyboardWillShow:", 0);

}

- (void)floatingKeyboardControllerWillHide:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[PKTextInputKeyboardAssistantItem delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PKTextInputKeyboardAssistantItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyboardAssistantItemWillHideKeyboard:", self);

  }
  -[PKTextInputKeyboardAssistantItem _currentInteraction](self, "_currentInteraction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "textInputPaletteControllerFloatingKeyboardWillHide:", 0);

}

- (id)_currentInteraction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKTextInputKeyboardAssistantItem view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_responderWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKTextInputInteraction interactionForScene:](PKTextInputInteraction, "interactionForScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKTextInputKeyboardAssistantItemDelegate)delegate
{
  return (PKTextInputKeyboardAssistantItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaletteFloatingKeyboardController)floatingKeyboardController
{
  return self->_floatingKeyboardController;
}

- (void)setFloatingKeyboardController:(id)a3
{
  objc_storeStrong((id *)&self->_floatingKeyboardController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingKeyboardController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_indicatorImage, 0);
}

@end
