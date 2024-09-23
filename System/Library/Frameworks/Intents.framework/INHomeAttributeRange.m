@implementation INHomeAttributeRange

- (INHomeAttributeRange)initWithRange:(double)a3 upperValue:(double)a4
{
  INHomeAttributeRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INHomeAttributeRange;
  result = -[INHomeAttributeRange init](&v7, sel_init);
  if (result)
  {
    result->_lowerValue = a3;
    result->_upperValue = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)self->_upperValue ^ (unint64_t)self->_lowerValue;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_lowerValue == v4[1] && self->_upperValue == v4[2];

  return v5;
}

- (INHomeAttributeRange)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lowerValue"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("upperValue"));
  v8 = v7;

  return -[INHomeAttributeRange initWithRange:upperValue:](self, "initWithRange:upperValue:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  double lowerValue;
  id v5;

  lowerValue = self->_lowerValue;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lowerValue"), lowerValue);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("upperValue"), self->_upperValue);

}

- (double)lowerValue
{
  return self->_lowerValue;
}

- (double)upperValue
{
  return self->_upperValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
