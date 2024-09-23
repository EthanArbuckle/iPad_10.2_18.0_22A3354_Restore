@implementation PKToolPickerPaletteViewDelegateProxy

- (PKToolPickerPaletteViewDelegateProxy)initWithToolPicker:(id)a3
{
  id v4;
  PKToolPickerPaletteViewDelegateProxy *v5;
  PKToolPickerPaletteViewDelegateProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKToolPickerPaletteViewDelegateProxy;
  v5 = -[PKToolPickerPaletteViewDelegateProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_toolPicker, v4);

  return v6;
}

- (void)paletteViewContentSizeDidChange:(id)a3
{
  id v3;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_paletteContentSizeDidChange");

}

- (void)paletteViewDidChangeScaleFactor:(id)a3
{
  id v3;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_notifyScaleFactorDidChange");

}

- (id)paletteViewCurrentFirstResponder:(id)a3
{
  void *v3;
  void *v4;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_currentFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)paletteViewFirstResponderDidUpdate:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(a3, "windowFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isVisible") && objc_msgSend(v4, "isEditableTextInput"))
    v5 = objc_msgSend(v4, "textInputSource") == 3 || objc_msgSend(v4, "textInputSource") == 0;
  else
    v5 = 0;
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isHandwritingToolSelected");

  if (!v7 || v5)
  {
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKToolPicker _windowForToolPicker:](PKToolPicker, "_windowForToolPicker:", v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isVisible");

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setVisibleInWindow:", v17);

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isVisible");

  if (v10 != v13)
  {
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKToolPicker _windowSceneForToolPicker:](PKToolPicker, "_windowSceneForToolPicker:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKTextInputInteraction interactionForScene:](PKTextInputInteraction, "interactionForScene:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_updateKeyboardSuppressionPolicy");

  }
}

- (id)paletteViewUndoManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegateForSelector:", sel__toolPickerUndoManager_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "_toolPickerUndoManager:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "_currentFirstResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "undoManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)paletteView:(id)a3 didReceivePencilInteractionDidTap:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isVisible");

  if ((v6 & 1) == 0)
  {
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updatePaletteView:", v8);

  }
}

- (BOOL)paletteView:(id)a3 shouldChangeSelectedToolColor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_delegateForSelector:", sel__toolPicker_shouldChangeSelectedToolColor_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "_toolPicker:shouldChangeSelectedToolColor:", v8, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)paletteViewCurrentSelectionColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegateForSelector:", sel__toolPickerCurrentSelectionColor_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_toolPickerCurrentSelectionColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)paletteView:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "selectedTool");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_isLassoTool") & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v10, "_isLassoTool");

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setSelectedTool:saveState:updateUI:", v10, 1, v8);

}

- (void)paletteViewToolsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "tools");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_resetTools:selectedTool:", v8, v5);

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_saveToolPickerState");

}

- (void)paletteViewDidToggleRuler:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_isHandwritingToolSelected") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRulerActive");

  if (v6)
  {
LABEL_5:
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRulerActive:", objc_msgSend(v8, "isRulerActive") ^ 1);

  }
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRulerActive");

  if (v10)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordShowRuler]((uint64_t)v11);

  }
}

- (void)paletteView:(id)a3 didChangeTraitCollection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "horizontalSizeClass");
  objc_msgSend(v6, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == objc_msgSend(v9, "horizontalSizeClass"))
  {
    v10 = objc_msgSend(v7, "verticalSizeClass");
    objc_msgSend(v6, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "verticalSizeClass");

    if (v10 == v12)
      goto LABEL_15;
  }
  else
  {

  }
  v22 = v6;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_observers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "toolPickerFramesObscuredDidChange:", v21);

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  v6 = v22;
LABEL_15:

}

- (void)paletteViewDidChangePosition:(id)a3 fromPosition:(int64_t)a4 toPosition:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_toolPickerDidChangePosition:", v15);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_toolPickerDidChangePosition:fromPosition:toPosition:", v16, a4, a5);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)paletteView:(id)a3 didChangeColor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_toolPicker:didChangeColor:", v14, v5);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_saveToolPickerState");

  }
}

- (CGRect)paletteViewColorPickerPopoverPresentationSourceRect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegateForSelector:", sel__colorPickerPopoverPresentationBarButtonItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "_colorPickerPopoverPresentationBarButtonItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
  }
  else
  {
    objc_msgSend(v6, "_delegateForSelector:", sel__colorPickerPopoverPresentationSourceRect_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v14 = *MEMORY[0x1E0C9D648];
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_6;
    }
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_colorPickerPopoverPresentationSourceRect:", v9);
  }
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;

LABEL_6:
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)paletteViewColorPickerPopoverPresentationSourceView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_delegateForSelector:", sel__colorPickerPopoverPresentationBarButtonItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "_colorPickerPopoverPresentationBarButtonItem:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "_delegateForSelector:", sel__colorPickerPopoverPresentationSourceView_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_colorPickerPopoverPresentationSourceView:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v10 = v4;
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)shouldHandlePencilInteractionWhenNotVisible:(id)a3
{
  void *v3;
  char v4;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isInputViewVisible");

  return v4;
}

- (BOOL)toggleLassoToolEditingViewColorPickerForPaletteView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegateForSelector:", sel__toggleLassoToolEditingViewColorPickerForToolPicker_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKToolPickerPaletteViewDelegateProxy toolPicker](self, "toolPicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_toggleLassoToolEditingViewColorPickerForToolPicker:", v6);

  }
  return v5 != 0;
}

- (PKToolPicker)toolPicker
{
  return (PKToolPicker *)objc_loadWeakRetained((id *)&self->_toolPicker);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_toolPicker);
}

@end
