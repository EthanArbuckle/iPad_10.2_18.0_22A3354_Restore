@implementation PKSqueezePaletteViewUndoRedoLayout

- (id)initWithUndoButton:(void *)a3 redoButton:(double)a4 startAngle:
{
  id *v8;
  id *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v26 = a3;
  if (a1)
  {
    v32.receiver = a1;
    v32.super_class = (Class)PKSqueezePaletteViewUndoRedoLayout;
    v8 = (id *)objc_msgSendSuper2(&v32, sel_init);
    a1 = v8;
    if (v8)
    {
      v9 = v8 + 14;
      objc_storeStrong(v8 + 14, a2);
      objc_storeStrong(a1 + 15, a3);
      *((double *)a1 + 13) = a4;
      a1[7] = (id)PKSqueezePaletteButtonInterItemSpacing;
      objc_initWeak(&location, a1);
      v10 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __79__PKSqueezePaletteViewUndoRedoLayout_initWithUndoButton_redoButton_startAngle___block_invoke;
      v29[3] = &unk_1E7777588;
      objc_copyWeak(&v30, &location);
      objc_msgSend(*v9, "_set_pk_longSqueezeAction:", v29);
      v27[0] = v10;
      v27[1] = 3221225472;
      v27[2] = __79__PKSqueezePaletteViewUndoRedoLayout_initWithUndoButton_redoButton_startAngle___block_invoke_2;
      v27[3] = &unk_1E7777588;
      objc_copyWeak(&v28, &location);
      objc_msgSend(a1[15], "_set_pk_longSqueezeAction:", v27);
      v11 = PKSqueezePaletteButtonSize();
      v13 = v12;
      v24 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(*v9, "heightAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToConstant:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v15;
      objc_msgSend(*v9, "widthAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToConstant:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v17;
      objc_msgSend(a1[15], "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToConstant:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v19;
      objc_msgSend(a1[15], "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToConstant:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activateConstraints:", v22);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __79__PKSqueezePaletteViewUndoRedoLayout_initWithUndoButton_redoButton_startAngle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewUndoRedoLayout _performUndoAction]((uint64_t)WeakRetained);

}

- (uint64_t)_performUndoAction
{
  void *v1;
  id WeakRetained;

  if (result)
  {
    v1 = (void *)result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 88));
    -[PKSqueezePaletteView _didUndo]((uint64_t)WeakRetained);

    return objc_msgSend(v1, "updateUI");
  }
  return result;
}

void __79__PKSqueezePaletteViewUndoRedoLayout_initWithUndoButton_redoButton_startAngle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewUndoRedoLayout _performRedoAction]((uint64_t)WeakRetained);

}

- (uint64_t)_performRedoAction
{
  void *v1;
  id WeakRetained;

  if (result)
  {
    v1 = (void *)result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 88));
    -[PKSqueezePaletteView _didRedo]((uint64_t)WeakRetained);

    return objc_msgSend(v1, "updateUI");
  }
  return result;
}

- (void)_handleUndoButtonLongPressGestureRecognizer:(id)a3
{
  -[PKSqueezePaletteViewUndoRedoLayout handleLongPressGestureRecognizer:forButton:]((uint64_t)self, a3, self->_undoButton);
}

