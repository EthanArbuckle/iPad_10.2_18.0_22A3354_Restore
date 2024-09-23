@implementation NTKUtilitySmallRingComplicationView

- (NTKUtilitySmallRingComplicationView)initWithFrame:(CGRect)a3
{
  NTKUtilitySmallRingComplicationView *v3;
  NTKUtilitySmallRingComplicationView *v4;
  void *v5;
  uint64_t v6;
  CLKUIColoringImageView *fillFractionRing;
  CLKUIColoringImageView *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _BYTE v13[64];
  double v14;

  v12.receiver = self;
  v12.super_class = (Class)NTKUtilitySmallRingComplicationView;
  v3 = -[NTKUtilityCircularComplicationView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKUtilityComplicationView device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v5, v13);
    v6 = -[NTKUtilityComplicationView _newImageViewSubviewWithAlpha:](v4, "_newImageViewSubviewWithAlpha:", v14);
    fillFractionRing = v4->_fillFractionRing;
    v4->_fillFractionRing = (CLKUIColoringImageView *)v6;

    v8 = v4->_fillFractionRing;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringImageView setColor:](v8, "setColor:", v9);

    -[NTKUtilityCircularComplicationView contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_fillFractionRing);

  }
  return v4;
}

- (void)_applyForegroundAlpha
{
  CLKUIColoringImageView *fillFractionRing;
  void *v4;
  objc_super v5;
  _BYTE v6[64];
  double v7;

  v5.receiver = self;
  v5.super_class = (Class)NTKUtilitySmallRingComplicationView;
  -[NTKUtilityComplicationView _applyForegroundAlpha](&v5, sel__applyForegroundAlpha);
  if (!-[NTKUtilityComplicationView editing](self, "editing"))
  {
    fillFractionRing = self->_fillFractionRing;
    -[NTKUtilityComplicationView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v4, v6);
    -[CLKUIColoringImageView setAlpha:](fillFractionRing, "setAlpha:", v7);

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKUtilitySmallRingComplicationView;
  -[NTKUtilityCircularComplicationView layoutSubviews](&v13, sel_layoutSubviews);
  -[NTKUtilityCircularComplicationView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[CLKUIColoringImageView sizeToFit](self->_fillFractionRing, "sizeToFit");
  -[CLKUIColoringImageView frame](self->_fillFractionRing, "frame");
  -[NTKUtilityComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CLKUIColoringImageView setFrame:](self->_fillFractionRing, "setFrame:", v6, v8, v10, v12);
}

- (void)updateRingWithRingDescription:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  id v8;
  _BYTE v9[64];
  double v10;
  double v11;

  v8 = a3;
  -[NTKUtilityComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v4, v9);
  v5 = v11;
  -[NTKUtilityComplicationView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v6, v9);
  v7 = v5 / v10;

  -[NTKUtilitySmallRingComplicationView updateRingWithRingDescription:backgroundRingAlpha:](self, "updateRingWithRingDescription:backgroundRingAlpha:", v8, v7);
}

- (void)updateRingWithRingDescription:(id)a3 backgroundRingAlpha:(double)a4
{
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  _BYTE v14[48];
  double v15;
  double v16;

  v13 = a3;
  objc_msgSend(v13, "fillFraction");
  if (!CLKFloatEqualsFloat() || !self->_didDrawOnce)
  {
    objc_msgSend(v13, "fillFraction");
    *(float *)&v6 = v6;
    self->_fillFraction = *(float *)&v6;
    -[NTKUtilityComplicationView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v7, v14);
    objc_msgSend(v13, "setRadius:", v15 * 0.5);

    -[NTKUtilityComplicationView device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v8, v14);
    objc_msgSend(v13, "setStrokeWidth:", v16);

    objc_msgSend(v13, "setBackgroundRingAlpha:", a4);
    objc_msgSend(v13, "ringImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringImageView setImage:](self->_fillFractionRing, "setImage:", v9);

    -[NTKUtilitySmallRingComplicationView ringColor](self, "ringColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NTKUtilityComplicationView colorScheme](self, "colorScheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsOverrideFaceColor");

      if (v12)
        -[CLKUIColoringImageView setColor:](self->_fillFractionRing, "setColor:", v10);
    }
    self->_didDrawOnce = 1;
    -[NTKUtilitySmallRingComplicationView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUIColoringImageView *))a3 + 2))(a3, self->_fillFractionRing);
}

- (id)ringColor
{
  return 0;
}

- (CLKUIColoringImageView)fillFractionRing
{
  return self->_fillFractionRing;
}

- (void)setFillFractionRing:(id)a3
{
  objc_storeStrong((id *)&self->_fillFractionRing, a3);
}

- (float)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(float)a3
{
  self->_fillFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillFractionRing, 0);
}

@end
