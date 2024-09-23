@implementation IKCSSDeclarationInteger

- (IKCSSDeclarationInteger)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  IKCSSDeclarationInteger *v8;
  IKCSSDeclarationDouble *v9;
  IKCSSDeclarationDouble *v10;
  double v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IKCSSDeclarationInteger;
  v8 = -[IKCSSDeclarationInteger init](&v14, sel_init);
  if (v8)
  {
    v9 = -[IKCSSDeclarationDouble initWithParseDeclaration:info:]([IKCSSDeclarationDouble alloc], "initWithParseDeclaration:info:", v6, v7);
    v10 = v9;
    if (v9)
    {
      -[IKCSSDeclarationDouble value](v9, "value");
      -[IKCSSDeclarationInteger setValue:](v8, "setValue:", (int)v11);
    }
    objc_msgSend(v7, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSDeclaration setName:](v8, "setName:", v12);

    -[IKCSSDeclaration setType:](v8, "setType:", objc_msgSend(v7, "type"));
    -[IKCSSDeclaration setImportant:](v8, "setImportant:", objc_msgSend(v6, "important"));

  }
  return v8;
}

- (id)stringValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), -[IKCSSDeclarationInteger value](self, "value"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSDeclaration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSDeclaration typeString:](IKCSSDeclaration, "typeString:", -[IKCSSDeclaration type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSDeclarationInteger stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKCSSDeclaration important](self, "important");
  v8 = CFSTR("false");
  if (v7)
    v8 = CFSTR("true");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

@end
