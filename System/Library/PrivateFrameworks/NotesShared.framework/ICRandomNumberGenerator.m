@implementation ICRandomNumberGenerator

- (ICRandomNumberGenerator)initWithSeed:(unsigned int)a3
{
  ICRandomNumberGenerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRandomNumberGenerator;
  result = -[ICRandomNumberGenerator init](&v5, sel_init);
  if (result)
    result->_randomSeed = a3;
  return result;
}

- (double)randomFloat
{
  unsigned int v2;

  v2 = 1664525 * self->_randomSeed + 1013904223;
  self->_randomSeed = v2;
  return (double)HIWORD(v2) * 0.0000152587891;
}

- (unint64_t)randomIndexMin:(unint64_t)a3 max:(unint64_t)a4
{
  double v6;
  double v7;

  v6 = (double)a3;
  -[ICRandomNumberGenerator randomFloat](self, "randomFloat");
  return (unint64_t)(v6 + v7 * (double)(a4 - a3 + 1));
}

- (id)randomObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", -[ICRandomNumberGenerator randomIndexMin:max:](self, "randomIndexMin:max:", 0, objc_msgSend(v4, "count") - 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
