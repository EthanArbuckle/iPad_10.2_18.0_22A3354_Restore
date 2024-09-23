@implementation NLDataInstanceLocator

- (NLDataInstanceLocator)initWithInstanceIndex:(unint64_t)a3 rangeOfCharacters:(_NSRange)a4 rangeOfTokens:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  NLDataInstanceLocator *result;
  objc_super v11;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)NLDataInstanceLocator;
  result = -[NLDataInstanceLocator init](&v11, sel_init);
  if (result)
  {
    result->_instanceIndex = a3;
    result->_rangeOfCharacters.location = v8;
    result->_rangeOfCharacters.length = v7;
    result->_rangeOfTokens.location = location;
    result->_rangeOfTokens.length = length;
  }
  return result;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSRange v9;
  NSRange v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NLDataInstanceLocator instanceIndex](self, "instanceIndex");
  v9.location = -[NLDataInstanceLocator rangeOfCharacters](self, "rangeOfCharacters");
  NSStringFromRange(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.location = -[NLDataInstanceLocator rangeOfTokens](self, "rangeOfTokens");
  NSStringFromRange(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%llu[%@/%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)instanceIndex
{
  return self->_instanceIndex;
}

- (_NSRange)rangeOfCharacters
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeOfCharacters.length;
  location = self->_rangeOfCharacters.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)rangeOfTokens
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeOfTokens.length;
  location = self->_rangeOfTokens.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
