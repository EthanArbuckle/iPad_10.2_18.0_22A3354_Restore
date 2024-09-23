@implementation FIUIChartBarSeries

- (FIUIChartBarSeries)init
{
  FIUIChartBarSeries *v2;
  FIUIChartBarSeries *v3;
  NSArray *plotPoints;
  NSArray *barLabels;
  uint64_t v6;
  UIColor *barColor;
  uint64_t v8;
  UIColor *fadedBarColor;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FIUIChartBarSeries;
  v2 = -[FIUIChartSeries init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    plotPoints = v2->_plotPoints;
    v2->_plotPoints = (NSArray *)MEMORY[0x24BDBD1A8];

    barLabels = v3->_barLabels;
    v3->_barLabels = 0;

    v3->_barWidth = 2.0;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();
    barColor = v3->_barColor;
    v3->_barColor = (UIColor *)v6;

    v3->_barGradient = 0;
    v3->_barSpacing = 1.0;
    v3->_roundedCornerRadius = 0.0;
    v3->_fadeZeroBars = 0;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
    fadedBarColor = v3->_fadedBarColor;
    v3->_fadedBarColor = (UIColor *)v8;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CGGradientRelease(self->_barGradient);
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartBarSeries;
  -[FIUIChartBarSeries dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  NSArray *v3;
  NSArray *plotPoints;
  NSArray *v5;
  NSArray *barLabels;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FIUIChartBarSeries;
  -[FIUIChartSeries layoutSubviews](&v8, sel_layoutSubviews);
  -[FIUIChartNumericSeries CGPointsFromDataSet](self, "CGPointsFromDataSet");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  plotPoints = self->_plotPoints;
  self->_plotPoints = v3;

  -[FIUIChartSeries labelsFromDataSet](self, "labelsFromDataSet");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  barLabels = self->_barLabels;
  self->_barLabels = v5;

  -[FIUIChartBarSeries _translateColorThresholds](self, "_translateColorThresholds");
  -[FIUIChartBarSeries layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsDisplay");

}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  double v16;
  double v17;
  double v18;
  double barWidth;
  double v20;
  double roundedCornerRadius;
  void *v22;
  CGContext *v23;
  _BOOL4 v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double x;
  double y;
  double width;
  double height;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  id v62;
  _BOOL4 v63;
  void *v64;
  uint64_t v65;
  _BOOL4 v66;
  uint64_t v67;
  CGPath *Mutable;
  CGPath *path;
  void *v70;
  uint64_t v71;
  CGContextRef c;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;
  CGPoint v94;
  CGPoint v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v93 = *MEMORY[0x24BDAC8D0];
  UIGraphicsPushContext(a4);
  -[FIUIChartBarSeries bounds](self, "bounds");
  CGRectGetHeight(v96);
  UIRoundToViewScale();
  v7 = v6;
  -[FIUIChartBarSeries bounds](self, "bounds");
  CGRectGetWidth(v97);
  UIRoundToViewScale();
  v9 = v8;
  if (self->_strokeColor)
    v10 = self->_strokeWidth > 0.0;
  else
    v10 = 0;
  if (self->_backgroundStrokeColor)
    v66 = self->_backgroundStrokeWidth > 0.0;
  else
    v66 = 0;
  c = a4;
  Mutable = CGPathCreateMutable();
  v63 = v10;
  if (self->_fadeZeroBars)
    path = CGPathCreateMutable();
  else
    path = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v11 = self->_plotPoints;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v86 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "CGSizeValue");
        UIRoundToViewScale();
        v17 = v16;
        v18 = v7 - v16;
        if (v18 == 0.0)
        {
          if (self->_fadeZeroBars)
          {
            CGPathAddArc(path, 0, v9 + self->_roundedCornerRadius, v7 - self->_roundedCornerRadius, self->_roundedCornerRadius, 6.28318531, 0.0, 1);
            CGPathCloseSubpath(path);
          }
          barWidth = self->_barWidth;
          v20 = 0.0;
        }
        else
        {
          roundedCornerRadius = self->_roundedCornerRadius;
          if (v18 >= roundedCornerRadius + roundedCornerRadius)
            v20 = v18;
          else
            v20 = roundedCornerRadius + roundedCornerRadius;
          barWidth = self->_barWidth;
          v98.origin.x = v9;
          v98.origin.y = v17;
          v98.size.width = barWidth;
          v98.size.height = v20;
          CGPathAddRoundedRect(Mutable, 0, v98, roundedCornerRadius, self->_roundedCornerRadius);
        }
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v9, v17, barWidth, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v22);

        v9 = v9 + self->_barWidth + self->_barSpacing;
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    }
    while (v13);
  }

  if (self->_barGradient)
  {
    v23 = c;
    v24 = v63;
    if (!CGPathIsEmpty(path))
    {
      CGContextSaveGState(c);
      CGContextAddPath(c, path);
      CGContextSetFillColorWithColor(c, -[UIColor CGColor](self->_fadedBarColor, "CGColor"));
      CGContextFillPath(c);
      CGContextRestoreGState(c);
    }
    if (!CGPathIsEmpty(Mutable))
    {
      CGContextSaveGState(c);
      CGContextAddPath(c, Mutable);
      CGContextClip(c);
      v94.x = 1.0;
      v94.y = 0.0;
      v95.x = 1.0;
      v95.y = v7;
      CGContextDrawLinearGradient(c, self->_barGradient, v94, v95, 0);
      CGContextRestoreGState(c);
    }
  }
  else
  {
    v23 = c;
    CGContextSetFillColorWithColor(c, -[UIColor CGColor](self->_barColor, "CGColor"));
    v24 = v63;
  }
  CGContextSaveGState(v23);
  if (v66)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v25 = v70;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v82 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * j), "CGRectValue");
          v31 = v30;
          v33 = v32;
          -[FIUIChartSeries insetBounds](self, "insetBounds");
          -[FIUIChartBarSeries _strokeRect:context:color:width:](self, "_strokeRect:context:color:width:", v23, -[UIColor CGColor](self->_backgroundStrokeColor, "CGColor"), v31, v34, v33 + 1.0, v35, self->_backgroundStrokeWidth);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
      }
      while (v27);
    }

    v24 = v63;
  }
  if (v24 || self->_barLabels && -[NSArray count](self->_labelAttributes, "count"))
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v36 = v70;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    if (v37)
    {
      v38 = v37;
      v39 = 0;
      v40 = *(_QWORD *)v78;
      v41 = -1.0;
      v61 = *(_QWORD *)v78;
      v62 = v36;
      do
      {
        v42 = 0;
        v67 = v38;
        do
        {
          if (*(_QWORD *)v78 != v40)
            objc_enumerationMutation(v36);
          v71 = v42;
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v42), "CGRectValue");
          x = v99.origin.x;
          y = v99.origin.y;
          width = v99.size.width;
          height = v99.size.height;
          if (!CGRectIsEmpty(v99))
          {
            v100.origin.x = x;
            v100.origin.y = y;
            v100.size.width = width;
            v100.size.height = height;
            -[FIUIChartBarSeries _chartColorForChartYValue:](self, "_chartColorForChartYValue:", CGRectGetMinY(v100));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47;
            if (v47)
              objc_msgSend(v47, "drawInRect:inContext:", v23, x, y, width, height);
            if (v24)
              -[FIUIChartBarSeries _strokeRect:context:color:width:](self, "_strokeRect:context:color:width:", v23, -[UIColor CGColor](self->_strokeColor, "CGColor"), x + v41, y, width + 1.0, height, self->_strokeWidth);
            if (self->_barLabels && -[NSArray count](self->_labelAttributes, "count"))
            {
              v64 = v48;
              v65 = v39;
              -[NSArray objectAtIndexedSubscript:](self->_barLabels, "objectAtIndexedSubscript:", v39);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = 0u;
              v74 = 0u;
              v75 = 0u;
              v76 = 0u;
              v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
              if (v50)
              {
                v51 = v50;
                v52 = *(_QWORD *)v74;
                do
                {
                  for (k = 0; k != v51; ++k)
                  {
                    if (*(_QWORD *)v74 != v52)
                      objc_enumerationMutation(v49);
                    v54 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
                    if ((objc_msgSend(v54, "isEqualToString:", &stru_24CF339D8) & 1) == 0)
                    {
                      v55 = objc_msgSend(v49, "indexOfObject:", v54);
                      if (-[NSArray count](self->_labelAttributes, "count") <= v55)
                        v56 = 0;
                      else
                        v56 = v55;
                      -[NSArray objectAtIndexedSubscript:](self->_labelAttributes, "objectAtIndexedSubscript:", v56);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "boundingRectWithSize:options:attributes:context:", 0, v57, 0, x + v41, 1.79769313e308);
                      UIRoundToViewScale();
                      objc_msgSend(v54, "drawAtPoint:withAttributes:", v57);
                      UIRoundToViewScale();
                      v59 = v58;
                      v60 = x - v58;
                      -[FIUIChartBarSeries bounds](self, "bounds");
                      -[FIUIChartBarSeries _strokeRect:context:color:width:](self, "_strokeRect:context:color:width:", c, -[UIColor CGColor](self->_barColor, "CGColor"), v60, 3.0, v59, CGRectGetHeight(v101) + -3.0, v59);

                    }
                  }
                  v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
                }
                while (v51);
              }

              v24 = v63;
              v40 = v61;
              v36 = v62;
              v48 = v64;
              v39 = v65;
              v41 = -1.0;
            }

            v23 = c;
            v38 = v67;
          }
          ++v39;
          v42 = v71 + 1;
        }
        while (v71 + 1 != v38);
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      }
      while (v38);
    }

  }
  CGContextRestoreGState(v23);
  CGPathRelease(Mutable);
  CGPathRelease(path);
  UIGraphicsPopContext();

}

