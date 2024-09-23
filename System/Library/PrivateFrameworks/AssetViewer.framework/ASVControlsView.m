@implementation ASVControlsView

- (ASVControlsView)initWithArrangedSubviews:(id)a3
{
  id v4;
  ASVControlsView *v5;
  ASVControlsView *v6;
  uint64_t v7;
  UIStackView *stackView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIAccessibilityHUDGestureManager *largeTextHUDGestureManager;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ASVControlsView;
  v5 = -[ASVControlsView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[ASVControlsView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v4);
    v33 = v4;
    stackView = v6->_stackView;
    v6->_stackView = (UIStackView *)v7;

    -[UIStackView setDistribution:](v6->_stackView, "setDistribution:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v6->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v6->_stackView, "setSpacing:", 10.0);
    -[ASVControlsView addSubview:](v6, "addSubview:", v6->_stackView);
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView leadingAnchor](v6->_stackView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVControlsView leadingAnchor](v6, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    -[UIStackView trailingAnchor](v6->_stackView, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVControlsView trailingAnchor](v6, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v10;
    -[UIStackView topAnchor](v6->_stackView, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVControlsView topAnchor](v6, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v13;
    -[UIStackView bottomAnchor](v6->_stackView, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVControlsView bottomAnchor](v6, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v17);

    v4 = v33;
    -[ASVControlsView layer](v6, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMasksToBounds:", 0);

    -[ASVControlsView layer](v6, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = *(_DWORD *)"\nף=";
    objc_msgSend(v19, "setShadowOpacity:", v20);

    v21 = *MEMORY[0x1E0C9D820];
    v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[ASVControlsView layer](v6, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShadowOffset:", v21, v22);

    -[ASVControlsView layer](v6, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShadowRadius:", 20.0);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3410]), "initWithView:delegate:", v6, v6);
    largeTextHUDGestureManager = v6->_largeTextHUDGestureManager;
    v6->_largeTextHUDGestureManager = (UIAccessibilityHUDGestureManager *)v25;

  }
  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  ASVControlsView *v5;
  ASVControlsView *v6;
  ASVControlsView *v7;
  ASVControlsView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASVControlsView;
  -[ASVControlsView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (ASVControlsView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v8 = 0;
  }
  else
  {
    -[ASVControlsView stackView](self, "stackView");
    v6 = (ASVControlsView *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 0;
    else
      v7 = v5;
    v8 = v7;

  }
  return v8;
}

- (id)_buttonAtPoint:(CGPoint)a3
{
  void *v3;
  id v4;

  -[ASVControlsView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;

  return v4;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  -[ASVControlsView _buttonAtPoint:](self, "_buttonAtPoint:", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "largeImageInsets");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

    }
    else
    {
      v10 = *MEMORY[0x1E0DC49E8];
      v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v14 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
    v18 = objc_alloc(MEMORY[0x1E0DC3418]);
    objc_msgSend(v5, "titleForState:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageForState:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v18, "initWithTitle:image:imageInsets:scaleImage:", v19, v20, 1, v10, v12, v14, v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;

  -[ASVControlsView _buttonAtPoint:](self, "_buttonAtPoint:", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "sendActionsForControlEvents:", 64);
    objc_msgSend(v5, "setHighlighted:", 1);
    v6 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ASVControlsView__accessibilityHUDGestureManager_gestureLiftedAtPoint___block_invoke;
    block[3] = &unk_1E9F0C8A0;
    v8 = v5;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __72__ASVControlsView__accessibilityHUDGestureManager_gestureLiftedAtPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIAccessibilityHUDGestureManager)largeTextHUDGestureManager
{
  return self->_largeTextHUDGestureManager;
}

- (void)setLargeTextHUDGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextHUDGestureManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
