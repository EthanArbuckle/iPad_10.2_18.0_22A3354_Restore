@implementation PKPaletteColorPickerContainerView

- (PKPaletteColorPickerContainerView)initWithFrame:(CGRect)a3
{
  PKPaletteColorPickerContainerView *v3;
  UIStackView *v4;
  UIStackView *stackView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPaletteColorPickerView *v14;
  PKPaletteColorPickerView *colorPickerView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[8];

  v30[6] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)PKPaletteColorPickerContainerView;
  v3 = -[PKPaletteColorPickerContainerView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[PKPaletteColorPickerContainerView addSubview:](v3, "addSubview:", v3->_stackView);
    v21 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView topAnchor](v3->_stackView, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView topAnchor](v3, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v26;
    -[UIStackView bottomAnchor](v3->_stackView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView bottomAnchor](v3, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v23;
    -[UIStackView leadingAnchor](v3->_stackView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView leadingAnchor](v3, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v19;
    -[UIStackView trailingAnchor](v3->_stackView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView trailingAnchor](v3, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v6;
    -[UIStackView widthAnchor](v3->_stackView, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView widthAnchor](v3, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v9;
    -[UIStackView heightAnchor](v3->_stackView, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView heightAnchor](v3, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[5] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v13);

    v14 = objc_alloc_init(PKPaletteColorPickerView);
    colorPickerView = v3->_colorPickerView;
    v3->_colorPickerView = v14;

    -[PKPaletteColorPickerView setTranslatesAutoresizingMaskIntoConstraints:](v3->_colorPickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_colorPickerView);
    -[PKPaletteColorPickerContainerView _updateUI](v3, "_updateUI");
  }
  return v3;
}

- (void)setShouldShowInputAssistantView:(BOOL)a3
{
  if (self->_shouldShowInputAssistantView != a3)
  {
    self->_shouldShowInputAssistantView = a3;
    -[PKPaletteColorPickerContainerView _updateUI](self, "_updateUI");
  }
}

- (void)setLayoutAxis:(int64_t)a3
{
  if (self->_layoutAxis != a3)
  {
    self->_layoutAxis = a3;
    -[PKPaletteColorPickerContainerView _updateUI](self, "_updateUI");
  }
}

- (void)setPalettePopoverPresenting:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_palettePopoverPresenting);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_palettePopoverPresenting, obj);
    -[PKPaletteColorPickerContainerView _updateUI](self, "_updateUI");
    v5 = obj;
  }

}

- (void)setPaletteViewState:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteViewState);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_paletteViewState, obj);
    -[PKPaletteColorPickerContainerView _updateUI](self, "_updateUI");
    v5 = obj;
  }

}

- (void)_updateUI
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = -[PKPaletteColorPickerContainerView layoutAxis](self, "layoutAxis");
  -[PKPaletteColorPickerContainerView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxis:", v3);

  -[PKPaletteColorPickerContainerView stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpacing:", 8.0);

  if (!-[PKPaletteColorPickerContainerView shouldShowInputAssistantView](self, "shouldShowInputAssistantView"))
    goto LABEL_3;
  -[PKPaletteColorPickerContainerView stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    -[PKPaletteColorPickerContainerView _installInputAssistantViewContainer](self, "_installInputAssistantViewContainer");
  }
  else
  {
LABEL_3:
    if (!-[PKPaletteColorPickerContainerView shouldShowInputAssistantView](self, "shouldShowInputAssistantView"))
    {
      -[PKPaletteColorPickerContainerView stackView](self, "stackView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrangedSubviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "containsObject:", v12);

      if (v13)
      {
        -[PKPaletteColorPickerContainerView stackView](self, "stackView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeArrangedSubview:", v15);

        -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeFromSuperview");

        -[PKPaletteColorPickerContainerView setInputAssistantContainerView:](self, "setInputAssistantContainerView:", 0);
      }
    }
  }
}

- (void)_installInputAssistantViewContainer
{
  PKDrawingPaletteInputAssistantContainerView *v3;
  PKDrawingPaletteInputAssistantContainerView *inputAssistantContainerView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init(PKDrawingPaletteInputAssistantContainerView);
  inputAssistantContainerView = self->_inputAssistantContainerView;
  self->_inputAssistantContainerView = v3;

  -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteColorPickerContainerView stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertArrangedSubview:atIndex:", v7, 0);

  -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UCBbutton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleUCBButtonPressed, 64);

}

- (void)_handleUCBButtonPressed
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;

  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isBeingPresented"))
    {

LABEL_5:
      goto LABEL_8;
    }
    v5 = objc_msgSend(v4, "isBeingDismissed");

    if (v5)
      goto LABEL_5;
  }
  -[PKPaletteColorPickerContainerView palettePopoverPresenting](self, "palettePopoverPresenting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldPalettePresentPopover");

  if (v7)
  {
    -[PKPaletteColorPickerContainerView _showInputAssistantPopover](self, "_showInputAssistantPopover");
    return;
  }
LABEL_8:
  -[PKPaletteColorPickerContainerView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
}

