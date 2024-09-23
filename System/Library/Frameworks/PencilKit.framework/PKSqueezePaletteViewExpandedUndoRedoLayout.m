@implementation PKSqueezePaletteViewExpandedUndoRedoLayout

- (id)initWithContext:(void *)a3 sliderButtonConfiguration:
{
  _QWORD *v6;
  id v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  objc_super v18;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)PKSqueezePaletteViewExpandedUndoRedoLayout;
    v8 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      objc_storeStrong(a1 + 11, a3);
      v9 = objc_alloc(MEMORY[0x1E0DC3A58]);
      v10 = (void *)MEMORY[0x1E0DC42A0];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E77EB7D8, &unk_1E77EB7F0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "privateConfigurationForTypes:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "initWithConfiguration:", v12);
      v14 = a1[18];
      a1[18] = (id)v13;

      if (v6)
        v15 = (void *)v6[2];
      else
        v15 = 0;
      v16 = v15;
      objc_msgSend(v16, "addTarget:action:", a1, sel__panGestureHandler_);

    }
  }

  return a1;
}

- (void)_resetUI
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  double v19;
  __int128 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  const char *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _OWORD v62[3];
  _QWORD newValue[4];
  id v64;
  id location;
  _QWORD v66[6];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "paletteView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      v3 = -[PKSqueezePaletteView _undoCount]((uint64_t)WeakRetained);

      v4 = objc_loadWeakRetained((id *)(a1 + 16));
      v5 = -[PKSqueezePaletteView _redoCount]((uint64_t)v4);

      *(_QWORD *)(a1 + 32) = v5 + v3;
      *(_QWORD *)(a1 + 40) = v5;
      *(_QWORD *)(a1 + 48) = v5;
      *(_QWORD *)(a1 + 56) = v5;
      objc_msgSend((id)a1, "ornamentLayer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v58)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0CD2840]);
        v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3658]), "initWithWhite:alpha:", 1.0, 1.0));
        v58 = v6;
        objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

        objc_msgSend(v60, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSublayer:", v6);

        objc_msgSend(v6, "setZPosition:", 3.0);
        objc_msgSend((id)a1, "setOrnamentLayer:", v6);
      }
      v9 = *(_QWORD *)(a1 + 24);
      if (!v9 || (v10 = *(id *)(v9 + 8)) == 0)
        PKCrash();
      v61 = v10;
      objc_msgSend(v10, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setZPosition:", 2.0);

      objc_msgSend(v61, "center");
      v13 = v12;
      v15 = v14;
      v16 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _viewCenter]((void *)a1);
      v18 = atan2(v15 - v17, v13 - v16);
      v19 = fmod(v18, 6.28318531);
      if (v18 <= 6.28318531 && v18 >= 0.0)
        v19 = v18;
      if (v19 < 0.0)
        v19 = v19 + 6.28318531;
      if (v19 == 0.0)
        v19 = 0.0;
      *(double *)(a1 + 64) = v19;
      *(double *)(a1 + 72) = v19;
      v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v62[0] = *MEMORY[0x1E0C9BAA8];
      v62[1] = v21;
      v62[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v61, "setTransform:", v62);
      objc_msgSend(v61, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      v24 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v23;

      objc_msgSend((id)a1, "sliderButtonConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setConfiguration:", v25);

      objc_msgSend((id)a1, "sliderButtonConstraintCenterX");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (v27)
      {
        objc_msgSend(v61, "centerXAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "centerXAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintEqualToAnchor:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "setSliderButtonConstraintCenterX:", v30);

        objc_msgSend(v61, "centerYAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "centerYAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "setSliderButtonConstraintCenterY:", v33);

        v34 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend((id)a1, "sliderButtonConstraintCenterX");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v35;
        objc_msgSend((id)a1, "sliderButtonConstraintCenterY");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "activateConstraints:", v37);

      }
      objc_msgSend(v61, "targetForAction:withSender:", sel__didTapSliderButton_, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38 == 0;

      if (v39)
        objc_msgSend(v61, "addTarget:action:forControlEvents:", a1, sel__didTapSliderButton_, 64);
      objc_msgSend((id)a1, "panGestureRecognizer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40 == 0;

      if (v41)
      {
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", a1, sel__panGestureHandler_);
        objc_msgSend(v61, "addGestureRecognizer:", v42);
        objc_msgSend((id)a1, "setPanGestureRecognizer:", v42);

      }
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC41D8]), "initWithDimensions:", 1);
      objc_msgSend(v43, "_setDelegate:", a1);
      objc_msgSend((id)a1, "setHyperInteractor:", v43);
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC41C0]), "initWithDimensions:", 1);
      objc_msgSend(v59, "_setMaximumDistance:", 0.13962634);
      objc_msgSend(v43, "_setExtender:", v59);
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC41F8]), "initWithDimensions:", 1);
      v45 = (void *)objc_opt_new();
      v46 = objc_msgSend((id)a1, "maxUndoIndex");
      v47 = MEMORY[0x1E0C809B0];
      if ((v46 & 0x8000000000000000) == 0)
      {
        v48 = -1;
        do
        {
          v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC41E8]), "initWithDimensions:", 1);
          v66[0] = v47;
          v66[1] = 3221225472;
          v66[2] = __69__PKSqueezePaletteViewExpandedUndoRedoLayout__installHyperInteractor__block_invoke;
          v66[3] = &unk_1E77774B8;
          v66[4] = a1;
          v66[5] = v48 + 1;
          objc_msgSend(v49, "_mutateValue:", v66);
          objc_msgSend(v45, "addObject:", v49);

          ++v48;
        }
        while (v48 < objc_msgSend((id)a1, "maxUndoIndex"));
      }
      objc_msgSend(v44, "_setRegions:", v45);
      objc_msgSend(v43, "_setRegion:", v44);
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC41C8]), "initWithDimensions:", 1);
      objc_msgSend(v43, "_setAnimator:", v50);
      objc_initWeak(&location, (id)a1);
      newValue[0] = v47;
      newValue[1] = 3221225472;
      newValue[2] = __69__PKSqueezePaletteViewExpandedUndoRedoLayout__installHyperInteractor__block_invoke_2;
      newValue[3] = &unk_1E7777588;
      objc_copyWeak(&v64, &location);
      v51 = objc_loadWeakRetained((id *)(a1 + 16));
      v53 = v51;
      if (v51)
        objc_setProperty_nonatomic_copy(v51, v52, newValue, 600);

      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);

      v54 = *(_QWORD *)(a1 + 24);
      if (v54)
      {
        v55 = *(id *)(v54 + 16);
        v56 = v55;
        if (v55 && (objc_msgSend(v55, "state") == 1 || objc_msgSend(v56, "state") == 2))
        {
          objc_msgSend((id)a1, "hyperInteractor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "_interactionBegan");

        }
      }
      else
      {
        v56 = 0;
      }
      objc_msgSend((id)a1, "updateUI");

    }
  }
}

