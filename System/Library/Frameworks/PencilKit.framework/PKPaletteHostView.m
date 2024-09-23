@implementation PKPaletteHostView

+ (BOOL)_allowsHitTestAsOpaqueForRemoteEffects
{
  return 1;
}

- (PKPaletteHostView)initWithPaletteView:(id)a3
{
  id v5;
  PKPaletteHostView *v6;
  PKPaletteHostView *v7;
  id *p_paletteView;
  void *v9;
  void *v10;
  uint64_t v11;
  UIPointerInteraction *pointerInteraction;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *paletteTopConstraint;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *paletteBottomConstraint;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *paletteLeftConstraint;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *paletteRightConstraint;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSLayoutConstraint *paletteCenterXConstraint;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSLayoutConstraint *paletteCenterYConstraint;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSLayoutConstraint *paletteWidthConstraint;
  void *v74;
  void *v75;
  uint64_t v76;
  NSLayoutConstraint *paletteHeightConstraint;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  UIPanGestureRecognizer *panGestureRecognizer;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  UITapGestureRecognizer *tapToExpandPaletteFromMinimizedGestureRecognizer;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  UILongPressGestureRecognizer *touchDownFeedbackGestureRecognizer;
  void *v96;
  PKPaletteTooltipPresentationHandle *v97;
  PKPaletteTooltipPresentationHandle *tooltipPresentationHandle;
  objc_super v100;
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[5];

  v103[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v100.receiver = self;
  v100.super_class = (Class)PKPaletteHostView;
  v6 = -[PKPaletteHostView init](&v100, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_paletteVisible = 0;
    v6->_paletteViewBottomEdgeSpacing = 20.0;
    p_paletteView = (id *)&v6->_paletteView;
    objc_storeStrong((id *)&v6->_paletteView, a3);
    objc_msgSend(*p_paletteView, "setPaletteViewHosting:", v7);
    objc_msgSend(*p_paletteView, "setInternalDelegate:", v7);
    -[PKPaletteHostView paletteView](v7, "paletteView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView addSubview:](v7, "addSubview:", v10);

    -[PKPaletteHostView setDelegate:](v7, "setDelegate:", *p_paletteView);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v7);
    pointerInteraction = v7->_pointerInteraction;
    v7->_pointerInteraction = (UIPointerInteraction *)v11;

    -[PKPaletteHostView addInteraction:](v7, "addInteraction:", v7->_pointerInteraction);
    -[PKPaletteHostView paletteView](v7, "paletteView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView topAnchor](v7, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 30.0);
    v16 = objc_claimAutoreleasedReturnValue();
    paletteTopConstraint = v7->_paletteTopConstraint;
    v7->_paletteTopConstraint = (NSLayoutConstraint *)v16;

    -[PKPaletteHostView paletteTopConstraint](v7, "paletteTopConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1132068864;
    objc_msgSend(v18, "setPriority:", v19);

    -[PKPaletteHostView bottomAnchor](v7, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView paletteView](v7, "paletteView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 20.0);
    v23 = objc_claimAutoreleasedReturnValue();
    paletteBottomConstraint = v7->_paletteBottomConstraint;
    v7->_paletteBottomConstraint = (NSLayoutConstraint *)v23;

    -[PKPaletteHostView paletteBottomConstraint](v7, "paletteBottomConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1132068864;
    objc_msgSend(v25, "setPriority:", v26);

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView leftAnchor](v7, "leftAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 20.0);
    v30 = objc_claimAutoreleasedReturnValue();
    paletteLeftConstraint = v7->_paletteLeftConstraint;
    v7->_paletteLeftConstraint = (NSLayoutConstraint *)v30;

    -[PKPaletteHostView paletteLeftConstraint](v7, "paletteLeftConstraint");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 1132068864;
    objc_msgSend(v32, "setPriority:", v33);

    -[PKPaletteHostView rightAnchor](v7, "rightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView paletteView](v7, "paletteView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "rightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 20.0);
    v37 = objc_claimAutoreleasedReturnValue();
    paletteRightConstraint = v7->_paletteRightConstraint;
    v7->_paletteRightConstraint = (NSLayoutConstraint *)v37;

    -[PKPaletteHostView paletteRightConstraint](v7, "paletteRightConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 1132068864;
    objc_msgSend(v39, "setPriority:", v40);

    v41 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteHostView paletteTopConstraint](v7, "paletteTopConstraint");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v42;
    -[PKPaletteHostView paletteBottomConstraint](v7, "paletteBottomConstraint");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v43;
    -[PKPaletteHostView paletteLeftConstraint](v7, "paletteLeftConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v44;
    -[PKPaletteHostView paletteRightConstraint](v7, "paletteRightConstraint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v103[3] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v46);

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView centerXAnchor](v7, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = objc_claimAutoreleasedReturnValue();
    paletteCenterXConstraint = v7->_paletteCenterXConstraint;
    v7->_paletteCenterXConstraint = (NSLayoutConstraint *)v50;

    -[PKPaletteHostView paletteCenterXConstraint](v7, "paletteCenterXConstraint");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = 1132068864;
    objc_msgSend(v52, "setPriority:", v53);

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "centerYAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView centerYAnchor](v7, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v56);
    v57 = objc_claimAutoreleasedReturnValue();
    paletteCenterYConstraint = v7->_paletteCenterYConstraint;
    v7->_paletteCenterYConstraint = (NSLayoutConstraint *)v57;

    -[PKPaletteHostView paletteCenterYConstraint](v7, "paletteCenterYConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 1132068864;
    objc_msgSend(v59, "setPriority:", v60);

    v61 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteHostView paletteCenterXConstraint](v7, "paletteCenterXConstraint");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v62;
    -[PKPaletteHostView paletteCenterYConstraint](v7, "paletteCenterYConstraint");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "activateConstraints:", v64);

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "paletteSizeForEdge:", 4);
    v67 = v66;
    v69 = v68;

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "widthAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToConstant:", v67);
    v72 = objc_claimAutoreleasedReturnValue();
    paletteWidthConstraint = v7->_paletteWidthConstraint;
    v7->_paletteWidthConstraint = (NSLayoutConstraint *)v72;

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "heightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToConstant:", v69);
    v76 = objc_claimAutoreleasedReturnValue();
    paletteHeightConstraint = v7->_paletteHeightConstraint;
    v7->_paletteHeightConstraint = (NSLayoutConstraint *)v76;

    v78 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteHostView paletteWidthConstraint](v7, "paletteWidthConstraint");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v101[0] = v79;
    -[PKPaletteHostView paletteHeightConstraint](v7, "paletteHeightConstraint");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v80;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "activateConstraints:", v81);

    v82 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v7, sel__panGestureHandler_);
    panGestureRecognizer = v7->_panGestureRecognizer;
    v7->_panGestureRecognizer = (UIPanGestureRecognizer *)v82;

    -[PKPaletteHostView panGestureRecognizer](v7, "panGestureRecognizer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setDelegate:", v7);

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView panGestureRecognizer](v7, "panGestureRecognizer");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addGestureRecognizer:", v86);

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "contentScrollView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setDelegate:", v7);

    v89 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v7, sel__tapToExpandPaletteFromMinimizedGestureHandler_);
    tapToExpandPaletteFromMinimizedGestureRecognizer = v7->_tapToExpandPaletteFromMinimizedGestureRecognizer;
    v7->_tapToExpandPaletteFromMinimizedGestureRecognizer = (UITapGestureRecognizer *)v89;

    -[PKPaletteHostView tapToExpandPaletteFromMinimizedGestureRecognizer](v7, "tapToExpandPaletteFromMinimizedGestureRecognizer");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setDelegate:", v7);

    -[PKPaletteHostView paletteView](v7, "paletteView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView tapToExpandPaletteFromMinimizedGestureRecognizer](v7, "tapToExpandPaletteFromMinimizedGestureRecognizer");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addGestureRecognizer:", v93);

    v94 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v7, sel__touchDownFeedbackGestureHandler_);
    touchDownFeedbackGestureRecognizer = v7->_touchDownFeedbackGestureRecognizer;
    v7->_touchDownFeedbackGestureRecognizer = (UILongPressGestureRecognizer *)v94;

    -[UILongPressGestureRecognizer setDelegate:](v7->_touchDownFeedbackGestureRecognizer, "setDelegate:", v7);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v7->_touchDownFeedbackGestureRecognizer, "setMinimumPressDuration:", 0.0);
    -[PKPaletteHostView paletteView](v7, "paletteView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "addGestureRecognizer:", v7->_touchDownFeedbackGestureRecognizer);

    v7->_panGestureDidStartInPaletteScrollView = 0;
    v7->_panGestureShouldDragPaletteView = 1;
    v7->_paletteScrollGestureShouldScroll = 1;
    v97 = -[PKPaletteTooltipPresentationHandle initWithHostingView:]([PKPaletteTooltipPresentationHandle alloc], "initWithHostingView:", v7);
    tooltipPresentationHandle = v7->_tooltipPresentationHandle;
    v7->_tooltipPresentationHandle = v97;

    -[PKPaletteHostView setClipsToBounds:](v7, "setClipsToBounds:", 1);
  }

  return v7;
}

