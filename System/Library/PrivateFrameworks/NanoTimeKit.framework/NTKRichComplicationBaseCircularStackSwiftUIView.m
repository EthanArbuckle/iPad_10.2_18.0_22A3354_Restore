@implementation NTKRichComplicationBaseCircularStackSwiftUIView

- (id)line1View
{
  CDComplicationHostingView *line1SwiftUIView;
  CDComplicationHostingView *v4;
  CDComplicationHostingView *v5;
  _QWORD v7[4];
  id v8;
  id location;

  line1SwiftUIView = self->_line1SwiftUIView;
  if (!line1SwiftUIView)
  {
    objc_msgSend(off_1E6BCA170, "async");
    v4 = (CDComplicationHostingView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_line1SwiftUIView;
    self->_line1SwiftUIView = v4;

    -[CDComplicationHostingView setFilterProvider:](self->_line1SwiftUIView, "setFilterProvider:", self);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__NTKRichComplicationBaseCircularStackSwiftUIView_line1View__block_invoke;
    v7[3] = &unk_1E6BCFEF8;
    objc_copyWeak(&v8, &location);
    -[CDComplicationHostingView setRenderStatsHandler:](self->_line1SwiftUIView, "setRenderStatsHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    line1SwiftUIView = self->_line1SwiftUIView;
  }
  return line1SwiftUIView;
}

void __60__NTKRichComplicationBaseCircularStackSwiftUIView_line1View__block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationDisplay:renderStatsWithTime:cost:", WeakRetained, a2, a3);

}

- (id)line2TextProviderFromTemplate:(id)a3
{
  return (id)objc_msgSend(a3, "textProvider");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDComplicationHostingView setPaused:](self->_line1SwiftUIView, "setPaused:", v3);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBaseCircularStackSwiftUIView;
  v6 = a3;
  -[NTKRichComplicationCircularStackContentTextView _handleTemplate:reason:](&v8, sel__handleTemplate_reason_, v6, a4);
  objc_msgSend(v6, "contentData", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDComplicationHostingView setViewData:](self->_line1SwiftUIView, "setViewData:", v7);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackSwiftUIView;
  -[NTKRichComplicationCircularStackContentTextView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDComplicationHostingView transitionToMonochromeWithFraction:](self->_line1SwiftUIView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularStackSwiftUIView;
  -[NTKRichComplicationCircularStackContentTextView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDComplicationHostingView updateMonochromeColor](self->_line1SwiftUIView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line1SwiftUIView, 0);
}

@end
