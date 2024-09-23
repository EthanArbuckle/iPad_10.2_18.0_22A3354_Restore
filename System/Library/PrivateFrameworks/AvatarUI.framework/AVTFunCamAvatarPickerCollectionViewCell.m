@implementation AVTFunCamAvatarPickerCollectionViewCell

+ (id)cellIdentifier
{
  return CFSTR("AVTFunCamAvatarPickerCollectionViewCell");
}

+ (CGPath)selectionPathInBounds:(CGRect)a3
{
  id v3;
  CGPath *v4;
  CGRect v6;

  v6 = CGRectInset(a3, 1.5, 1.5);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 12.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGPath *)objc_msgSend(v3, "CGPath");

  return v4;
}

- (AVTFunCamAvatarPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTFunCamAvatarPickerCollectionViewCell *v3;
  CAShapeLayer *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  CAShapeLayer *selectionLayer;
  CAShapeLayer *v10;
  void *v11;
  void *v12;
  AVTUIAnimatingImageView *v13;
  void *v14;
  AVTUIAnimatingImageView *v15;
  void *v16;
  AVTUIAnimatingImageView *imageView;
  AVTUIAnimatingImageView *v18;
  uint64_t v19;
  id imageInsetProvider;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCell;
  v3 = -[AVTFunCamAvatarPickerCollectionViewCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    v5 = (void *)objc_opt_class();
    -[AVTFunCamAvatarPickerCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    -[CAShapeLayer setPath:](v4, "setPath:", objc_msgSend(v5, "selectionPathInBounds:"));

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.3);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v4, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    -[CAShapeLayer setLineWidth:](v4, "setLineWidth:", 3.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v4, "setFillColor:", objc_msgSend(v8, "CGColor"));

    selectionLayer = v3->_selectionLayer;
    v3->_selectionLayer = v4;
    v10 = v4;

    -[AVTFunCamAvatarPickerCollectionViewCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", v10);

    v13 = [AVTUIAnimatingImageView alloc];
    -[AVTFunCamAvatarPickerCollectionViewCell contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v15 = -[AVTUIAnimatingImageView initWithFrame:](v13, "initWithFrame:");

    -[AVTFunCamAvatarPickerCollectionViewCell contentView](v3, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

    imageView = v3->_imageView;
    v3->_imageView = v15;
    v18 = v15;

    +[AVTFunCamAvatarPickerStyle insetProviderForConstant:](AVTFunCamAvatarPickerStyle, "insetProviderForConstant:", 0.0);
    v19 = objc_claimAutoreleasedReturnValue();
    imageInsetProvider = v3->_imageInsetProvider;
    v3->_imageInsetProvider = (id)v19;

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double (**v16)(_QWORD, double);
  uint64_t v17;
  CGFloat Width;
  CGFloat v19;
  double v20;
  double height;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v36.receiver = self;
  v36.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCell;
  -[AVTFunCamAvatarPickerCollectionViewCell layoutSubviews](&v36, sel_layoutSubviews);
  v3 = (void *)objc_opt_class();
  -[AVTFunCamAvatarPickerCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "selectionPathInBounds:");
  -[AVTFunCamAvatarPickerCollectionViewCell selectionLayer](self, "selectionLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", v5);

  -[AVTFunCamAvatarPickerCollectionViewCell updateSelectionLayer](self, "updateSelectionLayer");
  -[AVTFunCamAvatarPickerCollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (-[AVTFunCamAvatarPickerCollectionViewCell showsTitle](self, "showsTitle"))
    v15 = v15 + -14.0;
  -[AVTFunCamAvatarPickerCollectionViewCell imageInsetProvider](self, "imageInsetProvider");
  v16 = (double (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerCollectionViewCell contentView](self, "contentView");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v17, "bounds");
  Width = CGRectGetWidth(v37);
  v19 = v16[2](v16, Width);

  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  v39 = CGRectInset(v38, v19, v19);
  v20 = v39.size.width;
  height = v39.size.height;
  v22 = *MEMORY[0x1E0C9D538];
  v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  UIRectGetCenter();
  v25 = v24;
  v27 = v26;
  -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v41.origin.x = v22;
  v41.origin.y = v23;
  v41.size.width = v20;
  v41.size.height = height;
  LOBYTE(v17) = CGRectEqualToRect(v40, v41);

  if ((v17 & 1) == 0)
  {
    -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBounds:", v22, v23, v20, height);

  }
  -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "center");
  v32 = v31;
  v34 = v33;

  if (v32 != v25 || v34 != v27)
  {
    -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCenter:", v25, v27);

  }
}

- (void)updateWithImage:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:animated:", v6, v4);

}

- (void)updateWithTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (void)setSelectionVisible:(BOOL)a3
{
  if (self->_selectionVisible != a3)
  {
    self->_selectionVisible = a3;
    -[AVTFunCamAvatarPickerCollectionViewCell updateSelectionLayer](self, "updateSelectionLayer");
  }
}

- (void)setImageInsetProvider:(id)a3
{
  void *v4;
  id imageInsetProvider;

  if (self->_imageInsetProvider != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    imageInsetProvider = self->_imageInsetProvider;
    self->_imageInsetProvider = v4;

    -[AVTFunCamAvatarPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageZoomFactor:(double)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  CGAffineTransform *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  _OWORD v10[3];

  if (a3 == 1.0)
  {
    -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v10[0] = *MEMORY[0x1E0C9BAA8];
    v10[1] = v6;
    v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v7 = (CGAffineTransform *)v10;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, a3, a3);
    -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v8 = v9;
    v7 = &v8;
  }
  objc_msgSend(v4, "setTransform:", v7, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);

}

- (void)setImageContentMode:(int64_t)a3
{
  id v4;

  if (self->_imageContentMode != a3)
  {
    self->_imageContentMode = a3;
    -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentMode:", a3);

  }
}

- (void)setRoundImageCorners:(BOOL)a3
{
  void *v4;
  double v5;
  id v6;

  if (self->_roundImageCorners != a3)
  {
    self->_roundImageCorners = a3;
    -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 6.0;
    if (!self->_roundImageCorners)
      v5 = 0.0;
    objc_msgSend(v4, "setContinuousCornerRadius:", v5);

  }
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCell;
  -[AVTFunCamAvatarPickerCollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[AVTFunCamAvatarPickerCollectionViewCell updateSelectionLayer](self, "updateSelectionLayer");
}

- (void)updateSelectionLayer
{
  float v3;
  void *v4;
  double v5;

  v3 = 0.0;
  if (-[AVTFunCamAvatarPickerCollectionViewCell selectionVisible](self, "selectionVisible"))
  {
    if (-[AVTFunCamAvatarPickerCollectionViewCell isSelected](self, "isSelected"))
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVTFunCamAvatarPickerCollectionViewCell selectionLayer](self, "selectionLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v3;
  objc_msgSend(v4, "setOpacity:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCell;
  -[AVTFunCamAvatarPickerCollectionViewCell prepareForReuse](&v8, sel_prepareForReuse);
  -[AVTFunCamAvatarPickerCollectionViewCell setImageZoomFactor:](self, "setImageZoomFactor:", 1.0);
  -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  +[AVTFunCamAvatarPickerStyle insetProviderForConstant:](AVTFunCamAvatarPickerStyle, "insetProviderForConstant:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerCollectionViewCell setImageInsetProvider:](self, "setImageInsetProvider:", v4);

  -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVTFunCamAvatarPickerCollectionViewCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", 0);

  }
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displaySessionUUID, a3);
}

- (id)imageInsetProvider
{
  return self->_imageInsetProvider;
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (BOOL)selectionVisible
{
  return self->_selectionVisible;
}

- (BOOL)roundImageCorners
{
  return self->_roundImageCorners;
}

- (BOOL)showsTitle
{
  return self->_showsTitle;
}

- (void)setShowsTitle:(BOOL)a3
{
  self->_showsTitle = a3;
}

- (CGSize)engagedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_engagedSize.width;
  height = self->_engagedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEngagedSize:(CGSize)a3
{
  self->_engagedSize = a3;
}

- (AVTUIAnimatingImageView)imageView
{
  return self->_imageView;
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong(&self->_imageInsetProvider, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

@end
