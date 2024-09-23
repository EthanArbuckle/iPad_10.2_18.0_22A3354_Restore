@implementation ICInkPaletteController

- (ICInkPaletteController)init
{
  -[ICInkPaletteController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICInkPaletteController)initWithParentView:(id)a3 responder:(id)a4 delegate:(id)a5 isSystemPaperUI:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  ICInkPaletteController *v13;
  ICInkPaletteController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICInkPaletteController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ICInkPaletteController;
  v13 = -[ICInkPaletteController init](&v29, sel_init);
  v14 = v13;
  if (!v13)
  {
LABEL_15:
    v19 = v14;
    goto LABEL_16;
  }
  objc_storeWeak((id *)&v13->_parentView, v10);
  objc_storeWeak((id *)&v14->_responder, v11);
  objc_storeWeak((id *)&v14->_delegate, v12);
  if (a6)
  {
    objc_msgSend(v10, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_isSystemPaperUI = objc_msgSend(v15, "userInterfaceIdiom") == 1;

  }
  else
  {
    v14->_isSystemPaperUI = 0;
  }
  v16 = (void *)objc_opt_class();
  -[ICInkPaletteController parentView](v14, "parentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sharedToolPickerForWindow:", v18);
  v19 = (ICInkPaletteController *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ICInkPaletteController parentView](v14, "parentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInkPaletteController _enableTapInteractionForWindow:](v19, "_enableTapInteractionForWindow:", v21);

    -[ICInkPaletteController _setShowsHandwritingTool:](v19, "_setShowsHandwritingTool:", 1);
    -[ICInkPaletteController _setShowsRuler:](v19, "_setShowsRuler:", -[ICInkPaletteController isSystemPaperUI](v14, "isSystemPaperUI") ^ 1);
    -[ICInkPaletteController _setWantsBottomLineDividerVisibleInCompactSize:](v19, "_setWantsBottomLineDividerVisibleInCompactSize:", -[ICInkPaletteController isSystemPaperUI](v14, "isSystemPaperUI") ^ 1);
    -[ICInkPaletteController _setWantsEllipsisButtonVisibleInCompactSize:](v19, "_setWantsEllipsisButtonVisibleInCompactSize:", -[ICInkPaletteController isSystemPaperUI](v14, "isSystemPaperUI") ^ 1);
    -[ICInkPaletteController _setWantsUndoRedoButtonsVisibleInCompactSize:](v19, "_setWantsUndoRedoButtonsVisibleInCompactSize:", -[ICInkPaletteController isSystemPaperUI](v14, "isSystemPaperUI"));
    -[ICInkPaletteController _setIgnoresSafeAreaInsetsInCompactSize:](v19, "_setIgnoresSafeAreaInsetsInCompactSize:", -[ICInkPaletteController isSystemPaperUI](v14, "isSystemPaperUI"));
    -[ICInkPaletteController _setUseEqualSpacingLayoutInCompactSize:](v19, "_setUseEqualSpacingLayoutInCompactSize:", -[ICInkPaletteController isSystemPaperUI](v14, "isSystemPaperUI"));
    if (-[ICInkPaletteController isSystemPaperUI](v14, "isSystemPaperUI"))
    {
      -[ICInkPaletteController _setEdgeInsetsInCompactSize:](v19, "_setEdgeInsetsInCompactSize:", 0.0, 20.0, 0.0, 70.0);
      -[ICInkPaletteController _setInterItemUndoRedoButtonsSpacingInCompactSize:](v19, "_setInterItemUndoRedoButtonsSpacingInCompactSize:", 20.0);
    }
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      -[ICInkPaletteController setColorUserInterfaceStyle:](v19, "setColorUserInterfaceStyle:", 1);
    -[ICInkPaletteController _setWantsClearBackgroundColorInCompactSize:](v19, "_setWantsClearBackgroundColorInCompactSize:", -[ICInkPaletteController isSystemPaperUI](v14, "isSystemPaperUI"));
    -[ICInkPaletteController set_delegate:](v19, "set_delegate:", v14);
    -[ICInkPaletteController addObserver:](v19, "addObserver:", v14);
    -[ICInkPaletteController responder](v14, "responder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInkPaletteController setVisible:forFirstResponder:](v19, "setVisible:forFirstResponder:", 1, v22);

    -[ICInkPaletteController storedSelectedTool](v14, "storedSelectedTool");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[ICInkPaletteController storedSelectedTool](v14, "storedSelectedTool");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInkPaletteController setSelectedTool:](v14, "setSelectedTool:", v24);

      -[ICInkPaletteController setStoredSelectedTool:](v14, "setStoredSelectedTool:", 0);
    }
    if (-[ICInkPaletteController storedColorUserInterfaceStyle](v14, "storedColorUserInterfaceStyle"))
      -[ICInkPaletteController setColorUserInterfaceStyle:](v14, "setColorUserInterfaceStyle:", -[ICInkPaletteController storedColorUserInterfaceStyle](v14, "storedColorUserInterfaceStyle"));
    -[ICInkPaletteController _paletteHostView](v19, "_paletteHostView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "paletteView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInkPaletteController setPalettePosition:](v14, "setPalettePosition:", objc_msgSend(v26, "palettePosition"));

    -[ICInkPaletteController colorCorrectedTool](v14, "colorCorrectedTool");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInkPaletteController setSelectedTool:](v19, "setSelectedTool:", v27);

    -[ICInkPaletteController setToolPicker:](v14, "setToolPicker:", v19);
    goto LABEL_15;
  }
