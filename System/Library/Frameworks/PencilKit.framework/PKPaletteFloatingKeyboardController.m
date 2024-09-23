@implementation PKPaletteFloatingKeyboardController

- (PKPaletteFloatingKeyboardController)init
{
  PKPaletteFloatingKeyboardController *v2;
  uint64_t v3;
  UIKeyboardInputMode *emojiInputMode;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaletteFloatingKeyboardController;
  v2 = -[PKPaletteFloatingKeyboardController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3960], "keyboardInputModeWithIdentifier:", CFSTR("emoji@sw=Emoji"));
    v3 = objc_claimAutoreleasedReturnValue();
    emojiInputMode = v2->_emojiInputMode;
    v2->_emojiInputMode = (UIKeyboardInputMode *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_didChangeInputMode, *MEMORY[0x1E0DC5528], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5528], 0);

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteFloatingKeyboardController;
  -[PKPaletteFloatingKeyboardController dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  id obj;

  v3 = a2;
  if (a1)
  {
    obj = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));

    v3 = obj;
    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 24), obj);
      -[PKPaletteFloatingKeyboardController notifyDelegateDidChangeKeyboardType](a1);
      v3 = obj;
    }
  }

}

- (void)notifyDelegateDidChangeKeyboardType
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;

  if (a1)
  {
    v2 = (id *)(a1 + 24);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained(v2);
      objc_msgSend(v5, "floatingKeyboardController:didChangeKeyboardType:", a1, __PKFloatingKeyboardType);

    }
  }
}

- (void)didChangeInputMode
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;

  if (!-[PKPaletteFloatingKeyboardController isPresentingKeyboard]((uint64_t)self))
    return;
  if (!self || __PKFloatingKeyboardType != 1)
  {
    if (!self)
    {
LABEL_11:
      -[PKPaletteFloatingKeyboardController notifyDelegateDidChangeKeyboardType]((uint64_t)self);
      return;
    }
LABEL_10:
    __PKFloatingKeyboardType = -[PKPaletteFloatingKeyboardController _currentSystemFloatingKeyboardType]((uint64_t)self);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  if (v5 - self->_latestUserInitiatedInputModeChangeTimestamp >= 1.0)
    goto LABEL_10;
  v6 = __PKFloatingKeyboardType;
  if (__PKFloatingKeyboardType == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCurrentInputMode:", self->_emojiInputMode);

    v6 = __PKFloatingKeyboardType;
  }
  -[PKPaletteFloatingKeyboardController _updateKeyboardInputModeToFloatingKeyboardType:]((uint64_t)self, v6);
}

- (BOOL)isPresentingKeyboard
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_overrideTextInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_updateKeyboardInputModeToFloatingKeyboardType:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  id v6;

  if (a1)
  {
    if (a2 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3958], "sharedInstance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInputMode:userInitiated:", v2, 1);
    }
    else
    {
      if (a2)
        return;
      objc_msgSend(MEMORY[0x1E0DC3958], "sharedInstance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "currentInputModeInPreference");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInputMode:userInitiated:", v4, 1);

    }
  }
}

- (void)_updateKeyboardMenuIfNecessary
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (val && !val[1])
  {
    objc_initWeak(&location, val);
    v2 = (void *)_PKUIKitBundle_kitBundle;
    if (!_PKUIKitBundle_kitBundle)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)_PKUIKitBundle_kitBundle;
      _PKUIKitBundle_kitBundle = v3;

      v2 = (void *)_PKUIKitBundle_kitBundle;
    }
    v5 = v2;
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Keyboard"), CFSTR("Keyboard"), CFSTR("Localizable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "pk_keyboardButtonImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __69__PKPaletteFloatingKeyboardController__updateKeyboardMenuIfNecessary__block_invoke;
    v25[3] = &unk_1E777AB40;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v22, v7, CFSTR("Keyboard"), v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v8;
    v11 = (void *)MEMORY[0x1E0DC3428];
    v12 = val[4];
    objc_msgSend(v12, "extendedDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "pk_emojiButtonImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = val[4];
    objc_msgSend(v15, "primaryLanguage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __69__PKPaletteFloatingKeyboardController__updateKeyboardMenuIfNecessary__block_invoke_2;
    v23[3] = &unk_1E777AB40;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, v14, v16, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC39D0];
    v28[0] = v9;
    v28[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "menuWithTitle:image:identifier:options:children:", &stru_1E777DEE8, 0, 0, 1, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = val[1];
    val[1] = (id)v20;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&location);
  }
}

void __69__PKPaletteFloatingKeyboardController__updateKeyboardMenuIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKPaletteFloatingKeyboardController _presentOrDismissWithKeyboardType:]((uint64_t)WeakRetained, 0);

}

