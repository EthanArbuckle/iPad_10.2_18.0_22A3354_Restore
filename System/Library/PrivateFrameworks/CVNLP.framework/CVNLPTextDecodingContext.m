@implementation CVNLPTextDecodingContext

- (CVNLPTextDecodingContext)initWithHistory:(id)a3 activeRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  CVNLPTextDecodingContext *v9;
  CVNLPTextDecodingContext *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CVNLPTextDecodingContext;
  v9 = -[CVNLPTextDecodingContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_history, a3);
    v10->_activeRange.location = location;
    v10->_activeRange.length = length;
  }

  return v10;
}

- (CVNLPTextDecodingContext)initWithHistory:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  CVNLPTextDecodingContext *active;

  v4 = a3;
  v8 = objc_msgSend_length(v4, v5, v6, v7);
  active = (CVNLPTextDecodingContext *)objc_msgSend_initWithHistory_activeRange_(self, v9, (uint64_t)v4, v8 - 1, 0);

  return active;
}

- (id)activeSubstring
{
  NSUInteger length;

  length = self->_activeRange.length;
  if (!length)
    return &stru_1E60CE768;
  objc_msgSend_substringWithRange_(self->_history, a2, self->_activeRange.location, length);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)inactiveSubstring
{
  const char *v3;
  NSString *v4;
  uint64_t v5;

  v4 = self->_history;
  if (self->_activeRange.length)
  {
    objc_msgSend_substringWithRange_(self->_history, v3, 0, self->_activeRange.location);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (NSString *)v5;
  }
  return v4;
}

- (NSString)history
{
  return self->_history;
}

- (_NSRange)activeRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_activeRange.length;
  location = self->_activeRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
}

@end