- (id)_chartColorForChartYValue:(double)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSArray reverseObjectEnumerator](self->_barColors, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "chartYValue");
        if (v9 >= a3)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_strokeRect:(CGRect)a3 context:(CGContext *)a4 color:(CGColor *)a5 width:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MinX;
  CGFloat MaxY;
  CGFloat v14;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSetStrokeColorWithColor(a4, a5);
  CGContextSetLineWidth(a4, a6);
  CGContextBeginPath(a4);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MinX = CGRectGetMinX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MaxY = CGRectGetMaxY(v21);
  CGContextMoveToPoint(a4, MinX, MaxY);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v14 = CGRectGetMinX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MinY = CGRectGetMinY(v23);
  CGContextAddLineToPoint(a4, v14, MinY);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v17 = CGRectGetMinY(v25);
  CGContextAddLineToPoint(a4, MaxX, v17);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v18 = CGRectGetMaxX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v19 = CGRectGetMaxY(v27);
  CGContextAddLineToPoint(a4, v18, v19);
  CGContextClosePath(a4);
  CGContextStrokePath(a4);
}

- (void)_translateColorThresholds
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_barColors;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v8, "threshold", (_QWORD)v11);
        objc_msgSend(v9, "numberWithDouble:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FIUIChartSeries yValueForPointFromChartPointValue:](self, "yValueForPointFromChartPointValue:", v10);
        objc_msgSend(v8, "setChartYValue:");

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)setBarGradient:(CGGradient *)a3
{
  CGGradientRelease(self->_barGradient);
  self->_barGradient = CGGradientRetain(a3);
  -[FIUIChartBarSeries setNeedsDisplay](self, "setNeedsDisplay");
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
}

