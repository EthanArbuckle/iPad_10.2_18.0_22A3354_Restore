@implementation BRLTTokenRange

- (BRLTTokenRange)initWithRange:(_NSRange)a3 token:(int64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  BRLTTokenRange *result;
  objc_super v8;

  length = a3.length;
  location = a3.location;
  v8.receiver = self;
  v8.super_class = (Class)BRLTTokenRange;
  result = -[BRLTTokenRange init](&v8, sel_init);
  result->_range.location = location;
  result->_range.length = length;
  result->_token = a4;
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

- (int64_t)token
{
  return self->_token;
}

- (void)setToken:(int64_t)a3
{
  self->_token = a3;
}

@end
