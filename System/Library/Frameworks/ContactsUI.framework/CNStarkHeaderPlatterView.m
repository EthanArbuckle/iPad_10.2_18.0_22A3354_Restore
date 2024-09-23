@implementation CNStarkHeaderPlatterView

- (CNStarkHeaderPlatterView)initWithLabelText:(id)a3 accessoryImage:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CNStarkHeaderPlatterView *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  UILabel *label;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIImageView *accessory;
  double v27;
  double v28;
  double v29;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  objc_super v51;
  _QWORD v52[7];

  v52[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)CNStarkHeaderPlatterView;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[CNStarkHeaderPlatterView initWithFrame:](&v51, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v9, v10, v11);
  if (v12)
  {
    +[CNUIColorRepository carPlaySiriButtonBackgroundColor](CNUIColorRepository, "carPlaySiriButtonBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[CNStarkHeaderPlatterView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNStarkHeaderPlatterView traitCollection](v12, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _UITableViewDefaultSectionCornerRadiusForTraitCollection();
    v16 = v15;
    -[CNStarkHeaderPlatterView layer](v12, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", v16);

    v18 = *MEMORY[0x1E0CD2A68];
    -[CNStarkHeaderPlatterView layer](v12, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerCurve:", v18);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
    label = v12->_label;
    v12->_label = (UILabel *)v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (void *)objc_msgSend(v6, "copy");
    -[UILabel setText:](v12->_label, "setText:", v22);

    +[CNUIFontRepository carPlayNoContentViewSiriButtonFont](CNUIFontRepository, "carPlayNoContentViewSiriButtonFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_label, "setFont:", v23);

    +[CNUIColorRepository carPlaySiriButtonTextColor](CNUIColorRepository, "carPlaySiriButtonTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12->_label, "setTextColor:", v24);

    -[UILabel setAdjustsFontSizeToFitWidth:](v12->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v12->_label, "setMinimumScaleFactor:", 0.7);
    -[CNStarkHeaderPlatterView addSubview:](v12, "addSubview:", v12->_label);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
    accessory = v12->_accessory;
    v12->_accessory = (UIImageView *)v25;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v12->_accessory, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v27) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v12->_accessory, "setContentHuggingPriority:forAxis:", 0, v27);
    LODWORD(v28) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v12->_accessory, "setContentHuggingPriority:forAxis:", 1, v28);
    LODWORD(v29) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v12->_accessory, "setContentCompressionResistancePriority:forAxis:", 0, v29);
    +[CNUIColorRepository carPlaySiriButtonTextColor](CNUIColorRepository, "carPlaySiriButtonTextColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v12->_accessory, "setTintColor:", v30);

    -[CNStarkHeaderPlatterView addSubview:](v12, "addSubview:", v12->_accessory);
    v42 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel firstBaselineAnchor](v12->_label, "firstBaselineAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView topAnchor](v12, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 28.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v46;
    -[UILabel leadingAnchor](v12->_label, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView leadingAnchor](v12, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 12.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v43;
    -[UILabel trailingAnchor](v12->_label, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v12->_accessory, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v31, -12.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v32;
    -[UIImageView centerYAnchor](v12->_accessory, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView centerYAnchor](v12, "centerYAnchor");
    v50 = v6;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v49 = v7;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v35;
    -[UIImageView trailingAnchor](v12->_accessory, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView trailingAnchor](v12, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -17.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v39);

    v7 = v49;
    v6 = v50;

  }
  return v12;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CNStarkHeaderPlatterView *v7;
  CNStarkHeaderPlatterView *v8;
  CNStarkHeaderPlatterView *v9;
  CNStarkHeaderPlatterView *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNStarkHeaderPlatterView;
  -[CNStarkHeaderPlatterView didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView");
  v7 = (CNStarkHeaderPlatterView *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    objc_msgSend(v6, "nextFocusedView");
    v10 = (CNStarkHeaderPlatterView *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView _updateForFocusedState:](self, "_updateForFocusedState:", v10 == self);

    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v6, "previouslyFocusedView");
  v9 = (CNStarkHeaderPlatterView *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)_updateForFocusedState:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    +[CNUIColorRepository carPlaySiriButtonBackgroundHighlightedColor](CNUIColorRepository, "carPlaySiriButtonBackgroundHighlightedColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView setBackgroundColor:](self, "setBackgroundColor:", v4);

    +[CNUIColorRepository carPlaySiriButtonTextHighlightedColor](CNUIColorRepository, "carPlaySiriButtonTextHighlightedColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v5);

    +[CNUIColorRepository carPlaySiriButtonTextHighlightedColor](CNUIColorRepository, "carPlaySiriButtonTextHighlightedColor");
  }
  else
  {
    +[CNUIColorRepository carPlaySiriButtonBackgroundColor](CNUIColorRepository, "carPlaySiriButtonBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView setBackgroundColor:](self, "setBackgroundColor:", v7);

    +[CNUIColorRepository carPlaySiriButtonTextColor](CNUIColorRepository, "carPlaySiriButtonTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkHeaderPlatterView label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    +[CNUIColorRepository carPlaySiriButtonTextColor](CNUIColorRepository, "carPlaySiriButtonTextColor");
  }
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkHeaderPlatterView accessory](self, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v11);

}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (UIImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setAccessoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImage, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIImageView)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
}

@end
