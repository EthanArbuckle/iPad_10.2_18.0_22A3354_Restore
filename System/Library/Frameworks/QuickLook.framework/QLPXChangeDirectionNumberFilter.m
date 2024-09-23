@implementation QLPXChangeDirectionNumberFilter

- (QLPXChangeDirectionNumberFilter)initWithInput:(double)a3
{
  QLPXChangeDirectionNumberFilter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLPXChangeDirectionNumberFilter;
  result = -[QLPXNumberFilter initWithInput:](&v5, sel_initWithInput_);
  if (result)
    result->_threshold = a3;
  return result;
}

- (double)initialOutputForInput:(double)a3
{
  return 0.0;
}

- (double)updatedOutput
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double threshold;
  double v9;
  double v10;
  double v11;

  -[QLPXNumberFilter input](self, "input");
  v4 = v3;
  -[QLPXNumberFilter output](self, "output");
  v6 = v5;
  -[QLPXChangeDirectionNumberFilter minimumChange](self, "minimumChange");
  if (v6 == 0.0 && (threshold = self->_threshold, vabdd_f64(v4, threshold) > v7))
  {
    v6 = 1.0;
  }
  else
  {
    if (v6 >= 0.0)
    {
      if (v6 <= 0.0)
        return v6;
    }
    else
    {
      threshold = self->_threshold;
      if (v4 > threshold)
      {
        v6 = 1.0;
LABEL_12:
        v10 = v4 - v7;
        if (threshold >= v10)
          v10 = threshold;
        self->_threshold = v10;
        return v6;
      }
      if (v6 <= 0.0)
      {
        v9 = v6;
        goto LABEL_16;
      }
    }
    threshold = self->_threshold;
  }
  v9 = -1.0;
  if (v4 >= threshold)
    goto LABEL_12;
LABEL_16:
  v11 = v4 + v7;
  if (threshold < v11)
    v11 = threshold;
  self->_threshold = v11;
  return v9;
}

- (double)minimumChange
{
  return self->_minimumChange;
}

- (void)setMinimumChange:(double)a3
{
  self->_minimumChange = a3;
}

@end
