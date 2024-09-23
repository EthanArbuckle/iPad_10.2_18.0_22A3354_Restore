@implementation CDComplicationHostingView

- (CDComplicationHostingView)initWithFrame:(CGRect)a3
{
  return -[CDComplicationHostingView initWithFrame:async:](self, "initWithFrame:async:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CDComplicationHostingView)initWithFrame:(CGRect)a3 async:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  CDComplicationHostingView *v9;
  _TtC19ComplicationDisplay20_ComplicationHosting *v10;
  _TtC19ComplicationDisplay20_ComplicationHosting *hosting;
  void *v12;
  objc_super v14;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)CDComplicationHostingView;
  v9 = -[CDComplicationHostingView initWithFrame:](&v14, sel_initWithFrame_);
  if (v9)
  {
    v10 = -[_ComplicationHosting initWithFrame:async:]([_TtC19ComplicationDisplay20_ComplicationHosting alloc], "initWithFrame:async:", v4, x, y, width, height);
    hosting = v9->_hosting;
    v9->_hosting = v10;

    -[_ComplicationHosting view](v9->_hosting, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDComplicationHostingView addSubview:](v9, "addSubview:", v12);

  }
  return v9;
}

+ (id)async
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithFrame:async:", 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

+ (id)sync
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithFrame:async:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (BOOL)rendersAsynchronously
{
  return -[_ComplicationHosting rendersAsynchronously](self->_hosting, "rendersAsynchronously");
}

- (id)renderStatsHandler
{
  return -[_ComplicationHosting renderStatsHandler](self->_hosting, "renderStatsHandler");
}

- (void)setRenderStatsHandler:(id)a3
{
  -[_ComplicationHosting setRenderStatsHandler:](self->_hosting, "setRenderStatsHandler:", a3);
}

- (BOOL)shouldCallRenderStatsHandlerOnMainQueue
{
  return -[_ComplicationHosting shouldCallRenderStatsHandlerOnMainQueue](self->_hosting, "shouldCallRenderStatsHandlerOnMainQueue");
}

- (void)setShouldCallRenderStatsHandlerOnMainQueue:(BOOL)a3
{
  -[_ComplicationHosting setShouldCallRenderStatsHandlerOnMainQueue:](self->_hosting, "setShouldCallRenderStatsHandlerOnMainQueue:", a3);
}

- (BOOL)shouldAccentDesaturatedView
{
  return -[_ComplicationHosting shouldAccentDesaturatedView](self->_hosting, "shouldAccentDesaturatedView");
}

- (void)setShouldAccentDesaturatedView:(BOOL)a3
{
  -[_ComplicationHosting setShouldAccentDesaturatedView:](self->_hosting, "setShouldAccentDesaturatedView:", a3);
}

- (NSData)viewData
{
  return -[_ComplicationHosting viewData](self->_hosting, "viewData");
}

- (void)setViewData:(id)a3
{
  -[_ComplicationHosting setViewData:](self->_hosting, "setViewData:", a3);
}

- (BOOL)paused
{
  return -[_ComplicationHosting paused](self->_hosting, "paused");
}

- (void)setPaused:(BOOL)a3
{
  -[_ComplicationHosting setPaused:](self->_hosting, "setPaused:", a3);
}

- (void)waitForAsyncRendering
{
  -[_ComplicationHosting waitForAsyncRendering](self->_hosting, "waitForAsyncRendering");
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CDComplicationHostingView;
  -[CDComplicationHostingView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CDComplicationHostingView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_ComplicationHosting view](self->_hosting, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)setBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CDComplicationHostingView;
  -[CDComplicationHostingView setBounds:](&v13, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CDComplicationHostingView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_ComplicationHosting view](self->_hosting, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_ComplicationHosting sizeThatFits:](self->_hosting, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return -[_ComplicationHosting filterProvider](self->_hosting, "filterProvider");
}

- (void)setFilterProvider:(id)a3
{
  -[_ComplicationHosting setFilterProvider:](self->_hosting, "setFilterProvider:", a3);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[_ComplicationHosting transitionToMonochromeWithFraction:](self->_hosting, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[_ComplicationHosting updateMonochromeColor](self->_hosting, "updateMonochromeColor");
}

- (_TtC19ComplicationDisplay20_ComplicationHosting)hosting
{
  return self->_hosting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hosting, 0);
}

@end
