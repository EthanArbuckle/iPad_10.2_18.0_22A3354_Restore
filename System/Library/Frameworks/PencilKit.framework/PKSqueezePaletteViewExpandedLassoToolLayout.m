@implementation PKSqueezePaletteViewExpandedLassoToolLayout

- (id)initWithContext:(id *)a1
{
  id v4;
  id *v5;
  void *v6;
  PKFloatArray *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  objc_super v13;

  v4 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKSqueezePaletteViewExpandedLassoToolLayout;
    v5 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 9, a2);
      *((double *)a1 + 4) = PKSqueezePaletteButtonSize();
      a1[5] = v6;
      a1[6] = (id)PKSqueezePaletteButtonInterItemSpacing;
      v7 = [PKFloatArray alloc];
      v8 = a1[9];
      if (v8)
        v8 = (_QWORD *)v8[3];
      v9 = v8;
      v10 = -[PKFloatArray initWithCapacity:](v7, objc_msgSend(v9, "count"));
      v11 = a1[7];
      a1[7] = v10;

    }
  }

  return a1;
}

- (void)_performDrawingToolTapAction:(uint64_t)a1
{
  _QWORD *v2;
  id WeakRetained;
  _QWORD *v4;

  if (a1)
  {
    v2 = *(_QWORD **)(a1 + 72);
    if (v2)
      v2 = (_QWORD *)v2[4];
    v4 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v4);

  }
}