LABEL_16:

  return v19;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICInkPaletteController;
  -[ICInkPaletteController dealloc](&v4, sel_dealloc);
}

+ (id)sharedToolPickerForWindow:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSObject *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!_UIApplicationIsExtension())
  {
    objc_msgSend(v3, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[ICInkPaletteController sharedToolPickerForWindow:].cold.1((uint64_t)v3, v6);
      v4 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    ICCheckedDynamicCast();
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject toolPickerIdentifier](v6, "toolPickerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[NSObject windowIdentifier](v6, "windowIdentifier"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)sharedToolPickerForWindow___perCanvasToolPickers;
      if (!sharedToolPickerForWindow___perCanvasToolPickers)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)sharedToolPickerForWindow___perCanvasToolPickers;
        sharedToolPickerForWindow___perCanvasToolPickers = v9;

        v8 = (void *)sharedToolPickerForWindow___perCanvasToolPickers;
      }
      objc_msgSend(v8, "objectForKey:", v5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v4 = (id)v11;
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      v4 = objc_alloc_init(MEMORY[0x1E0CD1278]);
      objc_msgSend(v4, "setStateAutosaveName:", v7);
      objc_msgSend((id)sharedToolPickerForWindow___perCanvasToolPickers, "setObject:forKey:", v4, v5);
      v12 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = 138413058;
        v15 = v4;
        v16 = 2112;
        v17 = v7;
        v18 = 2112;
        v19 = v6;
        v20 = 2112;
        v21 = v5;
        _os_log_debug_impl(&dword_1AC7A1000, v12, OS_LOG_TYPE_DEBUG, "created toolPicker: %@, with stateAutosaveName: %@, for window: %@, scene: %@", (uint8_t *)&v14, 0x2Au);
      }
    }
    else
    {
      v12 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[ICInkPaletteController sharedToolPickerForWindow:].cold.2(v6, v12);
      v4 = 0;
      v7 = v12;
    }

    goto LABEL_21;
  }
  if (sharedToolPickerForWindow__onceToken != -1)
    dispatch_once(&sharedToolPickerForWindow__onceToken, &__block_literal_global_77);
  v4 = (id)sharedToolPickerForWindow__toolPicker;
LABEL_23:

  return v4;
}

void __52__ICInkPaletteController_sharedToolPickerForWindow___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CD1278]);
  v1 = (void *)sharedToolPickerForWindow__toolPicker;
  sharedToolPickerForWindow__toolPicker = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedToolPickerForWindow__toolPicker, "setStateAutosaveName:", v2);

}

- (BOOL)isHandwritingToolSelected
{
  void *v2;
  char v3;

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHandwritingToolSelected");

  return v3;
}

- (BOOL)isCanvasGenerationToolSelected
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isCanvasGenerationToolSelected");

  return v6;
}

- (BOOL)isInkPaletteShowing
{
  void *v2;
  char v3;

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  return v3;
}

- (void)showInkPalette:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
    -[ICInkPaletteController showInkPaletteAnimated:](self, "showInkPaletteAnimated:", a4);
  else
    -[ICInkPaletteController hideInkPaletteAnimated:](self, "hideInkPaletteAnimated:", a4);
}

- (void)showInkPaletteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;

  v3 = a3;
  v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICInkPaletteController showInkPaletteAnimated:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

  -[ICInkPaletteController responder](self, "responder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreventFirstResponder:", 0);

  v14 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ICInkPaletteController showInkPaletteAnimated:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  -[ICInkPaletteController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[ICInkPaletteController delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "inkPalette:willShowAnimated:", self, v3);

  }
  -[ICInkPaletteController responder](self, "responder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "becomeFirstResponder");

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICInkPaletteController parentView](self, "parentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutIfNeeded");

  }
  -[ICInkPaletteController delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    -[ICInkPaletteController delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "inkPalette:didShowAnimated:", self, v3);

  }
}

