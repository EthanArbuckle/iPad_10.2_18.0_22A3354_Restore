@implementation PKSelectionInteraction

- (void)_updateAllowedTouchTypesForSelectedInk:(id)a3 hasCurrentSelection:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id WeakRetained;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v4 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "_isLassoInk"))
  {
    v58 = 0uLL;
    v59 = 0uLL;
    v56 = 0uLL;
    v57 = 0uLL;
    -[PKSelectionInteraction _gestures](self, "_gestures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v57 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "setAllowedTouchTypes:", &unk_1E77ECA90);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v8);
    }

  }
  else if (v4)
  {
    v54 = 0uLL;
    v55 = 0uLL;
    v52 = 0uLL;
    v53 = 0uLL;
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = *(void **)(v11 + 144);
    else
      v13 = 0;
    v14 = v13;
    objc_msgSend(v14, "_selectionViewGestures");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "setAllowedTouchTypes:", &unk_1E77ECA90);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v17);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[PKSelectionInteraction _selectionModifierGestures](self, "_selectionModifierGestures");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v49;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "setAllowedTouchTypes:", &unk_1E77ECA90);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v22);
    }

    -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_insertSpaceAffordanceGesture, "setAllowedTouchTypes:", &unk_1E77ECA90);
  }
  else
  {
    v46 = 0uLL;
    v47 = 0uLL;
    v44 = 0uLL;
    v45 = 0uLL;
    -[PKSelectionInteraction _gestures](self, "_gestures");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v45;
      v28 = (void *)MEMORY[0x1E0C9AA60];
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v45 != v27)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v29);
          -[PKSelectionInteraction selectionController](self, "selectionController");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v31)
            WeakRetained = objc_loadWeakRetained((id *)(v31 + 112));
          else
            WeakRetained = 0;
          if (objc_msgSend(WeakRetained, "allowsFingerDrawing"))
            v34 = v28;
          else
            v34 = &unk_1E77ECAA8;
          objc_msgSend(v30, "setAllowedTouchTypes:", v34);

          objc_msgSend(v30, "name");
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v35 == CFSTR("com.apple.PencilKit.knobDrag"))
          {
            -[PKSelectionInteraction selectionController](self, "selectionController");
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = (void *)v36;
            if (v36)
              v38 = objc_loadWeakRetained((id *)(v36 + 112));
            else
              v38 = 0;
            -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "uuid");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "_attachmentForUUID:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v41, "isExternalAttachment"))
              objc_msgSend(v30, "setAllowedTouchTypes:", &unk_1E77ECA90);

            v28 = (void *)MEMORY[0x1E0C9AA60];
          }
          ++v29;
        }
        while (v26 != v29);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        v26 = v42;
      }
      while (v42);
    }

  }
  -[PKSelectionInteraction _updateAllowedTouchTypesForLassoGR](self, "_updateAllowedTouchTypesForLassoGR");
}

- (PKSelectionController)selectionController
{
  return (PKSelectionController *)objc_loadWeakRetained((id *)&self->_selectionController);
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PKSelectionInteraction _adornmentLayers](self, "_adornmentLayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v8++), "removeFromSuperlayer");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PKSelectionInteraction _gestures](self, "_gestures", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
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
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          -[PKSelectionInteraction view](self, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeGestureRecognizer:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObserver:name:object:", self, CFSTR("PKToolPickerDidShowNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:name:object:", self, CFSTR("PKToolPickerDidHideNotification"), 0);

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void)setInsertSpaceEnabled:(BOOL)a3
{
  self->_insertSpaceEnabled = a3;
  -[PKSelectionInteraction _addInsertSpaceAffordanceGestureIfNecessary](self, "_addInsertSpaceAffordanceGestureIfNecessary");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKSelectionInteraction)initWithSelectionController:(id)a3
{
  id v4;
  PKSelectionInteraction *v5;
  PKSelectionRendering *v6;
  PKSelectionRendering *lassoRenderer;
  PKSelectionGlowRenderer *v8;
  PKSelectionGlowRenderer *glowRenderer;
  uint64_t v10;
  NSMutableArray *selectionViewGestures;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSelectionInteraction;
  v5 = -[PKSelectionInteraction init](&v13, sel_init);
  if (v5)
  {
    v6 = -[PKLassoRenderer initForLiveSelectionWithRenderingDelegate:]([PKLassoRenderer alloc], "initForLiveSelectionWithRenderingDelegate:", v4);
    lassoRenderer = v5->_lassoRenderer;
    v5->_lassoRenderer = v6;

    v8 = -[PKSelectionGlowRenderer initForLiveSelectionWithRenderingDelegate:]([PKSelectionGlowRenderer alloc], "initForLiveSelectionWithRenderingDelegate:", v4);
    glowRenderer = v5->_glowRenderer;
    v5->_glowRenderer = v8;

    objc_storeWeak((id *)&v5->_selectionController, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    selectionViewGestures = v5->_selectionViewGestures;
    v5->_selectionViewGestures = (NSMutableArray *)v10;

    v5->_enabled = 1;
  }

  return v5;
}

- (void)didMoveToView:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PKSelectionInteraction setView:](self, "setView:");
  if (a3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PKSelectionInteraction _adornmentLayers](self, "_adornmentLayers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
          -[PKSelectionInteraction view](self, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addSublayer:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    -[PKSelectionInteraction _setupGestures](self, "_setupGestures");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__toolPickerDidShowHide_, CFSTR("PKToolPickerDidShowNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__toolPickerDidShowHide_, CFSTR("PKToolPickerDidHideNotification"), 0);

  }
}

- (void)_updateAllowedTouchTypesForSelectedInk:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  id v7;

  v4 = a3;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (v5)
    v6 = *(_QWORD *)(v5 + 120) != 0;
  else
    v6 = 0;
  -[PKSelectionInteraction _updateAllowedTouchTypesForSelectedInk:hasCurrentSelection:](self, "_updateAllowedTouchTypesForSelectedInk:hasCurrentSelection:", v4, v6);

}

- (void)_updateAllowedTouchTypesForLassoGR
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isLassoInk");

  if (v7)
  {
    if (!PKIsVisionDevice())
    {
      -[PKSelectionInteraction selectionController](self, "selectionController");
      v8 = objc_claimAutoreleasedReturnValue();
      v11 = (id)v8;
      if (v8)
        v9 = objc_loadWeakRetained((id *)(v8 + 112));
      else
        v9 = 0;
      if (objc_msgSend(v9, "allowsFingerDrawing"))
        v10 = &unk_1E77ECAD8;
      else
        v10 = &unk_1E77ECAC0;
      -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_lassoGestureRecognizer, "setAllowedTouchTypes:", v10);

    }
  }
  else
  {
    -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_lassoGestureRecognizer, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
  }
}

- (void)_setupGestures
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *lassoGestureRecognizer;
  void *v5;
  UILongPressGestureRecognizer *v6;
  UILongPressGestureRecognizer *knobBrushGestureRecognizer;
  void *v8;
  UIPanGestureRecognizer *v9;
  UIPanGestureRecognizer *knobDragGestureRecognizer;
  void *v11;
  UITapGestureRecognizer *v12;
  UITapGestureRecognizer *noOpTapGestureRecognizer;
  void *v14;
  UITapGestureRecognizer *v15;
  UITapGestureRecognizer *progressiveTapGestureRecognizer;
  void *v17;
  UILongPressGestureRecognizer *v18;
  UILongPressGestureRecognizer *tapAndHoldToSelectLongPressGestureRecognizer;
  void *v20;
  UITapAndAHalfRecognizer *v21;
  UITapAndAHalfRecognizer *modifySelectionRecognizer;
  void *v23;

  v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__didBeginSelection_);
  lassoGestureRecognizer = self->_lassoGestureRecognizer;
  self->_lassoGestureRecognizer = v3;

  -[UIPanGestureRecognizer setName:](self->_lassoGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.lasso"));
  -[UIPanGestureRecognizer setDelegate:](self->_lassoGestureRecognizer, "setDelegate:", self);
  -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_lassoGestureRecognizer, "setMaximumNumberOfTouches:", 1);
  -[PKSelectionInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_lassoGestureRecognizer);

  v6 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__didBrushWithKnob_);
  knobBrushGestureRecognizer = self->_knobBrushGestureRecognizer;
  self->_knobBrushGestureRecognizer = v6;

  -[UILongPressGestureRecognizer setName:](self->_knobBrushGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.knobBrush"));
  -[UILongPressGestureRecognizer setDelegate:](self->_knobBrushGestureRecognizer, "setDelegate:", self);
  -[PKSelectionInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:", self->_knobBrushGestureRecognizer);

  v9 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__didDragKnob_);
  knobDragGestureRecognizer = self->_knobDragGestureRecognizer;
  self->_knobDragGestureRecognizer = v9;

  -[UIPanGestureRecognizer setName:](self->_knobDragGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.knobDrag"));
  -[UIPanGestureRecognizer setDelegate:](self->_knobDragGestureRecognizer, "setDelegate:", self);
  -[PKSelectionInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", self->_knobDragGestureRecognizer);

  v12 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__eatGesture_);
  noOpTapGestureRecognizer = self->_noOpTapGestureRecognizer;
  self->_noOpTapGestureRecognizer = v12;

  -[UITapGestureRecognizer setName:](self->_noOpTapGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.noOpTap"));
  -[UITapGestureRecognizer setDelegate:](self->_noOpTapGestureRecognizer, "setDelegate:", self);
  -[PKSelectionInteraction view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addGestureRecognizer:", self->_noOpTapGestureRecognizer);

  v15 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__didSmartSelectTap_);
  progressiveTapGestureRecognizer = self->_progressiveTapGestureRecognizer;
  self->_progressiveTapGestureRecognizer = v15;

  -[UITapGestureRecognizer setName:](self->_progressiveTapGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.progressiveTaps"));
  -[UITapGestureRecognizer setDelegate:](self->_progressiveTapGestureRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_progressiveTapGestureRecognizer, "setNumberOfTouchesRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_progressiveTapGestureRecognizer, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setAllowableMovement:](self->_progressiveTapGestureRecognizer, "setAllowableMovement:", 10.0);
  -[PKSelectionInteraction view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addGestureRecognizer:", self->_progressiveTapGestureRecognizer);

  v18 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__pressAndHoldLinearExpand_);
  tapAndHoldToSelectLongPressGestureRecognizer = self->_tapAndHoldToSelectLongPressGestureRecognizer;
  self->_tapAndHoldToSelectLongPressGestureRecognizer = v18;

  -[UILongPressGestureRecognizer setName:](self->_tapAndHoldToSelectLongPressGestureRecognizer, "setName:", CFSTR("com.apple.PencilKit.longPressToSelectToken"));
  -[UILongPressGestureRecognizer setDelegate:](self->_tapAndHoldToSelectLongPressGestureRecognizer, "setDelegate:", self);
  -[PKSelectionInteraction view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addGestureRecognizer:", self->_tapAndHoldToSelectLongPressGestureRecognizer);

  v21 = (UITapAndAHalfRecognizer *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("UITapAndAHalfRecognizer"))), "initWithTarget:action:", self, sel__didTapAndDrag_);
  modifySelectionRecognizer = self->_modifySelectionRecognizer;
  self->_modifySelectionRecognizer = v21;

  -[UITapAndAHalfRecognizer setName:](self->_modifySelectionRecognizer, "setName:", CFSTR("com.apple.PencilKit.modifySelection"));
  -[UITapAndAHalfRecognizer setDelegate:](self->_modifySelectionRecognizer, "setDelegate:", self);
  -[UITapAndAHalfRecognizer setNumberOfFullTaps:](self->_modifySelectionRecognizer, "setNumberOfFullTaps:", 1);
  -[PKSelectionInteraction view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addGestureRecognizer:", self->_modifySelectionRecognizer);

  if (-[PKSelectionInteraction _insertSpaceAffordanceEnabled](self, "_insertSpaceAffordanceEnabled"))
    -[PKSelectionInteraction _addInsertSpaceAffordanceGestureIfNecessary](self, "_addInsertSpaceAffordanceGestureIfNecessary");
}

- (BOOL)_insertSpaceAffordanceEnabled
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  _BYTE *v6;
  BOOL v7;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 112));
  else
    WeakRetained = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = v6[106] != 0;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_gestures
{
  void *v3;
  UIPanGestureRecognizer *knobDragGestureRecognizer;
  UILongPressGestureRecognizer *knobBrushGestureRecognizer;
  UILongPressGestureRecognizer *tapAndHoldToSelectLongPressGestureRecognizer;
  void *v7;
  _QWORD v9[3];
  __int128 v10;
  UITapAndAHalfRecognizer *modifySelectionRecognizer;
  UILongPressGestureRecognizer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  knobBrushGestureRecognizer = self->_knobBrushGestureRecognizer;
  knobDragGestureRecognizer = self->_knobDragGestureRecognizer;
  v9[0] = self->_lassoGestureRecognizer;
  v9[1] = knobDragGestureRecognizer;
  v9[2] = knobBrushGestureRecognizer;
  v10 = *(_OWORD *)&self->_noOpTapGestureRecognizer;
  tapAndHoldToSelectLongPressGestureRecognizer = self->_tapAndHoldToSelectLongPressGestureRecognizer;
  modifySelectionRecognizer = self->_modifySelectionRecognizer;
  v12 = tapAndHoldToSelectLongPressGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);
  if (self->_insertSpaceEnabled && self->_insertSpaceAffordanceGesture)
    objc_msgSend(v3, "addObject:");
  objc_msgSend(v3, "addObjectsFromArray:", self->_selectionViewGestures);

  return v3;
}

- (id)_adornmentLayers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[PKSelectionRendering adornmentLayer](self->_lassoRenderer, "adornmentLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[PKSelectionGlowRenderer adornmentLayer](self->_glowRenderer, "adornmentLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_addInsertSpaceAffordanceGestureIfNecessary
{
  _BYTE *v3;
  UIPanGestureRecognizer *insertSpaceAffordanceGesture;
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *v6;
  id v7;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3 && v3[106])
  {
    insertSpaceAffordanceGesture = self->_insertSpaceAffordanceGesture;

    if (insertSpaceAffordanceGesture)
      return;
    v5 = (UIPanGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3AA0]);
    v6 = self->_insertSpaceAffordanceGesture;
    self->_insertSpaceAffordanceGesture = v5;

    -[UIPanGestureRecognizer setDelegate:](self->_insertSpaceAffordanceGesture, "setDelegate:", self);
    -[UIPanGestureRecognizer addTarget:action:](self->_insertSpaceAffordanceGesture, "addTarget:action:", self, sel__didGrabInsertSpaceAffordance_);
    -[PKSelectionInteraction view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:", self->_insertSpaceAffordanceGesture);
    v3 = v7;
  }

}

- (BOOL)hasCurrentSelection
{
  _QWORD *v2;
  BOOL v3;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[15] != 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)currentSelectionHasStrokes
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = *(void **)(v2 + 120);
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "strokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (BOOL)hasStrokesOrElementsSelection
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && *(_QWORD *)(v3 + 120))
  {
    v5 = 1;
  }
  else
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKSelectionController _hasExternalElementsSelectedInAttachment:]((uint64_t)v6, 0);

  }
  return v5;
}

