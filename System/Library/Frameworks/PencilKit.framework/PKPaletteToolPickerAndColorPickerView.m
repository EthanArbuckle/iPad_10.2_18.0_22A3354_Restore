@implementation PKPaletteToolPickerAndColorPickerView

- (PKPaletteToolPickerAndColorPickerView)init
{
  PKPaletteToolPickerAndColorPickerView *v2;
  PKPaletteToolPickerAndColorPickerView *v3;
  uint64_t v4;
  NSMutableDictionary *lassoToolEditingViewForIdentifierTable;
  UIStackView *v6;
  UIStackView *stackView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKPaletteToolPickerContainerView *v16;
  PKPaletteToolPickerContainerView *toolPickerContainerView;
  void *v18;
  void *v19;
  uint64_t v20;
  NSLayoutConstraint *toolPickerContainerViewHeightConstraint;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *toolPickerContainerViewWidthConstraint;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *compactToolPickerContainerViewWidthConstraint;
  void *v29;
  void *v30;
  uint64_t v31;
  NSLayoutConstraint *compactToolPickerContainerViewHeightConstraint;
  double v33;
  double v34;
  PKPaletteColorPickerContainerView *v35;
  PKPaletteColorPickerContainerView *colorPickerContainerView;
  void *v37;
  uint64_t v38;
  NSLayoutConstraint *compactColorPickerContainerViewWidthConstraint;
  void *v40;
  uint64_t v41;
  NSLayoutConstraint *compactColorPickerContainerViewHeightConstraint;
  UIView *v43;
  UIView *lassoToolEditingContainerView;
  void *v45;
  uint64_t v46;
  NSLayoutConstraint *lassoToolEditingContainerViewWidthConstraint;
  void *v48;
  uint64_t v49;
  NSLayoutConstraint *lassoToolEditingContainerViewHeightConstraint;
  void *v51;
  uint64_t v52;
  NSLayoutConstraint *lassoToolEditingContainerViewCompactWidthConstraint;
  void *v54;
  void *v55;
  uint64_t v56;
  NSLayoutConstraint *lassoToolEditingContainerViewCompactHeightConstraint;
  double v58;
  double v59;
  UIView *v60;
  UIView *lassoToolEditingViewForNilIdentifier;
  PKDrawingPaletteInputAssistantView *v62;
  PKDrawingPaletteInputAssistantView *paletteInputAssistantView;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v71;
  _QWORD v72[5];

  v72[4] = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)PKPaletteToolPickerAndColorPickerView;
  v2 = -[PKPaletteToolPickerAndColorPickerView init](&v71, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 1.0;
    v2->_wantsColorPickerContainerViewInHierarchy = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    lassoToolEditingViewForIdentifierTable = v3->_lassoToolEditingViewForIdentifierTable;
    v3->_lassoToolEditingViewForIdentifierTable = (NSMutableDictionary *)v4;

    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v3->_stackView;
    v3->_stackView = v6;

    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteToolPickerAndColorPickerView addSubview:](v3, "addSubview:", v3->_stackView);
    v65 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView topAnchor](v3->_stackView, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView topAnchor](v3, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v68;
    -[UIStackView bottomAnchor](v3->_stackView, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView bottomAnchor](v3, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v8;
    -[UIStackView leftAnchor](v3->_stackView, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView leftAnchor](v3, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v11;
    -[UIStackView rightAnchor](v3->_stackView, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView rightAnchor](v3, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v72[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v15);

    v16 = objc_alloc_init(PKPaletteToolPickerContainerView);
    toolPickerContainerView = v3->_toolPickerContainerView;
    v3->_toolPickerContainerView = v16;

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_toolPickerContainerView);
    -[PKPaletteToolPickerContainerView heightAnchor](v3->_toolPickerContainerView, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](v3->_stackView, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    toolPickerContainerViewHeightConstraint = v3->_toolPickerContainerViewHeightConstraint;
    v3->_toolPickerContainerViewHeightConstraint = (NSLayoutConstraint *)v20;

    -[PKPaletteToolPickerContainerView widthAnchor](v3->_toolPickerContainerView, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView widthAnchor](v3->_stackView, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    toolPickerContainerViewWidthConstraint = v3->_toolPickerContainerViewWidthConstraint;
    v3->_toolPickerContainerViewWidthConstraint = (NSLayoutConstraint *)v24;

    -[PKPaletteToolPickerContainerView widthAnchor](v3->_toolPickerContainerView, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToConstant:", 28.0);
    v27 = objc_claimAutoreleasedReturnValue();
    compactToolPickerContainerViewWidthConstraint = v3->_compactToolPickerContainerViewWidthConstraint;
    v3->_compactToolPickerContainerViewWidthConstraint = (NSLayoutConstraint *)v27;

    -[PKPaletteToolPickerContainerView heightAnchor](v3->_toolPickerContainerView, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](v3->_stackView, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    compactToolPickerContainerViewHeightConstraint = v3->_compactToolPickerContainerViewHeightConstraint;
    v3->_compactToolPickerContainerViewHeightConstraint = (NSLayoutConstraint *)v31;

    LODWORD(v33) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_toolPickerContainerViewWidthConstraint, "setPriority:", v33);
    LODWORD(v34) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_toolPickerContainerViewHeightConstraint, "setPriority:", v34);
    v35 = objc_alloc_init(PKPaletteColorPickerContainerView);
    colorPickerContainerView = v3->_colorPickerContainerView;
    v3->_colorPickerContainerView = v35;

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_colorPickerContainerView);
    -[PKPaletteColorPickerContainerView widthAnchor](v3->_colorPickerContainerView, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", 28.0);
    v38 = objc_claimAutoreleasedReturnValue();
    compactColorPickerContainerViewWidthConstraint = v3->_compactColorPickerContainerViewWidthConstraint;
    v3->_compactColorPickerContainerViewWidthConstraint = (NSLayoutConstraint *)v38;

    -[PKPaletteColorPickerContainerView heightAnchor](v3->_colorPickerContainerView, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 28.0);
    v41 = objc_claimAutoreleasedReturnValue();
    compactColorPickerContainerViewHeightConstraint = v3->_compactColorPickerContainerViewHeightConstraint;
    v3->_compactColorPickerContainerViewHeightConstraint = (NSLayoutConstraint *)v41;

    v43 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    lassoToolEditingContainerView = v3->_lassoToolEditingContainerView;
    v3->_lassoToolEditingContainerView = v43;

    -[UIView setClipsToBounds:](v3->_lassoToolEditingContainerView, "setClipsToBounds:", 1);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_lassoToolEditingContainerView);
    -[UIView widthAnchor](v3->_lassoToolEditingContainerView, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 0.0);
    v46 = objc_claimAutoreleasedReturnValue();
    lassoToolEditingContainerViewWidthConstraint = v3->_lassoToolEditingContainerViewWidthConstraint;
    v3->_lassoToolEditingContainerViewWidthConstraint = (NSLayoutConstraint *)v46;

    -[UIView heightAnchor](v3->_lassoToolEditingContainerView, "heightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToConstant:", 0.0);
    v49 = objc_claimAutoreleasedReturnValue();
    lassoToolEditingContainerViewHeightConstraint = v3->_lassoToolEditingContainerViewHeightConstraint;
    v3->_lassoToolEditingContainerViewHeightConstraint = (NSLayoutConstraint *)v49;

    -[UIView widthAnchor](v3->_lassoToolEditingContainerView, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToConstant:", 200.0);
    v52 = objc_claimAutoreleasedReturnValue();
    lassoToolEditingContainerViewCompactWidthConstraint = v3->_lassoToolEditingContainerViewCompactWidthConstraint;
    v3->_lassoToolEditingContainerViewCompactWidthConstraint = (NSLayoutConstraint *)v52;

    -[UIView heightAnchor](v3->_lassoToolEditingContainerView, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](v3->_stackView, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v55);
    v56 = objc_claimAutoreleasedReturnValue();
    lassoToolEditingContainerViewCompactHeightConstraint = v3->_lassoToolEditingContainerViewCompactHeightConstraint;
    v3->_lassoToolEditingContainerViewCompactHeightConstraint = (NSLayoutConstraint *)v56;

    LODWORD(v58) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_lassoToolEditingContainerViewWidthConstraint, "setPriority:", v58);
    LODWORD(v59) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_lassoToolEditingContainerViewHeightConstraint, "setPriority:", v59);
    v60 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    lassoToolEditingViewForNilIdentifier = v3->_lassoToolEditingViewForNilIdentifier;
    v3->_lassoToolEditingViewForNilIdentifier = v60;

    v62 = objc_alloc_init(PKDrawingPaletteInputAssistantView);
    paletteInputAssistantView = v3->_paletteInputAssistantView;
    v3->_paletteInputAssistantView = v62;

    -[PKDrawingPaletteInputAssistantView setTranslatesAutoresizingMaskIntoConstraints:](v3->_paletteInputAssistantView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_paletteInputAssistantView);
    -[PKPaletteToolPickerAndColorPickerView _updateUI](v3, "_updateUI");
  }
  return v3;
}

- (PKPaletteToolPickerView)toolPickerView
{
  void *v2;
  void *v3;

  -[PKPaletteToolPickerAndColorPickerView toolPickerContainerView](self, "toolPickerContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaletteToolPickerView *)v3;
}

- (PKPaletteColorPickerView)colorPickerView
{
  void *v2;
  void *v3;

  -[PKPaletteToolPickerAndColorPickerView colorPickerContainerView](self, "colorPickerContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaletteColorPickerView *)v3;
}

- (void)setInputAssistantViewVisible:(BOOL)a3
{
  if (self->_inputAssistantViewVisible != a3)
  {
    self->_inputAssistantViewVisible = a3;
    -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setWantsColorPickerContainerViewInHierarchy:(BOOL)a3
{
  if (self->_wantsColorPickerContainerViewInHierarchy != a3)
  {
    self->_wantsColorPickerContainerViewInHierarchy = a3;
    -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setLassoToolEditingViewVisible:(BOOL)a3
{
  if (self->_lassoToolEditingViewVisible != a3)
  {
    self->_lassoToolEditingViewVisible = a3;
    -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setLassoToolEditingViewIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *lassoToolEditingViewIdentifier;
  NSString *v11;

  v4 = a3;
  v5 = self->_lassoToolEditingViewIdentifier;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v9 = (NSString *)-[NSString copy](v8, "copy");
    lassoToolEditingViewIdentifier = self->_lassoToolEditingViewIdentifier;
    self->_lassoToolEditingViewIdentifier = v9;

    -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
  }
  v8 = v11;
LABEL_10:

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
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
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKPaletteToolPickerAndColorPickerView toolPickerContainerView](self, "toolPickerContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerAndColorPickerView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[PKPaletteToolPickerAndColorPickerView toolPickerContainerView](self, "toolPickerContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v14;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPaletteToolPickerAndColorPickerView;
    -[PKPaletteToolPickerAndColorPickerView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setCornerLocation:(unint64_t)a3
{
  if (self->_cornerLocation != a3)
  {
    self->_cornerLocation = a3;
    -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setContextEditingMode:(int64_t)a3
{
  if (self->_contextEditingMode != a3)
  {
    self->_contextEditingMode = a3;
    -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
  }
}

- (BOOL)_useCompactSize
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaletteToolPickerAndColorPickerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerAndColorPickerView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *lassoToolEditingViewForIdentifierTable;
  void *v7;
  UIView *v8;
  NSMutableDictionary *v9;
  void *v10;
  UIView *v11;
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  UIView *v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  double v70;
  void *v71;
  unint64_t v72;
  _BOOL4 v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  unint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  UIView *obj;
  _QWORD v109[2];
  _QWORD v110[5];
  _QWORD v111[10];
  _QWORD v112[6];

  v112[4] = *MEMORY[0x1E0C80C00];
  if (-[PKPaletteToolPickerAndColorPickerView wantsColorPickerContainerViewInHierarchy](self, "wantsColorPickerContainerViewInHierarchy")&& !-[PKPaletteToolPickerAndColorPickerView _hasColorPickerContainerView](self, "_hasColorPickerContainerView"))
  {
    -[PKPaletteToolPickerAndColorPickerView stackView](self, "stackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView colorPickerContainerView](self, "colorPickerContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addArrangedSubview:", v4);

    goto LABEL_7;
  }
  if (!-[PKPaletteToolPickerAndColorPickerView wantsColorPickerContainerViewInHierarchy](self, "wantsColorPickerContainerViewInHierarchy")&& -[PKPaletteToolPickerAndColorPickerView _hasColorPickerContainerView](self, "_hasColorPickerContainerView"))
  {
    -[PKPaletteToolPickerAndColorPickerView colorPickerContainerView](self, "colorPickerContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");
LABEL_7:

  }
  -[PKPaletteToolPickerAndColorPickerView lassoToolEditingViewIdentifier](self, "lassoToolEditingViewIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    lassoToolEditingViewForIdentifierTable = self->_lassoToolEditingViewForIdentifierTable;
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingViewIdentifier](self, "lassoToolEditingViewIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](lassoToolEditingViewForIdentifierTable, "objectForKey:", v7);
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v9 = self->_lassoToolEditingViewForIdentifierTable;
      -[PKPaletteToolPickerAndColorPickerView lassoToolEditingViewIdentifier](self, "lassoToolEditingViewIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v8, v10);

    }
  }
  else
  {
    v8 = self->_lassoToolEditingViewForNilIdentifier;
  }
  -[PKPaletteToolPickerAndColorPickerView lassoToolEditingView](self, "lassoToolEditingView");
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  if (v8 != v11)
  {
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingView](self, "lassoToolEditingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerView](self, "lassoToolEditingContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v8);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v97 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v8, "topAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerView](self, "lassoToolEditingContainerView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "topAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v102);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = v101;
    -[UIView leadingAnchor](v8, "leadingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerView](self, "lassoToolEditingContainerView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "leadingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v98);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = v96;
    -[UIView trailingAnchor](v8, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerView](self, "lassoToolEditingContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v112[2] = v17;
    -[UIView bottomAnchor](obj, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerView](self, "lassoToolEditingContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v112[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "activateConstraints:", v22);

    objc_storeStrong((id *)&self->_lassoToolEditingView, obj);
  }
  v23 = -[PKPaletteToolPickerAndColorPickerView isLassoToolEditingViewVisible](self, "isLassoToolEditingViewVisible") ^ 1;
  -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerView](self, "lassoToolEditingContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", v23);

  v25 = -[PKPaletteToolPickerAndColorPickerView isInputAssistantViewVisible](self, "isInputAssistantViewVisible") ^ 1;
  -[PKPaletteToolPickerAndColorPickerView paletteInputAssistantView](self, "paletteInputAssistantView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setHidden:", v25);

  -[PKPaletteToolPickerAndColorPickerView scalingFactor](self, "scalingFactor");
  v28 = v27;
  -[PKPaletteToolPickerAndColorPickerView toolPickerContainerView](self, "toolPickerContainerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setScalingFactor:", v28);

  -[PKPaletteToolPickerAndColorPickerView scalingFactor](self, "scalingFactor");
  v31 = v30;
  -[PKPaletteToolPickerAndColorPickerView colorPickerView](self, "colorPickerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setScalingFactor:", v31);

  -[PKPaletteToolPickerAndColorPickerView scalingFactor](self, "scalingFactor");
  v34 = v33;
  -[PKPaletteToolPickerAndColorPickerView paletteInputAssistantView](self, "paletteInputAssistantView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setScalingFactor:", v34);

  v36 = -[PKPaletteToolPickerAndColorPickerView edgeLocation](self, "edgeLocation");
  -[PKPaletteToolPickerAndColorPickerView toolPickerContainerView](self, "toolPickerContainerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setEdgeLocation:", v36);

  v38 = -[PKPaletteToolPickerAndColorPickerView cornerLocation](self, "cornerLocation");
  -[PKPaletteToolPickerAndColorPickerView toolPickerContainerView](self, "toolPickerContainerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setCornerLocation:", v38);

  v40 = -[PKPaletteToolPickerAndColorPickerView edgeLocation](self, "edgeLocation");
  -[PKPaletteToolPickerAndColorPickerView colorPickerView](self, "colorPickerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setEdgeLocation:", v40);

  v42 = -[PKPaletteToolPickerAndColorPickerView edgeLocation](self, "edgeLocation");
  -[PKPaletteToolPickerAndColorPickerView paletteInputAssistantView](self, "paletteInputAssistantView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setEdgeLocation:", v42);

  -[PKPaletteToolPickerAndColorPickerView _stackViewSpacing](self, "_stackViewSpacing");
  v45 = v44;
  -[PKPaletteToolPickerAndColorPickerView stackView](self, "stackView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setSpacing:", v45);

  v103 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerAndColorPickerView toolPickerContainerViewWidthConstraint](self, "toolPickerContainerViewWidthConstraint");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = v107;
  -[PKPaletteToolPickerAndColorPickerView toolPickerContainerViewHeightConstraint](self, "toolPickerContainerViewHeightConstraint");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v111[1] = v105;
  -[PKPaletteToolPickerAndColorPickerView compactToolPickerContainerViewWidthConstraint](self, "compactToolPickerContainerViewWidthConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v111[2] = v47;
  -[PKPaletteToolPickerAndColorPickerView compactToolPickerContainerViewHeightConstraint](self, "compactToolPickerContainerViewHeightConstraint");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v111[3] = v48;
  -[PKPaletteToolPickerAndColorPickerView compactColorPickerContainerViewWidthConstraint](self, "compactColorPickerContainerViewWidthConstraint");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v111[4] = v49;
  -[PKPaletteToolPickerAndColorPickerView compactColorPickerContainerViewHeightConstraint](self, "compactColorPickerContainerViewHeightConstraint");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v111[5] = v50;
  -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewWidthConstraint](self, "lassoToolEditingContainerViewWidthConstraint");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v111[6] = v51;
  -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewHeightConstraint](self, "lassoToolEditingContainerViewHeightConstraint");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v111[7] = v52;
  -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewCompactWidthConstraint](self, "lassoToolEditingContainerViewCompactWidthConstraint");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v111[8] = v53;
  -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewCompactHeightConstraint](self, "lassoToolEditingContainerViewCompactHeightConstraint");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v111[9] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 10);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "deactivateConstraints:", v55);

  if (-[PKPaletteToolPickerAndColorPickerView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteToolPickerAndColorPickerView stackView](self, "stackView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setAxis:", 0);

    v57 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteToolPickerAndColorPickerView compactToolPickerContainerViewHeightConstraint](self, "compactToolPickerContainerViewHeightConstraint");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v58;
    -[PKPaletteToolPickerAndColorPickerView compactToolPickerContainerViewWidthConstraint](self, "compactToolPickerContainerViewWidthConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v110[1] = v59;
    -[PKPaletteToolPickerAndColorPickerView compactColorPickerContainerViewHeightConstraint](self, "compactColorPickerContainerViewHeightConstraint");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v110[2] = v60;
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewCompactWidthConstraint](self, "lassoToolEditingContainerViewCompactWidthConstraint");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v110[3] = v61;
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewCompactHeightConstraint](self, "lassoToolEditingContainerViewCompactHeightConstraint");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v110[4] = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 5);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v63);

    if (!-[PKPaletteToolPickerAndColorPickerView contextEditingMode](self, "contextEditingMode")
      || -[PKPaletteToolPickerAndColorPickerView contextEditingMode](self, "contextEditingMode") == 3
      || -[PKPaletteToolPickerAndColorPickerView contextEditingMode](self, "contextEditingMode") == 4)
    {
      v64 = 1;
      v65 = 2;
    }
    else
    {
      v64 = 0;
      v65 = 1;
    }
    v66 = obj;
    -[PKPaletteToolPickerAndColorPickerView colorPickerView](self, "colorPickerView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setColorPickerMode:", v65);

    -[PKPaletteToolPickerAndColorPickerView compactColorPickerContainerViewWidthConstraint](self, "compactColorPickerContainerViewWidthConstraint");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setActive:", v64);

    v69 = -[PKPaletteToolPickerAndColorPickerView isLassoToolEditingViewVisible](self, "isLassoToolEditingViewVisible");
    if (v69)
      v70 = 34.0;
    else
      v70 = 28.0;
    if (!v69 && (_DWORD)v64)
    {
      if (PKIsVisionDevice())
      {
        if (PKIsVisionDevice())
          v70 = 534.0;
        else
          v70 = 372.0;
      }
      else
      {
        v70 = 268.0;
      }
      -[PKPaletteToolPickerAndColorPickerView _compactToolsContainerWidth](self, "_compactToolsContainerWidth");
      if (v70 >= v94)
        v70 = v94;
    }
    -[PKPaletteToolPickerAndColorPickerView compactToolPickerContainerViewWidthConstraint](self, "compactToolPickerContainerViewWidthConstraint");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setConstant:", v70);
  }
  else
  {
    -[PKPaletteToolPickerAndColorPickerView colorPickerView](self, "colorPickerView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setColorPickerMode:", 0);

    v72 = -[PKPaletteToolPickerAndColorPickerView edgeLocation](self, "edgeLocation");
    v74 = v72 == 2 || v72 == 8;
    v75 = PKPaletteColorSwatchesSize(v74);
    v77 = v76;
    -[PKPaletteToolPickerAndColorPickerView scalingFactor](self, "scalingFactor");
    v79 = v75 * v78;
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewWidthConstraint](self, "lassoToolEditingContainerViewWidthConstraint");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setConstant:", v79);

    -[PKPaletteToolPickerAndColorPickerView scalingFactor](self, "scalingFactor");
    v82 = v77 * v81;
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewHeightConstraint](self, "lassoToolEditingContainerViewHeightConstraint");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setConstant:", v82);

    v84 = (void *)MEMORY[0x1E0C99DE8];
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewWidthConstraint](self, "lassoToolEditingContainerViewWidthConstraint");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = v85;
    -[PKPaletteToolPickerAndColorPickerView lassoToolEditingContainerViewHeightConstraint](self, "lassoToolEditingContainerViewHeightConstraint");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v109[1] = v86;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "arrayWithArray:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v89 = -[PKPaletteToolPickerAndColorPickerView edgeLocation](self, "edgeLocation");
    if (v89 == 8 || v89 == 2)
    {
      -[PKPaletteToolPickerAndColorPickerView stackView](self, "stackView");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setAxis:", 1);

      -[PKPaletteToolPickerAndColorPickerView toolPickerContainerViewWidthConstraint](self, "toolPickerContainerViewWidthConstraint");
      v91 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPaletteToolPickerAndColorPickerView stackView](self, "stackView");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setAxis:", 0);

      -[PKPaletteToolPickerAndColorPickerView toolPickerContainerViewHeightConstraint](self, "toolPickerContainerViewHeightConstraint");
      v91 = objc_claimAutoreleasedReturnValue();
    }
    v93 = (void *)v91;
    v66 = obj;
    objc_msgSend(v88, "addObject:", v91);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v88);
  }

  -[PKPaletteToolPickerAndColorPickerView colorPickerContainerView](self, "colorPickerContainerView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setLayoutAxis:", 1);

}

