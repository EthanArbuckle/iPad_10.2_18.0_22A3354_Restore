@implementation SKReachConstraints

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKReachConstraints)initWithLowerAngleLimit:(CGFloat)lowerAngleLimit upperAngleLimit:(CGFloat)upperAngleLimit
{
  SKReachConstraints *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKReachConstraints;
  result = -[SKReachConstraints init](&v7, sel_init);
  if (result)
  {
    result->_lowerAngleLimit = lowerAngleLimit;
    result->_upperAngleLimit = upperAngleLimit;
  }
  return result;
}

- (SKReachConstraints)init
{
  return -[SKReachConstraints initWithLowerAngleLimit:upperAngleLimit:](self, "initWithLowerAngleLimit:upperAngleLimit:", 0.0, 6.28318531);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLowerAngleLimit:upperAngleLimit:", self->_lowerAngleLimit, self->_upperAngleLimit);
}

- (void)encodeWithCoder:(id)a3
{
  double lowerAngleLimit;
  id v5;

  lowerAngleLimit = self->_lowerAngleLimit;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_lowerAngleLimit"), lowerAngleLimit);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_upperAngleLimit"), self->_upperAngleLimit);

}

- (SKReachConstraints)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_lowerAngleLimit"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_upperAngleLimit"));
  v8 = v7;

  return -[SKReachConstraints initWithLowerAngleLimit:upperAngleLimit:](self, "initWithLowerAngleLimit:upperAngleLimit:", v6, v8);
}

- (CGFloat)lowerAngleLimit
{
  return self->_lowerAngleLimit;
}

- (void)setLowerAngleLimit:(CGFloat)lowerAngleLimit
{
  self->_lowerAngleLimit = lowerAngleLimit;
}

- (CGFloat)upperAngleLimit
{
  return self->_upperAngleLimit;
}

- (void)setUpperAngleLimit:(CGFloat)upperAngleLimit
{
  self->_upperAngleLimit = upperAngleLimit;
}

@end
