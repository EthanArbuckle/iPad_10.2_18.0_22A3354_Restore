@implementation HUGridHeadlineCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridHeadlineCell)initWithCoder:(id)a3
{
  HUGridHeadlineCell *v3;
  HUGridHeadlineCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridHeadlineCell;
  v3 = -[HUGridHeadlineCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HUGridHeadlineCell _setupCommonCellAppearance](v3, "_setupCommonCellAppearance");
  return v4;
}

- (HUGridHeadlineCell)initWithFrame:(CGRect)a3
{
  HUGridHeadlineCell *v3;
  HUGridHeadlineCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridHeadlineCell;
  v3 = -[HUGridHeadlineCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUGridHeadlineCell _setupCommonCellAppearance](v3, "_setupCommonCellAppearance");
  return v4;
}

- (void)setLayoutOptions:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  if ((objc_msgSend(v16, "isEqual:", self->_layoutOptions) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUGridHeadlineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUGridHeadlineCell _updateHeadlineLabel](self, "_updateHeadlineLabel");
    -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundDisplayOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell editingBackgroundView](self, "editingBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayOptions:", v6);

    -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellCornerRadius");
    v10 = v9;
    -[HUGridHeadlineCell editingBackgroundView](self, "editingBackgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", v10);

    -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellCornerRadius");
    v14 = v13;
    -[HUGridHeadlineCell editingBackgroundDarkeningView](self, "editingBackgroundDarkeningView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setContinuousCornerRadius:", v14);

  }
}