- (double)_compactToolsContainerWidth
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;

  -[PKPaletteToolPickerAndColorPickerView toolPickerView](self, "toolPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 0.0;
  -[PKPaletteToolPickerAndColorPickerView toolPickerView](self, "toolPickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)(unint64_t)objc_msgSend(v7, "count");
  -[PKPaletteToolPickerAndColorPickerView toolPickerView](self, "toolPickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toolViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") >= 8)
    v11 = 7.0;
  else
    v11 = 5.0;
  -[PKPaletteToolPickerAndColorPickerView toolPickerView](self, "toolPickerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toolViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11 * (double)(unint64_t)(objc_msgSend(v13, "count") - 1) + v8 * 34.0;

  return v14;
}

- (double)_stackViewSpacing
{
  BOOL v3;
  double result;
  double v5;

  v3 = -[PKPaletteToolPickerAndColorPickerView _useCompactSize](self, "_useCompactSize");
  result = 16.0;
  if (!v3)
  {
    -[PKPaletteToolPickerAndColorPickerView scalingFactor](self, "scalingFactor", 16.0);
    return v5 * 36.0;
  }
  return result;
}

- (BOOL)_hasColorPickerContainerView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[PKPaletteToolPickerAndColorPickerView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerAndColorPickerView colorPickerContainerView](self, "colorPickerContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  -[PKPaletteToolPickerAndColorPickerView toolPickerView](self, "toolPickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PKPaletteToolPickerAndColorPickerView_dismissPalettePopoverWithCompletion___block_invoke;
  v13[3] = &unk_1E7778020;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v6, "dismissPalettePopoverWithCompletion:", v13);

  dispatch_group_enter(v8);
  -[PKPaletteToolPickerAndColorPickerView colorPickerContainerView](self, "colorPickerContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __77__PKPaletteToolPickerAndColorPickerView_dismissPalettePopoverWithCompletion___block_invoke_2;
  v11[3] = &unk_1E7778020;
  v10 = v8;
  v12 = v10;
  objc_msgSend(v9, "dismissPalettePopoverWithCompletion:", v11);

  if (v4)
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v4);

}