- (double)barSpacing
{
  return self->_barSpacing;
}

- (void)setBarSpacing:(double)a3
{
  self->_barSpacing = a3;
}

- (double)roundedCornerRadius
{
  return self->_roundedCornerRadius;
}

- (void)setRoundedCornerRadius:(double)a3
{
  self->_roundedCornerRadius = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (UIColor)backgroundStrokeColor
{
  return self->_backgroundStrokeColor;
}

- (void)setBackgroundStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundStrokeColor, a3);
}

- (double)backgroundStrokeWidth
{
  return self->_backgroundStrokeWidth;
}

- (void)setBackgroundStrokeWidth:(double)a3
{
  self->_backgroundStrokeWidth = a3;
}

- (NSArray)barColors
{
  return self->_barColors;
}

- (void)setBarColors:(id)a3
{
  objc_storeStrong((id *)&self->_barColors, a3);
}

- (CGGradient)barGradient
{
  return self->_barGradient;
}

- (UIColor)barColor
{
  return self->_barColor;
}

- (void)setBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_barColor, a3);
}

- (BOOL)fadeZeroBars
{
  return self->_fadeZeroBars;
}

- (void)setFadeZeroBars:(BOOL)a3
{
  self->_fadeZeroBars = a3;
}

- (UIColor)fadedBarColor
{
  return self->_fadedBarColor;
}

- (void)setFadedBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_fadedBarColor, a3);
}

- (NSArray)labelAttributes
{
  return self->_labelAttributes;
}

- (void)setLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_labelAttributes, a3);
}

- (NSArray)plotPoints
{
  return self->_plotPoints;
}

- (void)setPlotPoints:(id)a3
{
  objc_storeStrong((id *)&self->_plotPoints, a3);
}

- (NSArray)barLabels
{
  return self->_barLabels;
}

- (void)setBarLabels:(id)a3
{
  objc_storeStrong((id *)&self->_barLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barLabels, 0);
  objc_storeStrong((id *)&self->_plotPoints, 0);
  objc_storeStrong((id *)&self->_labelAttributes, 0);
  objc_storeStrong((id *)&self->_fadedBarColor, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
  objc_storeStrong((id *)&self->_barColors, 0);
  objc_storeStrong((id *)&self->_backgroundStrokeColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
