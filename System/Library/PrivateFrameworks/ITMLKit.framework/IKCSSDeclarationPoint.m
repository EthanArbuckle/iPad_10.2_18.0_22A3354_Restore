@implementation IKCSSDeclarationPoint

- (IKCSSDeclarationPoint)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  double v23;
  IKCSSDeclarationPoint *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cssValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (objc_msgSend(v8, "count"))
  {
    while (1)
    {
      objc_msgSend(v8, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "type") != 1)
        break;
      objc_msgSend(v10, "token");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "type");

      if (v12 != 1)
        break;
      ++v9;

      if (v9 >= objc_msgSend(v8, "count"))
        goto LABEL_7;
    }

  }
LABEL_7:
  if (v9 >= objc_msgSend(v8, "count"))
    goto LABEL_26;
  objc_msgSend(v8, "objectAtIndex:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "type") != 1)
  {
LABEL_21:

    goto LABEL_26;
  }
  objc_msgSend(v13, "token");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "type") != 11)
  {
    if (objc_msgSend(v14, "type") == 13)
    {
      v21 = 0;
    }
    else
    {
      if (objc_msgSend(v14, "type") != 12)
        goto LABEL_20;
      v21 = 2;
    }
    objc_msgSend(v14, "doubleValue");
    v16 = v23;

LABEL_24:
    v27.receiver = self;
    v27.super_class = (Class)IKCSSDeclarationPoint;
    v24 = -[IKCSSDeclarationPoint init](&v27, sel_init);
    self = v24;
    if (v24)
    {
      -[IKCSSDeclarationPoint setValue:](v24, "setValue:", v16);
      -[IKCSSDeclarationPoint setUnit:](self, "setUnit:", v21);
      objc_msgSend(v7, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSDeclaration setName:](self, "setName:", v25);

      -[IKCSSDeclaration setType:](self, "setType:", objc_msgSend(v7, "type"));
      -[IKCSSDeclaration setImportant:](self, "setImportant:", objc_msgSend(v6, "important"));
    }
    goto LABEL_26;
  }
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(v14, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_20:

    goto LABEL_21;
  }
  v18 = v17;
  objc_msgSend(v17, "objectForKey:", CFSTR("unit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19
    || objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("pt"))
    && objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("px")))
  {
    v21 = 0;
    v22 = 0;
  }
  else
  {
    v21 = 1;
    v22 = 1;
  }

  if (v22)
    goto LABEL_24;
LABEL_26:

  return self;
}

- (id)number
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[IKCSSDeclarationPoint value](self, "value");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_setUnit:", -[IKCSSDeclarationPoint unit](self, "unit"));
  return v4;
}

- (id)stringValue
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  -[IKCSSDeclarationPoint number](self, "number");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ik_unit");
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "doubleValue");
  v6 = v5;
  objc_msgSend(v2, "ik_unitStringValue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3 == 2)
    v9 = CFSTR("%.0f%@");
  else
    v9 = CFSTR("%.3f%@");
  objc_msgSend(v4, "stringWithFormat:", v9, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  -[IKCSSDeclarationPoint number](self, "number");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[IKCSSDeclaration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSDeclaration typeString:](IKCSSDeclaration, "typeString:", -[IKCSSDeclaration type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v8 = v7;
  objc_msgSend(v3, "ik_unitStringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IKCSSDeclaration important](self, "important");
  v11 = CFSTR("false");
  if (v10)
    v11 = CFSTR("true");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("{name: \"%@\", type: \"%@\", value: \"%.3f\", unit: \"%@\", important: %@}"), v5, v6, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (unint64_t)unit
{
  return self->_unit;
}

- (void)setUnit:(unint64_t)a3
{
  self->_unit = a3;
}

@end