void __77__PKPaletteToolPickerAndColorPickerView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PKPaletteToolPickerAndColorPickerView_dismissPalettePopoverWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
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
  v10.super_class = (Class)PKPaletteToolPickerAndColorPickerView;
  -[PKPaletteToolPickerAndColorPickerView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPaletteToolPickerAndColorPickerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteToolPickerAndColorPickerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKPaletteToolPickerAndColorPickerView _updateUI](self, "_updateUI");
LABEL_6:

}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPaletteToolPickerContainerView)toolPickerContainerView
{
  return self->_toolPickerContainerView;
}

- (void)setToolPickerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerContainerView, a3);
}

- (PKPaletteColorPickerContainerView)colorPickerContainerView
{
  return self->_colorPickerContainerView;
}

- (void)setColorPickerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerContainerView, a3);
}

- (BOOL)wantsColorPickerContainerViewInHierarchy
{
  return self->_wantsColorPickerContainerViewInHierarchy;
}

- (NSString)lassoToolEditingViewIdentifier
{
  return self->_lassoToolEditingViewIdentifier;
}

- (UIView)lassoToolEditingView
{
  return self->_lassoToolEditingView;
}

- (BOOL)isLassoToolEditingViewVisible
{
  return self->_lassoToolEditingViewVisible;
}