- (double)_viewCenter
{
  void *v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double MidX;
  CGRect v12;
  CGRect v13;

  objc_msgSend(a1, "paletteView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v12.origin.x = v3;
  v12.origin.y = v5;
  v12.size.width = v7;
  v12.size.height = v9;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = v3;
  v13.origin.y = v5;
  v13.size.width = v7;
  v13.size.height = v9;
  CGRectGetMidY(v13);
  return round(MidX);
}

uint64_t __69__PKSqueezePaletteViewExpandedUndoRedoLayout__installHyperInteractor__block_invoke(uint64_t result, double *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  v3 = *(void **)(result + 32);
  if (v3)
  {
    v4 = *(_QWORD *)(result + 40);
    objc_msgSend(*(id *)(result + 32), "initialSliderButtonAngle");
    v6 = v5;
    result = objc_msgSend(v3, "initialUndoIndex");
    v7 = v6 + (double)(v4 - result) * -0.34906585;
  }
  else
  {
    v7 = 0.0;
  }
  *a2 = v7;
  return result;
}

void __69__PKSqueezePaletteViewExpandedUndoRedoLayout__installHyperInteractor__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "hyperInteractor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __61__PKSqueezePaletteViewExpandedUndoRedoLayout__layoutSubviews__block_invoke;
    v3[3] = &unk_1E77774E0;
    v3[4] = WeakRetained;
    objc_msgSend(v1, "_mutateUnconstrainedPoint:", v3);
    objc_msgSend(WeakRetained, "setSliderButtonAngle:", *(double *)objc_msgSend(v1, "_presentationPoint"));

  }
}

uint64_t __61__PKSqueezePaletteViewExpandedUndoRedoLayout__layoutSubviews__block_invoke(uint64_t a1, double *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  v3 = *(void **)(a1 + 32);
  result = objc_msgSend(v3, "modelUndoIndex");
  if (v3)
  {
    v5 = result;
    objc_msgSend(v3, "initialSliderButtonAngle");
    v7 = v6;
    result = objc_msgSend(v3, "initialUndoIndex");
    v8 = v7 + (double)(v5 - result) * -0.34906585;
  }
  else
  {
    v8 = 0.0;
  }
  *a2 = v8;
  return result;
}

