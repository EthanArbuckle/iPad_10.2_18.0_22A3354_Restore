@implementation HKPointLabelEngine

- (HKPointLabelEngine)initWithBoundingRegion:(CGRect)a3 isLabelShiftingEnabled:(BOOL)a4 labelSizeBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  HKPointLabelEngine *v12;
  HKPointLabelEngine *v13;
  void *v14;
  id sizeForValue;
  CGSize v16;
  CGPoint v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKPointLabelEngine;
  v12 = -[HKPointLabelEngine init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_boundingRegion.origin.x = x;
    v12->_boundingRegion.origin.y = y;
    v12->_boundingRegion.size.width = width;
    v12->_boundingRegion.size.height = height;
    v12->_isLabelShiftingEnabled = a4;
    v14 = _Block_copy(v11);
    sizeForValue = v13->_sizeForValue;
    v13->_sizeForValue = v14;

    v13->_currentUntransformedPoint.y = 0.0;
    *(_OWORD *)&v13->_currentTransformedPoint.y = 0u;
    *(_OWORD *)&v13->_previousUntransformedPoint.y = 0u;
    *(_OWORD *)&v13->_previousTransformedPoint.y = 0u;
    *(_OWORD *)&v13->_state = 0u;
    v17 = (CGPoint)*MEMORY[0x1E0C9D648];
    v16 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v13->_previousRenderingData.transformedRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v13->_previousRenderingData.transformedRect.size = v16;
    *(_OWORD *)&v13->_previousRenderingData.labelValue = 0uLL;
    v13->_currentRenderingData.transformedRect.origin = v17;
    v13->_currentRenderingData.transformedRect.size = v16;
    *(_OWORD *)&v13->_currentRenderingData.labelValue = 0uLL;
    v13->_lastRenderOverlapped = 0;
  }

  return v13;
}

- (BOOL)processTransformedPoint:(CGPoint)a3 untransformedPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  int64_t state;
  char v10;
  CGFloat *p_y;
  int64_t v12;
  CGPoint *p_currentTransformedPoint;
  int64_t v14;
  int64_t v15;
  CGSize size;
  BOOL v17;
  CGSize v18;
  CGPoint v20;
  CGSize v21;
  __int128 v22;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  state = self->_state;
  if (state == 2)
  {
    p_currentTransformedPoint = &self->_currentTransformedPoint;
    v14 = -[HKPointLabelEngine _slopeForPoint:otherPoint:](self, "_slopeForPoint:otherPoint:", self->_currentTransformedPoint.x, self->_currentTransformedPoint.y, self->_previousTransformedPoint.x, self->_previousTransformedPoint.y);
    v15 = -[HKPointLabelEngine _slopeForPoint:otherPoint:](self, "_slopeForPoint:otherPoint:", p_currentTransformedPoint->x, self->_currentTransformedPoint.y, v7, v6);
    if (!self->_lastRenderOverlapped)
    {
      size = self->_currentRenderingData.transformedRect.size;
      self->_previousRenderingData.transformedRect.origin = self->_currentRenderingData.transformedRect.origin;
      self->_previousRenderingData.transformedRect.size = size;
      *(_OWORD *)&self->_previousRenderingData.labelValue = *(_OWORD *)&self->_currentRenderingData.labelValue;
    }
    p_y = &self->_currentUntransformedPoint.y;
    -[HKPointLabelEngine _computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:](self, "_computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:", v14, v15, self->_previousRenderingData.options, self->_currentUntransformedPoint.y, self->_currentTransformedPoint.x, self->_currentTransformedPoint.y);
    self->_currentRenderingData.transformedRect.origin = v20;
    self->_currentRenderingData.transformedRect.size = v21;
    *(_OWORD *)&self->_currentRenderingData.labelValue = v22;
    v17 = CGRectIntersectsRect(self->_currentRenderingData.transformedRect, self->_previousRenderingData.transformedRect);
    self->_lastRenderOverlapped = v17;
    v10 = !v17;
    self->_previousTransformedPoint = *p_currentTransformedPoint;
    self->_previousUntransformedPoint = self->_currentUntransformedPoint;
    self->_currentTransformedPoint.x = v7;
    self->_currentTransformedPoint.y = v6;
    self->_currentUntransformedPoint.x = x;
    goto LABEL_9;
  }
  if (state == 1)
  {
    v10 = 1;
    -[HKPointLabelEngine _computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:](self, "_computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:", 1, -[HKPointLabelEngine _slopeForPoint:otherPoint:](self, "_slopeForPoint:otherPoint:", self->_previousTransformedPoint.x, self->_previousTransformedPoint.y, a3.x, a3.y), 1, self->_previousUntransformedPoint.y, self->_previousTransformedPoint.x, self->_previousTransformedPoint.y);
    self->_currentRenderingData.transformedRect.size = v21;
    *(_OWORD *)&self->_currentRenderingData.labelValue = v22;
    v18 = self->_currentRenderingData.transformedRect.size;
    *(_OWORD *)&self->_previousRenderingData.labelValue = *(_OWORD *)&self->_currentRenderingData.labelValue;
    self->_currentRenderingData.transformedRect.origin = v20;
    self->_previousRenderingData.transformedRect.origin = self->_currentRenderingData.transformedRect.origin;
    self->_previousRenderingData.transformedRect.size = v18;
    self->_currentTransformedPoint.x = v7;
    self->_currentTransformedPoint.y = v6;
    self->_currentUntransformedPoint.x = x;
    p_y = &self->_currentUntransformedPoint.y;
LABEL_9:
    v12 = 2;
    goto LABEL_10;
  }
  v10 = 0;
  if (!state)
  {
    self->_previousTransformedPoint = a3;
    p_y = &self->_previousUntransformedPoint.y;
    v12 = 1;
    self->_previousUntransformedPoint.x = a4.x;
LABEL_10:
    *p_y = y;
    self->_state = v12;
  }
  return v10;
}

