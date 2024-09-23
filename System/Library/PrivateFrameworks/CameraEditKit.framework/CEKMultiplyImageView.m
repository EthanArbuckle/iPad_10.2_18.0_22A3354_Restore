@implementation CEKMultiplyImageView

- (CEKMultiplyImageView)initWithFrame:(CGRect)a3
{
  CEKMultiplyImageView *v3;
  CEKMultiplyImageView *v4;
  CEKMultiplyImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CEKMultiplyImageView;
  v3 = -[CEKMultiplyImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CEKMultiplyImageView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = v4;
  }

  return v4;
}

- (void)setContentsMultiplyColor:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_contentsMultiplyColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentsMultiplyColor, a3);
    v5 = objc_msgSend(objc_retainAutorelease(v7), "CGColor");
    -[CEKMultiplyImageView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentsMultiplyColor:", v5);

  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    v6 = -[UIImage imageOrientation](v5, "imageOrientation");
    v7 = *MEMORY[0x1E0C9BAA8];
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v20.c = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v20.tx = v9;
    if (v6)
    {
      *(_OWORD *)&v13.a = v7;
      *(_OWORD *)&v13.c = v8;
      *(_OWORD *)&v13.tx = v9;
      -[UIImage size](v5, "size");
      memset(&v19, 0, sizeof(v19));
      CGAffineTransformMakeTranslation(&v19, v10 * -0.5, v11 * -0.5);
      t1 = v13;
      t2 = v19;
      CGAffineTransformConcat(&v20, &t1, &t2);
      PLTransformForImageOrientation();
      t2 = v20;
      CGAffineTransformConcat(&t1, &t2, &v16);
      v20 = t1;
      t1 = v19;
      CGAffineTransformInvert(&v15, &t1);
      t2 = v20;
      CGAffineTransformConcat(&t1, &t2, &v15);
      v20 = t1;
    }
    -[CEKMultiplyImageView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContents:", -[UIImage CGImage](objc_retainAutorelease(v5), "CGImage"));
    v14 = v20;
    objc_msgSend(v12, "setContentsTransform:", &v14);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CEKMultiplyImageView image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)contentsMultiplyColor
{
  return self->_contentsMultiplyColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsMultiplyColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
