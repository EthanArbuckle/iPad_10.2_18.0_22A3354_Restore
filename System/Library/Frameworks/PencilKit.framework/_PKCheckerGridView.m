@implementation _PKCheckerGridView

- (_PKCheckerGridView)initWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  _PKCheckerGridView *v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_PKCheckerGridView initWithTileSize:colorA:colorB:](self, "initWithTileSize:colorA:colorB:", v4, v5, 5.0);

  return v6;
}

- (_PKCheckerGridView)initWithTileSize:(double)a3 colorA:(id)a4 colorB:(id)a5
{
  id v9;
  id v10;
  _PKCheckerGridView *v11;
  _PKCheckerGridView *v12;
  UIImageView *v13;
  UIImageView *imageView;
  void *v15;
  objc_super v17;

  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PKCheckerGridView;
  v11 = -[_PKCheckerGridView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    v11->_tileSize = a3;
    objc_storeStrong((id *)&v11->_colorA, a4);
    objc_storeStrong((id *)&v12->_colorB, a5);
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v12->_imageView;
    v12->_imageView = v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v12->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_PKCheckerGridView imageView](v12, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKCheckerGridView addSubview:](v12, "addSubview:", v15);

    -[_PKCheckerGridView _updateUI](v12, "_updateUI");
  }

  return v12;
}

- (void)setTileSize:(double)a3
{
  self->_tileSize = a3;
  -[_PKCheckerGridView _updateUI](self, "_updateUI");
  -[_PKCheckerGridView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setColorA:(id)a3
{
  objc_storeStrong((id *)&self->_colorA, a3);
  -[_PKCheckerGridView _updateUI](self, "_updateUI");
  -[_PKCheckerGridView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setColorB:(id)a3
{
  objc_storeStrong((id *)&self->_colorB, a3);
  -[_PKCheckerGridView _updateUI](self, "_updateUI");
  -[_PKCheckerGridView setNeedsLayout](self, "setNeedsLayout");
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_PKCheckerGridView;
  -[_PKCheckerGridView layoutSubviews](&v12, sel_layoutSubviews);
  -[_PKCheckerGridView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_PKCheckerGridView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)_updateUI
{
  void *v3;
  id v4;

  -[_PKCheckerGridView _createGridTileImage](self, "_createGridTileImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_PKCheckerGridView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

}

- (id)_createGridTileImage
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  -[_PKCheckerGridView tileSize](self, "tileSize");
  UIRoundToViewScale();
  v4 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v4 + v4, v4 + v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42___PKCheckerGridView__createGridTileImage__block_invoke;
  v9[3] = &unk_1E7778A30;
  v9[4] = self;
  *(double *)&v9[5] = v4;
  objc_msgSend(v5, "imageWithActions:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)tileSize
{
  return self->_tileSize;
}

- (UIColor)colorA
{
  return self->_colorA;
}

- (UIColor)colorB
{
  return self->_colorB;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_colorB, 0);
  objc_storeStrong((id *)&self->_colorA, 0);
}

@end
