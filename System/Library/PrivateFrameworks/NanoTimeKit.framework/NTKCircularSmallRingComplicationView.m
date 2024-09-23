@implementation NTKCircularSmallRingComplicationView

- (NTKCircularSmallRingComplicationView)initWithFrame:(CGRect)a3
{
  NTKCircularSmallRingComplicationView *v3;
  NTKCircularSmallRingComplicationView *v4;
  id v5;
  uint64_t v6;
  CLKUIColoringImageView *fillFractionRing;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKCircularSmallRingComplicationView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKCircularComplicationView setWantsPlatter:](v3, "setWantsPlatter:", 0);
    v5 = objc_alloc((Class)off_1E6BCA6D8);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    fillFractionRing = v4->_fillFractionRing;
    v4->_fillFractionRing = (CLKUIColoringImageView *)v6;

    -[NTKCircularSmallRingComplicationView addSubview:](v4, "addSubview:", v4->_fillFractionRing);
  }
  return v4;
}

- (void)setUsesMediumLayout:(BOOL)a3
{
  objc_super v3;

  self->_didDrawOnce = 0;
  v3.receiver = self;
  v3.super_class = (Class)NTKCircularSmallRingComplicationView;
  -[NTKCircularComplicationView setUsesMediumLayout:](&v3, sel_setUsesMediumLayout_, a3);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallRingComplicationView;
  -[NTKCircularComplicationView layoutSubviews](&v4, sel_layoutSubviews);
  -[NTKCircularSmallRingComplicationView bounds](self, "bounds");
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[NTKCircularComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  -[CLKUIColoringImageView setFrame:](self->_fillFractionRing, "setFrame:");

}

- (void)updateRingWithRingDescription:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "fillFraction");
  if (!CLKFloatEqualsFloat() || !self->_didDrawOnce)
  {
    objc_msgSend(v4, "fillFraction");
    self->_fillFraction = v5;
    -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
    objc_msgSend(v4, "setRadius:", v8 * 0.5);
    -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
    objc_msgSend(v4, "setStrokeWidth:", v7);
    objc_msgSend(v4, "ringImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringImageView setImage:](self->_fillFractionRing, "setImage:", v6);

    self->_didDrawOnce = 1;
    -[NTKCircularSmallRingComplicationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)updateRingWithOverrideColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_ringOverrideColor, a3);
  if (self->_ringOverrideColor)
  {
    -[CLKUIColoringImageView setColor:](self->_fillFractionRing, "setColor:");
  }
  else
  {
    -[NTKCircularComplicationView _computedForegroundColor](self, "_computedForegroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringImageView setColor:](self->_fillFractionRing, "setColor:", v5);

  }
  -[NTKCircularSmallRingComplicationView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setForegroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallRingComplicationView;
  -[NTKCircularComplicationView setForegroundColor:](&v4, sel_setForegroundColor_, a3);
  if (self->_ringOverrideColor)
  {
    -[CLKUIColoringImageView setColor:](self->_fillFractionRing, "setColor:");
    -[NTKCircularSmallRingComplicationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUIColoringImageView *))a3 + 2))(a3, self->_fillFractionRing);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringOverrideColor, 0);
  objc_storeStrong((id *)&self->_fillFractionRing, 0);
}

@end