- (BOOL)hasStrokesAtLocation:(CGPoint)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  void *v23;
  BOOL v24;
  double y;
  double x;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_attachmentForUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "strokeSpatialCache");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10 && *(_BYTE *)(v10 + 8))
  {
    objc_msgSend(v9, "strokeSpatialCache");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = *(void **)(v12 + 24);
    else
      v14 = 0;
    v15 = v14;

  }
  else
  {
    objc_msgSend(v4, "strokes");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16 && (v18 = objc_loadWeakRetained((id *)(v16 + 112))) != 0)
  {
    v19 = v18;
    objc_msgSend(v18, "transformFromViewToStrokeSpaceInDrawing:", v4);
    v20 = v29;
    v21 = v30;
    v22 = v31;
  }
  else
  {
    v19 = 0;
    v22 = 0uLL;
    v20 = 0uLL;
    v21 = 0uLL;
  }
  v28 = vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, y), v20, x));

  objc_msgSend(v4, "intersectedStrokesAtPoint:selectionType:inputType:visibleOnscreenStrokes:", 1, 0, v15, *(_OWORD *)&v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count") != 0;

  return v24;
}

- (void)didResizeExternalElements
{
  id *v2;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _didResizeExternalElements](v2);

}

- (id)_gesturesForLiveSelection
{
  UIPanGestureRecognizer *knobDragGestureRecognizer;
  UITapAndAHalfRecognizer *modifySelectionRecognizer;
  UILongPressGestureRecognizer *tapAndHoldToSelectLongPressGestureRecognizer;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  knobDragGestureRecognizer = self->_knobDragGestureRecognizer;
  tapAndHoldToSelectLongPressGestureRecognizer = self->_tapAndHoldToSelectLongPressGestureRecognizer;
  modifySelectionRecognizer = self->_modifySelectionRecognizer;
  v6[0] = self->_knobBrushGestureRecognizer;
  v6[1] = modifySelectionRecognizer;
  v6[2] = knobDragGestureRecognizer;
  v6[3] = tapAndHoldToSelectLongPressGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_liveSelectionGestureStillActive
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKSelectionInteraction _gesturesForLiveSelection](self, "_gesturesForLiveSelection", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "state") == 1 || objc_msgSend(v7, "state") == 2)
        {
          v8 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void)_didGrabInsertSpaceAffordance:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "state");
  if (v4 == 1 || objc_msgSend(v9, "state") == 3 || objc_msgSend(v9, "state") == 4 || objc_msgSend(v9, "state") == 5)
    -[PKDrawingAdjustmentKnob setHidden:](self->_insertSpaceAffordance, "setHidden:", v4 == 1);
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 136);
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "_didGrabInsertSpaceAffordance:", v9);

}

- (id)_selectionModifierGestures
{
  UILongPressGestureRecognizer *knobBrushGestureRecognizer;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  knobBrushGestureRecognizer = self->_knobBrushGestureRecognizer;
  v4[0] = self->_knobDragGestureRecognizer;
  v4[1] = knobBrushGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_didAddSelectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKSelectionInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __47__PKSelectionInteraction__didAddSelectionView___block_invoke;
  v31[3] = &unk_1E7777C20;
  v31[4] = self;
  v7 = v4;
  v32 = v7;
  +[PKToolPicker _performWithVisibilityUpdatesEnabled:window:block:](PKToolPicker, "_performWithVisibilityUpdatesEnabled:window:block:", 0, v6, v31);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v7, "_selectionViewGestures", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "setDelegate:", self);
        -[NSMutableArray addObject:](self->_selectionViewGestures, "addObject:", v13);
        -[PKSelectionInteraction view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addGestureRecognizer:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v10);
  }

  if (-[PKSelectionInteraction _insertSpaceAffordanceEnabled](self, "_insertSpaceAffordanceEnabled"))
  {
    -[PKSelectionInteraction _cleanupInsertSpaceAffordance](self, "_cleanupInsertSpaceAffordance");
    -[PKSelectionInteraction _addInsertSpaceAffordance](self, "_addInsertSpaceAffordance");
  }
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    WeakRetained = objc_loadWeakRetained((id *)(v15 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "ink");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction _updateAllowedTouchTypesForSelectedInk:hasCurrentSelection:](self, "_updateAllowedTouchTypesForSelectedInk:hasCurrentSelection:", v18, 1);

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = objc_loadWeakRetained((id *)(v19 + 112));
  else
    v21 = 0;
  v22 = objc_msgSend(v21, "allowsFingerDrawing");

  if ((v22 & 1) == 0)
    -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_lassoGestureRecognizer, "setAllowedTouchTypes:", &unk_1E77ECA78);
  -[PKSelectionInteraction view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "_selectionContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSelectionMask:", objc_msgSend(v26, "selectionMask") | 1);

  }
}

void __47__PKSelectionInteraction__didAddSelectionView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", *(_QWORD *)(a1 + 40));

}

- (void)_willRemoveSelectionView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a3, "_selectionViewGestures", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableArray removeObject:](self->_selectionViewGestures, "removeObject:", v9);
        -[PKSelectionInteraction view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeGestureRecognizer:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    WeakRetained = objc_loadWeakRetained((id *)(v11 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "ink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction _updateAllowedTouchTypesForSelectedInk:hasCurrentSelection:](self, "_updateAllowedTouchTypesForSelectedInk:hasCurrentSelection:", v14, 0);

  if (-[PKSelectionInteraction _insertSpaceAffordanceEnabled](self, "_insertSpaceAffordanceEnabled"))
    -[PKSelectionInteraction _cleanupInsertSpaceAffordance](self, "_cleanupInsertSpaceAffordance");
  -[PKSelectionInteraction view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "_selectionContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSelectionMask:", objc_msgSend(v18, "selectionMask") & 0xFFFFFFFFFFFFFFFELL);

  }
}

- (void)_toolPickerDidShowHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKToolPickerNotificationWindowSceneUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v24;
  if (v5 == v8)
  {
    objc_msgSend(v24, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11[15];

      if (!v12)
      {
LABEL_13:

        v9 = v24;
        goto LABEL_14;
      }
      -[PKSelectionInteraction selectionController](self, "selectionController");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = *(void **)(v13 + 120);
      else
        v15 = 0;
      v16 = v15;
      objc_msgSend(v16, "drawing");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSelectionInteraction selectionController](self, "selectionController");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        WeakRetained = objc_loadWeakRetained((id *)(v18 + 112));
      else
        WeakRetained = 0;
      objc_msgSend(v17, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_attachmentForUUID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 && (objc_msgSend(v22, "isExternalAttachment") & 1) == 0)
      {
        objc_msgSend(v10, "_selectionContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setSelectionMask:", objc_msgSend(v23, "selectionMask") | 1);

      }
    }
    else
    {
      v17 = 0;
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)_didBeginDraggingSelection:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  -[PKDrawingAdjustmentKnob setAlpha:](self->_insertSpaceAffordance, "setAlpha:", a3, 0.0);
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v4;
  if (v4)
    v5 = *(void **)(v4 + 136);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "invalidateCachedStrokes");

}

- (void)_didEndDraggingSelection:(id)a3
{
  -[PKDrawingAdjustmentKnob setAlpha:](self->_insertSpaceAffordance, "setAlpha:", a3, 1.0);
  -[PKSelectionInteraction _updateInsertSpaceAffordancePosition](self, "_updateInsertSpaceAffordancePosition");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PKSelectionInteraction _gestures](self, "_gestures", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEnabled:", v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_cleanupInsertSpaceAffordance
{
  PKDrawingAdjustmentKnob *insertSpaceAffordance;

  -[PKDrawingAdjustmentKnob removeFromSuperview](self->_insertSpaceAffordance, "removeFromSuperview");
  insertSpaceAffordance = self->_insertSpaceAffordance;
  self->_insertSpaceAffordance = 0;

}

- (void)_addInsertSpaceAffordance
{
  PKDrawingAdjustmentKnob *v3;
  PKDrawingAdjustmentKnob *insertSpaceAffordance;
  PKDrawingAdjustmentKnob *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc_init(PKDrawingAdjustmentKnob);
  insertSpaceAffordance = self->_insertSpaceAffordance;
  self->_insertSpaceAffordance = v3;

  v5 = self->_insertSpaceAffordance;
  -[PKSelectionInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingAdjustmentKnob setTintColor:](v5, "setTintColor:", v7);

  -[PKSelectionInteraction _updateInsertSpaceAffordancePosition](self, "_updateInsertSpaceAffordancePosition");
  -[PKSelectionInteraction view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_insertSpaceAffordance);

}

- (void)_updateInsertSpaceAffordancePosition
{
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  double v7;
  double v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;

  -[PKSelectionInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController topView](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v11 = v7;
  if (v4)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v7);
    +[PKDrawingAdjustmentKnob leftMargin](PKDrawingAdjustmentKnob, "leftMargin");
    v14 = MaxX - v13 + -15.0;
  }
  else
  {
    +[PKDrawingAdjustmentKnob leftMargin](PKDrawingAdjustmentKnob, "leftMargin");
    v14 = v11 + v15;
  }

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = *(void **)(v16 + 144);
  else
    v18 = 0;
  v19 = v18;
  objc_msgSend(v19, "frame");
  v21 = v20 + -10.0;

  -[PKDrawingAdjustmentKnob setFrame:](self->_insertSpaceAffordance, "setFrame:", v14, v21, 15.0, 16.0);
}

- (id)_drawingForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _drawingForSelectionRect:]((uint64_t)v5, x + -22.0, y + -22.0, 44.0, 44.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_timestampForGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a3, "touches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSelectionInteraction _timestampForTouch:](self, "_timestampForTouch:", v5);
  v7 = v6;

  return v7;
}

- (double)_timestampForTouch:(id)a3
{
  double result;
  void *v4;
  double v5;
  double v6;

  if (a3)
  {
    objc_msgSend(a3, "timestamp");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    v6 = v5;

    return v6;
  }
  return result;
}

- (void)_clearLiveSelectionPath
{
  NSMutableOrderedSet *smartSelectedStrokes;

  -[PKSelectionGlowRenderer _renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:](self->_glowRenderer, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  smartSelectedStrokes = self->_smartSelectedStrokes;
  self->_smartSelectedStrokes = 0;

}

- (void)_didSmartSelectTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  double v39[3];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKSelectionInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction setCurrentDrawing:](self, "setCurrentDrawing:", v10);

  objc_msgSend(v4, "touches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "type") == 2;
  if (objc_msgSend(v4, "state") == 3)
  {
    if (-[PKSelectionInteraction _isRepeatedTap:](self, "_isRepeatedTap:", v4))
    {
      if (self->_currentTapCount == 1)
      {
        -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionInteraction selectionController](self, "selectionController");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15 && (WeakRetained = objc_loadWeakRetained((id *)(v15 + 112))) != 0)
        {
          v18 = WeakRetained;
          objc_msgSend(WeakRetained, "transformFromViewToStrokeSpaceInDrawing:", v14);
          v20 = *((double *)&v37 + 1);
          v19 = *(double *)&v37;
          v22 = *((double *)&v38 + 1);
          v21 = *(double *)&v38;
          v23 = v39[1];
          v24 = v39[0];
        }
        else
        {
          v18 = 0;
          v38 = 0u;
          *(_OWORD *)v39 = 0u;
          v37 = 0u;
          v23 = 0.0;
          v22 = 0.0;
          v20 = 0.0;
          v24 = 0.0;
          v21 = 0.0;
          v19 = 0.0;
        }

        -[PKSelectionInteraction delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[PKSelectionInteraction delegate](self, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "selectionInteraction:handleDoubleTapOnCanvasAtLocation:", self, v24 + v9 * v21 + v19 * v7, v23 + v9 * v22 + v20 * v7);

          if (v30)
          {
            -[PKSelectionInteraction _cancelDeferredPasteFromTappingAction](self, "_cancelDeferredPasteFromTappingAction");
            self->_currentTapCount = 1;

            goto LABEL_19;
          }
        }
        else
        {

        }
      }
      if (!-[PKSelectionInteraction gesturesAllowedForPaletteState](self, "gesturesAllowedForPaletteState", v37, v38, *(_OWORD *)v39))goto LABEL_19;
      -[PKSelectionInteraction _dismissEditMenuIfNecessary](self, "_dismissEditMenuIfNecessary");
      ++self->_currentTapCount;
      +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", -[PKSelectionInteraction _selectionTypeForTapCount:](self, "_selectionTypeForTapCount:"), v13, v7, v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionInteraction selectionController](self, "selectionController");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v31)
        v33 = *(void **)(v31 + 120);
      else
        v33 = 0;
      v34 = v33;
      objc_msgSend(v34, "strokes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "array");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionInteraction _updateProgressiveTapSelectionWithSelectionInput:existingSelection:](self, "_updateProgressiveTapSelectionWithSelectionInput:existingSelection:", v26, v36);

      -[PKSelectionInteraction _cancelDeferredPasteFromTappingAction](self, "_cancelDeferredPasteFromTappingAction");
      v27 = sel__selectViaContinuousTapWithInput_;
    }
    else
    {
      self->_currentTapCount = 1;
      v40[0] = CFSTR("locationValue");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v7, v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = CFSTR("gestureRecognizer");
      v41[0] = v25;
      v41[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = sel__handleSingleTap_;
    }
    -[PKSelectionInteraction performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", v27, v26, 0.35);

    -[PKSelectionInteraction _updateTapGestureHistoryWithLocation:gesture:](self, "_updateTapGestureHistoryWithLocation:gesture:", v4, v7, v9);
  }
LABEL_19:

}

- (void)_cancelDeferredPasteFromTappingAction
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (int64_t)_selectionTypeForTapCount:(int64_t)a3
{
  uint64_t v3;

  v3 = 2;
  if (a3 > 2)
    v3 = a3;
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

- (void)_updateTapGestureHistoryWithLocation:(CGPoint)a3 gesture:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction _timestampForGestureRecognizer:](self, "_timestampForGestureRecognizer:", a4);
  self->_lastTapLocation.y = y;
  self->_lastTapTimestamp = v7;
  self->_lastTapLocation.x = x;
}

- (BOOL)_isWithinRepeatedTapTimeForGesture:(id)a3
{
  double v4;

  -[PKSelectionInteraction _timestampForGestureRecognizer:](self, "_timestampForGestureRecognizer:", a3);
  return v4 - self->_lastTapTimestamp <= 0.35;
}

- (BOOL)_isRepeatedTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[PKSelectionInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  LODWORD(v5) = -[PKSelectionInteraction _isWithinRepeatedTapTimeForGesture:](self, "_isWithinRepeatedTapTimeForGesture:", v4);
  if (!(_DWORD)v5)
    return 0;
  v10 = sqrt((v9 - self->_lastTapLocation.y) * (v9 - self->_lastTapLocation.y)+ (v7 - self->_lastTapLocation.x) * (v7 - self->_lastTapLocation.x));
  return v10 * v10 < 625.0;
}

