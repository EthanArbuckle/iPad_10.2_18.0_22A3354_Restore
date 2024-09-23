@implementation PKSqueezePaletteViewExpandedInkingToolLayout

- (_QWORD)initWithContext:(void *)a3 strokeWeightButtons:
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
    v12.super_class = (Class)PKSqueezePaletteViewExpandedInkingToolLayout;
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
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  double v6;
  NSArray *strokeWeightButtons;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double *v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  PKAngularOpacitySlider *v28;
  double *v29;
  double *v30;
  double v31;
  double v32;
  double v33;
  double *v34;
  PKAngularOpacitySlider *opacitySlider;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  NSArray *v63;
  id v64;
  id v65;
  id *location;
  _QWORD v67[5];
  id v68;
  id v69;
  uint64_t *v70;
  id v71;
  int64x2_t v72;
  uint64_t v73;
  id from;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  double v78;
  _QWORD v79[4];
  _QWORD v80[4];

  v80[2] = *MEMORY[0x1E0C80C00];
  location = (id *)&self->_paletteView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (!WeakRetained)
    return;
  -[PKSqueezePaletteViewExpandedInkingToolLayout context](self, "context");
  v4 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v4;
  v5 = v4;
  if (!v4)
  {
    v65 = 0;
    v6 = 0.0;
    if (self)
      goto LABEL_4;
LABEL_16:
    strokeWeightButtons = 0;
    goto LABEL_5;
  }
  v65 = *(id *)(v4 + 24);
  v6 = *(double *)(v5 + 8);
  if (!self)
    goto LABEL_16;
LABEL_4:
  strokeWeightButtons = self->_strokeWeightButtons;
