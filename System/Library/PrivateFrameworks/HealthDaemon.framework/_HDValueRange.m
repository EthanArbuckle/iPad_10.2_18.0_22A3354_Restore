@implementation _HDValueRange

- (_HDValueRange)initWithMinimum:(double)a3 maximum:(double)a4 isMinimumInclusive:(BOOL)a5 isMaximumInclusive:(BOOL)a6
{
  _HDValueRange *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_HDValueRange;
  result = -[_HDValueRange init](&v11, sel_init);
  if (result)
  {
    result->_minimum = a3;
    result->_maximum = a4;
    result->_isMinimumInclusive = a5;
    result->_isMaximumInclusive = a6;
  }
  return result;
}

- (BOOL)contains:(double)a3
{
  double minimum;
  double maximum;

  minimum = self->_minimum;
  if (self->_isMinimumInclusive)
  {
    if (minimum > a3)
      return 0;
  }
  else if (minimum >= a3)
  {
    return 0;
  }
  maximum = self->_maximum;
  if (self->_isMaximumInclusive)
    return maximum >= a3;
  else
    return maximum > a3;
}

- (BOOL)isEqual:(id)a3
{
  _HDValueRange *v4;
  _HDValueRange *v5;
  double minimum;
  double v7;
  double maximum;
  double v9;
  _BOOL4 isMinimumInclusive;
  _BOOL4 isMaximumInclusive;
  BOOL v12;

  v4 = (_HDValueRange *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (-[_HDValueRange isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    minimum = self->_minimum;
    -[_HDValueRange minimum](v5, "minimum");
    if (minimum == v7
      && (maximum = self->_maximum, -[_HDValueRange maximum](v5, "maximum"), maximum == v9)
      && (isMinimumInclusive = self->_isMinimumInclusive,
          isMinimumInclusive == -[_HDValueRange isMinimumInclusive](v5, "isMinimumInclusive")))
    {
      isMaximumInclusive = self->_isMaximumInclusive;
      v12 = isMaximumInclusive == -[_HDValueRange isMaximumInclusive](v5, "isMaximumInclusive");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)minimum
{
  return self->_minimum;
}

- (void)setMinimum:(double)a3
{
  self->_minimum = a3;
}

- (double)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(double)a3
{
  self->_maximum = a3;
}

- (BOOL)isMinimumInclusive
{
  return self->_isMinimumInclusive;
}

- (void)setIsMinimumInclusive:(BOOL)a3
{
  self->_isMinimumInclusive = a3;
}

- (BOOL)isMaximumInclusive
{
  return self->_isMaximumInclusive;
}

- (void)setIsMaximumInclusive:(BOOL)a3
{
  self->_isMaximumInclusive = a3;
}

@end