- (void)setPaletteViewBottomEdgeSpacing:(double)a3
{
  if (self->_paletteViewBottomEdgeSpacing != a3)
  {
    self->_paletteViewBottomEdgeSpacing = a3;
    -[PKPaletteHostView _updateConstraintsToDockPaletteToPosition:](self, "_updateConstraintsToDockPaletteToPosition:", -[PKPaletteHostView palettePosition](self, "palettePosition"));
  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int64_t v7;
  uint64_t v8;
  id v9;

  -[PKPaletteHostView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    -[PKPaletteHostView _updatePaletteViewSizeConstraints](self, "_updatePaletteViewSizeConstraints");
    if (-[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact"))
    {
      -[PKPaletteHostView _fixToBottomEdge](self, "_fixToBottomEdge");
    }
    else
    {
      -[PKPaletteHostView paletteView](self, "paletteView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isAutoHideEnabled"))
      {

      }
      else
      {
        -[PKPaletteHostView paletteView](self, "paletteView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "shouldStartUpMinimized");

        if (!v6)
        {
          v7 = -[PKPaletteView palettePosition](self->_paletteView, "palettePosition");
          if (v7)
            v8 = v7;
          else
            v8 = 3;
          -[PKPaletteHostView _dockPaletteToPosition:animated:](self, "_dockPaletteToPosition:animated:", v8, 0);
          goto LABEL_12;
        }
      }
      -[PKPaletteHostView _dockPaletteToAutoHideCornerAnimated:](self, "_dockPaletteToAutoHideCornerAnimated:", 0);
    }
LABEL_12:
    v3 = v9;
  }

}

- (void)_installPencilInteractionFeedbackHostViewIfNeeded
{
  PKPalettePencilInteractionFeedbackHostView *v3;
  PKPalettePencilInteractionFeedbackHostView *pencilInteractionFeedbackHostView;

  if (!self->_pencilInteractionFeedbackHostView)
  {
    v3 = -[PKPalettePencilInteractionFeedbackHostView initWithDelegate:]([PKPalettePencilInteractionFeedbackHostView alloc], "initWithDelegate:", self);
    pencilInteractionFeedbackHostView = self->_pencilInteractionFeedbackHostView;
    self->_pencilInteractionFeedbackHostView = v3;

    -[PKPaletteHostView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_pencilInteractionFeedbackHostView, 0);
    -[PKPaletteHostView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)_cancelPanGestureIfNecessary
{
  if (-[UIPanGestureRecognizer state](self->_panGestureRecognizer, "state"))
    -[UIPanGestureRecognizer setState:](self->_panGestureRecognizer, "setState:", 4);
}

- (void)setPaletteVisible:(BOOL)a3
{
  -[PKPaletteHostView setPaletteVisible:animated:completion:](self, "setPaletteVisible:animated:completion:", a3, 0, 0);
}

- (void)setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  BOOL v17;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (self->_paletteVisible != v6)
  {
    self->_paletteVisible = v6;
    -[PKPaletteHostView _cancelPanGestureIfNecessary](self, "_cancelPanGestureIfNecessary");
    -[PKPaletteHostView layoutIfNeeded](self, "layoutIfNeeded");
    v9 = -[PKPaletteHostView isPaletteVisible](self, "isPaletteVisible");
    -[PKPaletteHostView paletteView](self, "paletteView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "setNeedsLayout");

      -[PKPaletteHostView paletteView](self, "paletteView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutIfNeeded");

      -[PKPaletteHostView pencilInteractionFeedbackHostView](self, "pencilInteractionFeedbackHostView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hideFeedbackView");
    }
    else
    {
      objc_msgSend(v10, "dismissPalettePopoverWithCompletion:", 0);
    }

    -[PKPaletteHostView paletteView](self, "paletteView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "willStartAppearanceAnimation:", v6);

    -[PKPaletteHostView updateKeyboardAvoidanceForPalette:](self, "updateKeyboardAvoidanceForPalette:", v6);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__PKPaletteHostView_setPaletteVisible_animated_completion___block_invoke;
    v16[3] = &unk_1E777A028;
    v16[4] = self;
    v17 = v6;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__PKPaletteHostView_setPaletteVisible_animated_completion___block_invoke_2;
    v14[3] = &unk_1E7778740;
    v14[4] = self;
    v15 = v8;
    -[PKPaletteHostView _performAnimated:tracking:animations:completion:](self, "_performAnimated:tracking:animations:completion:", v5, 0, v16, v14);

  }
}

uint64_t __59__PKPaletteHostView_setPaletteVisible_animated_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEffectivePaletteVisible:", *(unsigned __int8 *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldBeCompact"))
    objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToFixToBottomEdge");
  else
    objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToDockPaletteToPosition:", objc_msgSend(*(id *)(a1 + 32), "palettePosition"));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __59__PKPaletteHostView_setPaletteVisible_animated_completion___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "paletteView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didEndAppearanceAnimation");

    result = *(_QWORD *)(v2 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateKeyboardAvoidanceForPalette:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  v4 = 0.0;
  if (a3 && -[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact"))
  {
    -[PKPaletteHostView _paletteViewCompactHeight](self, "_paletteViewCompactHeight");
    v4 = v5;
  }
  -[PKPaletteHostView keyboardSceneDelegate](self, "keyboardSceneDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "refreshWithLocalMinimumKeyboardHeight:", v4);

}

- (void)_setPaletteVisualState:(int64_t)a3
{
  -[PKPaletteHostView _setPaletteVisualState:usingTransition:](self, "_setPaletteVisualState:usingTransition:", a3, 0);
}

- (void)_setPaletteVisualState:(int64_t)a3 usingTransition:(BOOL)a4
{
  int64_t paletteVisualState;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  PKPaletteTransition *v11;
  void *v12;
  id v13;

  paletteVisualState = self->_paletteVisualState;
  if (paletteVisualState != a3)
  {
    self->_paletteVisualState = a3;
    if (a4)
    {
      -[PKPaletteHostView paletteTransition](self, "paletteTransition");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6
        || (v7 = (void *)v6,
            -[PKPaletteHostView paletteTransition](self, "paletteTransition"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "isTransitionInProgress"),
            v8,
            v7,
            (v9 & 1) == 0))
      {
        -[PKPaletteHostView paletteTransition](self, "paletteTransition");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDelegate:", 0);

        v11 = -[PKPaletteTransition initWithInitialVisualState:]([PKPaletteTransition alloc], "initWithInitialVisualState:", paletteVisualState);
        -[PKPaletteHostView setPaletteTransition:](self, "setPaletteTransition:", v11);

        -[PKPaletteHostView paletteTransition](self, "paletteTransition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDelegate:", self);

      }
      -[PKPaletteHostView paletteTransition](self, "paletteTransition");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transitionToVisualState:", -[PKPaletteHostView paletteVisualState](self, "paletteVisualState"));

    }
    else
    {
      -[PKPaletteHostView _updatePaletteSizeAnimated:](self, "_updatePaletteSizeAnimated:", 0);
      -[PKPaletteHostView _updateToolPreviewRotationAnimated:](self, "_updateToolPreviewRotationAnimated:", 0);
      -[PKPaletteHostView _updateToolPreviewMinimizedStateAnimated:](self, "_updateToolPreviewMinimizedStateAnimated:", 0);
      -[PKPaletteHostView _updatePaletteContentAlpha](self, "_updatePaletteContentAlpha");
      -[PKPaletteHostView _updatePaletteAppearance](self, "_updatePaletteAppearance");
    }
  }
}

- (BOOL)isPaletteDragging
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[PKPaletteHostView paletteVisualState](self, "paletteVisualState") == 3)
    return 1;
  -[PKPaletteHostView panGestureRecognizer](self, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") == 1)
  {
    v3 = 1;
  }
  else
  {
    -[PKPaletteHostView panGestureRecognizer](self, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "state") == 2;

  }
  return v3;
}

- (void)_updatePaletteAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  int v32;
  void *v33;
  double v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;

  -[PKPaletteHostView paletteView](self, "paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHostView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "borderColorForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteHostView paletteView](self, "paletteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHostView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "borderWidthForTraitCollection:", v7);
  v9 = v8;

  v46 = objc_retainAutorelease(v5);
  v10 = objc_msgSend(v46, "CGColor");
  -[PKPaletteHostView paletteView](self, "paletteView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", v10);

  -[PKPaletteHostView paletteView](self, "paletteView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBorderWidth:", v9);

  -[PKPaletteHostView paletteView](self, "paletteView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMasksToBounds:", 0);

  v17 = *MEMORY[0x1E0C9D820];
  v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PKPaletteHostView paletteView](self, "paletteView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowOffset:", v17, v18);

  v21 = -[PKPaletteHostView paletteVisualState](self, "paletteVisualState");
  -[PKPaletteHostView paletteTransition](self, "paletteTransition");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v22, "isTransitionInProgress");

  if ((_DWORD)v12)
  {
    -[PKPaletteHostView paletteTransition](self, "paletteTransition");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v23, "intermediateVisualState");

  }
  if ((unint64_t)(v21 - 4) >= 4)
  {
    if ((unint64_t)(v21 - 2) > 1)
    {
      v35 = 0;
      v26 = 0.0;
      v29 = 0.0;
      goto LABEL_11;
    }
    -[PKPaletteHostView paletteView](self, "paletteView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "shadowOpacity");
    v26 = v31;

    -[PKPaletteHostView paletteView](self, "paletteView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v27, "shouldAdjustShadowRadiusForMinimized");
    -[PKPaletteHostView paletteView](self, "paletteView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "shadowRadius");
    if (v32)
      v29 = v34 * 0.5;
    else
      v29 = v34;

  }
  else
  {
    -[PKPaletteHostView paletteView](self, "paletteView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shadowOpacity");
    v26 = v25;

    -[PKPaletteHostView paletteView](self, "paletteView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shadowRadius");
    v29 = v28;
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteShadowColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  -[PKPaletteHostView paletteView](self, "paletteView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v26;
  *(float *)&v39 = v36;
  objc_msgSend(v38, "setShadowOpacity:", v39);

  -[PKPaletteHostView paletteView](self, "paletteView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setShadowRadius:", v29);

  v42 = objc_retainAutorelease(v35);
  v43 = objc_msgSend(v42, "CGColor");
  -[PKPaletteHostView paletteView](self, "paletteView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setShadowColor:", v43);

}

- (void)_updatePaletteViewSizeConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  if (-[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact"))
  {
    -[PKPaletteHostView _updateConstraintsToFixToBottomEdge](self, "_updateConstraintsToFixToBottomEdge");
  }
  else
  {
    -[PKPaletteHostView _paletteSizeForVisualState:](self, "_paletteSizeForVisualState:", -[PKPaletteHostView paletteVisualState](self, "paletteVisualState"));
    v4 = v3;
    v6 = v5;
    -[PKPaletteHostView paletteWidthConstraint](self, "paletteWidthConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", v4);

    -[PKPaletteHostView paletteHeightConstraint](self, "paletteHeightConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", v6);

    -[PKPaletteHostView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updatePaletteContentAlpha
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  id v9;

  -[PKPaletteHostView paletteTransition](self, "paletteTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTransitionInProgress");

  if (v4)
  {
    -[PKPaletteHostView paletteTransition](self, "paletteTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandedToCollapsedRatio");
    v7 = 1.0 - (v6 + v6);

    if (v7 < 0.0)
      v7 = 0.0;
  }
  else
  {
    v8 = -[PKPaletteHostView paletteVisualState](self, "paletteVisualState") - 1;
    v7 = 0.0;
    if (v8 <= 6)
      v7 = dbl_1BE4FD708[v8];
  }
  -[PKPaletteHostView paletteView](self, "paletteView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPaletteContentAlpha:", v7);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaletteHostView;
  -[PKPaletteHostView layoutSubviews](&v12, sel_layoutSubviews);
  -[PKPaletteHostView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPaletteHostView pencilInteractionFeedbackHostView](self, "pencilInteractionFeedbackHostView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)safeAreaInsetsDidChange
{
  _QWORD v3[5];

  if (-[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact"))
  {
    if (-[PKPaletteHostView isEffectivePaletteVisible](self, "isEffectivePaletteVisible"))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __44__PKPaletteHostView_safeAreaInsetsDidChange__block_invoke;
      v3[3] = &unk_1E7778020;
      v3[4] = self;
      -[PKPaletteHostView _performAnimated:tracking:animations:completion:](self, "_performAnimated:tracking:animations:completion:", 1, 0, v3, 0);
      -[PKPaletteHostView updateKeyboardAvoidanceForPalette:](self, "updateKeyboardAvoidanceForPalette:", 1);
    }
  }
}

uint64_t __44__PKPaletteHostView_safeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePaletteHeightConstraint");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_fixToBottomEdge
{
  void *v3;
  double v4;

  -[PKPaletteHostView _paletteWillDockToPosition:prepareForExpansion:](self, "_paletteWillDockToPosition:prepareForExpansion:", 3, 0);
  -[PKPaletteHostView _deactivatePaletteCenterConstraints](self, "_deactivatePaletteCenterConstraints");
  -[PKPaletteHostView _deactivatePaletteEdgeConstraints](self, "_deactivatePaletteEdgeConstraints");
  -[PKPaletteHostView _setPaletteVisualState:usingTransition:](self, "_setPaletteVisualState:usingTransition:", 1, 0);
  -[PKPaletteHostView paletteWidthConstraint](self, "paletteWidthConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1132068864;
  objc_msgSend(v3, "setPriority:", v4);

  -[PKPaletteHostView _updateConstraintsToFixToBottomEdge](self, "_updateConstraintsToFixToBottomEdge");
  -[PKPaletteHostView _paletteDidDockToPosition:fromUserReposition:](self, "_paletteDidDockToPosition:fromUserReposition:", 3, 0);
}

- (void)_updateConstraintsToFixToBottomEdge
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;

  v3 = -3.0;
  if (!-[PKPaletteHostView isEffectivePaletteVisible](self, "isEffectivePaletteVisible"))
  {
    -[PKPaletteHostView _paletteViewCompactHeight](self, "_paletteViewCompactHeight");
    v3 = v4 * -2.0;
  }
  -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v3);

  -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, "setPriority:", v7);

  -[PKPaletteHostView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "layoutDirection");

  -[PKPaletteHostView paletteView](self, "paletteView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "edgeInsetsInCompactSize");
  v12 = v11;
  v14 = v13;
  -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9 == 1)
  {
    objc_msgSend(v15, "setConstant:", v14);

    -[PKPaletteHostView paletteView](self, "paletteView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "edgeInsetsInCompactSize");
    v19 = v18;
  }
  else
  {
    objc_msgSend(v15, "setConstant:", v12);

    -[PKPaletteHostView paletteView](self, "paletteView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "edgeInsetsInCompactSize");
    v19 = v20;
  }
  -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setConstant:", v19);

  -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 1148846080;
  objc_msgSend(v22, "setPriority:", v23);

  -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 1148846080;
  objc_msgSend(v24, "setPriority:", v25);

  -[PKPaletteHostView _updatePaletteHeightConstraint](self, "_updatePaletteHeightConstraint");
}

- (void)_updatePaletteHeightConstraint
{
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  -[PKPaletteHostView _paletteViewCompactHeight](self, "_paletteViewCompactHeight");
  v4 = v3;
  -[PKPaletteHostView paletteHeightConstraint](self, "paletteHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[PKPaletteHostView paletteHeightConstraint](self, "paletteHeightConstraint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1148846080;
  objc_msgSend(v7, "setPriority:", v6);

}

- (double)_paletteViewCompactHeight
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  -[PKPaletteHostView paletteView](self, "paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compactPaletteHeight");
  v5 = v4;
  -[PKPaletteHostView paletteView](self, "paletteView");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "edgeInsetsInCompactSize");
  v8 = v5 + v7;

  -[PKPaletteHostView paletteView](self, "paletteView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "ignoresSafeAreaInsetsInCompactSize");

  if ((v6 & 1) == 0)
  {
    -[PKPaletteHostView window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaInsets");
    v8 = v8 + v11;

  }
  return v8 + 3.0;
}

- (void)_dockPaletteToAutoHideCornerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (!-[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact"))
  {
    v5 = -[PKPaletteView autoHideCorner](self->_paletteView, "autoHideCorner") - 1;
    if (v5 > 7)
      v6 = 0;
    else
      v6 = qword_1BE4FD7A0[v5];
    -[PKPaletteHostView _dockPaletteToPosition:animated:](self, "_dockPaletteToPosition:animated:", v6, v3);
  }
}

- (void)_dockPaletteToPosition:(int64_t)a3 animated:(BOOL)a4
{
  -[PKPaletteHostView _dockPaletteToPosition:isFromUserReposition:animated:](self, "_dockPaletteToPosition:isFromUserReposition:animated:", a3, 0, a4);
}

- (void)_dockPaletteToPosition:(int64_t)a3 isFromUserReposition:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  unint64_t v9;
  _BOOL4 v10;
  _BOOL8 v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  _QWORD v17[6];
  BOOL v18;
  _QWORD v19[6];

  v5 = a5;
  v9 = a3 - 1;
  v10 = (unint64_t)(a3 - 1) < 4;
  v11 = (-[PKPaletteHostView paletteVisualState](self, "paletteVisualState") & 0xFFFFFFFFFFFFFFFELL) == 2 && v10;
  -[PKPaletteHostView _paletteWillDockToPosition:prepareForExpansion:](self, "_paletteWillDockToPosition:prepareForExpansion:", a3, v11);
  if (v9 >= 4)
    -[PKPaletteHostView layoutIfNeeded](self, "layoutIfNeeded");
  -[PKPaletteHostView paletteHeightConstraint](self, "paletteHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, "setPriority:", v13);

  -[PKPaletteHostView paletteWidthConstraint](self, "paletteWidthConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1148846080;
  objc_msgSend(v14, "setPriority:", v15);

  if (v9 > 7)
    v16 = 0;
  else
    v16 = qword_1BE4FD740[v9];
  -[PKPaletteHostView _setPaletteVisualState:usingTransition:](self, "_setPaletteVisualState:usingTransition:", v16, v5);
  -[PKPaletteHostView layoutIfNeeded](self, "layoutIfNeeded");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__PKPaletteHostView__dockPaletteToPosition_isFromUserReposition_animated___block_invoke;
  v19[3] = &unk_1E7778048;
  v19[4] = self;
  v19[5] = a3;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__PKPaletteHostView__dockPaletteToPosition_isFromUserReposition_animated___block_invoke_2;
  v17[3] = &unk_1E777AE68;
  v17[4] = self;
  v17[5] = a3;
  v18 = a4;
  -[PKPaletteHostView _performAnimated:tracking:animations:completion:](self, "_performAnimated:tracking:animations:completion:", v5, 0, v19, v17);
}

uint64_t __74__PKPaletteHostView__dockPaletteToPosition_isFromUserReposition_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToDockPaletteToPosition:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __74__PKPaletteHostView__dockPaletteToPosition_isFromUserReposition_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_paletteDidDockToPosition:fromUserReposition:", *(_QWORD *)(result + 40), *(unsigned __int8 *)(result + 48));
  return result;
}

- (double)_paletteEdgeMarginForTopEdge:(BOOL)a3 isMinimized:(BOOL)a4
{
  double result;

  -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isBottomEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isBottomEdge:isMinimized:", a3, 0, a4);
  return result;
}

- (double)_paletteEdgeMarginForTopEdge:(BOOL)a3 isBottomEdge:(BOOL)a4 isMinimized:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  double result;
  void *v10;
  double v11;
  double v12;
  double v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (-[PKPaletteHostView isEffectivePaletteVisible](self, "isEffectivePaletteVisible"))
  {
    result = 20.0;
    if (v7)
      result = 30.0;
    if (v6 && !v5 && !v7)
      -[PKPaletteHostView paletteViewBottomEdgeSpacing](self, "paletteViewBottomEdgeSpacing", result);
  }
  else
  {
    -[PKPaletteHostView paletteView](self, "paletteView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paletteScaleFactor");
    v12 = v11 * 122.0;

    v13 = 20.0;
    if (v7 || v5)
      v13 = 30.0;
    return -(v13 + v12);
  }
  return result;
}

- (void)_updateConstraintsToDockPaletteToPosition:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  uint64_t v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  id v80;
  id v81;

  -[PKPaletteHostView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKPaletteHostView _deactivatePaletteEdgeConstraints](self, "_deactivatePaletteEdgeConstraints");
    -[PKPaletteHostView _deactivatePaletteCenterConstraints](self, "_deactivatePaletteCenterConstraints");
    switch(a3)
    {
      case 1:
        -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isMinimized:", 1, 0);
        v7 = v6;
        -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setConstant:", v7);

        -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 2:
        -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isMinimized:", 0, 0);
        v12 = v11;
        -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setConstant:", v12);

        -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isBottomEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isBottomEdge:isMinimized:", 0, 1, 0);
        v17 = v16;
        -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setConstant:", v17);

        -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
        v19 = v9;
        LODWORD(v10) = 1144750080;
        objc_msgSend(v9, "setPriority:", v10);

        -[PKPaletteHostView paletteView](self, "paletteView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isAutoHideEnabled");

        if (!v21)
        {
          -[PKPaletteHostView paletteCenterXConstraint](self, "paletteCenterXConstraint");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setConstant:", 0.0);

          -[PKPaletteHostView paletteCenterXConstraint](self, "paletteCenterXConstraint");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        -[PKPaletteHostView paletteView](self, "paletteView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "autoHideCorner");

        switch(v23)
        {
          case 1:
          case 4:
            -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          case 2:
          case 8:
            -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
            v79 = v24;
            LODWORD(v25) = 1144750080;
            objc_msgSend(v24, "setPriority:", v25);

            break;
          default:
            break;
        }
        -[PKPaletteHostView paletteCenterXConstraint](self, "paletteCenterXConstraint");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      case 4:
        -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isMinimized:", 0, 0);
        v27 = v26;
        -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setConstant:", v27);

        -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v29 = v14;
        LODWORD(v15) = 1144750080;
        objc_msgSend(v14, "setPriority:", v15);

        -[PKPaletteHostView paletteCenterYConstraint](self, "paletteCenterYConstraint");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v31) = 1144750080;
        objc_msgSend(v30, "setPriority:", v31);

        -[PKPaletteHostView paletteView](self, "paletteView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isAutoHideEnabled");

        if (!v33)
        {
          -[PKPaletteHostView paletteCenterYConstraint](self, "paletteCenterYConstraint");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setConstant:", 0.0);

          -[PKPaletteHostView paletteCenterYConstraint](self, "paletteCenterYConstraint");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
          v80 = v57;
          LODWORD(v58) = 1144750080;
          goto LABEL_38;
        }
        -[PKPaletteHostView paletteView](self, "paletteView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "autoHideCorner");

        if ((unint64_t)(v35 - 1) <= 1)
        {
          -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
          v78 = v36;
          LODWORD(v37) = 1144750080;
          objc_msgSend(v36, "setPriority:", v37);

          goto LABEL_33;
        }
        if (v35 == 8 || v35 == 4)
        {
          -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
LABEL_33:
        -[PKPaletteHostView paletteCenterYConstraint](self, "paletteCenterYConstraint");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:
        LODWORD(v58) = 1132068864;
        v80 = v57;
LABEL_38:
        objc_msgSend(v57, "setPriority:", v58);

        break;
      case 5:
        -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setConstant:", 30.0);

        -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setConstant:", 30.0);

        -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v41) = 1144750080;
        objc_msgSend(v40, "setPriority:", v41);

        -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v43) = 1144750080;
        objc_msgSend(v42, "setPriority:", v43);

        -[PKPaletteHostView paletteView](self, "paletteView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "edgeLocationToDockFromCorner:", 1);

        if (v45 == 1)
          goto LABEL_22;
        goto LABEL_16;
      case 6:
        -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setConstant:", 30.0);

        -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setConstant:", 30.0);

        -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v63) = 1144750080;
        objc_msgSend(v62, "setPriority:", v63);

        -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v65) = 1144750080;
        objc_msgSend(v64, "setPriority:", v65);

        -[PKPaletteHostView paletteView](self, "paletteView");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "edgeLocationToDockFromCorner:", 2);

        if (v67 != 1)
          goto LABEL_24;
LABEL_22:
        -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isMinimized:", 1, 1);
        v54 = v68;
        -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      case 7:
        -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setConstant:", 30.0);

        -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setConstant:", 30.0);

        -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v72) = 1144750080;
        objc_msgSend(v71, "setPriority:", v72);

        -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v74) = 1144750080;
        objc_msgSend(v73, "setPriority:", v74);

        -[PKPaletteHostView paletteView](self, "paletteView");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v75, "edgeLocationToDockFromCorner:", 8);

        if (v67 == 4)
          goto LABEL_27;
LABEL_24:
        if (v67 != 8)
          return;
        -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isMinimized:", 0, 1);
        v54 = v76;
        -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      case 8:
        -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setConstant:", 30.0);

        -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setConstant:", 30.0);

        -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v49) = 1144750080;
        objc_msgSend(v48, "setPriority:", v49);

        -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v51) = 1144750080;
        objc_msgSend(v50, "setPriority:", v51);

        -[PKPaletteHostView paletteView](self, "paletteView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v52, "edgeLocationToDockFromCorner:", 4);

        if (v45 == 4)
        {
LABEL_27:
          -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isMinimized:", 0, 1);
          v54 = v77;
          -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_16:
          if (v45 != 2)
            return;
          -[PKPaletteHostView _paletteEdgeMarginForTopEdge:isMinimized:](self, "_paletteEdgeMarginForTopEdge:isMinimized:", 0, 1);
          v54 = v53;
          -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
        }
LABEL_28:
        v81 = v55;
        objc_msgSend(v55, "setConstant:", v54);

        return;
      default:
        return;
    }
  }
}

- (void)_paletteWillDockToPosition:(int64_t)a3 prepareForExpansion:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  -[PKPaletteHostView setPalettePosition:](self, "setPalettePosition:");
  -[PKPaletteHostView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostView:willDockPaletteToPosition:prepareForExpansion:", self, a3, v4);

}

- (void)_paletteDidDockToPosition:(int64_t)a3 fromUserReposition:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  -[PKPaletteHostView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostView:didDockPaletteToPosition:", self, a3);

  if (v4)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView paletteView](self, "paletteView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordPalettePositionChange:type:]((uint64_t)v9, a3, objc_msgSend(v8, "paletteViewType"));

  }
}

- (void)_touchDownFeedbackGestureHandler:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  _QWORD v12[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[PKPaletteHostView layoutIfNeeded](self, "layoutIfNeeded");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PKPaletteHostView__touchDownFeedbackGestureHandler___block_invoke;
    v12[3] = &unk_1E7778020;
    v12[4] = self;
    -[PKPaletteHostView _performAnimated:tracking:animations:completion:](self, "_performAnimated:tracking:animations:completion:", 1, 0, v12, &__block_literal_global_50);
    -[PKPaletteHostView _setPaletteVisualState:usingTransition:](self, "_setPaletteVisualState:usingTransition:", 3, 1);
  }
  else
  {
    v5 = objc_msgSend(v4, "state") != 3 && objc_msgSend(v4, "state") != 5 && objc_msgSend(v4, "state") != 4;
    -[PKPaletteHostView tapToExpandPaletteFromMinimizedGestureRecognizer](self, "tapToExpandPaletteFromMinimizedGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");

    -[PKPaletteHostView panGestureRecognizer](self, "panGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "state") == 2)
    {

    }
    else
    {
      -[PKPaletteHostView panGestureRecognizer](self, "panGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "state");

      v11 = v7 == 3 || v5;
      if ((v11 & 1) == 0 && v10 != 3)
        -[PKPaletteHostView _dockPaletteToPosition:animated:](self, "_dockPaletteToPosition:animated:", -[PKPaletteHostView palettePosition](self, "palettePosition"), 1);
    }
  }

}

uint64_t __54__PKPaletteHostView__touchDownFeedbackGestureHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v11[3];

  objc_msgSend(*(id *)(a1 + 32), "paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v11[0] = *MEMORY[0x1E0C9BAA8];
  v11[1] = v3;
  v11[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v11);

  switch(objc_msgSend(*(id *)(a1 + 32), "palettePosition"))
  {
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "paletteLeftConstraint");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "paletteRightConstraint");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v5 = v4;
      objc_msgSend(v4, "setConstant:", 20.0);

      objc_msgSend(*(id *)(a1 + 32), "paletteTopConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 7:
      objc_msgSend(*(id *)(a1 + 32), "paletteRightConstraint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 8:
      objc_msgSend(*(id *)(a1 + 32), "paletteLeftConstraint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = v7;
      objc_msgSend(v7, "setConstant:", 20.0);

      objc_msgSend(*(id *)(a1 + 32), "paletteBottomConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = v6;
      objc_msgSend(v6, "setConstant:", 20.0);

      break;
    default:
      return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_tapToExpandPaletteFromMinimizedGestureHandler:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend(a3, "state") == 3)
  {
    v4 = -[PKPaletteHostView palettePosition](self, "palettePosition") - 5;
    if (v4 > 3)
      v5 = -1;
    else
      v5 = qword_1BE4FD780[v4];
    -[PKPaletteHostView paletteView](self, "paletteView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "edgeLocationToDockFromCorner:", v5);

    if ((unint64_t)(v7 - 1) > 7)
      v8 = 0;
    else
      v8 = qword_1BE4FD850[v7 - 1];
    -[PKPaletteHostView _dockPaletteToPosition:animated:](self, "_dockPaletteToPosition:animated:", v8, 1);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v4 = a3;
  v5 = -[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact");
  -[PKPaletteHostView panGestureRecognizer](self, "panGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    v8 = v4;
    if (v6 != v4)
    {
      -[PKPaletteHostView touchDownFeedbackGestureRecognizer](self, "touchDownFeedbackGestureRecognizer");
      v9 = objc_claimAutoreleasedReturnValue();
      if ((id)v9 != v4)
      {
        v10 = (void *)v9;
        -[PKPaletteHostView tapToExpandPaletteFromMinimizedGestureRecognizer](self, "tapToExpandPaletteFromMinimizedGestureRecognizer");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
          goto LABEL_14;
LABEL_17:
        LOBYTE(self) = 1;
        goto LABEL_19;
      }

      v8 = v7;
    }

LABEL_14:
    LOBYTE(self) = 0;
    goto LABEL_19;
  }

  if (v7 == v4)
  {
    -[PKPaletteHostView paletteView](self, "paletteView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = objc_msgSend(v14, "draggingEnabled");
  }
  else
  {
    -[PKPaletteHostView touchDownFeedbackGestureRecognizer](self, "touchDownFeedbackGestureRecognizer");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v4)
    {
      LOBYTE(self) = -[PKPaletteHostView isPaletteVisualStateMinimized](self, "isPaletteVisualStateMinimized");
      goto LABEL_19;
    }
    -[PKPaletteHostView tapToExpandPaletteFromMinimizedGestureRecognizer](self, "tapToExpandPaletteFromMinimizedGestureRecognizer");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v4)
    {
      if (!-[PKPaletteHostView isPaletteVisualStateMinimized](self, "isPaletteVisualStateMinimized"))
      {
        LOBYTE(self) = -[PKPaletteHostView paletteVisualState](self, "paletteVisualState") == 3;
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    -[PKPaletteHostView paletteView](self, "paletteView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(self) = objc_msgSend(v14, "isPalettePresentingPopover") ^ 1;
  }

LABEL_19:
  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PKPaletteHostView panGestureRecognizer](self, "panGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  -[PKPaletteHostView tapToExpandPaletteFromMinimizedGestureRecognizer](self, "tapToExpandPaletteFromMinimizedGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  -[PKPaletteHostView touchDownFeedbackGestureRecognizer](self, "touchDownFeedbackGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  -[PKPaletteHostView paletteView](self, "paletteView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "panGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v14, "containsObject:", v7);
  if ((_DWORD)v8)
    v15 = objc_msgSend(v14, "containsObject:", v6);
  else
    v15 = 0;

  return v15;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v16;
  char v17;
  void *v18;
  int64_t v19;
  CGPoint v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKPaletteHostView bounds](self, "bounds");
  v21.x = x;
  v21.y = y;
  if (!CGRectContainsPoint(v22, v21))
  {
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  -[PKPaletteHostView paletteView](self, "paletteView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHostView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[PKPaletteHostView paletteView](self, "paletteView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  if ((v14 & 1) == 0)
  {
    if (v7)
    {
      if (objc_msgSend(v7, "type") != 11)
      {
        -[PKPaletteHostView paletteView](self, "paletteView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isPalettePresentingPopover");

        if ((v17 & 1) == 0 && !-[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact"))
        {
          -[PKPaletteHostView paletteView](self, "paletteView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isAutoHideEnabled") & 1) != 0)
          {
            v19 = -[PKPaletteHostView paletteVisualState](self, "paletteVisualState");

            if (v19 != 2)
              -[PKPaletteHostView _dockPaletteToAutoHideCornerAnimated:](self, "_dockPaletteToAutoHideCornerAnimated:", 1);
          }
          else
          {

          }
        }
      }
    }
    goto LABEL_12;
  }
  v15 = 1;
LABEL_13:

  return v15;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  PKPaletteHostView *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_super v64;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = objc_msgSend(v7, "PK_isEventFromPencil");
  -[PKPaletteHostView paletteView](self, "paletteView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPalettePresentingPopover");

  v11 = objc_msgSend(v7, "type");
  if ((-[PKPaletteHostView isHidden](self, "isHidden") & 1) == 0)
  {
    -[PKPaletteHostView alpha](self, "alpha");
    if (v12 != 0.0)
    {
      if (((-[PKPaletteHostView isPaletteVisible](self, "isPaletteVisible") | v10) & 1) != 0)
        goto LABEL_4;
LABEL_27:
      -[PKPaletteHostView pencilInteractionFeedbackHostView](self, "pencilInteractionFeedbackHostView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteHostView convertPoint:toView:](self, "convertPoint:toView:", v24, x, y);
      v26 = v25;
      v28 = v27;

      -[PKPaletteHostView pencilInteractionFeedbackHostView](self, "pencilInteractionFeedbackHostView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "hitTest:withEvent:", v7, v26, v28);
      v15 = (PKPaletteHostView *)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
  }
  if ((v10 & 1) == 0)
    goto LABEL_27;
LABEL_4:
  if (!-[PKPaletteHostView isPaletteVisible](self, "isPaletteVisible")
    && ((v10 ^ 1) & 1) == 0
    && ((v8 ^ 1) & 1) == 0
    && v11 != 11)
  {
    -[PKPaletteHostView paletteView](self, "paletteView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissPalettePopoverWithCompletion:", 0);

  }
  v64.receiver = self;
  v64.super_class = (Class)PKPaletteHostView;
  -[PKPaletteHostView hitTest:withEvent:](&v64, sel_hitTest_withEvent_, v7, x, y);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (PKPaletteHostView *)v14;
  if (v7)
  {
    if (v10)
    {
      v16 = v14 ? 0 : v8;
      if ((v16 & 1) == 0 && v11 != 11)
      {
        -[PKPaletteHostView paletteView](self, "paletteView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dismissPalettePopoverWithCompletion:", 0);

        if (v15)
          v18 = 1;
        else
          v18 = v8;
        if ((v18 & 1) == 0)
          v15 = self;
        goto LABEL_28;
      }
    }
    if (v14)
      goto LABEL_28;
    -[PKPaletteHostView paletteView](self, "paletteView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "palettePopoverPresentingController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentedViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hitTest:withEvent:", v7, PK_convertRectFromCoordinateSpaceToCoordinateSpace(self, v22, x, y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8)));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v15 = 0;
LABEL_25:

        goto LABEL_28;
      }
    }
    if (v11 != 11)
    {
      -[PKPaletteHostView paletteView](self, "paletteView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dismissPalettePopoverWithCompletion:", 0);

    }
    if (!-[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact"))
    {
      -[PKPaletteHostView paletteView](self, "paletteView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isAutoHideEnabled") & 1) != 0)
      {
        v33 = -[PKPaletteHostView isPaletteVisualStateMinimized](self, "isPaletteVisualStateMinimized");

        if (!v33 && v11 != 11)
          -[PKPaletteHostView _dockPaletteToAutoHideCornerAnimated:](self, "_dockPaletteToAutoHideCornerAnimated:", 1);
      }
      else
      {

      }
    }
    -[PKPaletteHostView paletteView](self, "paletteView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PKPaletteHostView paletteView](self, "paletteView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "selectedTool");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "ink");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "_isHandwritingInk");

      objc_msgSend(v36, "selectedTool");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "_isLassoTool");

      if ((v39 & 1) == 0 && (v41 & 1) == 0)
      {
        -[PKPaletteHostView window](self, "window");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteHostView paletteView](self, "paletteView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "presentationController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "view");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "window");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42 != v46)
        {
          -[PKPaletteHostView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
          v48 = v47;
          v50 = v49;
          -[PKPaletteHostView window](self, "window");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaletteHostView paletteView](self, "paletteView");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "presentationController");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "view");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "window");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "convertPoint:toWindow:", v55, v48, v50);
          v57 = v56;
          v59 = v58;

          -[PKPaletteHostView paletteView](self, "paletteView");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "presentationController");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "view");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "window");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "hitTest:withEvent:", v7, v57, v59);
          v15 = (PKPaletteHostView *)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
      }

    }
    v15 = 0;
  }
LABEL_28:

  return v15;
}

- (void)_deactivatePaletteCenterConstraints
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[PKPaletteHostView paletteCenterXConstraint](self, "paletteCenterXConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1132068864;
  objc_msgSend(v3, "setPriority:", v4);

  -[PKPaletteHostView paletteCenterYConstraint](self, "paletteCenterYConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1132068864;
  objc_msgSend(v6, "setPriority:", v5);

}

- (void)_activatePaletteCenterConstraints
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[PKPaletteHostView paletteCenterXConstraint](self, "paletteCenterXConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1144750080;
  objc_msgSend(v3, "setPriority:", v4);

  -[PKPaletteHostView paletteCenterYConstraint](self, "paletteCenterYConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1144750080;
  objc_msgSend(v6, "setPriority:", v5);

}

- (void)_deactivatePaletteEdgeConstraints
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[PKPaletteHostView paletteTopConstraint](self, "paletteTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1132068864;
  objc_msgSend(v3, "setPriority:", v4);

  -[PKPaletteHostView paletteBottomConstraint](self, "paletteBottomConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1132068864;
  objc_msgSend(v5, "setPriority:", v6);

  -[PKPaletteHostView paletteLeftConstraint](self, "paletteLeftConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1132068864;
  objc_msgSend(v7, "setPriority:", v8);

  -[PKPaletteHostView paletteRightConstraint](self, "paletteRightConstraint");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1132068864;
  objc_msgSend(v10, "setPriority:", v9);

}

- (void)_panGestureHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat MaxY;
  CGFloat v37;
  CGFloat v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  unint64_t v58;
  _BOOL4 v60;
  int64_t v61;
  _BOOL4 v63;
  _BOOL4 v64;
  double v65;
  _BOOL4 v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  double v73;
  double v74;
  uint64_t v75;
  int64_t v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  int64_t v85;
  double v86;
  _BOOL4 v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  int64_t v114;
  double v115;
  double v116;
  void *v117;
  uint64_t v118;
  double v119;
  double v120;
  double v121;
  double v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat MidY;
  CGFloat MaxX;
  CGFloat v128;
  CGFloat MinY;
  CGFloat v130;
  CGFloat MinX;
  CGFloat MidX;
  _QWORD v133[6];
  _QWORD v134[6];
  _QWORD v135[5];
  _QWORD v136[7];
  CGFloat v137;
  CGFloat v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  uint64_t v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;

  v145 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  -[PKPaletteHostView paletteView](self, "paletteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKDynamicCast(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tools");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (objc_msgSend(v4, "state") == 1)
  {
    -[PKPaletteHostView tooltipPresentationHandle](self, "tooltipPresentationHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hideFloatingLabel");

    -[PKPaletteHostView paletteView](self, "paletteView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView bringSubviewToFront:](self, "bringSubviewToFront:", v11);

    -[PKPaletteHostView paletteView](self, "paletteView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "center");
    -[PKPaletteHostView setDraggingInitialPaletteCenterInSelf:](self, "setDraggingInitialPaletteCenterInSelf:");

    -[PKPaletteHostView setPaletteDraggingBehavior:](self, "setPaletteDraggingBehavior:", 0);
    -[PKPaletteHostView setDraggingPendingPaletteVisualState:](self, "setDraggingPendingPaletteVisualState:", 0);
    -[PKPaletteHostView paletteView](self, "paletteView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentScrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v14);
    v16 = v15;
    v18 = v17;

    if (v9 <= 7)
    {
      -[PKPaletteHostView setPanGestureDidStartInPaletteScrollView:](self, "setPanGestureDidStartInPaletteScrollView:", 0);
    }
    else
    {
      -[PKPaletteHostView paletteView](self, "paletteView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contentScrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteHostView setPanGestureDidStartInPaletteScrollView:](self, "setPanGestureDidStartInPaletteScrollView:", objc_msgSend(v20, "pointInside:withEvent:", 0, v16, v18));

    }
    goto LABEL_77;
  }
  if (objc_msgSend(v4, "state") != 2)
  {
    if (objc_msgSend(v4, "state") != 3 && objc_msgSend(v4, "state") != 4 && objc_msgSend(v4, "state") != 5)
      goto LABEL_77;
    if (!-[PKPaletteHostView panGestureShouldDragPaletteView](self, "panGestureShouldDragPaletteView"))
    {
LABEL_57:
      -[PKPaletteHostView setPanGestureShouldDragPaletteView:](self, "setPanGestureShouldDragPaletteView:", 1);
      -[PKPaletteHostView setPaletteScrollGestureShouldScroll:](self, "setPaletteScrollGestureShouldScroll:", v9 > 7);
      -[PKPaletteHostView paletteView](self, "paletteView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "contentScrollView");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setScrollEnabled:", 1);

      goto LABEL_77;
    }
    v22 = MEMORY[0x1E0C809B0];
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke_2;
    v135[3] = &unk_1E7778020;
    v135[4] = self;
    -[PKPaletteHostView _performAnimated:tracking:animations:completion:](self, "_performAnimated:tracking:animations:completion:", 1, 0, v135, 0);
    -[PKPaletteHostView _projectedLandingPointForGestureRecognizerEnd:](self, "_projectedLandingPointForGestureRecognizerEnd:", v4);
    v24 = v23;
    v26 = v25;
    -[PKPaletteHostView bounds](self, "bounds");
    v147 = CGRectInset(v146, 20.0, 20.0);
    x = v147.origin.x;
    y = v147.origin.y;
    width = v147.size.width;
    height = v147.size.height;
    v31 = _PKPaletteVisualStateForPointInRectToSettle(1, v147.origin.x, v147.origin.y, v147.size.width, v147.size.height, v24, v26);
    v32 = x;
    v33 = y;
    v34 = width;
    v35 = height;
    if (v31 == 2)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v32);
      v148.origin.x = x;
      v148.origin.y = y;
      v148.size.width = width;
      v148.size.height = height;
      MinY = CGRectGetMinY(v148);
      v149.origin.x = x;
      v149.origin.y = y;
      v149.size.width = width;
      v149.size.height = height;
      MaxX = CGRectGetMaxX(v149);
      v150.origin.x = x;
      v150.origin.y = y;
      v150.size.width = width;
      v150.size.height = height;
      v125 = CGRectGetMinY(v150);
      v151.origin.x = x;
      v151.origin.y = y;
      v151.size.width = width;
      v151.size.height = height;
      v123 = CGRectGetMaxX(v151);
      v152.origin.x = x;
      v152.origin.y = y;
      v152.size.width = width;
      v152.size.height = height;
      MaxY = CGRectGetMaxY(v152);
      v153.origin.x = x;
      v153.origin.y = y;
      v153.size.width = width;
      v153.size.height = height;
      v37 = CGRectGetMinX(v153);
      v154.origin.x = x;
      v154.origin.y = y;
      v154.size.width = width;
      v154.size.height = height;
      v38 = CGRectGetMaxY(v154);
      v39 = 0;
      v137 = MinX;
      v138 = MinY;
      v139 = MaxX;
      v140 = v125;
      v141 = v123;
      v142 = MaxY;
      v40 = qword_1BE4FD780;
      v41 = 1;
      v42 = 3.40282347e38;
      v143 = v37;
      v144 = v38;
      do
      {
        v43 = (v26 - *(CGFloat *)((char *)&v137 + v39 + 8)) * (v26 - *(CGFloat *)((char *)&v137 + v39 + 8));
        if (v43 + (v24 - *(CGFloat *)((char *)&v137 + v39)) * (v24 - *(CGFloat *)((char *)&v137 + v39)) < v42)
        {
          v41 = *v40;
          v42 = v43 + (v24 - *(CGFloat *)((char *)&v137 + v39)) * (v24 - *(CGFloat *)((char *)&v137 + v39));
        }
        v39 += 16;
        ++v40;
      }
      while (v39 != 64);
      v44 = v41 - 1;
      if ((unint64_t)(v41 - 1) < 8)
      {
        v45 = qword_1BE4FD7A0;
LABEL_54:
        v75 = v45[v44];
LABEL_56:
        v76 = -[PKPaletteHostView palettePosition](self, "palettePosition");
        -[PKPaletteHostView setPalettePosition:](self, "setPalettePosition:", v75);
        -[PKPaletteHostView setDraggingPendingPaletteVisualState:](self, "setDraggingPendingPaletteVisualState:", 0);
        -[PKPaletteHostView _setPaletteVisualState:usingTransition:](self, "_setPaletteVisualState:usingTransition:", v31, 1);
        -[PKPaletteHostView layoutIfNeeded](self, "layoutIfNeeded");
        -[PKPaletteHostView paletteView](self, "paletteView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "velocityInView:", self);
        objc_msgSend(v77, "responseForThrowingFromPosition:toPosition:withVelocity:", v76, v75);
        v79 = v78;

        -[PKPaletteHostView paletteView](self, "paletteView");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "velocityInView:", self);
        objc_msgSend(v80, "dampingRatioForThrowingFromPosition:toPosition:withVelocity:", v76, v75);
        v82 = v81;

        v133[5] = v75;
        v134[0] = v22;
        v134[1] = 3221225472;
        v134[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke_3;
        v134[3] = &unk_1E7778048;
        v134[4] = self;
        v134[5] = v75;
        v133[0] = v22;
        v133[1] = 3221225472;
        v133[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke_4;
        v133[3] = &unk_1E777AED8;
        v133[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v134, v133, v82, v79, 0.0, 0.0, 0.0, 0.0);
        goto LABEL_57;
      }
    }
    else
    {
      MidX = CGRectGetMidX(*(CGRect *)&v32);
      v155.origin.x = x;
      v155.origin.y = y;
      v155.size.width = width;
      v155.size.height = height;
      v130 = CGRectGetMinY(v155);
      v156.origin.x = x;
      v156.origin.y = y;
      v156.size.width = width;
      v156.size.height = height;
      v128 = CGRectGetMaxX(v156);
      v157.origin.x = x;
      v157.origin.y = y;
      v157.size.width = width;
      v157.size.height = height;
      MidY = CGRectGetMidY(v157);
      v158.origin.x = x;
      v158.origin.y = y;
      v158.size.width = width;
      v158.size.height = height;
      v124 = CGRectGetMidX(v158);
      v159.origin.x = x;
      v159.origin.y = y;
      v159.size.width = width;
      v159.size.height = height;
      v67 = CGRectGetMaxY(v159);
      v160.origin.x = x;
      v160.origin.y = y;
      v160.size.width = width;
      v160.size.height = height;
      v68 = CGRectGetMinX(v160);
      v161.origin.x = x;
      v161.origin.y = y;
      v161.size.width = width;
      v161.size.height = height;
      v69 = CGRectGetMidY(v161);
      v70 = 0;
      v137 = MidX;
      v138 = v130;
      v139 = v128;
      v140 = MidY;
      v141 = v124;
      v142 = v67;
      v71 = &qword_1BE4FD6B0;
      v72 = 1;
      v73 = 3.40282347e38;
      v143 = v68;
      v144 = v69;
      do
      {
        v74 = (v26 - *(CGFloat *)((char *)&v137 + v70 + 8)) * (v26 - *(CGFloat *)((char *)&v137 + v70 + 8));
        if (v74 + (v24 - *(CGFloat *)((char *)&v137 + v70)) * (v24 - *(CGFloat *)((char *)&v137 + v70)) < v73)
        {
          v72 = *v71;
          v73 = v74 + (v24 - *(CGFloat *)((char *)&v137 + v70)) * (v24 - *(CGFloat *)((char *)&v137 + v70));
        }
        v70 += 16;
        ++v71;
      }
      while (v70 != 64);
      v44 = v72 - 1;
      if ((unint64_t)(v72 - 1) < 8)
      {
        v45 = qword_1BE4FD850;
        goto LABEL_54;
      }
    }
    v75 = 0;
    goto LABEL_56;
  }
  if (v9 >= 8
    && (unint64_t)(-[PKPaletteHostView palettePosition](self, "palettePosition") - 5) >= 4
    && -[PKPaletteHostView panGestureDidStartInPaletteScrollView](self, "panGestureDidStartInPaletteScrollView"))
  {
    v21 = -[PKPaletteHostView paletteScrollGestureShouldScroll](self, "paletteScrollGestureShouldScroll") ^ 1;
  }
  else
  {
    v21 = 1;
  }
  -[PKPaletteHostView setPanGestureShouldDragPaletteView:](self, "setPanGestureShouldDragPaletteView:", v21);
  if (-[PKPaletteHostView panGestureDidStartInPaletteScrollView](self, "panGestureDidStartInPaletteScrollView"))
  {
    -[PKPaletteHostView paletteView](self, "paletteView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contentScrollView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v47);
    v49 = v48;
    v51 = v50;

    -[PKPaletteHostView paletteView](self, "paletteView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "contentScrollView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v53);
    v55 = v54;
    v57 = v56;

    v58 = -[PKPaletteHostView palettePosition](self, "palettePosition") & 0xFFFFFFFFFFFFFFFDLL;
    if (v51 < 0.0)
      v51 = -v51;
    v60 = v51 > 20.0 && v58 == 1;
    v61 = -[PKPaletteHostView palettePosition](self, "palettePosition");
    v63 = v61 == 2 || v61 == 4;
    if (v49 < 0.0)
      v49 = -v49;
    v64 = v49 > 20.0 && v63;
    if ((-[PKPaletteHostView palettePosition](self, "palettePosition") & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v65 = -v55;
      if (v55 >= 0.0)
        v65 = v55;
      v66 = v65 > 4500.0 || v49 > 250.0;
    }
    else
    {
      v66 = 0;
    }
    v85 = -[PKPaletteHostView palettePosition](self, "palettePosition");
    if (v85 == 4 || v85 == 2)
    {
      v86 = -v57;
      if (v57 >= 0.0)
        v86 = v57;
      if (v86 > 4500.0)
        goto LABEL_68;
      v87 = v51 > 250.0;
    }
    else
    {
      v87 = 0;
    }
    if (v60 || v64 || v66 || v87)
    {
LABEL_68:
      -[PKPaletteHostView setPanGestureShouldDragPaletteView:](self, "setPanGestureShouldDragPaletteView:", 1);
      -[PKPaletteHostView setPaletteScrollGestureShouldScroll:](self, "setPaletteScrollGestureShouldScroll:", 0);
      -[PKPaletteHostView paletteView](self, "paletteView");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "contentScrollView");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "contentOffset");
      v91 = v90;
      v93 = v92;

      -[PKPaletteHostView paletteView](self, "paletteView");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "contentScrollView");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setScrollEnabled:", 0);

      -[PKPaletteHostView paletteView](self, "paletteView");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "contentScrollView");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setContentOffset:", v91, v93);

    }
  }
  if (-[PKPaletteHostView panGestureShouldDragPaletteView](self, "panGestureShouldDragPaletteView"))
  {
    objc_msgSend(v4, "locationInView:", self);
    v99 = v98;
    v101 = v100;
    -[PKPaletteHostView bounds](self, "bounds");
    -[PKPaletteHostView _scheduleDraggingTransitionToVisualState:](self, "_scheduleDraggingTransitionToVisualState:", _PKPaletteVisualStateForPointInRectToSettle(0, v102, v103, v104, v105, v99, v101));
    objc_msgSend(v4, "translationInView:", self);
    v107 = v106;
    v109 = v108;
    -[PKPaletteHostView draggingInitialPaletteCenterInSelf](self, "draggingInitialPaletteCenterInSelf");
    v111 = v110;
    -[PKPaletteHostView draggingInitialPaletteCenterInSelf](self, "draggingInitialPaletteCenterInSelf");
    v113 = v112;
    v114 = -[PKPaletteHostView paletteDraggingBehavior](self, "paletteDraggingBehavior");
    -[PKPaletteHostView bounds](self, "bounds");
    v115 = CGRectGetMidX(v162);
    -[PKPaletteHostView bounds](self, "bounds");
    v116 = CGRectGetMidY(v163);
    -[PKPaletteHostView paletteTransition](self, "paletteTransition");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v117, "intermediateVisualState");
    if ((unint64_t)(v118 - 4) < 4 || v118 == 1)
    {
      v119 = v109 + v113;
      if (v114)
        v119 = v101;
      v120 = v119 - v116;
      v121 = v107 + v111;
      if (v114)
        v121 = v99;
      v122 = v121 - v115;

    }
    else
    {

      -[PKPaletteHostView setPaletteDraggingBehavior:](self, "setPaletteDraggingBehavior:", 1);
      -[PKPaletteHostView bounds](self, "bounds");
      v122 = v99 - CGRectGetMidX(v164);
      -[PKPaletteHostView bounds](self, "bounds");
      v120 = v101 - CGRectGetMidY(v165);
    }
    -[PKPaletteHostView layoutIfNeeded](self, "layoutIfNeeded");
    v136[0] = MEMORY[0x1E0C809B0];
    v136[1] = 3221225472;
    v136[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke;
    v136[3] = &unk_1E777AEB0;
    v136[4] = self;
    *(double *)&v136[5] = v122;
    *(double *)&v136[6] = v120;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v136, 0, 1.0, 0.15, 0.0, 0.0, 0.0, 0.0);
  }
LABEL_77:

}

uint64_t __40__PKPaletteHostView__panGestureHandler___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_activatePaletteCenterConstraints");
  objc_msgSend(*(id *)(a1 + 32), "_deactivatePaletteEdgeConstraints");
  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "paletteCenterXConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  v4 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "paletteCenterYConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __40__PKPaletteHostView__panGestureHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "paletteView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  objc_msgSend(v3, "_pk_closestContentOffsetFromOffset:");
  v7 = v6;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "paletteView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentOffset:animated:", 0, v7, v9);

}

uint64_t __40__PKPaletteHostView__panGestureHandler___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToDockPaletteToPosition:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __40__PKPaletteHostView__panGestureHandler___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return objc_msgSend(*(id *)(result + 32), "_paletteDidDockToPosition:fromUserReposition:", v1, 1);
  return result;
}

- (void)_scheduleDraggingTransitionToVisualState:(int64_t)a3
{
  if (-[PKPaletteHostView draggingPendingPaletteVisualState](self, "draggingPendingPaletteVisualState") != a3)
  {
    -[PKPaletteHostView setDraggingPendingPaletteVisualState:](self, "setDraggingPendingPaletteVisualState:", a3);
    if ((unint64_t)(a3 - 4) < 4 || a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__processPendingDraggingTransition, 0);
      -[PKPaletteHostView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__processPendingDraggingTransition, 0, 0.3);
    }
    else
    {
      -[PKPaletteHostView _processPendingDraggingTransition](self, "_processPendingDraggingTransition");
    }
  }
}

- (void)_processPendingDraggingTransition
{
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__processPendingDraggingTransition, 0);
  v3 = -[PKPaletteHostView draggingPendingPaletteVisualState](self, "draggingPendingPaletteVisualState");
  if (v3)
    -[PKPaletteHostView _setPaletteVisualState:usingTransition:](self, "_setPaletteVisualState:usingTransition:", v3, 1);
}

- (CGPoint)_projectedLandingPointForGestureRecognizerEnd:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat width;
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[5];
  CGPoint result;
  CGPoint v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v51[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "velocityInView:", self);
  v10 = v9;
  v12 = v11;
  v13 = sqrt(v11 * v11 + v10 * v10);
  -[PKPaletteHostView bounds](self, "bounds");
  v55 = CGRectInset(v54, 20.0, 20.0);
  x = v55.origin.x;
  y = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  v17 = -[PKPaletteHostView paletteVisualState](self, "paletteVisualState") - 1;
  if (v17 > 6)
    v18 = 1350.0;
  else
    v18 = dbl_1BE4FD7E0[v17];
  if (v13 >= v18)
  {
    v19 = v12 * (1.0 / v13);
    v20 = v6 + v10 * (1.0 / v13);
    v43 = v8 + v19;
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    MinX = CGRectGetMinX(v56);
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    *(CGFloat *)v51 = MinX;
    v51[1] = CGRectGetMinY(v57);
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    MaxX = CGRectGetMaxX(v58);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    *(CGFloat *)&v51[2] = MaxX;
    v51[3] = CGRectGetMinY(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    v23 = CGRectGetMaxX(v60);
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    *(CGFloat *)v50 = v23;
    v50[1] = CGRectGetMinY(v61);
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    v24 = CGRectGetMaxX(v62);
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    *(CGFloat *)&v50[2] = v24;
    v50[3] = CGRectGetMaxY(v63);
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v25 = CGRectGetMinX(v64);
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    *(CGFloat *)v49 = v25;
    v49[1] = CGRectGetMaxY(v65);
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    v26 = CGRectGetMaxX(v66);
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    *(CGFloat *)&v49[2] = v26;
    v49[3] = CGRectGetMaxY(v67);
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    v27 = CGRectGetMinX(v68);
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    *(CGFloat *)v48 = v27;
    v48[1] = CGRectGetMinY(v69);
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    v28 = CGRectGetMinX(v70);
    v44 = y;
    v45 = x;
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    v29 = 0;
    *(CGFloat *)&v48[2] = v28;
    v48[3] = CGRectGetMaxY(v71);
    v47[0] = v51;
    v47[1] = v50;
    v47[2] = v49;
    v47[3] = v48;
    v30 = v20 - v6;
    v31 = v43 - v8;
    v32 = -(v20 - v6);
    while (1)
    {
      v33 = (double *)v47[v29];
      v34 = ((v6 - *v33) * (v33[3] - v33[1]) + (v33[1] - v8) * (v33[2] - *v33))
          / ((v33[3] - v33[1]) * v32 + v31 * (v33[2] - *v33));
      if (v34 >= 0.0)
      {
        v35 = v8 + v34 * v31;
        v36 = v6 + v34 * v30;
        -[PKPaletteHostView bounds](self, "bounds");
        v53.x = v36;
        v53.y = v35;
        if (CGRectContainsPoint(v72, v53))
          break;
      }
      if (++v29 == 4)
      {
        v35 = v8;
        v36 = v6;
        break;
      }
    }
    v8 = v35;
    v6 = v36;
    y = v44;
    x = v45;
  }
  _PKPaletteClosestReferencePointFromPointInRect(x, y, width, height, v6, v8);
  v38 = v37;
  v40 = v39;

  v41 = v38;
  v42 = v40;
  result.y = v42;
  result.x = v41;
  return result;
}

- (void)transitionIntermediateVisualStateDidChange:(id)a3
{
  -[PKPaletteHostView _updatePaletteSizeAnimated:](self, "_updatePaletteSizeAnimated:", 1);
  -[PKPaletteHostView _updateToolPreviewMinimizedStateAnimated:](self, "_updateToolPreviewMinimizedStateAnimated:", 1);
  -[PKPaletteHostView _updatePaletteAppearance](self, "_updatePaletteAppearance");
}

- (void)transitionPointingDirectionDidChange:(id)a3
{
  -[PKPaletteHostView _updateToolPreviewRotationAnimated:](self, "_updateToolPreviewRotationAnimated:", 1);
}

- (void)_performAnimated:(BOOL)a3 tracking:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  double v12;
  double v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v8)
  {
    if (v7)
      v12 = 0.86;
    else
      v12 = 0.845;
    if (v7)
      v13 = 0.15;
    else
      v13 = 0.531;
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__PKPaletteHostView__performAnimated_tracking_animations_completion___block_invoke;
    v15[3] = &unk_1E777AF00;
    v16 = v10;
    objc_msgSend(v14, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", v7, v9, v15, v12, v13, 0.0, 0.0, 0.0, 0.0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v9);
    if (v11)
      v11[2](v11, 1);
  }

}

uint64_t __69__PKPaletteHostView__performAnimated_tracking_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateToolPreviewMinimizedStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = -[PKPaletteHostView paletteVisualState](self, "paletteVisualState");
  -[PKPaletteHostView paletteTransition](self, "paletteTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTransitionInProgress");

  if (v7)
  {
    -[PKPaletteHostView paletteTransition](self, "paletteTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "intermediateVisualState");

  }
  -[PKPaletteHostView paletteView](self, "paletteView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToolPreviewMinimized:animated:", v5 == 2, v3);

}

- (void)_updateToolPreviewRotationAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  double v9;
  BOOL v10;
  int64_t v11;
  double v12;
  void *v13;
  void *v14;
  CGAffineTransform v15;
  _QWORD v16[6];

  v3 = a3;
  -[PKPaletteHostView paletteTransition](self, "paletteTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTransitionInProgress");

  if (v6)
  {
    -[PKPaletteHostView paletteTransition](self, "paletteTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "pointingDirection");

    v9 = 1.57079633;
    if (v8 != 2)
      v9 = 0.0;
    v10 = v8 == 1;
  }
  else
  {
    v11 = -[PKPaletteHostView paletteVisualState](self, "paletteVisualState");
    v9 = 1.57079633;
    if (v11 != 6)
      v9 = 0.0;
    v10 = v11 == 7;
  }
  if (v10)
    v12 = -1.57079633;
  else
    v12 = v9;
  if (v3)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__PKPaletteHostView__updateToolPreviewRotationAnimated___block_invoke;
    v16[3] = &unk_1E7778048;
    v16[4] = self;
    *(double *)&v16[5] = v12;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v16, &__block_literal_global_45, 0.845, 0.431, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    -[PKPaletteHostView paletteView](self, "paletteView", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toolPreviewView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeRotation(&v15, v12);
    objc_msgSend(v14, "setTransform:", &v15);

  }
}

void __56__PKPaletteHostView__updateToolPreviewRotationAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolPreviewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeRotation(&v5, *(CGFloat *)(a1 + 40));
  objc_msgSend(v3, "setTransform:", &v5);

  objc_msgSend(*(id *)(a1 + 32), "paletteTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteDidBeginRotationAnimation");

}