- (void)_handleSingleTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  char isKindOfClass;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  double v35;
  double v36;
  id *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  int v55;
  void *v56;
  void *v57;
  id *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("locationValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGPointValue");
  v69 = v6;
  v70 = v7;

  objc_msgSend(v4, "valueForKey:", CFSTR("gestureRecognizer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    WeakRetained = objc_loadWeakRetained((id *)(v9 + 112));
  else
    WeakRetained = 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = objc_loadWeakRetained((id *)(v13 + 112));
  else
    v15 = 0;
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_attachmentForUUID:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  if ((isKindOfClass & 1) != 0)
    v20 = 0;
  else
    v20 = v18;
  if (v20 | v19)
  {
    v21 = objc_opt_class();
    PKDynamicCast(v21, (void *)v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    PKDynamicCast(v23, (void *)v19);
    v24 = objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = objc_loadWeakRetained((id *)(v25 + 112));
    else
      v27 = 0;
    -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v27, "transformFromViewToStrokeSpaceInDrawing:", v28);
      v63 = v72;
      v64 = v71;
      v65 = v73;
    }
    else
    {
      v64 = 0u;
      v65 = 0u;
      v63 = 0u;
    }

    v68 = (void *)v24;
    if (v22)
      v29 = v22;
    else
      v29 = (void *)v24;
    v30 = v29;
    -[PKSelectionInteraction delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v30;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKSelectionInteraction delegate](self, "delegate", *(_OWORD *)&v63, *(_OWORD *)&v64);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionInteraction view](self, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "convertPoint:fromView:", v33, v69, v70);
      v34 = objc_msgSend(v32, "selectionInteraction:handleTapOnCanvasAtLocation:inAttachment:", self, v30);

      v36 = v69;
      v35 = v70;
      if ((v34 & 1) != 0)
        goto LABEL_40;
    }
    else
    {

      v36 = v69;
      v35 = v70;
    }
    v66 = vaddq_f64(v65, vmlaq_n_f64(vmulq_n_f64(v63, v35), v64, v36));
    -[PKSelectionInteraction selectionController](self, "selectionController", *(_OWORD *)&v63, *(_OWORD *)&v64);
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _externalElementsAtLocation:inAttachment:](v37, (void *)v20, v66.f64[0], v66.f64[1]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend(v38, "count");
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    if (v39)
    {
      -[PKSelectionController _selectedExternalElementsInAttachment:](v40, (void *)v20);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v38, "isEqualToOrderedSet:", v42) & 1) == 0)
      {
        -[PKSelectionInteraction selectionController](self, "selectionController");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v43;
        if (v43)
          -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v43, 1, 0);

      }
      -[PKSelectionInteraction selectionController](self, "selectionController");
      v45 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _didTapElement:withGesture:inAttachment:](v45, v46, v8, (void *)v20);
      goto LABEL_30;
    }
    v47 = -[PKSelectionController _hasStrokesOrExternalElementsSelectedInAttachment:](v40, (void *)v20);

    if (v47)
    {
      -[PKSelectionInteraction selectionController](self, "selectionController");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v48;
      if (v48)
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v48, 1, 0);

      -[PKSelectionInteraction selectionController](self, "selectionController");
      v50 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v50;
      if (v50)
        v51 = *(void **)(v50 + 136);
      else
        v51 = 0;
      v45 = v51;
      objc_msgSend(v45, "invalidateCachedStrokes");
      goto LABEL_37;
    }
    if (v20)
    {
      -[PKSelectionInteraction selectionController](self, "selectionController");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v52;
      if (v52)
        v54 = objc_loadWeakRetained((id *)(v52 + 112));
      else
        v54 = 0;
      v55 = objc_msgSend(v54, "editMenuVisible");

      if (!v55)
      {
        v61 = objc_opt_class();
        PKDynamicCast(v61, (void *)v20);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionInteraction delegate](self, "delegate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v62 || !v42)
          goto LABEL_38;
        -[PKSelectionInteraction selectionController](self, "selectionController");
        v45 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController topView](v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "_showEditMenuFromLocation:forAttachment:", v42, v69, v70);
        goto LABEL_30;
      }
      -[PKSelectionInteraction dismissEditMenuIfNecessary](self, "dismissEditMenuIfNecessary");
      objc_msgSend((id)v20, "viewRep");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v56;
    }
    else
    {
      if (!v19)
        goto LABEL_39;
      objc_msgSend((id)v19, "attachmentContainerView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v57;
      if (!v57
        || (objc_msgSend(v57, "isFirstResponder") & 1) != 0
        || (objc_msgSend(v42, "_isAncestorOfFirstResponder") & 1) != 0)
      {
        -[PKSelectionInteraction selectionController](self, "selectionController");
        v58 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController topView](v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "editMenuVisible");

        if (v60)
        {
          -[PKSelectionInteraction dismissEditMenuIfNecessary](self, "dismissEditMenuIfNecessary");
          objc_msgSend((id)v19, "viewRep");
          v45 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "becomeFirstResponder");
          goto LABEL_37;
        }
        if (!-[PKSelectionInteraction gesturesAllowedForPaletteState](self, "gesturesAllowedForPaletteState"))
          goto LABEL_38;
        -[PKSelectionInteraction selectionController](self, "selectionController");
        v45 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController topView](v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "_handleSingleTapAtLocation:forAttachment:", v19, v69, v70);
LABEL_30:

LABEL_37:
LABEL_38:

LABEL_39:
LABEL_40:

        goto LABEL_41;
      }
      v56 = v42;
    }
    objc_msgSend(v56, "becomeFirstResponder");
    goto LABEL_38;
  }
LABEL_41:

}

- (void)dismissEditMenuIfNecessary
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 112));
  else
    WeakRetained = 0;
  v6 = objc_msgSend(WeakRetained, "editMenuVisible");

  if (v6)
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v7, 1, 0);

    -[PKSelectionInteraction selectionController](self, "selectionController");
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = (id)v9;
    if (v9)
      v10 = objc_loadWeakRetained((id *)(v9 + 112));
    else
      v10 = 0;
    objc_msgSend(v10, "editMenuInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissMenu");

  }
}

- (void)_didBeginSelection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIBezierPath *v11;
  UIBezierPath *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned __int8 *v19;
  int v20;
  PKSelectionInteraction *v21;
  const CGPath *v22;
  UIBezierPath *lassoPath;
  UIBezierPath *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  id WeakRetained;

  v4 = a3;
  -[PKSelectionInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = objc_msgSend(v4, "state");
  switch(v10)
  {
    case 3:
      if (-[PKSelectionInteraction _isLassoAddingSpace:](self, "_isLassoAddingSpace:", v7, v9)
        && (-[PKSelectionInteraction selectionController](self, "selectionController"),
            (v19 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue()) != 0)
        && (v20 = v19[106], v19, v20))
      {
        -[PKSelectionInteraction _didEndLassoAddingSpaceAtLocation:](self, "_didEndLassoAddingSpaceAtLocation:", v7, v9);
      }
      else
      {
        lassoPath = self->_lassoPath;
        -[PKSelectionInteraction _drawingBeganLocation](self, "_drawingBeganLocation");
        -[UIBezierPath addLineToPoint:](lassoPath, "addLineToPoint:");
        -[UIBezierPath closePath](self->_lassoPath, "closePath");
        -[PKSelectionInteraction _updateLiveLassoPath:](self, "_updateLiveLassoPath:", -[UIBezierPath CGPath](self->_lassoPath, "CGPath"));
        -[PKSelectionInteraction _didEndLassoSelectionWithPath:](self, "_didEndLassoSelectionWithPath:", self->_lassoPath);
      }
      v24 = self->_lassoPath;
      self->_lassoPath = 0;

      goto LABEL_14;
    case 2:
      -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionInteraction clampInputPointForSelection:forDrawing:](self, "clampInputPointForSelection:forDrawing:", v14, v7, v9);
      v16 = v15;
      v18 = v17;

      -[UIBezierPath addLineToPoint:](self->_lassoPath, "addLineToPoint:", v16, v18);
LABEL_14:
      v22 = -[UIBezierPath CGPath](self->_lassoPath, "CGPath");
      v21 = self;
      goto LABEL_15;
    case 1:
      -[PKSelectionInteraction set_drawingBeganLocation:](self, "set_drawingBeganLocation:", v7, v9);
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v11 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
      v12 = self->_lassoPath;
      self->_lassoPath = v11;

      -[UIBezierPath moveToPoint:](self->_lassoPath, "moveToPoint:", v7, v9);
      -[PKSelectionInteraction _updateLiveLassoPath:](self, "_updateLiveLassoPath:", -[UIBezierPath CGPath](self->_lassoPath, "CGPath"));
      -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionInteraction setCurrentDrawing:](self, "setCurrentDrawing:", v13);

      goto LABEL_16;
  }
  if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v21 = self;
    v22 = 0;
LABEL_15:
    -[PKSelectionInteraction _updateLiveLassoPath:](v21, "_updateLiveLassoPath:", v22);
  }
LABEL_16:
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    WeakRetained = objc_loadWeakRetained((id *)(v25 + 112));
  else
    WeakRetained = 0;

  if ((unint64_t)(v10 - 3) >= 3)
  {
    v29 = WeakRetained;
    if (v10 == 1)
    {
      objc_msgSend(WeakRetained, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_opt_respondsToSelector();

      v29 = WeakRetained;
      if ((v32 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "delegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "canvasViewDidBeginLasso:", WeakRetained);
        goto LABEL_24;
      }
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_respondsToSelector();

    v29 = WeakRetained;
    if ((v28 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "canvasViewDidEndLasso:", WeakRetained);
LABEL_24:

      v29 = WeakRetained;
    }
  }

}

- (void)_updateLiveLassoPath:(CGPath *)a3
{
  PKSelectionRendering *lassoRenderer;
  id v5;

  lassoRenderer = self->_lassoRenderer;
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionRendering _renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:](lassoRenderer, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", a3, 0, v5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (void)_didEndLassoSelectionWithPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController lassoSelectStrokesInDrawing:withPath:]((uint64_t)v5, v6, v4);

}

- (BOOL)_isLassoAddingSpace:(CGPoint)a3
{
  double x;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  BOOL result;

  x = a3.x;
  -[PKSelectionInteraction view](self, "view", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6 * 0.1;

  -[PKSelectionInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  -[PKSelectionInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v10 + v12 - v7;

  -[PKSelectionInteraction _drawingBeganLocation](self, "_drawingBeganLocation");
  v15 = v14 >= v7 || x <= v13;
  result = 1;
  if (v15)
  {
    if (x >= v7)
      return 0;
    -[PKSelectionInteraction _drawingBeganLocation](self, "_drawingBeganLocation");
    if (v16 <= v13)
      return 0;
  }
  return result;
}

- (void)_didEndLassoAddingSpaceAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id *v7;

  y = a3.y;
  x = a3.x;
  +[PKStatisticsManager sharedStatisticsManager]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordInsertSpaceWithType:]((uint64_t)v6, 0);

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController didBeginSpaceInsertionWithLassoPath:atLocation:](v7, self->_lassoPath, x, y);

}

- (CGPoint)clampInputPointForSelection:(CGPoint)a3 forDrawing:(id)a4
{
  double y;
  CGFloat x;
  id v7;
  PKSelectionController **p_selectionController;
  id WeakRetained;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  id v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double MinY;
  double MaxY;
  id v39;
  char v40;
  double v41;
  double v42;
  CGPoint result;
  CGRect v44;
  CGRect v45;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  p_selectionController = &self->_selectionController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  v10 = -[PKSelectionController shouldClampInputPoints]((uint64_t)WeakRetained);

  if (v7 && v10)
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = objc_loadWeakRetained((id *)(v11 + 112));
    else
      v13 = 0;
    objc_msgSend(v7, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_attachmentForUUID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "viewRep");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "viewRep");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = objc_loadWeakRetained((id *)(v26 + 112));
    else
      v28 = 0;
    objc_msgSend(v16, "convertRect:toView:", v28, v19, v21, v23, v25);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    v44.origin.x = v30;
    v44.origin.y = v32;
    v44.size.width = v34;
    v44.size.height = v36;
    MinY = CGRectGetMinY(v44);
    v45.origin.x = v30;
    v45.origin.y = v32;
    v45.size.width = v34;
    v45.size.height = v36;
    MaxY = CGRectGetMaxY(v45);
    if (fabs(MinY) != INFINITY && fabs(MaxY) != INFINITY)
    {
      if (y >= MinY)
      {
        v39 = objc_loadWeakRetained((id *)p_selectionController);
        v40 = -[PKSelectionController _liveDrawingIsAtEndOfDocument]((uint64_t)v39);

        if ((v40 & 1) == 0 && y > MaxY + -8.0)
          y = MaxY + -8.0;
      }
      else
      {
        y = MinY + 2.0;
      }
    }

  }
  v41 = x;
  v42 = y;
  result.y = v42;
  result.x = v41;
  return result;
}

- (void)_dismissEditMenuIfNecessary
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "editMenuInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissMenu");

}

- (void)_selectViaContinuousTapWithInput:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PKSelectionInteraction *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "location");
  -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PKSelectionInteraction__selectViaContinuousTapWithInput___block_invoke;
  v8[3] = &unk_1E777A0D0;
  v9 = v4;
  v10 = self;
  v11 = v5;
  v6 = v5;
  v7 = v4;
  -[PKSelectionInteraction _intersectedStrokesInDrawing:forSelectionInput:existingSelection:completion:](self, "_intersectedStrokesInDrawing:forSelectionInput:existingSelection:completion:", v6, v7, 0, v8);

}

void __59__PKSelectionInteraction__selectViaContinuousTapWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v3 = a2;
  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordSmartSelectionEventWithType:contentType:gestureInvoked:", objc_msgSend(*(id *)(a1 + 32), "selectionType"), objc_msgSend(v3, "contentType"), 1);

  objc_msgSend(*(id *)(a1 + 40), "selectionController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intersectedStrokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(*(id *)(a1 + 32), "selectionType");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__PKSelectionInteraction__selectViaContinuousTapWithInput___block_invoke_2;
  v9[3] = &unk_1E7778020;
  v8 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v5, v6, 0, v7, v8, v9);

}

uint64_t __59__PKSelectionInteraction__selectViaContinuousTapWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearLiveSelectionPath");
}