- (void)_presentOrDismissWithKeyboardType:(uint64_t)a1
{
  uint64_t v4;
  id v5;

  if (a1)
  {
    if (!-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1) || __PKFloatingKeyboardType == a2)
    {
      if (-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1))
      {
        -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented](a1);
      }
      else
      {
        __PKFloatingKeyboardType = a2;
        -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented](a1);
        -[PKPaletteFloatingKeyboardController _updateKeyboardInputModeToFloatingKeyboardType:](a1, a2);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timeIntervalSinceReferenceDate");
        *(_QWORD *)(a1 + 40) = v4;

      }
    }
    else
    {
      -[PKPaletteFloatingKeyboardController _updateKeyboardInputModeToFloatingKeyboardType:](a1, a2);
      __PKFloatingKeyboardType = -[PKPaletteFloatingKeyboardController _currentSystemFloatingKeyboardType](a1);
      -[PKPaletteFloatingKeyboardController notifyDelegateDidChangeKeyboardType](a1);
    }
  }
}

void __69__PKPaletteFloatingKeyboardController__updateKeyboardMenuIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKPaletteFloatingKeyboardController _presentOrDismissWithKeyboardType:]((uint64_t)WeakRetained, 1);

}

- (void)_clearMenuStateIfNecessary
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    objc_msgSend(*(id *)(a1 + 8), "children", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAttributes:", 0);
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

  }
}

- (id)keyboardSelectionMenu
{
  uint64_t v1;

  if (a1)
  {
    v1 = (uint64_t)a1;
    -[PKPaletteFloatingKeyboardController _updateKeyboardMenuIfNecessary](a1);
    -[PKPaletteFloatingKeyboardController _clearMenuStateIfNecessary](v1);
    a1 = (id *)*(id *)(v1 + 8);
  }
  return a1;
}

- (void)presentOrDismissIfPresented
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;
  os_log_t v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 17))
    {
      v2 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315138;
        v16 = "-[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]";
        _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Ignoring %s as we are processing an internally requested reloadInputViews", (uint8_t *)&v15, 0xCu);
      }

    }
    else if (-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1))
    {
      -[PKPaletteFloatingKeyboardController dismissWithReason:](a1, CFSTR("Toggling off as keyboard is already presented"));
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) != 0)
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 24));
        objc_msgSend(v5, "responderForFloatingKeyboardController:", a1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
      v7 = os_log_create("com.apple.pencilkit", "PKPalette");
      v8 = v7;
      if (v6)
      {
        v9 = v7;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", __PKFloatingKeyboardType);
          v10 = (char *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Presenting keyboard for type: %@", (uint8_t *)&v15, 0xCu);

        }
        v11 = __PKFloatingKeyboardType;
        v12 = v6;
        v8 = objc_loadWeakRetained((id *)(a1 + 24));
        if (!-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[NSObject floatingKeyboardControllerWillShow:](v8, "floatingKeyboardControllerWillShow:", a1);
        }
        if (v11 == 1)
        {
          objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "updateCurrentInputMode:", *(_QWORD *)(a1 + 32));

        }
        objc_msgSend(MEMORY[0x1E0DC3E00], "defaultTextInputTraits");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setForceFloatingKeyboard:", 1);
        objc_msgSend(v14, "setAcceptsInitialEmojiKeyboard:", 1);
        -[PKPaletteFloatingKeyboardController _setTraitsForActiveKeyboard:forResponder:](a1, v14, v12);

      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Attempted presenting a UCB-Keyboard but could not get a responder", (uint8_t *)&v15, 2u);
      }

    }
  }
}

- (void)dismissWithReason:(uint64_t)a1
{
  char *v3;
  NSObject *WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  char v9;
  id v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 17))
    {
      WeakRetained = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
      {
        v11 = 136315138;
        v12 = "-[PKPaletteFloatingKeyboardController dismissWithReason:]";
        _os_log_debug_impl(&dword_1BE213000, WeakRetained, OS_LOG_TYPE_DEBUG, "Ignoring %s as we are processing an internally requested reloadInputViews", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1))
    {
      __PKFloatingKeyboardType = -[PKPaletteFloatingKeyboardController _currentSystemFloatingKeyboardType](a1);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      if (-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1) && (objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject floatingKeyboardControllerWillHide:](WeakRetained, "floatingKeyboardControllerWillHide:", a1);
      v5 = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(v5, "responderForFloatingKeyboardController:", a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "set_textInputSource:", 3);
      -[PKPaletteFloatingKeyboardController _setTraitsForActiveKeyboard:forResponder:](a1, 0, v6);
      v7 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Dismissing UCB-Keyboard with reason: '%@'", (uint8_t *)&v11, 0xCu);
      }

      v8 = objc_loadWeakRetained((id *)(a1 + 24));
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)(a1 + 24));
        objc_msgSend(v10, "floatingKeyboardController:didDismissWithReason:", a1, v3);

      }
    }
    else
    {
      WeakRetained = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_1BE213000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Attempted dismissal, but UCB-Keyboard is not presented. Reason: '%@'", (uint8_t *)&v11, 0xCu);
      }
    }

  }
}

- (void)_setTraitsForActiveKeyboard:(void *)a3 forResponder:
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DC3938];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "activeKeyboard");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "set_overrideTextInputTraits:", v7);

  *(_BYTE *)(a1 + 17) = 1;
  objc_msgSend(v6, "reloadInputViews");

  *(_BYTE *)(a1 + 17) = 0;
}

- (uint64_t)_currentSystemFloatingKeyboardType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(a1) = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiInputMode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedKeyboardMenu, 0);
}

@end