- (BOOL)processLastPoint
{
  int64_t state;
  BOOL v4;
  int64_t v5;
  CGSize size;
  BOOL v7;
  CGPoint v9;
  CGSize v10;
  __int128 v11;

  state = self->_state;
  if (state == 2)
  {
    v5 = -[HKPointLabelEngine _slopeForPoint:otherPoint:](self, "_slopeForPoint:otherPoint:", self->_currentTransformedPoint.x, self->_currentTransformedPoint.y, self->_previousTransformedPoint.x, self->_previousTransformedPoint.y);
    if (!self->_lastRenderOverlapped)
    {
      size = self->_currentRenderingData.transformedRect.size;
      self->_previousRenderingData.transformedRect.origin = self->_currentRenderingData.transformedRect.origin;
      self->_previousRenderingData.transformedRect.size = size;
      *(_OWORD *)&self->_previousRenderingData.labelValue = *(_OWORD *)&self->_currentRenderingData.labelValue;
    }
    -[HKPointLabelEngine _computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:](self, "_computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:", v5, 1, self->_previousRenderingData.options, self->_currentUntransformedPoint.y, self->_currentTransformedPoint.x, self->_currentTransformedPoint.y);
    self->_currentRenderingData.transformedRect.origin = v9;
    self->_currentRenderingData.transformedRect.size = v10;
    *(_OWORD *)&self->_currentRenderingData.labelValue = v11;
    v7 = CGRectIntersectsRect(self->_currentRenderingData.transformedRect, self->_previousRenderingData.transformedRect);
    self->_lastRenderOverlapped = v7;
    return !v7;
  }
  else if (state == 1)
  {
    v4 = 1;
    -[HKPointLabelEngine _computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:](self, "_computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:", 1, 1, 1, self->_previousUntransformedPoint.y, self->_previousTransformedPoint.x, self->_previousTransformedPoint.y);
    self->_currentRenderingData.transformedRect.origin = v9;
    self->_currentRenderingData.transformedRect.size = v10;
    *(_OWORD *)&self->_currentRenderingData.labelValue = v11;
  }
  else
  {
    return 0;
  }
  return v4;
}

- ($0E6BBD292B1800C35F8F1E99FBACE02D)renderingData
{
  CGPoint origin;

  origin = self[4].var0.origin;
  retstr->var0.origin = *(CGPoint *)&self[3].var1;
  retstr->var0.size = (CGSize)origin;
  *(CGSize *)&retstr->var1 = self[4].var0.size;
  return self;
}