- (void)_didTapAndDrag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  void *v12;
  _QWORD *WeakRetained;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  NSObject *v28;
  _BOOL4 v29;
  int64_t v30;
  uint64_t v31;
  void *v32;
  int64_t modificationType;
  PKSelectionGlowRenderer *glowRenderer;
  uint64_t v35;
  unint64_t v36;
  double v37;
  unint64_t v38;
  int64_t v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  NSOrderedSet *v44;
  NSOrderedSet *initialStrokeSelectionBeforeModification;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  NSMutableOrderedSet *v51;
  NSMutableOrderedSet *smartSelectedStrokes;
  id v53;
  void *v54;
  NSMutableOrderedSet *v55;
  NSMutableOrderedSet *v56;
  _QWORD v57[6];
  uint8_t buf[16];

  v4 = a3;
  -[PKSelectionInteraction _dismissEditMenuIfNecessary](self, "_dismissEditMenuIfNecessary");
  -[UITapAndAHalfRecognizer touch](self->_modifySelectionRecognizer, "touch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = objc_msgSend(v5, "type") == 2;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[UIPanGestureRecognizer setState:](self->_lassoGestureRecognizer, "setState:", 4);
    -[PKSelectionInteraction _cancelDeferredPasteFromTappingAction](self, "_cancelDeferredPasteFromTappingAction");
    -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction setCurrentDrawing:](self, "setCurrentDrawing:", v12);

    -[PKSelectionInteraction _resetVelocityWindow](self, "_resetVelocityWindow");
    -[PKSelectionGlowRenderer _willBeginDragKnobLocation:atPoint:knobDragMode:]((uint64_t)self->_glowRenderer, 0, 0, v8, v10);
    WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    if (WeakRetained && (v14 = WeakRetained[15], WeakRetained, v14))
    {
      v15 = objc_loadWeakRetained((id *)&self->_selectionController);
      v16 = v15;
      if (v15)
        v17 = (void *)*((_QWORD *)v15 + 18);
      else
        v17 = 0;
      v18 = v17;
      objc_msgSend(v5, "locationInView:", v18);
      v20 = v19;
      v22 = v21;

      v23 = objc_loadWeakRetained((id *)&self->_selectionController);
      v24 = v23;
      if (v23)
        v25 = (void *)*((_QWORD *)v23 + 18);
      else
        v25 = 0;
      v26 = v25;
      v27 = objc_msgSend(v26, "containsPoint:forInputType:", v11, v20, v22);

      v28 = os_log_create("com.apple.pencilkit", "Selection");
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      if ((v27 & 1) != 0)
      {
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEBUG, "Should be adding to a current selection", buf, 2u);
        }
        v30 = 1;
      }
      else if (v29)
      {
        *(_WORD *)buf = 0;
        v30 = 2;
        _os_log_debug_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEBUG, "Should be removing from a current selection", buf, 2u);
      }
      else
      {
        v30 = 2;
      }

      self->_modificationType = v30;
      v40 = objc_loadWeakRetained((id *)&self->_selectionController);
      v41 = v40;
      if (v40)
        v42 = (void *)*((_QWORD *)v40 + 15);
      else
        v42 = 0;
      v43 = v42;
      objc_msgSend(v43, "strokes");
      v44 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
      initialStrokeSelectionBeforeModification = self->_initialStrokeSelectionBeforeModification;
      self->_initialStrokeSelectionBeforeModification = v44;

      v46 = objc_loadWeakRetained((id *)&self->_selectionController);
      v47 = v46;
      if (v46)
        v48 = (void *)*((_QWORD *)v46 + 15);
      else
        v48 = 0;
      v49 = v48;
      objc_msgSend(v49, "strokes");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (NSMutableOrderedSet *)objc_msgSend(v50, "mutableCopy");
      smartSelectedStrokes = self->_smartSelectedStrokes;
      self->_smartSelectedStrokes = v51;

      v53 = objc_loadWeakRetained((id *)&self->_selectionController);
      v54 = v53;
      if (v53)
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v53, 1, 0);

    }
    else
    {
      self->_modificationType = 1;
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v55 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      v56 = self->_smartSelectedStrokes;
      self->_smartSelectedStrokes = v55;

    }
    +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", 1, v11, v8, v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:](self, "_updateSmartSelectionWithInput:modificationType:", v32, self->_modificationType);
    goto LABEL_38;
  }
  if (objc_msgSend(v4, "state") == 2)
  {
    -[PKSelectionInteraction _updateVelocityWindowWithTouch:location:](self, "_updateVelocityWindowWithTouch:location:", v5, v8, v10);
    v31 = -[PKSelectionInteraction _selectionTypeForVelocity:](self, "_selectionTypeForVelocity:");
    +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", v31, v11, v8, v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:](self, "_updateSmartSelectionWithInput:modificationType:", v32, self->_modificationType);
    modificationType = self->_modificationType;
    glowRenderer = self->_glowRenderer;
    v35 = objc_msgSend(v5, "type");
    if (glowRenderer)
    {
      if (modificationType == 1)
        v36 = 1;
      else
        v36 = 2;
      glowRenderer->_knobDragMode = v36;
      -[PKSelectionGlowRenderer _updateKnobAppearanceForDragAtKnobLocation:point:knobDragMode:selectionType:touchType:]((uint64_t)glowRenderer, 0, v36, v31, v35, v8, v10);
    }
    goto LABEL_38;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    if (self->_modificationType == 1)
      v38 = 1;
    else
      v38 = 2;
    -[PKSelectionGlowRenderer _didEndDragKnobLocation:knobDragMode:]((uint64_t)self->_glowRenderer, v37, 0, v38);
    +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", 1, v11, v8, v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self->_modificationType;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __41__PKSelectionInteraction__didTapAndDrag___block_invoke;
    v57[3] = &unk_1E7778048;
    v57[4] = self;
    v57[5] = 1;
    -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:completion:](self, "_updateSmartSelectionWithInput:modificationType:completion:", v32, v39, v57);
LABEL_38:

    goto LABEL_39;
  }
  if (objc_msgSend(v4, "state") == 5 || objc_msgSend(v4, "state") == 4)
    -[PKSelectionInteraction _clearLiveSelectionPath](self, "_clearLiveSelectionPath");
LABEL_39:

}

void __41__PKSelectionInteraction__didTapAndDrag___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[40];
  objc_msgSend(v3, "currentDrawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKSelectionController contentTypeForIntersectedStrokes:inDrawing:]((uint64_t)v2, v4, v5);

  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordSmartSelectionEventWithType:contentType:gestureInvoked:", *(_QWORD *)(a1 + 40), v6, 2);

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = (void *)v9[40];
  objc_msgSend(v9, "currentDrawing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__PKSelectionInteraction__didTapAndDrag___block_invoke_2;
  v13[3] = &unk_1E7778020;
  v13[4] = *(_QWORD *)(a1 + 32);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v8, v11, 0, v10, v12, v13);

}

uint64_t __41__PKSelectionInteraction__didTapAndDrag___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearLiveSelectionPath");
}

- (void)_resetVelocityWindow
{
  NSMutableArray *v3;
  NSMutableArray *tapAndDragVelocityArray;

  self->_tapAndDragVelocityCount = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  tapAndDragVelocityArray = self->_tapAndDragVelocityArray;
  self->_tapAndDragVelocityArray = v3;

}

- (double)_updateVelocityWindowWithTouch:(id)a3 location:(CGPoint)a4
{
  double result;

  -[PKSelectionInteraction _timestampForTouch:](self, "_timestampForTouch:", a3);
  -[PKSelectionInteraction _updateVelocityWindowWithTimestamp:location:](self, "_updateVelocityWindowWithTimestamp:location:");
  return result;
}

- (double)_updateVelocityWindowWithTimestamp:(double)a3 location:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  double v8;
  int64_t tapAndDragVelocityCount;
  unint64_t v10;
  NSMutableArray *v11;
  void *v12;
  NSMutableArray *tapAndDragVelocityArray;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  float v20;
  int64_t v21;
  double result;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  y = a4.y;
  x = a4.x;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = sqrt((a4.y - self->_lastDoubleTapAndDragLocation.y) * (a4.y - self->_lastDoubleTapAndDragLocation.y)+ (a4.x - self->_lastDoubleTapAndDragLocation.x) * (a4.x - self->_lastDoubleTapAndDragLocation.x))/ (a3 - self->_lastDoubleTapAndDragTimestamp);
  tapAndDragVelocityCount = self->_tapAndDragVelocityCount;
  self->_tapAndDragVelocityCount = tapAndDragVelocityCount + 1;
  if (tapAndDragVelocityCount < 20)
  {
    tapAndDragVelocityArray = self->_tapAndDragVelocityArray;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](tapAndDragVelocityArray, "addObject:", v12);
  }
  else
  {
    v10 = (tapAndDragVelocityCount + 1) % 0x14uLL;
    v11 = self->_tapAndDragVelocityArray;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](v11, "replaceObjectAtIndex:withObject:", v10, v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_tapAndDragVelocityArray;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    v18 = 0.0;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "floatValue", (_QWORD)v23);
        v18 = v18 + v20;
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }
  else
  {
    v18 = 0.0;
  }

  v21 = self->_tapAndDragVelocityCount;
  result = v18 / fmin((double)v21, 20.0);
  if (v21 < 10)
    result = 500.0;
  self->_lastDoubleTapAndDragLocation.x = x;
  self->_lastDoubleTapAndDragLocation.y = y;
  self->_lastDoubleTapAndDragTimestamp = a3;
  return result;
}

- (int64_t)_selectionTypeForVelocity:(double)a3
{
  if (a3 <= 500.0)
    return 1;
  if (a3 <= 1200.0)
    return 2;
  return 3;
}

- (id)_visibleOnscreenStrokesForDrawing:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;

  v4 = a3;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_attachmentForUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "strokeSpatialCache");
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v10 = (_QWORD *)v10[3];
  v12 = v10;

  return v12;
}

- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4 completion:(id)a5
{
  return -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:](self, "_updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:", a3, a4, a5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4
{
  return -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:](self, "_updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:", a3, a4, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  PKSelectionGlowRenderer *glowRenderer;
  NSMutableOrderedSet *smartSelectedStrokes;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v38[5];
  id v39;
  int64_t v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  y = a5.y;
  x = a5.x;
  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  objc_msgSend(v11, "location");
  v14 = v13;
  v16 = v15;
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v17, v14, v16);
  v19 = v18;
  v21 = v20;

  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction _visibleOnscreenStrokesForDrawing:](self, "_visibleOnscreenStrokesForDrawing:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKClusteringUtility _geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:](PKClusteringUtility, "_geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:", v23, 1, objc_msgSend(v11, "inputType"), v19, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 3)
  {
    if (!objc_msgSend(v24, "count"))
    {
      v30 = 0;
      a4 = 3;
      goto LABEL_17;
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v44;
      a4 = 2;
LABEL_5:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(v25);
        if ((-[NSMutableOrderedSet containsObject:](self->_smartSelectedStrokes, "containsObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v29)) & 1) != 0)break;
        if (v27 == ++v29)
        {
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v27)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      a4 = 1;
    }

  }
  if (a4 == 2)
    v30 = 2;
  else
    v30 = a4 == 1;
LABEL_17:
  glowRenderer = self->_glowRenderer;
  smartSelectedStrokes = self->_smartSelectedStrokes;
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionGlowRenderer _renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:](glowRenderer, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, smartSelectedStrokes, v33, x, y);

  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_smartSelectedStrokes, "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __102__PKSelectionInteraction__updateSmartSelectionWithInput_modificationType_liveScrollOffset_completion___block_invoke;
  v38[3] = &unk_1E777A0F8;
  v39 = v12;
  v40 = a4;
  v41 = x;
  v42 = y;
  v38[4] = self;
  v36 = v12;
  -[PKSelectionInteraction _intersectedStrokesInDrawing:forSelectionInput:existingSelection:completion:](self, "_intersectedStrokesInDrawing:forSelectionInput:existingSelection:completion:", v34, v11, v35, v38);

  return v30;
}

void __102__PKSelectionInteraction__updateSmartSelectionWithInput_modificationType_liveScrollOffset_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320))
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 320);
    *(_QWORD *)(v4 + 320) = v3;

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == 2)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
    objc_msgSend(v16, "intersectedStrokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minusOrderedSet:", v8);
    goto LABEL_7;
  }
  if (v6 == 1)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
    objc_msgSend(v16, "intersectedStrokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionOrderedSet:", v8);
LABEL_7:

  }
  v10 = *(_QWORD **)(a1 + 32);
  if (v10[40] && objc_msgSend(v10, "_liveSelectionGestureStillActive"))
  {
    v11 = *(_QWORD **)(a1 + 32);
    v12 = (void *)v11[2];
    v13 = v11[40];
    objc_msgSend(v11, "currentDrawing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, v13, v14, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();

}

- (void)_updateProgressiveTapSelectionWithSelectionInput:(id)a3 existingSelection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v6 = a4;
  v7 = a3;
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__PKSelectionInteraction__updateProgressiveTapSelectionWithSelectionInput_existingSelection___block_invoke;
  v9[3] = &unk_1E777A120;
  v9[4] = self;
  -[PKSelectionInteraction _intersectedStrokesInDrawing:forSelectionInput:existingSelection:completion:](self, "_intersectedStrokesInDrawing:forSelectionInput:existingSelection:completion:", v8, v7, v6, v9);

}

void __93__PKSelectionInteraction__updateProgressiveTapSelectionWithSelectionInput_existingSelection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "intersectedStrokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v8, "intersectedStrokes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentDrawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, v6, v7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  }
}

- (void)_intersectedStrokesInDrawing:(id)a3 forSelectionInput:(id)a4 existingSelection:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "strokes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v11, "location");
    -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v10);
    v17 = v16;
    v19 = v18;
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v11, "selectionType");
    v22 = objc_msgSend(v11, "inputType");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __102__PKSelectionInteraction__intersectedStrokesInDrawing_forSelectionInput_existingSelection_completion___block_invoke;
    v24[3] = &unk_1E777A148;
    v25 = v13;
    -[PKSelectionController fetchStrokesToSelectAtPoint:inDrawing:withSelectionType:inputType:existingSelection:completion:]((uint64_t)v20, v10, v21, v22, v12, v24, v17, v19);

  }
  else
  {
    +[PKIntersectionResult noResult](PKIntersectionResult, "noResult");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v23);

  }
}

uint64_t __102__PKSelectionInteraction__intersectedStrokesInDrawing_forSelectionInput_existingSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_pressAndHoldLinearExpand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  NSMutableOrderedSet *v17;
  NSMutableOrderedSet *smartSelectedStrokes;
  void *v19;
  int64_t modificationType;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int64_t v34;
  uint64_t v35;
  double v36;
  NSOrderedSet *initialStrokeSelectionBeforeModification;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double MaxY;
  double v55;
  CGFloat v56;
  double MinX;
  double MinY;
  int64_t currentlyDraggedKnob;
  double v60;
  double v61;
  uint64_t v62;
  void *v63;
  id WeakRetained;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  PKSelectionGlowRenderer *glowRenderer;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  double MaxX;
  double v79;
  CGFloat v80;
  double v81;
  _QWORD v82[5];
  __int128 v83;
  __int128 v84;
  double v85[3];
  _QWORD v86[5];
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v4 = a3;
  -[PKSelectionInteraction _dismissEditMenuIfNecessary](self, "_dismissEditMenuIfNecessary");
  -[UILongPressGestureRecognizer touches](self->_tapAndHoldToSelectLongPressGestureRecognizer, "touches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSelectionInteraction view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(v6, "type") == 2;
  if (objc_msgSend(v4, "state") == 1)
  {
    if (-[PKSelectionInteraction _didLongPressExternalElementAtLocation:](self, "_didLongPressExternalElementAtLocation:", v9, v11)|| !-[PKSelectionInteraction hasStrokesAtLocation:](self, "hasStrokesAtLocation:", v9, v11))
    {
      objc_msgSend(v4, "setState:", 5);
    }
    else
    {
      -[UIPanGestureRecognizer setState:](self->_lassoGestureRecognizer, "setState:", 4);
      -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v9, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionInteraction setCurrentDrawing:](self, "setCurrentDrawing:", v13);

      -[PKSelectionInteraction _resetVelocityWindow](self, "_resetVelocityWindow");
      *(_OWORD *)&self->_currentlyDraggedKnob = xmmword_1BE4FD150;
      -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v14, v9, v11);
      self->_undraggedKnobLocationInStrokeSpace.x = v15;
      self->_undraggedKnobLocationInStrokeSpace.y = v16;

      -[PKSelectionGlowRenderer _willBeginDragKnobLocation:atPoint:knobDragMode:]((uint64_t)self->_glowRenderer, self->_currentlyDraggedKnob, self->_knobDragMode, v9, v11);
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v17 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      smartSelectedStrokes = self->_smartSelectedStrokes;
      self->_smartSelectedStrokes = v17;

      self->_modificationType = 1;
      self->_currentScrollOffset = (CGPoint)*MEMORY[0x1E0C9D538];
      +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", 2, v12, v9, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      modificationType = self->_modificationType;
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke;
      v86[3] = &unk_1E7778020;
      v86[4] = self;
      -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:completion:](self, "_updateSmartSelectionWithInput:modificationType:completion:", v19, modificationType, v86);

    }
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "state") == 2)
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PKSelectionController autoscrollForPointIfNecessary:]((uint64_t)v21, v9, v11);
    v24 = v23;

    v25 = v24 + self->_currentScrollOffset.y;
    self->_currentScrollOffset.x = v22 + self->_currentScrollOffset.x;
    self->_currentScrollOffset.y = v25;
    if (!self->_initialStrokeSelectionBeforeModification)
      goto LABEL_37;
    +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    if (-[PKSelectionInteraction _locationShouldFlipOverLeftKnob:](self, "_locationShouldFlipOverLeftKnob:", v9, v11))
    {
      v34 = 0;
      v35 = 1;
    }
    else
    {
      if (!-[PKSelectionInteraction _locationShouldFlipOverRightKnob:](self, "_locationShouldFlipOverRightKnob:", v9, v11))goto LABEL_18;
      v35 = 0;
      v34 = 1;
    }
    self->_currentlyDraggedKnob = v34;
    -[PKSelectionInteraction _undraggedKnobLocation:forInitialStrokeBounds:](self, "_undraggedKnobLocation:forInitialStrokeBounds:", v35, v27, v29, v31, v33);
    self->_undraggedKnobLocationInStrokeSpace.x = v38;
    self->_undraggedKnobLocationInStrokeSpace.y = v39;
