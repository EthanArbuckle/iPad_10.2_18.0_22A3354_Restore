@implementation NTKRichComplicationBaseCircularOpenGaugeSwiftUIView

- (id)bottomView
{
  CDComplicationHostingView *bottomSwiftUIView;
  CDComplicationHostingView *v4;
  CDComplicationHostingView *v5;
  void *v6;
  int v7;
  _QWORD v9[4];
  id v10;
  id location;

  bottomSwiftUIView = self->_bottomSwiftUIView;
  if (!bottomSwiftUIView)
  {
    objc_msgSend(off_1E6BCA170, "async");
    v4 = (CDComplicationHostingView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bottomSwiftUIView;
    self->_bottomSwiftUIView = v4;

    -[CDComplicationHostingView setFilterProvider:](self->_bottomSwiftUIView, "setFilterProvider:", self);
    -[CDRichComplicationView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = NTKShowGossamerUI(v6);

    -[CDComplicationHostingView setShouldAccentDesaturatedView:](self->_bottomSwiftUIView, "setShouldAccentDesaturatedView:", v7 ^ 1u);
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__NTKRichComplicationBaseCircularOpenGaugeSwiftUIView_bottomView__block_invoke;
    v9[3] = &unk_1E6BCFEF8;
    objc_copyWeak(&v10, &location);
    -[CDComplicationHostingView setRenderStatsHandler:](self->_bottomSwiftUIView, "setRenderStatsHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    bottomSwiftUIView = self->_bottomSwiftUIView;
  }
  return bottomSwiftUIView;
}

void __65__NTKRichComplicationBaseCircularOpenGaugeSwiftUIView_bottomView__block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationDisplay:renderStatsWithTime:cost:", WeakRetained, a2, a3);

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
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDComplicationHostingView setPaused:](self->_bottomSwiftUIView, "setPaused:", v3);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSwiftUIView;
  v6 = a3;
  -[NTKRichComplicationCircularOpenGaugeContentView _handleTemplate:reason:](&v8, sel__handleTemplate_reason_, v6, a4);
  objc_msgSend(v6, "bottomLabelData", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDComplicationHostingView setViewData:](self->_bottomSwiftUIView, "setViewData:", v7);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSwiftUIView;
  -[NTKRichComplicationCircularOpenGaugeContentView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDComplicationHostingView transitionToMonochromeWithFraction:](self->_bottomSwiftUIView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSwiftUIView;
  -[NTKRichComplicationCircularOpenGaugeContentView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDComplicationHostingView updateMonochromeColor](self->_bottomSwiftUIView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSwiftUIView, 0);
}

@end
