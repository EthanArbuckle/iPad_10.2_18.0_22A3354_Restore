@implementation IKCSSAtMediaRule

- (IKCSSAtMediaRule)initWithMediaQuery:(id)a3
{
  id v5;
  IKCSSAtMediaRule *v6;
  IKCSSAtMediaRule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKCSSAtMediaRule;
  v6 = -[IKCSSAtMediaRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaQuery, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IKCSSAtMediaRule;
  v4 = -[IKCSSRule copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 3, self->_mediaQuery);
  v5 = -[IKCSSAtMediaRule queryRange](self, "queryRange");
  objc_msgSend(v4, "setQueryRange:", v5, v6);
  return v4;
}

- (id)mediaQuery
{
  return self->_mediaQuery;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSRange v14;

  -[IKCSSRule selectorList](self, "selectorList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IKCSSRule selectorList](self, "selectorList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("null");
  }
  -[IKCSSRule declarationList](self, "declarationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IKCSSRule declarationList](self, "declarationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("null");
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v14.location = -[IKCSSAtMediaRule queryRange](self, "queryRange");
  NSStringFromRange(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSAtMediaRule mediaQuery](self, "mediaQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("{mediaQuery: (%@) \"%@\", selectorList: %@, declarationList: %@}"), v10, v11, v5, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (_NSRange)queryRange
{
  _NSRange *p_queryRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_queryRange = &self->_queryRange;
  location = self->_queryRange.location;
  length = p_queryRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setQueryRange:(_NSRange)a3
{
  self->_queryRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaQuery, 0);
}

@end
