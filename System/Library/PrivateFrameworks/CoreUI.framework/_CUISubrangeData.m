@implementation _CUISubrangeData

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUISubrangeData;
  -[_CUISubrangeData dealloc](&v3, sel_dealloc);
}

- (_CUISubrangeData)initWithData:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _CUISubrangeData *v7;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)_CUISubrangeData;
  v7 = -[_CUISubrangeData init](&v9, sel_init);
  if (v7)
  {
    v7->_data = (NSData *)a3;
    v7->_range.location = location;
    v7->_range.length = length;
  }
  return v7;
}

- (const)bytes
{
  return (char *)-[NSData bytes](self->_data, "bytes") + self->_range.location;
}

- (unint64_t)length
{
  return self->_range.length;
}

@end
