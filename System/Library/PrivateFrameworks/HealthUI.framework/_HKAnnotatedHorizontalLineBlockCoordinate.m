@implementation _HKAnnotatedHorizontalLineBlockCoordinate

- (_HKAnnotatedHorizontalLineBlockCoordinate)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 styleIdentifier:(int64_t)a5 userInfo:(id)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  id v13;
  _HKAnnotatedHorizontalLineBlockCoordinate *v14;
  _HKAnnotatedHorizontalLineBlockCoordinate *v15;
  objc_super v17;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_HKAnnotatedHorizontalLineBlockCoordinate;
  v14 = -[_HKAnnotatedHorizontalLineBlockCoordinate init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_startPoint.x = v11;
    v14->_startPoint.y = v10;
    v14->_endPoint.x = x;
    v14->_endPoint.y = y;
    v14->_styleIdentifier = a5;
    objc_storeStrong((id *)&v14->_userInfo, a6);
  }

  return v15;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  float64x2_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _HKAnnotatedHorizontalLineBlockCoordinate *v16;
  int64_t v17;
  void *v18;
  _HKAnnotatedHorizontalLineBlockCoordinate *v19;
  double v21;
  float64x2_t v22;

  v4 = a4;
  -[_HKAnnotatedHorizontalLineBlockCoordinate startPoint](self, "startPoint");
  v22 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v7), *(float64x2_t *)&a3->a, v8));
  -[_HKAnnotatedHorizontalLineBlockCoordinate endPoint](self, "endPoint");
  v11 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v9), *(float64x2_t *)&a3->a, v10));
  v12 = v11.f64[1];
  v13 = v22.f64[1];
  v21 = v11.f64[0];
  if (v4)
  {
    v22.f64[0] = HKUIFloorCGPointToScreenScale(v22.f64[0], v22.f64[1]);
    v13 = v14;
    v21 = HKUIFloorCGPointToScreenScale(v21, v12);
    v12 = v15;
  }
  v16 = [_HKAnnotatedHorizontalLineBlockCoordinate alloc];
  v17 = -[_HKAnnotatedHorizontalLineBlockCoordinate styleIdentifier](self, "styleIdentifier");
  -[_HKAnnotatedHorizontalLineBlockCoordinate userInfo](self, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_HKAnnotatedHorizontalLineBlockCoordinate initWithStartPoint:endPoint:styleIdentifier:userInfo:](v16, "initWithStartPoint:endPoint:styleIdentifier:userInfo:", v17, v18, v22.f64[0], v13, v21, v12);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_HKAnnotatedHorizontalLineBlockCoordinate startPoint](self, "startPoint");
    v7 = llround(v6 / 0.0000000115);
    objc_msgSend(v5, "startPoint");
    if (v7 == llround(v8 / 0.0000000115)
      && (-[_HKAnnotatedHorizontalLineBlockCoordinate endPoint](self, "endPoint"),
          v10 = llround(v9 / 0.0000000115),
          objc_msgSend(v5, "endPoint"),
          v10 == llround(v11 / 0.0000000115))
      && (-[_HKAnnotatedHorizontalLineBlockCoordinate startPoint](self, "startPoint"),
          v13 = llround(v12 / 0.0000000115),
          objc_msgSend(v5, "startPoint"),
          v13 == llround(v14 / 0.0000000115)))
    {
      -[_HKAnnotatedHorizontalLineBlockCoordinate endPoint](self, "endPoint");
      v16 = llround(v15 / 0.0000000115);
      objc_msgSend(v5, "endPoint");
      v18 = v16 == llround(v17 / 0.0000000115);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  double v9;

  -[_HKAnnotatedHorizontalLineBlockCoordinate startPoint](self, "startPoint");
  v4 = llround(v3 / 0.0000000115);
  -[_HKAnnotatedHorizontalLineBlockCoordinate endPoint](self, "endPoint");
  v6 = llround(v5 / 0.0000000115) ^ v4;
  -[_HKAnnotatedHorizontalLineBlockCoordinate startPoint](self, "startPoint");
  v8 = llround(v7 / 0.0000000115);
  -[_HKAnnotatedHorizontalLineBlockCoordinate endPoint](self, "endPoint");
  return v6 ^ v8 ^ llround(v9 / 0.0000000115);
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)styleIdentifier
{
  return self->_styleIdentifier;
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