LABEL_18:
    +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", self->_firstStrokesInInitialStrokes);
    v80 = v40;
    v42 = v41;
    v44 = v43;
    v77 = v45;
    +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", self->_lastStrokesInInitialStrokes);
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v75 = v52;
    v76 = v42;
    v73 = v46;
    v74 = v48;
    if (-[PKSelectionInteraction isLTR](self, "isLTR"))
    {
      v87.origin.x = v47;
      v87.origin.y = v49;
      v87.size.width = v51;
      v87.size.height = v53;
      MaxX = CGRectGetMaxX(v87);
      v88.origin.x = v47;
      v88.origin.y = v49;
      v88.size.width = v51;
      v88.size.height = v53;
      MaxY = CGRectGetMaxY(v88);
    }
    else
    {
      v89.origin.x = v80;
      v89.origin.y = v42;
      v89.size.width = v44;
      v89.size.height = v77;
      MaxX = CGRectGetMaxX(v89);
      v90.origin.x = v80;
      v90.size.height = v77;
      v90.origin.y = v42;
      v90.size.width = v44;
      MaxY = CGRectGetMinY(v90);
    }
    v55 = MaxY;
    v56 = v44;
    if (-[PKSelectionInteraction isLTR](self, "isLTR"))
    {
      v91.origin.x = v80;
      v91.origin.y = v76;
      v91.size.width = v44;
      v91.size.height = v77;
      MinX = CGRectGetMinX(v91);
      v92.origin.x = v80;
      v92.origin.y = v76;
      v92.size.width = v56;
      v92.size.height = v77;
      MinY = CGRectGetMinY(v92);
    }
    else
    {
      v93.origin.x = v73;
      v93.origin.y = v74;
      v93.size.width = v51;
      v93.size.height = v75;
      MinX = CGRectGetMinX(v93);
      v94.origin.x = v73;
      v94.origin.y = v74;
      v94.size.width = v51;
      v94.size.height = v75;
      MinY = CGRectGetMaxY(v94);
    }
    currentlyDraggedKnob = self->_currentlyDraggedKnob;
    if (currentlyDraggedKnob)
      v60 = MinY;
    else
      v60 = v55;
    if (currentlyDraggedKnob)
      v61 = MinX;
    else
      v61 = MaxX;
    v79 = v61;
    v81 = v60;
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v62;
    if (v62)
      WeakRetained = objc_loadWeakRetained((id *)(v62 + 112));
    else
      WeakRetained = 0;
    -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v65);
      v66 = *((double *)&v83 + 1);
      v67 = *(double *)&v83;
      v69 = *((double *)&v84 + 1);
      v68 = *(double *)&v84;
      v71 = v85[1];
      v70 = v85[0];
    }
    else
    {
      v84 = 0u;
      *(_OWORD *)v85 = 0u;
      v83 = 0u;
      v71 = 0.0;
      v69 = 0.0;
      v66 = 0.0;
      v70 = 0.0;
      v68 = 0.0;
      v67 = 0.0;
    }

    -[PKSelectionInteraction _updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:](self, "_updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:", self->_initialStrokeSelectionBeforeModification, 0, v9, v11, self->_currentScrollOffset.x, self->_currentScrollOffset.y);
    glowRenderer = self->_glowRenderer;
    if (glowRenderer)
      -[PKSelectionGlowRenderer _updateKnobAppearanceForDragAtKnobLocation:point:otherKnobPoint:selectionType:touchType:]((uint64_t)glowRenderer, self->_currentlyDraggedKnob, v9, v11, v70 + v81 * v68 + v67 * v79, v71 + v81 * v69 + v66 * v79);
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[PKSelectionGlowRenderer _didEndDragKnobLocation:knobDragMode:]((uint64_t)self->_glowRenderer, v36, self->_currentlyDraggedKnob, self->_knobDragMode);
    initialStrokeSelectionBeforeModification = self->_initialStrokeSelectionBeforeModification;
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke_2;
    v82[3] = &unk_1E777A170;
    v82[4] = self;
    -[PKSelectionInteraction _updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:](self, "_updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:", initialStrokeSelectionBeforeModification, v82, v9, v11, self->_currentScrollOffset.x, self->_currentScrollOffset.y);
  }
  else if (objc_msgSend(v4, "state") == 5 || objc_msgSend(v4, "state") == 4)
  {
    -[PKSelectionInteraction _clearLiveSelectionPath](self, "_clearLiveSelectionPath");
  }
LABEL_37:

}

uint64_t __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_liveSelectionGestureStillActive");
  if ((_DWORD)result)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 328), *(id *)(*(_QWORD *)(a1 + 32) + 320));
    objc_msgSend(*(id *)(a1 + 32), "_calculateFirstAndLastStrokeForKnobPlacement");
    +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328));
    v3 = *(_QWORD **)(a1 + 32);
    result = objc_msgSend(v3, "_undraggedKnobLocation:forInitialStrokeBounds:", 0);
    v3[18] = v4;
    v3[19] = v5;
  }
  return result;
}

void __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  _QWORD v11[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentDrawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKSelectionController contentTypeForIntersectedStrokes:inDrawing:]((uint64_t)v5, v4, v6);

  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordSmartSelectionEventWithType:contentType:gestureInvoked:", 2, v7, 3);

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentDrawing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke_3;
  v11[3] = &unk_1E7778020;
  v11[4] = *(_QWORD *)(a1 + 32);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v9, v4, 0, 2, v10, v11);

}

void __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_cancelDeferredPasteFromTappingAction");
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = *(void **)(v2 + 144);
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "toggleEditMenu");

  objc_msgSend(*(id *)(a1 + 32), "_clearLiveSelectionPath");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = 0;

}

- (CGPoint)_undraggedKnobLocation:(int64_t)a3 forInitialStrokeBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v9;
  _BOOL4 v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat MaxX;
  double MaxY;
  double v17;
  double v18;
  CGPoint result;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = -[PKSelectionInteraction isLTR](self, "isLTR");
  v10 = v9;
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  if (a3 == 1)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v11);
    if (v10)
      goto LABEL_8;
  }
  else
  {
    if (!v9)
    {
      MaxX = CGRectGetMinX(*(CGRect *)&v11);
LABEL_8:
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      MaxY = CGRectGetMaxY(v21);
      goto LABEL_9;
    }
    MaxX = CGRectGetMinX(*(CGRect *)&v11);
  }
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MaxY = CGRectGetMinY(v20);
LABEL_9:
  v17 = MaxY;
  v18 = MaxX;
  result.y = v17;
  result.x = v18;
  return result;
}

- (BOOL)_didLongPressExternalElementAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  unsigned __int8 v20;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_attachmentForUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v6, x, y);
  v13 = v12;
  v15 = v14;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v16 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _externalElementsAtLocation:inAttachment:](v16, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v18 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PKSelectionController _didLongPressElement:withGesture:inAttachment:](v18, v19, 0, v11);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_calculateFirstAndLastStrokeForKnobPlacement
{
  NSArray *v3;
  NSArray *firstStrokesInInitialStrokes;
  NSArray *v5;
  NSArray *lastStrokesInInitialStrokes;
  NSArray *v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *v14;

  -[PKSelectionInteraction _firstStrokesInStrokes:](self, "_firstStrokesInStrokes:", self->_initialStrokeSelectionBeforeModification);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  firstStrokesInInitialStrokes = self->_firstStrokesInInitialStrokes;
  self->_firstStrokesInInitialStrokes = v3;

  -[PKSelectionInteraction _lastStrokesInStrokes:](self, "_lastStrokesInStrokes:", self->_initialStrokeSelectionBeforeModification);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lastStrokesInInitialStrokes = self->_lastStrokesInInitialStrokes;
  self->_lastStrokesInInitialStrokes = v5;

  v7 = self->_firstStrokesInInitialStrokes;
  if (!v7 || !-[NSArray count](v7, "count"))
  {
    if (-[PKSelectionInteraction isLTR](self, "isLTR"))
      v8 = 1;
    else
      v8 = 2;
    -[PKSelectionInteraction _closestStrokesToCorner:fromStrokes:](self, "_closestStrokesToCorner:fromStrokes:", v8, self->_initialStrokeSelectionBeforeModification);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_firstStrokesInInitialStrokes;
    self->_firstStrokesInInitialStrokes = v9;

  }
  v11 = self->_lastStrokesInInitialStrokes;
  if (!v11 || !-[NSArray count](v11, "count"))
  {
    if (-[PKSelectionInteraction isLTR](self, "isLTR"))
      v12 = 8;
    else
      v12 = 4;
    -[PKSelectionInteraction _closestStrokesToCorner:fromStrokes:](self, "_closestStrokesToCorner:fromStrokes:", v12, self->_initialStrokeSelectionBeforeModification);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_lastStrokesInInitialStrokes;
    self->_lastStrokesInInitialStrokes = v13;

  }
}

- (id)_closestStrokesToCorner:(unint64_t)a3 fromStrokes:(id)a4
{
  id v5;
  id v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double PointFromCorner;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:", v5);
  PointFromCorner = DKDRectGetPointFromCorner(a3, v7, v8, v9, v10);
  v13 = v12;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v32;
    v19 = 1.79769313e308;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v21, "_bounds", (_QWORD)v31);
        v26 = DKDRectGetPointFromCorner(a3, v22, v23, v24, v25);
        v28 = (v27 - v13) * (v27 - v13) + (v26 - PointFromCorner) * (v26 - PointFromCorner);
        if (v28 < v19)
        {
          v29 = v21;

          v17 = v29;
          v19 = v28;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v16);

    if (v17)
      objc_msgSend(v6, "addObject:", v17);
  }
  else
  {

    v17 = 0;
  }

  return v6;
}

- (void)_updateUndraggedKnobLocationForKnobDrag
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  int64_t currentlyDraggedKnob;
  int64_t v20;
  _BOOL4 v21;
  double MaxX;
  int64_t knobDragMode;
  _BOOL4 v24;
  double v25;
  double MinX;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double MaxY;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", self->_firstStrokesInInitialStrokes);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", self->_lastStrokesInInitialStrokes);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  currentlyDraggedKnob = self->_currentlyDraggedKnob;
  if (currentlyDraggedKnob == 1)
  {
    knobDragMode = self->_knobDragMode;
    v24 = -[PKSelectionInteraction isLTR](self, "isLTR");
    if (knobDragMode != 4)
    {
      if (!v24)
      {
        v47.origin.x = v4;
        v47.origin.y = v6;
        v47.size.width = v8;
        v47.size.height = v10;
        MaxX = CGRectGetMaxX(v47);
        goto LABEL_21;
      }
      v43.origin.x = v12;
      v43.origin.y = v14;
      v43.size.width = v16;
      v43.size.height = v18;
      v27 = CGRectGetMaxX(v43);
      goto LABEL_14;
    }
    if (!v24)
    {
      v45.origin.x = v12;
      v45.origin.y = v14;
      v45.size.width = v16;
      v45.size.height = v18;
      MinX = CGRectGetMinX(v45);
      goto LABEL_16;
    }
    v41.origin.x = v4;
    v41.origin.y = v6;
    v41.size.width = v8;
    v41.size.height = v10;
    v25 = CGRectGetMinX(v41);
LABEL_18:
    v37 = v25;
    v29 = v4;
    v30 = v6;
    v31 = v8;
    v32 = v10;
    v28 = v37;
    goto LABEL_19;
  }
  if (currentlyDraggedKnob)
    return;
  v20 = self->_knobDragMode;
  v21 = -[PKSelectionInteraction isLTR](self, "isLTR");
  if (v20 != 4)
  {
    if (v21)
    {
      v42.origin.x = v12;
      v42.origin.y = v14;
      v42.size.width = v16;
      v42.size.height = v18;
      MinX = CGRectGetMaxX(v42);
LABEL_16:
      v28 = MinX;
      v33 = v12;
      v34 = v14;
      v35 = v16;
      v36 = v18;
LABEL_22:
      MaxY = CGRectGetMaxY(*(CGRect *)&v33);
      goto LABEL_23;
    }
    v46.origin.x = v4;
    v46.origin.y = v6;
    v46.size.width = v8;
    v46.size.height = v10;
    v25 = CGRectGetMaxX(v46);
    goto LABEL_18;
  }
  if (v21)
  {
    v40.origin.x = v4;
    v40.origin.y = v6;
    v40.size.width = v8;
    v40.size.height = v10;
    MaxX = CGRectGetMinX(v40);
LABEL_21:
    v39 = MaxX;
    v33 = v4;
    v34 = v6;
    v35 = v8;
    v36 = v10;
    v28 = v39;
    goto LABEL_22;
  }
  v44.origin.x = v12;
  v44.origin.y = v14;
  v44.size.width = v16;
  v44.size.height = v18;
  v27 = CGRectGetMinX(v44);
LABEL_14:
  v28 = v27;
  v29 = v12;
  v30 = v14;
  v31 = v16;
  v32 = v18;
LABEL_19:
  MaxY = CGRectGetMinY(*(CGRect *)&v29);
LABEL_23:
  self->_undraggedKnobLocationInStrokeSpace.x = v28;
  self->_undraggedKnobLocationInStrokeSpace.y = MaxY;
}

