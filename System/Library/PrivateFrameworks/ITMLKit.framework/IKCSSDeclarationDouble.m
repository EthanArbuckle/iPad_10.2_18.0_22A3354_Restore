@implementation IKCSSDeclarationDouble

- (IKCSSDeclarationDouble)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  IKCSSDeclarationDouble *v8;
  IKCSSDeclarationDouble *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IKCSSDeclarationDouble;
  v8 = -[IKCSSDeclarationDouble init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_value = 0.0;
    objc_msgSend(v6, "cssValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (objc_msgSend(v10, "count"))
    {
      while (1)
      {
        objc_msgSend(v10, "objectAtIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "type") != 1)
          break;
        objc_msgSend(v12, "token");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "type");

        if (v14 != 1)
          break;
        ++v11;

        if (v11 >= objc_msgSend(v10, "count"))
          goto LABEL_8;
      }

    }
LABEL_8:
    if (v11 < objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndex:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "type") == 1)
      {
        objc_msgSend(v15, "token");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "type") == 13 || objc_msgSend(v16, "type") == 11)
        {
          objc_msgSend(v16, "doubleValue");
          -[IKCSSDeclarationDouble setValue:](v9, "setValue:");
        }

      }
    }
    objc_msgSend(v7, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSDeclaration setName:](v9, "setName:", v17);

    -[IKCSSDeclaration setType:](v9, "setType:", objc_msgSend(v7, "type"));
    -[IKCSSDeclaration setImportant:](v9, "setImportant:", objc_msgSend(v6, "important"));

  }
  return v9;
}

- (id)stringValue
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSDeclarationDouble value](self, "value");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%f"), v3);
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
  -[IKCSSDeclarationDouble stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKCSSDeclaration important](self, "important");
  v8 = CFSTR("false");
  if (v7)
    v8 = CFSTR("true");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

@end
