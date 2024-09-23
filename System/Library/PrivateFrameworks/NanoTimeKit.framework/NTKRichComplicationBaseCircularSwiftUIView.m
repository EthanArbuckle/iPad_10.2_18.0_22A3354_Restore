@implementation NTKRichComplicationBaseCircularSwiftUIView

- (NTKRichComplicationBaseCircularSwiftUIView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationBaseCircularSwiftUIView *v3;
  uint64_t v4;
  CDComplicationHostingView *swiftUIView;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, double, double);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationBaseCircularSwiftUIView;
  v3 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v14, sel_initWithFamily_, a3);
  if (v3)
  {
    objc_msgSend(off_1E6BCA170, "async");
    v4 = objc_claimAutoreleasedReturnValue();
    swiftUIView = v3->_swiftUIView;
    v3->_swiftUIView = (CDComplicationHostingView *)v4;

    -[CDComplicationHostingView setFilterProvider:](v3->_swiftUIView, "setFilterProvider:", v3);
    objc_initWeak(&location, v3);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __61__NTKRichComplicationBaseCircularSwiftUIView_initWithFamily___block_invoke;
    v11 = &unk_1E6BCFEF8;
    objc_copyWeak(&v12, &location);
    -[CDComplicationHostingView setRenderStatsHandler:](v3->_swiftUIView, "setRenderStatsHandler:", &v8);
    -[NTKRichComplicationCircularBaseView contentView](v3, "contentView", v8, v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_swiftUIView);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __61__NTKRichComplicationBaseCircularSwiftUIView_initWithFamily___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationDisplay:renderStatsWithTime:cost:", WeakRetained, a2, a3);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationBaseCircularSwiftUIView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v14, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CDComplicationHostingView setFrame:](self->_swiftUIView, "setFrame:", v5, v7, v9, v11);
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  v12 = CGRectGetWidth(v15) * 0.5;
  -[CDComplicationHostingView layer](self->_swiftUIView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", v12);

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDComplicationHostingView setPaused:](self->_swiftUIView, "setPaused:", v3);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;

  objc_msgSend(a3, "contentData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CDComplicationHostingView setViewData:](self->_swiftUIView, "setViewData:", v5);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CDComplicationHostingView transitionToMonochromeWithFraction:](self->_swiftUIView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CDComplicationHostingView updateMonochromeColor](self->_swiftUIView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftUIView, 0);
}

@end