- (void)_updatePaletteSizeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  PKPaletteHostView *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[6];

  v3 = a3;
  v5 = -[PKPaletteHostView paletteVisualState](self, "paletteVisualState");
  -[PKPaletteHostView paletteTransition](self, "paletteTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTransitionInProgress");

  if (v7
    && (-[PKPaletteHostView paletteTransition](self, "paletteTransition"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v8, "intermediateVisualState"),
        v8,
        v5 == 3))
  {
    -[PKPaletteHostView paletteTransition](self, "paletteTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pointingDirection");

    v11 = dbl_1BE4FD890[(unint64_t)(v10 - 1) < 2];
    v5 = 3;
LABEL_6:
    if ((unint64_t)(-[PKPaletteHostView palettePosition](self, "palettePosition") - 5) <= 3)
    {
      v13 = -[PKPaletteHostView palettePosition](self, "palettePosition");
      v12 = self;
      v14 = 0;
LABEL_8:
      -[PKPaletteHostView _paletteWillDockToPosition:prepareForExpansion:](v12, "_paletteWillDockToPosition:prepareForExpansion:", v13, v14);
    }
  }
  else
  {
    v11 = 0.531;
    switch(v5)
    {
      case 1:
      case 5:
        v12 = self;
        v13 = 3;
        v14 = 1;
        goto LABEL_8;
      case 2:
      case 3:
        goto LABEL_6;
      case 4:
        -[PKPaletteHostView _paletteWillDockToPosition:prepareForExpansion:](self, "_paletteWillDockToPosition:prepareForExpansion:", 1, 1);
        v5 = 4;
        break;
      case 6:
        -[PKPaletteHostView _paletteWillDockToPosition:prepareForExpansion:](self, "_paletteWillDockToPosition:prepareForExpansion:", 4, 1);
        v5 = 6;
        break;
      case 7:
        -[PKPaletteHostView _paletteWillDockToPosition:prepareForExpansion:](self, "_paletteWillDockToPosition:prepareForExpansion:", 2, 1);
        v5 = 7;
        break;
      default:
        break;
    }
  }
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PKPaletteHostView__updatePaletteSizeAnimated___block_invoke;
  aBlock[3] = &unk_1E7778048;
  aBlock[4] = self;
  aBlock[5] = v5;
  v16 = _Block_copy(aBlock);
  v17 = v16;
  if (v3)
  {
    -[PKPaletteHostView layoutIfNeeded](self, "layoutIfNeeded");
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __48__PKPaletteHostView__updatePaletteSizeAnimated___block_invoke_2;
    v19[3] = &unk_1E7778858;
    v19[4] = self;
    v20 = v17;
    objc_msgSend(v18, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v19, &__block_literal_global_46_0, 0.845, v11, 0.0, 0.0, 0.0, 0.0);

  }
  else
  {
    (*((void (**)(void *))v16 + 2))(v16);
  }

}

