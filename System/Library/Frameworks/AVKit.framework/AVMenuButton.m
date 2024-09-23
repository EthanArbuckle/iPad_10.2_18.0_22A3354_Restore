@implementation AVMenuButton

+ (id)buttonWithAccessibilityIdentifier:(id)a3 accessibilityLabel:(id)a4 isSecondGeneration:(BOOL)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AVMenuButton;
  objc_msgSendSuper2(&v7, sel_buttonWithAccessibilityIdentifier_accessibilityLabel_isSecondGeneration_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v5, "setContextMenuInteractionEnabled:", 1);
  objc_msgSend(v5, "setAutoresizingMask:", 0);
  objc_msgSend(v5, "setAppliesTransformToImageViewWhenHighlighted:", 1);
  return v5;
}

- (void)updateContextMenu
{
  void *v3;
  void *v4;
  id v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeMenuInteraction);
  if (WeakRetained)
  {
    -[AVMenuButton delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "menuForMenuButton:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__AVMenuButton_updateContextMenu__block_invoke;
    v7[3] = &unk_1E5BB08A0;
    v8 = v4;
    v5 = v4;
    objc_msgSend(WeakRetained, "updateVisibleMenuWithBlock:", v7);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  -[AVMenuButton delegate](self, "delegate", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVMenuButton delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuForMenuButton:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)MEMORY[0x1E0DC36B8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__AVMenuButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v12[3] = &unk_1E5BB08C8;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVMenuButton;
  v8 = a3;
  -[AVMenuButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v10, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v8, a4, a5);
  objc_storeWeak((id *)&self->_activeMenuInteraction, v8);

  -[AVMenuButton delegate](self, "delegate", v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "menuButtonWillShowMenu:", self);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVMenuButton;
  -[AVMenuButton contextMenuInteraction:willEndForConfiguration:animator:](&v14, sel_contextMenuInteraction_willEndForConfiguration_animator_, v8, v9, v10);
  objc_storeWeak((id *)&self->_activeMenuInteraction, v8);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__AVMenuButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "addCompletion:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "setPreferredMenuElementOrder:", 2);
  v10.receiver = self;
  v10.super_class = (Class)AVMenuButton;
  -[AVMenuButton _contextMenuInteraction:styleForMenuWithConfiguration:](&v10, sel__contextMenuInteraction_styleForMenuWithConfiguration_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (AVMenuButtonDelegate)delegate
{
  return (AVMenuButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activeMenuInteraction);
}

void __72__AVMenuButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "menuButtonDidHideMenu:", v3);

    WeakRetained = v3;
  }

}

id __70__AVMenuButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __33__AVMenuButton_updateContextMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (objc_msgSend(v4, "count"))
  {
    while (1)
    {
      objc_msgSend(v4, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeLastObject");
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
        break;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v5, "children", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v4, "addObject:", v14);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }

      if (!objc_msgSend(v4, "count"))
      {
        v5 = v3;
        goto LABEL_15;
      }
    }

  }
LABEL_15:

  return v5;
}

@end
