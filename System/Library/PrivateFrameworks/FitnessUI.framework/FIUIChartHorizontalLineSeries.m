@implementation FIUIChartHorizontalLineSeries

- (void)layoutSubviews
{
  NSArray *v3;
  NSArray *dataPoints;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIUIChartHorizontalLineSeries;
  -[FIUIChartSeries layoutSubviews](&v6, sel_layoutSubviews);
  -[FIUIChartNumericSeries CGPointsFromDataSet](self, "CGPointsFromDataSet");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dataPoints = self->_dataPoints;
  self->_dataPoints = v3;

  -[FIUIChartHorizontalLineSeries layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsDisplay");

}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double lineWidth;
  UIColor *color;
  UIColor *v16;
  UIColor *v17;
  double v18;
  UIColor *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  UIGraphicsPushContext(a4);
  CGContextBeginPath(a4);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_dataPoints;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "CGPointValue", (_QWORD)v20);
        v12 = v11;
        CGContextMoveToPoint(a4, self->_sidePadding, v11);
        -[FIUIChartSeries insetBounds](self, "insetBounds");
        CGContextAddLineToPoint(a4, v13 + self->_sidePadding * -2.0, v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  CGContextClosePath(a4);
  lineWidth = self->_lineWidth;
  color = self->_color;
  if (color)
  {
    v16 = color;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  v18 = 1.0;
  if (lineWidth > 2.22044605e-16)
    v18 = lineWidth;
  CGContextSetLineWidth(a4, v18);
  v19 = objc_retainAutorelease(v17);
  CGContextSetStrokeColorWithColor(a4, -[UIColor CGColor](v19, "CGColor"));
  CGContextSetLineCap(a4, kCGLineCapRound);
  CGContextDrawPath(a4, kCGPathStroke);
  UIGraphicsPopContext();

}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (double)sidePadding
{
  return self->_sidePadding;
}

- (void)setSidePadding:(double)a3
{
  self->_sidePadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_dataPoints, 0);
}

@end
