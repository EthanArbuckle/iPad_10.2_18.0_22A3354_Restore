@implementation CNStarkActionView

- (CNStarkActionView)initWithDelegate:(id)a3
{
  id v4;
  CNStarkActionView *v5;
  CNStarkActionView *v6;
  CNStarkActionView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNStarkActionView;
  v5 = -[CNStarkActionView init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (void)setupLabel
{
  UILabel *v3;
  UILabel *label;
  void *v5;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  label = self->_label;
  self->_label = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  if (_AXSCarPlayEnhanceTextLegibilityEnabled())
    +[CNUIFontRepository carPlayQuickActionButtonTitleFontBold](CNUIFontRepository, "carPlayQuickActionButtonTitleFontBold");
  else
    +[CNUIFontRepository carPlayQuickActionButtonTitleFont](CNUIFontRepository, "carPlayQuickActionButtonTitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v5);

  -[UILabel setIsAccessibilityElement:](self->_label, "setIsAccessibilityElement:", 0);
  -[CNStarkActionView addSubview:](self, "addSubview:", self->_label);
}

- (void)setupButton
{
  UIButton *v3;
  UIButton *button;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNStarkActionView actionPlatterSize](self, "actionPlatterSize");
  v6 = v5 * 0.5;
  -[UIButton layer](self->_button, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v6);

  -[CNStarkActionView actionBorderWidth](self, "actionBorderWidth");
  v9 = v8;
  -[UIButton layer](self->_button, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderWidth:", v9);

  -[UIButton setAdjustsImageWhenDisabled:](self->_button, "setAdjustsImageWhenDisabled:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_actionViewTapped_, 64);
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_actionViewTouchDown_, 1);
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_actionViewTouchUp_, 192);
  -[CNStarkActionView addSubview:](self, "addSubview:", self->_button);
}

- (void)setActionType:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", self->_actionType) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_actionType, a3);
    objc_msgSend(MEMORY[0x1E0DC3870], "cnui_carPlayUserActionSymbolImageForActionType:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkActionView setImage:](self, "setImage:", v5);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CNStarkActionView - %@"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkActionView label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityValue:", v6);

    -[CNStarkActionView stateUpdated](self, "stateUpdated");
  }

}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *label;
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
  _QWORD v32[4];
  _QWORD v33[6];

  v33[5] = *MEMORY[0x1E0C80C00];
  v31 = (void *)objc_opt_new();
  -[CNStarkActionView widthAnchor](self, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView actionPlatterSize](self, "actionPlatterSize");
  objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  -[UIButton topAnchor](self->_button, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView topAnchor](self, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v22;
  -[UIButton centerXAnchor](self->_button, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView centerXAnchor](self, "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v4;
  -[UIButton widthAnchor](self->_button, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView actionPlatterSize](self, "actionPlatterSize");
  objc_msgSend(v5, "constraintEqualToConstant:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v6;
  -[UIButton heightAnchor](self->_button, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton widthAnchor](self->_button, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObjectsFromArray:", v10);

  label = self->_label;
  if (label)
  {
    -[UILabel leadingAnchor](label, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkActionView leadingAnchor](self, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v26;
    -[UILabel firstBaselineAnchor](self->_label, "firstBaselineAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](self->_button, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkActionView actionLabelOffset](self, "actionLabelOffset");
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v13;
    -[UILabel trailingAnchor](self->_label, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkActionView trailingAnchor](self, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v16;
    -[UILabel bottomAnchor](self->_label, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkActionView bottomAnchor](self, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v20);

  }
  -[CNStarkActionView addConstraints:](self, "addConstraints:", v31);

}

- (void)setupClickGestureRecognizer
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_clickGestureDidUpdate_);
  objc_msgSend(v3, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v3, "setAllowedPressTypes:", &unk_1E20D3880);
  -[CNStarkActionView addGestureRecognizer:](self, "addGestureRecognizer:", v3);

}

- (void)clickGestureDidUpdate:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[CNStarkActionView choose](self, "choose");
  }
  else if (objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    -[CNStarkActionView deselect](self, "deselect");
  }

}

- (void)select
{
  if (-[CNStarkActionView enabled](self, "enabled"))
  {
    -[CNStarkActionView setSelected:](self, "setSelected:", 1);
    -[CNStarkActionView stateUpdated](self, "stateUpdated");
  }
}

- (void)deselect
{
  -[CNStarkActionView setSelected:](self, "setSelected:", 0);
  -[CNStarkActionView stateUpdated](self, "stateUpdated");
}

- (void)notifyDelegateAboutUserChoice
{
  id v3;

  if (-[CNStarkActionView enabled](self, "enabled"))
  {
    -[CNStarkActionView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionViewTapped:", self);

  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CNStarkActionView actionPlatterSize](self, "actionPlatterSize");
  v4 = v3;
  -[CNStarkActionView actionPlatterSize](self, "actionPlatterSize");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  -[CNStarkActionView stateUpdated](self, "stateUpdated");
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[CNStarkActionView stateUpdated](self, "stateUpdated");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNStarkActionView;
  -[CNStarkActionView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  if (_AXSCarPlayEnhanceTextLegibilityEnabled())
    +[CNUIFontRepository carPlayQuickActionButtonTitleFontBold](CNUIFontRepository, "carPlayQuickActionButtonTitleFontBold");
  else
    +[CNUIFontRepository carPlayQuickActionButtonTitleFont](CNUIFontRepository, "carPlayQuickActionButtonTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[CNStarkActionView stateUpdated](self, "stateUpdated");
}

- (void)updateForFocusedState:(BOOL)a3
{
  -[CNStarkActionView setDisabledButtonFocused:](self, "setDisabledButtonFocused:", a3);
  -[CNStarkActionView stateUpdated](self, "stateUpdated");
}

- (void)stateUpdated
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  -[CNStarkActionView title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  v5 = -[CNStarkActionView enabled](self, "enabled");
  -[CNStarkActionView button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  -[CNStarkActionView button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forState:", v8, 0);

  objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v9);

  if (-[CNStarkActionView enabled](self, "enabled")
    && (-[CNStarkActionView selected](self, "selected")
     || -[CNStarkActionView isFocused](self, "isFocused")))
  {
    -[CNStarkActionView selectedStrokeColor](self, "selectedStrokeColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "CGColor");
    -[CNStarkActionView button](self, "button");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderColor:", v11);

    -[CNStarkActionView selectedFillColor](self, "selectedFillColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "CGColor");
    -[CNStarkActionView button](self, "button");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v15);

    -[CNStarkActionView selectedGlyphColor](self, "selectedGlyphColor");
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v27 = (void *)v18;
    -[CNStarkActionView button](self, "button");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTintColor:", v27);

    +[CNUIColorRepository carPlayQuickActionButtonTitleTextColorEnabled](CNUIColorRepository, "carPlayQuickActionButtonTitleTextColorEnabled");
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (-[CNStarkActionView enabled](self, "enabled"))
  {
    -[CNStarkActionView enabledStrokeColor](self, "enabledStrokeColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "CGColor");
    -[CNStarkActionView button](self, "button");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBorderColor:", v20);

    -[CNStarkActionView enabledFillColor](self, "enabledFillColor");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend(v23, "CGColor");
    -[CNStarkActionView button](self, "button");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundColor:", v24);

    -[CNStarkActionView enabledGlyphColor](self, "enabledGlyphColor");
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[CNStarkActionView disabledStrokeColor](self, "disabledStrokeColor");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v30, "CGColor");
  -[CNStarkActionView button](self, "button");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBorderColor:", v31);

  -[CNStarkActionView disabledFillColor](self, "disabledFillColor");
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v35 = objc_msgSend(v34, "CGColor");
  -[CNStarkActionView button](self, "button");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBackgroundColor:", v35);

  if (-[CNStarkActionView disabledButtonFocused](self, "disabledButtonFocused"))
    -[CNStarkActionView selectedGlyphColor](self, "selectedGlyphColor");
  else
    -[CNStarkActionView disabledGlyphColor](self, "disabledGlyphColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkActionView button](self, "button");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTintColor:", v38);

  +[CNUIColorRepository carPlayQuickActionButtonTitleTextColorDisabled](CNUIColorRepository, "carPlayQuickActionButtonTitleTextColorDisabled");
  v29 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v40 = (void *)v29;
  -[CNStarkActionView label](self, "label");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTextColor:", v40);

  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v42);
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (CNStarkActionViewDelegate)delegate
{
  return (CNStarkActionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)actionPlatterSize
{
  return self->_actionPlatterSize;
}

- (void)setActionPlatterSize:(double)a3
{
  self->_actionPlatterSize = a3;
}

- (double)actionLabelOffset
{
  return self->_actionLabelOffset;
}

- (void)setActionLabelOffset:(double)a3
{
  self->_actionLabelOffset = a3;
}

- (double)actionBorderWidth
{
  return self->_actionBorderWidth;
}

- (void)setActionBorderWidth:(double)a3
{
  self->_actionBorderWidth = a3;
}

- (UIColor)disabledStrokeColor
{
  return self->_disabledStrokeColor;
}

- (void)setDisabledStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledStrokeColor, a3);
}

- (UIColor)disabledFillColor
{
  return self->_disabledFillColor;
}

- (void)setDisabledFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledFillColor, a3);
}

- (UIColor)disabledGlyphColor
{
  return self->_disabledGlyphColor;
}

- (void)setDisabledGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledGlyphColor, a3);
}

- (UIColor)enabledStrokeColor
{
  return self->_enabledStrokeColor;
}

- (void)setEnabledStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_enabledStrokeColor, a3);
}

- (UIColor)enabledFillColor
{
  return self->_enabledFillColor;
}

- (void)setEnabledFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_enabledFillColor, a3);
}

- (UIColor)enabledGlyphColor
{
  return self->_enabledGlyphColor;
}

- (void)setEnabledGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_enabledGlyphColor, a3);
}

