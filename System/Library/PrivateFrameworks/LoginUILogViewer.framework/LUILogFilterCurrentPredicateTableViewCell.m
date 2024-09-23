@implementation LUILogFilterCurrentPredicateTableViewCell

- (LUILogFilterCurrentPredicateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  LUILogFilterCurrentPredicateTableViewCell *v4;
  LUILogFilterCurrentPredicateTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LUILogFilterCurrentPredicateTableViewCell;
  v4 = -[LUILogFilterCurrentPredicateTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[LUILogFilterCurrentPredicateTableViewCell _setupUI](v4, "_setupUI");
  return v5;
}

- (void)_setupUI
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  UIButton *v11;
  UIButton *deleteButton;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogFilterCurrentPredicateTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[LUILogFilterCurrentPredicateTableViewCell layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v5);

  -[LUILogFilterCurrentPredicateTableViewCell layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderWidth:", 1.5);

  -[LUILogFilterCurrentPredicateTableViewCell layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 15.0);

  -[LUILogFilterCurrentPredicateTableViewCell _createTitleLabel](self, "_createTitleLabel");
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  -[LUILogFilterCurrentPredicateTableViewCell _createDeleteButton](self, "_createDeleteButton");
  v11 = (UIButton *)objc_claimAutoreleasedReturnValue();
  deleteButton = self->_deleteButton;
  self->_deleteButton = v11;

  -[UIButton addTarget:action:forControlEvents:](self->_deleteButton, "addTarget:action:forControlEvents:", self, sel__deleteButtonTapped_, 64);
  -[LUILogFilterCurrentPredicateTableViewCell addSubview:](self, "addSubview:", self->_titleLabel);
  -[LUILogFilterCurrentPredicateTableViewCell addSubview:](self, "addSubview:", self->_deleteButton);
}

- (void)layoutSubviews
{
  CGFloat v3;
  double Height;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[LUILogFilterCurrentPredicateTableViewCell frame](self, "frame");
  v3 = CGRectGetWidth(v10) + -80.0;
  -[LUILogFilterCurrentPredicateTableViewCell frame](self, "frame");
  Height = CGRectGetHeight(v11);
  -[LUILogFilterCurrentPredicateTableViewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 20.0, 0.0, v3, Height);

  -[LUILogFilterCurrentPredicateTableViewCell titleLabel](self, "titleLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v6 = CGRectGetMaxX(v12) + 20.0;
  -[LUILogFilterCurrentPredicateTableViewCell frame](self, "frame");
  v7 = CGRectGetHeight(v13) + -10.0;
  -[LUILogFilterCurrentPredicateTableViewCell deleteButton](self, "deleteButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v6, 5.0, 20.0, v7);

}

- (id)_createTitleLabel
{
  void *v3;
  CGFloat v4;
  void *v5;
  void *v6;
  CGRect v8;
  CGRect v9;

  v3 = (void *)objc_opt_new();
  -[LUILogFilterCurrentPredicateTableViewCell frame](self, "frame");
  v4 = CGRectGetWidth(v8) + -80.0;
  -[LUILogFilterCurrentPredicateTableViewCell frame](self, "frame");
  objc_msgSend(v3, "setFrame:", 20.0, 0.0, v4, CGRectGetHeight(v9));
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BDF7880]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  objc_msgSend(v3, "setTextAlignment:", 0);
  return v3;
}

- (id)_createDeleteButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("DeleteIcon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  objc_msgSend(v2, "setImage:forState:", v4, 0);
  return v2;
}

- (void)_deleteButtonTapped:(id)a3
{
  id v4;

  -[LUILogFilterCurrentPredicateTableViewCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateTableViewCellDeleteButtonTapped:", self);

}

- (LUILogFilterCurrentPredicateTableViewCellDelegate)delegate
{
  return (LUILogFilterCurrentPredicateTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
