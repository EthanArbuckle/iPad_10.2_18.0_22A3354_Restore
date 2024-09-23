@implementation _CLKTimeFormatterSubstringRange

+ (_CLKTimeFormatterSubstringRange)rangeWithRange:(_NSRange)a3
{
  return (_CLKTimeFormatterSubstringRange *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);
}

- (_CLKTimeFormatterSubstringRange)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _CLKTimeFormatterSubstringRange *result;
  objc_super v6;

  length = a3.length;
  location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)_CLKTimeFormatterSubstringRange;
  result = -[_CLKTimeFormatterSubstringRange init](&v6, sel_init);
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
  }
  return result;
}

- (id)substringFromString:(id)a3
{
  id v4;
  void *v5;
  NSUInteger location;
  unint64_t v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL || (v7 = self->_range.length + location, v7 > objc_msgSend(v4, "length")))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "substringWithRange:", self->_range.location, self->_range.length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
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

@end