- (void)setSliderButtonAngle:(double)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  id WeakRetained;
  int64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  id v20;

  self->_sliderButtonAngle = a3;
  -[PKSqueezePaletteViewExpandedUndoRedoLayout updateUI](self, "updateUI");
  v4 = -[PKSqueezePaletteViewExpandedUndoRedoLayout currentUndoIndex](self, "currentUndoIndex");
  -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonAngle](self, "sliderButtonAngle");
  v6 = v5;
  -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
  v8 = v7
     + (double)(v4 - -[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex") + 1)
     * -0.34906585;
  -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
  v10 = v9;
  v11 = -[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex");
  if (v6 <= v8 + 0.174532925)
  {
    v13 = -[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex");
    -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 >= v13)
      goto LABEL_11;
    v20 = v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView _didUndo]((uint64_t)WeakRetained);

    -[PKSqueezePaletteViewExpandedUndoRedoLayout setCurrentUndoIndex:](self, "setCurrentUndoIndex:", -[PKSqueezePaletteViewExpandedUndoRedoLayout currentUndoIndex](self, "currentUndoIndex") + 1);
    objc_msgSend(v20, "setNeedsLayout");
    v15 = -[PKSqueezePaletteViewExpandedUndoRedoLayout currentUndoIndex](self, "currentUndoIndex");
    if (v15 != -[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex"))
      goto LABEL_9;
    goto LABEL_6;
  }
  if (v6 >= v10 + (double)(v4 + ~v11) * -0.34906585 + -0.174532925)
  {
    -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 <= 0)
      goto LABEL_11;
    v20 = v12;
    v17 = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView _didRedo]((uint64_t)v17);

    -[PKSqueezePaletteViewExpandedUndoRedoLayout setCurrentUndoIndex:](self, "setCurrentUndoIndex:", -[PKSqueezePaletteViewExpandedUndoRedoLayout currentUndoIndex](self, "currentUndoIndex") - 1);
    objc_msgSend(v20, "setNeedsLayout");
    if (-[PKSqueezePaletteViewExpandedUndoRedoLayout currentUndoIndex](self, "currentUndoIndex"))
    {
LABEL_9:
      v16 = 1025;
      goto LABEL_10;
    }
LABEL_6:
    v16 = 1026;
LABEL_10:
    -[PKSqueezePaletteViewExpandedUndoRedoLayout feedbackGenerator](self, "feedbackGenerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKSqueezePaletteViewExpandedUndoRedoLayout senderIDForLastPanGesture](self, "senderIDForLastPanGesture");
    objc_msgSend(v18, "_privateNotificationOccurred:atLocation:senderID:", v16, v19, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    v12 = v20;
    goto LABEL_11;
  }
  -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

}

- (void)_didTapSliderButton:(id)a3
{
  PKSqueezePaletteViewExpandedUndoRedoLayoutContext *context;
  id v5;
  PKSqueezePaletteViewLayout *previousLayout;
  PKSqueezePaletteViewLayout *v7;
  void *v8;
  id v9;

  if (!self)
  {
    v9 = a3;
    goto LABEL_6;
  }
  context = self->_context;
  v5 = a3;
  if (!context)
  {
LABEL_6:
    previousLayout = 0;
    goto LABEL_4;
  }
  previousLayout = context->_previousLayout;
LABEL_4:
  v7 = previousLayout;
  -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v8, v7);

  objc_msgSend(a3, "removeTarget:action:forControlEvents:", self, sel__didTapSliderButton_, 64);
}

- (double)_outerRadius
{
  double *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "paletteView");
  v1 = (double *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = v1[63];
  else
    v2 = 0.0;
  v3 = *(double *)&PKSqueezePaletteViewContentHeight;

  return v2 + v3 * 0.5;
}

- (double)_innerRadius
{
  double *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "paletteView");
  v1 = (double *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = v1[63];
  else
    v2 = 0.0;
  v3 = *(double *)&PKSqueezePaletteViewContentHeight;

  return v2 + v3 * -0.5;
}

- (void)updateUI
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  id v26;
  const CGPath *v27;
  CGFloat v28;
  const CGPath *CopyByStrokingPath;
  id v30;
  const CGPath *v31;
  CGFloat v32;
  const CGPath *v33;
  const CGPath *CopyBySubtractingPath;
  uint64_t v35;
  double *v36;
  id *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  double v62;
  double v63;
  void *v64;
  id v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  PKSqueezePaletteViewExpandedUndoRedoLayoutContext *context;
  UIButton *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  int64_t v95;
  double v96;
  double v97;
  PKSqueezePaletteViewExpandedUndoRedoLayout *v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  double v102;
  CATransform3D v103;
  CATransform3D v104;
  CATransform3D v105;

  if (!-[PKSqueezePaletteViewExpandedUndoRedoLayout isUpdateUIRunning](self, "isUpdateUIRunning"))
  {
    if (self)
    {
      -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[PKSqueezePaletteView _undoCount]((uint64_t)v3);
      v5 = -[PKSqueezePaletteView _redoCount]((uint64_t)v3);
      if (-[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex") == v5 + v4)
      {
        v6 = -[PKSqueezePaletteViewExpandedUndoRedoLayout currentUndoIndex](self, "currentUndoIndex");

        if (v6 == v5)
        {
          -[PKSqueezePaletteViewExpandedUndoRedoLayout setIsUpdateUIRunning:](self, "setIsUpdateUIRunning:", 1);
          -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
          v8 = v7
             + (double)--[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex")
             * -0.34906585;
          v9 = -[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex");
          -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
          v11 = v10
              + (double)(v9 - -[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex"))
              * -0.34906585;
          -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonAngle](self, "sliderButtonAngle");
          v13 = v12;
          v14 = -[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex");
          if (v8 >= v13)
          {
            if (v11 <= v13)
            {
              v15 = 1;
              v13 = v8;
            }
            else
            {
              v15 = 0;
              v17 = v11 - v13;
              if (v14 != 17)
                v17 = 0.0;
              v11 = v13;
              v13 = v8 - v17;
            }
          }
          else
          {
            v15 = 0;
            v16 = v13 - v8;
            if (v14 != 17)
              v16 = -0.0;
            v11 = v11 + v16;
          }
          v18 = vabdd_f64(v11, v13);
          if (v18 >= 6.28318531)
            v19 = 0.0;
          else
            v19 = v11;
          if (v18 >= 6.28318531)
            v20 = 6.28318531;
          else
            v20 = v13;
          if (v18 >= 6.28318531
            || (v21 = -[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex"),
                v21 - -[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex") >= 11))
          {
            v15 = 0;
          }
          -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v22, 1, v15, v19, v20);

          -[PKSqueezePaletteViewExpandedUndoRedoLayout ornamentLayer](self, "ornamentLayer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
            v25 = v24 - -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self);
            objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, -[PKSqueezePaletteViewExpandedUndoRedoLayout _viewCenter](self));
            v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v27 = (const CGPath *)objc_msgSend(v26, "CGPath");
            objc_msgSend(v23, "miterLimit");
            CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v27, 0, v25, (CGLineCap)(v18 < 6.28318531), kCGLineJoinMiter, v28);
            v30 = objc_retainAutorelease(v26);
            v31 = (const CGPath *)objc_msgSend(v30, "CGPath");
            objc_msgSend(v23, "miterLimit");
            v33 = CGPathCreateCopyByStrokingPath(v31, 0, v25 + v24 * -0.025, (CGLineCap)(v18 < 6.28318531), kCGLineJoinMiter, v32);
            CopyBySubtractingPath = CGPathCreateCopyBySubtractingPath(CopyByStrokingPath, v33, 1);
            CGPathRelease(CopyByStrokingPath);
            CGPathRelease(v33);
            objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
            objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
            objc_msgSend(v23, "setPath:", CopyBySubtractingPath);
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
            CGPathRelease(CopyBySubtractingPath);

          }
          -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (double *)MEMORY[0x1E0C9D538];
          if (v35)
          {
            v37 = (id *)v35;
            -[PKSqueezePaletteViewExpandedUndoRedoLayout tickLayers](self, "tickLayers");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = -[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex");
            v40 = 17;
            if (v39 < 17)
              v40 = v39;
            v41 = v40 + 1;
            objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
            objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
            if (objc_msgSend(v38, "count") != v41)
            {
              -[PKSqueezePaletteViewExpandedUndoRedoLayout setIsTicksFadedOutAtHead:](self, "setIsTicksFadedOutAtHead:", 0);
              -[PKSqueezePaletteViewExpandedUndoRedoLayout setIsTicksFadedOutAtTail:](self, "setIsTicksFadedOutAtTail:", 0);
              if (!v38)
                v38 = (void *)objc_opt_new();
              -[PKSqueezePaletteViewExpandedUndoRedoLayout setTickLayers:](self, "setTickLayers:", v38);
              objc_msgSend(v38, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
              objc_msgSend(v38, "removeAllObjects");
              if (v41)
              {
                v42 = v41;
                v43 = v37;
                v101 = v42;
                v44 = v42;
                do
                {
                  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.83, 1.0);
                  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v45, "setFillColor:", objc_msgSend(v46, "CGColor"));

                  objc_msgSend(v45, "setAnchorPoint:", 0.5, 0.5);
                  objc_msgSend(v45, "setZPosition:", 1.0);
                  v47 = v43[70];
                  objc_msgSend(v47, "layer");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "addSublayer:", v45);

                  objc_msgSend(v38, "addObject:", v45);
                  --v44;
                }
                while (v44);
                v36 = (double *)MEMORY[0x1E0C9D538];
                v37 = v43;
                v41 = v101;
              }
            }
            v49 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _viewCenter](self);
            v102 = v50;
            v51 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
            v52 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
            v53 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self);
            if (v41)
            {
              v100 = v51 + (v52 - v53) * -0.5;
              v54 = DKDRoundedRectForScale(0.0, 0.0, v51 * 0.1156, v51 * 0.1156 * 0.18, 1.0);
              v56 = v55;
              v58 = v57;
              v60 = v59;
              v61 = 0;
              v63 = *v36;
              v62 = v36[1];
              do
              {
                objc_msgSend(v38, "objectAtIndex:", v61);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v54, v56, v58, v60, 2.0);
                v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                objc_msgSend(v64, "setPath:", objc_msgSend(v65, "CGPath"));

                objc_msgSend(v64, "setPosition:", v49, v102);
                objc_msgSend(v64, "setBounds:", v54, v56, v58, v60);
                -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
                v66 = v49;
                v68 = v67
                    + (double)(v61
                             - -[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex"))
                    * -0.34906585;
                v69 = PKPointOnArc(v63, v62, v100, v68);
                memset(&v105, 0, sizeof(v105));
                CATransform3DMakeTranslation(&v105, v69, v70, 0.0);
                v103 = v105;
                v71 = v68;
                v49 = v66;
                CATransform3DRotate(&v104, &v103, v71, 0.0, 0.0, 1.0);
                v105 = v104;
                objc_msgSend(v64, "setTransform:", &v104);

                ++v61;
              }
              while (v41 != v61);
            }
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v53);

          }
          context = self->_context;
          if (context)
          {
            v73 = context->_sliderButton;
            if (v73)
            {
              v74 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
              v75 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self);
              v76 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
              v77 = (v74 - v75) * 0.5
                  - (v76 - -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self)) * 0.88 * 0.5;
              v78 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
              v79 = (v78 - -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self)) * 0.88 * 0.5;
              v80 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self) + v77 + v79;
              -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonAngle](self, "sliderButtonAngle");
              v82 = PKPointOnArc(*v36, v36[1], v80, v81);
              v84 = v83;
              -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonConstraintCenterX](self, "sliderButtonConstraintCenterX");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "setConstant:", v82);

              -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonConstraintCenterY](self, "sliderButtonConstraintCenterY");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "setConstant:", v84);

            }
          }
          else
          {
            v73 = 0;
          }

          v87 = -[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex");
          if (v87 < 18)
            goto LABEL_58;
          v88 = v87;
          -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonAngle](self, "sliderButtonAngle");
          v90 = v89;
          -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
          v92 = v91
              + (double)--[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex")
              * -0.34906585;
          -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
          v94 = v93;
          v95 = -[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex");
          v96 = v92 + -3.14159265;
          if (v90 > v92
            || v90 <= v96
            || -[PKSqueezePaletteViewExpandedUndoRedoLayout isTicksFadedOutAtHead](self, "isTicksFadedOutAtHead"))
          {
            v97 = v94 + (double)(v88 - v95) * -0.34906585 + 3.14159265;
            if (v90 > v96
              || v90 <= v97
              || !-[PKSqueezePaletteViewExpandedUndoRedoLayout isTicksFadedOutAtHead](self, "isTicksFadedOutAtHead")
              && !-[PKSqueezePaletteViewExpandedUndoRedoLayout isTicksFadedOutAtTail](self, "isTicksFadedOutAtTail"))
            {
              if (v90 <= v97
                && !-[PKSqueezePaletteViewExpandedUndoRedoLayout isTicksFadedOutAtTail](self, "isTicksFadedOutAtTail"))
              {
                -[PKSqueezePaletteViewExpandedUndoRedoLayout _fadeOutTickAtTail:](self, 1);
                -[PKSqueezePaletteViewExpandedUndoRedoLayout _fadeOutTickAtHead:](self, 0);
              }
              goto LABEL_58;
            }
            v98 = self;
            v99 = 0;
          }
          else
          {
            v98 = self;
            v99 = 1;
          }
          -[PKSqueezePaletteViewExpandedUndoRedoLayout _fadeOutTickAtHead:](v98, v99);
          -[PKSqueezePaletteViewExpandedUndoRedoLayout _fadeOutTickAtTail:](self, 0);
LABEL_58:
          -[PKSqueezePaletteViewExpandedUndoRedoLayout setIsUpdateUIRunning:](self, "setIsUpdateUIRunning:", 0);
          return;
        }
      }
      else
      {

      }
      -[PKSqueezePaletteViewExpandedUndoRedoLayout _resetUI]((uint64_t)self);
      return;
    }
    objc_msgSend(0, "setIsUpdateUIRunning:", 1);
    goto LABEL_58;
  }
}

