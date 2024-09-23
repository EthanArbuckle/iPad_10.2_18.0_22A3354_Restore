@implementation EMTAlternativeSelectionSpan

- (EMTAlternativeSelectionSpan)initWithSource:(_NSRange)a3 projection:(_NSRange)a4 alternatives:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  id v11;
  EMTAlternativeSelectionSpan *v12;
  EMTAlternativeSelectionSpan *v13;
  objc_super v15;

  length = a4.length;
  location = a4.location;
  v8 = a3.length;
  v9 = a3.location;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EMTAlternativeSelectionSpan;
  v12 = -[EMTAlternativeSelectionSpan init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_source.location = v9;
    v12->_source.length = v8;
    v12->_projection.location = location;
    v12->_projection.length = length;
    objc_storeStrong((id *)&v12->_alternatives, a5);
  }

  return v13;
}

- (_NSRange)source
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_source.length;
  location = self->_source.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)projection
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_projection.length;
  location = self->_projection.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternatives, 0);
}

@end