void __48__PKPaletteHostView__updatePaletteSizeAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_paletteSizeForVisualState:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "paletteWidthConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v3);

  objc_msgSend(*(id *)(a1 + 32), "paletteHeightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v5);

  v8 = *(_QWORD *)(a1 + 40) - 1;
  if (v8 <= 6 && ((0x79u >> v8) & 1) != 0)
  {
    v9 = qword_1BE4FD818[v8];
    objc_msgSend(*(id *)(a1 + 32), "paletteView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configureForDockedAtEdge:", v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "paletteView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configureForDockedAtCorner");
  }

}

uint64_t __48__PKPaletteHostView__updatePaletteSizeAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "paletteTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paletteDidBeginResizingAnimation");

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CGSize)_paletteSizeForVisualState:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = 1;
  switch(a3)
  {
    case 1:
      -[PKPaletteHostView paletteView](self, "paletteView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paletteSizeForEdge:", 4);
      v7 = v6;

      -[PKPaletteHostView _paletteViewCompactHeight](self, "_paletteViewCompactHeight");
      v9 = v8;
      break;
    case 2:
      -[PKPaletteHostView paletteView](self, "paletteView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "minimizedPaletteSize");
      goto LABEL_10;
    case 3:
      -[PKPaletteHostView paletteView](self, "paletteView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "paletteSizeForEdge:", 4);
      v9 = v14;

      v7 = v9;
      break;
    case 4:
      goto LABEL_9;
    case 5:
      v4 = 4;
      goto LABEL_9;
    case 6:
      v4 = 2;
      goto LABEL_9;
    case 7:
      v4 = 8;
LABEL_9:
      -[PKPaletteHostView paletteView](self, "paletteView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "paletteSizeForEdge:", v4);
LABEL_10:
      v7 = v11;
      v9 = v12;

      break;
    default:
      v7 = *MEMORY[0x1E0C9D820];
      v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }
  v15 = v7;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)_isPaletteAnimating
{
  void *v2;
  char v3;

  -[PKPaletteHostView paletteTransition](self, "paletteTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransitionInProgress");

  return v3;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v7 = a3;
  v8 = a5;
  if (-[PKPaletteHostView isPaletteVisualStateMinimized](self, "isPaletteVisualStateMinimized"))
  {
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v14, 1.15, 1.15);
    v11[1] = 3221225472;
    v13 = v14;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[2] = __65__PKPaletteHostView_pointerInteraction_willEnterRegion_animator___block_invoke;
    v11[3] = &unk_1E777AF88;
    v12 = v9;
    v10 = v9;
    objc_msgSend(v8, "addAnimations:", v11);

  }
}

void __65__PKPaletteHostView_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;

  objc_msgSend(*(id *)(a1 + 32), "paletteView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTransform:", &v2);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a5;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PKPaletteHostView_pointerInteraction_willExitRegion_animator___block_invoke;
  v9[3] = &unk_1E7778020;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v6, "addAnimations:", v9);

}

