@implementation SUUICategoryTableViewCell

- (SUUICategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUICategoryTableViewCell *v4;
  SUUICategoryTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *separatorView;
  UIView *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUUICategoryTableViewCell;
  v4 = -[SUUICategoryTableViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SUUICategoryTableViewCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v9);

    v10 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v5->_separatorView;
    v5->_separatorView = v10;

    v12 = v5->_separatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[SUUICategoryTableViewCell addSubview:](v5, "addSubview:", v5->_separatorView);
    v5->_layoutNeedsLayout = 1;

  }
  return v5;
}

- (void)setExpectedImageSize:(CGSize)a3
{
  if (self->_expectedImageSize.width != a3.width || self->_expectedImageSize.height != a3.height)
  {
    self->_expectedImageSize = a3;
    -[SUUICategoryTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUICategoryTableViewCell bounds](self, "bounds");
  if (v9 != width || v8 != height)
    self->_layoutNeedsLayout = 1;
  v11.receiver = self;
  v11.super_class = (Class)SUUICategoryTableViewCell;
  -[SUUICategoryTableViewCell setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUICategoryTableViewCell frame](self, "frame");
  if (v9 != width || v8 != height)
    self->_layoutNeedsLayout = 1;
  v11.receiver = self;
  v11.super_class = (Class)SUUICategoryTableViewCell;
  -[SUUICategoryTableViewCell setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  void *v14;
  void *v15;
  double v16;
  UIView *separatorView;
  void *v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SUUICategoryTableViewCell;
  -[SUUICategoryTableViewCell layoutSubviews](&v21, sel_layoutSubviews);
  if (self->_layoutNeedsLayout)
  {
    -[SUUICategoryTableViewCell bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[SUUICategoryTableViewCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "frame");
      v10 = v9;
      objc_msgSend(v7, "setFrame:", 15.0, (v6 - v11) * 0.5);
      v12 = v10 + 15.0 + 15.0;
    }
    else
    {
      width = self->_expectedImageSize.width;
      v12 = 15.0;
      if (width > 0.0)
        v12 = width + 15.0 + 15.0;
    }
    -[SUUICategoryTableViewCell textLabel](self, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "sizeToFit");
      objc_msgSend(v15, "frame");
      objc_msgSend(v15, "setFrame:", v12, (v6 - v16) * 0.5, v4 - v12 + -15.0);
    }
    separatorView = self->_separatorView;
    if (separatorView)
    {
      -[UIView frame](separatorView, "frame");
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scale");
      v20 = 1.0 / v19;

      -[UIView setFrame:](self->_separatorView, "setFrame:", 15.0, v6 - v20, v4 + -15.0, v20);
    }

  }
  self->_layoutNeedsLayout = 0;
}

- (CGSize)expectedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expectedImageSize.width;
  height = self->_expectedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
