@implementation PKPencilSqueezeControllerPaletteViewDelegateProxy

- (id)initWithController:(void *)a3 paletteView:
{
  id v5;
  id v6;
  id *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKPencilSqueezeControllerPaletteViewDelegateProxy;
    v7 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 1, v5);
      objc_storeWeak(a1 + 2, v6);
      +[PKStatisticsManager sharedStatisticsManager]();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = a1[5];
      a1[5] = (id)v8;

      +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[6];
      a1[6] = (id)v10;

    }
  }

  return a1;
}

- (void)pencilInteractionSettingsDidChange
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Handle pencil interaction settings did change", v3, 2u);
    }

    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _updateMoreOptionsViewController](a1);
  }
}

- (void)_updateMoreOptionsViewController
{
  uint64_t *WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id *v12;
  id *v13;
  id v14;
  uint64_t v15;
  id v16;

  if (a1 && (objc_msgSend(a1[4], "isBeingDismissed") & 1) == 0)
  {
    WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 1);
    -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (PKCurrentDeviceSupportsPencil())
      v3 = objc_msgSend(v16, "showsDrawingPolicyControls");
    else
      v3 = 0;
    objc_msgSend(a1[4], "setShouldShowFingerDrawsOption:", v3);
    objc_msgSend(a1[4], "setIsFingerDrawsOn:", objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing") ^ 1);
    v4 = objc_loadWeakRetained(a1 + 2);
    v5 = v4;
    if (v4)
      v6 = (void *)*((_QWORD *)v4 + 73);
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(a1[4], "setShouldShowTapToRadarOption:", -[PKSqueezePaletteViewContext canShowTapToRadar]((uint64_t)v7));

    v8 = objc_loadWeakRetained(a1 + 2);
    v9 = v8;
    if (v8)
      v10 = (void *)*((_QWORD *)v8 + 73);
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend(a1[4], "setShouldShowResetHandwritingEducationPane:", -[PKSqueezePaletteViewContext canShowResetHandwritingEducationPane]((uint64_t)v11));

    v12 = (id *)objc_loadWeakRetained(a1 + 2);
    v13 = v12;
    if (v12)
    {
      v14 = v12[73];
      if (v14)
      {
        v15 = PKCurrentDeviceSupportsPencil();
LABEL_14:
        objc_msgSend(a1[4], "setShouldShowOpenPencilSettingsOption:", v15);

        objc_msgSend(a1[4], "setIsAutoRefineOn:", +[PKSettingsDaemon autoRefineEnabled](PKSettingsDaemon, "autoRefineEnabled"));
        return;
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = 0;
    goto LABEL_14;
  }
}

- (void)autoRefineSettingsDidChange
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Handle AutoRefine settings did change", v3, 2u);
    }

    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _updateMoreOptionsViewController](a1);
  }
}

- (void)handwritingEducationPaneSettingsDidChange
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Handle handwriting education pane settings did change", v3, 2u);
    }

    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _updateMoreOptionsViewController](a1);
  }
}

- (void)didDismissViewController:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1 && *(id *)(a1 + 32) == v3)
  {
    *(_QWORD *)(a1 + 32) = 0;
    v4 = v3;

    v3 = v4;
  }

}

- (void)_changeWasUndone:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  if (!-[PKPencilSqueezeControllerPaletteViewDelegateProxy isUndoRedoInvoked](self, "isUndoRedoInvoked", a3))
  {
    if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView)) != 0)
    {
      v7 = WeakRetained;
      v5 = (void *)*((_QWORD *)WeakRetained + 72);
    }
    else
    {
      v7 = 0;
      v5 = 0;
    }
    v6 = v5;
    objc_msgSend(v6, "updateUI");

  }
}

- (void)_changeWasRedone:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  if (!-[PKPencilSqueezeControllerPaletteViewDelegateProxy isUndoRedoInvoked](self, "isUndoRedoInvoked", a3))
  {
    if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView)) != 0)
    {
      v7 = WeakRetained;
      v5 = (void *)*((_QWORD *)WeakRetained + 72);
    }
    else
    {
      v7 = 0;
      v5 = 0;
    }
    v6 = v5;
    objc_msgSend(v6, "updateUI");

  }
}

