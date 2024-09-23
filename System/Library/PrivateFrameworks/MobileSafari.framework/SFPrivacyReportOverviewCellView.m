@implementation SFPrivacyReportOverviewCellView

- (SFPrivacyReportOverviewCellView)initWithFrame:(CGRect)a3
{
  SFPrivacyReportOverviewCellView *v3;
  SFPrivacyReportOverviewCellView *v4;
  void *v5;
  SFPrivacyReportOverviewCellView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFPrivacyReportOverviewCellView;
  v3 = -[SFPrivacyReportOverviewCellView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFPrivacyReportOverviewCellView setEdgesPreservingSuperviewLayoutMargins:](v3, "setEdgesPreservingSuperviewLayoutMargins:", 10);
    -[SFPrivacyReportOverviewCellView _updateLayoutMargins](v4, "_updateLayoutMargins");
    -[SFPrivacyReportOverviewCellView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[SFPrivacyReportOverviewCellView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v6 = v4;

  }
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportOverviewCellView;
  -[SFPrivacyReportOverviewCellView willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  -[SFPrivacyReportOverviewCellView _updateHairlinesIfNeeded](self, "_updateHairlinesIfNeeded");
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  double v4;
  void *v5;

  if (self->_usesInsetStyle != a3)
  {
    self->_usesInsetStyle = a3;
    if (a3)
      v4 = 8.0;
    else
      v4 = 0.0;
    -[SFPrivacyReportOverviewCellView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", v4);

    -[SFPrivacyReportOverviewCellView _updateHairlinesIfNeeded](self, "_updateHairlinesIfNeeded");
    -[SFPrivacyReportOverviewCellView _updateLayoutMargins](self, "_updateLayoutMargins");
  }
}

- (void)_updateLayoutMargins
{
  -[SFPrivacyReportOverviewCellView layoutMargins](self, "layoutMargins");
  -[SFPrivacyReportOverviewCellView setLayoutMargins:](self, "setLayoutMargins:");
}

- (void)setGridPosition:(unint64_t)a3
{
  if (self->_gridPosition != a3)
  {
    self->_gridPosition = a3;
    -[SFPrivacyReportOverviewCellView _updateHairlinesIfNeeded](self, "_updateHairlinesIfNeeded");
  }
}

- (void)_updateHairlinesIfNeeded
{
  _BOOL4 usesInsetStyle;
  unint64_t v4;
  _BOOL4 v5;
  void (**v6)(_QWORD);
  UIView *topHairline;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  UIView *bottomHairline;
  void *v19;
  UIView *trailingHairline;
  UIView *v21;
  UIView *v22;
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
  UIView *v33;
  UIView *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void (**v64)(_QWORD);
  void (**v65)(_QWORD);
  void (**v66)(_QWORD);
  _QWORD aBlock[5];
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[6];

  v70[4] = *MEMORY[0x1E0C80C00];
  usesInsetStyle = self->_usesInsetStyle;
  if (self->_usesInsetStyle)
  {
    LODWORD(v4) = 0;
    v5 = 0;
  }
  else
  {
    v4 = self->_gridPosition & 1;
    v5 = (self->_gridPosition & 8) == 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__SFPrivacyReportOverviewCellView__updateHairlinesIfNeeded__block_invoke;
  aBlock[3] = &unk_1E21E5E68;
  aBlock[4] = self;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  topHairline = self->_topHairline;
  if ((_DWORD)v4)
  {
    if (topHairline)
      goto LABEL_9;
    v6[2](v6);
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();
    v9 = self->_topHairline;
    self->_topHairline = v8;

    v50 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](self->_topHairline, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellView topAnchor](self, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v61);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v58;
    -[UIView leadingAnchor](self->_topHairline, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellView leadingAnchor](self, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v52);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v48;
    -[UIView trailingAnchor](self->_topHairline, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellView trailingAnchor](self, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v64 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v13;
    -[UIView heightAnchor](self->_topHairline, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", _SFOnePixel());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4);
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v17);

    v5 = v16;
    v6 = v64;

  }
  else
  {
    -[UIView removeFromSuperview](topHairline, "removeFromSuperview");
    v10 = self->_topHairline;
    self->_topHairline = 0;
  }

LABEL_9:
  bottomHairline = self->_bottomHairline;
  if (usesInsetStyle)
  {
    -[UIView removeFromSuperview](bottomHairline, "removeFromSuperview");
    v19 = self->_bottomHairline;
    self->_bottomHairline = 0;
LABEL_11:

    goto LABEL_13;
  }
  if (!bottomHairline)
  {
    v6[2](v6);
    v33 = (UIView *)objc_claimAutoreleasedReturnValue();
    v34 = self->_bottomHairline;
    self->_bottomHairline = v33;

    v49 = (void *)MEMORY[0x1E0CB3718];
    -[UIView bottomAnchor](self->_bottomHairline, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellView bottomAnchor](self, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v60;
    -[UIView leadingAnchor](self->_bottomHairline, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = self->_gridPosition & 6;
    if (v54 == 4)
    {
      -[SFPrivacyReportOverviewCellView layoutMarginsGuide](self, "layoutMarginsGuide");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "leadingAnchor");
      v36 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SFPrivacyReportOverviewCellView leadingAnchor](self, "leadingAnchor");
      v36 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v36;
    }
    v66 = v6;
    v46 = (void *)v36;
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v37;
    -[UIView trailingAnchor](self->_bottomHairline, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self->_gridPosition & 0xA;
    v47 = v5;
    v57 = v35;
    if (v39 == 8)
    {
      -[SFPrivacyReportOverviewCellView layoutMarginsGuide](self, "layoutMarginsGuide");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "trailingAnchor");
    }
    else
    {
      -[SFPrivacyReportOverviewCellView trailingAnchor](self, "trailingAnchor");
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v41;
    -[UIView heightAnchor](self->_bottomHairline, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", _SFOnePixel());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v44);

    if (v39 == 8)
    {

      v40 = v45;
    }

    v5 = v47;
    if (v54 == 4)

    v6 = v66;
    goto LABEL_11;
  }
LABEL_13:
  trailingHairline = self->_trailingHairline;
  if (!v5)
  {
    -[UIView removeFromSuperview](trailingHairline, "removeFromSuperview");
    v23 = self->_trailingHairline;
    self->_trailingHairline = 0;
    goto LABEL_17;
  }
  if (!trailingHairline)
  {
    v6[2](v6);
    v21 = (UIView *)objc_claimAutoreleasedReturnValue();
    v22 = self->_trailingHairline;
    self->_trailingHairline = v21;

    v53 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](self->_trailingHairline, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellView layoutMarginsGuide](self, "layoutMarginsGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v59);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v56;
    -[UIView bottomAnchor](self->_trailingHairline, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellView bottomAnchor](self, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v26;
    -[UIView trailingAnchor](self->_trailingHairline, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellView trailingAnchor](self, "trailingAnchor");
    v65 = v6;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v29;
    -[UIView widthAnchor](self->_trailingHairline, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", _SFOnePixel());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "activateConstraints:", v32);

    v6 = v65;
LABEL_17:

  }
}

id __59__SFPrivacyReportOverviewCellView__updateHairlinesIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v2);
  return v2;
}

- (SFPrivacyReportGridItemDelegate)delegate
{
  return (SFPrivacyReportGridItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)gridPosition
{
  return self->_gridPosition;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundColor, a3);
}

- (double)cellBackgroundCornerRadius
{
  return self->_cellBackgroundCornerRadius;
}

- (void)setCellBackgroundCornerRadius:(double)a3
{
  self->_cellBackgroundCornerRadius = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingHairline, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
}

@end
