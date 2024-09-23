@implementation NSISVariableObservation

- (void)valueWasDirtied
{
  self->_valueIsDirtied = 1;
}

- (NSISVariableObservation)initWithVariable:(id)a3
{
  NSISVariableObservation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSISVariableObservation;
  v4 = -[NSISVariableObservation init](&v6, sel_init);
  if (v4)
  {
    v4->_variable = (NSISVariable *)a3;
    v4->_lastValue = NAN;
  }
  return v4;
}

- (void)emitValueIfNeededWithEngine:(id)a3
{
  double lastValue;
  double v6;
  BOOL v7;
  double v8;

  if (self->_valueIsDirtied)
  {
    v8 = 0.0;
    if (!objc_msgSend(a3, "hasValue:forVariable:", &v8, self->_variable))
    {
      self->_lastValue = NAN;
      v7 = 1;
LABEL_12:
      self->_valueIsDirtied = v7;
      return;
    }
    lastValue = self->_lastValue;
    if (lastValue == 0.0)
    {
      v6 = fabs(v8);
    }
    else
    {
      if (v8 != 0.0)
      {
        if (vabdd_f64(lastValue, v8) < fabs(lastValue) * *(double *)&NSISEpsilon)
          goto LABEL_9;
        goto LABEL_11;
      }
      v6 = fabs(lastValue);
    }
    if (v6 < *(double *)&NSISEpsilon)
    {
LABEL_9:
      v7 = 0;
      self->_lastValue = v8;
      goto LABEL_12;
    }
LABEL_11:
    self->_lastValue = v8;
    -[NSISVariableDelegate nsis_valueOfVariable:didChangeInEngine:](-[NSISVariable delegate](self->_variable, "delegate"), "nsis_valueOfVariable:didChangeInEngine:", self->_variable, a3);
    v7 = 0;
    goto LABEL_12;
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSISVariableObservation;
  -[NSISVariableObservation dealloc](&v3, sel_dealloc);
}

@end
