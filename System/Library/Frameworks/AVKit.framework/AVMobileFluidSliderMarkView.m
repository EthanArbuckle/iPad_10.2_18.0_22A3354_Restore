@implementation AVMobileFluidSliderMarkView

- (AVMobileFluidSliderMarkView)init
{
  AVMobileFluidSliderMarkView *v2;
  void *v3;
  uint64_t v4;
  CALayer *markColorLayer;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMobileFluidSliderMarkView;
  v2 = -[AVMobileFluidSliderMarkView init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileFluidSliderMarkView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    markColorLayer = v2->_markColorLayer;
    v2->_markColorLayer = (CALayer *)v4;

    -[AVMobileFluidSliderMarkView layer](v2, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v2->_markColorLayer);

  }
  return v2;
}

- (void)setMarkColor:(id)a3
{
  UIColor *v5;
  double v6;
  double v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  if (self->_markColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_markColor, a3);
    objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (v7 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v7);
    }
    -[CALayer setBackgroundColor:](self->_markColorLayer, "setBackgroundColor:", -[UIColor CGColor](objc_retainAutorelease(v8), "CGColor"));
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v5 = v8;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileFluidSliderMarkView;
  -[AVMobileFluidSliderMarkView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[AVMobileFluidSliderMarkView bounds](self, "bounds");
  -[CALayer setFrame:](self->_markColorLayer, "setFrame:", v3, v4);
}

- (UIColor)markColor
{
  return self->_markColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markColor, 0);
  objc_storeStrong((id *)&self->_markColorLayer, 0);
}

@end
