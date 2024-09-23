@implementation LARatchetStateValue

- (id)initInternal
{
  return -[LARatchetStateValue initWithDuration:](self, "initWithDuration:", -1.0);
}

- (LARatchetStateValue)initWithDuration:(double)a3
{
  LARatchetStateValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LARatchetStateValue;
  result = -[LARatchetStateValue init](&v5, sel_init);
  if (result)
    result->_duration = a3;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "duration");
    v6 = v5;
    -[LARatchetStateValue duration](self, "duration");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
