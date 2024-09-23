@implementation AVZoomRange

+ (AVZoomRange)zoomRangeWithMinZoomFactor:(double)a3 maxZoomFactor:(double)a4
{
  return (AVZoomRange *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMinZoomFactor:maxZoomFactor:", a3, a4);
}

- (AVZoomRange)initWithMinZoomFactor:(double)a3 maxZoomFactor:(double)a4
{
  AVZoomRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVZoomRange;
  result = -[AVZoomRange init](&v7, sel_init);
  if (result)
  {
    result->_minZoomFactor = a3;
    result->_maxZoomFactor = a4;
  }
  return result;
}

- (double)minZoomFactor
{
  return self->_minZoomFactor;
}

- (BOOL)containsZoomFactor:(double)a3
{
  return self->_minZoomFactor <= a3 && self->_maxZoomFactor >= a3;
}

- (double)maxZoomFactor
{
  return self->_maxZoomFactor;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %.2f - %.2f>"), NSStringFromClass(v4), self, *(_QWORD *)&self->_minZoomFactor, *(_QWORD *)&self->_maxZoomFactor);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  double minZoomFactor;
  double v7;
  double maxZoomFactor;
  double v9;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
    {
      minZoomFactor = self->_minZoomFactor;
      objc_msgSend(a3, "minZoomFactor");
      if (minZoomFactor == v7)
      {
        maxZoomFactor = self->_maxZoomFactor;
        objc_msgSend(a3, "maxZoomFactor");
        LOBYTE(v5) = maxZoomFactor == v9;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

@end