LABEL_5:
  v63 = strokeWeightButtons;
  objc_msgSend(v65, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(location);
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v65, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(location);
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (double *)objc_loadWeakRetained(location);
  v15 = v14;
  if (v14)
    v16 = v14[63];
  else
    v16 = 0.0;
  v17 = PKPointOnArc(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v16, v6);
  v19 = v18;

  objc_msgSend(v61, "setConstant:", v17);
  objc_msgSend(v60, "setConstant:", v19);
  v20 = (void *)objc_opt_new();
  v80[0] = v61;
  v80[1] = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v21);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v63, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = PKSqueezePaletteButtonInterItemSpacing;
  v75 = 0;
  v76 = (double *)&v75;
  v77 = 0x2020000000;
  v78 = v6;
  objc_initWeak(&from, self);
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __55__PKSqueezePaletteViewExpandedInkingToolLayout_setupUI__block_invoke;
  v67[3] = &unk_1E777ADB0;
  v67[4] = self;
  v70 = &v75;
  v72 = vdupq_n_s64(0x4042800000000000uLL);
  v73 = v23;
  v64 = v20;
  v68 = v64;
  v51 = v22;
  v69 = v51;
  objc_copyWeak(&v71, &from);
  -[NSArray enumerateObjectsUsingBlock:](v63, "enumerateObjectsUsingBlock:", v67);
  v24 = (double *)objc_loadWeakRetained(location);
  if (v24)
    v25 = v24[63];
  else
    v25 = 0.0;

  v26 = *(double *)&PKSqueezePaletteBeforeOpacitySliderSpacing;
  v27 = *(double *)&PKSqueezePaletteOpacitySliderAngularWidth;
  v28 = [PKAngularOpacitySlider alloc];
  v29 = (double *)objc_loadWeakRetained(location);
  v30 = v29;
  v31 = v6 + v26 / v25;
  v32 = v31 + v27 / v25;
  if (v29)
    v33 = v29[64];
  else
    v33 = 0.0;
  v34 = -[PKAngularOpacitySlider initWithFrame:startAngle:endAngle:arcRadius:arcWidth:](v28, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v31, v31 + v27 / v25, v25, v33 * *(double *)&PKSqueezePaletteOpacitySliderHeighRatio);
  opacitySlider = self->_opacitySlider;
  self->_opacitySlider = (PKAngularOpacitySlider *)v34;

  -[PKAngularOpacitySlider setTranslatesAutoresizingMaskIntoConstraints:](self->_opacitySlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKAngularOpacitySlider setDelegate:](self->_opacitySlider, "setDelegate:", self);
  v36 = objc_loadWeakRetained(location);
  v37 = v36;
  if (v36)
    v38 = (void *)*((_QWORD *)v36 + 70);
  else
    v38 = 0;
  v39 = v38;
  objc_msgSend(v39, "addSubview:", self->_opacitySlider);

  -[PKSqueezePaletteViewExpandedInkingToolLayout setOpacitySlider:](self, "setOpacitySlider:", self->_opacitySlider);
  -[PKAngularOpacitySlider centerXAnchor](self->_opacitySlider, "centerXAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_loadWeakRetained(location);
  objc_msgSend(v59, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v56;
  -[PKAngularOpacitySlider centerYAnchor](self->_opacitySlider, "centerYAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_loadWeakRetained(location);
  objc_msgSend(v55, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v52;
  -[PKAngularOpacitySlider widthAnchor](self->_opacitySlider, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_loadWeakRetained(location);
  objc_msgSend(v41, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v43;
  -[PKAngularOpacitySlider heightAnchor](self->_opacitySlider, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_loadWeakRetained(location);
  objc_msgSend(v45, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addObjectsFromArray:", v48);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v64);
  v49 = (void *)objc_msgSend(v64, "copy");
  -[PKSqueezePaletteViewExpandedInkingToolLayout setLayoutConstraints:](self, "setLayoutConstraints:", v49);

  v50 = objc_loadWeakRetained(location);
  -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v50, 1, 1, v76[3], v32);

  objc_msgSend(v65, "addTarget:action:forControlEvents:", self, sel__didTapDrawingTool_, 64);
  objc_destroyWeak(&v71);

  objc_destroyWeak(&from);
  _Block_object_dispose(&v75, 8);

}

void __55__PKSqueezePaletteViewExpandedInkingToolLayout_setupUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__didTapStrokeWeightButton_, 64);
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
  v37[2] = __55__PKSqueezePaletteViewExpandedInkingToolLayout_setupUI__block_invoke_2;
  v37[3] = &unk_1E7778930;
  objc_copyWeak(&v38, &location);
  objc_copyWeak(&v39, (id *)(a1 + 64));
  objc_msgSend(v4, "_set_pk_longSqueezeAction:", v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

}

void __55__PKSqueezePaletteViewExpandedInkingToolLayout_setupUI__block_invoke_2(uint64_t a1)
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
    objc_msgSend(WeakRetained, "_didTapStrokeWeightButton:", v5);

  }
  objc_destroyWeak(&to);
}

- (void)updateUI
{
  PKSqueezePaletteViewExpandedInkingToolLayout *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *strokeWeightButtons;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  _QWORD *v23;
  _QWORD v24[5];

  v2 = self;
  if (self)
    self = (PKSqueezePaletteViewExpandedInkingToolLayout *)self->_strokeWeightButtons;
  -[PKSqueezePaletteViewExpandedInkingToolLayout enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &__block_literal_global_48);
  -[PKSqueezePaletteViewExpandedInkingToolLayout context](v2, "context");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 24);
  else
    v5 = 0;
  v23 = v5;

  -[PKSqueezePaletteViewExpandedInkingToolLayout _updateToolUIStyle]((uint64_t)v2);
  if (v23)
    v6 = (void *)v23[103];
  else
    v6 = 0;
  v7 = v6;
  v8 = objc_msgSend(v7, "_supportsStrokeWeight");

  if (v8)
  {
    if (v23)
      v9 = (void *)v23[103];
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "_strokeWeight");
    v12 = v11;

    if (v2)
      strokeWeightButtons = v2->_strokeWeightButtons;
    else
      strokeWeightButtons = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56__PKSqueezePaletteViewExpandedInkingToolLayout_updateUI__block_invoke_2;
    v24[3] = &__block_descriptor_40_e51_v32__0__PKSqueezePaletteStrokeWeightButton_8Q16_B24l;
    v24[4] = v12;
    -[NSArray enumerateObjectsUsingBlock:](strokeWeightButtons, "enumerateObjectsUsingBlock:", v24, v23);
  }
  if (v23)
    v14 = (void *)v23[103];
  else
    v14 = 0;
  v15 = v14;
  v16 = objc_msgSend(v15, "_supportsColor");

  if (v16)
  {
    -[PKSqueezePaletteViewExpandedInkingToolLayout opacitySlider](v2, "opacitySlider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      v18 = (void *)v23[103];
    else
      v18 = 0;
    v19 = v18;
    objc_msgSend(v19, "_color");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "color");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqual:", v20);

    if ((v22 & 1) == 0)
      objc_msgSend(v17, "setColor:", v20);

  }
}

uint64_t __56__PKSqueezePaletteViewExpandedInkingToolLayout_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:", 0);
}

- (void)_updateToolUIStyle
{
  _QWORD *WeakRetained;
  id v3;
  uint64_t v4;
  id *v5;
  id *v6;
  id v7;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
      v3 = (id)WeakRetained[74];
    else
      v3 = 0;
    v7 = WeakRetained;
    v4 = *(_QWORD *)(a1 + 24);
    if (v4)
    {
      v5 = (id *)*(id *)(v4 + 24);
      v6 = v5;
      if (v5)
      {
        if (v5[104] != v3)
        {
          v5[104] = v3;
          objc_msgSend(v5[94], "setColorUserInterfaceStyle:", v3);
        }
      }
    }
    else
    {
      v6 = 0;
    }

  }
}

