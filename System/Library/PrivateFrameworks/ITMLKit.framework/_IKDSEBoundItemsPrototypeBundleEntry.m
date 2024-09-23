@implementation _IKDSEBoundItemsPrototypeBundleEntry

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

- (unint64_t)prototypeIndex
{
  return self->_prototypeIndex;
}

- (void)setPrototypeIndex:(unint64_t)a3
{
  self->_prototypeIndex = a3;
}

@end
