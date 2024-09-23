@implementation AXUIFloatingViewPresenter

- (AXUIFloatingViewPresenter)initWithContainingView:(id)a3 alignedToEdge:(unint64_t)a4 withinSafeArea:(BOOL)a5
{
  id v9;
  AXUIFloatingViewPresenter *v10;
  AXUIFloatingViewPresenter *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXUIFloatingViewPresenter;
  v10 = -[AXUIFloatingViewPresenter init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_containingView, a3);
    v11->_alignedEdge = a4;
    v11->_withinSafeArea = a5;
  }

  return v11;
}

- (void)_hideFloatingView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIFloatingViewPresenter setFloatingView:](self, "setFloatingView:", 0);
  -[AXUIFloatingViewPresenter setEdgeConstraints:](self, "setEdgeConstraints:", 0);
  if (v3)
  {
    -[AXUIFloatingViewPresenter delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willDismissFloatingViewForPresenter:", self);

    v5 = (void *)MEMORY[0x1E0DC3F10];
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__AXUIFloatingViewPresenter__hideFloatingView__block_invoke;
    v9[3] = &unk_1E76AB330;
    v10 = v3;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __46__AXUIFloatingViewPresenter__hideFloatingView__block_invoke_2;
    v7[3] = &unk_1E76ABC88;
    v8 = v10;
    objc_msgSend(v5, "animateWithDuration:animations:completion:", v9, v7, 0.3);

  }
}

uint64_t __46__AXUIFloatingViewPresenter__hideFloatingView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __46__AXUIFloatingViewPresenter__hideFloatingView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)presentFloatingView:(id)a3 withDuration:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
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
  void *v32;
  void *v33;
  _QWORD v34[6];
  _QWORD v35[5];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideFloatingView, 0);
  -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView"),
        v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 == v6))
  {
    if (a4 > 0.0)
      -[AXUIFloatingViewPresenter performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideFloatingView, 0, a4);
  }
  else
  {
    -[AXUIFloatingViewPresenter _hideFloatingView](self, "_hideFloatingView");
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AXUIFloatingViewPresenter containingView](self, "containingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v6);

    -[AXUIFloatingViewPresenter setFloatingView:](self, "setFloatingView:", v6);
    v24 = (void *)MEMORY[0x1E0CB3718];
    -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIFloatingViewPresenter containingView](self, "containingView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v29;
    -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIFloatingViewPresenter containingView](self, "containingView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v23;
    -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIFloatingViewPresenter containingView](self, "containingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v12;
    -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIFloatingViewPresenter containingView](self, "containingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v18);

    -[AXUIFloatingViewPresenter _updateEdgeConstraints](self, "_updateEdgeConstraints");
    -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 0.0);

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __62__AXUIFloatingViewPresenter_presentFloatingView_withDuration___block_invoke;
    v35[3] = &unk_1E76AB330;
    v35[4] = self;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __62__AXUIFloatingViewPresenter_presentFloatingView_withDuration___block_invoke_2;
    v34[3] = &unk_1E76ABCB0;
    *(double *)&v34[5] = a4;
    v34[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v35, v34, 0.3);
  }

}

void __62__AXUIFloatingViewPresenter_presentFloatingView_withDuration___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "floatingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __62__AXUIFloatingViewPresenter_presentFloatingView_withDuration___block_invoke_2(uint64_t result)
{
  if (*(double *)(result + 40) > 0.0)
    return objc_msgSend(*(id *)(result + 32), "performSelector:withObject:afterDelay:", sel__hideFloatingView, 0);
  return result;
}

- (void)dismissFloatingView
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideFloatingView, 0);
  -[AXUIFloatingViewPresenter _hideFloatingView](self, "_hideFloatingView");
}

- (void)setAlignedEdge:(unint64_t)a3
{
  if (self->_alignedEdge != a3)
  {
    self->_alignedEdge = a3;
    -[AXUIFloatingViewPresenter _updateEdgeConstraints](self, "_updateEdgeConstraints");
  }
}

- (void)_updateEdgeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXUIFloatingViewPresenter edgeConstraints](self, "edgeConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3718];
      -[AXUIFloatingViewPresenter edgeConstraints](self, "edgeConstraints");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deactivateConstraints:", v6);

    }
    v7 = -[AXUIFloatingViewPresenter withinSafeArea](self, "withinSafeArea");
    -[AXUIFloatingViewPresenter containingView](self, "containingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "safeAreaLayoutGuide");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    switch(-[AXUIFloatingViewPresenter alignedEdge](self, "alignedEdge"))
    {
      case 1uLL:
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "topAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "topAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v13;
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "centerXAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "centerXAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v17;
        v18 = v27;
        break;
      case 2uLL:
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "leadingAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "leadingAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v13;
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "centerYAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "centerYAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v17;
        v18 = v25;
        break;
      case 4uLL:
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bottomAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bottomAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v13;
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "centerXAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "centerXAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v17;
        v18 = v26;
        break;
      case 8uLL:
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "trailingAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "trailingAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v13;
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "centerYAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "centerYAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v17;
        v18 = v24;
        break;
      default:
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "centerXAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "centerXAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v13;
        -[AXUIFloatingViewPresenter floatingView](self, "floatingView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "centerYAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "centerYAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v17;
        v18 = v23;
        break;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIFloatingViewPresenter setEdgeConstraints:](self, "setEdgeConstraints:", v19);

    v20 = (void *)MEMORY[0x1E0CB3718];
    -[AXUIFloatingViewPresenter edgeConstraints](self, "edgeConstraints");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v21);

  }
}

- (AXUIFloatingViewPresenterDelegate)delegate
{
  return (AXUIFloatingViewPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)containingView
{
  return self->_containingView;
}

- (unint64_t)alignedEdge
{
  return self->_alignedEdge;
}

- (BOOL)withinSafeArea
{
  return self->_withinSafeArea;
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingView, a3);
}

- (NSArray)edgeConstraints
{
  return self->_edgeConstraints;
}

- (void)setEdgeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_edgeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeConstraints, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