void __64__PKPaletteHostView_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "paletteView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3B38], "systemPointerStyle", a3, a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteHostView;
  -[PKPaletteHostView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[PKPaletteHostView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteHostView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_11;
  }
  else
  {

  }
  -[PKPaletteHostView _updatePaletteViewSizeConstraints](self, "_updatePaletteViewSizeConstraints");
  if (-[PKPaletteHostView _shouldBeCompact](self, "_shouldBeCompact"))
  {
    -[PKPaletteHostView setLastNonCompactPalettePosition:](self, "setLastNonCompactPalettePosition:", -[PKPaletteHostView palettePosition](self, "palettePosition"));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__PKPaletteHostView_traitCollectionDidChange___block_invoke;
    v12[3] = &unk_1E7778020;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v12);
  }
  else
  {
    v10 = -[PKPaletteHostView lastNonCompactPalettePosition](self, "lastNonCompactPalettePosition");
    if (v10)
      v11 = v10;
    else
      v11 = 3;
    -[PKPaletteHostView _dockPaletteToPosition:animated:](self, "_dockPaletteToPosition:animated:", v11, 0);
  }
LABEL_11:
  -[PKPaletteHostView _updatePaletteAppearance](self, "_updatePaletteAppearance");

}

uint64_t __46__PKPaletteHostView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fixToBottomEdge");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_shouldBeCompact
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaletteHostView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHostView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (BOOL)isPaletteVisualStateMinimized
{
  return -[PKPaletteHostView paletteVisualState](self, "paletteVisualState") == 2;
}

- (void)paletteViewShowFeedbackForToolChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PKPaletteHostView _installPencilInteractionFeedbackHostViewIfNeeded](self, "_installPencilInteractionFeedbackHostViewIfNeeded", a3);
  -[PKPaletteHostView pencilInteractionFeedbackHostView](self, "pencilInteractionFeedbackHostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHostView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  -[PKPaletteHostView pencilInteractionFeedbackHostView](self, "pencilInteractionFeedbackHostView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showFeedbackForCurrentlySelectedToolInPaletteView");

}

- (void)paletteViewContentSizeDidChange:(id)a3
{
  -[PKPaletteHostView _updatePaletteSizeAnimated:](self, "_updatePaletteSizeAnimated:", 0);
}

- (void)paletteViewReturnKeyTypeDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if ((unint64_t)(objc_msgSend(v8, "palettePosition") - 5) <= 3
    && objc_msgSend(v8, "shouldExpandFromCorner"))
  {
    -[PKPaletteHostView paletteView](self, "paletteView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView paletteView](self, "paletteView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "edgeLocationToDockFromCorner:", objc_msgSend(v5, "autoHideCorner"));

    if ((unint64_t)(v6 - 1) > 7)
      v7 = 0;
    else
      v7 = qword_1BE4FD850[v6 - 1];
    -[PKPaletteHostView _dockPaletteToPosition:animated:](self, "_dockPaletteToPosition:animated:", v7, -[PKPaletteHostView isPaletteVisible](self, "isPaletteVisible"));
  }

}

