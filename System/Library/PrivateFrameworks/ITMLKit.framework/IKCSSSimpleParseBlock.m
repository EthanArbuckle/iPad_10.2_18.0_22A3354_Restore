@implementation IKCSSSimpleParseBlock

- (IKCSSSimpleParseBlock)init
{
  IKCSSSimpleParseBlock *v2;
  IKCSSSimpleParseBlock *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSSimpleParseBlock;
  v2 = -[IKCSSParseBlock init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IKCSSParseObject setType:](v2, "setType:", 6);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSRange v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.location = -[IKCSSParseBlock range](self, "range");
  NSStringFromRange(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseObject cssValue](self, "cssValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toNSArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"IKCSSSimpleParseBlock(%@)\": {\"value\":%@}"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)associatedToken
{
  return self->_associatedToken;
}

- (void)setAssociatedToken:(int64_t)a3
{
  self->_associatedToken = a3;
}

@end
