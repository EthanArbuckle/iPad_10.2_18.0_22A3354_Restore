@implementation FIUIChartUniformBarSeries

- (FIUIChartUniformBarSeries)initWithFrame:(CGRect)a3
{
  FIUIChartUniformBarSeries *v3;
  FIUIChartUniformBarSeries *v4;
  NSArray *plotPoints;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FIUIChartUniformBarSeries;
  v3 = -[FIUIChartUniformBarSeries initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    plotPoints = v3->_plotPoints;
    v3->_plotPoints = (NSArray *)MEMORY[0x24BDBD1A8];

    v4->_barWidth = 2.0;
    v4->_barSpacing = 0.5;
    v4->_barGradient = 0;
    v4->_roundedCornerRadius = 0.0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGGradientRelease(self->_barGradient);
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartUniformBarSeries;
  -[FIUIChartUniformBarSeries dealloc](&v3, sel_dealloc);
}

- (void)setMinDate:(id)a3
{
  self->_minDate = (NSDate *)a3;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
  -[FIUIChartUniformBarSeries setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBarSpacing:(double)a3
{
  self->_barSpacing = a3;
  -[FIUIChartUniformBarSeries setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setRoundedCornerRadius:(double)a3
{
  self->_roundedCornerRadius = a3;
  -[FIUIChartUniformBarSeries setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBarGradient:(CGGradient *)a3
{
  CGGradientRelease(self->_barGradient);
  self->_barGradient = CGGradientRetain(a3);
  -[FIUIChartUniformBarSeries setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)layoutSubviews
{
  NSArray *v3;
  NSArray *plotPoints;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIUIChartUniformBarSeries;
  -[FIUIChartSeries layoutSubviews](&v6, sel_layoutSubviews);
  -[FIUIChartNumericSeries CGPointsFromDataSet](self, "CGPointsFromDataSet");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  plotPoints = self->_plotPoints;
  self->_plotPoints = v3;

  -[FIUIChartUniformBarSeries layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsDisplay");

}

- (double)xValueForPointFromChartPoint:(id)a3
{
  id v4;
  double v5;
  double v6;
  double barWidth;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  UIRoundToViewScale();
  v6 = v5;
  barWidth = self->_barWidth;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_minDate)
  {
    objc_msgSend(v8, "startOfDayForDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startOfDayForDate:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = v6 + barWidth;
  objc_msgSend(v4, "xValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "daylightSavingTimeOffsetForDate:", v13);
  v16 = v15;

  objc_msgSend(v9, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "daylightSavingTimeOffsetForDate:", v10);
  v19 = v18;

  objc_msgSend(v13, "timeIntervalSinceDate:", v10);
  v21 = v6 + (v16 - v19 + v20) / 3600.0 * v12;

  return v21;
}

- (double)yValueForPointFromChartPointValue:(id)a3
{
  double result;

  objc_msgSend(a3, "doubleValue");
  return result;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CGFloat v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  float v20;
  unint64_t v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  float v26;
  double v27;
  double barSpacing;
  double v29;
  double v30;
  double v31;
  double v32;
  double roundedCornerRadius;
  uint64_t v34;
  CGPath *v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  CGGradient *barGradient;
  CGGradient *v50;
  CGContextRef c;
  const CGPath *path;
  const CGPath *Mutable;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;
  CGPoint v66;
  CGPoint v67;
  CGPoint v68;
  CGPoint v69;
  CGPoint v70;

  v65 = *MEMORY[0x24BDAC8D0];
  UIGraphicsPushContext(a4);
  UIRoundToViewScale();
  CGContextSetLineWidth(a4, v6);
  c = a4;
  CGContextSetLineCap(a4, kCGLineCapButt);
  -[FIUIChartSeries insetBounds](self, "insetBounds");
  v8 = v7;
  path = CGPathCreateMutable();
  Mutable = CGPathCreateMutable();
  -[FIUIChartUniformBarSeries bounds](self, "bounds");
  +[FIUIChartMultiDashedBackgroundView calculateRoundedLinePositionsForTotalWidth:lineWidth:numberOfLines:roundedInView:](FIUIChartMultiDashedBackgroundView, "calculateRoundedLinePositionsForTotalWidth:lineWidth:numberOfLines:roundedInView:", 25, self, v9, self->_barSpacing);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v11 = self->_plotPoints;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v15);
        objc_msgSend(v16, "CGPointValue");
        if (v17 >= 0.0)
        {
          v18 = v17;
          -[FIUIChartUniformBarSeries bounds](self, "bounds");
          v20 = v18 / v19 * 24.0;
          v21 = vcvtms_u32_f32(v20);
          if (v21 + 1 >= objc_msgSend(v10, "count"))
          {
            _HKInitializeLogging();
            v36 = (void *)*MEMORY[0x24BDD2FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
            {
              v37 = v36;
              v38 = (objc_class *)objc_opt_class();
              NSStringFromClass(v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "CGPointValue");
              NSStringFromCGPoint(v66);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v59 = v39;
              v60 = 2112;
              v61 = (unint64_t)v40;
              _os_log_impl(&dword_21307C000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered a plot point out of chart bounds: %@", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "floatValue");
            v24 = v23;

            objc_msgSend(v10, "objectAtIndexedSubscript:", v21 + 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "floatValue");
            v27 = v26;

            barSpacing = self->_barSpacing;
            v29 = v27 - v24 - barSpacing;
            if (v29 <= 0.0)
            {
              _HKInitializeLogging();
              v41 = (void *)*MEMORY[0x24BDD2FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
              {
                v42 = v41;
                v43 = (objc_class *)objc_opt_class();
                NSStringFromClass(v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v59 = v44;
                v60 = 2048;
                v61 = v21;
                v62 = 2112;
                v63 = v10;
                _os_log_error_impl(&dword_21307C000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Encountered a negative barWidth for hourBucket value: %lu, computed from roundedLinePositions array: %@", buf, 0x20u);

              }
            }
            else
            {
              v30 = barSpacing + v24;
              objc_msgSend(v16, "CGPointValue");
              UIRoundToViewScale();
              v32 = v31;
              if (self->_roundedCornerRadius >= v29 * 0.5)
                roundedCornerRadius = v29 * 0.5;
              else
                roundedCornerRadius = self->_roundedCornerRadius;
              -[FIUIChartSeries insetBounds](self, "insetBounds");
              if (v32 == 0.0)
                v35 = Mutable;
              else
                v35 = path;
              v45 = v30;
              v46 = v29;
              v47 = v8;
              CGPathAddRoundedRect(v35, 0, *(CGRect *)(&v34 - 1), roundedCornerRadius, roundedCornerRadius);
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      v48 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      v13 = v48;
    }
    while (v48);
  }

  if (!CGPathIsEmpty(Mutable))
  {
    CGContextSaveGState(c);
    CGContextSetAlpha(c, 0.3);
    CGContextAddPath(c, Mutable);
    CGContextClip(c);
    barGradient = self->_barGradient;
    -[FIUIChartUniformBarSeries bounds](self, "bounds");
    v67.x = 1.0;
    v67.y = 0.0;
    v69.x = 1.0;
    CGContextDrawLinearGradient(c, barGradient, v67, v69, 0);
    CGContextRestoreGState(c);
  }
  if (!CGPathIsEmpty(path))
  {
    CGContextSaveGState(c);
    CGContextAddPath(c, path);
    CGContextClip(c);
    v50 = self->_barGradient;
    -[FIUIChartUniformBarSeries bounds](self, "bounds");
    v68.x = 1.0;
    v68.y = 0.0;
    v70.x = 1.0;
    CGContextDrawLinearGradient(c, v50, v68, v70, 0);
    CGContextRestoreGState(c);
  }
  CGPathRelease(path);
  CGPathRelease(Mutable);
  UIGraphicsPopContext();

}

- (NSDate)minDate
{
  return self->_minDate;
}

- (double)barWidth
{
  return self->_barWidth;
}

- (double)barSpacing
{
  return self->_barSpacing;
}

- (double)roundedCornerRadius
{
  return self->_roundedCornerRadius;
}

- (CGGradient)barGradient
{
  return self->_barGradient;
}

- (NSArray)plotPoints
{
  return self->_plotPoints;
}

- (void)setPlotPoints:(id)a3
{
  objc_storeStrong((id *)&self->_plotPoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plotPoints, 0);
}

@end
