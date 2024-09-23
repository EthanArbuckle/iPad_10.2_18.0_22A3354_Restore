@implementation NTKRichComplicationBaseCircularClosedGaugeSwiftUIView

- (id)innerView
{
  CDComplicationHostingView *swiftUIView;
  CDComplicationHostingView *v4;
  CDComplicationHostingView *v5;
  void *v6;
  int v7;
  _QWORD v9[4];
  id v10;
  id location;

  swiftUIView = self->_swiftUIView;
  if (!swiftUIView)
  {
    objc_msgSend(off_1E6BCA170, "async");
    v4 = (CDComplicationHostingView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_swiftUIView;
    self->_swiftUIView = v4;

    -[CDComplicationHostingView setFilterProvider:](self->_swiftUIView, "setFilterProvider:", self);
    -[CDRichComplicationView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = NTKShowGossamerUI(v6);

    -[CDComplicationHostingView setShouldAccentDesaturatedView:](self->_swiftUIView, "setShouldAccentDesaturatedView:", v7 ^ 1u);
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__NTKRichComplicationBaseCircularClosedGaugeSwiftUIView_innerView__block_invoke;
    v9[3] = &unk_1E6BCFEF8;
    objc_copyWeak(&v10, &location);
    -[CDComplicationHostingView setRenderStatsHandler:](self->_swiftUIView, "setRenderStatsHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    swiftUIView = self->_swiftUIView;
  }
  return swiftUIView;
}

void __66__NTKRichComplicationBaseCircularClosedGaugeSwiftUIView_innerView__block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationDisplay:renderStatsWithTime:cost:", WeakRetained, a2, a3);

}

- (id)gaugeProviderFromTemplate:(id)a3
{
  return (id)objc_msgSend(a3, "gaugeProvider");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDComplicationHostingView setPaused:](self->_swiftUIView, "setPaused:", v3);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeSwiftUIView;
  v6 = a3;
  -[NTKRichComplicationCircularClosedGaugeContentView _handleTemplate:reason:](&v8, sel__handleTemplate_reason_, v6, a4);
  objc_msgSend(v6, "labelData", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDComplicationHostingView setViewData:](self->_swiftUIView, "setViewData:", v7);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeSwiftUIView;
  -[NTKRichComplicationCircularClosedGaugeContentView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDComplicationHostingView transitionToMonochromeWithFraction:](self->_swiftUIView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeSwiftUIView;
  -[NTKRichComplicationCircularClosedGaugeContentView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDComplicationHostingView updateMonochromeColor](self->_swiftUIView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftUIView, 0);
}

@end
