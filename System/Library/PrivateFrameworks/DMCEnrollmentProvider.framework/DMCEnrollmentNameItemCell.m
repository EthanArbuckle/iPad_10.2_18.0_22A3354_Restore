@implementation DMCEnrollmentNameItemCell

- (DMCEnrollmentNameItemCell)initWithFrame:(CGRect)a3
{
  DMCEnrollmentNameItemCell *v3;
  uint64_t v4;
  UILabel *textLabel;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)DMCEnrollmentNameItemCell;
  v3 = -[DMCEnrollmentNameItemCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v4;

    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v3->_textLabel, "setTextAlignment:", 1);
    +[DMCEnrollmentNameItemCell _titleFont](DMCEnrollmentNameItemCell, "_titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_textLabel, "setFont:", v6);

    -[DMCEnrollmentNameItemCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_textLabel);

    objc_initWeak(&location, v3);
    v15[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__DMCEnrollmentNameItemCell_initWithFrame___block_invoke;
    v11[3] = &unk_24D52E2D0;
    objc_copyWeak(&v12, &location);
    v9 = (id)-[DMCEnrollmentNameItemCell registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v8, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__DMCEnrollmentNameItemCell_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[DMCEnrollmentNameItemCell _titleFont](DMCEnrollmentNameItemCell, "_titleFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v1);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DMCEnrollmentNameItemCell;
  -[DMCEnrollmentNameItemCell layoutSubviews](&v13, sel_layoutSubviews);
  -[DMCEnrollmentNameItemCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[DMCEnrollmentNameItemCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

+ (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