- (void)willTransitionToLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKSqueezePaletteViewExpandedUndoRedoLayoutContext *context;
  PKSqueezePaletteViewExpandedUndoRedoLayoutContext *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[PKSqueezePaletteViewExpandedUndoRedoLayout ornamentLayer](self, "ornamentLayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[PKSqueezePaletteViewExpandedUndoRedoLayout setOrnamentLayer:](self, "setOrnamentLayer:", 0);
  -[PKSqueezePaletteViewExpandedUndoRedoLayout tickLayers](self, "tickLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_0);

  -[PKSqueezePaletteViewExpandedUndoRedoLayout setTickLayers:](self, "setTickLayers:", 0);
  v6 = (void *)MEMORY[0x1E0CB3718];
  -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonConstraintCenterX](self, "sliderButtonConstraintCenterX");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonConstraintCenterY](self, "sliderButtonConstraintCenterY");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:", v9);

  -[PKSqueezePaletteViewExpandedUndoRedoLayout setSliderButtonConstraintCenterX:](self, "setSliderButtonConstraintCenterX:", 0);
  -[PKSqueezePaletteViewExpandedUndoRedoLayout setSliderButtonConstraintCenterY:](self, "setSliderButtonConstraintCenterY:", 0);
  -[PKSqueezePaletteViewExpandedUndoRedoLayout originalSliderButtonConfiguration](self, "originalSliderButtonConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    context = self->_context;
    if (context)
      context = (PKSqueezePaletteViewExpandedUndoRedoLayoutContext *)context->_sliderButton;
  }
  else
  {
    context = 0;
  }
  v12 = context;
  -[PKSqueezePaletteViewExpandedUndoRedoLayoutContext setConfiguration:](v12, "setConfiguration:", v10);

  -[PKSqueezePaletteViewExpandedUndoRedoLayout setHyperInteractor:](self, "setHyperInteractor:", 0);
}

