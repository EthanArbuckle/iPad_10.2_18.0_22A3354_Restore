@implementation PKPaletteTextOptionsView

- (PKPaletteTextOptionsView)initWithFrame:(CGRect)a3
{
  PKPaletteTextOptionsView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIButton *textButton;
  UIButton *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIButton *signatureButton;
  UIButton *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  objc_super v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)PKPaletteTextOptionsView;
  v3 = -[PKPaletteTextOptionsView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setAxis:", 1);
    objc_msgSend(v4, "setDistribution:", 1);
    objc_msgSend(v4, "setSpacing:", 4.0);
    -[PKPaletteTextOptionsView addSubview:](v3, "addSubview:", v4);
    v30 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v4, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteTextOptionsView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 16.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v34;
    objc_msgSend(v4, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteTextOptionsView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -16.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v29;
    objc_msgSend(v4, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteTextOptionsView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v6, 16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v7;
    objc_msgSend(v4, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteTextOptionsView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -16.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v12);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
    textButton = v3->_textButton;
    v3->_textButton = (UIButton *)v13;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_textButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = v3->_textButton;
    _PencilKitBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Text"), CFSTR("Text"), CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v15, "setTitle:forState:", v17, 0);

    -[UIButton setContentHorizontalAlignment:](v3->_textButton, "setContentHorizontalAlignment:", 1);
    -[UIButton layer](v3->_textButton, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 4.0);

    -[UIButton layer](v3->_textButton, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMasksToBounds:", 1);

    objc_msgSend(v4, "addArrangedSubview:", v3->_textButton);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v20 = objc_claimAutoreleasedReturnValue();
    signatureButton = v3->_signatureButton;
    v3->_signatureButton = (UIButton *)v20;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_signatureButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = v3->_signatureButton;
    _PencilKitBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Signature"), CFSTR("Signature"), CFSTR("Localizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v22, "setTitle:forState:", v24, 0);

    -[UIButton setContentHorizontalAlignment:](v3->_signatureButton, "setContentHorizontalAlignment:", 1);
    -[UIButton layer](v3->_signatureButton, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", 4.0);

    -[UIButton layer](v3->_signatureButton, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMasksToBounds:", 1);

    objc_msgSend(v4, "addArrangedSubview:", v3->_signatureButton);
  }
  return v3;
}

- (void)layoutSubviews
{
  UIButton *textButton;
  void *v4;
  UIButton *signatureButton;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPaletteTextOptionsView;
  -[PKPaletteTextOptionsView layoutSubviews](&v13, sel_layoutSubviews);
  textButton = self->_textButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteButtonBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](textButton, "setBackgroundColor:", v4);

  signatureButton = self->_signatureButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteButtonBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](signatureButton, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_toolTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_textButton, "setTintColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_toolTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_signatureButton, "setTintColor:", v8);

  v9 = self->_textButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "pk_toolTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v10, 0);

  v11 = self->_signatureButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "pk_toolTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v11, "setTitleColor:forState:", v12, 0);

}

- (UIButton)textButton
{
  return self->_textButton;
}

- (UIButton)signatureButton
{
  return self->_signatureButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureButton, 0);
  objc_storeStrong((id *)&self->_textButton, 0);
}

@end
