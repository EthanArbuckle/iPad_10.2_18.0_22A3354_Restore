@implementation NTKColorSliderThumbView

- (NTKColorSliderThumbView)initWithFrame:(CGRect)a3
{
  NTKColorSliderThumbView *v3;
  uint64_t v4;
  UIView *border;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIView *content;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NTKColorSliderThumbView;
  v3 = -[NTKColorSliderThumbView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    border = v3->_border;
    v3->_border = (UIView *)v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_border, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[UIView layer](v3->_border, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowColor:", v8);

    -[UIView layer](v3->_border, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0.5;
    objc_msgSend(v10, "setShadowOpacity:", v11);

    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIView layer](v3->_border, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowOffset:", v12, v13);

    -[UIView layer](v3->_border, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowRadius:", 10.0);

    -[NTKColorSliderThumbView addSubview:](v3, "addSubview:", v3->_border);
    v16 = objc_opt_new();
    content = v3->_content;
    v3->_content = (UIView *)v16;

    -[NTKColorSliderThumbView addSubview:](v3, "addSubview:", v3->_content);
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
  CGFloat v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v20;
  void *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22.receiver = self;
  v22.super_class = (Class)NTKColorSliderThumbView;
  -[NTKColorSliderThumbView layoutSubviews](&v22, sel_layoutSubviews);
  -[NTKColorSliderThumbView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_border, "setFrame:");
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v11 = CGRectGetWidth(v23) * 0.5;
  -[UIView layer](self->_border, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v4, v6, v8, v10);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "CGPath");
  -[UIView layer](self->_border, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowPath:", v14);

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v25 = CGRectInset(v24, 6.0, 6.0);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  -[UIView setFrame:](self->_content, "setFrame:");
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v20 = CGRectGetWidth(v26) * 0.5;
  -[UIView layer](self->_content, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerRadius:", v20);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width;

  if (result.width >= result.height)
    result.width = result.height;
  width = result.width;
  result.height = width;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  if (a3.size.width >= a3.size.height)
    a3.size.width = a3.size.height;
  v3.receiver = self;
  v3.super_class = (Class)NTKColorSliderThumbView;
  -[NTKColorSliderThumbView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.width);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;

  if (a3.size.width >= a3.size.height)
    a3.size.width = a3.size.height;
  v3.receiver = self;
  v3.super_class = (Class)NTKColorSliderThumbView;
  -[NTKColorSliderThumbView setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.width);
}

- (void)setColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_content, "setBackgroundColor:", a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_border, 0);
}

@end