- (void)_didDragKnob:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  NSOrderedSet *v16;
  NSOrderedSet *initialStrokeSelectionBeforeModification;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSMutableOrderedSet *v23;
  NSMutableOrderedSet *smartSelectedStrokes;
  id v25;
  double x;
  double y;
  PKSelectionInteraction *v28;
  double v29;
  double v30;
  _QWORD *v31;
  int64_t currentlyDraggedKnob;
  int64_t v33;
  double v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  PKSelectionGlowRenderer *glowRenderer;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;

  v4 = a3;
  -[PKSelectionInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (objc_msgSend(v4, "state") == 1)
  {
    v10 = 3;
    if (self->_currentlyDraggedKnob)
      v10 = 4;
    self->_knobDragMode = v10;
    -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction setCurrentDrawing:](self, "setCurrentDrawing:", v11);

    WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    v13 = WeakRetained;
    if (WeakRetained)
      v14 = (void *)*((_QWORD *)WeakRetained + 15);
    else
      v14 = 0;
    v15 = v14;
    objc_msgSend(v15, "strokes");
    v16 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    initialStrokeSelectionBeforeModification = self->_initialStrokeSelectionBeforeModification;
    self->_initialStrokeSelectionBeforeModification = v16;

    v18 = objc_loadWeakRetained((id *)&self->_selectionController);
    v19 = v18;
    if (v18)
      v20 = (void *)*((_QWORD *)v18 + 15);
    else
      v20 = 0;
    v21 = v20;
    objc_msgSend(v21, "strokes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (NSMutableOrderedSet *)objc_msgSend(v22, "mutableCopy");
    smartSelectedStrokes = self->_smartSelectedStrokes;
    self->_smartSelectedStrokes = v23;

    v25 = objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v25, 0, 0);

    -[PKSelectionInteraction _calculateFirstAndLastStrokeForKnobPlacement](self, "_calculateFirstAndLastStrokeForKnobPlacement");
    -[PKSelectionInteraction _updateUndraggedKnobLocationForKnobDrag](self, "_updateUndraggedKnobLocationForKnobDrag");
    self->_currentScrollOffset = (CGPoint)*MEMORY[0x1E0C9D538];
    -[PKSelectionGlowRenderer _willBeginDragKnobLocation:atPoint:knobDragMode:]((uint64_t)self->_glowRenderer, self->_currentlyDraggedKnob, self->_knobDragMode, v7, v9);
    x = self->_currentScrollOffset.x;
    y = self->_currentScrollOffset.y;
    v28 = self;
    v29 = v7;
    v30 = v9;
    v31 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "state") == 2)
  {
    currentlyDraggedKnob = self->_currentlyDraggedKnob;
    if (currentlyDraggedKnob == 1)
    {
      if (-[PKSelectionInteraction _locationShouldFlipOverLeftKnob:](self, "_locationShouldFlipOverLeftKnob:", v7, v9))
      {
        v33 = 0;
        goto LABEL_22;
      }
      currentlyDraggedKnob = self->_currentlyDraggedKnob;
    }
    if (currentlyDraggedKnob
      || !-[PKSelectionInteraction _locationShouldFlipOverRightKnob:](self, "_locationShouldFlipOverRightKnob:", v7, v9))
    {
      goto LABEL_23;
    }
    v33 = 1;
LABEL_22:
    self->_currentlyDraggedKnob = v33;
    -[PKSelectionInteraction _updateUndraggedKnobLocationForKnobDrag](self, "_updateUndraggedKnobLocationForKnobDrag");
LABEL_23:
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    if (v35)
      v37 = objc_loadWeakRetained((id *)(v35 + 112));
    else
      v37 = 0;
    -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v37, "transformFromStrokeSpaceToViewInDrawing:", v38);
      v39 = *(double *)&v55;
      v40 = *(double *)&v56;
      v49 = *(double *)&v54;
      v50 = *((double *)&v55 + 1);
      v51 = *((double *)&v54 + 1);
      v52 = *((double *)&v56 + 1);
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
      v54 = 0u;
      v51 = 0.0;
      v52 = 0.0;
      v49 = 0.0;
      v50 = 0.0;
      v40 = 0.0;
      v39 = 0.0;
    }
    v41 = self->_undraggedKnobLocationInStrokeSpace.x;
    v42 = self->_undraggedKnobLocationInStrokeSpace.y;

    -[PKSelectionInteraction selectionController](self, "selectionController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[PKSelectionController autoscrollForPointIfNecessary:]((uint64_t)v43, v7, v9);
    v46 = v45;

    v47 = v46 + self->_currentScrollOffset.y;
    self->_currentScrollOffset.x = v44 + self->_currentScrollOffset.x;
    self->_currentScrollOffset.y = v47;
    -[PKSelectionInteraction _updateSmartSelectionWithDragToLocation:liveScrollOffset:completion:](self, "_updateSmartSelectionWithDragToLocation:liveScrollOffset:completion:", 0, v7, v9);
    glowRenderer = self->_glowRenderer;
    if (glowRenderer)
      -[PKSelectionGlowRenderer _updateKnobAppearanceForDragAtKnobLocation:point:otherKnobPoint:selectionType:touchType:]((uint64_t)glowRenderer, self->_currentlyDraggedKnob, v7, v9, v40 + v39 * v42 + v49 * v41, v52 + v50 * v42 + v51 * v41);
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[PKSelectionGlowRenderer _didEndDragKnobLocation:knobDragMode:]((uint64_t)self->_glowRenderer, v34, self->_currentlyDraggedKnob, self->_knobDragMode);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __39__PKSelectionInteraction__didDragKnob___block_invoke;
    v53[3] = &unk_1E777A170;
    v53[4] = self;
    x = self->_currentScrollOffset.x;
    y = self->_currentScrollOffset.y;
    v31 = v53;
    v28 = self;
    v29 = v7;
    v30 = v9;
LABEL_9:
    -[PKSelectionInteraction _updateSmartSelectionWithDragToLocation:liveScrollOffset:completion:](v28, "_updateSmartSelectionWithDragToLocation:liveScrollOffset:completion:", v31, v29, v30, x, y);
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "state") != 4)
    objc_msgSend(v4, "state");
LABEL_30:

}

void __39__PKSelectionInteraction__didDragKnob___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  _QWORD v11[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentDrawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKSelectionController contentTypeForIntersectedStrokes:inDrawing:]((uint64_t)v5, v4, v6);

  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordSmartSelectionEventWithType:contentType:gestureInvoked:", 1, v7, 4);

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentDrawing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__PKSelectionInteraction__didDragKnob___block_invoke_2;
  v11[3] = &unk_1E7778020;
  v11[4] = *(_QWORD *)(a1 + 32);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v9, v4, 0, 1, v10, v11);

}

uint64_t __39__PKSelectionInteraction__didDragKnob___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearLiveSelectionPath");
}

- (BOOL)isLTR
{
  void *v2;
  BOOL v3;

  -[PKSelectionInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveUserInterfaceLayoutDirection") == 0;

  return v3;
}

- (BOOL)_locationShouldFlipOverLeftKnob:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[PKSelectionInteraction isLTR](self, "isLTR"))
    return -[PKSelectionInteraction _locationShouldFlipOverLeftKnob_LTR:](self, "_locationShouldFlipOverLeftKnob_LTR:", x, y);
  else
    return -[PKSelectionInteraction _locationShouldFlipOverLeftKnob_RTL:](self, "_locationShouldFlipOverLeftKnob_RTL:", x, y);
}

- (BOOL)_locationShouldFlipOverLeftKnob_LTR:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat width;
  double height;
  double MinY;
  double MinX;
  BOOL v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 112));
  else
    WeakRetained = 0;
  memset(&v19, 0, sizeof(v19));
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
    objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v9);
  else
    memset(&v19, 0, sizeof(v19));

  +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", self->_firstStrokesInInitialStrokes);
  v18 = v19;
  v21 = CGRectApplyAffineTransform(v20, &v18);
  v10 = v21.origin.x;
  v11 = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  CGRectGetMinX(v21);
  v22.origin.x = v10;
  v22.origin.y = v11;
  v22.size.width = width;
  v22.size.height = height;
  MinY = CGRectGetMinY(v22);
  v23.origin.x = v10;
  v23.origin.y = v11;
  v23.size.width = width;
  v23.size.height = height;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = v10;
  v24.origin.y = v11;
  v24.size.width = width;
  v24.size.height = height;
  CGRectGetMinY(v24);
  if (x >= MinX)
  {
    v16 = 0;
  }
  else
  {
    v25.origin.x = v10;
    v25.origin.y = v11;
    v25.size.width = width;
    v25.size.height = height;
    CGRectGetMinX(v25);
    v26.origin.x = v10;
    v26.origin.y = v11;
    v26.size.width = width;
    v26.size.height = height;
    v16 = y < height + CGRectGetMinY(v26);
  }
  return y < MinY + -38.0 || v16;
}

- (BOOL)_locationShouldFlipOverLeftKnob_RTL:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat width;
  double height;
  double MaxY;
  double MinX;
  BOOL v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 112));
  else
    WeakRetained = 0;
  memset(&v19, 0, sizeof(v19));
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
    objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v9);
  else
    memset(&v19, 0, sizeof(v19));

  +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", self->_lastStrokesInInitialStrokes);
  v18 = v19;
  v21 = CGRectApplyAffineTransform(v20, &v18);
  v10 = v21.origin.x;
  v11 = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  CGRectGetMaxX(v21);
  v22.origin.x = v10;
  v22.origin.y = v11;
  v22.size.width = width;
  v22.size.height = height;
  MaxY = CGRectGetMaxY(v22);
  v23.origin.x = v10;
  v23.origin.y = v11;
  v23.size.width = width;
  v23.size.height = height;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = v10;
  v24.origin.y = v11;
  v24.size.width = width;
  v24.size.height = height;
  CGRectGetMinY(v24);
  v16 = x < MinX;
  if (y <= MaxY - height)
    v16 = 0;
  return y > MaxY + 38.0 || v16;
}

- (BOOL)_locationShouldFlipOverRightKnob:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[PKSelectionInteraction isLTR](self, "isLTR"))
    return -[PKSelectionInteraction _locationShouldFlipOverRightKnob_LTR:](self, "_locationShouldFlipOverRightKnob_LTR:", x, y);
  else
    return -[PKSelectionInteraction _locationShouldFlipOverRightKnob_RTL:](self, "_locationShouldFlipOverRightKnob_RTL:", x, y);
}

- (BOOL)_locationShouldFlipOverRightKnob_LTR:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat width;
  double height;
  double MaxX;
  double MaxY;
  BOOL v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 112));
  else
    WeakRetained = 0;
  memset(&v19, 0, sizeof(v19));
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
    objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v9);
  else
    memset(&v19, 0, sizeof(v19));

  +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", self->_lastStrokesInInitialStrokes);
  v18 = v19;
  v21 = CGRectApplyAffineTransform(v20, &v18);
  v10 = v21.origin.x;
  v11 = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  MaxX = CGRectGetMaxX(v21);
  v22.origin.x = v10;
  v22.origin.y = v11;
  v22.size.width = width;
  v22.size.height = height;
  MaxY = CGRectGetMaxY(v22);
  v16 = x > MaxX;
  if (y <= MaxY - height)
    v16 = 0;
  return y > MaxY + 38.0 || v16;
}

- (BOOL)_locationShouldFlipOverRightKnob_RTL:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat width;
  double height;
  double MinY;
  double MaxX;
  BOOL v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 112));
  else
    WeakRetained = 0;
  memset(&v19, 0, sizeof(v19));
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
    objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v9);
  else
    memset(&v19, 0, sizeof(v19));

  +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", self->_firstStrokesInInitialStrokes);
  v18 = v19;
  v21 = CGRectApplyAffineTransform(v20, &v18);
  v10 = v21.origin.x;
  v11 = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  CGRectGetMinX(v21);
  v22.origin.x = v10;
  v22.origin.y = v11;
  v22.size.width = width;
  v22.size.height = height;
  MinY = CGRectGetMinY(v22);
  v23.origin.x = v10;
  v23.origin.y = v11;
  v23.size.width = width;
  v23.size.height = height;
  MaxX = CGRectGetMaxX(v23);
  v24.origin.x = v10;
  v24.origin.y = v11;
  v24.size.width = width;
  v24.size.height = height;
  CGRectGetMaxY(v24);
  if (x <= MaxX)
  {
    v16 = 0;
  }
  else
  {
    v25.origin.x = v10;
    v25.origin.y = v11;
    v25.size.width = width;
    v25.size.height = height;
    CGRectGetMinX(v25);
    v26.origin.x = v10;
    v26.origin.y = v11;
    v26.size.width = width;
    v26.size.height = height;
    v16 = y < height + CGRectGetMinY(v26);
  }
  return y < MinY + -38.0 || v16;
}

- (void)_updateStateIfNecessaryWithOldModificationType:(int64_t)a3 newModificationType:(int64_t)a4
{
  int64_t v4;

  if (a3 == 3 && a4)
  {
    self->_modificationType = a4;
    v4 = 1;
    if (a4 != 1)
      v4 = 2;
    self->_knobDragMode = v4;
  }
}

- (void)_didBrushWithKnob:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  NSOrderedSet *v18;
  NSOrderedSet *initialStrokeSelectionBeforeModification;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSMutableOrderedSet *v25;
  NSMutableOrderedSet *smartSelectedStrokes;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  PKSelectionGlowRenderer *glowRenderer;
  int64_t currentlyDraggedKnob;
  unint64_t knobDragMode;
  double v40;
  int64_t v41;
  int64_t modificationType;
  _QWORD v43[6];

  v4 = a3;
  -[PKSelectionInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v4, "touches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "type") == 2;
  if (objc_msgSend(v4, "state") == 1)
  {
    self->_knobDragMode = 0;
    -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction setCurrentDrawing:](self, "setCurrentDrawing:", v13);

    -[PKSelectionInteraction _resetVelocityWindow](self, "_resetVelocityWindow");
    WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    v15 = WeakRetained;
    if (WeakRetained)
      v16 = (void *)*((_QWORD *)WeakRetained + 15);
    else
      v16 = 0;
    v17 = v16;
    objc_msgSend(v17, "strokes");
    v18 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    initialStrokeSelectionBeforeModification = self->_initialStrokeSelectionBeforeModification;
    self->_initialStrokeSelectionBeforeModification = v18;

    v20 = objc_loadWeakRetained((id *)&self->_selectionController);
    v21 = v20;
    if (v20)
      v22 = (void *)*((_QWORD *)v20 + 15);
    else
      v22 = 0;
    v23 = v22;
    objc_msgSend(v23, "strokes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (NSMutableOrderedSet *)objc_msgSend(v24, "mutableCopy");
    smartSelectedStrokes = self->_smartSelectedStrokes;
    self->_smartSelectedStrokes = v25;

    v27 = objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v27, 0, 0);

    self->_modificationType = 3;
    +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", 1, v12, v7, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction _updateStateIfNecessaryWithOldModificationType:newModificationType:](self, "_updateStateIfNecessaryWithOldModificationType:newModificationType:", self->_modificationType, -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:](self, "_updateSmartSelectionWithInput:modificationType:", v28, self->_modificationType));
    -[PKSelectionGlowRenderer _willBeginDragKnobLocation:atPoint:knobDragMode:]((uint64_t)self->_glowRenderer, self->_currentlyDraggedKnob, self->_knobDragMode, v7, v9);
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "state") == 2)
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKSelectionController autoscrollForPointIfNecessary:]((uint64_t)v29, v7, v9);
    v32 = v31;

    objc_msgSend(v4, "lastTouchTimestamp");
    -[PKSelectionInteraction _updateVelocityWindowWithTimestamp:location:](self, "_updateVelocityWindowWithTimestamp:location:");
    v33 = -[PKSelectionInteraction _selectionTypeForVelocity:](self, "_selectionTypeForVelocity:");
    objc_msgSend(v4, "touches");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "type");

    +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", v33, v12, v7, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionInteraction _updateStateIfNecessaryWithOldModificationType:newModificationType:](self, "_updateStateIfNecessaryWithOldModificationType:newModificationType:", self->_modificationType, -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:](self, "_updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:", v28, self->_modificationType, 0, v30, v32));
    glowRenderer = self->_glowRenderer;
    if (glowRenderer)
    {
      currentlyDraggedKnob = self->_currentlyDraggedKnob;
      knobDragMode = self->_knobDragMode;
      glowRenderer->_knobDragMode = knobDragMode;
      -[PKSelectionGlowRenderer _updateKnobAppearanceForDragAtKnobLocation:point:knobDragMode:selectionType:touchType:]((uint64_t)glowRenderer, currentlyDraggedKnob, knobDragMode, v33, v36, v7, v9);
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[PKSelectionGlowRenderer _didEndDragKnobLocation:knobDragMode:]((uint64_t)self->_glowRenderer, v40, self->_currentlyDraggedKnob, self->_knobDragMode);
    objc_msgSend(v4, "lastTouchTimestamp");
    -[PKSelectionInteraction _updateVelocityWindowWithTimestamp:location:](self, "_updateVelocityWindowWithTimestamp:location:");
    v41 = -[PKSelectionInteraction _selectionTypeForVelocity:](self, "_selectionTypeForVelocity:");
    +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", v41, v12, v7, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    modificationType = self->_modificationType;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __44__PKSelectionInteraction__didBrushWithKnob___block_invoke;
    v43[3] = &unk_1E7778048;
    v43[4] = self;
    v43[5] = v41;
    -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:](self, "_updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:", v28, modificationType, v43, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(v4, "state") != 4)
    objc_msgSend(v4, "state");
