@implementation NTKRichComplicationCornerGaugeSwiftUIView

- (id)_outerView
{
  CDComplicationHostingView *swiftUIView;
  CDComplicationHostingView *v4;
  CDComplicationHostingView *v5;
  _QWORD v7[4];
  id v8;
  id location;

  swiftUIView = self->_swiftUIView;
  if (!swiftUIView)
  {
    objc_msgSend(off_1E6BCA170, "async");
    v4 = (CDComplicationHostingView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_swiftUIView;
    self->_swiftUIView = v4;

    -[CDComplicationHostingView setFilterProvider:](self->_swiftUIView, "setFilterProvider:", self);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__NTKRichComplicationCornerGaugeSwiftUIView__outerView__block_invoke;
    v7[3] = &unk_1E6BCFEF8;
    objc_copyWeak(&v8, &location);
    -[CDComplicationHostingView setRenderStatsHandler:](self->_swiftUIView, "setRenderStatsHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    swiftUIView = self->_swiftUIView;
  }
  return swiftUIView;
}

void __55__NTKRichComplicationCornerGaugeSwiftUIView__outerView__block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationDisplay:renderStatsWithTime:cost:", WeakRetained, a2, a3);

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCornerGaugeSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDComplicationHostingView setPaused:](self->_swiftUIView, "setPaused:", v3);
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 8;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(v5, "labelData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDComplicationHostingView setViewData:](self->_swiftUIView, "setViewData:", v6);

  objc_msgSend(v5, "gaugeProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingTextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationCornerBaseGaugeView handleGaugeProvider:leftTextProvider:rightTextProvider:](self, "handleGaugeProvider:leftTextProvider:rightTextProvider:", v9, v7, v8);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCornerGaugeSwiftUIView;
  -[CDRichComplicationCornerBaseGaugeView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDComplicationHostingView updateMonochromeColor](self->_swiftUIView, "updateMonochromeColor");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCornerGaugeSwiftUIView;
  -[CDRichComplicationCornerBaseGaugeView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDComplicationHostingView transitionToMonochromeWithFraction:](self->_swiftUIView, "transitionToMonochromeWithFraction:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftUIView, 0);
}

@end
