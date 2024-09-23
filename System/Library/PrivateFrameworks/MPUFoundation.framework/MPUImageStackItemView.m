@implementation MPUImageStackItemView

- (MPUImageStackItemView)initWithFrame:(CGRect)a3
{
  char *v3;
  MPUImageStackItemView *v4;
  uint64_t v5;
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIImageView *imageView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MPUImageStackItemView;
  v3 = -[MPUImageStackItemView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (MPUImageStackItemView *)v3;
  if (v3)
  {
    v5 = MEMORY[0x24BDBD8B8];
    v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)(v3 + 472) = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)(v3 + 488) = v6;
    *(_OWORD *)(v3 + 504) = *(_OWORD *)(v5 + 32);
    *((_QWORD *)v3 + 54) = 0x3FF0000000000000;
    objc_msgSend(v3, "bounds");
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v7, v8, v9, v10);
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v11;

    -[MPUImageStackItemView addSubview:](v4, "addSubview:", v4->_imageView);
  }
  return v4;
}

- (void)layoutSubviews
{
  UIImageView *imageView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUImageStackItemView;
  -[MPUImageStackItemView layoutSubviews](&v4, sel_layoutSubviews);
  imageView = self->_imageView;
  -[MPUImageStackItemView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage **p_image;
  float v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[UIImageView setImage:](self->_imageView, "setImage:", *p_image);
    -[UIImageView setHidden:](self->_imageView, "setHidden:", *p_image == 0);
    v7 = self->_imageAlpha + -1.0;
    -[UIImageView setOpaque:](self->_imageView, "setOpaque:", fabsf(v7) < 0.00000011921);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    v5 = v8;
  }

}

- (void)setImageAlpha:(double)a3
{
  float v4;

  if (self->_imageAlpha != a3)
  {
    self->_imageAlpha = a3;
    -[UIImageView setAlpha:](self->_imageView, "setAlpha:");
    v4 = self->_imageAlpha + -1.0;
    -[UIImageView setOpaque:](self->_imageView, "setOpaque:", fabsf(v4) < 0.00000011921);
  }
}

- (void)setImageContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_imageContentsRect;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_imageContentsRect = &self->_imageContentsRect;
  if (!CGRectEqualToRect(self->_imageContentsRect, a3))
  {
    p_imageContentsRect->origin.x = x;
    p_imageContentsRect->origin.y = y;
    p_imageContentsRect->size.width = width;
    p_imageContentsRect->size.height = height;
    -[UIImageView layer](self->_imageView, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsRect:", p_imageContentsRect->origin.x, p_imageContentsRect->origin.y, p_imageContentsRect->size.width, p_imageContentsRect->size.height);

  }
}

- (void)setImageTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_imageTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  CGAffineTransform v12;
  CGAffineTransform t1;

  p_imageTransform = &self->_imageTransform;
  v6 = *(_OWORD *)&self->_imageTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_imageTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_imageTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_imageTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_imageTransform->tx = v9;
    *(_OWORD *)&p_imageTransform->a = v8;
    -[UIImageView layer](self->_imageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)&p_imageTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_imageTransform->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_imageTransform->tx;
    objc_msgSend(v10, "setAffineTransform:", &t1);

  }
}

- (UIImage)image
{
  return self->_image;
}

- (double)imageAlpha
{
  return self->_imageAlpha;
}

- (CGRect)imageContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageContentsRect.origin.x;
  y = self->_imageContentsRect.origin.y;
  width = self->_imageContentsRect.size.width;
  height = self->_imageContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGAffineTransform)imageTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[10].d;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
