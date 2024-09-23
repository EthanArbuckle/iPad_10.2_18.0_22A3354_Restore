@implementation CEKDynamicTickCell

- (CEKDynamicTickCell)initWithFrame:(CGRect)a3
{
  CEKDynamicTickCell *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *textLabel;
  uint64_t v11;
  UIImageView *imageView;
  CEKDynamicTickCell *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CEKDynamicTickCell;
  v3 = -[CEKDynamicTickCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    textLabel = v3->__textLabel;
    v3->__textLabel = (UILabel *)v9;

    -[UILabel setTextAlignment:](v3->__textLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v3->__textLabel, "setLineBreakMode:", 2);
    -[CEKDynamicTickCell addSubview:](v3, "addSubview:", v3->__textLabel);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v5, v6, v7, v8);
    imageView = v3->__imageView;
    v3->__imageView = (UIImageView *)v11;

    -[CEKDynamicTickCell addSubview:](v3, "addSubview:", v3->__imageView);
    v13 = v3;
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CEKDynamicTickCell;
  -[CEKDynamicTickCell layoutSubviews](&v21, sel_layoutSubviews);
  -[CEKDynamicTickCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CEKDynamicTickCell _textLabel](self, "_textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDynamicTickCell _imageView](self, "_imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  v13 = CEKRectWithSize();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  UIRectGetCenter();
  -[CEKDynamicTickCell traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayScale");
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v12, "setCenter:");

  objc_msgSend(v12, "setBounds:", v13, v15, v17, v19);
}

- (void)setContentConfiguration:(id)a3
{
  CEKTickCellConfiguration *v5;
  CEKTickCellConfiguration *v6;

  v5 = (CEKTickCellConfiguration *)a3;
  if (self->_contentConfiguration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contentConfiguration, a3);
    -[CEKDynamicTickCell _applyContentConfiguration](self, "_applyContentConfiguration");
    v5 = v6;
  }

}

- (void)_applyContentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CEKDynamicTickCell contentConfiguration](self, "contentConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDynamicTickCell _imageView](self, "_imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDynamicTickCell _textLabel](self, "_textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "setImage:", v3);
    objc_msgSend(v6, "setText:", 0);
  }
  else
  {
    objc_msgSend(v5, "setImage:", 0);
    objc_msgSend(v6, "setText:", v4);
    objc_msgSend(v9, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[CEKDynamicTickCell tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

  }
}

- (CEKTickCellConfiguration)contentConfiguration
{
  return self->_contentConfiguration;
}

- (UILabel)_textLabel
{
  return self->__textLabel;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__textLabel, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);
}

@end
