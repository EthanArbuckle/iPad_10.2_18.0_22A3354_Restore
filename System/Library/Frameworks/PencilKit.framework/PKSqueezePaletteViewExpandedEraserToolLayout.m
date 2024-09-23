@implementation PKSqueezePaletteViewExpandedEraserToolLayout

- (_QWORD)initWithContext:(void *)a3 attributeButtons:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PKSqueezePaletteViewExpandedEraserToolLayout;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 3, a2);
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (void)setupUI
{
  PKSqueezePaletteView **p_paletteView;
  id WeakRetained;
  uint64_t v5;
  double *v6;
  id v7;
  double v8;
  NSArray *attributeButtons;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  NSArray *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint64_t *v39;
  id v40[4];
  uint64_t v41;
  double *v42;
  uint64_t v43;
  double v44;
  id location;
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  p_paletteView = &self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (!WeakRetained)
    return;
  -[PKSqueezePaletteViewExpandedEraserToolLayout context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (double *)v5;
  if (!v5)
  {
    v7 = 0;
    v8 = 0.0;
    if (self)
      goto LABEL_4;
LABEL_10:
    attributeButtons = 0;
    goto LABEL_5;
  }
  v7 = *(id *)(v5 + 24);
  v8 = v6[1];
  if (!self)
    goto LABEL_10;
LABEL_4:
  attributeButtons = self->_attributeButtons;
LABEL_5:
  v35 = attributeButtons;
  objc_msgSend(v7, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)p_paletteView);
  objc_msgSend(v11, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)p_paletteView);
  objc_msgSend(v15, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (double *)objc_loadWeakRetained((id *)p_paletteView);
  v19 = v18;
  if (v18)
    v20 = v18[63];
  else
    v20 = 0.0;
  v21 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v20, v8);
  v23 = v22;

  objc_msgSend(v13, "setConstant:", v21);
  objc_msgSend(v17, "setConstant:", v23);
  v24 = (void *)objc_opt_new();
  v46[0] = v13;
  v46[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v25);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_attributeButtons, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = PKSqueezePaletteButtonSize();
  v29 = v28;
  v30 = (void *)PKSqueezePaletteButtonInterItemSpacing;
  objc_initWeak(&location, self);
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = v8;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __55__PKSqueezePaletteViewExpandedEraserToolLayout_setupUI__block_invoke;
  v36[3] = &unk_1E777D1C8;
  v36[4] = self;
  v39 = &v41;
  v40[1] = *(id *)&v27;
  v40[2] = v29;
  v40[3] = v30;
  v31 = v24;
  v37 = v31;
  v32 = v26;
  v38 = v32;
  objc_copyWeak(v40, &location);
  -[NSArray enumerateObjectsUsingBlock:](v35, "enumerateObjectsUsingBlock:", v36);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
  v33 = (void *)objc_msgSend(v31, "copy");
  -[PKSqueezePaletteViewExpandedEraserToolLayout setLayoutConstraints:](self, "setLayoutConstraints:", v33);

  v34 = objc_loadWeakRetained((id *)p_paletteView);
  -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v34, 1, 1, v42[3], v8);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__didTapDrawingTool_, 64);
  objc_destroyWeak(v40);

  _Block_object_dispose(&v41, 8);
  objc_destroyWeak(&location);

}

void __55__PKSqueezePaletteViewExpandedEraserToolLayout_setupUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;
  _QWORD v41[5];

  v41[4] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__didTapAttributeButton_, 64);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = (void *)*((_QWORD *)WeakRetained + 70);
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "addSubview:", v4);

  objc_msgSend(v4, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v10, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v18 = *(double *)(a1 + 72) + *(double *)(a1 + 88);
  v19 = (double *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v20 = 0.0;
  v21 = 0.0;
  if (v19)
    v21 = v19[63];
  v22 = v17 - v18 / v21;

  v23 = (double *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v24 = v23;
  if (v23)
    v20 = v23[63];
  v25 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v20, v22);
  v27 = v26;

  objc_msgSend(v12, "setConstant:", v25);
  objc_msgSend(v16, "setConstant:", v27);
  v28 = *(void **)(a1 + 40);
  v41[0] = v12;
  v41[1] = v16;
  objc_msgSend(v4, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", *(double *)(a1 + 80));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v30;
  objc_msgSend(v4, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToConstant:", *(double *)(a1 + 72));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObjectsFromArray:", v33);

  *(float *)&v34 = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v35, a3);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v22;
  objc_initWeak(&location, v4);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __55__PKSqueezePaletteViewExpandedEraserToolLayout_setupUI__block_invoke_2;
  v37[3] = &unk_1E7778930;
  objc_copyWeak(&v38, &location);
  objc_copyWeak(&v39, (id *)(a1 + 64));
  objc_msgSend(v4, "_set_pk_longSqueezeAction:", v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

}

void __55__PKSqueezePaletteViewExpandedEraserToolLayout_setupUI__block_invoke_2(uint64_t a1)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  id to;

  v2 = (id *)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 32));
  v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "_didTapAttributeButton:", v5);

  }
  objc_destroyWeak(&to);
}

