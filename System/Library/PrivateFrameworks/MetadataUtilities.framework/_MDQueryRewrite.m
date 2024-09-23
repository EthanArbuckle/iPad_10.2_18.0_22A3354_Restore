@implementation _MDQueryRewrite

- (_MDQueryRewrite)initWithSearchQueryString:(id)a3 searchQueryContext:(id)a4 score:(float)a5
{
  id v8;

  if (self)
  {
    self->_queryString = (NSString *)objc_msgSend(a3, "copy");
    self->_searchQueryContext = a4;
    v8 = a4;
    self->_score = a5;
  }
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_MDQueryRewrite;
  -[_MDQueryRewrite dealloc](&v3, sel_dealloc);
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)searchQueryContext
{
  return self->_searchQueryContext;
}

- (void)setSearchQueryContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

@end
