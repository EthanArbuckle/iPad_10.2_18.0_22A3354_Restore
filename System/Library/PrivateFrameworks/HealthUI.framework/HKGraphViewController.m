@implementation HKGraphViewController

- (HKGraphViewController)initWithGraphView:(id)a3 dateZoom:(int64_t)a4
{
  id v7;
  HKGraphViewController *v8;
  HKGraphViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKGraphViewController;
  v8 = -[HKGraphViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_graphView, a3);
    -[HKGraphView setDelegate:](v9->_graphView, "setDelegate:", v9);
    objc_storeWeak((id *)&v9->_graphViewDelegateProxy, 0);
    v9->_dateZoom = a4;
  }

  return v9;
}

- (void)setDetailView:(id)a3
{
  -[HKGraphView setDetailView:](self->_graphView, "setDetailView:", a3);
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;
  char v6;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  v6 = objc_msgSend(WeakRetained, "graphViewPointSelectionDifferentiatesSeriesGroups:", v4);

  return v6;
}

- (void)graphViewDidBeginSelection:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphViewDidBeginSelection:", v4);

}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v6;
  id v7;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:didUpdateSelectedPoint:", v7, v6);

}

- (void)graphViewDidEndSelection:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphViewDidEndSelection:", v4);

}

- (void)graphView:(id)a3 didUpdateFromDateZoom:(int64_t)a4 toDateZoom:(int64_t)a5 newVisibleRange:(id)a6
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v10;
  id v11;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v10 = a6;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:didUpdateFromDateZoom:toDateZoom:newVisibleRange:", v11, a4, a5, v10);

}

- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v8;
  id v9;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:didUpdateVisibleValueRange:changeContext:", v9, v8, a5);

}

- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v6;
  id v7;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:didFinishUserScrollingToValueRange:", v7, v6);

}

- (int64_t)stackCountForGraphView:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;
  int64_t v6;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  v6 = objc_msgSend(WeakRetained, "stackCountForGraphView:", v4);

  return v6;
}

- (int64_t)primarySeriesGroupIndexForGraphView:(id)a3
{
  id v4;
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id WeakRetained;
  char v7;
  id v8;
  int64_t v9;

  v4 = a3;
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
    v9 = objc_msgSend(v8, "primarySeriesGroupIndexForGraphView:", v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)stackedSeriesGroupHeightsForGraphView:(id)a3
{
  id v4;
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  v4 = a3;
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
    objc_msgSend(v8, "stackedSeriesGroupHeightsForGraphView:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v8;
  id WeakRetained;
  void *v10;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:graphSeriesForZoom:stackOffset:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)graphViewSizeChanged:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphViewSizeChanged:", v4);

}

- (void)graphView:(id)a3 didUpdateYAxisWidth:(double)a4 toWidth:(double)a5
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v8;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:didUpdateYAxisWidth:toWidth:", v8, a4, a5);

}

- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6
{
  _BOOL8 v7;
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v10;
  id v11;
  id WeakRetained;

  v7 = a5;
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:didUpdateSeries:newDataArrived:changeContext:", v11, v10, v7, a6);

}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;
  void *v6;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "seriesSelectionLineColorForGraphView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)graphView:(id)a3 didUpdateLegendViewsWithTopLegendFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v9;
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:didUpdateLegendViewsWithTopLegendFrame:", v9, x, y, width, height);

}

- (void)graphViewDidTapYAxis:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphViewDidTapYAxis:", v4);

}

- (void)graphView:(id)a3 startupTime:(int64_t)a4
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v6;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphView:startupTime:", v6, a4);

}

- (void)graphViewExternalSelectionEnd:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphViewExternalSelectionEnd:", v4);

}

- (void)graphViewRenderedView:(id)a3
{
  HKGraphViewDelegate **p_graphViewDelegateProxy;
  id v4;
  id WeakRetained;

  p_graphViewDelegateProxy = &self->_graphViewDelegateProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_graphViewDelegateProxy);
  objc_msgSend(WeakRetained, "graphViewRenderedView:", v4);

}

- (HKGraphView)graphView
{
  return self->_graphView;
}

- (HKGraphViewDelegate)graphViewDelegateProxy
{
  return (HKGraphViewDelegate *)objc_loadWeakRetained((id *)&self->_graphViewDelegateProxy);
}

- (void)setGraphViewDelegateProxy:(id)a3
{
  objc_storeWeak((id *)&self->_graphViewDelegateProxy, a3);
}

- (HKGraphViewControllerDelegate)delegate
{
  return (HKGraphViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)dateZoom
{
  return self->_dateZoom;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_graphViewDelegateProxy);
  objc_storeStrong((id *)&self->_graphView, 0);
}

@end