- (void)_showInputAssistantPopover
{
  PKPaletteInputAssistantViewController *v3;
  PKDrawingPaletteInputAssistantView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double x;
  double y;
  double width;
  double height;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  CGRect v41;
  CGRect v42;

  v3 = objc_alloc_init(PKPaletteInputAssistantViewController);
  -[PKPaletteColorPickerContainerView setInputAssistantViewController:](self, "setInputAssistantViewController:", v3);

  v4 = objc_alloc_init(PKDrawingPaletteInputAssistantView);
  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputAssistantView:", v4);

  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setModalPresentationStyle:", 7);

  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPermittedArrowDirections:", 2);

  -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UCBbutton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v42 = CGRectInset(v41, -5.0, -5.0);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourceRect:", x, y, width, height);

  -[PKPaletteColorPickerContainerView inputAssistantContainerView](self, "inputAssistantContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UCBbutton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "popoverPresentationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSourceView:", v20);

  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_setShouldDisableInteractionDuringTransitions:", 0);

  -[PKPaletteColorPickerContainerView palettePopoverPresenting](self, "palettePopoverPresenting");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "palettePopoverPassthroughViews");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "popoverPresentationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPassthroughViews:", v26);

  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "popoverPresentationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_setIgnoresKeyboardNotifications:", 1);

  -[PKPaletteColorPickerContainerView palettePopoverPresenting](self, "palettePopoverPresenting");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "updatePalettePopover:", v32);

  -[PKPaletteColorPickerContainerView delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = objc_opt_respondsToSelector();

  if ((v32 & 1) != 0)
  {
    -[PKPaletteColorPickerContainerView delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "inputAssistantView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "colorPickerContainerView:willPresentInputAssistantView:", self, v36);

  }
  -[PKPaletteColorPickerContainerView palettePopoverPresenting](self, "palettePopoverPresenting");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "palettePopoverPresentingController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __63__PKPaletteColorPickerContainerView__showInputAssistantPopover__block_invoke;
  v40[3] = &unk_1E7778020;
  v40[4] = self;
  objc_msgSend(v38, "presentViewController:animated:completion:", v39, 1, v40);

}

void __63__PKPaletteColorPickerContainerView__showInputAssistantPopover__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "inputAssistantViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputAssistantView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorPickerContainerView:didPresentInputAssistantView:", v4, v6);

  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (BOOL)_isInputAssistantViewControllerPresented
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPaletteColorPickerContainerView palettePopoverPresenting](self, "palettePopoverPresenting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "palettePopoverPresentingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isBeingDismissed") ^ 1;

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (-[PKPaletteColorPickerContainerView _isInputAssistantViewControllerPresented](self, "_isInputAssistantViewControllerPresented"))
  {
    -[PKPaletteColorPickerContainerView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PKPaletteColorPickerContainerView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputAssistantView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "colorPickerContainerView:willDismissInputAssistantView:", self, v9);

    }
    -[PKPaletteColorPickerContainerView inputAssistantViewController](self, "inputAssistantViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__PKPaletteColorPickerContainerView_dismissPalettePopoverWithCompletion___block_invoke;
    v14[3] = &unk_1E7778AA0;
    v14[4] = self;
    v15 = v4;
    -[PKPaletteColorPickerContainerView _dismissViewController:withCompletion:](self, "_dismissViewController:withCompletion:", v10, v14);

  }
  else
  {
    -[PKPaletteColorPickerContainerView palettePopoverPresenting](self, "palettePopoverPresenting");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "palettePopoverPresentingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerContainerView _dismissViewController:withCompletion:](self, "_dismissViewController:withCompletion:", v13, v4);

  }
}

uint64_t __73__PKPaletteColorPickerContainerView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "inputAssistantViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputAssistantView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorPickerContainerView:didDismissInputAssistantView:", v5, v7);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_dismissViewController:(id)a3 withCompletion:(id)a4
{
  void (**v5)(_QWORD);
  id v6;

  v6 = a3;
  v5 = (void (**)(_QWORD))a4;
  if (v6 && (objc_msgSend(v6, "isBeingDismissed") & 1) == 0)
  {
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v5);
  }
  else if (v5)
  {
    v5[2](v5);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteColorPickerContainerView;
  -[PKPaletteColorPickerContainerView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPaletteColorPickerContainerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteColorPickerContainerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKPaletteColorPickerContainerView _updateUI](self, "_updateUI");
LABEL_6:

}

- (PKPaletteColorPickerContainerViewDelegate)delegate
{
  return (PKPaletteColorPickerContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKDrawingPaletteViewStateSubject)paletteViewState
{
  return (PKDrawingPaletteViewStateSubject *)objc_loadWeakRetained((id *)&self->_paletteViewState);
}

- (PKPaletteColorPickerView)colorPickerView
{
  return self->_colorPickerView;
}

- (PKPalettePopoverPresenting)palettePopoverPresenting
{
  return (PKPalettePopoverPresenting *)objc_loadWeakRetained((id *)&self->_palettePopoverPresenting);
}

- (BOOL)shouldShowInputAssistantView
{
  return self->_shouldShowInputAssistantView;
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (PKDrawingPaletteInputAssistantContainerView)inputAssistantContainerView
{
  return self->_inputAssistantContainerView;
}

- (void)setInputAssistantContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantContainerView, a3);
}

- (PKPaletteInputAssistantViewController)inputAssistantViewController
{
  return self->_inputAssistantViewController;
}

- (void)setInputAssistantViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantViewController, 0);
  objc_storeStrong((id *)&self->_inputAssistantContainerView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_palettePopoverPresenting);
  objc_storeStrong((id *)&self->_colorPickerView, 0);
  objc_destroyWeak((id *)&self->_paletteViewState);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