- (void)handleLongPressGestureRecognizer:(void *)a3 forButton:
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  int v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (id *)(a1 + 88);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v9 = -[PKSqueezePaletteView _undoCount]((uint64_t)WeakRetained);

    v10 = objc_loadWeakRetained((id *)(a1 + 88));
    v11 = -[PKSqueezePaletteView _redoCount]((uint64_t)v10);

    v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412802;
      v24 = v5;
      v25 = 2048;
      v26 = v9;
      v27 = 2048;
      v28 = v11;
      _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Undo/redo button long press gesture recognizer handled: %@, undoCount: %lu, redoCount: %li", (uint8_t *)&v23, 0x20u);
    }

    if (v9 + v11)
    {
      if (objc_msgSend(v5, "state") == 1 && !*(_BYTE *)(a1 + 64))
      {
        v15 = -[PKSqueezePaletteViewExpandedUndoRedoLayoutContext initWithSliderButton:sliderButtonLongPressGestureRecognizer:previousLayout:]((id *)[PKSqueezePaletteViewExpandedUndoRedoLayoutContext alloc], v6, v5, (void *)a1);
        v16 = objc_loadWeakRetained((id *)(a1 + 88));
        v17 = v16;
        if (v16)
          v18 = (void *)*((_QWORD *)v16 + 71);
        else
          v18 = 0;
        v19 = v18;
        v20 = -[PKSqueezePaletteViewUndoRedoLayout _isLTR](a1);
        -[PKSqueezePaletteViewLayoutFactory makeExpandedUndoRedoLayoutWithContext:isLTR:]((uint64_t)v19, v15, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_loadWeakRetained(v7);
        -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v22, v21);

LABEL_15:
        goto LABEL_16;
      }
      if (objc_msgSend(v5, "state") == 3 && *(_BYTE *)(a1 + 64))
      {
        v13 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Removing undo button long press gesture recognizer", (uint8_t *)&v23, 2u);
        }

        objc_msgSend(*(id *)(a1 + 112), "removeGestureRecognizer:", *(_QWORD *)(a1 + 72));
        objc_msgSend(*(id *)(a1 + 120), "removeGestureRecognizer:", *(_QWORD *)(a1 + 80));
        v14 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = 0;

        v15 = *(id **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = 0;
        goto LABEL_15;
      }
    }
  }
LABEL_16:

}

- (void)_handleRedoButtonLongPressGestureRecognizer:(id)a3
{
  -[PKSqueezePaletteViewUndoRedoLayout handleLongPressGestureRecognizer:forButton:]((uint64_t)self, a3, self->_redoButton);
}

- (BOOL)_isLTR
{
  void *v1;
  id WeakRetained;
  _BOOL8 v3;

  if (!a1)
    return 0;
  v1 = (void *)MEMORY[0x1E0DC3F10];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v3 = objc_msgSend(v1, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(WeakRetained, "semanticContentAttribute")) == 0;

  return v3;
}

- (uint64_t)_updateUndoButtonConstraints
{
  uint64_t v1;
  double *WeakRetained;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (result)
  {
    v1 = result;
    WeakRetained = (double *)objc_loadWeakRetained((id *)(result + 88));
    v3 = WeakRetained;
    if (WeakRetained)
      v4 = WeakRetained[63];
    else
      v4 = 0.0;
    v5 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v4, *(double *)(v1 + 40));
    v7 = v6;

    objc_msgSend(*(id *)(v1 + 8), "setConstant:", v5);
    return objc_msgSend(*(id *)(v1 + 16), "setConstant:", v7);
  }
  return result;
}

- (uint64_t)_updateRedoButtonConstraints
{
  uint64_t v1;
  double *WeakRetained;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (result)
  {
    v1 = result;
    WeakRetained = (double *)objc_loadWeakRetained((id *)(result + 88));
    v3 = WeakRetained;
    if (WeakRetained)
      v4 = WeakRetained[63];
    else
      v4 = 0.0;
    v5 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v4, *(double *)(v1 + 48));
    v7 = v6;

    objc_msgSend(*(id *)(v1 + 24), "setConstant:", v5);
    return objc_msgSend(*(id *)(v1 + 32), "setConstant:", v7);
  }
  return result;
}