- (void)hideInkPaletteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;

  v3 = a3;
  v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICInkPaletteController hideInkPaletteAnimated:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[ICInkPaletteController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[ICInkPaletteController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inkPalette:willHideAnimated:", self, v3);

  }
  -[ICInkPaletteController responder](self, "responder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isFirstResponder");

  if (v17)
  {
    -[ICInkPaletteController responder](self, "responder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resignFirstResponder");
  }
  else
  {
    -[ICInkPaletteController toolPicker](self, "toolPicker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isVisible");

    if (!v20)
      goto LABEL_19;
    v18 = 0;
    while (1)
    {
      v21 = v18;
      -[ICInkPaletteController parentView](self, "parentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstResponder");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        break;
      -[ICInkPaletteController toolPicker](self, "toolPicker");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v23, "isVisible"))
        goto LABEL_16;
      -[ICInkPaletteController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "inkPalette:shouldResignFirstResponder:", self, v18) & 1) == 0)
      {

LABEL_16:
        break;
      }
      v25 = objc_msgSend(v18, "canResignFirstResponder");

      if (!v25 || (objc_msgSend(v18, "resignFirstResponder") & 1) == 0)
        goto LABEL_18;
    }

  }
LABEL_18:

LABEL_19:
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICInkPaletteController parentView](self, "parentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutIfNeeded");

  }
  -[ICInkPaletteController delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    -[ICInkPaletteController delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "inkPalette:didHideAnimated:", self, v3);

  }
}

- (void)updateUserInterfaceStyle:(int64_t)a3
{
  id v4;

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updatePaletteUserInterfaceStyle:", a3);

}

- (void)setSelectedTool:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICInkPaletteController setSelectedTool:].cold.1((uint64_t)v4, self);

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICInkPaletteController toolPicker](self, "toolPicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedTool:", v4);

  }
  else
  {
    -[ICInkPaletteController setStoredSelectedTool:](self, "setStoredSelectedTool:", v4);
  }

}

- (PKTool)selectedTool
{
  void *v3;
  void *v4;
  void *v5;

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICInkPaletteController toolPicker](self, "toolPicker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedTool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICInkPaletteController storedSelectedTool](self, "storedSelectedTool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (PKTool *)v5;
}

- (PKTool)colorCorrectedTool
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[ICInkPaletteController selectedTool](self, "selectedTool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_isWhite");

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CD11B0]);
      objc_msgSend(v3, "inkType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "width");
      v9 = objc_msgSend(v6, "initWithInkType:color:width:", v7, v8);

      v2 = (void *)v9;
    }

  }
  return (PKTool *)v2;
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICInkPaletteController setColorUserInterfaceStyle:].cold.1(self);

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICInkPaletteController toolPicker](self, "toolPicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColorUserInterfaceStyle:", a3);

    a3 = 0;
  }
  -[ICInkPaletteController setStoredColorUserInterfaceStyle:](self, "setStoredColorUserInterfaceStyle:", a3);
}

- (int64_t)colorUserInterfaceStyle
{
  void *v3;
  void *v4;
  int64_t v5;

  -[ICInkPaletteController toolPicker](self, "toolPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICInkPaletteController toolPicker](self, "toolPicker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "colorUserInterfaceStyle");

  }
  else
  {
    v5 = -[ICInkPaletteController storedColorUserInterfaceStyle](self, "storedColorUserInterfaceStyle");
  }

  return v5;
}

- (void)resetToPencilKitCompatibleInk
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[ICInkPaletteController selectedTool](self, "selectedTool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "inkFormatVersion");

  if (v6 == 1)
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
    -[ICInkPaletteController toolPicker](self, "toolPicker", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_tools");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      v12 = (void *)*MEMORY[0x1E0CD1310];
      while (2)
      {
        v13 = 0;
        v14 = v4;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_opt_class();
          ICDynamicCast();
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "ink");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "inkFormatVersion"))
          {

          }
          else
          {
            objc_msgSend(v4, "inkType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16 == v12)
            {
              -[ICInkPaletteController setSelectedTool:](self, "setSelectedTool:", v4);
              -[ICInkPaletteController toolPicker](self, "toolPicker");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setSelectedTool:", v4);

              goto LABEL_14;
            }
          }
          ++v13;
          v14 = v4;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICInkPaletteController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "inkPalette:didPickTool:", self, v5);
}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[ICInkPaletteController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRulerActive");

  objc_msgSend(v6, "inkPaletteDidToggleRuler:isRulerActive:", self, v5);
}

