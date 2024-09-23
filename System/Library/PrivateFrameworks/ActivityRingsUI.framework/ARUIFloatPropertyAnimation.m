@implementation ARUIFloatPropertyAnimation

+ (id)animationWithEndingFloatValue:(float)a3 duration:(double)a4 timingFunction:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  double v12;
  void *v13;

  v10 = a6;
  objc_msgSend(a1, "timingFunctionForMediaTimingFunction:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a3;
  objc_msgSend(a1, "animationWithEndingFloatValue:duration:customTimingFunction:completion:", v11, v10, v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)animationWithEndingFloatValue:(float)a3 duration:(double)a4 customTimingFunction:(id)a5 completion:(id)a6
{
  id result;

  result = +[ARUIAnimatableObjectPropertyAnimation animationWithDuration:timingFunction:completion:](ARUIFloatPropertyAnimation, "animationWithDuration:timingFunction:completion:", a5, a6, a4);
  *((float *)result + 11) = a3;
  return result;
}

- (void)_setStartValue:(id)a3
{
  float v4;

  objc_msgSend(a3, "floatValue");
  self->_startValue = v4;
}

- (void)_setEndValue:(id)a3
{
  float v4;

  objc_msgSend(a3, "floatValue");
  self->_endValue = v4;
}

- (void)_setCurrentValue:(id)a3
{
  float v4;

  objc_msgSend(a3, "floatValue");
  self->_currentValue = v4;
}

- (id)_startValue
{
  double v2;

  *(float *)&v2 = self->_startValue;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
}

- (id)_endValue
{
  double v2;

  *(float *)&v2 = self->_endValue;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
}

- (id)_currentValue
{
  double v2;

  *(float *)&v2 = self->_currentValue;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
}

- (void)_updateWithProgress:(float)a3
{
  self->_currentValue = self->_startValue + (float)((float)(self->_endValue - self->_startValue) * a3);
}

- (id)valueByAddingCurrentValueToValue:(id)a3
{
  float v4;
  double v5;

  objc_msgSend(a3, "floatValue");
  *(float *)&v5 = (float)(v4 + self->_currentValue) - self->_startValue;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
}

- (float)startValue
{
  return self->_startValue;
}

- (float)endValue
{
  return self->_endValue;
}

- (float)currentValue
{
  return self->_currentValue;
}

@end
