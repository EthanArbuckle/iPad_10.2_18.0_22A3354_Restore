@implementation ARUICGPointPropertyAnimation

+ (id)animationWithEndingCGPointValue:(CGPoint)a3 duration:(double)a4 timingFunction:(id)a5 completion:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  CGFloat *v13;

  y = a3.y;
  x = a3.x;
  v11 = a6;
  objc_msgSend(a1, "timingFunctionForMediaTimingFunction:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIAnimatableObjectPropertyAnimation animationWithDuration:timingFunction:completion:](ARUICGPointPropertyAnimation, "animationWithDuration:timingFunction:completion:", v12, v11, a4);
  v13 = (CGFloat *)objc_claimAutoreleasedReturnValue();

  v13[7] = x;
  v13[8] = y;
  return v13;
}

- (id)_startValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", self->_startValue.x, self->_startValue.y);
}

- (id)_endValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", self->_endValue.x, self->_endValue.y);
}

- (id)_currentValue
{
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", self->_currentValue.x, self->_currentValue.y);
}

- (void)_setStartValue:(id)a3
{
  CGPoint *p_startValue;
  CGFloat v4;
  CGFloat v5;

  p_startValue = &self->_startValue;
  objc_msgSend(a3, "CGPointValue");
  p_startValue->x = v4;
  p_startValue->y = v5;
}

- (void)_setEndValue:(id)a3
{
  CGPoint *p_endValue;
  CGFloat v4;
  CGFloat v5;

  p_endValue = &self->_endValue;
  objc_msgSend(a3, "CGPointValue");
  p_endValue->x = v4;
  p_endValue->y = v5;
}

- (void)_setCurrentValue:(id)a3
{
  CGPoint *p_currentValue;
  CGFloat v4;
  CGFloat v5;

  p_currentValue = &self->_currentValue;
  objc_msgSend(a3, "CGPointValue");
  p_currentValue->x = v4;
  p_currentValue->y = v5;
}

- (void)_updateWithProgress:(float)a3
{
  float32x2_t v3;

  v3 = vcvt_f32_f64((float64x2_t)self->_startValue);
  self->_currentValue = (CGPoint)vcvtq_f64_f32(vmla_n_f32(v3, vsub_f32(vcvt_f32_f64((float64x2_t)self->_endValue), v3), a3));
}

- (id)valueByAddingCurrentValueToValue:(id)a3
{
  double v4;
  double v5;

  objc_msgSend(a3, "CGPointValue");
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v4 + self->_currentValue.x - self->_startValue.x, v5 + self->_currentValue.y - self->_startValue.y);
}

- (CGPoint)startValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_startValue.x;
  y = self->_startValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_endValue.x;
  y = self->_endValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)currentValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentValue.x;
  y = self->_currentValue.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
