@implementation AVTCarouselPlusButtonView

- (AVTCarouselPlusButtonView)initWithFrame:(CGRect)a3 environment:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  AVTCarouselPlusButtonView *v11;
  UIButton *v12;
  void *v13;
  UIButton *button;
  UIButton *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTCarouselPlusButtonView;
  v11 = -[AVTCarouselPlusButtonView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
    AVTPlusButtonImage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v12, "setImage:forState:", v13, 0);
    -[UIButton setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
    button = v11->_button;
    v11->_button = v12;
    v15 = v12;

    objc_storeStrong((id *)&v11->_environment, a4);
    -[AVTCarouselPlusButtonView addSubview:](v11, "addSubview:", v11->_button);

  }
  return v11;
}

- (void)setMaxItemSize:(CGSize)a3
{
  if (a3.width != self->_maxItemSize.width || a3.height != self->_maxItemSize.height)
  {
    self->_maxItemSize = a3;
    -[AVTCarouselPlusButtonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_highlighted = a3;
  if (-[AVTCarouselPlusButtonView allowHighlight](self, "allowHighlight"))
  {
    -[AVTCarouselPlusButtonView button](self, "button");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", v3);

  }
}

- (void)setAllowHighlight:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_allowHighlight = a3;
  if (-[AVTCarouselPlusButtonView isHighlighted](self, "isHighlighted"))
  {
    -[AVTCarouselPlusButtonView button](self, "button");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", v3);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v6;
  int v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  CGAffineTransform v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)AVTCarouselPlusButtonView;
  -[AVTCarouselPlusButtonView layoutSubviews](&v34, sel_layoutSubviews);
  -[AVTCarouselPlusButtonView maxItemSize](self, "maxItemSize");
  if (v4 != *MEMORY[0x1E0C9D820] || v3 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[AVTCarouselPlusButtonView environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deviceIsPad");

    if (v7)
      v8 = 100.0;
    else
      v8 = 88.0;
    -[AVTCarouselPlusButtonView maxItemSize](self, "maxItemSize");
    v10 = v8 / v9;
    -[AVTCarouselPlusButtonView maxItemSize](self, "maxItemSize");
    v12 = v8 / v11;
    -[AVTCarouselPlusButtonView bounds](self, "bounds");
    v14 = v13;
    v16 = v15;
    CGAffineTransformMakeScale(&v33, v10, v12);
    v17 = v16 * v33.c + v33.a * v14;
    v18 = v16 * v33.d + v33.b * v14;
    -[AVTCarouselPlusButtonView bounds](self, "bounds");
    UIRectGetCenter();
    v20 = v19;
    v22 = v21;
    -[AVTCarouselPlusButtonView bounds](self, "bounds");
    v24 = v23;
    -[AVTCarouselPlusButtonView maxItemSize](self, "maxItemSize");
    v26 = (1.0 - v24 / v25) * 70.0;
    -[AVTCarouselPlusButtonView environment](self, "environment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "deviceIsPad");

    v29 = 0.0;
    if (!v28)
      v29 = v26;
    v30 = v20 + v29;
    -[AVTCarouselPlusButtonView button](self, "button");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v17, v18);

    -[AVTCarouselPlusButtonView button](self, "button");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCenter:", v30, v22);

  }
}

- (CGSize)maxItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxItemSize.width;
  height = self->_maxItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)allowHighlight
{
  return self->_allowHighlight;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
