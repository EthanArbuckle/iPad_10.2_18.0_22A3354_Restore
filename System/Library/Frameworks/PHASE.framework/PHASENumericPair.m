@implementation PHASENumericPair

- (PHASENumericPair)init
{
  PHASENumericPair *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASENumericPair;
  result = -[PHASENumericPair init](&v3, sel_init);
  if (result)
  {
    result->_first = 0.0;
    result->_second = 0.0;
  }
  return result;
}

- (PHASENumericPair)initWithFirstValue:(double)first secondValue:(double)second
{
  PHASENumericPair *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHASENumericPair;
  result = -[PHASENumericPair init](&v7, sel_init);
  if (result)
  {
    result->_first = first;
    result->_second = second;
  }
  return result;
}

- (double)first
{
  return self->_first;
}

- (void)setFirst:(double)first
{
  self->_first = first;
}

- (double)second
{
  return self->_second;
}

- (void)setSecond:(double)second
{
  self->_second = second;
}

@end
