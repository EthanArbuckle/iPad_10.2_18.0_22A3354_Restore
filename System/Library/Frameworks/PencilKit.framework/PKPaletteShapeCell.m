@implementation PKPaletteShapeCell

- (PKPaletteShapeCell)initWithFrame:(CGRect)a3
{
  PKPaletteShapeCell *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaletteShapeCell;
  v3 = -[PKPaletteShapeCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView layer](v3->_imageView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 4.0);

    -[UIImageView layer](v3->_imageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);

    -[PKPaletteShapeCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_imageView);

  }
  return v3;
}

- (void)setShape:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_shape, a3);
  v5 = a3;
  objc_msgSend(v5, "image");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteShapeCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

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
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPaletteShapeCell;
  -[PKPaletteShapeCell layoutSubviews](&v16, sel_layoutSubviews);
  -[PKPaletteShapeCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPaletteShapeCell imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteButtonBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteShapeCell imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_toolTintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteShapeCell imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v14);

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (PKPaletteShape)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
