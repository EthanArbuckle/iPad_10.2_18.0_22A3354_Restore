@implementation MKPlaceAttributionCell

- (MKPlaceAttributionCell)initWithFrame:(CGRect)a3
{
  MKPlaceAttributionCell *v3;
  MKPlaceAttributionCell *v4;
  MKPlaceAttributionLabel *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  MKPlaceAttributionCellButton *v16;
  _MKUILabel *label;
  _MKUILabel *v18;
  void *v19;
  MKPlaceAttributionCellDelegate *v20;
  MKPlaceAttributionCellDelegate *cellDelegate;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MKPlaceAttributionCell;
  v3 = -[MKPlaceSectionItemView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKPlaceAttributionCell setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    v5 = [MKPlaceAttributionLabel alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[MKPlaceAttributionLabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    v11 = *(void **)&v4->_highlighted;
    *(_QWORD *)&v4->_highlighted = v10;

    v12 = *(void **)&v4->_highlighted;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    objc_msgSend(*(id *)&v4->_highlighted, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[MKPlaceAttributionCell fontForLabel](MKPlaceAttributionCell, "fontForLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)&v4->_highlighted, "setFont:", v14);

    objc_msgSend(*(id *)&v4->_highlighted, "setNumberOfLines:", 3);
    LODWORD(v15) = 1132068864;
    objc_msgSend(*(id *)&v4->_highlighted, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v15);
    objc_msgSend(*(id *)&v4->_highlighted, "set_mapkit_themeColorProvider:", &__block_literal_global_50);
    -[MKPlaceAttributionCell addSubview:](v4, "addSubview:", *(_QWORD *)&v4->_highlighted);
    v16 = -[MKPlaceAttributionCellButton initWithFrame:]([MKPlaceAttributionCellButton alloc], "initWithFrame:", v6, v7, v8, v9);
    label = v4->_label;
    v4->_label = (_MKUILabel *)v16;

    -[_MKUILabel setButtonDelegate:](v4->_label, "setButtonDelegate:", v4);
    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = v4->_label;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _mapkit_setBackgroundColor:](v18, "_mapkit_setBackgroundColor:", v19);

    -[_MKUILabel addTarget:action:forControlEvents:](v4->_label, "addTarget:action:forControlEvents:", v4, sel_attributionClicked, 64);
    -[MKPlaceAttributionCell addSubview:](v4, "addSubview:", v4->_label);
    v20 = (MKPlaceAttributionCellDelegate *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
    cellDelegate = v4->_cellDelegate;
    v4->_cellDelegate = v20;

    -[MKPlaceAttributionCellDelegate setAllowedPressTypes:](v4->_cellDelegate, "setAllowedPressTypes:", &unk_1E2159F58);
    -[MKPlaceAttributionCellDelegate setAllowedTouchTypes:](v4->_cellDelegate, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[MKPlaceAttributionCell addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_cellDelegate);
    -[MKPlaceAttributionCellDelegate addTarget:action:](v4->_cellDelegate, "addTarget:action:", v4, sel_attributionClicked);
    -[MKPlaceAttributionCell createConstraints](v4, "createConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v4, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v4;
}

uint64_t __40__MKPlaceAttributionCell_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tintColor");
}

- (void)createConstraints
{
  void *v3;
  void *v4;
  void *v5;
  MKPlaceAttributionCellButton *v6;
  MKPlaceAttributionCellButton *labelButton;
  void *v8;
  void *v9;
  double v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *labelBaselineToTop;
  double v13;
  MKPlaceAttributionCellButton *v14;
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
  void *v25;
  NSArray *v26;
  NSArray *visibleConstraints;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[10];

  v43[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKPlaceAttributionCell fontForLabel](MKPlaceAttributionCell, "fontForLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&self->_highlighted, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionCell topAnchor](self, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v3;
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 27.0);
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5);
  v6 = (MKPlaceAttributionCellButton *)objc_claimAutoreleasedReturnValue();
  labelButton = self->_labelButton;
  self->_labelButton = v6;

  objc_msgSend(*(id *)&self->_highlighted, "lastBaselineAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionCell bottomAnchor](self, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 18.0);
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelBaselineToTop = self->_labelBaselineToTop;
  self->_labelBaselineToTop = v11;

  LODWORD(v13) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_labelBaselineToTop, "setPriority:", v13);
  v14 = self->_labelButton;
  v43[0] = self->_labelBaselineToTop;
  v43[1] = v14;
  objc_msgSend(*(id *)&self->_highlighted, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionCell layoutMarginsGuide](self, "layoutMarginsGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v37;
  objc_msgSend(*(id *)&self->_highlighted, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionCell layoutMarginsGuide](self, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v33;
  objc_msgSend(*(id *)&self->_highlighted, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel topAnchor](self->_label, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v30;
  objc_msgSend(*(id *)&self->_highlighted, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel bottomAnchor](self->_label, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v15;
  objc_msgSend(*(id *)&self->_highlighted, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel leadingAnchor](self->_label, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v18;
  objc_msgSend(*(id *)&self->_highlighted, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel trailingAnchor](self->_label, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObjectsFromArray:", v22);

  v23 = objc_msgSend(v41, "copy");
  v24 = *(void **)&self->super._selected;
  *(_QWORD *)&self->super._selected = v23;

  -[MKPlaceAttributionCell heightAnchor](self, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", 0.0);
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  visibleConstraints = self->_visibleConstraints;
  self->_visibleConstraints = v26;

  -[NSArray setActive:](self->_visibleConstraints, "setActive:", 1);
  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");

}

- (void)updateConstraints
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  objc_super v7;

  objc_msgSend(*(id *)&self->_highlighted, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[NSArray isActive](self->_visibleConstraints, "isActive");

    if (v4)
    {
      -[NSArray setActive:](self->_visibleConstraints, "setActive:", 0);
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(_QWORD *)&self->super._selected);
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)&self->_highlighted, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {

  }
  else
  {
    v6 = -[NSArray isActive](self->_visibleConstraints, "isActive");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)&self->super._selected);
      -[NSArray setActive:](self->_visibleConstraints, "setActive:", 1);
    }
  }
LABEL_9:
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceAttributionCell;
  -[MKPlaceAttributionCell updateConstraints](&v7, sel_updateConstraints);
}

- (void)_contentSizeDidChange
{
  double v3;
  id v4;

  +[MKPlaceAttributionCell fontForLabel](MKPlaceAttributionCell, "fontForLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&self->_highlighted, "setFont:", v4);
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 27.0);
  -[MKPlaceAttributionCellButton setConstant:](self->_labelButton, "setConstant:");
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 18.0);
  -[NSLayoutConstraint setConstant:](self->_labelBaselineToTop, "setConstant:", -v3);

}

- (void)attributionClicked
{
  id v2;

  -[MKPlaceAttributionCell cellDelegate](self, "cellDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL");

}

- (void)setAttributionString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)&self->_highlighted;
  v5 = a3;
  objc_msgSend(v4, "setAttributedText:", v5);
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MKUILabel setAccessibilityLabel:](self->_label, "setAccessibilityLabel:", v6);
  -[_MKUILabel accessibilityLabel](self->_label, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v7);

  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
}

+ (id)fontForLabel
{
  void *v2;
  void *v3;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)currentHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  +[MKPlaceAttributionCell fontForLabel](MKPlaceAttributionCell, "fontForLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 27.0);
  v4 = v3;
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 18.0);
  v6 = v4 + v5;

  return v6;
}

- (void)attributionCellButton:(id)a3 isHighighted:(BOOL)a4 executeAction:(BOOL)a5
{
  _BOOL4 v5;
  _MKUILabel *v7;
  double v8;
  _MKUILabel *v9;

  v5 = a4;
  v7 = (_MKUILabel *)a3;
  if (self->_label == v7)
  {
    v9 = v7;
    v8 = 1.0;
    if (v5)
      v8 = 0.25;
    objc_msgSend(*(id *)&self->_highlighted, "setAlpha:", v8);
    v7 = v9;
  }

}

- (_MKUILabel)label
{
  return *(_MKUILabel **)&self->_highlighted;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_highlighted, a3);
}

- (BOOL)isHighlighted
{
  return (BOOL)self->_collapsedConstraint;
}

- (void)setHighlighted:(BOOL)a3
{
  LOBYTE(self->_collapsedConstraint) = a3;
}

- (MKPlaceAttributionCellButton)labelButton
{
  return (MKPlaceAttributionCellButton *)self->_label;
}

- (void)setLabelButton:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSLayoutConstraint)labelBaselineToTop
{
  return (NSLayoutConstraint *)self->_labelButton;
}

- (void)setLabelBaselineToTop:(id)a3
{
  objc_storeStrong((id *)&self->_labelButton, a3);
}

- (NSLayoutConstraint)labelLastBaselineToBottom
{
  return self->_labelBaselineToTop;
}

- (void)setLabelLastBaselineToBottom:(id)a3
{
  objc_storeStrong((id *)&self->_labelBaselineToTop, a3);
}

- (MKPlaceAttributionCellDelegate)cellDelegate
{
  return (MKPlaceAttributionCellDelegate *)objc_loadWeakRetained((id *)&self->_labelLastBaselineToBottom);
}

- (void)setCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_labelLastBaselineToBottom, a3);
}

- (UITapGestureRecognizer)selectGestureRecognizer
{
  return (UITapGestureRecognizer *)self->_cellDelegate;
}

- (void)setSelectGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_cellDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellDelegate, 0);
  objc_destroyWeak((id *)&self->_labelLastBaselineToBottom);
  objc_storeStrong((id *)&self->_labelBaselineToTop, 0);
  objc_storeStrong((id *)&self->_labelButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_highlighted, 0);
  objc_storeStrong((id *)&self->_visibleConstraints, 0);
  objc_storeStrong((id *)&self->super._selected, 0);
}

@end