- (UIColor)selectedStrokeColor
{
  return self->_selectedStrokeColor;
}

- (void)setSelectedStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStrokeColor, a3);
}

- (UIColor)selectedFillColor
{
  return self->_selectedFillColor;
}

- (void)setSelectedFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFillColor, a3);
}

- (UIColor)selectedGlyphColor
{
  return self->_selectedGlyphColor;
}

- (void)setSelectedGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphColor, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (UILabel)label
{
  return self->_label;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)disabledButtonFocused
{
  return self->_disabledButtonFocused;
}

- (void)setDisabledButtonFocused:(BOOL)a3
{
  self->_disabledButtonFocused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_selectedGlyphColor, 0);
  objc_storeStrong((id *)&self->_selectedFillColor, 0);
  objc_storeStrong((id *)&self->_selectedStrokeColor, 0);
  objc_storeStrong((id *)&self->_enabledGlyphColor, 0);
  objc_storeStrong((id *)&self->_enabledFillColor, 0);
  objc_storeStrong((id *)&self->_enabledStrokeColor, 0);
  objc_storeStrong((id *)&self->_disabledGlyphColor, 0);
  objc_storeStrong((id *)&self->_disabledFillColor, 0);
  objc_storeStrong((id *)&self->_disabledStrokeColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

+ (id)quickActionButtonWithDelegate:(id)a3
{
  id v3;
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

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:", v3);

  objc_msgSend(v4, "setActionPlatterSize:", 50.0);
  objc_msgSend(v4, "setActionBorderWidth:", 2.0);
  objc_msgSend(v4, "setActionLabelOffset:", 16.0);
  +[CNUIColorRepository carPlayQuickActionButtonBackgroundStrokeColorDisabled](CNUIColorRepository, "carPlayQuickActionButtonBackgroundStrokeColorDisabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledStrokeColor:", v5);

  +[CNUIColorRepository carPlayQuickActionButtonBackgroundFillColorDisabled](CNUIColorRepository, "carPlayQuickActionButtonBackgroundFillColorDisabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledFillColor:", v6);

  +[CNUIColorRepository carPlayQuickActionButtonGlyphColorDisabled](CNUIColorRepository, "carPlayQuickActionButtonGlyphColorDisabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledGlyphColor:", v7);

  +[CNUIColorRepository carPlayQuickActionButtonBackgroundStrokeColorEnabled](CNUIColorRepository, "carPlayQuickActionButtonBackgroundStrokeColorEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabledStrokeColor:", v8);

  +[CNUIColorRepository carPlayQuickActionButtonBackgroundFillColorEnabled](CNUIColorRepository, "carPlayQuickActionButtonBackgroundFillColorEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabledFillColor:", v9);

  +[CNUIColorRepository carPlayQuickActionButtonGlyphColorEnabled](CNUIColorRepository, "carPlayQuickActionButtonGlyphColorEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabledGlyphColor:", v10);

  +[CNUIColorRepository carPlayQuickActionButtonBackgroundStrokeColorSelected](CNUIColorRepository, "carPlayQuickActionButtonBackgroundStrokeColorSelected");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedStrokeColor:", v11);

  +[CNUIColorRepository carPlayQuickActionButtonBackgroundFillColorSelected](CNUIColorRepository, "carPlayQuickActionButtonBackgroundFillColorSelected");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedFillColor:", v12);

  +[CNUIColorRepository carPlayQuickActionButtonGlyphColorSelected](CNUIColorRepository, "carPlayQuickActionButtonGlyphColorSelected");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedGlyphColor:", v13);

  objc_msgSend(v4, "setupLabel");
  objc_msgSend(v4, "setupButton");
  objc_msgSend(v4, "setupConstraints");
  objc_msgSend(v4, "setupClickGestureRecognizer");
  objc_msgSend(v4, "stateUpdated");
  return v4;
}

+ (id)propertyTransportButtonWithDelegate:(id)a3
{
  id v3;
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

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:", v3);

  objc_msgSend(v4, "setActionPlatterSize:", 36.0);
  objc_msgSend(v4, "setActionBorderWidth:", 2.0);
  +[CNUIColorRepository carPlayTransportButtonBackgroundStrokeColorDisabled](CNUIColorRepository, "carPlayTransportButtonBackgroundStrokeColorDisabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledStrokeColor:", v5);

  +[CNUIColorRepository carPlayTransportButtonBackgroundFillColorDisabled](CNUIColorRepository, "carPlayTransportButtonBackgroundFillColorDisabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledFillColor:", v6);

  +[CNUIColorRepository carPlayTransportButtonGlyphColorDisabled](CNUIColorRepository, "carPlayTransportButtonGlyphColorDisabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledGlyphColor:", v7);

  +[CNUIColorRepository carPlayTransportButtonBackgroundStrokeColorEnabled](CNUIColorRepository, "carPlayTransportButtonBackgroundStrokeColorEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabledStrokeColor:", v8);

  +[CNUIColorRepository carPlayTransportButtonBackgroundFillColorEnabled](CNUIColorRepository, "carPlayTransportButtonBackgroundFillColorEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabledFillColor:", v9);

  +[CNUIColorRepository carPlayTransportButtonGlyphColorEnabled](CNUIColorRepository, "carPlayTransportButtonGlyphColorEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabledGlyphColor:", v10);

  +[CNUIColorRepository carPlayTransportButtonBackgroundStrokeColorSelected](CNUIColorRepository, "carPlayTransportButtonBackgroundStrokeColorSelected");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedStrokeColor:", v11);

  +[CNUIColorRepository carPlayTransportButtonBackgroundFillColorSelected](CNUIColorRepository, "carPlayTransportButtonBackgroundFillColorSelected");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedFillColor:", v12);

  +[CNUIColorRepository carPlayTransportButtonGlyphColorSelected](CNUIColorRepository, "carPlayTransportButtonGlyphColorSelected");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedGlyphColor:", v13);

  objc_msgSend(v4, "setupButton");
  objc_msgSend(v4, "setupConstraints");
  objc_msgSend(v4, "setupClickGestureRecognizer");
  objc_msgSend(v4, "stateUpdated");
  return v4;
}

@end
