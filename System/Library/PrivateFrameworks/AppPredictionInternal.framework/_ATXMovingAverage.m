@implementation _ATXMovingAverage

- (_ATXMovingAverage)initWithAlpha:(double)a3
{
  _ATXMovingAverage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ATXMovingAverage;
  result = -[_ATXMovingAverage init](&v5, sel_init);
  if (result)
  {
    result->_alpha = a3;
    result->_count = 0;
  }
  return result;
}

- (double)movingAverage
{
  return self->_movingAverage;
}

- (double)movingError
{
  return self->_movingError;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_movingAverage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_movingError);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(avg = %@, error = %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_ATXMovingAverage)initWithCoder:(id)a3
{
  id v4;
  _ATXMovingAverage *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ATXMovingAverage;
  v5 = -[_ATXMovingAverage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("avgError"));
    v5->_movingError = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("avgDuration"));
    v5->_movingAverage = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("alpha"));
    v5->_alpha = v8;
    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double movingAverage;
  id v5;

  movingAverage = self->_movingAverage;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("avgDuration"), movingAverage);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("avgError"), self->_movingError);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("alpha"), self->_alpha);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_count, CFSTR("count"));

}

- (void)addElement:(double)a3
{
  int64_t count;
  double alpha;
  double v5;
  double v6;

  count = self->_count;
  if (count)
  {
    alpha = self->_alpha;
    v5 = (1.0 - alpha) * self->_movingAverage + alpha * a3;
    self->_movingAverage = v5;
    v6 = vabdd_f64(a3, v5);
    if (count != 1)
      v6 = (1.0 - alpha) * self->_movingError + alpha * v6;
    self->_movingError = v6;
  }
  else
  {
    self->_movingAverage = a3;
    self->_movingError = 0.0;
  }
  self->_count = count + 1;
}

@end
