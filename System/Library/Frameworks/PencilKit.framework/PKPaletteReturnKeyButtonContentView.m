@implementation PKPaletteReturnKeyButtonContentView

- (PKPaletteReturnKeyButtonContentView)initWithFrame:(CGRect)a3
{
  PKPaletteReturnKeyButtonContentView *v3;
  UIStackView *v4;
  UIStackView *stackView;
  void *v6;
  objc_class *v7;
  TUICandidateLabel *v8;
  TUICandidateLabel *label;
  void *v10;
  UIImageView *v11;
  UIImageView *imageView;
  void *v13;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *labelWidthConstraint;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *labelHeightConstraint;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[8];

  v41[6] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PKPaletteReturnKeyButtonContentView;
  v3 = -[PKPaletteReturnKeyButtonContentView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 4.0);
    -[PKPaletteReturnKeyButtonContentView addSubview:](v3, "addSubview:", v3->_stackView);
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v6 = (void *)_MergedGlobals_5;
    v40 = _MergedGlobals_5;
    if (!_MergedGlobals_5)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __getTUICandidateLabelClass_block_invoke;
      v36[3] = &unk_1E7777068;
      v36[4] = &v37;
      __getTUICandidateLabelClass_block_invoke((uint64_t)v36);
      v6 = (void *)v38[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v37, 8);
    v8 = (TUICandidateLabel *)objc_alloc_init(v7);
    label = v3->_label;
    v3->_label = v8;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setFont:](v3->_label, "setFont:", v10);

    -[TUICandidateLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_label);
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v13);

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_imageView);
    -[TUICandidateLabel widthAnchor](v3->_label, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
    v15 = objc_claimAutoreleasedReturnValue();
    labelWidthConstraint = v3->_labelWidthConstraint;
    v3->_labelWidthConstraint = (NSLayoutConstraint *)v15;

    -[TUICandidateLabel heightAnchor](v3->_label, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 0.0);
    v18 = objc_claimAutoreleasedReturnValue();
    labelHeightConstraint = v3->_labelHeightConstraint;
    v3->_labelHeightConstraint = (NSLayoutConstraint *)v18;

    v29 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteReturnKeyButtonContentView centerXAnchor](v3, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView centerXAnchor](v3->_stackView, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v32;
    -[PKPaletteReturnKeyButtonContentView centerYAnchor](v3, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView centerYAnchor](v3->_stackView, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v20;
    -[PKPaletteReturnKeyButtonContentView widthAnchor](v3, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView widthAnchor](v3->_stackView, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v23;
    -[PKPaletteReturnKeyButtonContentView heightAnchor](v3, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](v3->_stackView, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v26;
    v41[4] = v3->_labelWidthConstraint;
    v41[5] = v3->_labelHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v27);

    -[PKPaletteReturnKeyButtonContentView _updateUI](v3, "_updateUI");
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *text;
  NSString *v11;

  v4 = a3;
  v5 = self->_text;
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
    text = self->_text;
    self->_text = v9;

    -[PKPaletteReturnKeyButtonContentView _updateUI](self, "_updateUI");
  }
  v8 = v11;
LABEL_10:

}

- (UIColor)textColor
{
  return (UIColor *)-[TUICandidateLabel textColor](self->_label, "textColor");
}

- (void)setTextColor:(id)a3
{
  -[TUICandidateLabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    -[PKPaletteReturnKeyButtonContentView _updateUI](self, "_updateUI");
  }
}

- (void)setUseCompactLayout:(BOOL)a3
{
  if (self->_useCompactLayout != a3)
  {
    self->_useCompactLayout = a3;
    -[PKPaletteReturnKeyButtonContentView _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;

  -[TUICandidateLabel setHidden:](self->_label, "setHidden:", -[PKPaletteReturnKeyButtonContentView useCompactLayout](self, "useCompactLayout"));
  -[PKPaletteReturnKeyButtonContentView text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateLabel setText:](self->_label, "setText:", v3);

  -[TUICandidateLabel setLayoutOrientation:](self->_label, "setLayoutOrientation:", -[PKPaletteReturnKeyButtonContentView layoutOrientation](self, "layoutOrientation"));
  v4 = (void *)objc_opt_class();
  -[PKPaletteReturnKeyButtonContentView text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateLabel font](self->_label, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineWidthForText:font:layoutOrientation:", v5, v6, -[PKPaletteReturnKeyButtonContentView layoutOrientation](self, "layoutOrientation"));
  v8 = v7;

  v9 = -[PKPaletteReturnKeyButtonContentView layoutOrientation](self, "layoutOrientation");
  if (v9)
    v10 = 36.0;
  else
    v10 = v8;
  if (!v9)
    v8 = 36.0;
  -[UIStackView setAxis:](self->_stackView, "setAxis:", v9 != 0);
  -[NSLayoutConstraint setConstant:](self->_labelWidthConstraint, "setConstant:", v10);
  -[NSLayoutConstraint setConstant:](self->_labelHeightConstraint, "setConstant:", v8);
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_labelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
