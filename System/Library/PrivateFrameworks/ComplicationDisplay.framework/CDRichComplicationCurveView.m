@implementation CDRichComplicationCurveView

- (CDRichComplicationCurveView)initWithCurveWidth:(double)a3 padding:(double)a4 beginAngle:(double)a5 endAngle:(double)a6 forDevice:(id)a7 withFilterStyle:(int64_t)a8
{
  CDRichComplicationCurveView *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CDRichComplicationCurveView;
  result = -[CDRichComplicationShapeView initForDevice:withFilterStyle:](&v13, sel_initForDevice_withFilterStyle_, a7, a8);
  if (result)
  {
    result->_curveWidth = a3;
    result->_padding = a4;
    result->_beginAngle = a5;
    result->_drawingBeginAngle = a5 + 1.57079633;
    result->_endAngle = a6;
    result->_drawingEndAngle = a6 + 1.57079633;
    result->_clockwise = 1;
  }
  return result;
}

- (void)setBeginAngle:(double)a3
{
  if (self->_beginAngle != a3)
  {
    self->_beginAngle = a3;
    self->_drawingBeginAngle = a3 + 1.57079633;
    -[CDRichComplicationShapeView _updateGradient](self, "_updateGradient");
    -[CDRichComplicationCurveView _updatePath](self, "_updatePath");
  }
}

- (void)setEndAngle:(double)a3
{
  if (self->_endAngle != a3)
  {
    self->_endAngle = a3;
    self->_drawingEndAngle = a3 + 1.57079633;
    -[CDRichComplicationShapeView _updateGradient](self, "_updateGradient");
    -[CDRichComplicationCurveView _updatePath](self, "_updatePath");
  }
}

- (void)setClockwise:(BOOL)a3
{
  if (self->_clockwise != a3)
  {
    self->_clockwise = a3;
    -[CDRichComplicationShapeView _updateGradient](self, "_updateGradient");
    -[CDRichComplicationCurveView _updatePath](self, "_updatePath");
  }
}

- (void)layoutSubviews
{
  double curveWidth;
  void *v4;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  void *v10;
  objc_super v11;
  CGRect PathBoundingBox;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)CDRichComplicationCurveView;
  -[CDRichComplicationShapeView layoutSubviews](&v11, sel_layoutSubviews);
  curveWidth = self->_curveWidth;
  -[CDRichComplicationShapeView shapeLayer](self, "shapeLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PathBoundingBox = CGPathGetPathBoundingBox((CGPathRef)objc_msgSend(v4, "path"));
  v13 = CGRectInset(PathBoundingBox, curveWidth * -0.5, curveWidth * -0.5);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;

  if (width < height)
    width = height;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CDRichComplicationShapeView gradientLayer](self, "gradientLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, y, width, width);

  -[CDRichComplicationShapeView gradientLayer](self, "gradientLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationCurveView _setupGradientLayer:](self, "_setupGradientLayer:", v10);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)_setupGradientLayer:(id)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  v4 = MEMORY[0x2199AA040](-[CDRichComplicationCurveView bounds](self, "bounds"));
  v6 = v5;
  -[CDRichComplicationShapeView gradientLayer](self, "gradientLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  -[CDRichComplicationShapeView gradientLayer](self, "gradientLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;

  v17 = (v4 - v9) / v14;
  objc_msgSend(v18, "setType:", *MEMORY[0x24BDE5C50]);
  objc_msgSend(v18, "setStartPoint:", v17, (v6 - v11) / v16);
  objc_msgSend(v18, "setEndPoint:", v17, 100.0);

}

- (double)_shapeLineWidth
{
  return self->_curveWidth;
}

- (double)_angleAtProgress:(float)a3
{
  return self->_drawingBeginAngle + (self->_drawingEndAngle - self->_drawingBeginAngle) * a3;
}

- (double)_totalDrawableAngle
{
  return self->_drawingEndAngle - self->_drawingBeginAngle;
}

- (double)_outerRadius
{
  CGRect v4;

  -[CDRichComplicationCurveView bounds](self, "bounds");
  return CGRectGetWidth(v4) * 0.5 - self->_padding;
}

- (CGPoint)_centerPoint
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v6;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[CDRichComplicationCurveView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v6 = CGRectGetWidth(v10) * 0.5;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v7 = CGRectGetHeight(v11) * 0.5;
  v8 = v6;
  result.y = v7;
  result.x = v8;
  return result;
}

- (CGPoint)_pointAtProgress:(float)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  __float2 v20;
  double v21;
  double v22;
  CGPoint result;
  CGRect v24;

  -[CDRichComplicationCurveView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CDRichComplicationCurveView _centerPoint](self, "_centerPoint");
  v14 = v13;
  v16 = v15;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v17 = CGRectGetWidth(v24) * 0.5 - self->_curveWidth * 0.5;
  v18 = v17 - self->_padding;
  *(float *)&v17 = a3;
  -[CDRichComplicationCurveView _angleAtProgress:](self, "_angleAtProgress:", v17);
  *(float *)&v19 = v19;
  v20 = __sincosf_stret(*(float *)&v19);
  v21 = v16 + v20.__sinval * v18;
  v22 = v14 + v20.__cosval * v18;
  result.y = v21;
  result.x = v22;
  return result;
}

- (id)_normalizeGradientLocations:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_drawingBeginAngle + -1.57079633;
  v7 = self->_drawingEndAngle + -1.57079633;
  if (v6 >= 0.0)
    v8 = self->_drawingBeginAngle + -1.57079633;
  else
    v8 = v6 + 6.28318531;
  if (v7 >= 0.0)
    v9 = self->_drawingEndAngle + -1.57079633;
  else
    v9 = v7 + 6.28318531;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = v8 / 6.28318531;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "doubleValue", (_QWORD)v19);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13 + (v9 / 6.28318531 - v13) * v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v17);

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v5;
}

- (CGPath)_generatePath
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGPath *v16;
  CGRect v18;

  -[CDRichComplicationCurveView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CDRichComplicationCurveView _centerPoint](self, "_centerPoint");
  v12 = v11;
  v14 = v13;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", self->_clockwise, v12, v14, CGRectGetWidth(v18) * 0.5 - self->_curveWidth * 0.5 - self->_padding, self->_drawingBeginAngle, self->_drawingEndAngle);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (CGPath *)objc_msgSend(v15, "CGPath");

  return v16;
}

- (void)_updatePath
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRichComplicationCurveView;
  -[CDRichComplicationShapeView _updatePath](&v3, sel__updatePath);
  -[CDRichComplicationCurveView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_shouldReverseGradient
{
  return !self->_clockwise;
}

- (double)beginAngle
{
  return self->_beginAngle;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

@end