- (void)setupUI
{
  PKSqueezePaletteView **p_paletteView;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *undoButtonCenterXConstraint;
  void *v18;
  id v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *undoButtonCenterYConstraint;
  void *v23;
  id v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *redoButtonCenterXConstraint;
  void *v28;
  id v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *redoButtonCenterYConstraint;
  double v33;
  double v34;
  double v35;
  NSLayoutConstraint *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double startAngle;
  id v49;
  id v50;
  double v51;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double *v56;
  double v57;
  UILongPressGestureRecognizer *v58;
  UILongPressGestureRecognizer *undoButtonLongPressGestureRecognizer;
  UILongPressGestureRecognizer *v60;
  UILongPressGestureRecognizer *redoButtonLongPressGestureRecognizer;
  _BOOL4 v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  id *location;
  _QWORD v68[9];

  v68[8] = *MEMORY[0x1E0C80C00];
  p_paletteView = &self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    self->_didTransitionToExpandedLayout = 0;
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_undoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_redoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_loadWeakRetained((id *)p_paletteView);
    v6 = v5;
    if (v5)
      v7 = (void *)*((_QWORD *)v5 + 70);
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v8, "addSubview:", self->_undoButton);

    v9 = objc_loadWeakRetained((id *)p_paletteView);
    v10 = v9;
    if (v9)
      v11 = (void *)*((_QWORD *)v9 + 70);
    else
      v11 = 0;
    v12 = v11;
    objc_msgSend(v12, "addSubview:", self->_redoButton);

    -[UIButton centerXAnchor](self->_undoButton, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_paletteView);
    objc_msgSend(v14, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    undoButtonCenterXConstraint = self->_undoButtonCenterXConstraint;
    self->_undoButtonCenterXConstraint = v16;

    -[UIButton centerYAnchor](self->_undoButton, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_loadWeakRetained((id *)p_paletteView);
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    undoButtonCenterYConstraint = self->_undoButtonCenterYConstraint;
    self->_undoButtonCenterYConstraint = v21;

    -[UIButton centerXAnchor](self->_redoButton, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_loadWeakRetained((id *)p_paletteView);
    objc_msgSend(v24, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    redoButtonCenterXConstraint = self->_redoButtonCenterXConstraint;
    self->_redoButtonCenterXConstraint = v26;

    -[UIButton centerYAnchor](self->_redoButton, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id *)p_paletteView;
    v29 = objc_loadWeakRetained((id *)p_paletteView);
    objc_msgSend(v29, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    redoButtonCenterYConstraint = self->_redoButtonCenterYConstraint;
    self->_redoButtonCenterYConstraint = v31;

    v33 = PKSqueezePaletteButtonSize();
    v35 = v34;
    v66 = (void *)MEMORY[0x1E0CB3718];
    v36 = self->_undoButtonCenterYConstraint;
    v68[0] = self->_undoButtonCenterXConstraint;
    v68[1] = v36;
    -[UIButton heightAnchor](self->_undoButton, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", v33);
    v38 = objc_claimAutoreleasedReturnValue();
    v68[2] = v38;
    -[UIButton widthAnchor](self->_undoButton, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToConstant:", v35);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = self->_redoButtonCenterXConstraint;
    v42 = self->_redoButtonCenterYConstraint;
    v68[3] = v40;
    v68[4] = v41;
    v68[5] = v42;
    -[UIButton heightAnchor](self->_redoButton, "heightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToConstant:", v33);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v68[6] = v44;
    -[UIButton widthAnchor](self->_redoButton, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", v35);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v68[7] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "activateConstraints:", v47);

    startAngle = self->_startAngle;
    v49 = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v38) = objc_opt_respondsToSelector();

    if ((v38 & 1) != 0)
    {
      v50 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v50, "undoRedoLayoutStartAngle:", self);
      startAngle = v51;

    }
    v52 = -[PKSqueezePaletteViewUndoRedoLayout _isLTR]((uint64_t)self);
    if (v52)
      v53 = 40;
    else
      v53 = 48;
    if (v52)
      v54 = 48;
    else
      v54 = 40;
    *(double *)((char *)&self->super.isa + v53) = startAngle;
    v55 = v35 + self->_interItemSpace;
    v56 = (double *)objc_loadWeakRetained(location);
    if (v56)
      v57 = v56[63];
    else
      v57 = 0.0;
    *(double *)((char *)&self->super.isa + v54) = startAngle + v55 / v57;

    -[PKSqueezePaletteViewUndoRedoLayout _updateUndoButtonConstraints]((uint64_t)self);
    -[PKSqueezePaletteViewUndoRedoLayout _updateRedoButtonConstraints]((uint64_t)self);
    -[UIButton addTarget:action:forControlEvents:](self->_undoButton, "addTarget:action:forControlEvents:", self, sel__didTapUndoButton_, 64);
    -[UIButton addTarget:action:forControlEvents:](self->_redoButton, "addTarget:action:forControlEvents:", self, sel__didTapRedoButton_, 64);
    v58 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleUndoButtonLongPressGestureRecognizer_);
    undoButtonLongPressGestureRecognizer = self->_undoButtonLongPressGestureRecognizer;
    self->_undoButtonLongPressGestureRecognizer = v58;

    -[UIButton addGestureRecognizer:](self->_undoButton, "addGestureRecognizer:", self->_undoButtonLongPressGestureRecognizer);
    v60 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleRedoButtonLongPressGestureRecognizer_);
    redoButtonLongPressGestureRecognizer = self->_redoButtonLongPressGestureRecognizer;
    self->_redoButtonLongPressGestureRecognizer = v60;

    -[UIButton addGestureRecognizer:](self->_redoButton, "addGestureRecognizer:", self->_redoButtonLongPressGestureRecognizer);
    v62 = -[PKSqueezePaletteViewUndoRedoLayout _isLTR]((uint64_t)self);
    if (v62)
      v63 = 40;
    else
      v63 = 48;
    if (v62)
      v64 = 48;
    else
      v64 = 40;
    v65 = objc_loadWeakRetained(location);
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v65, 1, 1, *(double *)((char *)&self->super.isa + v63), *(double *)((char *)&self->super.isa + v64));

  }
}

- (void)updateUI
{
  PKSqueezePaletteView **p_paletteView;
  id WeakRetained;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  UIButton *undoButton;
  UIButton *redoButton;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  p_paletteView = &self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_paletteView);
    v6 = -[PKSqueezePaletteView _canUndo]((uint64_t)v5);

    -[UIButton setEnabled:](self->_undoButton, "setEnabled:", v6);
    v7 = objc_loadWeakRetained((id *)p_paletteView);
    v8 = -[PKSqueezePaletteView _canRedo]((uint64_t)v7);

    -[UIButton setEnabled:](self->_redoButton, "setEnabled:", v8);
    CGAffineTransformMakeRotation(&v14, self->_undoButtonAngle + 1.57079633);
    undoButton = self->_undoButton;
    v13 = v14;
    -[UIButton setTransform:](undoButton, "setTransform:", &v13);
    CGAffineTransformMakeRotation(&v12, self->_redoButtonAngle + 1.57079633);
    redoButton = self->_redoButton;
    v11 = v12;
    -[UIButton setTransform:](redoButton, "setTransform:", &v11);
    -[UIButton setAlpha:](self->_redoButton, "setAlpha:", 1.0);
    -[UIButton setAlpha:](self->_undoButton, "setAlpha:", 1.0);
  }
}

