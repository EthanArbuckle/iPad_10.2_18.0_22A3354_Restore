@implementation IKCSSParseToken

- (IKCSSParseToken)init
{
  IKCSSParseToken *v2;
  IKCSSParseToken *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseToken;
  v2 = -[IKCSSParseObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IKCSSParseObject setType:](v2, "setType:", 1);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSRange v10;

  -[IKCSSParseToken token](self, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IKCSSParseToken token](self, "token");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("nil");
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v10.location = -[IKCSSParseObject range](self, "range");
  NSStringFromRange(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@) %@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (IKCSSToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
