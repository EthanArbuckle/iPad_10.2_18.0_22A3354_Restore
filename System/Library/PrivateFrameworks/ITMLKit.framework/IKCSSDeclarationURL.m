@implementation IKCSSDeclarationURL

- (IKCSSDeclarationURL)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  IKCSSDeclarationURL *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IKCSSDeclarationURL;
  v8 = -[IKCSSDeclarationURL init](&v21, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "cssValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (objc_msgSend(v9, "count"))
    {
      while (1)
      {
        objc_msgSend(v9, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "type") != 1)
          break;
        objc_msgSend(v11, "token");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "type");

        if (v13 != 1)
          break;
        ++v10;

        if (v10 >= objc_msgSend(v9, "count"))
          goto LABEL_8;
      }

    }
LABEL_8:
    if (v10 < objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "type") == 1)
      {
        objc_msgSend(v14, "token");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "type") == 19)
        {
          v16 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v15, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "URLWithString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[IKCSSDeclarationURL setValue:](v8, "setValue:", v18);

        }
      }

    }
    objc_msgSend(v7, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSDeclaration setName:](v8, "setName:", v19);

    -[IKCSSDeclaration setType:](v8, "setType:", objc_msgSend(v7, "type"));
    -[IKCSSDeclaration setImportant:](v8, "setImportant:", objc_msgSend(v6, "important"));

  }
  return v8;
}

- (id)stringValue
{
  void *v2;
  void *v3;

  -[IKCSSDeclarationURL value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  -[IKCSSDeclarationURL value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKCSSDeclaration important](self, "important");
  v8 = CFSTR("false");
  if (v7)
    v8 = CFSTR("true");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSURL)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
