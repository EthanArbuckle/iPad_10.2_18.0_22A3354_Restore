@implementation HKPopulationNormsChartGridView

- (HKPopulationNormsChartGridView)initWithXAxisLabels:(id)a3 YAxisLabels:(id)a4
{
  id v6;
  id v7;
  HKPopulationNormsChartGridView *v8;
  HKPopulationNormsAxisView *v9;
  HKPopulationNormsAxisView *xAxisView;
  HKPopulationNormsAxisView *v11;
  HKPopulationNormsAxisView *yAxisView;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKPopulationNormsChartGridView;
  v8 = -[HKPopulationNormsChartGridView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    v9 = -[HKPopulationNormsAxisView initWithOrientation:axisLabels:]([HKPopulationNormsAxisView alloc], "initWithOrientation:axisLabels:", 1, v6);
    xAxisView = v8->_xAxisView;
    v8->_xAxisView = v9;

    v11 = -[HKPopulationNormsAxisView initWithOrientation:axisLabels:]([HKPopulationNormsAxisView alloc], "initWithOrientation:axisLabels:", 0, v7);
    yAxisView = v8->_yAxisView;
    v8->_yAxisView = v11;

    -[HKPopulationNormsChartGridView addSubview:](v8, "addSubview:", v8->_xAxisView);
    -[HKPopulationNormsChartGridView addSubview:](v8, "addSubview:", v8->_yAxisView);
    v8->_xAxisSegmentCount = objc_msgSend(v6, "count");
    v8->_yAxisSegmentCount = objc_msgSend(v7, "count");
  }

  return v8;
}

- (double)_determineXAxisHeight
{
  double result;

  -[HKPopulationNormsAxisView minorDimensionSize](self->_xAxisView, "minorDimensionSize");
  return result;
}

- (double)_determineYAxisWidth
{
  double result;

  -[HKPopulationNormsAxisView minorDimensionSize](self->_yAxisView, "minorDimensionSize");
  return result;
}