- (void)_changeWasDone:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  if (!-[PKPencilSqueezeControllerPaletteViewDelegateProxy isUndoRedoInvoked](self, "isUndoRedoInvoked", a3))
  {
    if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView)) != 0)
    {
      v7 = WeakRetained;
      v5 = (void *)*((_QWORD *)WeakRetained + 72);
    }
    else
    {
      v7 = 0;
      v5 = 0;
    }
    v6 = v5;
    objc_msgSend(v6, "updateUI");

  }
}

- (id)_currentUndoManager
{
  uint64_t *WeakRetained;
  void *v3;
  void *v4;

  if (a1)
  {
    WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 1);
    -[PKPencilSqueezeController _currentUndoManager](WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "cachedUndoManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v3)
      objc_msgSend(a1, "setCachedUndoManager:", v3);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setCachedUndoManager:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachedUndoManager);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);

    if (self)
    {
      if (v5)
      {
        v6 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);

        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = *MEMORY[0x1E0CB33B8];
          v9 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
          objc_msgSend(v7, "removeObserver:name:object:", self, v8, v9);

          v10 = *MEMORY[0x1E0CB33B0];
          v11 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
          objc_msgSend(v7, "removeObserver:name:object:", self, v10, v11);

          v12 = *MEMORY[0x1E0CB33A0];
          v13 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
          objc_msgSend(v7, "removeObserver:name:object:", self, v12, v13);

          objc_storeWeak((id *)&self->_cachedUndoManager, 0);
        }
      }
    }
    v14 = objc_storeWeak((id *)&self->_cachedUndoManager, obj);

    if (obj)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0CB33B8];
      v17 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
      objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__changeWasUndone_, v16, v17);

      v18 = *MEMORY[0x1E0CB33B0];
      v19 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
      objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__changeWasRedone_, v18, v19);

      v20 = *MEMORY[0x1E0CB33A0];
      v21 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
      objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__changeWasDone_, v20, v21);

    }
  }

}

- (BOOL)paletteViewCanUndo:(id)a3
{
  void *v3;
  char v4;

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUndo");

  return v4;
}

- (BOOL)paletteViewCanRedo:(id)a3
{
  void *v3;
  char v4;

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canRedo");

  return v4;
}

- (void)paletteViewDidInvokeUndo:(id)a3
{
  PKPencilSqueezeController **p_controller;
  uint64_t *WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_controller = &self->_controller;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _currentFirstResponder](WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138478083;
    v14 = v6;
    v15 = 2113;
    v16 = v7;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Perform undo action, current FR: %{private}@, undoManager: %{private}@", (uint8_t *)&v13, 0x16u);
  }

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy setIsUndoRedoInvoked:](self, "setIsUndoRedoInvoked:", 1);
  objc_msgSend(v7, "undo");
  -[PKPencilSqueezeControllerPaletteViewDelegateProxy setIsUndoRedoInvoked:](self, "setIsUndoRedoInvoked:", 0);
  v9 = objc_loadWeakRetained((id *)p_controller);
  v10 = v9;
  if (v9)
    v11 = (void *)*((_QWORD *)v9 + 30);
  else
    v11 = 0;
  v12 = v11;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v12);

}

- (void)paletteViewDidInvokeRedo:(id)a3
{
  PKPencilSqueezeController **p_controller;
  uint64_t *WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_controller = &self->_controller;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _currentFirstResponder](WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138478083;
    v14 = v6;
    v15 = 2113;
    v16 = v7;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Perform redo action, current FR: %{private}@, undoManager: %{private}@", (uint8_t *)&v13, 0x16u);
  }

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy setIsUndoRedoInvoked:](self, "setIsUndoRedoInvoked:", 1);
  objc_msgSend(v7, "redo");
  -[PKPencilSqueezeControllerPaletteViewDelegateProxy setIsUndoRedoInvoked:](self, "setIsUndoRedoInvoked:", 0);
  v9 = objc_loadWeakRetained((id *)p_controller);
  v10 = v9;
  if (v9)
    v11 = (void *)*((_QWORD *)v9 + 30);
  else
    v11 = 0;
  v12 = v11;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v12);

}

