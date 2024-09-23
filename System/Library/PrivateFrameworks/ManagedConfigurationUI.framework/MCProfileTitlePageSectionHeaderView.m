@implementation MCProfileTitlePageSectionHeaderView

- (MCProfileTitlePageSectionHeaderView)initWithFrame:(CGRect)a3
{
  MCProfileTitlePageSectionHeaderView *v3;
  uint64_t v4;
  UILabel *label;
  uint64_t v6;
  UIView *separatorLine;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCProfileTitlePageSectionHeaderView;
  v3 = -[MCProfileTitlePageSectionHeaderView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    label = v3->_label;
    v3->_label = (UILabel *)v4;

    v6 = objc_opt_new();
    separatorLine = v3->_separatorLine;
    v3->_separatorLine = (UIView *)v6;

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_separatorLine, "setBackgroundColor:", v8);

    -[MCProfileTitlePageSectionHeaderView addSubview:](v3, "addSubview:", v3->_label);
    -[MCProfileTitlePageSectionHeaderView addSubview:](v3, "addSubview:", v3->_separatorLine);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  double Width;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)MCProfileTitlePageSectionHeaderView;
  -[MCProfileTitlePageSectionHeaderView layoutSubviews](&v15, sel_layoutSubviews);
  -[MCProfileTitlePageSectionHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MCProfileTitlePageSectionHeaderView label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[MCProfileTitlePageSectionHeaderView bounds](self, "bounds");
  v12 = CGRectGetHeight(v16) + -1.0;
  -[MCProfileTitlePageSectionHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v17);
  -[MCProfileTitlePageSectionHeaderView separatorLine](self, "separatorLine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", 0.0, v12, Width, 1.0);

}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    text = self->_text;
    self->_text = v4;

    v6 = self->_text;
    -[MCProfileTitlePageSectionHeaderView label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIView)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