- (CGRect)determineCanvasRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[HKPopulationNormsChartGridView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKPopulationNormsChartGridView _determineYAxisWidth](self, "_determineYAxisWidth");
  v12 = v11;
  -[HKPopulationNormsChartGridView _determineXAxisHeight](self, "_determineXAxisHeight");
  -[HKPopulationNormsChartGridView _determineCanvasRectInRect:yAxisWidth:xAxisHeight:](self, "_determineCanvasRectInRect:yAxisWidth:xAxisHeight:", v4, v6, v8, v10, v12, v13);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_determineCanvasRectInRect:(CGRect)a3 yAxisWidth:(double)a4 xAxisHeight:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = a3.origin.x + 0.0;
  v6 = a3.origin.y + 0.0;
  v7 = a3.size.width - (a4 + 0.0);
  v8 = a3.size.height - (a5 + 0.0);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)relocalizeAxisLabels
{
  -[HKPopulationNormsAxisView setNeedsLayout](self->_xAxisView, "setNeedsLayout");
  -[HKPopulationNormsAxisView setNeedsLayout](self->_yAxisView, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKPopulationNormsChartGridView;
  -[HKPopulationNormsChartGridView layoutSubviews](&v9, sel_layoutSubviews);
  -[HKPopulationNormsChartGridView _determineYAxisWidth](self, "_determineYAxisWidth");
  v4 = v3;
  -[HKPopulationNormsChartGridView _determineXAxisHeight](self, "_determineXAxisHeight");
  -[HKPopulationNormsChartGridView frame](self, "frame");
  -[HKPopulationNormsChartGridView _determineCanvasRectInRect:yAxisWidth:xAxisHeight:](self, "_determineCanvasRectInRect:yAxisWidth:xAxisHeight:");
  v6 = v5;
  v8 = v7;
  -[HKPopulationNormsAxisView setFrame:](self->_xAxisView, "setFrame:", 0.0, v7);
  -[HKPopulationNormsAxisView setFrame:](self->_yAxisView, "setFrame:", v6, 0.0, v4, v8);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  unint64_t yAxisSegmentCount;
  unint64_t v19;
  double v20;
  id v21;
  unint64_t xAxisSegmentCount;
  unint64_t v23;
  double v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)HKPopulationNormsChartGridView;
  -[HKPopulationNormsChartGridView drawRect:](&v25, sel_drawRect_);
  CurrentContext = UIGraphicsGetCurrentContext();
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MinX = CGRectGetMinX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MinY = CGRectGetMinY(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MaxX = CGRectGetMaxX(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MaxY = CGRectGetMaxY(v29);
  -[HKPopulationNormsChartGridView _determineYAxisWidth](self, "_determineYAxisWidth");
  v14 = v13;
  -[HKPopulationNormsChartGridView _determineXAxisHeight](self, "_determineXAxisHeight");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v17, "CGColor"));

  CGContextSetLineWidth(CurrentContext, 0.5);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, MinX + 0.25, MinY);
  CGContextAddLineToPoint(CurrentContext, MinX + 0.25, MaxY);
  CGContextMoveToPoint(CurrentContext, MinX, MinY + 0.25);
  CGContextAddLineToPoint(CurrentContext, MaxX - v14, MinY + 0.25);
  CGContextMoveToPoint(CurrentContext, MaxX - v14, MinY);
  CGContextAddLineToPoint(CurrentContext, MaxX - v14, MaxY);
  CGContextMoveToPoint(CurrentContext, MinX, MaxY - v16);
  CGContextAddLineToPoint(CurrentContext, MaxX - v14, MaxY - v16);
  CGContextStrokePath(CurrentContext);
  if (self->_yAxisSegmentCount >= 2)
  {
    CGContextBeginPath(CurrentContext);
    yAxisSegmentCount = self->_yAxisSegmentCount;
    if (yAxisSegmentCount)
    {
      v19 = 0;
      v20 = (MaxY - MinY - v16) / (double)(yAxisSegmentCount - 1);
      do
      {
        CGContextMoveToPoint(CurrentContext, MinX, MinY + v20 * (double)(int)v19);
        CGContextAddLineToPoint(CurrentContext, MaxX - v14, MinY + v20 * (double)(int)v19++);
      }
      while (self->_yAxisSegmentCount > v19);
    }
    CGContextStrokePath(CurrentContext);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMinorGridColor");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v21, "CGColor"));

  if (self->_xAxisSegmentCount >= 2)
  {
    CGContextSetLineDash(CurrentContext, 2.0, drawRect__lengths, 2uLL);
    CGContextBeginPath(CurrentContext);
    xAxisSegmentCount = self->_xAxisSegmentCount;
    if (xAxisSegmentCount)
    {
      v23 = 0;
      v24 = (MaxX - MinX - v14) / (double)xAxisSegmentCount;
      do
      {
        CGContextMoveToPoint(CurrentContext, MinX + v24 * (double)(int)v23, MaxY);
        CGContextAddLineToPoint(CurrentContext, MinX + v24 * (double)(int)v23++, MinY);
      }
      while (self->_xAxisSegmentCount > v23);
    }
    CGContextStrokePath(CurrentContext);
  }
}

- (HKPopulationNormsAxisView)yAxisView
{
  return self->_yAxisView;
}

- (void)setYAxisView:(id)a3
{
  objc_storeStrong((id *)&self->_yAxisView, a3);
}

- (HKPopulationNormsAxisView)xAxisView
{
  return self->_xAxisView;
}

- (void)setXAxisView:(id)a3
{
  objc_storeStrong((id *)&self->_xAxisView, a3);
}

- (unint64_t)xAxisSegmentCount
{
  return self->_xAxisSegmentCount;
}

- (unint64_t)yAxisSegmentCount
{
  return self->_yAxisSegmentCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xAxisView, 0);
  objc_storeStrong((id *)&self->_yAxisView, 0);
}

@end
