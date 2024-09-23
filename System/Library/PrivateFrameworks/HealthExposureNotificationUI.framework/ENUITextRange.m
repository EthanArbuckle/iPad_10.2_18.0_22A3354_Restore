@implementation ENUITextRange

+ (id)rangeWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  ENUITextRange *v5;

  length = a3.length;
  location = a3.location;
  v5 = objc_alloc_init(ENUITextRange);
  -[ENUITextRange setRange:](v5, "setRange:", location, length);
  return v5;
}

- (id)start
{
  return +[ENUITextPosition positionWithLocation:](ENUITextPosition, "positionWithLocation:", self->_range.location);
}

- (id)end
{
  return +[ENUITextPosition positionWithLocation:](ENUITextPosition, "positionWithLocation:", self->_range.length + self->_range.location);
}

- (BOOL)isEmpty
{
  return self->_range.length == 0;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

@end