LABEL_13:

}

void __44__PKSelectionInteraction__didBrushWithKnob___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[40];
  objc_msgSend(v3, "currentDrawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKSelectionController contentTypeForIntersectedStrokes:inDrawing:]((uint64_t)v2, v4, v5);

  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordSmartSelectionEventWithType:contentType:gestureInvoked:", *(_QWORD *)(a1 + 40), v6, 5);

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = (void *)v9[40];
  objc_msgSend(v9, "currentDrawing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__PKSelectionInteraction__didBrushWithKnob___block_invoke_2;
  v13[3] = &unk_1E7778020;
  v13[4] = *(_QWORD *)(a1 + 32);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v8, v11, 0, v10, v12, v13);

}

uint64_t __44__PKSelectionInteraction__didBrushWithKnob___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearLiveSelectionPath");
}

- (void)_updateSmartSelectionWithDragToLocation:(CGPoint)a3 liveScrollOffset:(CGPoint)a4 completion:(id)a5
{
  -[PKSelectionInteraction _updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:](self, "_updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:", 0, a5, a3.x, a3.y, a4.x, a4.y);
}

- (void)_updateSmartSelectionWithDragToLocation:(CGPoint)a3 liveScrollOffset:(CGPoint)a4 initialSelectedWord:(id)a5 completion:(id)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  int64_t currentlyDraggedKnob;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  double v34;
  double v35;

  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a5;
  v13 = a6;
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v14, v10, v9);
  v16 = v15;
  v18 = v17;

  v19 = -[PKSelectionInteraction isLTR](self, "isLTR");
  currentlyDraggedKnob = self->_currentlyDraggedKnob;
  v21 = !v19;
  if (currentlyDraggedKnob == v21)
    v22 = v16;
  else
    v22 = self->_undraggedKnobLocationInStrokeSpace.x;
  if (currentlyDraggedKnob == v21)
    v23 = v18;
  else
    v23 = self->_undraggedKnobLocationInStrokeSpace.y;
  if (currentlyDraggedKnob == v21)
  {
    v16 = self->_undraggedKnobLocationInStrokeSpace.x;
    v18 = self->_undraggedKnobLocationInStrokeSpace.y;
  }
  -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionGlowRenderer _renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:](self->_glowRenderer, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, self->_smartSelectedStrokes, v24, x, y);
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet array](self->_initialStrokeSelectionBeforeModification, "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __114__PKSelectionInteraction__updateSmartSelectionWithDragToLocation_liveScrollOffset_initialSelectedWord_completion___block_invoke;
  v30[3] = &unk_1E777A198;
  v30[4] = self;
  v31 = v12;
  v34 = x;
  v35 = y;
  v32 = v24;
  v33 = v13;
  v27 = v13;
  v28 = v24;
  v29 = v12;
  -[PKSelectionController fetchStrokesToSelectBetweenTopPoint:bottomPoint:inDrawing:liveScrollOffset:existingSelection:completion:]((uint64_t)v25, v28, v26, v30, v22, v23, v16, v18, x, y);

}

void __114__PKSelectionInteraction__updateSmartSelectionWithDragToLocation_liveScrollOffset_initialSelectedWord_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_liveSelectionGestureStillActive"))
  {
    objc_msgSend(v10, "intersectedStrokes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 320);
    *(_QWORD *)(v5 + 320) = v4;

    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "unionOrderedSet:");
    objc_msgSend(v10, "intersectedStrokes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));

}

- (id)_knobForLocation:(CGPoint)a3
{
  return -[PKSelectionInteraction _knobForLocation:forInputType:](self, "_knobForLocation:forInputType:", 0, a3.x, a3.y);
}

- (id)_knobForLocation:(CGPoint)a3 forInputType:(int64_t)a4
{
  double y;
  double x;
  PKSelectionController **p_selectionController;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  y = a3.y;
  x = a3.x;
  p_selectionController = &self->_selectionController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  v9 = WeakRetained;
  if (!WeakRetained || !*((_QWORD *)WeakRetained + 15))
    goto LABEL_15;
  v10 = objc_loadWeakRetained((id *)p_selectionController);
  v11 = v10;
  if (v10)
    v12 = (void *)*((_QWORD *)v10 + 18);
  else
    v12 = 0;
  v13 = v12;
  if (!objc_msgSend(v13, "selectionType"))
  {

    goto LABEL_15;
  }
  v14 = objc_loadWeakRetained((id *)p_selectionController);
  v15 = v14;
  if (v14)
    v16 = (void *)*((_QWORD *)v14 + 18);
  else
    v16 = 0;
  v17 = v16;
  v18 = objc_msgSend(v17, "selectionType");

  if (v18 != 6)
  {
    v20 = objc_loadWeakRetained((id *)p_selectionController);
    v21 = v20;
    if (v20)
      v22 = (void *)*((_QWORD *)v20 + 18);
    else
      v22 = 0;
    v23 = v22;
    objc_msgSend(v23, "selectionRenderer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKSelectionGlowRenderer _affordanceForLocationInSelectionView:inputType:]((uint64_t)v9, a4, x, y);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      return v19;
    }
LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  v19 = 0;
  return v19;
}

- (id)_firstStrokesInStrokes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (v4)
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      WeakRetained = objc_loadWeakRetained((id *)(v5 + 112));
    else
      WeakRetained = 0;
    -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_firstStrokesInSelectedStrokes:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11 || !objc_msgSend(v11, "count"))
    {
      if (-[PKSelectionInteraction isLTR](self, "isLTR"))
        v13 = 1;
      else
        v13 = 2;
      -[PKSelectionInteraction _closestStrokesToCorner:fromStrokes:](self, "_closestStrokesToCorner:fromStrokes:", v13, v4);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_lastStrokesInStrokes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (v4)
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      WeakRetained = objc_loadWeakRetained((id *)(v5 + 112));
    else
      WeakRetained = 0;
    -[PKSelectionInteraction currentDrawing](self, "currentDrawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_lastStrokesInSelectedStrokes:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11 || !objc_msgSend(v11, "count"))
    {
      if (-[PKSelectionInteraction isLTR](self, "isLTR"))
        v13 = 8;
      else
        v13 = 4;
      -[PKSelectionInteraction _closestStrokesToCorner:fromStrokes:](self, "_closestStrokesToCorner:fromStrokes:", v13, v4);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)knobsContainPoint:(CGPoint)a3 forInputType:(int64_t)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat width;
  CGFloat height;
  double MidX;
  BOOL v22;
  BOOL v23;
  CGPoint v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction _knobForLocation:forInputType:](self, "_knobForLocation:forInputType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = *(void **)(v9 + 144);
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v8, "convertPoint:fromView:", v12, x, y);
  v14 = v13;
  v16 = v15;

  -[PKDrawingAdjustmentKnob frame](self->_insertSpaceAffordance, "frame");
  v17 = v26.origin.x;
  v18 = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  MidX = CGRectGetMidX(v26);
  v27.origin.x = v17;
  v27.origin.y = v18;
  v27.size.width = width;
  v27.size.height = height;
  v28.origin.y = CGRectGetMidY(v27) + -20.0;
  v28.size.height = 40.0;
  v28.origin.x = MidX + -20.0;
  v28.size.width = 40.0;
  v25.x = v14;
  v25.y = v16;
  v22 = CGRectContainsPoint(v28, v25);
  if (v7)
    v23 = 1;
  else
    v23 = v22;

  return v23;
}

- (BOOL)gesturesAllowedForPaletteState
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  int v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  id v17;
  char v18;

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 112));
  else
    WeakRetained = 0;
  v6 = objc_msgSend(WeakRetained, "isInNotesTextView");

  -[PKSelectionInteraction view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PKToolPicker isActiveToolPickerVisibleForWindow:](PKToolPicker, "isActiveToolPickerVisibleForWindow:", v8);

  -[PKSelectionInteraction selectionController](self, "selectionController");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = objc_loadWeakRetained((id *)(v10 + 112));
  else
    v12 = 0;
  objc_msgSend(v12, "ink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_isLassoInk");

  if (v6)
  {
    -[PKSelectionInteraction selectionController](self, "selectionController");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = objc_loadWeakRetained((id *)(v15 + 112));
    else
      v17 = 0;
    v18 = objc_msgSend(v17, "allowsFingerDrawing");

    v9 = v18 ^ 1;
  }
  return v9 | v14;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  _QWORD *WeakRetained;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  int64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  uint64_t v35;
  void *v36;
  id v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  UITapGestureRecognizer *v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  UITapGestureRecognizer *noOpTapGestureRecognizer;
  uint64_t v55;
  void *v56;
  id v57;
  int v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  int v63;
  int v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  BOOL v74;
  id *v76;
  void *v77;
  void *v78;
  void *v79;
  id *v80;
  void *v81;
  uint8_t v82[16];
  uint8_t buf[16];
  CGPoint v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v4 = (UITapGestureRecognizer *)a3;
  if (!-[PKSelectionInteraction isEnabled](self, "isEnabled"))
  {
    -[PKSelectionInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gestureRecognizers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      v8 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Selection interaction is disabled", buf, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
  }
  -[PKSelectionInteraction view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer locationInView:](v4, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  if (-[PKSelectionInteraction _selectionInteractionShouldBeginAtPoint:forEvent:orGestureRecognizer:](self, "_selectionInteractionShouldBeginAtPoint:forEvent:orGestureRecognizer:", 0, v4, v11, v13))
  {
    if (!-[PKSelectionInteraction gesturesAllowedForPaletteState](self, "gesturesAllowedForPaletteState")
      && self->_progressiveTapGestureRecognizer != v4)
    {
      v8 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v82 = 0;
        _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "Cannot start gesture with finger if pen is selected unless palette is up", v82, 2u);
      }
      goto LABEL_10;
    }
    -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    if (WeakRetained)
    {
      v17 = WeakRetained[15];

      if (v17)
      {
        v18 = objc_loadWeakRetained((id *)&self->_selectionController);
        v19 = v18;
        if (v18)
          v20 = (void *)*((_QWORD *)v18 + 18);
        else
          v20 = 0;
        v21 = v20;

        objc_msgSend(v21, "_selectionViewGestures");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITapGestureRecognizer locationInView:](v4, "locationInView:", v21);
        v24 = v23;
        v26 = v25;
        v14 = objc_msgSend(v21, "containsPoint:forInputType:", 0);
        -[PKSelectionInteraction _knobForLocation:](self, "_knobForLocation:", v24, v26);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (v27)
          v29 = *(_QWORD *)(v27 + 56);
        else
          v29 = 0;
        self->_currentlyDraggedKnob = v29;
        if ((UITapGestureRecognizer *)self->_insertSpaceAffordanceGesture == v4)
        {
          -[UITapGestureRecognizer locationInView:](v4, "locationInView:", self->_insertSpaceAffordance);
          v39 = v38;
          v41 = v40;
          -[PKDrawingAdjustmentKnob bounds](self->_insertSpaceAffordance, "bounds");
          x = v85.origin.x;
          y = v85.origin.y;
          width = v85.size.width;
          height = v85.size.height;
          MidX = CGRectGetMidX(v85);
          v86.origin.x = x;
          v86.origin.y = y;
          v86.size.width = width;
          v86.size.height = height;
          v87.origin.y = CGRectGetMidY(v86) + -20.0;
          v87.size.height = 40.0;
          v87.origin.x = MidX + -20.0;
          v87.size.width = 40.0;
          v84.x = v39;
          v84.y = v41;
          LOBYTE(v14) = CGRectContainsPoint(v87, v84);
          goto LABEL_65;
        }
        if (objc_msgSend(v22, "containsObject:", v4))
        {
          v30 = objc_loadWeakRetained((id *)&self->_selectionController);
          v31 = v30;
          if (v30)
            v32 = (void *)*((_QWORD *)v30 + 18);
          else
            v32 = 0;
          v33 = v32;
          v34 = objc_msgSend(v33, "isHidden");

          if ((v34 & 1) == 0)
          {
            objc_msgSend(v21, "dragGR");
            v47 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();

            if (v28 && v47 == v4 && ((v14 ^ 1) & 1) == 0)
            {
              objc_msgSend(v21, "bounds");
              v52 = DKDCenterOfRect(v48, v49, v50, v51);
              LOBYTE(v14) = sqrt((v53 - v26) * (v53 - v26) + (v52 - v24) * (v52 - v24)) < -[PKSelectionModificationKnob distanceFromKnobCenterToPoint:](v28, v24, v26);
            }
            goto LABEL_65;
          }
          goto LABEL_23;
        }
        if ((UITapGestureRecognizer *)self->_lassoGestureRecognizer == v4)
        {
          if (v15)
            LOBYTE(v14) = (v28 == 0) & ~(_BYTE)v14;
          else
            LOBYTE(v14) = 0;
          goto LABEL_65;
        }
        if (self->_progressiveTapGestureRecognizer == v4)
        {
          LOBYTE(v14) = v14 ^ 1;
          goto LABEL_65;
        }
        if ((UITapGestureRecognizer *)self->_knobBrushGestureRecognizer == v4
          || (UITapGestureRecognizer *)self->_knobDragGestureRecognizer == v4)
        {
          if (v28)
          {
            v65 = objc_loadWeakRetained((id *)&self->_selectionController);
            v66 = v65;
            if (v65)
              v67 = (void *)*((_QWORD *)v65 + 18);
            else
              v67 = 0;
            v68 = v67;
            v14 = objc_msgSend(v68, "isHidden") ^ 1;

            goto LABEL_65;
          }
          goto LABEL_23;
        }
        if ((UITapGestureRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer == v4
          || (UITapGestureRecognizer *)self->_modifySelectionRecognizer == v4 && !objc_msgSend(v21, "selectionType"))
        {
LABEL_23:
          LOBYTE(v14) = 0;
LABEL_65:

LABEL_66:
          goto LABEL_76;
        }

LABEL_56:
        LOBYTE(v14) = 1;
LABEL_76:

        goto LABEL_77;
      }
    }
    if ((UITapGestureRecognizer *)self->_knobBrushGestureRecognizer != v4
      && (UITapGestureRecognizer *)self->_knobDragGestureRecognizer != v4)
    {
      -[PKSelectionInteraction selectionController](self, "selectionController");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      if (v35)
        v37 = objc_loadWeakRetained((id *)(v35 + 112));
      else
        v37 = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

      }
      else
      {
        noOpTapGestureRecognizer = self->_noOpTapGestureRecognizer;

        if (noOpTapGestureRecognizer == v4)
          goto LABEL_75;
      }
      if ((UITapGestureRecognizer *)self->_insertSpaceAffordanceGesture != v4)
      {
        -[PKSelectionInteraction selectionController](self, "selectionController");
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = (void *)v55;
        if (v55)
          v57 = objc_loadWeakRetained((id *)(v55 + 112));
        else
          v57 = 0;
        v58 = objc_msgSend(v57, "allowsFingerDrawing");

        -[PKSelectionInteraction selectionController](self, "selectionController");
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = (void *)v59;
        if (v59)
          v61 = objc_loadWeakRetained((id *)(v59 + 112));
        else
          v61 = 0;
        objc_msgSend(v61, "ink");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "_isLassoInk");

        v64 = v63 | v58 ^ 1;
        if (self->_progressiveTapGestureRecognizer == v4
          || (UITapGestureRecognizer *)self->_modifySelectionRecognizer == v4)
        {
          if (v15)
            LOBYTE(v14) = v63 | v58 ^ 1;
          else
            LOBYTE(v14) = 0;
          goto LABEL_76;
        }
        if ((UITapGestureRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer != v4)
        {
          if (v15)
            LOBYTE(v14) = v63;
          else
            LOBYTE(v14) = 0;
          if ((UITapGestureRecognizer *)self->_lassoGestureRecognizer == v4)
            goto LABEL_76;
          goto LABEL_56;
        }
        if (!v15)
          v64 = 0;
        if (v64 == 1)
        {
          -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v15, v11, v13);
          v70 = v69;
          v72 = v71;
          -[PKSelectionInteraction _visibleOnscreenStrokesForDrawing:](self, "_visibleOnscreenStrokesForDrawing:", v15);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKClusteringUtility _geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:](PKClusteringUtility, "_geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:", v73, 1, 0, v70, v72);
          v21 = (id)objc_claimAutoreleasedReturnValue();

          if (v21)
            v74 = objc_msgSend(v21, "count") != 0;
          else
            v74 = 0;
          -[PKSelectionInteraction selectionController](self, "selectionController");
          v76 = (id *)objc_claimAutoreleasedReturnValue();
          -[PKSelectionController topView](v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uuid");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "_attachmentForUUID:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          -[PKSelectionInteraction selectionController](self, "selectionController");
          v80 = (id *)objc_claimAutoreleasedReturnValue();
          -[PKSelectionController _externalElementsAtLocation:inAttachment:](v80, v79, v70, v72);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v81, "count"))
            LOBYTE(v14) = 1;
          else
            LOBYTE(v14) = v74;

          goto LABEL_66;
        }
      }
    }
