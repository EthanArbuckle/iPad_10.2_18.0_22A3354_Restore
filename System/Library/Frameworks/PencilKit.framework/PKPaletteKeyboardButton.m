@implementation PKPaletteKeyboardButton

- (PKPaletteKeyboardButton)initWithImage:(id)a3
{
  id v4;
  PKPaletteKeyboardButton *v5;
  PKPaletteKeyboardButton *v6;
  void *v7;
  uint64_t v8;
  PKTextInputLanguageSelectionToken *observerToken;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaletteKeyboardButton;
  v5 = -[PKPaletteButton initWithImage:](&v19, sel_initWithImage_, v4);
  v6 = v5;
  if (v5)
  {
    -[PKPaletteKeyboardButton setContextMenuInteractionEnabled:](v5, "setContextMenuInteractionEnabled:", 1);
    objc_initWeak(&location, v6);
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __41__PKPaletteKeyboardButton_initWithImage___block_invoke;
    v16 = &unk_1E7778F90;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v7, "registerObserver:", &v13);
    v8 = objc_claimAutoreleasedReturnValue();
    observerToken = v6->_observerToken;
    v6->_observerToken = (PKTextInputLanguageSelectionToken *)v8;

    v6->_enableKeyboardToggle = 1;
    -[PKPaletteKeyboardButton _updateKeyboardToggleState](v6, "_updateKeyboardToggleState", v13, v14, v15, v16);
    -[PKPaletteButton _uiButtonInstance](v6, "_uiButtonInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setAnimatesContents:", 1);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __41__PKPaletteKeyboardButton_initWithImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD *WeakRetained;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)WeakRetained[65];
  WeakRetained[65] = v5;

  objc_msgSend(WeakRetained, "_updateButtonImage");
  objc_msgSend(WeakRetained, "setShowsMenuAsPrimaryAction:", a3 != 0);

}

- (void)dealloc
{
  objc_super v3;

  -[PKTextInputLanguageSelectionToken invalidate](self->_observerToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteKeyboardButton;
  -[PKPaletteKeyboardButton dealloc](&v3, sel_dealloc);
}

- (void)setFloatingKeyboardType:(int64_t)a3
{
  self->_floatingKeyboardType = a3;
  -[PKPaletteKeyboardButton _updateButtonImage](self, "_updateButtonImage");
}

- (void)_updateButtonImage
{
  UIImage *indicatorImage;
  UIImage *v4;
  void *v5;
  UIImage *v6;

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
  v6 = v4;
  -[PKPaletteButton _uiButtonInstance](self, "_uiButtonInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v6, 0);
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)setEnableKeyboardToggle:(BOOL)a3
{
  self->_enableKeyboardToggle = a3;
  -[PKPaletteKeyboardButton _updateKeyboardToggleState](self, "_updateKeyboardToggleState");
}

- (void)setKeyboardSelectionMenu:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardSelectionMenu, a3);
  -[PKPaletteKeyboardButton _updateKeyboardToggleState](self, "_updateKeyboardToggleState");
}

- (void)_updateKeyboardToggleState
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  -[PKPaletteKeyboardButton keyboardSelectionMenu](self, "keyboardSelectionMenu");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageSelectionMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 1;
  else
LABEL_4:
    v7 = -[PKPaletteKeyboardButton enableKeyboardToggle](self, "enableKeyboardToggle");
  -[PKPaletteButton setEnabled:](self, "setEnabled:", v7);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC36B8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PKPaletteKeyboardButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E777CCF0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __81__PKPaletteKeyboardButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "keyboardSelectionMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageSelectionMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v2 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v2, "children", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "setAttributes:", objc_msgSend(WeakRetained, "enableKeyboardToggle") ^ 1);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    v12 = (void *)MEMORY[0x1E0DC39D0];
    v19[0] = v2;
    v19[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "menuWithChildren:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int64_t)floatingKeyboardType
{
  return self->_floatingKeyboardType;
}

- (BOOL)enableKeyboardToggle
{
  return self->_enableKeyboardToggle;
}

- (UIMenu)keyboardSelectionMenu
{
  return self->_keyboardSelectionMenu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSelectionMenu, 0);
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_indicatorImage, 0);
}

@end