- (void)paletteViewStateDidChange:(id)a3 updatePaletteAppearance:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[PKPaletteHostView _updatePaletteViewSizeConstraints](self, "_updatePaletteViewSizeConstraints", a3);
  if (v4)
    -[PKPaletteHostView _updatePaletteAppearance](self, "_updatePaletteAppearance");
}

- (void)paletteViewStateDidChangeScaleFactor:(id)a3
{
  -[PKPaletteHostView _updatePaletteViewSizeConstraints](self, "_updatePaletteViewSizeConstraints", a3);
  -[PKPaletteHostView _updateConstraintsToDockPaletteToPosition:](self, "_updateConstraintsToDockPaletteToPosition:", -[PKPaletteHostView palettePosition](self, "palettePosition"));
}

- (void)paletteViewStateDidChangeAutoHide:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend(a3, "isAutoHideEnabled"))
  {
    -[PKPaletteHostView _dockPaletteToAutoHideCornerAnimated:](self, "_dockPaletteToAutoHideCornerAnimated:", 1);
  }
  else
  {
    -[PKPaletteHostView paletteView](self, "paletteView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHostView paletteView](self, "paletteView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "edgeLocationToDockFromCorner:", objc_msgSend(v5, "autoHideCorner"));

    if ((unint64_t)(v6 - 1) > 7)
      v7 = 0;
    else
      v7 = qword_1BE4FD850[v6 - 1];
    -[PKPaletteHostView _dockPaletteToPosition:animated:](self, "_dockPaletteToPosition:animated:", v7, 1);
  }
}

