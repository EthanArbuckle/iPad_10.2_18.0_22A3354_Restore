@implementation EMTSpan

- (EMTSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4 doNotTranslate:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  EMTSpan *v11;
  EMTSpan *v12;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EMTSpan;
  v11 = -[EMTSpan init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_range.location = location;
    v12->_range.length = length;
    v12->_doNotTranslate = a5;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
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

- (BOOL)doNotTranslate
{
  return self->_doNotTranslate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
