@implementation AVFloat64Range

- (AVFloat64Range)initWithMinimum:(double)a3 maximum:(double)a4
{
  AVFloat64Range *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVFloat64Range;
  result = -[AVFloat64Range init](&v7, sel_init);
  if (result)
  {
    result->_minimum = a3;
    result->_maximum = a4;
  }
  return result;
}

+ (id)float64RangeWithMinimum:(double)a3 maximum:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMinimum:maximum:", a3, a4);
}

+ (id)float64RangeWithAudioValueRange:(AudioValueRange)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAudioValueRange:", a3.mMinimum, a3.mMaximum);
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a3, "minimum");
  v6 = v5;
  -[AVFloat64Range minimum](self, "minimum");
  if (v6 != v7)
    return 0;
  objc_msgSend(a3, "maximum");
  v9 = v8;
  -[AVFloat64Range maximum](self, "maximum");
  return v9 == v10;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;

  -[AVFloat64Range minimum](self, "minimum");
  v4 = (unint64_t)v3;
  -[AVFloat64Range maximum](self, "maximum");
  return (unint64_t)v5 ^ v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[AVFloat64Range minimum](self, "minimum");
  v7 = v6;
  -[AVFloat64Range maximum](self, "maximum");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, minimum = %f, maximum = %f>"), v5, self, v7, v8);
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

@end
