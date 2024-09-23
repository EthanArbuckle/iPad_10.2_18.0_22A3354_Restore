@implementation NTKRichComplicationBaseCircularOpenGaugeImageView

- (id)bottomView
{
  CDRichComplicationImageView *bottomImageView;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  CDRichComplicationImageView *v8;
  CDRichComplicationImageView *v9;

  bottomImageView = self->_bottomImageView;
  if (!bottomImageView)
  {
    -[CDRichComplicationView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = NTKShowGossamerUI(v4);

    v6 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (CDRichComplicationImageView *)objc_msgSend(v6, "initWithDevice:useAccentColor:", v7, v5);
    v9 = self->_bottomImageView;
    self->_bottomImageView = v8;

    -[CDRichComplicationImageView setPaused:](self->_bottomImageView, "setPaused:", -[CDRichComplicationView paused](self, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](self->_bottomImageView, "setFilterProvider:", self);
    bottomImageView = self->_bottomImageView;
  }
  return bottomImageView;
}

- (void)gaugeProvider:(id *)a3 andCenterTextProvider:(id *)a4 fromTemplate:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  objc_msgSend(v7, "gaugeProvider");
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *a4 = v8;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeImageView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDRichComplicationImageView setPaused:](self->_bottomImageView, "setPaused:", v3);
}

- (int64_t)tritiumUpdateMode
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;
  objc_super v8;

  -[CDRichComplicationImageView tritiumUpdateMode](self->_bottomImageView, "tritiumUpdateMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (v5 >= 2)
      v6 = 2;
    else
      v6 = v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeImageView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeImageView;
  -[NTKRichComplicationCircularOpenGaugeContentView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_bottomImageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeImageView;
  -[NTKRichComplicationCircularOpenGaugeContentView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDRichComplicationImageView updateMonochromeColor](self->_bottomImageView, "updateMonochromeColor");
}

- (CDRichComplicationImageView)bottomImageView
{
  return self->_bottomImageView;
}

- (void)setBottomImageView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomImageView, 0);
}

@end