- (PKDrawingPaletteInputAssistantView)paletteInputAssistantView
{
  return self->_paletteInputAssistantView;
}

- (int64_t)contextEditingMode
{
  return self->_contextEditingMode;
}

- (BOOL)isSmallestSupportedCompactWidth
{
  return self->_isSmallestSupportedCompactWidth;
}

- (void)setIsSmallestSupportedCompactWidth:(BOOL)a3
{
  self->_isSmallestSupportedCompactWidth = a3;
}

- (BOOL)isInputAssistantViewVisible
{
  return self->_inputAssistantViewVisible;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)toolPickerContainerViewWidthConstraint
{
  return self->_toolPickerContainerViewWidthConstraint;
}

- (void)setToolPickerContainerViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerContainerViewWidthConstraint, a3);
}

- (NSLayoutConstraint)toolPickerContainerViewHeightConstraint
{
  return self->_toolPickerContainerViewHeightConstraint;
}

- (void)setToolPickerContainerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerContainerViewHeightConstraint, a3);
}

- (NSLayoutConstraint)compactToolPickerContainerViewWidthConstraint
{
  return self->_compactToolPickerContainerViewWidthConstraint;
}

- (void)setCompactToolPickerContainerViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_compactToolPickerContainerViewWidthConstraint, a3);
}

