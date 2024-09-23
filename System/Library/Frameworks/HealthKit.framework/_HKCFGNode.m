@implementation _HKCFGNode

- (_HKCFGNode)initWithRangeOfString:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _HKCFGNode *result;
  objc_super v6;

  length = a3.length;
  location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)_HKCFGNode;
  result = -[_HKCFGNode init](&v6, sel_init);
  if (result)
  {
    result->_rangeOfString.location = location;
    result->_rangeOfString.length = length;
  }
  return result;
}

- (_NSRange)rangeOfString
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeOfString.length;
  location = self->_rangeOfString.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeOfString:(_NSRange)a3
{
  self->_rangeOfString = a3;
}

- (id)evaluate
{
  id result;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3();
  return result;
}

@end
