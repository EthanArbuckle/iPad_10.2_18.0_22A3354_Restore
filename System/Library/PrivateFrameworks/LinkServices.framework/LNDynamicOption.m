@implementation LNDynamicOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LNDynamicOption value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("value"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNDynamicOption indentationLevel](self, "indentationLevel"), CFSTR("indentationLevel"));
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (LNStaticDeferredLocalizedString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[LNDynamicOption value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNStaticDeferredLocalizedString *)v4;
}

- (LNImage)image
{
  void *v2;
  void *v3;
  void *v4;

  -[LNDynamicOption value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNImage *)v4;
}

- (LNStaticDeferredLocalizedString)subtitle
{
  void *v2;
  void *v3;
  void *v4;

  -[LNDynamicOption value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNStaticDeferredLocalizedString *)v4;
}

- (LNValue)value
{
  return self->_value;
}

- (LNDynamicOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  LNDynamicOption *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("indentationLevel"));

  v7 = -[LNDynamicOption initWithValue:indentationLevel:](self, "initWithValue:indentationLevel:", v5, v6);
  return v7;
}

- (LNDynamicOption)initWithValue:(id)a3 indentationLevel:(int64_t)a4
{
  id v8;
  LNDynamicOption *v9;
  LNDynamicOption *v10;
  LNDynamicOption *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDynamicOptionsResult.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

  }
  v14.receiver = self;
  v14.super_class = (Class)LNDynamicOption;
  v9 = -[LNDynamicOption init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    v10->_indentationLevel = a4;
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicOption title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p titleKey=%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LNDynamicOption *v4;
  LNDynamicOption *v5;
  LNDynamicOption *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  int64_t v24;

  v4 = (LNDynamicOption *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_29:

      goto LABEL_30;
    }
    -[LNDynamicOption value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDynamicOption value](v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_27;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    -[LNDynamicOption title](self, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDynamicOption title](v6, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_26;
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_27;
    }
    -[LNDynamicOption subtitle](self, "subtitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDynamicOption subtitle](v6, "subtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {

    }
    else
    {
      if (!v20 || !v23)
      {

        LOBYTE(v12) = 0;
        goto LABEL_26;
      }
      v12 = objc_msgSend(v20, "isEqual:", v23);

      if (!v12)
        goto LABEL_26;
    }
    v24 = -[LNDynamicOption indentationLevel](self, "indentationLevel");
    LOBYTE(v12) = v24 == -[LNDynamicOption indentationLevel](v6, "indentationLevel");
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  LOBYTE(v12) = 1;
LABEL_30:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[LNDynamicOption value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNDynamicOption title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNDynamicOption subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

@end
