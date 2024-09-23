@implementation IKCSSQualifiedParseRule

- (IKCSSQualifiedParseRule)init
{
  IKCSSQualifiedParseRule *v2;
  IKCSSQualifiedParseRule *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSQualifiedParseRule;
  v2 = -[IKCSSParseRule init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IKCSSParseObject setType:](v2, "setType:", 4);
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
  v11.location = -[IKCSSParseRule range](self, "range");
  NSStringFromRange(v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseRule prelude](self, "prelude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toNSArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseRule block](self, "block");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"IKCSSQualifiedParseRule(%@)\": {\"prelude\":%@, \"block\":{%@}}"), v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