- (unint64_t)paletteViewUndoCount:(id)a3
{
  void *v3;
  unint64_t v4;

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "undoCount");

  return v4;
}

- (unint64_t)paletteViewRedoCount:(id)a3
{
  void *v3;
  unint64_t v4;

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "redoCount");

  return v4;
}

- (void)paletteViewDidTapRuler:(id)a3
{
  PKPencilSqueezeController **p_controller;
  uint64_t *WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_controller = &self->_controller;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138477827;
    v12 = v5;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Ruler tool tapped, notify tool picker: %{private}@", (uint8_t *)&v11, 0xCu);
  }

  if (v5)
    objc_msgSend(v5, "setRulerActive:", objc_msgSend(v5, "isRulerActive") ^ 1);
  v7 = objc_loadWeakRetained((id *)p_controller);
  v8 = v7;
  if (v7)
    v9 = (void *)*((_QWORD *)v7 + 30);
  else
    v9 = 0;
  v10 = v9;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v10);

}

- (void)paletteView:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5
{
  id v6;
  PKPencilSqueezeController **p_controller;
  uint64_t *WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  p_controller = &self->_controller;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138478083;
    v16 = v6;
    v17 = 2113;
    v18 = v9;
    _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Select tool: %{private}@, on tool picker: %{private}@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v9, "setSelectedTool:", v6);
  v11 = objc_loadWeakRetained((id *)p_controller);
  v12 = v11;
  if (v11)
    v13 = (void *)*((_QWORD *)v11 + 30);
  else
    v13 = 0;
  v14 = v13;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v14);

}

- (void)paletteView:(id)a3 didSelectColor:(id)a4 isFromExtendedColorPicker:(BOOL)a5 isContinuousColorSelection:(BOOL)a6
{
  id WeakRetained;
  void *v9;
  id v10;
  id v11;

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _selectColor:isFromExtendedColorPicker:isContinuousColorSelection:callColorSelectionHandler:]((uint64_t)self, a4, a5, a6, 0);
  if (!a5)
    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _dismissColorPicker]((uint64_t)self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v11 = WeakRetained;
  if (WeakRetained)
    v9 = (void *)*((_QWORD *)WeakRetained + 30);
  else
    v9 = 0;
  v10 = v9;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v10);

}

- (void)_selectColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:(int)a5 callColorSelectionHandler:
{
  id v9;
  uint64_t *WeakRetained;
  void *v11;
  NSObject *v12;
  id *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void (**v21)(id, id, _QWORD);
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  if (a1)
  {
    if ((a4 & 1) == 0)
    {
      WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 8));
      -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138478083;
        v23 = v9;
        v24 = 2113;
        v25 = v11;
        _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Select color: %{private}@, on tool picker: %{private}@", (uint8_t *)&v22, 0x16u);
      }

      objc_msgSend(v11, "_setSelectedColor:isFromExtendedColorPicker:", v9, a3);
    }
    if ((_DWORD)a3)
    {
      v13 = (id *)(a1 + 16);
      v14 = objc_loadWeakRetained(v13);
      v15 = v14;
      v16 = v14 ? (void *)*((_QWORD *)v14 + 76) : 0;
      v17 = v16;

      if (v17)
      {
        if (a5)
        {
          v18 = objc_loadWeakRetained(v13);
          v19 = v18;
          if (v18)
            v20 = (void *)*((_QWORD *)v18 + 76);
          else
            v20 = 0;
          v21 = v20;
          v21[2](v21, v9, a4);

        }
      }
    }
  }

}

- (void)_dismissColorPicker
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1 && -[PKPencilSqueezeControllerPaletteViewDelegateProxy _isColorPickerVisible](a1))
  {
    objc_msgSend(*(id *)(a1 + 64), "viewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138477827;
      v6 = v2;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Dismiss extended color picker: %{private}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);
    v4 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

  }
}

