@implementation CKBadgeView

- (CKBadgeView)initWithFrame:(CGRect)a3
{
  CKBadgeView *v3;
  CKBadgeView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  UILabel *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *countLabel;
  UILabel *v19;
  objc_super v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)CKBadgeView;
  v3 = -[CKBadgeView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKBadgeView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 7.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[CKBadgeView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB550]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0DC13D0];
    v24[0] = *MEMORY[0x1E0DC13D8];
    v24[1] = v11;
    v25[0] = &unk_1E28704B0;
    v25[1] = &unk_1E28704C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *MEMORY[0x1E0DC1380];
    v23 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptorByAddingAttributes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v15, 11.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v16);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v17);

    -[UILabel setTextAlignment:](v9, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v9, "setLineBreakMode:", 4);
    countLabel = v4->_countLabel;
    v4->_countLabel = v9;
    v19 = v9;

    -[CKBadgeView addSubview:](v4, "addSubview:", v19);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBadgeView;
  -[CKBadgeView layoutSubviews](&v4, sel_layoutSubviews);
  -[CKBadgeView countLabel](self, "countLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBadgeView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKBadgeView countLabel](self, "countLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;

  v8 = 14.0;
  if (v7 > 14.0)
    v8 = v7 + 14.0;
  v9 = 14.0;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setValue:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_value != a3)
  {
    self->_value = a3;
    if (a3)
    {
      v4 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      -[UILabel setText:](self->_countLabel, "setText:", v6);
    }
    else
    {
      -[UILabel setText:](self->_countLabel, "setText:", &stru_1E276D870);
    }
  }
}

- (unint64_t)value
{
  return self->_value;
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countLabel, 0);
}

@end