uint64_t __69__PKSqueezePaletteViewExpandedUndoRedoLayout_willTransitionToLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  PKSqueezePaletteViewExpandedUndoRedoLayoutContext *context;
  id WeakRetained;
  PKSqueezePaletteViewExpandedUndoRedoLayoutContext *v6;

  context = self->_context;
  if (context)
    context = (PKSqueezePaletteViewExpandedUndoRedoLayoutContext *)context->_previousLayout;
  v6 = context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);

}

- (void)_panGestureHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int64_t v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double *v31;
  double v32;
  double v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  _QWORD v39[5];

  v38 = a3;
  -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v38, "state");
    -[PKSqueezePaletteViewExpandedUndoRedoLayout hyperInteractor](self, "hyperInteractor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v5 - 3) < 2)
    {
      v31 = (double *)objc_msgSend(v6, "_projectedPoint");
      if (self)
      {
        v32 = *v31;
        -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
        v34 = (uint64_t)((v33
                       + (double)--[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex")* -0.34906585- v32+ 0.174532925)/ 0.34906585);
        v35 = -[PKSqueezePaletteViewExpandedUndoRedoLayout maxUndoIndex](self, "maxUndoIndex");
        if (v35 >= v34)
          v36 = v34;
        else
          v36 = v35;
        v37 = v36 & ~(v36 >> 63);
      }
      else
      {
        v37 = 0;
      }
      -[PKSqueezePaletteViewExpandedUndoRedoLayout setModelUndoIndex:](self, "setModelUndoIndex:", v37);
      objc_msgSend(v7, "_interactionEnded");
    }
    else
    {
      if (v5 == 2)
      {
LABEL_6:
        objc_msgSend(v38, "locationInView:", v4);
        if (self)
        {
          v10 = v8;
          v11 = v9;
          v12 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _viewCenter](self);
          v14 = atan2(v11 - v13, v10 - v12);
          v15 = fmod(v14, 6.28318531);
          if (v14 <= 6.28318531 && v14 >= 0.0)
            v15 = v14;
          if (v15 < 0.0)
            v15 = v15 + 6.28318531;
          if (v15 == 0.0)
            v17 = 0.0;
          else
            v17 = v15;
          -[PKSqueezePaletteViewExpandedUndoRedoLayout sliderButtonAngle](self, "sliderButtonAngle");
          v19 = (uint64_t)(v18 / 6.28318531);
          v20 = v17 + (double)(v19 + 1) * 6.28318531;
          v21 = v17 + (double)v19 * 6.28318531;
          v22 = vabdd_f64(v20, v18);
          v23 = vabdd_f64(v21, v18);
          v24 = vabdd_f64(v17 + (double)(v19 - 1) * 6.28318531, v18);
          if (v22 >= v24)
            v20 = v17 + (double)(v19 - 1) * 6.28318531;
          if (v23 >= v24)
            v21 = v17 + (double)(v19 - 1) * 6.28318531;
          if (v22 < v23)
            v21 = v20;
          if (vabdd_f64(v21, v18) <= 3.14159265)
            v25 = v21;
          else
            v25 = v18;
          v26 = -[PKSqueezePaletteViewExpandedUndoRedoLayout modelUndoIndex](self, "modelUndoIndex");
          -[PKSqueezePaletteViewExpandedUndoRedoLayout initialSliderButtonAngle](self, "initialSliderButtonAngle");
          v28 = v25
              - (v27
               + (double)(v26 - -[PKSqueezePaletteViewExpandedUndoRedoLayout initialUndoIndex](self, "initialUndoIndex"))
               * -0.34906585);
        }
        else
        {
          objc_msgSend(0, "modelUndoIndex");
          v28 = 0.0;
        }
        objc_msgSend(v38, "_activeEvents");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "anyObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKSqueezePaletteViewExpandedUndoRedoLayout setSenderIDForLastPanGesture:](self, "setSenderIDForLastPanGesture:", 0);
        if (objc_msgSend(v30, "_hidEvent"))
        {
          objc_msgSend(v30, "_hidEvent");
          -[PKSqueezePaletteViewExpandedUndoRedoLayout setSenderIDForLastPanGesture:](self, "setSenderIDForLastPanGesture:", IOHIDEventGetSenderID());
        }
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __65__PKSqueezePaletteViewExpandedUndoRedoLayout__panGestureHandler___block_invoke;
        v39[3] = &__block_descriptor_40_e9_v16__0_d8l;
        *(double *)&v39[4] = v28;
        objc_msgSend(v7, "_interactionChangedMutatingTranslation:velocity:", v39, &__block_literal_global_26);

        goto LABEL_36;
      }
      if (v5 == 1)
      {
        objc_msgSend(v6, "_interactionBegan");
        goto LABEL_6;
      }
    }
LABEL_36:

  }
}

double __65__PKSqueezePaletteViewExpandedUndoRedoLayout__panGestureHandler___block_invoke(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

void __65__PKSqueezePaletteViewExpandedUndoRedoLayout__panGestureHandler___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  *a2 = 0;
}

- (void)_fadeOutTickAtHead:(void *)a1
{
  unint64_t v4;
  uint64_t i;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (objc_msgSend(a1, "isTicksFadedOutAtHead") != (_DWORD)a2)
  {
    objc_msgSend(a1, "setIsTicksFadedOutAtHead:", a2);
    v4 = 1;
    for (i = 17; i != 13; --i)
    {
      if ((_DWORD)a2)
        v6 = (double)v4 * 0.1;
      else
        v6 = 1.0;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.83, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tickLayers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_retainAutorelease(v7);
      objc_msgSend(v9, "setFillColor:", objc_msgSend(v10, "CGColor"));

      ++v4;
    }
  }
}

- (void)_fadeOutTickAtTail:(void *)a1
{
  uint64_t v4;
  unint64_t v5;
  unint64_t i;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (objc_msgSend(a1, "isTicksFadedOutAtTail") != (_DWORD)a2)
  {
    objc_msgSend(a1, "setIsTicksFadedOutAtTail:", a2);
    v4 = objc_msgSend(a1, "maxUndoIndex");
    v5 = v4 + 1;
    for (i = 1; i != 5; ++i)
    {
      if ((_DWORD)a2)
        v7 = (double)i * 0.1;
      else
        v7 = 1.0;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.83, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tickLayers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", i + v4 - 18 * (v5 / 0x12));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_retainAutorelease(v8);
      objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

      ++v5;
    }
  }
}

- (void)_hyperInteractorApplyPresentationPoint:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PKSqueezePaletteViewExpandedUndoRedoLayout hyperInteractor](self, "hyperInteractor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

    -[PKSqueezePaletteViewExpandedUndoRedoLayout paletteView](self, "paletteView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

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

- (int64_t)maxUndoIndex
{
  return self->_maxUndoIndex;
}

- (void)setMaxUndoIndex:(int64_t)a3
{
  self->_maxUndoIndex = a3;
}

- (int64_t)currentUndoIndex
{
  return self->_currentUndoIndex;
}

- (void)setCurrentUndoIndex:(int64_t)a3
{
  self->_currentUndoIndex = a3;
}

- (int64_t)modelUndoIndex
{
  return self->_modelUndoIndex;
}

- (void)setModelUndoIndex:(int64_t)a3
{
  self->_modelUndoIndex = a3;
}

- (int64_t)initialUndoIndex
{
  return self->_initialUndoIndex;
}

- (void)setInitialUndoIndex:(int64_t)a3
{
  self->_initialUndoIndex = a3;
}

- (double)sliderButtonAngle
{
  return self->_sliderButtonAngle;
}

- (double)initialSliderButtonAngle
{
  return self->_initialSliderButtonAngle;
}

- (void)setInitialSliderButtonAngle:(double)a3
{
  self->_initialSliderButtonAngle = a3;
}

- (UIButtonConfiguration)originalSliderButtonConfiguration
{
  return self->_originalSliderButtonConfiguration;
}

- (void)setOriginalSliderButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_originalSliderButtonConfiguration, a3);
}