- (void)paletteViewDidInvokeExtendedColorPicker:(id)a3 currentSelectedColor:(id)a4 sourceView:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaletteColorPickerController *colorPickerController;
  PKPaletteColorPickerController *v12;
  PKPaletteColorPickerController *v13;
  void *v14;
  uint64_t *WeakRetained;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  colorPickerController = self->_colorPickerController;
  if (!colorPickerController)
  {
    +[PKPaletteColorPickerControllerFactory makeColorPickerController](PKPaletteColorPickerControllerFactory, "makeColorPickerController");
    v12 = (PKPaletteColorPickerController *)objc_claimAutoreleasedReturnValue();
    v13 = self->_colorPickerController;
    self->_colorPickerController = v12;

    colorPickerController = self->_colorPickerController;
  }
  -[PKPaletteColorPickerController viewController](colorPickerController, "viewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPencilSqueezeControllerPaletteViewDelegateProxy _isColorPickerVisible]((_BOOL8)self))
  {
    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _dismissColorPicker]((uint64_t)self);
  }
  else
  {
    WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_paletteView);
    v16 = WeakRetained;
    if (WeakRetained)
      v17 = WeakRetained[74];
    else
      v17 = 0;
    -[PKPaletteColorPickerController colorPicker](self->_colorPickerController, "colorPicker");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setColorUserInterfaceStyle:", v17);

    -[PKPaletteColorPickerController colorPicker](self->_colorPickerController, "colorPicker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSelectedColor:", v9);

    -[PKPaletteColorPickerController setDelegate:](self->_colorPickerController, "setDelegate:", self);
    v20 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138477827;
      v23 = v14;
      _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEFAULT, "Show extended color picker: %{private}@", (uint8_t *)&v22, 0xCu);
    }

    v21 = objc_loadWeakRetained((id *)&self->_controller);
    -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:]((uint64_t)v21, v14, v10);

  }
}

- (BOOL)_isColorPickerVisible
{
  uint64_t v1;
  void *v2;
  id WeakRetained;
  _BOOL8 v4;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 64), "viewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    v4 = -[PKPencilSqueezeController _isPresentedViewController:]((uint64_t)WeakRetained, v2);

    return v4;
  }
  return result;
}

- (void)paletteViewDidInvokeAddTextBox:(id)a3 sourceView:(id)a4
{
  PKPencilSqueezeController **p_controller;
  uint64_t *WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_controller = &self->_controller;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138477827;
    v14 = v7;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Add text box, tool picker: %{private}@", (uint8_t *)&v13, 0xCu);
  }

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _cycleToolPickerVisible]((uint64_t)self);
  -[PKToolPicker _handleDidInvokeAddTextBox]((uint64_t)v7);
  v9 = objc_loadWeakRetained((id *)p_controller);
  v10 = v9;
  if (v9)
    v11 = (void *)*((_QWORD *)v9 + 30);
  else
    v11 = 0;
  v12 = v11;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v12);

}

- (void)_cycleToolPickerVisible
{
  id *v1;
  uint64_t *WeakRetained;
  void *v3;
  uint64_t *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = (id *)(a1 + 8);
    WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 8));
    -[PKPencilSqueezeController _keyWindow](WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (uint64_t *)objc_loadWeakRetained(v1);
    -[PKPencilSqueezeController _toolPickerForKeyWindow](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138478083;
      v8 = v5;
      v9 = 2113;
      v10 = v3;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Cycle tool picker visibility, toolPicker: %{private}@, window: %{private}@", (uint8_t *)&v7, 0x16u);
    }

    -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)v5, v3, 0, 1, 0);
    -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)v5, 0, 0, 1, 0);

  }
}

- (void)paletteViewDidInvokeSignature:(id)a3 sourceView:(id)a4
{
  id v5;
  PKPencilSqueezeController **p_controller;
  uint64_t *WeakRetained;
  void *v8;
  NSObject *v9;
  UIViewController *lastPresentedSignaturesViewController;
  void *v11;
  id *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  UIViewController *v17;
  void (**v18)(id, void *);
  uint64_t v19;
  NSObject *v20;
  UIViewController *v21;
  UIViewController *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  int v27;
  UIViewController *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  p_controller = &self->_controller;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_lastPresentedSignaturesViewController)
  {
    v9 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      lastPresentedSignaturesViewController = self->_lastPresentedSignaturesViewController;
      v27 = 138478083;
      v28 = lastPresentedSignaturesViewController;
      v29 = 2113;
      v30 = v8;
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Hide Signature view controller: %{private}@, toolPicker: %{private}@", (uint8_t *)&v27, 0x16u);
    }

    -[UIViewController dismissViewControllerAnimated:completion:](self->_lastPresentedSignaturesViewController, "dismissViewControllerAnimated:completion:", 1, 0);
    v11 = self->_lastPresentedSignaturesViewController;
    self->_lastPresentedSignaturesViewController = 0;