- (void)updateUI
{
  PKSqueezePaletteViewExpandedEraserToolLayout *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v2 = self;
  if (self)
    self = (PKSqueezePaletteViewExpandedEraserToolLayout *)self->_attributeButtons;
  -[PKSqueezePaletteViewExpandedEraserToolLayout enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &__block_literal_global_78);
  -[PKSqueezePaletteViewExpandedEraserToolLayout context](v2, "context");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 24);
  else
    v5 = 0;
  v10 = v5;

  if (v10)
    v6 = (void *)v10[103];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "width");
  +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", CFSTR("com.apple.ink.eraser"));
  if (v2)
    v2 = (PKSqueezePaletteViewExpandedEraserToolLayout *)v2->_attributeButtons;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PKSqueezePaletteViewExpandedEraserToolLayout_updateUI__block_invoke_2;
  v11[3] = &unk_1E777D210;
  v13 = v8;
  v12 = v7;
  v9 = v7;
  -[PKSqueezePaletteViewExpandedEraserToolLayout enumerateObjectsUsingBlock:](v2, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __56__PKSqueezePaletteViewExpandedEraserToolLayout_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:", 0);
}

void __56__PKSqueezePaletteViewExpandedEraserToolLayout_updateUI__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double *v6;
  double *v7;
  double v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (double *)v9;
    v7 = v6;
    if (v6)
      v8 = v6[94];
    else
      v8 = 0.0;
    if (vabdd_f64(v8, *(double *)(a1 + 40)) < 0.1)
    {
      objc_msgSend(v6, "setSelected:", 1);
      *a4 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(*(id *)(a1 + 32), "eraserType"))
    {
      objc_msgSend(v9, "setSelected:", 1);
      *a4 = 1;
    }
  }

}

- (void)willTransitionToLayout:(id)a3
{
  void *v4;
  void *v5;
  NSArray *attributeButtons;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3718];
  -[PKSqueezePaletteViewExpandedEraserToolLayout layoutConstraints](self, "layoutConstraints", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  if (self)
    attributeButtons = self->_attributeButtons;
  else
    attributeButtons = 0;
  -[NSArray makeObjectsPerformSelector:](attributeButtons, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[PKSqueezePaletteViewExpandedEraserToolLayout context](self, "context");
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v7;
  if (v7)
    v8 = *(void **)(v7 + 24);
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "removeTarget:action:forControlEvents:", self, sel__didTapDrawingTool_, 64);

}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  PKSqueezePaletteViewExpandedEraserToolLayoutContext *context;
  id WeakRetained;
  PKSqueezePaletteViewExpandedEraserToolLayoutContext *v6;

  context = self->_context;
  if (context)
    context = (PKSqueezePaletteViewExpandedEraserToolLayoutContext *)context->_previousLayout;
  v6 = context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);

}

- (void)_didTapDrawingTool:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;
  uint8_t v10[16];

  v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Drawing tool tapped", v10, 2u);
  }

  -[PKSqueezePaletteViewExpandedEraserToolLayout context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v8);

}

- (void)_didTapAttributeButton:(id)a3
{
  double *v4;
  double *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  PKEraserTool *v11;
  double v12;
  NSObject *v13;
  PKEraserTool *v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  NSObject *v18;
  PKEraserTool *v19;
  id v20;
  int v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  -[PKSqueezePaletteViewExpandedEraserToolLayout lastTappedAttributeButton](self, "lastTappedAttributeButton");
  v5 = (double *)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PKSqueezePaletteViewExpandedEraserToolLayout context](self, "context");
    v15 = objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)v15;
    if (v15)
      v16 = *(void **)(v15 + 16);
    else
      v16 = 0;
    v11 = v16;
    WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v11);

  }
  else
  {
    -[PKSqueezePaletteViewExpandedEraserToolLayout setLastTappedAttributeButton:](self, "setLastTappedAttributeButton:", v4);
    -[PKSqueezePaletteViewExpandedEraserToolLayout context](self, "context");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 24);
    else
      v8 = 0;
    v9 = v8;

    if (v9)
      v10 = (void *)v9[103];
    else
      v10 = 0;
    v11 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v4)
        v12 = v4[94];
      else
        v12 = 0.0;
      v13 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 134217984;
        v22 = v12;
        _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Tap stroke weight button %f", (uint8_t *)&v21, 0xCu);
      }

      v14 = -[PKEraserTool initWithEraserType:weight:]([PKEraserTool alloc], "initWithEraserType:weight:", 2, v12);
LABEL_19:
      v19 = v14;

      -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v9, v19);
      v20 = objc_loadWeakRetained((id *)&self->_paletteView);
      -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)v20, v19, 1);

      v11 = v19;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Tap object eraser button", (uint8_t *)&v21, 2u);
      }

      v14 = -[PKEraserTool initWithEraserType:]([PKEraserTool alloc], "initWithEraserType:", 0);
      goto LABEL_19;
    }
  }
LABEL_20:

}

- (PKSqueezePaletteView)paletteView
{
  return (PKSqueezePaletteView *)objc_loadWeakRetained((id *)&self->_paletteView);
}

- (void)setPaletteView:(id)a3
{
  objc_storeWeak((id *)&self->_paletteView, a3);
}

- (PKSqueezePaletteViewExpandedEraserToolLayoutContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (PKSqueezePaletteRoundedButton)lastTappedAttributeButton
{
  return (PKSqueezePaletteRoundedButton *)objc_loadWeakRetained((id *)&self->_lastTappedAttributeButton);
}

- (void)setLastTappedAttributeButton:(id)a3
{
  objc_storeWeak((id *)&self->_lastTappedAttributeButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastTappedAttributeButton);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attributeButtons, 0);
  objc_destroyWeak((id *)&self->_paletteView);
}

@end
