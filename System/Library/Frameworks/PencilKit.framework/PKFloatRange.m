@implementation PKFloatRange

- (PKFloatRange)initWithLowerBound:(CGFloat)lowerBound upperBound:(CGFloat)upperBound
{
  PKFloatRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKFloatRange;
  result = -[PKFloatRange init](&v7, sel_init);
  result->_lowerBound = lowerBound;
  result->_upperBound = upperBound;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  if (v4
    && (v5 = objc_opt_class(), v5 == objc_opt_class())
    && (-[PKFloatRange lowerBound](self, "lowerBound"), v9 = v8, objc_msgSend(v4, "lowerBound"), v9 == v10))
  {
    -[PKFloatRange upperBound](self, "upperBound");
    v12 = v11;
    objc_msgSend(v4, "upperBound");
    v6 = v12 == v13;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = PKHashBytes((uint64_t)&self->_lowerBound, 8);
  return PKHashBytes((uint64_t)&self->_upperBound, 8) ^ v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFloatRange lowerBound](self, "lowerBound");
  v7 = v6;
  -[PKFloatRange upperBound](self, "upperBound");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %0.2f->%0.2f>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGFloat)lowerBound
{
  return self->_lowerBound;
}

- (CGFloat)upperBound
{
  return self->_upperBound;
}

@end
