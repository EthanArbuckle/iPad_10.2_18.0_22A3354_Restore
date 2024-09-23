@implementation CAMSemanticStylePickerTileOverlayView

- (CAMSemanticStylePickerTileOverlayView)initWithFrame:(CGRect)a3
{
  CAMSemanticStylePickerTileOverlayView *v3;
  void *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *topLeftCorner;
  UIImageView *v8;
  UIImageView *topRightCorner;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  UIImageView *bottomLeftCorner;
  UIImageView *v18;
  UIImageView *bottomRightCorner;
  void *v20;
  UIView *v21;
  UIView *tileOverlay;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CAMSemanticStylePickerTileOverlayView;
  v3 = -[CAMSemanticStylePickerTileOverlayView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_materialColor = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    objc_msgSend((id)objc_opt_class(), "_sharedCornerImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithRenderingMode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    topLeftCorner = v3->__topLeftCorner;
    v3->__topLeftCorner = v6;

    -[UIImageView setImage:](v3->__topLeftCorner, "setImage:", v5);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    topRightCorner = v3->__topRightCorner;
    v3->__topRightCorner = v8;

    objc_msgSend(v5, "imageWithHorizontallyFlippedOrientation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->__topRightCorner, "setImage:", v10);

    v11 = objc_alloc(MEMORY[0x1E0DC3870]);
    v12 = objc_retainAutorelease(v5);
    v13 = objc_msgSend(v12, "CGImage");
    objc_msgSend(v12, "scale");
    v14 = (void *)objc_msgSend(v11, "initWithCGImage:scale:orientation:", v13, 5);
    objc_msgSend(v14, "imageWithRenderingMode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    bottomLeftCorner = v3->__bottomLeftCorner;
    v3->__bottomLeftCorner = v16;

    -[UIImageView setImage:](v3->__bottomLeftCorner, "setImage:", v15);
    v18 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    bottomRightCorner = v3->__bottomRightCorner;
    v3->__bottomRightCorner = v18;

    objc_msgSend(v15, "imageWithHorizontallyFlippedOrientation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->__bottomRightCorner, "setImage:", v20);

    v21 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    tileOverlay = v3->__tileOverlay;
    v3->__tileOverlay = v21;

    -[CAMSemanticStylePickerTileOverlayView addSubview:](v3, "addSubview:", v3->__tileOverlay);
    -[CAMSemanticStylePickerTileOverlayView addSubview:](v3, "addSubview:", v3->__topLeftCorner);
    -[CAMSemanticStylePickerTileOverlayView addSubview:](v3, "addSubview:", v3->__topRightCorner);
    -[CAMSemanticStylePickerTileOverlayView addSubview:](v3, "addSubview:", v3->__bottomLeftCorner);
    -[CAMSemanticStylePickerTileOverlayView addSubview:](v3, "addSubview:", v3->__bottomRightCorner);
    v3->_tileAlpha = 0.0;
    v3->_cornerTargetAlpha = 1.0;
    -[CAMSemanticStylePickerTileOverlayView _updateMaterialColor](v3, "_updateMaterialColor");
    -[CAMSemanticStylePickerTileOverlayView _updateAlphas](v3, "_updateAlphas");

  }
  return v3;
}

+ (id)_sharedCornerImage
{
  if (_sharedCornerImage_onceToken != -1)
    dispatch_once(&_sharedCornerImage_onceToken, &__block_literal_global_28);
  return (id)_sharedCornerImage___sharedCornerImage;
}

void __59__CAMSemanticStylePickerTileOverlayView__sharedCornerImage__block_invoke()
{
  CGContext *CurrentContext;
  uint64_t v1;
  void *v2;
  CGSize v3;

  v3.width = 14.0;
  v3.height = 14.0;
  UIGraphicsBeginImageContextWithOptions(v3, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, 0.0, 0.0);
  CGContextAddArc(CurrentContext, 14.0, 14.0, 14.0, 4.71238898, 3.14159265, 1);
  CGContextClosePath(CurrentContext);
  CGContextSetRGBFillColor(CurrentContext, 0.0, 0.0, 0.0, 1.0);
  CGContextFillPath(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v1 = objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v2 = (void *)_sharedCornerImage___sharedCornerImage;
  _sharedCornerImage___sharedCornerImage = v1;

}

- (void)setCornerTargetAlpha:(double)a3
{
  if (self->_cornerTargetAlpha != a3)
  {
    self->_cornerTargetAlpha = a3;
    -[CAMSemanticStylePickerTileOverlayView _updateAlphas](self, "_updateAlphas");
  }
}

- (void)setTileAlpha:(double)a3
{
  if (self->_tileAlpha != a3)
  {
    self->_tileAlpha = a3;
    -[CAMSemanticStylePickerTileOverlayView _updateAlphas](self, "_updateAlphas");
  }
}

- (void)setMaterialColor:(id)a3
{
  if (self->_materialColor != a3)
  {
    self->_materialColor = (UIColor *)a3;
    -[CAMSemanticStylePickerTileOverlayView _updateMaterialColor](self, "_updateMaterialColor");
  }
}

- (void)_updateMaterialColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CAMSemanticStylePickerTileOverlayView materialColor](self, "materialColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePickerTileOverlayView _topLeftCorner](self, "_topLeftCorner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  -[CAMSemanticStylePickerTileOverlayView materialColor](self, "materialColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePickerTileOverlayView _topRightCorner](self, "_topRightCorner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  -[CAMSemanticStylePickerTileOverlayView materialColor](self, "materialColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePickerTileOverlayView _bottomLeftCorner](self, "_bottomLeftCorner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  -[CAMSemanticStylePickerTileOverlayView materialColor](self, "materialColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePickerTileOverlayView _bottomRightCorner](self, "_bottomRightCorner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

  -[CAMSemanticStylePickerTileOverlayView materialColor](self, "materialColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePickerTileOverlayView _tileOverlay](self, "_tileOverlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

}

- (void)_updateAlphas
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[CAMSemanticStylePickerTileOverlayView tileAlpha](self, "tileAlpha");
  v4 = v3;
  -[CAMSemanticStylePickerTileOverlayView _tileOverlay](self, "_tileOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[CAMSemanticStylePickerTileOverlayView cornerTargetAlpha](self, "cornerTargetAlpha");
  v7 = v6;
  -[CAMSemanticStylePickerTileOverlayView tileAlpha](self, "tileAlpha");
  v9 = v7 - v8;
  -[CAMSemanticStylePickerTileOverlayView tileAlpha](self, "tileAlpha");
  v11 = v9 / (1.0 - v10);
  -[CAMSemanticStylePickerTileOverlayView _topLeftCorner](self, "_topLeftCorner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v11);

  -[CAMSemanticStylePickerTileOverlayView _topRightCorner](self, "_topRightCorner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", v11);

  -[CAMSemanticStylePickerTileOverlayView _bottomLeftCorner](self, "_bottomLeftCorner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v11);

  -[CAMSemanticStylePickerTileOverlayView _bottomRightCorner](self, "_bottomRightCorner");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", v11);

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
  id v15;

  -[CAMSemanticStylePickerTileOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMSemanticStylePickerTileOverlayView _tileOverlay](self, "_tileOverlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CAMSemanticStylePickerTileOverlayView _topLeftCorner](self, "_topLeftCorner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, 14.0, 14.0);

  -[CAMSemanticStylePickerTileOverlayView _topRightCorner](self, "_topRightCorner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v8 + -14.0, 0.0, 14.0, 14.0);

  -[CAMSemanticStylePickerTileOverlayView _bottomLeftCorner](self, "_bottomLeftCorner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", 0.0, v10 + -14.0, 14.0, 14.0);

  -[CAMSemanticStylePickerTileOverlayView _bottomRightCorner](self, "_bottomRightCorner");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8 + -14.0, v10 + -14.0, 14.0, 14.0);

}

- (UIImageView)_topLeftCorner
{
  return self->__topLeftCorner;
}

- (UIImageView)_topRightCorner
{
  return self->__topRightCorner;
}

- (UIImageView)_bottomLeftCorner
{
  return self->__bottomLeftCorner;
}

- (UIImageView)_bottomRightCorner
{
  return self->__bottomRightCorner;
}

- (UIView)_tileOverlay
{
  return self->__tileOverlay;
}

- (double)cornerTargetAlpha
{
  return self->_cornerTargetAlpha;
}

- (double)tileAlpha
{
  return self->_tileAlpha;
}

- (UIColor)materialColor
{
  return self->_materialColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tileOverlay, 0);
  objc_storeStrong((id *)&self->__bottomRightCorner, 0);
  objc_storeStrong((id *)&self->__bottomLeftCorner, 0);
  objc_storeStrong((id *)&self->__topRightCorner, 0);
  objc_storeStrong((id *)&self->__topLeftCorner, 0);
}

@end
