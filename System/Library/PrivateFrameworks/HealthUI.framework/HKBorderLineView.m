@implementation HKBorderLineView

- (HKBorderLineView)initWithFrame:(CGRect)a3
{
  HKBorderLineView *v3;
  HKBorderLineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKBorderLineView;
  v3 = -[HKBorderLineView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HKBorderLineView _initFields](v3, "_initFields");
  return v4;
}

- (HKBorderLineView)initWithCoder:(id)a3
{
  HKBorderLineView *v3;
  HKBorderLineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKBorderLineView;
  v3 = -[HKBorderLineView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HKBorderLineView _initFields](v3, "_initFields");
  return v4;
}

- (void)_initFields
{
  UIColor *v3;
  UIColor *borderLineColor;
  __int128 v5;
  NSArray *verticalDrawRanges;

  self->_edges = 0;
  self->_borderWidth = HKUIOnePixel();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  borderLineColor = self->_borderLineColor;
  self->_borderLineColor = v3;

  v5 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)&self->_borderInsets.top = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)&self->_borderInsets.bottom = v5;
  self->_minimumWidth = -1.0;
  self->_minimumHeight = -1.0;
  verticalDrawRanges = self->_verticalDrawRanges;
  self->_verticalDrawRanges = 0;

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  -[HKBorderLineView minimumWidth](self, "minimumWidth");
  if (v3 <= 0.0 || (-[HKBorderLineView minimumHeight](self, "minimumHeight"), v4 <= 0.0))
  {
    v11.receiver = self;
    v11.super_class = (Class)HKBorderLineView;
    -[HKBorderLineView intrinsicContentSize](&v11, sel_intrinsicContentSize);
    v6 = v9;
  }
  else
  {
    -[HKBorderLineView minimumWidth](self, "minimumWidth");
    v6 = v5;
    -[HKBorderLineView minimumHeight](self, "minimumHeight");
    v8 = v7;
  }
  v10 = v6;
  result.height = v8;
  result.width = v10;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[HKBorderLineView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[HKBorderLineView _adjustedVerticalDrawRanges](self, "_adjustedVerticalDrawRanges");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v13 = -[HKBorderLineView edges](self, "edges");
  -[HKBorderLineView borderWidth](self, "borderWidth");
  v15 = v14;
  -[HKBorderLineView borderLineColor](self, "borderLineColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView borderInsets](self, "borderInsets");
  +[HKBorderLineView drawBorderLinesInContext:bounds:verticalDrawRanges:borderEdges:borderLineWidth:borderLineColor:borderInsets:](HKBorderLineView, "drawBorderLinesInContext:bounds:verticalDrawRanges:borderEdges:borderLineWidth:borderLineColor:borderInsets:", CurrentContext, v21, v13, v16, v6, v8, v10, v12, v15, v17, v18, v19, v20);

}

- (void)setEdges:(int64_t)a3
{
  self->_edges = a3;
  -[HKBorderLineView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
  -[HKBorderLineView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBorderLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderLineColor, a3);
  -[HKBorderLineView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBorderInsets:(UIEdgeInsets)a3
{
  self->_borderInsets = a3;
  -[HKBorderLineView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setVerticalDrawRanges:(id)a3
{
  objc_storeStrong((id *)&self->_verticalDrawRanges, a3);
  -[HKBorderLineView setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)_adjustedVerticalDrawRanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HKBorderLineView verticalDrawRanges](self, "verticalDrawRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[HKBorderLineView verticalDrawRanges](self, "verticalDrawRanges");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v25 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v8, "minValue");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "doubleValue");
          v11 = v10;
          -[HKBorderLineView frame](self, "frame");
          v13 = v11 - v12;

          objc_msgSend(v8, "maxValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;
          -[HKBorderLineView frame](self, "frame");
          v18 = v16 - v17;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "addObject:", v21);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v5);
    }

  }
  return v3;
}

+ (void)drawBorderLinesInContext:(CGContext *)a3 bounds:(CGRect)a4 verticalDrawRanges:(id)a5 borderEdges:(int64_t)a6 borderLineWidth:(double)a7 borderLineColor:(id)a8 borderInsets:(UIEdgeInsets)a9
{
  char v11;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  float v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t j;
  void *v33;
  void *v34;
  float v35;
  void *v36;
  float v37;
  CGFloat v38;
  double height;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v11 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v50 = *MEMORY[0x1E0C80C00];
  v16 = a5;
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(objc_retainAutorelease(a8), "CGColor"));
  CGContextSetLineWidth(a3, a7);
  if ((v11 & 1) != 0)
  {
    CGContextMoveToPoint(a3, x + a9.left, y + a9.top);
    CGContextAddLineToPoint(a3, x + width - a9.right, y + a9.top);
  }
  if ((v11 & 2) == 0)
  {
    if ((v11 & 4) == 0)
      goto LABEL_5;
LABEL_19:
    CGContextMoveToPoint(a3, x + a9.left, y + height - a9.bottom);
    CGContextAddLineToPoint(a3, x + width - a9.right, y + height - a9.bottom);
    if ((v11 & 8) == 0)
      goto LABEL_31;
    goto LABEL_20;
  }
  if (v16 && objc_msgSend(v16, "count"))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v45 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v22, "minValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          CGContextMoveToPoint(a3, x + a9.left, a9.top + v24);

          objc_msgSend(v22, "maxValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "floatValue");
          CGContextAddLineToPoint(a3, x + a9.left, v26 - a9.bottom);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v19);
    }

    if ((v11 & 4) != 0)
      goto LABEL_19;
  }
  else
  {
    CGContextMoveToPoint(a3, x + a9.left, y + a9.top);
    CGContextAddLineToPoint(a3, x + a9.left, y + height - a9.bottom);
    if ((v11 & 4) != 0)
      goto LABEL_19;
  }
LABEL_5:
  if ((v11 & 8) == 0)
    goto LABEL_31;
LABEL_20:
  if (v16 && objc_msgSend(v16, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v27 = v16;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v41;
      v31 = x + width;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v41 != v30)
            objc_enumerationMutation(v27);
          v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          objc_msgSend(v33, "minValue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "floatValue");
          CGContextMoveToPoint(a3, v31, v35);

          objc_msgSend(v33, "maxValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "floatValue");
          CGContextAddLineToPoint(a3, v31 - a9.right, v37);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v29);
    }

  }
  else
  {
    v38 = x + width - a9.right;
    CGContextMoveToPoint(a3, v38, y + a9.top);
    CGContextAddLineToPoint(a3, v38, y + height - a9.bottom);
  }
LABEL_31:
  CGContextStrokePath(a3);

}

- (int64_t)edges
{
  return self->_edges;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderLineColor
{
  return self->_borderLineColor;
}

- (UIEdgeInsets)borderInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderInsets.top;
  left = self->_borderInsets.left;
  bottom = self->_borderInsets.bottom;
  right = self->_borderInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(double)a3
{
  self->_minimumWidth = a3;
}

- (NSArray)verticalDrawRanges
{
  return self->_verticalDrawRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalDrawRanges, 0);
  objc_storeStrong((id *)&self->_borderLineColor, 0);
}

@end
