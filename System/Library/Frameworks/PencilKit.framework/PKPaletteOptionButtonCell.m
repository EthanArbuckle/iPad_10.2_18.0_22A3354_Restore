@implementation PKPaletteOptionButtonCell

- (PKPaletteOptionButtonCell)initWithFrame:(CGRect)a3
{
  PKPaletteOptionButtonCell *v3;
  uint64_t v4;
  UIButton *button;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
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
  objc_super v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKPaletteOptionButtonCell;
  v3 = -[PKPaletteOptionCell initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteOptionButtonCell addSubview:](v3, "addSubview:", v3->_button);
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteOptionButtonCell button](v3, "button");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionButtonCell topAnchor](v3, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v22;
    -[PKPaletteOptionButtonCell button](v3, "button");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionButtonCell bottomAnchor](v3, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v17;
    -[PKPaletteOptionButtonCell button](v3, "button");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionButtonCell leadingAnchor](v3, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v8;
    -[PKPaletteOptionButtonCell button](v3, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionButtonCell trailingAnchor](v3, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v13);

    LODWORD(v14) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_button, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    -[UIButton setContentEdgeInsets:](v3->_button, "setContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
  }
  return v3;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