- (id)paletteShadowColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteShadowColor");
}

- (id)paletteBorderColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaletteHostView paletteView](self, "paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHostView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "borderColorForTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)paletteShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)paletteShadowOpacity
{
  void *v2;
  double v3;
  double v4;

  -[PKPaletteHostView paletteView](self, "paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOpacity");
  v4 = v3;

  return v4;
}

- (double)paletteShadowRadius
{
  void *v2;
  double v3;
  double v4;

  -[PKPaletteHostView paletteView](self, "paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowRadius");
  v4 = v3;

  return v4;
}

- (double)paletteBorderWidth
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PKPaletteHostView paletteView](self, "paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHostView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "borderWidthForTraitCollection:", v5);
  v7 = v6;

  return v7;
}

- (double)paletteSpringAnimationDampingRatio
{
  return 0.845;
}

- (double)paletteSpringAnimationResponse
{
  return 0.531;
}

- (double)paletteEdgeSpacing
{
  return 20.0;
}

- (double)paletteEdgeSpacingForMinimized
{
  return 30.0;
}

- (PKPaletteTooltipPresentationHandle)tooltipPresentationHandle
{
  return self->_tooltipPresentationHandle;
}

- (PKPaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_paletteView, a3);
}

- (double)paletteViewBottomEdgeSpacing
{
  return self->_paletteViewBottomEdgeSpacing;
}

- (BOOL)isPaletteVisible
{
  return self->_paletteVisible;
}

- (PKPaletteHostViewDelegate)delegate
{
  return (PKPaletteHostViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEffectivePaletteVisible
{
  return self->_effectivePaletteVisible;
}

- (void)setEffectivePaletteVisible:(BOOL)a3
{
  self->_effectivePaletteVisible = a3;
}

- (NSLayoutConstraint)paletteWidthConstraint
{
  return self->_paletteWidthConstraint;
}

- (void)setPaletteWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteWidthConstraint, a3);
}

- (NSLayoutConstraint)paletteHeightConstraint
{
  return self->_paletteHeightConstraint;
}

- (void)setPaletteHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteHeightConstraint, a3);
}

- (NSLayoutConstraint)paletteTopConstraint
{
  return self->_paletteTopConstraint;
}

- (void)setPaletteTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteTopConstraint, a3);
}

- (NSLayoutConstraint)paletteBottomConstraint
{
  return self->_paletteBottomConstraint;
}

- (void)setPaletteBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteBottomConstraint, a3);
}

- (NSLayoutConstraint)paletteLeftConstraint
{
  return self->_paletteLeftConstraint;
}

- (void)setPaletteLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteLeftConstraint, a3);
}

- (NSLayoutConstraint)paletteRightConstraint
{
  return self->_paletteRightConstraint;
}

- (void)setPaletteRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteRightConstraint, a3);
}

- (NSLayoutConstraint)paletteCenterXConstraint
{
  return self->_paletteCenterXConstraint;
}

- (void)setPaletteCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteCenterXConstraint, a3);
}

- (NSLayoutConstraint)paletteCenterYConstraint
{
  return self->_paletteCenterYConstraint;
}

- (void)setPaletteCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteCenterYConstraint, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (UITapGestureRecognizer)tapToExpandPaletteFromMinimizedGestureRecognizer
{
  return self->_tapToExpandPaletteFromMinimizedGestureRecognizer;
}

- (void)setTapToExpandPaletteFromMinimizedGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToExpandPaletteFromMinimizedGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)touchDownFeedbackGestureRecognizer
{
  return self->_touchDownFeedbackGestureRecognizer;
}

- (void)setTouchDownFeedbackGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_touchDownFeedbackGestureRecognizer, a3);
}

- (int64_t)paletteDraggingBehavior
{
  return self->_paletteDraggingBehavior;
}

- (void)setPaletteDraggingBehavior:(int64_t)a3
{
  self->_paletteDraggingBehavior = a3;
}

- (int64_t)paletteVisualState
{
  return self->_paletteVisualState;
}

- (int64_t)palettePosition
{
  return self->_palettePosition;
}

- (void)setPalettePosition:(int64_t)a3
{
  self->_palettePosition = a3;
}

- (int64_t)lastNonCompactPalettePosition
{
  return self->_lastNonCompactPalettePosition;
}

- (void)setLastNonCompactPalettePosition:(int64_t)a3
{
  self->_lastNonCompactPalettePosition = a3;
}

- (int64_t)draggingPendingPaletteVisualState
{
  return self->_draggingPendingPaletteVisualState;
}

- (void)setDraggingPendingPaletteVisualState:(int64_t)a3
{
  self->_draggingPendingPaletteVisualState = a3;
}

- (CGPoint)draggingInitialPaletteCenterInSelf
{
  double x;
  double y;
  CGPoint result;

  x = self->_draggingInitialPaletteCenterInSelf.x;
  y = self->_draggingInitialPaletteCenterInSelf.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDraggingInitialPaletteCenterInSelf:(CGPoint)a3
{
  self->_draggingInitialPaletteCenterInSelf = a3;
}

- (PKPaletteTransition)paletteTransition
{
  return self->_paletteTransition;
}

- (void)setPaletteTransition:(id)a3
{
  objc_storeStrong((id *)&self->_paletteTransition, a3);
}

- (PKPalettePencilInteractionFeedbackHostView)pencilInteractionFeedbackHostView
{
  return self->_pencilInteractionFeedbackHostView;
}

- (void)setPencilInteractionFeedbackHostView:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackHostView, a3);
}

- (BOOL)panGestureDidStartInPaletteScrollView
{
  return self->_panGestureDidStartInPaletteScrollView;
}

- (void)setPanGestureDidStartInPaletteScrollView:(BOOL)a3
{
  self->_panGestureDidStartInPaletteScrollView = a3;
}

- (BOOL)panGestureShouldDragPaletteView
{
  return self->_panGestureShouldDragPaletteView;
}

- (void)setPanGestureShouldDragPaletteView:(BOOL)a3
{
  self->_panGestureShouldDragPaletteView = a3;
}

- (BOOL)paletteScrollGestureShouldScroll
{
  return self->_paletteScrollGestureShouldScroll;
}

- (void)setPaletteScrollGestureShouldScroll:(BOOL)a3
{
  self->_paletteScrollGestureShouldScroll = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackHostView, 0);
  objc_storeStrong((id *)&self->_paletteTransition, 0);
  objc_storeStrong((id *)&self->_touchDownFeedbackGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToExpandPaletteFromMinimizedGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_paletteCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_paletteCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paletteRightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteLeftConstraint, 0);
  objc_storeStrong((id *)&self->_paletteBottomConstraint, 0);
  objc_storeStrong((id *)&self->_paletteTopConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHeightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_tooltipPresentationHandle, 0);
}

@end