LABEL_75:
    LOBYTE(v14) = 0;
    goto LABEL_76;
  }
LABEL_11:
  LOBYTE(v14) = 0;
LABEL_77:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  UITapAndAHalfRecognizer *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  UITapAndAHalfRecognizer *v12;
  BOOL v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  UIPanGestureRecognizer *v21;
  UITapAndAHalfRecognizer *v22;
  UIPanGestureRecognizer *v23;
  UITapAndAHalfRecognizer *modifySelectionRecognizer;
  UITapAndAHalfRecognizer *v25;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = (UITapAndAHalfRecognizer *)a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  v9 = WeakRetained;
  if (WeakRetained)
    v10 = (void *)*((_QWORD *)WeakRetained + 18);
  else
    v10 = 0;
  v11 = v10;
  objc_msgSend(v11, "dragGR");
  v12 = (UITapAndAHalfRecognizer *)objc_claimAutoreleasedReturnValue();

  if (self->_lassoGestureRecognizer == v6 && v12 == v7)
    goto LABEL_5;
  v14 = objc_loadWeakRetained((id *)&self->_selectionController);
  if (!v14)
    goto LABEL_19;
  v15 = v14[15];

  if (!v15)
    goto LABEL_19;
  v16 = objc_loadWeakRetained((id *)&self->_selectionController);
  v17 = v16;
  if (v16)
    v18 = (void *)*((_QWORD *)v16 + 18);
  else
    v18 = 0;
  v19 = v18;

  objc_msgSend(v19, "_selectionViewGestures");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dragGR");
  v21 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (v21 != v6)
  {

LABEL_13:
    if (objc_msgSend(v20, "containsObject:", v6))
    {
      objc_msgSend(v19, "dragGR");
      v23 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
      if (v23 == v6)
      {

      }
      else
      {
        modifySelectionRecognizer = self->_modifySelectionRecognizer;

        if (modifySelectionRecognizer == v7)
          goto LABEL_16;
      }
    }
    objc_msgSend(v19, "doubleTapGR");
    v25 = (UITapAndAHalfRecognizer *)objc_claimAutoreleasedReturnValue();

    if (v25 == v7)
      goto LABEL_5;
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v19, "editMenuGR");
  v22 = (UITapAndAHalfRecognizer *)objc_claimAutoreleasedReturnValue();

  if (v22 != v7)
    goto LABEL_13;
LABEL_16:

LABEL_5:
  v13 = 1;
LABEL_20:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  UITapAndAHalfRecognizer *v7;
  UITapAndAHalfRecognizer *v8;
  _QWORD *WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  UIPanGestureRecognizer *v15;
  char v16;
  UITapAndAHalfRecognizer *modifySelectionRecognizer;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  UIPanGestureRecognizer *v22;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = (UITapAndAHalfRecognizer *)a4;
  v8 = v7;
  if ((self->_lassoGestureRecognizer != v6 || self->_modifySelectionRecognizer != v7)
    && ((UIPanGestureRecognizer *)self->_progressiveTapGestureRecognizer != v6
     || (UITapAndAHalfRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer == v7))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    if (WeakRetained)
    {
      v10 = WeakRetained[15];

      if (!v10)
      {
        v16 = 0;
        goto LABEL_24;
      }
      -[PKSelectionInteraction selectionController](self, "selectionController");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = *(void **)(v11 + 144);
      else
        v13 = 0;
      v14 = v13;

      objc_msgSend(v14, "dragGR");
      v15 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
      if (v15 != v6)
      {

LABEL_14:
        -[PKSelectionInteraction selectionController](self, "selectionController");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = *(void **)(v18 + 144);
        else
          v20 = 0;
        v21 = v20;
        objc_msgSend(v21, "dragGR");
        v22 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();

        if (v22 == v6)
        {
          if (-[UIPanGestureRecognizer state](v6, "state") == 2)
          {
            objc_opt_class();
            v16 = objc_opt_isKindOfClass() ^ 1;
          }
          else
          {
            v16 = 0;
          }
          v22 = v6;
        }
        else
        {
          v16 = 0;
        }

        goto LABEL_23;
      }
      modifySelectionRecognizer = self->_modifySelectionRecognizer;

      if (modifySelectionRecognizer != v8)
        goto LABEL_14;
      v16 = 1;
    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  v16 = 1;
LABEL_24:

  return v16 & 1;
}

- (BOOL)_selectionShouldReceiveTouchForPoint:(CGPoint)a3
{
  double y;
  double x;
  _QWORD *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  void *v19;
  BOOL v20;

  y = a3.y;
  x = a3.x;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6[15];

    if (!v7)
      return 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    v9 = WeakRetained;
    if (WeakRetained)
      v10 = (void *)*((_QWORD *)WeakRetained + 18);
    else
      v10 = 0;
    v11 = v10;

    -[PKSelectionInteraction selectionController](self, "selectionController");
    v12 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController topView](v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertPoint:fromView:", v13, x, y);
    v15 = v14;
    v17 = v16;

    v18 = objc_msgSend(v11, "containsPoint:forInputType:", 0, v15, v17);
    -[PKSelectionInteraction _knobForLocation:](self, "_knobForLocation:", v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = 1;
    else
      v20 = v18;

  }
  else
  {
    v11 = 0;
    v20 = 0;
  }

  return v20;
}

- (BOOL)_selectionInteractionShouldBeginAtPoint:(CGPoint)a3 forEvent:(id)a4 orGestureRecognizer:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  BOOL v16;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  -[PKSelectionInteraction delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_4;
  -[PKSelectionInteraction delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
    goto LABEL_4;
  -[PKSelectionInteraction delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "selectionInteractionShouldBegin:atPoint:forEvent:orGestureRecognizer:", self, v9, v10, x, y);

  if ((v15 & 1) == 0)
  {
    if (v9)
    {
      v18 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Interaction delegate does not want interaction to begin for event: %@", (uint8_t *)&v20, 0xCu);
      }

    }
    if (v10)
    {
      v19 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v10;
        _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEFAULT, "Interaction delegate does not want interaction to begin for gesture recognizer: %@", (uint8_t *)&v20, 0xCu);
      }

    }
    v16 = 0;
  }
  else
  {
LABEL_4:
    v16 = 1;
  }

  return v16;
}

- (BOOL)_selectionInteractionShouldForwardAtPoint:(CGPoint)a3 forEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PKSelectionInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PKSelectionInteraction delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(self) = objc_msgSend(v10, "selectionInteractionShouldForwardToElements:atPoint:forEvent:", self, v7, x, y);

    if ((_DWORD)self)
    {
      self = (PKSelectionInteraction *)os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1BE213000, &self->super, OS_LOG_TYPE_DEFAULT, "Interaction delegate will forward event: %@", (uint8_t *)&v12, 0xCu);
      }

      LOBYTE(self) = 1;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)_dragShouldBeginForSession:(id)a3
{
  id v4;
  _QWORD *WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  int64_t v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  if (!WeakRetained)
  {
    v9 = 0;
    LOBYTE(v6) = 0;
LABEL_8:

    goto LABEL_9;
  }
  v6 = (void *)WeakRetained[15];

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_selectionController);
    v6 = v7;
    if (v7)
      v8 = (void *)*((_QWORD *)v7 + 18);
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v4, "locationInView:", v9);
    -[PKSelectionInteraction _knobForLocation:](self, "_knobForLocation:");
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v10 == 0;
    if (v10)
      v11 = v10[7];
    else
      v11 = 0;
    self->_currentlyDraggedKnob = v11;

    goto LABEL_8;
  }
LABEL_9:

  return (char)v6;
}

- (CGPoint)_pointFromViewToStrokeSpace:(CGPoint)a3 inDrawing:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  float64x2_t v12;
  __int128 v13;
  CGPoint v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  CGPoint result;

  v13 = *(__int128 *)&a3.y;
  v14 = a3;
  v5 = a4;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  -[PKSelectionInteraction selectionController](self, "selectionController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6 && (WeakRetained = objc_loadWeakRetained((id *)(v6 + 112))) != 0)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "transformFromViewToStrokeSpaceInDrawing:", v5, v13, v14);
  }
  else
  {
    v9 = 0;
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
  }

  v12 = vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, *(double *)&v13), v15, v14.x));
  v11 = v12.f64[1];
  v10 = v12.f64[0];
  result.y = v11;
  result.x = v10;
  return result;
}

- (PKSelectionInteractionDelegate)delegate
{
  return (PKSelectionInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIPanGestureRecognizer)lassoGestureRecognizer
{
  return self->_lassoGestureRecognizer;
}

- (void)setLassoGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_lassoGestureRecognizer, a3);
}

- (UITapGestureRecognizer)noOpTapGestureRecognizer
{
  return self->_noOpTapGestureRecognizer;
}

- (void)setNoOpTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_noOpTapGestureRecognizer, a3);
}

- (UITapGestureRecognizer)progressiveTapGestureRecognizer
{
  return self->_progressiveTapGestureRecognizer;
}

- (void)setProgressiveTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_progressiveTapGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)tapAndHoldToSelectLongPressGestureRecognizer
{
  return self->_tapAndHoldToSelectLongPressGestureRecognizer;
}

- (void)setTapAndHoldToSelectLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapAndHoldToSelectLongPressGestureRecognizer, a3);
}

- (UITapAndAHalfRecognizer)modifySelectionRecognizer
{
  return self->_modifySelectionRecognizer;
}

- (void)setModifySelectionRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_modifySelectionRecognizer, a3);
}

- (UILongPressGestureRecognizer)knobBrushGestureRecognizer
{
  return self->_knobBrushGestureRecognizer;
}

- (void)setKnobBrushGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_knobBrushGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)knobDragGestureRecognizer
{
  return self->_knobDragGestureRecognizer;
}

- (void)setKnobDragGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_knobDragGestureRecognizer, a3);
}

- (void)setSelectionController:(id)a3
{
  objc_storeWeak((id *)&self->_selectionController, a3);
}

- (CGPoint)_drawingBeganLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->__drawingBeganLocation.x;
  y = self->__drawingBeganLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)set_drawingBeganLocation:(CGPoint)a3
{
  self->__drawingBeganLocation = a3;
}

- (BOOL)_didCancelSelection
{
  return self->__didCancelSelection;
}

- (void)set_didCancelSelection:(BOOL)a3
{
  self->__didCancelSelection = a3;
}

- (NSMutableOrderedSet)smartSelectedStrokes
{
  return self->_smartSelectedStrokes;
}

- (void)setSmartSelectedStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_smartSelectedStrokes, a3);
}

- (NSOrderedSet)initialStrokeSelectionBeforeModification
{
  return self->_initialStrokeSelectionBeforeModification;
}

- (void)setInitialStrokeSelectionBeforeModification:(id)a3
{
  objc_storeStrong((id *)&self->_initialStrokeSelectionBeforeModification, a3);
}

- (PKDrawing)currentDrawing
{
  return self->_currentDrawing;
}

- (void)setCurrentDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_currentDrawing, a3);
}

- (UILongPressGestureRecognizer)pencilLongPressGestureRecognizer
{
  return self->_pencilLongPressGestureRecognizer;
}

- (void)setPencilLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pencilLongPressGestureRecognizer, a3);
}

- (BOOL)insertSpaceEnabled
{
  return self->_insertSpaceEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentDrawing, 0);
  objc_storeStrong((id *)&self->_initialStrokeSelectionBeforeModification, 0);
  objc_storeStrong((id *)&self->_smartSelectedStrokes, 0);
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_knobDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_knobBrushGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_modifySelectionRecognizer, 0);
  objc_storeStrong((id *)&self->_tapAndHoldToSelectLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_progressiveTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_noOpTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lassoGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_insertSpaceAffordanceGesture, 0);
  objc_storeStrong((id *)&self->_insertSpaceAffordance, 0);
  objc_storeStrong((id *)&self->_selectionViewGestures, 0);
  objc_storeStrong((id *)&self->_lastStrokesInInitialStrokes, 0);
  objc_storeStrong((id *)&self->_firstStrokesInInitialStrokes, 0);
  objc_storeStrong((id *)&self->_tapAndDragVelocityArray, 0);
  objc_storeStrong((id *)&self->_lassoPath, 0);
  objc_storeStrong((id *)&self->_glowRenderer, 0);
  objc_storeStrong((id *)&self->_lassoRenderer, 0);
}

@end
