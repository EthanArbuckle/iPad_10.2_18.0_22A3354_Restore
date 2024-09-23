@implementation CalculateScanResult

- (CalculateScanResult)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CalculateScanResult *result;
  objc_super v6;

  length = a3.length;
  location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)CalculateScanResult;
  result = -[CalculateScanResult init](&v6, sel_init);
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
  }
  return result;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

+ (id)resultWithRange:(_NSRange)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", a3.location, a3.length);
}

@end