- (void)willTransitionToLayout:(id)a3
{
  id *v4;
  id v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *redoButton;
  void *v10;
  void *v11;
  NSLayoutConstraint *undoButtonCenterXConstraint;
  __int128 v13;
  NSLayoutConstraint *redoButtonCenterYConstraint;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
    {
      v5 = v4[3];
      v6 = v5;
      if (v5)
      {
        v7 = (void *)*((_QWORD *)v5 + 1);
        goto LABEL_5;
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = 0;
LABEL_5:
    v8 = v7;

    redoButton = self->_redoButton;
    if (v8 != self->_undoButton)
    {
      if (v8 != redoButton)
      {
LABEL_9:

        goto LABEL_10;
      }
      redoButton = self->_undoButton;
    }
    -[UIButton setAlpha:](redoButton, "setAlpha:", 0.0);
    goto LABEL_9;
  }
LABEL_10:
  -[UIButton removeTarget:action:forControlEvents:](self->_undoButton, "removeTarget:action:forControlEvents:", self, sel__didTapUndoButton_, 64);
  -[UIButton removeTarget:action:forControlEvents:](self->_redoButton, "removeTarget:action:forControlEvents:", self, sel__didTapRedoButton_, 64);
  self->_didTransitionToExpandedLayout = 1;
  v10 = (void *)MEMORY[0x1E0CB3718];
  undoButtonCenterXConstraint = self->_undoButtonCenterXConstraint;
  v13 = *(_OWORD *)&self->_undoButtonCenterYConstraint;
  redoButtonCenterYConstraint = self->_redoButtonCenterYConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &undoButtonCenterXConstraint, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deactivateConstraints:", v11);

}

- (PKSqueezePaletteView)paletteView
{
  return (PKSqueezePaletteView *)objc_loadWeakRetained((id *)&self->_paletteView);
}

- (void)setPaletteView:(id)a3
{
  objc_storeWeak((id *)&self->_paletteView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_redoButtonLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_undoButtonLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_redoButtonCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_redoButtonCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_undoButtonCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_undoButtonCenterXConstraint, 0);
}

@end
