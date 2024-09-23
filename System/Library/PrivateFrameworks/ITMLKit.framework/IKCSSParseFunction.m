@implementation IKCSSParseFunction

- (IKCSSParseFunction)init
{
  IKCSSParseFunction *v2;
  IKCSSParseFunction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseFunction;
  v2 = -[IKCSSParseObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IKCSSParseObject setType:](v2, "setType:", 7);
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
  void *v9;
  NSRange v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.location = -[IKCSSParseObject range](self, "range");
  NSStringFromRange(v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseFunction name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseObject cssValue](self, "cssValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toNSArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"IKCSSParseFunction(%@)\": {\"name\":\"%@\", \"value\":%@}"), v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
