@implementation NTKRichComplicationRectangularFullSwiftUIView

- (id)content
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
    v7[2] = __56__NTKRichComplicationRectangularFullSwiftUIView_content__block_invoke;
    v7[3] = &unk_1E6BCFEF8;
    objc_copyWeak(&v8, &location);
    -[CDComplicationHostingView setRenderStatsHandler:](self->_swiftUIView, "setRenderStatsHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    swiftUIView = self->_swiftUIView;
  }
  return swiftUIView;
}

void __56__NTKRichComplicationRectangularFullSwiftUIView_content__block_invoke(uint64_t a1, double a2, double a3)
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
  v5.super_class = (Class)NTKRichComplicationRectangularFullSwiftUIView;
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

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;

  objc_msgSend(a3, "contentData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CDComplicationHostingView setViewData:](self->_swiftUIView, "setViewData:", v5);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularFullSwiftUIView;
  -[CDRichComplicationView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  if ((-[CDComplicationHostingView isHidden](self->_swiftUIView, "isHidden") & 1) == 0)
    -[CDComplicationHostingView transitionToMonochromeWithFraction:](self->_swiftUIView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularFullSwiftUIView;
  -[CDRichComplicationView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  if ((-[CDComplicationHostingView isHidden](self->_swiftUIView, "isHidden") & 1) == 0)
    -[CDComplicationHostingView updateMonochromeColor](self->_swiftUIView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftUIView, 0);
}

@end