- (void)_setupCommonCellAppearance
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUGridCellBackgroundView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  HUGridCellBackgroundView *v14;
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
  id v28;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v3 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[HUGridHeadlineCell setEditingBackgroundContainerView:](self, "setEditingBackgroundContainerView:", v3);

  -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[HUGridHeadlineCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v9 = [HUGridCellBackgroundView alloc];
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[HUGridCellBackgroundView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  -[HUGridHeadlineCell setEditingBackgroundView:](self, "setEditingBackgroundView:", v14);

  -[HUGridHeadlineCell editingBackgroundView](self, "editingBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMasksToBounds:", 1);

  -[HUGridHeadlineCell editingBackgroundView](self, "editingBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUserInteractionEnabled:", 0);

  -[HUGridHeadlineCell editingBackgroundView](self, "editingBackgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAutoresizingMask:", 18);

  -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell editingBackgroundView](self, "editingBackgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v10, v11, v12, v13);
  -[HUGridHeadlineCell setEditingBackgroundDarkeningView:](self, "setEditingBackgroundDarkeningView:", v21);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell editingBackgroundDarkeningView](self, "editingBackgroundDarkeningView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v22);

  -[HUGridHeadlineCell editingBackgroundDarkeningView](self, "editingBackgroundDarkeningView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUserInteractionEnabled:", 0);

  -[HUGridHeadlineCell editingBackgroundDarkeningView](self, "editingBackgroundDarkeningView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAutoresizingMask:", 18);

  -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell editingBackgroundDarkeningView](self, "editingBackgroundDarkeningView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  v28 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUGridHeadlineCell setHeadlineLabel:](self, "setHeadlineLabel:", v28);

  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 1);

  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBaselineAdjustment:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTextColor:", v32);

  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setUserInteractionEnabled:", 0);

  -[HUGridHeadlineCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v36);

  HUImageNamed(CFSTR("dashboard-headline-edit-chevron"));
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v45);
  -[HUGridHeadlineCell setEditingChevronImageView:](self, "setEditingChevronImageView:", v37);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTintColor:", v38);

  -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHidden:", 1);

  -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setUserInteractionEnabled:", 0);

  -[HUGridHeadlineCell contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addSubview:", v44);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUGridHeadlineCell setEditing:](self, "setEditing:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUGridHeadlineCell;
  -[HUGridHeadlineCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (CGRect)unpaddedContentFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    v4 = !a3;
    -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v4);

    -[HUGridHeadlineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUGridHeadlineCell;
  -[HUGridHeadlineCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__HUGridHeadlineCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E6F4D200;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, 0.15);
}

void __37__HUGridHeadlineCell_setHighlighted___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
    v2 = 0.75;
  else
    v2 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "editingBackgroundContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  if (*(_BYTE *)(a1 + 40))
    v4 = 0.75;
  else
    v4 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "headlineLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  double v20;
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
  void *v34;
  void *v35;
  _BOOL4 v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
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
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_super v77;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellInnerMargin");
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstBaselineAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "headlineBaselineOffset");
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  if (-[HUGridHeadlineCell isEditing](self, "isEditing"))
  {
    -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

    -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v31);

    -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[HUGridHeadlineCell isEditing](self, "isEditing");
    v37 = 52.0;
    if (!v36)
      v37 = 0.0;
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v39) = 1144766464;
    objc_msgSend(v38, "setPriority:", v39);
    objc_msgSend(v3, "addObject:", v38);
    -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "widthAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "editingBackgroundMinimumWidth");
    objc_msgSend(v41, "constraintGreaterThanOrEqualToConstant:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v44) = 1144782848;
    objc_msgSend(v43, "setPriority:", v44);
    objc_msgSend(v3, "addObject:", v43);
    -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v49);

    -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v54);

    -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "editingBackgroundHeight");
    objc_msgSend(v56, "constraintEqualToConstant:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v58);

    -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell editingBackgroundContainerView](self, "editingBackgroundContainerView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "cellInnerMargin");
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v62, -v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v65);

    -[HUGridHeadlineCell editingChevronImageView](self, "editingChevronImageView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "centerYAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v70);

  }
  -[HUGridHeadlineCell headlineCellConstraints](self, "headlineCellConstraints");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v3, "isEqualToArray:", v71);

  if ((v72 & 1) == 0)
  {
    v73 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridHeadlineCell headlineCellConstraints](self, "headlineCellConstraints");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "deactivateConstraints:", v74);

    -[HUGridHeadlineCell setHeadlineCellConstraints:](self, "setHeadlineCellConstraints:", v3);
    v75 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridHeadlineCell headlineCellConstraints](self, "headlineCellConstraints");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "activateConstraints:", v76);

  }
  v77.receiver = self;
  v77.super_class = (Class)HUGridHeadlineCell;
  -[HUGridHeadlineCell updateConstraints](&v77, sel_updateConstraints);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  return a3;
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[HUGridHeadlineCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D30D18];
  v14[0] = *MEMORY[0x1E0D30D18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "resultsContainRequiredProperties:", v6);

  -[HUGridHeadlineCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (v7 & 1) == 0)
  {
    -[HUGridHeadlineCell item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Item (%@) is missing required properties"), v9);

  }
  if ((v7 & 1) != 0)
  {
    -[HUGridHeadlineCell item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
  else
  {
    -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", &stru_1E6F60E80);
  }

}

- (void)_updateHeadlineLabel
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v9 = v8;
  if (v8 <= 0.0)
  {
    v13 = 1.0;
  }
  else
  {
    -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumFontSize");
    v11 = v10;
    -[HUGridHeadlineCell layoutOptions](self, "layoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pointSize");
    v13 = v11 / v12;
  }
  -[HUGridHeadlineCell headlineLabel](self, "headlineLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMinimumScaleFactor:", v13);

  if (v9 > 0.0)
  {

  }
}

- (BOOL)areCellContentsHidden
{
  return self->_cellContentsHidden;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  self->_cellContentsHidden = a3;
}

- (HUGridHeadlineCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UILabel)headlineLabel
{
  return self->_headlineLabel;
}

- (void)setHeadlineLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headlineLabel, a3);
}

- (UIView)editingBackgroundContainerView
{
  return self->_editingBackgroundContainerView;
}

- (void)setEditingBackgroundContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_editingBackgroundContainerView, a3);
}

- (HUGridCellBackgroundView)editingBackgroundView
{
  return self->_editingBackgroundView;
}

- (void)setEditingBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_editingBackgroundView, a3);
}

- (UIView)editingBackgroundDarkeningView
{
  return self->_editingBackgroundDarkeningView;
}

- (void)setEditingBackgroundDarkeningView:(id)a3
{
  objc_storeStrong((id *)&self->_editingBackgroundDarkeningView, a3);
}

- (UIImageView)editingChevronImageView
{
  return self->_editingChevronImageView;
}

- (void)setEditingChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_editingChevronImageView, a3);
}

- (NSArray)headlineCellConstraints
{
  return self->_headlineCellConstraints;
}

- (void)setHeadlineCellConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_headlineCellConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headlineCellConstraints, 0);
  objc_storeStrong((id *)&self->_editingChevronImageView, 0);
  objc_storeStrong((id *)&self->_editingBackgroundDarkeningView, 0);
  objc_storeStrong((id *)&self->_editingBackgroundView, 0);
  objc_storeStrong((id *)&self->_editingBackgroundContainerView, 0);
  objc_storeStrong((id *)&self->_headlineLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