LABEL_16:

    v24 = objc_loadWeakRetained((id *)p_controller);
    v11 = v24;
    if (v24)
      v25 = (void *)*((_QWORD *)v24 + 30);
    else
      v25 = 0;
    v18 = v25;
    -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v18);
    goto LABEL_19;
  }
  v12 = (id *)objc_loadWeakRetained((id *)&self->_controller);
  v13 = v12;
  if (v12)
    v11 = objc_loadWeakRetained(v12 + 28);
  else
    v11 = 0;

  objc_msgSend(v8, "_signaturesViewControllerProvider");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (UIViewController *)v16;
LABEL_13:
      v20 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138478083;
        v28 = v17;
        v29 = 2113;
        v30 = v8;
        _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEFAULT, "Show signature view controller: %{private}@, toolPicker: %{private}@", (uint8_t *)&v27, 0x16u);
      }

      v21 = self->_lastPresentedSignaturesViewController;
      self->_lastPresentedSignaturesViewController = v17;
      v22 = v17;

      v23 = objc_loadWeakRetained((id *)p_controller);
      -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:]((uint64_t)v23, v22, v5);

      goto LABEL_16;
    }
  }
  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _cycleToolPickerVisible]((uint64_t)self);
  objc_msgSend(v8, "_signaturesViewControllerProvider");
  v18 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v18[2](v18, v11);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v17 = (UIViewController *)v19;
      v15 = v18;
      goto LABEL_13;
    }
  }
  v26 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = 138478083;
    v28 = 0;
    v29 = 2113;
    v30 = v8;
    _os_log_error_impl(&dword_1BE213000, v26, OS_LOG_TYPE_ERROR, "Failed to show signature view controller: %{private}@, toolPicker: %{private}@", (uint8_t *)&v27, 0x16u);
  }

LABEL_19:
}

- (void)paletteViewDidInvokeAddShape:(id)a3 sourceView:(id)a4
{
  id v5;
  PKPencilSqueezeController **p_controller;
  uint64_t *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  p_controller = &self->_controller;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject _shapeButtonViewController](v8, "_shapeButtonViewController");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[PKPencilSqueezeControllerPaletteViewDelegateProxy _cycleToolPickerVisible]((uint64_t)self),
        -[NSObject _shapeButtonViewController](v8, "_shapeButtonViewController"),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138478083;
      v17 = v9;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Show Shapes view controller: %{private}@, toolPicker: %@", (uint8_t *)&v16, 0x16u);
    }

    v11 = objc_loadWeakRetained((id *)p_controller);
    -[PKPencilSqueezeController _togglePresentViewControllerAsPopover:sourceView:]((uint64_t)v11, v9, v5);

    v12 = objc_loadWeakRetained((id *)p_controller);
    v13 = v12;
    if (v12)
      v14 = (void *)*((_QWORD *)v12 + 30);
    else
      v14 = 0;
    v15 = v14;
    -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v15);

  }
  else
  {
    v9 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = 138477827;
      v17 = v8;
      _os_log_error_impl(&dword_1BE213000, v9, OS_LOG_TYPE_ERROR, "Failed to show shapes view controller for toolPicker: %{private}@", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void)paletteViewDidInvokeAddSticker:(id)a3 sourceView:(id)a4
{
  id v5;
  NSObject *v6;
  _UIStickerPickerViewController *stickerPickerViewController;
  _UIStickerPickerViewController *v8;
  _UIStickerPickerViewController *v9;
  _UIStickerPickerViewController *v10;
  id WeakRetained;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t v17[16];

  v5 = a4;
  v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Show stickers UI", v17, 2u);
  }

  stickerPickerViewController = self->_stickerPickerViewController;
  if (stickerPickerViewController)
  {
    -[_UIStickerPickerViewController dismissCardAnimated:](stickerPickerViewController, "dismissCardAnimated:", 0);
    v8 = self->_stickerPickerViewController;
    self->_stickerPickerViewController = 0;

  }
  v9 = (_UIStickerPickerViewController *)objc_alloc_init(MEMORY[0x1E0DC4420]);
  v10 = self->_stickerPickerViewController;
  self->_stickerPickerViewController = v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[_UIStickerPickerViewController setSourceView:](self->_stickerPickerViewController, "setSourceView:", WeakRetained);

  objc_msgSend(v5, "frame");
  -[_UIStickerPickerViewController setSourceRect:](self->_stickerPickerViewController, "setSourceRect:");
  -[_UIStickerPickerViewController setDelegate:](self->_stickerPickerViewController, "setDelegate:", self);
  v12 = objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:]((uint64_t)v12, self->_stickerPickerViewController, v5);

  v13 = objc_loadWeakRetained((id *)&self->_controller);
  v14 = v13;
  if (v13)
    v15 = (void *)*((_QWORD *)v13 + 30);
  else
    v15 = 0;
  v16 = v15;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v16);

}

