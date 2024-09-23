@implementation _MSStickerCollectionViewCell

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MSStickerCollectionViewCell;
  -[_MSStickerCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[_MSStickerCollectionViewCell setSticker:](self, "setSticker:", 0);
  if (self->_borderLayer)
  {
    -[_MSStickerCollectionViewCell borderLayer](self, "borderLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v28.receiver = self;
  v28.super_class = (Class)_MSStickerCollectionViewCell;
  -[_MSStickerCollectionViewCell layoutSubviews](&v28, sel_layoutSubviews);
  -[_MSStickerCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v26 = v6;
  v27 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_MSStickerCollectionViewCell stickerView](self, "stickerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");
  objc_msgSend(v12, "sizeThatFits:", v9, v11);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "frame");
  v18 = v17;
  v20 = v19;
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  v21 = CGRectGetWidth(v29) * 0.5;
  v30.origin.x = v18;
  v30.origin.y = v20;
  v30.size.width = v14;
  v30.size.height = v16;
  v22 = v21 - CGRectGetWidth(v30) * 0.5;
  v31.origin.y = v26;
  v31.origin.x = v27;
  v31.size.width = v9;
  v31.size.height = v11;
  v23 = CGRectGetHeight(v31) * 0.5;
  v32.origin.x = v22;
  v32.origin.y = v20;
  v32.size.width = v14;
  v32.size.height = v16;
  objc_msgSend(v12, "setFrame:", v22, v23 - CGRectGetHeight(v32) * 0.5, v14, v16);
  if (self->_borderLayer)
  {
    -[_MSStickerCollectionViewCell borderLayer](self, "borderLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBounds:", 0.0, 0.0, v9, 44.0);
    objc_msgSend(v12, "center");
    objc_msgSend(v24, "setPosition:");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.690196097, 0.70588237, 0.729411781, 1.0);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "setBorderColor:", objc_msgSend(v25, "CGColor"));

    objc_msgSend(v24, "setBorderWidth:", 0.5);
    objc_msgSend(v24, "setCornerRadius:", 5.0);

  }
}

- (MSStickerView)stickerView
{
  MSStickerView *stickerView;
  MSStickerView *v4;
  void *v5;
  MSStickerView *v6;
  void *v7;
  MSStickerView *v8;

  stickerView = self->_stickerView;
  if (!stickerView)
  {
    v4 = [MSStickerView alloc];
    -[_MSStickerCollectionViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = -[MSStickerView initWithFrame:sticker:](v4, "initWithFrame:sticker:", 0);

    -[_MSStickerCollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    v8 = self->_stickerView;
    self->_stickerView = v6;

    stickerView = self->_stickerView;
  }
  return stickerView;
}

- (CALayer)borderLayer
{
  CALayer *borderLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;

  borderLayer = self->_borderLayer;
  if (!borderLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_borderLayer;
    self->_borderLayer = v4;

    -[CALayer setHidden:](self->_borderLayer, "setHidden:", 1);
    -[_MSStickerCollectionViewCell layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", self->_borderLayer);

    borderLayer = self->_borderLayer;
  }
  return borderLayer;
}

- (MSStickerPrivate)sticker
{
  void *v2;
  void *v3;

  -[_MSStickerCollectionViewCell stickerView](self, "stickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sticker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MSStickerPrivate *)v3;
}

- (void)setSticker:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_MSStickerCollectionViewCell stickerView](self, "stickerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSticker:", v4);

  -[_MSStickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)showCellBorder:(BOOL)a3
{
  BOOL v3;
  _BOOL4 v4;
  id v5;

  if (self->_borderLayer)
    v3 = 0;
  else
    v3 = !a3;
  if (!v3)
  {
    v4 = a3;
    -[_MSStickerCollectionViewCell borderLayer](self, "borderLayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", !v4);

  }
}

- (void)setAnimating:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MSStickerCollectionViewCell stickerView](self, "stickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimating:", v3);

}

- (void)setBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_borderLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_stickerView, 0);
}

@end
