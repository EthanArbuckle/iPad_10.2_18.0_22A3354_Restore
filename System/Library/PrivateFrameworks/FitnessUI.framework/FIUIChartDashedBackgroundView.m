@implementation FIUIChartDashedBackgroundView

- (FIUIChartDashedBackgroundView)initWithFrame:(CGRect)a3
{
  FIUIChartDashedBackgroundView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FIUIChartDashedBackgroundView;
  result = -[FIUIChartBackgroundView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_direction = 0;
  return result;
}

- (void)setShouldCenterLines:(BOOL)a3
{
  self->_shouldCenterLines = a3;
  -[FIUIChartDashedBackgroundView _updateLinePositions](self, "_updateLinePositions");
}

- (void)setNumLines:(unint64_t)a3
{
  self->_numLines = a3;
  -[FIUIChartDashedBackgroundView _updateLinePositions](self, "_updateLinePositions");
}

- (void)_updateLinePositions
{
  NSArray *v3;
  unint64_t numLines;
  unint64_t i;
  double v6;
  double v7;
  double v8;
  void *v9;
  NSArray *linePositions;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  numLines = self->_numLines;
  if (numLines)
  {
    for (i = 0; i < numLines; ++i)
    {
      if (numLines == 1)
      {
        v8 = 0.5;
      }
      else
      {
        if (self->_shouldCenterLines)
        {
          v6 = (double)(i + 1);
          v7 = (double)(numLines + 1);
        }
        else
        {
          v6 = (double)i;
          v7 = (double)(numLines - 1);
        }
        v8 = v6 / v7;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v3, "addObject:", v9);

      numLines = self->_numLines;
    }
  }
  linePositions = self->_linePositions;
  self->_linePositions = v3;

  -[FIUIChartDashedBackgroundView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
  -[FIUIChartDashedBackgroundView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawLine:(id)a3 rect:(CGRect)a4 context:(CGContext *)a5
{
  CGFloat width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGFloat v13;
  __int128 v14;
  uint64_t v15;

  width = a4.size.width;
  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "doubleValue");
  UIRoundToViewScale();
  v9 = v8;
  objc_msgSend(v7, "doubleValue");
  v11 = v10;

  if (v11 == 0.0)
    v9 = v9 + -0.5;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set");

  v14 = xmmword_21310DA30;
  UIRoundToViewScale();
  CGContextSetLineWidth(a5, v13);
  CGContextSetLineDash(a5, 0.0, (const CGFloat *)&v14, 1uLL);
  CGContextMoveToPoint(a5, 0.0, v9);
  CGContextAddLineToPoint(a5, width, v9);
  CGContextStrokePath(a5);
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContextRef CurrentContext;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  int64_t direction;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  height = a3.size.height;
  width = a3.size.width;
  v46 = *MEMORY[0x24BDAC8D0];
  if (self->_lineType == 1)
  {
    y = a3.origin.y;
    x = a3.origin.x;
    CurrentContext = UIGraphicsGetCurrentContext();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = self->_linePositions;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          -[FIUIChartDashedBackgroundView drawLine:rect:context:](self, "drawLine:rect:context:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), CurrentContext, x, y, width, height);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v11);
    }

    UIGraphicsEndImageContext();
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = self->_linePositions;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          direction = self->_direction;
          objc_msgSend(v19, "doubleValue", (_QWORD)v36);
          if (direction)
          {
            UIRoundToViewScale();
            v22 = v21;
            objc_msgSend(v19, "doubleValue");
            if (v23 == 0.0)
              v22 = v22 + -0.5;
            -[UIColor setFill](self->_color, "setFill");
            UIRoundToViewScale();
            v25 = v24;
            -[FIUIChartBackgroundView lineInsets](self, "lineInsets");
            v27 = height - v26;
            v28 = 0.0;
          }
          else
          {
            UIRoundToViewScale();
            v30 = v29;
            objc_msgSend(v19, "doubleValue");
            if (v31 == 0.0)
              v28 = v30 + -0.5;
            else
              v28 = v30;
            -[UIColor setFill](self->_color, "setFill");
            UIRoundToViewScale();
            v27 = v32;
            v22 = 0.0;
            v25 = width;
          }
          v33 = v22;
          v34 = v28;
          v35 = v25;
          UIRectFill(*(CGRect *)(&v27 - 3));
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v16);
    }

  }
}

- (unint64_t)numLines
{
  return self->_numLines;
}

- (BOOL)shouldCenterLines
{
  return self->_shouldCenterLines;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)lineType
{
  return self->_lineType;
}

- (void)setLineType:(int64_t)a3
{
  self->_lineType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_linePositions, 0);
}

@end
