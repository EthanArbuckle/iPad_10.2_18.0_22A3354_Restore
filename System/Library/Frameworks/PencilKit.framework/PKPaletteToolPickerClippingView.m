@implementation PKPaletteToolPickerClippingView

- (PKPaletteToolPickerClippingView)init
{
  PKPaletteToolPickerClippingView *v2;
  PKPaletteToolPickerClippingView *v3;
  PKPaletteToolPickerBackgroundContentView *v4;
  PKPaletteToolPickerBackgroundContentView *backgroundContentView;
  UIView *v6;
  UIView *contentView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPalettePassthroughView *v17;
  PKPalettePassthroughView *contentOverlayView;
  PKPaletteToolPickerClippingEdgeView *v19;
  PKPaletteToolPickerClippingEdgeView *leadingEdgeView;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *leadingEdgeViewTopConstraint;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PKPaletteToolPickerClippingEdgeView *v33;
  PKPaletteToolPickerClippingEdgeView *trailingEdgeView;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSLayoutConstraint *trailingEdgeViewTopConstraint;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  PKPaletteToolPickerClippingEdgeView *v47;
  PKPaletteToolPickerClippingEdgeView *topEdgeView;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSLayoutConstraint *topEdgeViewTrailingConstraint;
  void *v54;
  void *v55;
  uint64_t v56;
  NSLayoutConstraint *topEdgeViewLeadingConstraint;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  PKPaletteToolPickerClippingEdgeView *v63;
  PKPaletteToolPickerClippingEdgeView *bottomEdgeView;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSLayoutConstraint *bottomEdgeViewTrailingConstraint;
  void *v71;
  void *v72;
  uint64_t v73;
  NSLayoutConstraint *bottomEdgeViewLeadingConstraint;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSArray *edgeViews;
  uint64_t v82;
  NSArray *edgeViewThicknessConstraints;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  objc_super v95;
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[6];

  v102[4] = *MEMORY[0x1E0C80C00];
  v95.receiver = self;
  v95.super_class = (Class)PKPaletteToolPickerClippingView;
  v2 = -[PKPaletteToolPickerClippingView init](&v95, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 1.0;
    v4 = objc_alloc_init(PKPaletteToolPickerBackgroundContentView);
    backgroundContentView = v3->_backgroundContentView;
    v3->_backgroundContentView = v4;

    -[PKPaletteToolPickerBackgroundContentView setSemanticContentAttribute:](v3->_backgroundContentView, "setSemanticContentAttribute:", 3);
    -[PKPaletteToolPickerClippingView addSubview:](v3, "addSubview:", v3->_backgroundContentView);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v3->_contentView;
    v3->_contentView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteToolPickerClippingView addSubview:](v3, "addSubview:", v3->_contentView);
    v85 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v3->_contentView, "topAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerClippingView topAnchor](v3, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v89);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v88;
    -[UIView leadingAnchor](v3->_contentView, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerClippingView leadingAnchor](v3, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v9;
    -[UIView trailingAnchor](v3->_contentView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerClippingView trailingAnchor](v3, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v102[2] = v12;
    -[UIView bottomAnchor](v3->_contentView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerClippingView bottomAnchor](v3, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v102[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "activateConstraints:", v16);

    v17 = objc_alloc_init(PKPalettePassthroughView);
    contentOverlayView = v3->_contentOverlayView;
    v3->_contentOverlayView = v17;

    -[PKPalettePassthroughView setSemanticContentAttribute:](v3->_contentOverlayView, "setSemanticContentAttribute:", 3);
    -[PKPaletteToolPickerClippingView addSubview:](v3, "addSubview:", v3->_contentOverlayView);
    v3->_layoutAxis = 0;
    v19 = objc_alloc_init(PKPaletteToolPickerClippingEdgeView);
    leadingEdgeView = v3->_leadingEdgeView;
    v3->_leadingEdgeView = v19;

    -[PKPaletteToolPickerClippingEdgeView setTranslatesAutoresizingMaskIntoConstraints:](v3->_leadingEdgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPalettePassthroughView addSubview:](v3->_contentOverlayView, "addSubview:", v3->_leadingEdgeView);
    -[PKPaletteToolPickerClippingEdgeView widthAnchor](v3->_leadingEdgeView, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 0.0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaletteToolPickerClippingEdgeView topAnchor](v3->_leadingEdgeView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView topAnchor](v3->_contentOverlayView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    leadingEdgeViewTopConstraint = v3->_leadingEdgeViewTopConstraint;
    v3->_leadingEdgeViewTopConstraint = (NSLayoutConstraint *)v24;

    v92 = (void *)MEMORY[0x1E0CB3718];
    v101[0] = v3->_leadingEdgeViewTopConstraint;
    -[PKPaletteToolPickerClippingEdgeView leadingAnchor](v3->_leadingEdgeView, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView leadingAnchor](v3->_contentOverlayView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v28;
    -[PKPaletteToolPickerClippingEdgeView bottomAnchor](v3->_leadingEdgeView, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView bottomAnchor](v3->_contentOverlayView, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v101[2] = v31;
    v101[3] = v90;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "activateConstraints:", v32);

    v33 = objc_alloc_init(PKPaletteToolPickerClippingEdgeView);
    trailingEdgeView = v3->_trailingEdgeView;
    v3->_trailingEdgeView = v33;

    -[PKPaletteToolPickerClippingEdgeView setTranslatesAutoresizingMaskIntoConstraints:](v3->_trailingEdgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPalettePassthroughView addSubview:](v3->_contentOverlayView, "addSubview:", v3->_trailingEdgeView);
    -[PKPaletteToolPickerClippingEdgeView widthAnchor](v3->_trailingEdgeView, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", 0.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaletteToolPickerClippingEdgeView topAnchor](v3->_trailingEdgeView, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView topAnchor](v3->_contentOverlayView, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
    trailingEdgeViewTopConstraint = v3->_trailingEdgeViewTopConstraint;
    v3->_trailingEdgeViewTopConstraint = (NSLayoutConstraint *)v38;

    v93 = (void *)MEMORY[0x1E0CB3718];
    v100[0] = v3->_trailingEdgeViewTopConstraint;
    -[PKPaletteToolPickerClippingEdgeView trailingAnchor](v3->_trailingEdgeView, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView trailingAnchor](v3->_contentOverlayView, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v42;
    -[PKPaletteToolPickerClippingEdgeView bottomAnchor](v3->_trailingEdgeView, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView bottomAnchor](v3->_contentOverlayView, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v100[2] = v45;
    v100[3] = v87;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "activateConstraints:", v46);

    v47 = objc_alloc_init(PKPaletteToolPickerClippingEdgeView);
    topEdgeView = v3->_topEdgeView;
    v3->_topEdgeView = v47;

    -[PKPaletteToolPickerClippingEdgeView setTranslatesAutoresizingMaskIntoConstraints:](v3->_topEdgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPalettePassthroughView addSubview:](v3->_contentOverlayView, "addSubview:", v3->_topEdgeView);
    -[PKPaletteToolPickerClippingEdgeView heightAnchor](v3->_topEdgeView, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToConstant:", 0.0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaletteToolPickerClippingEdgeView trailingAnchor](v3->_topEdgeView, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView trailingAnchor](v3->_contentOverlayView, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = objc_claimAutoreleasedReturnValue();
    topEdgeViewTrailingConstraint = v3->_topEdgeViewTrailingConstraint;
    v3->_topEdgeViewTrailingConstraint = (NSLayoutConstraint *)v52;

    -[PKPaletteToolPickerClippingEdgeView leadingAnchor](v3->_topEdgeView, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView leadingAnchor](v3->_contentOverlayView, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v55);
    v56 = objc_claimAutoreleasedReturnValue();
    topEdgeViewLeadingConstraint = v3->_topEdgeViewLeadingConstraint;
    v3->_topEdgeViewLeadingConstraint = (NSLayoutConstraint *)v56;

    v58 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteToolPickerClippingEdgeView topAnchor](v3->_topEdgeView, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView topAnchor](v3->_contentOverlayView, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v61;
    v99[1] = v3->_topEdgeViewLeadingConstraint;
    v99[2] = v3->_topEdgeViewTrailingConstraint;
    v99[3] = v94;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "activateConstraints:", v62);

    v63 = objc_alloc_init(PKPaletteToolPickerClippingEdgeView);
    bottomEdgeView = v3->_bottomEdgeView;
    v3->_bottomEdgeView = v63;

    -[PKPaletteToolPickerClippingEdgeView setTranslatesAutoresizingMaskIntoConstraints:](v3->_bottomEdgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPalettePassthroughView addSubview:](v3->_contentOverlayView, "addSubview:", v3->_bottomEdgeView);
    -[PKPaletteToolPickerClippingEdgeView heightAnchor](v3->_bottomEdgeView, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToConstant:", 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaletteToolPickerClippingEdgeView trailingAnchor](v3->_bottomEdgeView, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView trailingAnchor](v3->_contentOverlayView, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v68);
    v69 = objc_claimAutoreleasedReturnValue();
    bottomEdgeViewTrailingConstraint = v3->_bottomEdgeViewTrailingConstraint;
    v3->_bottomEdgeViewTrailingConstraint = (NSLayoutConstraint *)v69;

    -[PKPaletteToolPickerClippingEdgeView leadingAnchor](v3->_bottomEdgeView, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView leadingAnchor](v3->_contentOverlayView, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = objc_claimAutoreleasedReturnValue();
    bottomEdgeViewLeadingConstraint = v3->_bottomEdgeViewLeadingConstraint;
    v3->_bottomEdgeViewLeadingConstraint = (NSLayoutConstraint *)v73;

    v75 = (void *)MEMORY[0x1E0CB3718];
    v98[0] = v3->_bottomEdgeViewLeadingConstraint;
    v98[1] = v3->_bottomEdgeViewTrailingConstraint;
    -[PKPaletteToolPickerClippingEdgeView bottomAnchor](v3->_bottomEdgeView, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePassthroughView bottomAnchor](v3->_contentOverlayView, "bottomAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v78;
    v98[3] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "activateConstraints:", v79);

    v97[0] = v3->_leadingEdgeView;
    v97[1] = v3->_trailingEdgeView;
    v97[2] = v3->_topEdgeView;
    v97[3] = v3->_bottomEdgeView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 4);
    v80 = objc_claimAutoreleasedReturnValue();
    edgeViews = v3->_edgeViews;
    v3->_edgeViews = (NSArray *)v80;

    v96[0] = v90;
    v96[1] = v87;
    v96[2] = v94;
    v96[3] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 4);
    v82 = objc_claimAutoreleasedReturnValue();
    edgeViewThicknessConstraints = v3->_edgeViewThicknessConstraints;
    v3->_edgeViewThicknessConstraints = (NSArray *)v82;

    -[PKPaletteToolPickerClippingView _updateUI]((uint64_t)v3);
  }
  return v3;
}

- (uint64_t)_updateUI
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _BOOL8 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  v2 = *(_QWORD *)(result + 416);
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 552);
    if (*(_QWORD *)(v2 + 456) == v3
      || (*(_QWORD *)(v2 + 456) = v3,
          -[PKPaletteToolPickerBackgroundContentView _updateUI](v2),
          (v2 = *(_QWORD *)(v1 + 416)) != 0))
    {
      v4 = *(unsigned __int8 *)(v1 + 529);
      if (*(unsigned __int8 *)(v2 + 449) == v4
        || (*(_BYTE *)(v2 + 449) = v4,
            -[PKPaletteToolPickerBackgroundContentView _updateUI](v2),
            (v2 = *(_QWORD *)(v1 + 416)) != 0))
      {
        v5 = *(unsigned __int8 *)(v1 + 530);
        if (*(unsigned __int8 *)(v2 + 450) == v5
          || (*(_BYTE *)(v2 + 450) = v5,
              -[PKPaletteToolPickerBackgroundContentView _updateUI](v2),
              (v2 = *(_QWORD *)(v1 + 416)) != 0))
        {
          v6 = *(unsigned __int8 *)(v1 + 528);
          if (*(unsigned __int8 *)(v2 + 448) != v6)
          {
            *(_BYTE *)(v2 + 448) = v6;
            -[PKPaletteToolPickerBackgroundContentView _updateUI](v2);
          }
        }
      }
    }
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = *(id *)(v1 + 464);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (v12)
        {
          v13 = *(_QWORD *)(v1 + 552);
          if (*(_QWORD *)(v12 + 432) != v13)
          {
            *(_QWORD *)(v12 + 432) = v13;
            -[PKPaletteToolPickerClippingEdgeView _updateUI](v12);
          }
          v14 = *(unsigned __int8 *)(v1 + 528);
          if (*(unsigned __int8 *)(v12 + 424) != v14)
          {
            *(_BYTE *)(v12 + 424) = v14;
            -[PKPaletteToolPickerClippingEdgeView _updateUI](v12);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v9);
  }

  v15 = *(_QWORD *)(v1 + 552);
  if (!v15)
  {
    objc_msgSend(*(id *)(v1 + 432), "setHidden:", *(_BYTE *)(v1 + 529) == 0);
    objc_msgSend(*(id *)(v1 + 440), "setHidden:", *(_BYTE *)(v1 + 530) == 0);
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(v1 + 432), "setHidden:", 1);
  objc_msgSend(*(id *)(v1 + 440), "setHidden:", 1);
  if (v15 != 1)
  {
LABEL_27:
    v16 = 1;
    objc_msgSend(*(id *)(v1 + 448), "setHidden:", 1);
    goto LABEL_28;
  }
  objc_msgSend(*(id *)(v1 + 448), "setHidden:", *(unsigned __int8 *)(v1 + 529) == 0);
  v16 = *(_BYTE *)(v1 + 530) == 0;
LABEL_28:
  objc_msgSend(*(id *)(v1 + 456), "setHidden:", v16);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = *(id *)(v1 + 472);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend((id)v1, "scalingFactor", (_QWORD)v31);
        UIRoundToViewScale();
        objc_msgSend(v22, "setConstant:");
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v19);
  }

  objc_msgSend((id)v1, "scalingFactor");
  v24 = v23;
  v25 = -(v23 * 6.0);
  v26 = 0.0;
  if (v15)
    v27 = 0.0;
  else
    v27 = -(v23 * 6.0);
  objc_msgSend(*(id *)(v1 + 480), "setConstant:", v27, (_QWORD)v31);
  objc_msgSend(*(id *)(v1 + 488), "setConstant:", v27);
  if (v15 == 1)
  {
    v26 = v24 * 6.0;
    if (*(_BYTE *)(v1 + 528))
      v28 = 0.0;
    else
      v28 = v24 * 6.0;
    objc_msgSend(*(id *)(v1 + 504), "setConstant:", v28);
    if (*(_BYTE *)(v1 + 528))
      v26 = 0.0;
  }
  else
  {
    objc_msgSend(*(id *)(v1 + 504), "setConstant:", 0.0);
  }
  objc_msgSend(*(id *)(v1 + 520), "setConstant:", v26);
  if (*(_BYTE *)(v1 + 528))
    v29 = v25;
  else
    v29 = 0.0;
  objc_msgSend(*(id *)(v1 + 496), "setConstant:", v29);
  if (*(_BYTE *)(v1 + 528))
    v30 = v25;
  else
    v30 = 0.0;
  return objc_msgSend(*(id *)(v1 + 512), "setConstant:", v30);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteToolPickerClippingView;
  -[PKPaletteToolPickerClippingView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaletteToolPickerClippingView bounds](self, "bounds");
  -[PKPaletteToolPickerBackgroundContentView setFrame:](self->_backgroundContentView, "setFrame:");
  -[PKPaletteToolPickerClippingView bounds](self, "bounds");
  -[PKPalettePassthroughView setFrame:](self->_contentOverlayView, "setFrame:");
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteToolPickerClippingView _updateUI]((uint64_t)self);
  }
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bottomEdgeViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomEdgeViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topEdgeViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_topEdgeViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingEdgeViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_leadingEdgeViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_edgeViewThicknessConstraints, 0);
  objc_storeStrong((id *)&self->_edgeViews, 0);
  objc_storeStrong((id *)&self->_bottomEdgeView, 0);
  objc_storeStrong((id *)&self->_topEdgeView, 0);
  objc_storeStrong((id *)&self->_trailingEdgeView, 0);
  objc_storeStrong((id *)&self->_leadingEdgeView, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_backgroundContentView, 0);
}

@end