- (int64_t)_slopeForPoint:(CGPoint)a3 otherPoint:(CGPoint)a4
{
  double v4;
  double v5;
  double v6;
  double v8;
  int64_t v9;

  v4 = vabdd_f64(a3.x, a4.x);
  if (a3.x != 0.0 && a4.x != 0.0)
  {
    v5 = fabs(a3.x);
    v6 = fabs(a4.x);
    if (v5 >= v6)
      v5 = v6;
    if (v4 > v5 / 1.0e10)
      goto LABEL_10;
    return 2 * (a3.y > a4.y);
  }
  if (a3.x == 0.0 && a4.x == 0.0)
    return 2 * (a3.y > a4.y);
LABEL_10:
  v8 = (a3.y - a4.y) / v4;
  v9 = 2;
  if (v8 >= -0.05)
    v9 = 1;
  if (v8 <= 0.05)
    return v9;
  else
    return 0;
}

- ($0E6BBD292B1800C35F8F1E99FBACE02D)_computeRenderingDataForValue:(SEL)a3 transformedPoint:(double)a4 previousSlope:(CGPoint)a5 nextSlope:(int64_t)a6 previousOptions:(int64_t)a7
{
  double y;
  double x;
  CGSize v12;
  CGFloat v13;
  $0E6BBD292B1800C35F8F1E99FBACE02D *result;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double MaxY;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  y = a5.y;
  x = a5.x;
  v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  retstr->var0.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  retstr->var0.size = v12;
  retstr->var2 = 0;
  if (a6 == 2)
  {
    if ((unint64_t)(a7 - 1) >= 2)
    {
      if (a7)
        goto LABEL_14;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (a6 == 1)
  {
    if (a7 == 1)
    {
LABEL_13:
      retstr->var2 = a8;
      goto LABEL_14;
    }
    if (a7 != 2)
      goto LABEL_14;
LABEL_10:
    a8 = 1;
    goto LABEL_13;
  }
  if (!a6 && a7 == 2)
  {
LABEL_12:
    a8 |= 2uLL;
    goto LABEL_13;
  }
LABEL_14:
  retstr->var1 = a4;
  retstr->var0.size.width = (*((double (**)(void))self->_sizeForValue + 2))();
  retstr->var0.size.height = v13;
  result = ($0E6BBD292B1800C35F8F1E99FBACE02D *)-[HKPointLabelEngine _layoutTransformRectVerticallyForData:withTransformedPoint:](self, "_layoutTransformRectVerticallyForData:withTransformedPoint:", retstr, x, y);
  if (self->_isLabelShiftingEnabled)
  {
    -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
    v45.origin.x = v15;
    v45.origin.y = v16;
    v45.size.width = v17;
    v45.size.height = v18;
    v40 = CGRectIntersection(retstr->var0, v45);
    result = ($0E6BBD292B1800C35F8F1E99FBACE02D *)CGRectIsNull(v40);
    if ((result & 1) == 0)
    {
      v19 = retstr->var0.origin.x;
      -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
      if (v19 < v20)
      {
        -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
        retstr->var0.origin.x = v21;
      }
      v22 = retstr->var0.origin.y;
      -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
      if (v22 >= v23)
      {
        v24 = retstr->var0.origin.y;
      }
      else
      {
        -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
        retstr->var0.origin.y = v24;
      }
      v25 = retstr->var0.origin.x;
      width = retstr->var0.size.width;
      height = retstr->var0.size.height;
      MaxX = CGRectGetMaxX(*(CGRect *)(&v24 - 1));
      -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
      v29 = CGRectGetMaxX(v41);
      v30 = retstr->var0.origin.x;
      if (MaxX > v29)
      {
        v31 = retstr->var0.origin.y;
        v32 = retstr->var0.size.width;
        v33 = retstr->var0.size.height;
        v34 = CGRectGetMaxX(*(CGRect *)&v30);
        -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
        v30 = retstr->var0.origin.x - (v34 - CGRectGetMaxX(v42));
        retstr->var0.origin.x = v30;
      }
      v35 = retstr->var0.origin.y;
      v36 = retstr->var0.size.width;
      v37 = retstr->var0.size.height;
      MaxY = CGRectGetMaxY(*(CGRect *)&v30);
      -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
      if (MaxY > CGRectGetMaxY(v43))
      {
        v39 = CGRectGetMaxY(retstr->var0);
        -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
        retstr->var0.origin.y = retstr->var0.origin.y - (v39 - CGRectGetMaxY(v44));
      }
    }
  }
  return result;
}

- (void)_layoutTransformRectVerticallyForData:(id *)a3 withTransformedPoint:(CGPoint)a4
{
  double y;
  double x;
  double MaxY;
  int64_t v9;
  double v10;
  double v11;
  CGRect v12;

  y = a4.y;
  x = a4.x;
  -[HKPointLabelEngine _transformRectIfNeededForData:withTransformedPoint:](self, "_transformRectIfNeededForData:withTransformedPoint:");
  if ((a3->var2 & 1) != 0)
  {
    v10 = a3->var0.origin.y;
    -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
    if (v10 >= v11)
      return;
    v9 = a3->var2 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    MaxY = CGRectGetMaxY(a3->var0);
    -[HKPointLabelEngine boundingRegion](self, "boundingRegion");
    if (MaxY <= CGRectGetMaxY(v12))
      return;
    v9 = a3->var2 | 1;
  }
  a3->var2 = v9;
  -[HKPointLabelEngine _transformRectIfNeededForData:withTransformedPoint:](self, "_transformRectIfNeededForData:withTransformedPoint:", a3, x, y);
}

- (void)_transformRectIfNeededForData:(id *)a3 withTransformedPoint:(CGPoint)a4
{
  int64_t var2;
  double v5;

  var2 = a3->var2;
  a3->var0.origin.x = a4.x + a3->var0.size.width * -0.5;
  if ((var2 & 1) != 0)
    v5 = a4.y - *(double *)&HKPointLabelEngineVerticalOffset - a3->var0.size.height;
  else
    v5 = a4.y + *(double *)&HKPointLabelEngineVerticalOffset;
  a3->var0.origin.y = v5;
}

- (CGRect)boundingRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingRegion.origin.x;
  y = self->_boundingRegion.origin.y;
  width = self->_boundingRegion.size.width;
  height = self->_boundingRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isLabelShiftingEnabled
{
  return self->_isLabelShiftingEnabled;
}

- (void)setIsLabelShiftingEnabled:(BOOL)a3
{
  self->_isLabelShiftingEnabled = a3;
}

- (id)sizeForValue
{
  return self->_sizeForValue;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CGPoint)previousTransformedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousTransformedPoint.x;
  y = self->_previousTransformedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousTransformedPoint:(CGPoint)a3
{
  self->_previousTransformedPoint = a3;
}

- (CGPoint)previousUntransformedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousUntransformedPoint.x;
  y = self->_previousUntransformedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousUntransformedPoint:(CGPoint)a3
{
  self->_previousUntransformedPoint = a3;
}

- (CGPoint)currentTransformedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentTransformedPoint.x;
  y = self->_currentTransformedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentTransformedPoint:(CGPoint)a3
{
  self->_currentTransformedPoint = a3;
}

- (CGPoint)currentUntransformedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentUntransformedPoint.x;
  y = self->_currentUntransformedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentUntransformedPoint:(CGPoint)a3
{
  self->_currentUntransformedPoint = a3;
}

- ($0E6BBD292B1800C35F8F1E99FBACE02D)previousRenderingData
{
  CGPoint origin;

  origin = self[3].var0.origin;
  retstr->var0.origin = *(CGPoint *)&self[2].var1;
  retstr->var0.size = (CGSize)origin;
  *(CGSize *)&retstr->var1 = self[3].var0.size;
  return self;
}

- (void)setPreviousRenderingData:(id *)a3
{
  CGPoint origin;
  __int128 v4;

  origin = a3->var0.origin;
  v4 = *(_OWORD *)&a3->var1;
  self->_previousRenderingData.transformedRect.size = a3->var0.size;
  *(_OWORD *)&self->_previousRenderingData.labelValue = v4;
  self->_previousRenderingData.transformedRect.origin = origin;
}

- ($0E6BBD292B1800C35F8F1E99FBACE02D)currentRenderingData
{
  CGPoint origin;

  origin = self[4].var0.origin;
  retstr->var0.origin = *(CGPoint *)&self[3].var1;
  retstr->var0.size = (CGSize)origin;
  *(CGSize *)&retstr->var1 = self[4].var0.size;
  return self;
}

- (void)setCurrentRenderingData:(id *)a3
{
  CGPoint origin;
  __int128 v4;

  origin = a3->var0.origin;
  v4 = *(_OWORD *)&a3->var1;
  self->_currentRenderingData.transformedRect.size = a3->var0.size;
  *(_OWORD *)&self->_currentRenderingData.labelValue = v4;
  self->_currentRenderingData.transformedRect.origin = origin;
}

- (BOOL)lastRenderOverlapped
{
  return self->_lastRenderOverlapped;
}

- (void)setLastRenderOverlapped:(BOOL)a3
{
  self->_lastRenderOverlapped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sizeForValue, 0);
}

@end