- (UIButtonConfiguration)sliderButtonConfiguration
{
  return self->_sliderButtonConfiguration;
}

- (void)setSliderButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sliderButtonConfiguration, a3);
}

- (CAShapeLayer)ornamentLayer
{
  return self->_ornamentLayer;
}

- (void)setOrnamentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_ornamentLayer, a3);
}

- (NSMutableArray)tickLayers
{
  return self->_tickLayers;
}

- (void)setTickLayers:(id)a3
{
  objc_storeStrong((id *)&self->_tickLayers, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (BOOL)isTicksFadedOutAtHead
{
  return self->_isTicksFadedOutAtHead;
}

- (void)setIsTicksFadedOutAtHead:(BOOL)a3
{
  self->_isTicksFadedOutAtHead = a3;
}

- (BOOL)isTicksFadedOutAtTail
{
  return self->_isTicksFadedOutAtTail;
}

- (void)setIsTicksFadedOutAtTail:(BOOL)a3
{
  self->_isTicksFadedOutAtTail = a3;
}

- (BOOL)isUpdateUIRunning
{
  return self->_isUpdateUIRunning;
}

- (void)setIsUpdateUIRunning:(BOOL)a3
{
  self->_isUpdateUIRunning = a3;
}

- (NSLayoutConstraint)sliderButtonConstraintCenterX
{
  return self->_sliderButtonConstraintCenterX;
}

- (void)setSliderButtonConstraintCenterX:(id)a3
{
  objc_storeStrong((id *)&self->_sliderButtonConstraintCenterX, a3);
}

- (NSLayoutConstraint)sliderButtonConstraintCenterY
{
  return self->_sliderButtonConstraintCenterY;
}

- (void)setSliderButtonConstraintCenterY:(id)a3
{
  objc_storeStrong((id *)&self->_sliderButtonConstraintCenterY, a3);
}

- (_UIHyperInteractor)hyperInteractor
{
  return self->_hyperInteractor;
}

- (void)setHyperInteractor:(id)a3
{
  objc_storeStrong((id *)&self->_hyperInteractor, a3);
}

- (UINotificationFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (unint64_t)senderIDForLastPanGesture
{
  return self->_senderIDForLastPanGesture;
}

- (void)setSenderIDForLastPanGesture:(unint64_t)a3
{
  self->_senderIDForLastPanGesture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_hyperInteractor, 0);
  objc_storeStrong((id *)&self->_sliderButtonConstraintCenterY, 0);
  objc_storeStrong((id *)&self->_sliderButtonConstraintCenterX, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tickLayers, 0);
  objc_storeStrong((id *)&self->_ornamentLayer, 0);
  objc_storeStrong((id *)&self->_sliderButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_originalSliderButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_paletteView);
}

@end