- (void)_toolPickerVisibilityDidChange:(id)a3 isAnimationFinished:(BOOL)a4
{
  void *v5;
  char v6;
  void *v7;

  if ((objc_msgSend(a3, "isVisible") & 1) == 0 && -[ICInkPaletteController didTapDoneButton](self, "didTapDoneButton"))
  {
    -[ICInkPaletteController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[ICInkPaletteController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inkPaletteDidHideWithDoneButton:", self);

    }
    -[ICInkPaletteController setDidTapDoneButton:](self, "setDidTapDoneButton:", 0);
  }
}

- (void)_toolPickerDidInvokeDoneAction:(id)a3
{
  -[ICInkPaletteController setDidTapDoneButton:](self, "setDidTapDoneButton:", 1);
}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[ICInkPaletteController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inkPalette:didChangeColor:", self, v5);

}

- (void)_toolPickerDidChangePosition:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  id v8;

  objc_msgSend(a3, "_paletteHostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "palettePosition");

  if (v6)
  {
    if (-[ICInkPaletteController palettePosition](self, "palettePosition") != v6)
    {
      v7 = -[ICInkPaletteController palettePosition](self, "palettePosition");
      -[ICInkPaletteController setPalettePosition:](self, "setPalettePosition:", v6);
      -[ICInkPaletteController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inkPalette:didChangePalettePositionStart:end:", self, v7, v6);

    }
  }
}

- (CGRect)_colorPickerPopoverPresentationSourceRect:(id)a3
{
  void *v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  -[ICInkPaletteController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inkPaletteButtonView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "frame");
  v15 = CGRectOffset(v14, -0.1, 0.0);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;

  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)_colorPickerPopoverPresentationSourceView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ICInkPaletteController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inkPaletteButtonView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_toolPicker:(id)a3 shouldSetVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  BOOL v10;

  v4 = a4;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICInkPaletteController _toolPicker:shouldSetVisible:].cold.1((uint64_t)v6, v4, v7);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLForKey:", *MEMORY[0x1E0D64440]);

  if (v9)
    v10 = !v4;
  else
    v10 = 0;
  if (!v10)
    -[ICInkPaletteController showInkPalette:animated:](self, "showInkPalette:animated:", v4, 1);

}

- (id)_toolPickerUndoManager:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICInkPaletteController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICInkPaletteController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inkPaletteUndoManager:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICInkPaletteController responder](self, "responder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (void)setParentView:(id)a3
{
  objc_storeWeak((id *)&self->_parentView, a3);
}

- (ICInkToolPickerResponder)responder
{
  return (ICInkToolPickerResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (void)setResponder:(id)a3
{
  objc_storeWeak((id *)&self->_responder, a3);
}

- (ICInkPaletteControllerDelegate)delegate
{
  return (ICInkPaletteControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKToolPicker)toolPicker
{
  return self->_toolPicker;
}

- (void)setToolPicker:(id)a3
{
  objc_storeStrong((id *)&self->_toolPicker, a3);
}

- (PKTool)storedSelectedTool
{
  return self->_storedSelectedTool;
}

- (void)setStoredSelectedTool:(id)a3
{
  objc_storeStrong((id *)&self->_storedSelectedTool, a3);
}

- (int64_t)palettePosition
{
  return self->_palettePosition;
}

- (void)setPalettePosition:(int64_t)a3
{
  self->_palettePosition = a3;
}

- (int64_t)storedColorUserInterfaceStyle
{
  return self->_storedColorUserInterfaceStyle;
}

- (void)setStoredColorUserInterfaceStyle:(int64_t)a3
{
  self->_storedColorUserInterfaceStyle = a3;
}

- (BOOL)isSystemPaperUI
{
  return self->_isSystemPaperUI;
}

- (void)setIsSystemPaperUI:(BOOL)a3
{
  self->_isSystemPaperUI = a3;
}

- (BOOL)didTapDoneButton
{
  return self->_didTapDoneButton;
}

- (void)setDidTapDoneButton:(BOOL)a3
{
  self->_didTapDoneButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedSelectedTool, 0);
  objc_storeStrong((id *)&self->_toolPicker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_responder);
  objc_destroyWeak((id *)&self->_parentView);
}

+ (void)sharedToolPickerForWindow:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "toolPicker can't be created for window: %@, windowScene: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)sharedToolPickerForWindow:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "toolPickerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "windowIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "toolPicker can't be created for window: %@, with tool picker identifier: %@, window identifier: %@", (uint8_t *)&v6, 0x20u);

}

- (void)showInkPaletteAnimated:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Showing the ink palette in showInkPaletteAnimated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)showInkPaletteAnimated:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Setting tool picker responder preventFirstResponder = NO", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)hideInkPaletteAnimated:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Hiding the ink palette in showInkPaletteAnimated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)setSelectedTool:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "toolPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v3, v4, "set selected tool: %@, toolPicker: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)setColorUserInterfaceStyle:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "toolPicker");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v2, v3, "set color UI style: %ld, toolPicker: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)_toolPicker:(os_log_t)log shouldSetVisible:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "toolPicker: %@, should set visible: %d", (uint8_t *)&v3, 0x12u);
}

@end
