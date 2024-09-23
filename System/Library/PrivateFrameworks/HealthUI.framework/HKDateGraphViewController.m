@implementation HKDateGraphViewController

- (HKDateGraphViewController)initWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6
{
  return -[HKDateGraphViewController initWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:customDateAxis:](self, "initWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:customDateAxis:", a3, a4, a6, 0, a5);
}

- (HKDateGraphViewController)initWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6 customDateAxis:(id)a7
{
  id v13;
  void *v14;
  char *v15;
  HKDateGraphViewController *v16;
  objc_super v18;

  v13 = a6;
  -[HKDateGraphViewController _createGraphViewWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:customDateAxis:](self, "_createGraphViewWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:customDateAxis:", a3, a4, v13, a7, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HKDateGraphViewController;
  v15 = -[HKGraphViewController initWithGraphView:dateZoom:](&v18, sel_initWithGraphView_dateZoom_, v14, a3);
  v16 = (HKDateGraphViewController *)v15;
  if (v15)
  {
    *(_OWORD *)(v15 + 1016) = xmmword_1D7B81A80;
    objc_storeStrong((id *)v15 + 126, a6);
  }

  return v16;
}

- (HKDateGraphViewController)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateGraphViewController.m"), 72, CFSTR("Use designated initializer"));

  return 0;
}

- (HKDateGraphViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateGraphViewController.m"), 77, CFSTR("Use designated initializer"));

  return 0;
}

- (void)setMinimumSize:(CGSize)a3
{
  double v4;
  id v5;

  self->_minimumSize = a3;
  -[HKDateGraphViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDateGraphViewController minimumSize](self, "minimumSize");
  objc_msgSend(v5, "setMinimumHeight:", v4);
  -[HKDateGraphViewController minimumSize](self, "minimumSize");
  objc_msgSend(v5, "setMinimumWidth:");

}