- (NSLayoutConstraint)compactToolPickerContainerViewHeightConstraint
{
  return self->_compactToolPickerContainerViewHeightConstraint;
}

- (void)setCompactToolPickerContainerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_compactToolPickerContainerViewHeightConstraint, a3);
}

- (NSLayoutConstraint)compactColorPickerContainerViewWidthConstraint
{
  return self->_compactColorPickerContainerViewWidthConstraint;
}

- (void)setCompactColorPickerContainerViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_compactColorPickerContainerViewWidthConstraint, a3);
}

- (NSLayoutConstraint)compactColorPickerContainerViewHeightConstraint
{
  return self->_compactColorPickerContainerViewHeightConstraint;
}

- (void)setCompactColorPickerContainerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_compactColorPickerContainerViewHeightConstraint, a3);
}

- (UIView)lassoToolEditingContainerView
{
  return self->_lassoToolEditingContainerView;
}

- (void)setLassoToolEditingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_lassoToolEditingContainerView, a3);
}

- (NSLayoutConstraint)lassoToolEditingContainerViewWidthConstraint
{
  return self->_lassoToolEditingContainerViewWidthConstraint;
}

- (void)setLassoToolEditingContainerViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewWidthConstraint, a3);
}

- (NSLayoutConstraint)lassoToolEditingContainerViewHeightConstraint
{
  return self->_lassoToolEditingContainerViewHeightConstraint;
}

- (void)setLassoToolEditingContainerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewHeightConstraint, a3);
}

- (NSLayoutConstraint)lassoToolEditingContainerViewCompactWidthConstraint
{
  return self->_lassoToolEditingContainerViewCompactWidthConstraint;
}

- (void)setLassoToolEditingContainerViewCompactWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewCompactWidthConstraint, a3);
}

- (NSLayoutConstraint)lassoToolEditingContainerViewCompactHeightConstraint
{
  return self->_lassoToolEditingContainerViewCompactHeightConstraint;
}

- (void)setLassoToolEditingContainerViewCompactHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewCompactHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewCompactHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewCompactWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingContainerView, 0);
  objc_storeStrong((id *)&self->_compactColorPickerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_compactColorPickerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_compactToolPickerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_compactToolPickerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_paletteInputAssistantView, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingView, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingViewIdentifier, 0);
  objc_storeStrong((id *)&self->_colorPickerContainerView, 0);
  objc_storeStrong((id *)&self->_toolPickerContainerView, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingViewForIdentifierTable, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingViewForNilIdentifier, 0);
}

@end
