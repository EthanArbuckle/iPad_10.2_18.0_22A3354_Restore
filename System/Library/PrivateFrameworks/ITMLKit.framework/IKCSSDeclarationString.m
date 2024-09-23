@implementation IKCSSDeclarationString

- (IKCSSDeclarationString)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  IKCSSDeclarationString *v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)IKCSSDeclarationString;
  v8 = -[IKCSSDeclarationString init](&v32, sel_init);
  if (!v8)
    goto LABEL_27;
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
    if (objc_msgSend(v14, "type") != 1)
    {
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v14, "token");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "type") == 3 || objc_msgSend(v15, "type") == 18)
    {
      objc_msgSend(v15, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSDeclarationString setValue:](v8, "setValue:", v16);
    }
    else
    {
      if (objc_msgSend(v15, "type") == 11)
      {
        objc_msgSend(v15, "properties");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("value"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "properties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("unit"));
        v31 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "properties");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", CFSTR("typeFlag"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v20, "isEqualToString:", CFSTR("integer"));

        v21 = (void *)MEMORY[0x1E0CB3940];
        if ((_DWORD)v17)
        {
          v22 = (void *)v31;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld%@"), objc_msgSend(v16, "integerValue"), v31);
        }
        else
        {
          objc_msgSend(v16, "doubleValue");
          v22 = (void *)v31;
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%.3f%@"), v26, v31);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKCSSDeclarationString setValue:](v8, "setValue:", v27);

      }
      else
      {
        if (objc_msgSend(v15, "type") != 12)
        {
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(v15, "properties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", CFSTR("value"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "doubleValue");
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%.3f%%"), v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKCSSDeclarationString setValue:](v8, "setValue:", v22);
      }

    }
    goto LABEL_22;
  }
LABEL_24:
  -[IKCSSDeclarationString value](v8, "value");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    -[IKCSSDeclarationString setValue:](v8, "setValue:", &stru_1E9F50578);
  objc_msgSend(v7, "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSDeclaration setName:](v8, "setName:", v29);

  -[IKCSSDeclaration setType:](v8, "setType:", objc_msgSend(v7, "type"));
  -[IKCSSDeclaration setImportant:](v8, "setImportant:", objc_msgSend(v6, "important"));

LABEL_27:
  return v8;
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;

  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  self->_value = v4;

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
  -[IKCSSDeclarationString value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKCSSDeclaration important](self, "important");
  v8 = CFSTR("false");
  if (v7)
    v8 = CFSTR("true");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