- (void)loadView
{
  double v3;
  HKBorderLineView *v4;

  v4 = -[HKBorderLineView initWithFrame:]([HKBorderLineView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[HKDateGraphViewController minimumSize](self, "minimumSize");
  -[HKBorderLineView setMinimumHeight:](v4, "setMinimumHeight:", v3);
  -[HKDateGraphViewController minimumSize](self, "minimumSize");
  -[HKBorderLineView setMinimumWidth:](v4, "setMinimumWidth:");
  -[HKBorderLineView setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
  -[HKDateGraphViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKDateGraphViewController;
  -[HKDateGraphViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HKDateGraphViewController _setupGraphViewSelectionStyle](self, "_setupGraphViewSelectionStyle");
  -[HKDateGraphViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  -[HKDateGraphViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[HKDateGraphViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewController graphView](self, "graphView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

}

- (void)viewWillLayoutSubviews
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HKDateGraphViewController;
  -[HKDateGraphViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[HKDateGraphViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[HKGraphViewController graphView](self, "graphView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11 + -12.0);

  -[HKDateGraphViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMargins");
  v15 = v14;

  if (v15 > 16.0)
  {
    -[HKGraphViewController graphView](self, "graphView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHardLeftMarginWidth:", v15);

  }
}

- (id)_createGraphViewWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6 customDateAxis:(id)a7
{
  id v12;
  id v13;
  HKGraphView *v14;
  HKGraphView *v15;
  void *v16;
  HKDateAxis *v17;
  HKDateAxis *v18;
  void *v19;

  v12 = a6;
  v13 = a7;
  v14 = [HKGraphView alloc];
  v15 = -[HKGraphView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKGraphView setXAxisSpace:](v15, "setXAxisSpace:", a5);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView setOutlineColor:](v15, "setOutlineColor:", v16);

  -[HKGraphView setOutlineOptions:](v15, "setOutlineOptions:", 5);
  -[HKGraphView setFeatheringOptions:](v15, "setFeatheringOptions:", 15);
  if (v13)
  {
    v17 = (HKDateAxis *)v13;
  }
  else
  {
    v18 = [HKDateAxis alloc];
    -[HKDateGraphViewController _dateAxisStyle](self, "_dateAxisStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKDateAxis initWithCurrentCalendar:axisStyle:](v18, "initWithCurrentCalendar:axisStyle:", v12, v19);

  }
  -[HKGraphView setMinimumDateZoom:](v15, "setMinimumDateZoom:", a3);
  -[HKGraphView setMaximumDateZoom:](v15, "setMaximumDateZoom:", a3);
  -[HKGraphView setPreviousDateZoom:](v15, "setPreviousDateZoom:", a4);
  -[HKGraphView setXAxis:](v15, "setXAxis:", v17);
  -[HKGraphView setCurrentCalendar:](v15, "setCurrentCalendar:", v12);
  -[HKGraphView setVirtualLeftMarginWidth:](v15, "setVirtualLeftMarginWidth:", 0.0);
  -[HKGraphView setVirtualLeftMarginStyle:](v15, "setVirtualLeftMarginStyle:", 0);
  -[HKGraphView setHardLeftMarginWidth:](v15, "setHardLeftMarginWidth:", 16.0);
  -[HKGraphView setVirtualRightMarginWidth:](v15, "setVirtualRightMarginWidth:", 0.0);
  -[HKGraphView setVirtualRightMarginStyle:](v15, "setVirtualRightMarginStyle:", 2);

  return v15;
}

- (void)_setupGraphViewSelectionStyle
{
  void *v3;
  void *v4;
  void *v5;
  HKGraphViewSelectionStyle *v6;

  v6 = objc_alloc_init(HKGraphViewSelectionStyle);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", 0, 2.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewSelectionStyle setSelectedPointLineStrokeStyle:](v6, "setSelectedPointLineStrokeStyle:", v3);

  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", 0, HKUIOnePixel());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewSelectionStyle setTouchPointLineStrokeStyle:](v6, "setTouchPointLineStrokeStyle:", v4);

  -[HKGraphViewSelectionStyle setUnselectedSeriesAlpha:](v6, "setUnselectedSeriesAlpha:", 1.0);
  -[HKGraphViewController graphView](self, "graphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectionStyle:", v6);

}

- (id)_xAxisLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
}

- (id)_dateAxisStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v4, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAxisLineStyle:", v5);

  -[HKDateGraphViewController _xAxisLabelFont](self, "_xAxisLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", v4, v6, 0, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabelStyle:", v7);

  objc_msgSend(v3, "setTickPositions:", 0);
  objc_msgSend(v3, "setAxisLabelPosition:", 1);
  objc_msgSend(v3, "setShowGridLines:", 1);
  objc_msgSend(v3, "setLocation:", 2);
  objc_msgSend(v3, "setFillInnerPadding:", 3.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMinorGridColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v9, 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDashStyle:", 1);
  objc_msgSend(v3, "setGridLineStyle:", v11);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v10, 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDashStyle:", 1);
  objc_msgSend(v3, "setMinorGridLineStyle:", v12);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v8, 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDashStyle:", 0);
  objc_msgSend(v3, "setReferenceGridLineStyle:", v13);

  return v3;
}

- (void)_marginStyleChangeForContext:(int64_t)a3 graphView:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;

  v4 = a3 != 1;
  v6 = a4;
  v5 = 2 * v4;
  objc_msgSend(v6, "setVirtualLeftMarginStyle:", v5);
  objc_msgSend(v6, "setVirtualRightMarginStyle:", v5);

}

- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[HKDateGraphViewController _marginStyleChangeForContext:graphView:](self, "_marginStyleChangeForContext:graphView:", a5, v9);
  -[HKGraphViewController graphViewDelegateProxy](self, "graphViewDelegateProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "graphView:didUpdateVisibleValueRange:changeContext:", v9, v8, a5);

}

- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKGraphViewController graphViewDelegateProxy](self, "graphViewDelegateProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "graphView:didFinishUserScrollingToValueRange:", v7, v6);

}

- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[HKGraphViewController graphViewDelegateProxy](self, "graphViewDelegateProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "defaultAlignmentForTimeScope:", a3);

  return v5;
}

- (void)setDisableXAxis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_disableXAxis = a3;
  -[HKGraphViewController graphView](self, "graphView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableXAxis:", v3);

}

- (void)setDetailView:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDateGraphViewController;
  -[HKGraphViewController setDetailView:](&v5, sel_setDetailView_, a3);
  -[HKGraphViewController graphView](self, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVirtualLeftMarginWidth:", 0.0);

}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)disableXAxis
{
  return self->_disableXAxis;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
}

@end
