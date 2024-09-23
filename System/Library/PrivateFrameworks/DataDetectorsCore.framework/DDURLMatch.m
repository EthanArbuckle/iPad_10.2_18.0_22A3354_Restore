@implementation DDURLMatch

- (DDURLMatch)initWithRange:(_NSRange)a3 url:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  DDURLMatch *v7;
  DDURLMatch *v8;
  objc_super v10;

  length = a3.length;
  location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)DDURLMatch;
  v7 = -[DDURLMatch init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_range.location = location;
    v7->_range.length = length;
    v7->_url = (NSString *)objc_msgSend(a4, "copyWithZone:", 0);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DDURLMatch;
  -[DDURLMatch dealloc](&v3, sel_dealloc);
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

- (id)url
{
  return self->_url;
}

- (int64_t)compare:(id)a3
{
  unint64_t v4;
  NSUInteger v5;
  NSUInteger location;
  BOOL v7;

  v4 = objc_msgSend(a3, "range");
  location = self->_range.location;
  v7 = location > v4;
  if (location == v4)
    v7 = self->_range.length > v5;
  if (v7)
    return 1;
  else
    return -1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<DDURLMatch>: url <%@>, range %@"), self->_url, NSStringFromRange(self->_range));
}

@end
