@implementation PKPaletteToolPickerContainerView

- (PKPaletteToolPickerContainerView)init
{
  PKPaletteToolPickerContainerView *v2;
  PKPaletteToolPickerContainerView *v3;
  PKPaletteToolPickerView *v4;
  PKPaletteToolPickerView *toolPickerView;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSLayoutConstraint *toolPickerViewTopConstraint;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSLayoutConstraint *toolPickerViewBottomConstraint;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *toolPickerViewLeftConstraint;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *toolPickerViewRightConstraint;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSLayoutConstraint *toolPickerViewCenterXConstraint;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *toolPickerViewCenterYConstraint;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PKPaletteToolPickerContainerView;
  v2 = -[PKPaletteToolPickerContainerView init](&v37, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 1.0;
    v4 = objc_alloc_init(PKPaletteToolPickerView);
    toolPickerView = v3->_toolPickerView;
    v3->_toolPickerView = v4;

    -[PKPaletteToolPickerView setTranslatesAutoresizingMaskIntoConstraints:](v3->_toolPickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteToolPickerContainerView addSubview:](v3, "addSubview:", v3->_toolPickerView);
    -[PKPaletteToolPickerContainerView toolPickerView](v3, "toolPickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerContainerView topAnchor](v3, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    toolPickerViewTopConstraint = v3->_toolPickerViewTopConstraint;
    v3->_toolPickerViewTopConstraint = (NSLayoutConstraint *)v9;

    -[PKPaletteToolPickerContainerView toolPickerView](v3, "toolPickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerContainerView bottomAnchor](v3, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    toolPickerViewBottomConstraint = v3->_toolPickerViewBottomConstraint;
    v3->_toolPickerViewBottomConstraint = (NSLayoutConstraint *)v14;

    -[PKPaletteToolPickerContainerView toolPickerView](v3, "toolPickerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leftAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerContainerView leftAnchor](v3, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    toolPickerViewLeftConstraint = v3->_toolPickerViewLeftConstraint;
    v3->_toolPickerViewLeftConstraint = (NSLayoutConstraint *)v19;

    -[PKPaletteToolPickerContainerView toolPickerView](v3, "toolPickerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerContainerView rightAnchor](v3, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    toolPickerViewRightConstraint = v3->_toolPickerViewRightConstraint;
    v3->_toolPickerViewRightConstraint = (NSLayoutConstraint *)v24;

    -[PKPaletteToolPickerContainerView toolPickerView](v3, "toolPickerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerContainerView centerXAnchor](v3, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    toolPickerViewCenterXConstraint = v3->_toolPickerViewCenterXConstraint;
    v3->_toolPickerViewCenterXConstraint = (NSLayoutConstraint *)v29;

    -[PKPaletteToolPickerContainerView toolPickerView](v3, "toolPickerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerContainerView centerYAnchor](v3, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    toolPickerViewCenterYConstraint = v3->_toolPickerViewCenterYConstraint;
    v3->_toolPickerViewCenterYConstraint = (NSLayoutConstraint *)v34;

    -[PKPaletteToolPickerContainerView _updateUI](v3, "_updateUI");
  }
  return v3;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteToolPickerContainerView _updateUI](self, "_updateUI");
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteToolPickerContainerView _updateUI](self, "_updateUI");
  }
}

- (void)setCornerLocation:(unint64_t)a3
{
  if (self->_cornerLocation != a3)
  {
    self->_cornerLocation = a3;
    -[PKPaletteToolPickerContainerView _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
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
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[4];
  _QWORD v50[8];

  v50[6] = *MEMORY[0x1E0C80C00];
  -[PKPaletteToolPickerContainerView scalingFactor](self, "scalingFactor");
  v4 = v3;
  -[PKPaletteToolPickerContainerView toolPickerView](self, "toolPickerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScalingFactor:", v4);

  v6 = -[PKPaletteToolPickerContainerView edgeLocation](self, "edgeLocation");
  -[PKPaletteToolPickerContainerView toolPickerView](self, "toolPickerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEdgeLocation:", v6);

  v8 = -[PKPaletteToolPickerContainerView cornerLocation](self, "cornerLocation");
  -[PKPaletteToolPickerContainerView toolPickerView](self, "toolPickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerLocation:", v8);

  v10 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerContainerView toolPickerViewTopConstraint](self, "toolPickerViewTopConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v11;
  -[PKPaletteToolPickerContainerView toolPickerViewBottomConstraint](self, "toolPickerViewBottomConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v12;
  -[PKPaletteToolPickerContainerView toolPickerViewLeftConstraint](self, "toolPickerViewLeftConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v13;
  -[PKPaletteToolPickerContainerView toolPickerViewRightConstraint](self, "toolPickerViewRightConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v14;
  -[PKPaletteToolPickerContainerView toolPickerViewCenterXConstraint](self, "toolPickerViewCenterXConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v15;
  -[PKPaletteToolPickerContainerView toolPickerViewCenterYConstraint](self, "toolPickerViewCenterYConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deactivateConstraints:", v17);

  -[PKPaletteToolPickerContainerView toolPickerViewLeftConstraint](self, "toolPickerViewLeftConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", 0.0);

  -[PKPaletteToolPickerContainerView toolPickerViewRightConstraint](self, "toolPickerViewRightConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConstant:", 0.0);

  -[PKPaletteToolPickerContainerView toolPickerViewBottomConstraint](self, "toolPickerViewBottomConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setConstant:", 0.0);

  -[PKPaletteToolPickerContainerView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerContainerView window](self, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "windowScene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = PKUseCompactSize(v21, v23);

  if (!(_DWORD)v10)
  {
    -[PKPaletteToolPickerContainerView scalingFactor](self, "scalingFactor");
    v33 = v32 * 19.0;
    v34 = -[PKPaletteToolPickerContainerView edgeLocation](self, "edgeLocation");
    if (v34 != 8 && v34 != 2)
    {
      -[PKPaletteToolPickerContainerView scalingFactor](self, "scalingFactor");
      v40 = v39 * -4.0;
      -[PKPaletteToolPickerContainerView toolPickerViewCenterXConstraint](self, "toolPickerViewCenterXConstraint");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setConstant:", v40);

      -[PKPaletteToolPickerContainerView toolPickerViewBottomConstraint](self, "toolPickerViewBottomConstraint");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setConstant:", v33);

      v43 = (void *)MEMORY[0x1E0CB3718];
      -[PKPaletteToolPickerContainerView toolPickerViewTopConstraint](self, "toolPickerViewTopConstraint");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPickerContainerView toolPickerViewBottomConstraint](self, "toolPickerViewBottomConstraint", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v28;
      -[PKPaletteToolPickerContainerView toolPickerViewCenterXConstraint](self, "toolPickerViewCenterXConstraint");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47[2] = v29;
      v44 = (void *)MEMORY[0x1E0C99D20];
      v45 = v47;
LABEL_12:
      objc_msgSend(v44, "arrayWithObjects:count:", v45, 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "activateConstraints:", v30);
      goto LABEL_13;
    }
    -[PKPaletteToolPickerContainerView scalingFactor](self, "scalingFactor");
    v36 = v35 * 0.0;
    -[PKPaletteToolPickerContainerView toolPickerViewCenterYConstraint](self, "toolPickerViewCenterYConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setConstant:", v36);

    if (-[PKPaletteToolPickerContainerView edgeLocation](self, "edgeLocation") == 2)
    {
      v33 = -v33;
      -[PKPaletteToolPickerContainerView toolPickerViewLeftConstraint](self, "toolPickerViewLeftConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[PKPaletteToolPickerContainerView edgeLocation](self, "edgeLocation") != 8)
      {
LABEL_11:
        v43 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteToolPickerContainerView toolPickerViewLeftConstraint](self, "toolPickerViewLeftConstraint");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v27;
        -[PKPaletteToolPickerContainerView toolPickerViewRightConstraint](self, "toolPickerViewRightConstraint");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v28;
        -[PKPaletteToolPickerContainerView toolPickerViewCenterYConstraint](self, "toolPickerViewCenterYConstraint");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v48[2] = v29;
        v44 = (void *)MEMORY[0x1E0C99D20];
        v45 = v48;
        goto LABEL_12;
      }
      -[PKPaletteToolPickerContainerView toolPickerViewRightConstraint](self, "toolPickerViewRightConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = v38;
    objc_msgSend(v38, "setConstant:", v33);

    goto LABEL_11;
  }
  -[PKPaletteToolPickerContainerView toolPickerViewLeftConstraint](self, "toolPickerViewLeftConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setConstant:", 0.0);

  -[PKPaletteToolPickerContainerView toolPickerViewRightConstraint](self, "toolPickerViewRightConstraint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setConstant:", -0.0);

  v26 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerContainerView toolPickerViewTopConstraint](self, "toolPickerViewTopConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v27;
  -[PKPaletteToolPickerContainerView toolPickerViewBottomConstraint](self, "toolPickerViewBottomConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v28;
  -[PKPaletteToolPickerContainerView toolPickerViewLeftConstraint](self, "toolPickerViewLeftConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v29;
  -[PKPaletteToolPickerContainerView toolPickerViewRightConstraint](self, "toolPickerViewRightConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v31);

LABEL_13:
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
  -[PKPaletteToolPickerContainerView toolPickerView](self, "toolPickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerContainerView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[PKPaletteToolPickerContainerView toolPickerView](self, "toolPickerView");
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
    v18.super_class = (Class)PKPaletteToolPickerContainerView;
    -[PKPaletteToolPickerContainerView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
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
  v10.super_class = (Class)PKPaletteToolPickerContainerView;
  -[PKPaletteToolPickerContainerView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPaletteToolPickerContainerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteToolPickerContainerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKPaletteToolPickerContainerView _updateUI](self, "_updateUI");
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

- (PKPaletteToolPickerView)toolPickerView
{
  return self->_toolPickerView;
}

- (NSLayoutConstraint)toolPickerViewTopConstraint
{
  return self->_toolPickerViewTopConstraint;
}

- (void)setToolPickerViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerViewTopConstraint, a3);
}

- (NSLayoutConstraint)toolPickerViewBottomConstraint
{
  return self->_toolPickerViewBottomConstraint;
}

- (void)setToolPickerViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerViewBottomConstraint, a3);
}

- (NSLayoutConstraint)toolPickerViewLeftConstraint
{
  return self->_toolPickerViewLeftConstraint;
}

- (void)setToolPickerViewLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerViewLeftConstraint, a3);
}

- (NSLayoutConstraint)toolPickerViewRightConstraint
{
  return self->_toolPickerViewRightConstraint;
}

- (void)setToolPickerViewRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerViewRightConstraint, a3);
}

- (NSLayoutConstraint)toolPickerViewCenterXConstraint
{
  return self->_toolPickerViewCenterXConstraint;
}

- (void)setToolPickerViewCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerViewCenterXConstraint, a3);
}

- (NSLayoutConstraint)toolPickerViewCenterYConstraint
{
  return self->_toolPickerViewCenterYConstraint;
}

- (void)setToolPickerViewCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerViewCenterYConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolPickerViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerView, 0);
}

@end