- (void)paletteViewDidInvokeMoreOptions:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 moreOptionsViewControllerVisible;
  PKPaletteMoreOptionsViewController *moreOptionsViewController;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  PKPaletteMoreOptionsViewController *v15;
  id *WeakRetained;
  PKPaletteMoreOptionsViewController *v17;
  PKPaletteMoreOptionsViewController *v18;
  NSObject *v19;
  PKPaletteMoreOptionsViewController *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  _BYTE v25[14];
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_moreOptionsViewControllerVisible ^= 1u;
  v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    moreOptionsViewControllerVisible = self->_moreOptionsViewControllerVisible;
    moreOptionsViewController = self->_moreOptionsViewController;
    v11 = -[PKPaletteMoreOptionsViewController isBeingDismissed](moreOptionsViewController, "isBeingDismissed");
    v12 = -[PKPaletteMoreOptionsViewController isBeingPresented](self->_moreOptionsViewController, "isBeingPresented");
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v25 = moreOptionsViewControllerVisible;
    *(_WORD *)&v25[4] = 2048;
    *(_QWORD *)&v25[6] = moreOptionsViewController;
    v26 = 1024;
    v27 = v11;
    v28 = 1024;
    v29 = v12;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "moreOptionsViewControllerVisible: %d, _moreOptionsViewController: %p, dismissing: %d, presenting: %d", buf, 0x1Eu);
  }

  if (self->_moreOptionsViewControllerVisible)
  {
    if ((-[PKPaletteMoreOptionsViewController isBeingDismissed](self->_moreOptionsViewController, "isBeingDismissed") & 1) != 0)
      v13 = 1;
    else
      v13 = -[PKPaletteMoreOptionsViewController isBeingPresented](self->_moreOptionsViewController, "isBeingPresented");
    v17 = objc_alloc_init(PKPaletteMoreOptionsViewController);
    v18 = self->_moreOptionsViewController;
    self->_moreOptionsViewController = v17;

    -[PKPaletteMoreOptionsViewController setDelegate:](self->_moreOptionsViewController, "setDelegate:", self);
    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _updateMoreOptionsViewController]((id *)&self->super.isa);
    v19 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_moreOptionsViewController;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v25 = v20;
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)&v25[10] = v13;
      _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEFAULT, "Show More view controller: %p, afterDelay: %{BOOL}d", buf, 0x12u);
    }

    objc_initWeak((id *)buf, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __96__PKPencilSqueezeControllerPaletteViewDelegateProxy_paletteViewDidInvokeMoreOptions_sourceView___block_invoke;
    v21[3] = &unk_1E77785D8;
    objc_copyWeak(&v23, (id *)buf);
    v22 = v7;
    PKPerformOnMainThreadNextRunLoop(v21, v13);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_moreOptionsViewController;
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)v25 = v15;
      _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, "Hide More view controller: %{private}@", buf, 0xCu);
    }

    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_controller);
    -[PKPencilSqueezeController _dismissPopovers](WeakRetained);

  }
}