- (void)setupUI
{
  PKSqueezePaletteView **p_paletteView;
  id WeakRetained;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *context;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v6;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v7;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v8;
  uint64_t v9;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v10;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v11;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v12;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v13;
  void *v14;
  id v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *lassoToolCenterXConstraint;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v19;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v20;
  void *v21;
  id v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *lassoToolCenterYConstraint;
  double *v26;
  double *v27;
  double toolAngle;
  double v29;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v30;
  double v31;
  double v32;
  double v33;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v34;
  void *v35;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v36;
  void *v37;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v38;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v39;
  id v40;
  NSArray *v41;
  NSArray *barButtons;
  void *v43;
  NSLayoutConstraint *v44;
  void *v45;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v46;
  double v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, void *, unint64_t);
  void *v52;
  id v53;
  PKSqueezePaletteViewExpandedLassoToolLayout *v54;
  uint64_t *v55;
  uint64_t v56;
  double *v57;
  uint64_t v58;
  double v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id from;
  id location;
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  p_paletteView = &self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    context = self->_context;
    if (context)
      context = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)context->_drawingTool;
    v6 = context;
    -[PKSqueezePaletteViewExpandedLassoToolLayoutContext addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__didTapDrawingTool_, 64);

    objc_initWeak(&location, self);
    v7 = self->_context;
    if (v7)
      v7 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v7->_drawingTool;
    v8 = v7;
    objc_initWeak(&from, v8);

    v9 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __54__PKSqueezePaletteViewExpandedLassoToolLayout_setupUI__block_invoke;
    v60[3] = &unk_1E7778930;
    objc_copyWeak(&v61, &from);
    objc_copyWeak(&v62, &location);
    v10 = self->_context;
    if (v10)
      v10 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v10->_drawingTool;
    v11 = v10;
    -[PKSqueezePaletteViewExpandedLassoToolLayoutContext _set_pk_longSqueezeAction:](v11, "_set_pk_longSqueezeAction:", v60);

    v12 = self->_context;
    if (v12)
      v12 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v12->_drawingTool;
    v13 = v12;
    -[PKSqueezePaletteViewExpandedLassoToolLayoutContext centerXAnchor](v13, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)p_paletteView);
    objc_msgSend(v15, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    lassoToolCenterXConstraint = self->_lassoToolCenterXConstraint;
    self->_lassoToolCenterXConstraint = v17;

    v19 = self->_context;
    if (v19)
      v19 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v19->_drawingTool;
    v20 = v19;
    -[PKSqueezePaletteViewExpandedLassoToolLayoutContext centerYAnchor](v20, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_loadWeakRetained((id *)p_paletteView);
    objc_msgSend(v22, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    lassoToolCenterYConstraint = self->_lassoToolCenterYConstraint;
    self->_lassoToolCenterYConstraint = v24;

    v26 = (double *)objc_loadWeakRetained((id *)p_paletteView);
    v27 = v26;
    toolAngle = 0.0;
    v29 = 0.0;
    if (v26)
      v29 = v26[63];
    v30 = self->_context;
    if (v30)
      toolAngle = v30->_toolAngle;
    v31 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v29, toolAngle);
    v33 = v32;

    -[NSLayoutConstraint setConstant:](self->_lassoToolCenterXConstraint, "setConstant:", v31);
    -[NSLayoutConstraint setConstant:](self->_lassoToolCenterYConstraint, "setConstant:", v33);
    v34 = self->_context;
    if (v34)
      v34 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v34->_barButtonItems;
    v35 = (void *)MEMORY[0x1E0C99DE8];
    v36 = v34;
    objc_msgSend(v35, "arrayWithCapacity:", -[PKSqueezePaletteViewExpandedLassoToolLayoutContext count](v36, "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0;
    v57 = (double *)&v56;
    v58 = 0x2020000000;
    v59 = 0.0;
    v38 = self->_context;
    if (v38)
    {
      v59 = v38->_toolAngle;
      v38 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v38->_barButtonItems;
    }
    v39 = v38;
    v49 = v9;
    v50 = 3221225472;
    v51 = __54__PKSqueezePaletteViewExpandedLassoToolLayout_setupUI__block_invoke_2;
    v52 = &unk_1E777CC78;
    v40 = v37;
    v53 = v40;
    v54 = self;
    v55 = &v56;
    -[PKSqueezePaletteViewExpandedLassoToolLayoutContext enumerateObjectsUsingBlock:](v39, "enumerateObjectsUsingBlock:", &v49);

    v41 = (NSArray *)objc_msgSend(v40, "copy", v49, v50, v51, v52);
    barButtons = self->_barButtons;
    self->_barButtons = v41;

    v43 = (void *)MEMORY[0x1E0CB3718];
    v44 = self->_lassoToolCenterYConstraint;
    v65[0] = self->_lassoToolCenterXConstraint;
    v65[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v45);

    v46 = self->_context;
    if (v46)
      v47 = v46->_toolAngle + 0.0523598776;
    else
      v47 = 0.0523598776;
    v48 = objc_loadWeakRetained((id *)p_paletteView);
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v48, 1, 1, v57[3], v47);

    _Block_object_dispose(&v56, 8);
    objc_destroyWeak(&v62);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __54__PKSqueezePaletteViewExpandedLassoToolLayout_setupUI__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_loadWeakRetained(v2);
    -[PKSqueezePaletteViewExpandedLassoToolLayout _performDrawingToolTapAction:]((uint64_t)v5);

  }
}

void __54__PKSqueezePaletteViewExpandedLassoToolLayout_setupUI__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v4;
  PKPaletteBarButton *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double *v22;
  double v23;
  double v24;
  double *v25;
  double *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = -[PKPaletteBarButton initWithBarButtonItem:]([PKPaletteBarButton alloc], "initWithBarButtonItem:", v4);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  -[PKPaletteBarButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  v7 = WeakRetained;
  if (WeakRetained)
    v8 = (void *)*((_QWORD *)WeakRetained + 70);
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "addSubview:", v5);

  -[PKPaletteBarButton centerXAnchor](v5, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(v11, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteBarButton centerYAnchor](v5, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(v15, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v20 = *(double *)(v18 + 32);
  v21 = *(double *)(v18 + 48);
  v22 = (double *)objc_loadWeakRetained((id *)(v18 + 64));
  v23 = 0.0;
  v24 = 0.0;
  if (v22)
    v24 = v22[63];

  v25 = (double *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  v26 = v25;
  if (v25)
    v23 = v25[63];
  v27 = v19 - (v20 + v21) / v24;
  v28 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v23, v27);
  v30 = v29;

  objc_msgSend(v13, "setConstant:", v28);
  objc_msgSend(v17, "setConstant:", v30);
  v31 = (void *)MEMORY[0x1E0CB3718];
  v38[0] = v13;
  v38[1] = v17;
  -[PKPaletteBarButton heightAnchor](v5, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", *(double *)(*(_QWORD *)(a1 + 40) + 40));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v33;
  -[PKPaletteBarButton widthAnchor](v5, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", *(double *)(*(_QWORD *)(a1 + 40) + 32));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v36);

  -[PKFloatArray setFloat:atIndex:](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), a3, v27);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v27;

}

- (void)updateUI
{
  id WeakRetained;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *context;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v5;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v6;
  PKSqueezePaletteDrawingTool *drawingTool;
  PKSqueezePaletteDrawingTool *v8;
  NSArray *barButtons;
  _QWORD v10[5];
  CGAffineTransform v11;
  CGAffineTransform v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    context = self->_context;
    if (context)
      context = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)context->_drawingTool;
    v5 = context;
    -[PKSqueezePaletteViewExpandedLassoToolLayoutContext setAlpha:](v5, "setAlpha:", 1.0);

    v6 = self->_context;
    if (v6)
    {
      CGAffineTransformMakeRotation(&v12, v6->_toolAngle + 1.57079633);
      drawingTool = v6->_drawingTool;
    }
    else
    {
      CGAffineTransformMakeRotation(&v12, 1.57079633);
      drawingTool = 0;
    }
    v8 = drawingTool;
    v11 = v12;
    -[PKSqueezePaletteDrawingTool setTransform:](v8, "setTransform:", &v11);

    barButtons = self->_barButtons;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__PKSqueezePaletteViewExpandedLassoToolLayout_updateUI__block_invoke;
    v10[3] = &unk_1E777CCA0;
    v10[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](barButtons, "enumerateObjectsUsingBlock:", v10);
  }
}

void __55__PKSqueezePaletteViewExpandedLassoToolLayout_updateUI__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v4;
  id v5;
  double v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v5 = a2;
  v6 = -[PKFloatArray floatAtIndex:](v4, a3);
  CGAffineTransformMakeRotation(&v8, v6 + 1.57079633);
  v7 = v8;
  objc_msgSend(v5, "setTransform:", &v7);

}

- (void)willTransitionToLayout:(id)a3
{
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *context;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v5;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v6;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v7;
  void *v8;
  NSLayoutConstraint *lassoToolCenterYConstraint;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  context = self->_context;
  if (context)
    context = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)context->_drawingTool;
  v5 = context;
  -[PKSqueezePaletteViewExpandedLassoToolLayoutContext removeTarget:action:forControlEvents:](v5, "removeTarget:action:forControlEvents:", self, sel__didTapDrawingTool_, 64);

  v6 = self->_context;
  if (v6)
    v6 = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)v6->_drawingTool;
  v7 = v6;
  -[PKSqueezePaletteViewExpandedLassoToolLayoutContext _set_pk_longSqueezeAction:](v7, "_set_pk_longSqueezeAction:", 0);

  v8 = (void *)MEMORY[0x1E0CB3718];
  lassoToolCenterYConstraint = self->_lassoToolCenterYConstraint;
  v11[0] = self->_lassoToolCenterXConstraint;
  v11[1] = lassoToolCenterYConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deactivateConstraints:", v10);

  -[NSArray makeObjectsPerformSelector:](self->_barButtons, "makeObjectsPerformSelector:", sel_removeFromSuperview);
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *context;
  id WeakRetained;
  PKSqueezePaletteViewExpandedLassoToolLayoutContext *v6;

  context = self->_context;
  if (context)
    context = (PKSqueezePaletteViewExpandedLassoToolLayoutContext *)context->_previousLayout;
  v6 = context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);

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
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_barButtonAngles, 0);
  objc_storeStrong((id *)&self->_barButtons, 0);
  objc_storeStrong((id *)&self->_lassoToolCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolCenterXConstraint, 0);
}

@end