void __56__PKSqueezePaletteViewExpandedInkingToolLayout_updateUI__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double *v6;
  double v7;
  double *v8;

  v6 = a2;
  if (v6)
    v7 = v6[94];
  else
    v7 = 0.0;
  if (v7 == *(double *)(a1 + 32))
  {
    v8 = v6;
    objc_msgSend(v6, "setSelected:", 1);
    v6 = v8;
    *a4 = 1;
  }

}

- (void)willTransitionToLayout:(id)a3
{
  void *v4;
  void *v5;
  NSArray *strokeWeightButtons;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3718];
  -[PKSqueezePaletteViewExpandedInkingToolLayout layoutConstraints](self, "layoutConstraints", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  if (self)
    strokeWeightButtons = self->_strokeWeightButtons;
  else
    strokeWeightButtons = 0;
  -[NSArray makeObjectsPerformSelector:](strokeWeightButtons, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[PKSqueezePaletteViewExpandedInkingToolLayout context](self, "context");
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
  PKSqueezePaletteViewExpandedInkingToolLayoutContext *context;
  id WeakRetained;
  PKSqueezePaletteViewExpandedInkingToolLayoutContext *v6;

  context = self->_context;
  if (context)
    context = (PKSqueezePaletteViewExpandedInkingToolLayoutContext *)context->_previousLayout;
  v6 = context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);

}

- (void)_didTapStrokeWeightButton:(id)a3
{
  double *v4;
  double *v5;
  double v6;
  NSObject *v7;
  double *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;
  int v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  if (v4)
    v6 = v4[94];
  else
    v6 = 0.0;
  v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134217984;
    v21 = v6;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Tap stroke weight button %f", (uint8_t *)&v20, 0xCu);
  }

  -[PKSqueezePaletteViewExpandedInkingToolLayout lastTappedStrokeWeightButton](self, "lastTappedStrokeWeightButton");
  v8 = (double *)objc_claimAutoreleasedReturnValue();

  -[PKSqueezePaletteViewExpandedInkingToolLayout context](self, "context");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (_QWORD *)v9;
  if (v8 == v5)
  {
    if (v9)
      v19 = *(void **)(v9 + 16);
    else
      v19 = 0;
    v15 = v19;
    WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v15);
    v12 = v10;
  }
  else
  {
    if (v9)
      v11 = *(void **)(v9 + 24);
    else
      v11 = 0;
    v12 = v11;

    if (v12)
      v13 = (void *)v12[103];
    else
      v13 = 0;
    v14 = v13;
    v15 = (id)objc_msgSend(v14, "_copyWithStrokeWeight:", v6);

    -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v12, v15);
    WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    if (v12)
      v17 = (void *)v12[103];
    else
      v17 = 0;
    v18 = v17;
    -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)WeakRetained, v18, 1);

  }
  -[PKSqueezePaletteViewExpandedInkingToolLayout setLastTappedStrokeWeightButton:](self, "setLastTappedStrokeWeightButton:", v5);

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

  -[PKSqueezePaletteViewExpandedInkingToolLayout context](self, "context");
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

- (void)_colorAlphaSliderUserDidChangeSlider:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id WeakRetained;
  id v21;

  v21 = a3;
  -[PKSqueezePaletteViewExpandedInkingToolLayout context](self, "context");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 24);
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = (void *)v7[103];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "_color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "alphaComponent");
    v12 = v11;
    objc_msgSend(v21, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alphaComponent");
    v15 = v14;

    if (vabdd_f64(v12, v15) >= 0.01)
    {
      objc_msgSend(v10, "colorWithAlphaComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v17 = (void *)v7[103];
      else
        v17 = 0;
      v18 = v17;
      v19 = (void *)objc_msgSend(v18, "_copyWithColor:", v16);

      -[PKSqueezePaletteDrawingTool setTool:]((uint64_t)v7, v19);
      WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
      -[PKSqueezePaletteView _didSelectTool:atIndex:]((uint64_t)WeakRetained, v19, 1);

    }
  }

}

- (PKSqueezePaletteView)paletteView
{
  return (PKSqueezePaletteView *)objc_loadWeakRetained((id *)&self->_paletteView);
}

- (void)setPaletteView:(id)a3
{
  objc_storeWeak((id *)&self->_paletteView, a3);
}

- (void)setStrokeWeightButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKSqueezePaletteViewExpandedInkingToolLayoutContext)context
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

- (PKSqueezePaletteStrokeWeightButton)lastTappedStrokeWeightButton
{
  return self->_lastTappedStrokeWeightButton;
}

- (void)setLastTappedStrokeWeightButton:(id)a3
{
  objc_storeStrong((id *)&self->_lastTappedStrokeWeightButton, a3);
}

- (PKAngularOpacitySlider)opacitySlider
{
  return self->_opacitySlider;
}

- (void)setOpacitySlider:(id)a3
{
  objc_storeStrong((id *)&self->_opacitySlider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacitySlider, 0);
  objc_storeStrong((id *)&self->_lastTappedStrokeWeightButton, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_strokeWeightButtons, 0);
  objc_destroyWeak((id *)&self->_paletteView);
}

@end