void __96__PKPencilSqueezeControllerPaletteViewDelegateProxy_paletteViewDidInvokeMoreOptions_sourceView___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 24))
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = v3[4];
      v7 = objc_msgSend(v6, "isBeingDismissed");
      v8 = objc_msgSend(v3[4], "isBeingPresented");
      v9 = 134218496;
      v10 = v6;
      v11 = 1024;
      v12 = v7;
      v13 = 1024;
      v14 = v8;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "delayed show More view controller: %p, dismissing: %d, presenting: %d", (uint8_t *)&v9, 0x18u);
    }

    v5 = objc_loadWeakRetained(v3 + 1);
    -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:]((uint64_t)v5, v3[4], *(void **)(a1 + 32));

  }
}

- (void)moreOptionsViewControllerDidToggleFingerDraws:(id)a3
{
  int v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "isFingerDrawsOn");
  v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Toggle draw with finger setting, isFingerDrawsOn: %{BOOL}d", (uint8_t *)v10, 8u);
  }

  +[PKSettingsDaemon setPrefersPencilOnlyDrawing:](PKSettingsDaemon, "setPrefersPencilOnlyDrawing:", v4 ^ 1u);
  -[PKStatisticsManager recordDrawWithFingerToggle:]((uint64_t)self->_statisticsManager);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v7 = WeakRetained;
  if (WeakRetained)
    v8 = (void *)*((_QWORD *)WeakRetained + 30);
  else
    v8 = 0;
  v9 = v8;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v9);

}

- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  uint8_t v9[16];

  v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Open pencil settings", v9, 2u);
  }

  +[PKSettingsDaemon openPencilPreferences](PKSettingsDaemon, "openPencilPreferences");
  -[PKStatisticsManager recordJumpToSettings]((uint64_t)self->_statisticsManager);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = (void *)*((_QWORD *)WeakRetained + 30);
  else
    v7 = 0;
  v8 = v7;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v8);

}

- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v6 = WeakRetained;
  if (WeakRetained)
    v4 = (void *)*((_QWORD *)WeakRetained + 30);
  else
    v4 = 0;
  v5 = v4;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v5);

}

- (void)moreOptionsViewControllerDidToggleAutoRefine:(id)a3
{
  +[PKSettingsDaemon setAutoRefineEnabled:](PKSettingsDaemon, "setAutoRefineEnabled:", -[PKPaletteMoreOptionsViewController isAutoRefineOn](self->_moreOptionsViewController, "isAutoRefineOn", a3));
}

- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  objc_msgSend(a3, "colorPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _selectColor:isFromExtendedColorPicker:isContinuousColorSelection:callColorSelectionHandler:]((uint64_t)self, v7, 1, v4, 1);
}

- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t *WeakRetained;
  void *v7;
  NSObject *v8;
  _UIStickerPickerViewController *stickerPickerViewController;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _cycleToolPickerVisible]((uint64_t)self);
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138477827;
    v11 = v7;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Insert sticker, tool picker: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  -[PKToolPicker _handleInsertStickerFromItemProvider:]((uint64_t)v7, v5);
  -[_UIStickerPickerViewController dismissCardAnimated:](self->_stickerPickerViewController, "dismissCardAnimated:", 1);
  stickerPickerViewController = self->_stickerPickerViewController;
  self->_stickerPickerViewController = 0;

}

- (void)stickerPickerViewControllerDidDismiss
{
  _UIStickerPickerViewController *stickerPickerViewController;

  stickerPickerViewController = self->_stickerPickerViewController;
  self->_stickerPickerViewController = 0;

}

- (NSUndoManager)cachedUndoManager
{
  return (NSUndoManager *)objc_loadWeakRetained((id *)&self->_cachedUndoManager);
}

- (BOOL)isUndoRedoInvoked
{
  return self->_isUndoRedoInvoked;
}

- (void)setIsUndoRedoInvoked:(BOOL)a3
{
  self->_isUndoRedoInvoked = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cachedUndoManager);
  objc_storeStrong((id *)&self->_stickerPickerViewController, 0);
  objc_storeStrong((id *)&self->_colorPickerController, 0);
  objc_storeStrong((id *)&self->_lastPresentedSignaturesViewController, 0);
  objc_storeStrong((id *)&self->_hoverSettings, 0);
  objc_storeStrong((id *)&self->_statisticsManager, 0);
  objc_storeStrong((id *)&self->_moreOptionsViewController, 0);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_destroyWeak((id *)&self->_controller);
}

@end
