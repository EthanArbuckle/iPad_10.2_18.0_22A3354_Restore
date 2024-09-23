@implementation AVControlOverflowButton

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)updateContextMenu
{
  UIContextMenuInteraction **p_activeMenuInteraction;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_activeMenuInteraction = &self->_activeMenuInteraction;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeMenuInteraction);

  if (WeakRetained)
  {
    -[AVControlOverflowButton delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overflowMenuItemsForControlOverflowButton:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v7, "addObject:", v13);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v14 = objc_loadWeakRetained((id *)p_activeMenuInteraction);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__AVControlOverflowButton_updateContextMenu__block_invoke;
    v17[3] = &unk_1E5BB49F0;
    v18 = v8;
    v19 = v7;
    v15 = v7;
    v16 = v8;
    objc_msgSend(v14, "updateVisibleMenuWithBlock:", v17);

  }
}

+ (id)firstGenerationButton
{
  void *v2;
  void *v3;

  AVLocalizedString(CFSTR("More Controls"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVButton buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:](AVControlOverflowButton, "buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:", CFSTR("More Controls"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImageName:", CFSTR("ellipsis"));
  _CommonInit_23279(v3);
  return v3;
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
  v9[2] = __81__AVControlOverflowButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E5BB4A18;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVControlOverflowButton;
  v8 = a3;
  -[AVControlOverflowButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v10, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v8, a4, a5);
  objc_storeWeak((id *)&self->_activeMenuInteraction, v8);

  -[AVControlOverflowButton delegate](self, "delegate", v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "overflowButtonWillShowContextMenu:", self);

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
  v14.super_class = (Class)AVControlOverflowButton;
  -[AVControlOverflowButton contextMenuInteraction:willEndForConfiguration:animator:](&v14, sel_contextMenuInteraction_willEndForConfiguration_animator_, v8, v9, v10);
  objc_storeWeak((id *)&self->_activeMenuInteraction, v8);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__AVControlOverflowButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
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
  v10.super_class = (Class)AVControlOverflowButton;
  -[AVControlOverflowButton _contextMenuInteraction:styleForMenuWithConfiguration:](&v10, sel__contextMenuInteraction_styleForMenuWithConfiguration_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (AVControlOverflowButtonDelegate)delegate
{
  return (AVControlOverflowButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activeMenuInteraction);
}

void __83__AVControlOverflowButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
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
      objc_msgSend(v2, "overflowButtonDidHideContextMenu:", v3);

    WeakRetained = v3;
  }

}

id __81__AVControlOverflowButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "overflowMenuItemsForControlOverflowButton:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5BB5F88, 0, CFSTR("AVControlOverflowMenu"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __44__AVControlOverflowButton_updateContextMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AVControlOverflowMenu"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5BB5F88, 0, CFSTR("AVControlOverflowMenu"), 0, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    if (objc_msgSend(v7, "count"))
    {
      while (1)
      {
        objc_msgSend(v7, "lastObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeLastObject");
        objc_msgSend(v6, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v10)
          break;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v6, "children", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v7, "addObject:", v16);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v13);
        }

        if (!objc_msgSend(v7, "count"))
        {
          v6 = v3;
          goto LABEL_17;
        }
      }

    }
LABEL_17:

  }
  return v6;
}

+ (id)secondGenerationButton
{
  void *v2;
  void *v3;

  AVLocalizedString(CFSTR("More Controls"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVButton buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:](AVControlOverflowButton, "buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:", CFSTR("More Controls"), v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImageName:", CFSTR("ellipsis.circle"));
  _CommonInit_23279(v3);
  return v3;
}

@end
