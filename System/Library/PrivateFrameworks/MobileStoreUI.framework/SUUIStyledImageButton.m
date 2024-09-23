@implementation SUUIStyledImageButton

- (SUUIStyledImageButton)initWithFrame:(CGRect)a3
{
  SUUIStyledImageButton *v3;
  SUUIImageView *v4;
  uint64_t v5;
  SUUIImageView *imageView;
  SUUIImageView *v7;
  uint64_t v8;
  SUUIImageView *additionalImageView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIStyledImageButton;
  v3 = -[SUUIStyledImageButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUIImageView alloc];
    -[SUUIStyledImageButton bounds](v3, "bounds");
    v5 = -[SUUIImageView initWithFrame:](v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (SUUIImageView *)v5;

    -[SUUIImageView setAutoresizingMask:](v3->_imageView, "setAutoresizingMask:", 18);
    -[SUUIImageView setUserInteractionEnabled:](v3->_imageView, "setUserInteractionEnabled:", 0);
    -[SUUIStyledImageButton addSubview:](v3, "addSubview:", v3->_imageView);
    v7 = [SUUIImageView alloc];
    v8 = -[SUUIImageView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    additionalImageView = v3->_additionalImageView;
    v3->_additionalImageView = (SUUIImageView *)v8;

    -[SUUIImageView setAutoresizingMask:](v3->_additionalImageView, "setAutoresizingMask:", 45);
    -[SUUIImageView setUserInteractionEnabled:](v3->_additionalImageView, "setUserInteractionEnabled:", 0);
    -[SUUIStyledImageButton addSubview:](v3, "addSubview:", v3->_additionalImageView);
  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_didInitialHighlightForTouch = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUIStyledImageButton;
  -[SUUIStyledImageButton touchesBegan:withEvent:](&v4, sel_touchesBegan_withEvent_, a3, a4);
}

- (CGRect)hitRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  objc_super v15;
  CGRect result;

  if (self->_useBigHitTarget)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUUIStyledImageButton;
    -[SUUIStyledImageButton hitRect](&v15, sel_hitRect);
    v7 = 488;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SUUIStyledImageButton;
    -[SUUIStyledImageButton hitRect](&v14, sel_hitRect);
    v7 = 528;
  }
  v8 = (double *)((char *)self + v7);
  v9 = v8[1];
  v10 = v3 + v9;
  v11 = v4 + *v8;
  v12 = v5 - (v9 + v8[3]);
  v13 = v6 - (*v8 + v8[2]);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  SUUIImageView *additionalImageView;
  CGFloat v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)SUUIStyledImageButton;
  -[SUUIStyledImageButton layoutSubviews](&v9, sel_layoutSubviews);
  -[SUUIImageView imageSize](self->_additionalImageView, "imageSize");
  v4 = v3;
  v6 = v5;
  additionalImageView = self->_additionalImageView;
  -[SUUIStyledImageButton bounds](self, "bounds");
  v8 = CGRectGetMidX(v10) - v4 * 0.5;
  -[SUUIStyledImageButton bounds](self, "bounds");
  -[SUUIImageView setFrame:](additionalImageView, "setFrame:", v8, CGRectGetMidY(v11) - v6 * 0.5, v4, v6);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SUUIStyledImageButton hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)setBackgroundColor:(id)a3
{
  SUUIImageView *imageView;
  id v5;
  SUUIImageView *additionalImageView;
  void *v7;
  objc_super v8;

  imageView = self->_imageView;
  v5 = a3;
  -[SUUIImageView setBackgroundColor:](imageView, "setBackgroundColor:", v5);
  additionalImageView = self->_additionalImageView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIImageView setBackgroundColor:](additionalImageView, "setBackgroundColor:", v7);

  v8.receiver = self;
  v8.super_class = (Class)SUUIStyledImageButton;
  -[SUUIStyledImageButton setBackgroundColor:](&v8, sel_setBackgroundColor_, v5);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  _QWORD v6[6];
  objc_super v7;

  v3 = a3;
  if (-[SUUIStyledImageButton isHighlighted](self, "isHighlighted") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIStyledImageButton;
    -[SUUIStyledImageButton setHighlighted:](&v7, sel_setHighlighted_, v3);
    v5 = 1.0;
    if (v3 && (v5 = 0.2, !self->_didInitialHighlightForTouch))
    {
      -[SUUIStyledImageButton setAlpha:](self, "setAlpha:", 0.2, 0.2);
      self->_didInitialHighlightForTouch = 1;
    }
    else
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __40__SUUIStyledImageButton_setHighlighted___block_invoke;
      v6[3] = &unk_2511F5818;
      v6[4] = self;
      *(double *)&v6[5] = v5;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 327684, v6, 0, 0.47, 0.0);
    }
  }
}

uint64_t __40__SUUIStyledImageButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SUUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)bigHitInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_bigHitInsets.top;
  left = self->_bigHitInsets.left;
  bottom = self->_bigHitInsets.bottom;
  right = self->_bigHitInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBigHitInsets:(UIEdgeInsets)a3
{
  self->_bigHitInsets = a3;
}

- (SUUIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)useBigHitTarget
{
  return self->_useBigHitTarget;
}

- (void)setUseBigHitTarget:(BOOL)a3
{
  self->_useBigHitTarget = a3;
}

- (SUUIImageView)additionalImageView
{
  return self->_additionalImageView;
}

- (UIEdgeInsets)hitRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitRectInsets.top;
  left = self->_hitRectInsets.left;
  bottom = self->_hitRectInsets.bottom;
  right = self->_hitRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
