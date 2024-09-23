@implementation AVTStickerRecentsButtonCollectionViewCell

+ (id)identifier
{
  return CFSTR("AVTStickerRecentsButtonCollectionViewCell");
}

- (AVTStickerRecentsButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTStickerRecentsButtonCollectionViewCell *v3;
  void *v4;
  void *v5;
  CAShapeLayer *v6;
  CAShapeLayer *circularBackgroundLayer;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVTStickerRecentsButtonCollectionViewCell;
  v3 = -[AVTStickerRecentsStickerCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerRecentsStickerCollectionViewCell imageView](v3, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

    v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    circularBackgroundLayer = v3->_circularBackgroundLayer;
    v3->_circularBackgroundLayer = v6;

    objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_circularBackgroundLayer, "setFillColor:", objc_msgSend(v8, "CGColor"));

    -[AVTStickerRecentsButtonCollectionViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[CAShapeLayer setFrame:](v3->_circularBackgroundLayer, "setFrame:");

    -[AVTStickerRecentsButtonCollectionViewCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v3->_circularBackgroundLayer);

    -[AVTStickerRecentsButtonCollectionViewCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerRecentsStickerCollectionViewCell imageView](v3, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bringSubviewToFront:", v13);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsButtonCollectionViewCell;
  v4 = a3;
  -[AVTStickerRecentsButtonCollectionViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[AVTStickerRecentsButtonCollectionViewCell traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_circularBackgroundLayer, "setFillColor:", objc_msgSend(v8, "CGColor"));

  }
}

- (CGRect)contentBounds
{
  CGRect v2;

  -[AVTStickerRecentsButtonCollectionViewCell circleLayerRect](self, "circleLayerRect");
  return CGRectInset(v2, v2.size.width * 0.175, v2.size.height * 0.175);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTStickerRecentsButtonCollectionViewCell;
  -[AVTStickerRecentsStickerCollectionViewCell layoutSubviews](&v6, sel_layoutSubviews);
  -[AVTStickerRecentsButtonCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[CAShapeLayer setFrame:](self->_circularBackgroundLayer, "setFrame:");

  v4 = (void *)MEMORY[0x1E0CEA390];
  -[AVTStickerRecentsButtonCollectionViewCell circleLayerRect](self, "circleLayerRect");
  objc_msgSend(v4, "bezierPathWithOvalInRect:");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_circularBackgroundLayer, "setPath:", objc_msgSend(v5, "CGPath"));

}

- (CGRect)circleLayerRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[AVTStickerRecentsButtonCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = fmin(v5, 40.0);
  v9 = fmin(v7, 40.0);
  -[AVTStickerRecentsButtonCollectionViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = floor((v11 - v8) * 0.5);

  -[AVTStickerRecentsButtonCollectionViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = floor((v14 - v9) * 0.5);

  v16 = v12;
  v17 = v15;
  v18 = v8;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)updateWithDefaultImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    AVTMoreButtonImage();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (CAShapeLayer)circularBackgroundLayer
{
  return self->_circularBackgroundLayer;
}

- (void)setCircularBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circularBackgroundLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularBackgroundLayer, 0);
}

@end
