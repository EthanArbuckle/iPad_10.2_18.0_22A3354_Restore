@implementation CMIStatisticsResult

- (CMIStatisticsResult)initWithMin:(float)a3 max:(float)a4 sum:(float)a5 sumOfSquares:(float)a6 area:(float)a7
{
  CMIStatisticsResult *v12;
  CMIStatisticsResult *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMIStatisticsResult;
  v12 = -[CMIStatisticsResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_min = a3;
    v12->_max = a4;
    v12->_sum = a5;
    v12->_sumOfSquares = a6;
    v12->_area = a7;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v13;
}

- (float)mean
{
  return self->_sum / self->_area;
}

- (float)variance
{
  float v3;

  -[CMIStatisticsResult mean](self, "mean");
  return (float)(self->_sumOfSquares / self->_area) - (float)(v3 * v3);
}

- (float)min
{
  return self->_min;
}

- (float)max
{
  return self->_max;
}

- (float)sum
{
  return self->_sum;
}

@end
