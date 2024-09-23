@implementation _HKHorizontalSingleLineSeriesCoordinate

- (_HKHorizontalSingleLineSeriesCoordinate)initWithXValue:(double)a3 yValue:(int64_t)a4 groupToPrevious:(BOOL)a5 markStyle:(int64_t)a6 userInfo:(id)a7
{
  id v13;
  _HKHorizontalSingleLineSeriesCoordinate *v14;
  _HKHorizontalSingleLineSeriesCoordinate *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)_HKHorizontalSingleLineSeriesCoordinate;
  v14 = -[_HKHorizontalSingleLineSeriesCoordinate init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_xValue = a3;
    v14->_groupToPrevious = a5;
    v14->_yValue = a4;
    v14->_markStyle = a6;
    objc_storeStrong((id *)&v14->_userInfo, a7);
  }

  return v15;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;

  v4 = a4;
  -[_HKHorizontalSingleLineSeriesCoordinate xValue](self, "xValue");
  v8 = a3->tx + a3->c * 0.0 + a3->a * v7;
  if (v4)
    v8 = HKUIFloorCGPointToScreenScale(v8, a3->ty + a3->d * 0.0 + a3->b * v7);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithXValue:yValue:groupToPrevious:markStyle:userInfo:", self->_yValue, self->_groupToPrevious, self->_markStyle, self->_userInfo, v8);
}

- (double)startXValue
{
  return self->_xValue;
}

- (double)endXValue
{
  return self->_xValue;
}

- (double)xValue
{
  return self->_xValue;
}

- (int64_t)yValue
{
  return self->_yValue;
}

- (BOOL)groupToPrevious
{
  return self->_groupToPrevious;
}

- (int64_t)markStyle
{
  return self->_markStyle;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
